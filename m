Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D064534AD;
	Tue, 22 Sep 2026 09:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071186; cv=none; b=qzAfauzM0F1cTQlF2ieUOxob7Lliz10o58JX2NrU5z+aus4F9KnCdRRAPJ6v92aXVe19hMfvTFVefXok2w9kAcGTLpW80VvmF1bYjj8CgDDxb0SmXYAfNt3+vH8bQWVLwzqosWa5wBErUWcykYwXHu9YDEEOP1WNhuZnBOmH1WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071186; c=relaxed/simple;
	bh=tGtC+asBDKGqBP7blfxsY+G6AahWsiRqXlyZyeT7cQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ULrxn+6MLW+euz5q8EgIwC/PU0sHP/4+S2ePi4mleq5bW9FfJgVvtrGoXYelpoGtNLAKfDVEKOkGbfLxK6okbIzR90jdThzbjIYqVGmNkk36iLslyoVAfq9dC/tZJKQwx8/fjzhtAkAVT8Mj559A1sPJp1C1plTnA3oOGCu0OdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExbmooO8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExbmooO8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625191F000FF;
	Tue, 22 Sep 2026 09:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790071184;
	bh=zsNF2SceFCuuBal0LfyUaDqSllIUoeBL+4wzX9j+/XI=;
	h=Date:From:To:Cc:Subject;
	b=ExbmooO8hzRPU0Jgj7ApSqckGVveoWNZLpHecNZ2NwqirOAJbLXXqDdt3Gw2MifeF
	 imhMHyIaSsA6O9ykVmQ8TlBR89ECtLf6TZNtCQNt1QKrnCBtnfaGRsCzKIBzMal2My
	 Q0snRC+gADConUlbazJvhZfICB/scssXs/bIV3JERn8WQj5HnxycWeHwPEx0BzSZAz
	 zX9iYFRfYwSa0QDfConT9+FuN79FzeB8u6gUR1Xe+mDcaI7mhcm5Y9Ip0CmwloJRYS
	 lxNaDP74aDXNbCvl9LjibWqXGMBI43t/nG2q+CJo0iRwTfGsAwPRtJf4HkFowN6+aK
	 xsGsush7gMIUw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0CA3F1AC56BF; Tue, 22 Sep 2026 10:59:41 +0100 (BST)
Date: Tue, 22 Sep 2026 11:59:40 +0200
From: Mark Brown <broonie@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Christian Loehle <christian.loehle@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sumeet Pawnikar <sumeet4linux@gmail.com>
Subject: linux-next: manual merge of the cpufreq-arm tree with the pm tree
Message-ID: <arJRjM9WBBjuXdHG@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lk3NeTFj/WxrUn60"
Content-Disposition: inline


--Lk3NeTFj/WxrUn60
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cpufreq-arm tree got a conflict in:

  drivers/cpufreq/cppc_cpufreq.c

between commit:

  995e7d4680706 ("cpufreq: CPPC: Create the FIE worker before enabling PCC =
callbacks")

=66rom the pm tree and commit:

  d82d896f00e7b ("cpufreq: Use %pe to print error pointers symbolically")

=66rom the cpufreq-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/cpufreq/cppc_cpufreq.c
index 09e55bfdca885,f767898ebfb57..0000000000000
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@@ -240,19 -228,16 +240,19 @@@ static int cppc_fie_kworker_init(void
  	};
  	int ret;
 =20
 -	kworker_fie =3D kthread_run_worker(0, "cppc_fie");
 -	if (IS_ERR(kworker_fie)) {
 +	guard(mutex)(&cppc_fie_lock);
 +
 +	if (kworker_fie)
 +		return 0;
 +
 +	worker =3D kthread_run_worker(0, "cppc_fie");
 +	if (IS_ERR(worker)) {
- 		pr_warn("%s: failed to create kworker_fie: %ld\n", __func__,
- 			PTR_ERR(worker));
+ 		pr_warn("%s: failed to create kworker_fie: %pe\n", __func__,
 -			kworker_fie);
 -		fie_disabled =3D FIE_DISABLED;
 -		kworker_fie =3D NULL;
 -		return;
++			worker);
 +		return PTR_ERR(worker);
  	}
 =20
 -	ret =3D sched_setattr_nocheck(kworker_fie->task, &attr);
 +	ret =3D sched_setattr_nocheck(worker->task, &attr);
  	if (ret) {
  		pr_warn("%s: failed to set SCHED_DEADLINE: %d\n", __func__,
  			ret);

--Lk3NeTFj/WxrUn60
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqyUYwACgkQJNaLcl1U
h9AI+Af+ONtRU6OiMBckCSipT2+6GldTpaZnJyDHveVrZYDRoj+UWxujvj6q9sD+
pu65O91EcN0LfQh47xS+n0ItCwiefqnBl1uNl9emjTZcd4lAqnRR1YBPdERbGhcB
4UFmuPU+MB+yiiiOdcJDTYTC5NkYU8LkuP/nkQzsFLDyt5R9hWkcfVmYCFdZNu1s
l7vfKg321r5CnfpdkI2Q0oMQdZq0CbItW0tC9guHXkGRabR6XiKkEPRIHUrWP1Ps
Y/JAUZcIymaEEFKwsqpSNxdQqtgxok1N1s9nqaByrx3SiKKXyuwcuQL4uOvqdf0V
mLqrtGG3Hd3WDPh4FaP9fTmkXFnQzw==
=ULZp
-----END PGP SIGNATURE-----

--Lk3NeTFj/WxrUn60--
