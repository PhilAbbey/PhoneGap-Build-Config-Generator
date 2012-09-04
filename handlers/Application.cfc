component {

	this.name = "phonegapbuild_a17";
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,15,0);

	public boolean function onApplicationStart() {
		return true;
	}

	public boolean function onRequestStart(string req) {
		return true;
	}

}