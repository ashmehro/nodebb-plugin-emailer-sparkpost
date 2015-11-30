<div class="row">
	<div class="col-lg-9">
		<div class="panel panel-default">
			<div class="panel-heading">Emailer (SparkPost)</div>
			<div class="panel-body">
				<blockquote>
					<p>
						SparkPost provides all the deliverability, scalability and speed you expect from the world's leading email platform in an easily integrated, pay-as-you-go email delivery service.<br /><br />
					</p>
				</blockquote>
				<p>
					To get started:
				</p>
				<ol>
					<li>
						Register for an account on <a href="http://sparkpost.com">http://sparkpost.com</a>. Sparkpost offers a free tier with up to 10,000 free emails monthly. If you are hosting your app on heroku, SparkPost can be added as an add-on. The API Key is available with each account registered that has to be used while making calls to the SparkPost mailing service.
					</li>
					<li>
						Paste your API key into the field below, hit save, and restart your NodeBB
					</li>
				</ol>
				<form role="form" class="sparkpost-settings">
					<fieldset>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="apiKey">API Key</label>
									<input placeholder="Api Key here" type="text" class="form-control" id="apiKey" name="apiKey" />
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">Incoming Email Settings</div>
			<div class="panel-body">
				<p>
					This plugin can also be configured to receive emails if configured properly via SparkPost.
				</p>
				<p>
					Follow these instructions:
				</p>
				<ol>
					<li>
						<a href="http://help.mandrill.com/entries/21699367-Inbound-Email-Processing-Overview">Set up your incoming email domain</a>
					</li>
					<li>
						Specify your incoming email domain the field below
					</li>
					<li>
					    Establish the following routes (<a href="https://mandrillapp.com/inbound/routes">configurable in this page</a>):
					    <ul>
					    	<li><code>reply-*</code>, post to URL: <code>{url}/emailer-mandrill/reply</code></li>
					    </ul>
					</li>
				</ol>
				<form role="form" class="sparkpost-settings">
					<fieldset>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="receive_domain">Incoming Domain</label>
									<input placeholder="example.org" type="text" class="form-control" id="receive_domain" name="receive_domain" />
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<div class="col-lg-3">
		<div class="panel panel-default">
			<div class="panel-heading">Control Panel</div>
			<div class="panel-body">
				<button class="btn btn-primary" id="save">Save Settings</button>
			</div>
		</div>
	</div>
</div>

<script>
	require(['settings'], function(Settings) {
		Settings.load('sparkpost', $('.sparkpost-settings'));

		$('#save').on('click', function() {
			Settings.save('sparkpost', $('.sparkpost-settings'), function() {
				app.alert({
					type: 'success',
					alert_id: 'sparkpost-saved',
					title: 'Settings Saved',
					message: 'Please reload your NodeBB to apply these settings',
					clickfn: function() {
						socket.emit('admin.reload');
					}
				})
			});
		});
	});
</script>