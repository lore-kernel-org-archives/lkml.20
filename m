Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93B343B3DE;
	Wed,  2 Sep 2026 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344314; cv=none; b=pYnFjZOqTNx81uKGYiM/JLmF78Ig6GN+LWwoyAuL3ssIPIYRF1ynY5i68uJgt9dJL7sWdif6FY8bwVNqlmvthGYS+bCmIH9LpW4lmxeV29S4EV4/qU7U7MbHksCRxTpvnHl9Cc84WQv+58YBvhD3wO1IiZ9P22l44JsLXPUGPIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344314; c=relaxed/simple;
	bh=WOZRg2Cg0WlezN9AjUsz1GFc64KTDbwIT1/ZpCYX0oY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d4eGxvLwFbzhploSJVwBJ6mz4cSbHoyc1CJGF1aq9MVwfwuOHQLHdbkoqESyLnj/O1XGMG2AUBHm5A8YwKqm/4kzgkkH7oQv6dRMYW2m23pQkZsCjhIcuY5Q45QEmqJMNBc4PUjSpGn7VIzfIVAHmHrg5nyIiPoXAWTHFA+7GiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KiUzbXkf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KiUzbXkf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BBF1F000E9;
	Wed,  2 Sep 2026 10:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788344313;
	bh=gUgbFwxBNTNl9O3dOSX19I+s4vVIRwfrbvfL3q9eLeY=;
	h=Date:From:To:Cc:Subject;
	b=KiUzbXkfLDKBhOZXvacqIBjkSH4sVHT7qufFiInsTvnYERatbAQpukV4ZOmdAF+tl
	 q1nvI5SDK0cZU2/crWI/B+UKu/XDCFYblD6cBwNAktXYwm4///wOuurdbFBmA/gyZr
	 eMCVS7ukiTuqvJUUfR8D/9TrVTOwWL95jUCVTiRYdCpKTnanvYkJcBGckR/lr3eCc5
	 4v3oGLdlR+Vufo6uFnKlDYFqEPlWp0Qv9gNtvDkwXfovFw5tPFCtosCowR19V71aEH
	 G5SsQEMl276qFGkkQ+PHFWzZ+HZ298o1zI4KDR93dGLJXaJA4iLevb4URZyRwcLB8V
	 6pckVHRAt0AaQ==
Date: Wed, 2 Sep 2026 11:18:29 +0100
From: Mark Brown <broonie@kernel.org>
To: David Sterba <dsterba@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the btrfs tree
Message-ID: <apf39W87-CMCnD47@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ksmHMDDIafbod4p"
Content-Disposition: inline


--5ksmHMDDIafbod4p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  590b991274881 ("btrfs: scrub: report the failing sector's address, not the stripe base")

Fixes tag

  Fixes: 0096580713ff ("btrfs: scrub: introduce error reporting  functionality for scrub_stripe")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--5ksmHMDDIafbod4p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqX9/UACgkQJNaLcl1U
h9Dv3wf/SRazgavnyLCIFQPcoxZ+unk/YTtZIl4nRjouww/I5tZV9n3kuaOHqthc
Va57xhvz1GTZ1xnMNsfWR61MbU3N8PToZK5f2kxZkzI3K4SyRJoNRy+5gto4PL/N
nENpeltxKz1zKC5fC8CNyDhPxNxPML0dPMRbMDeBsLymjNJRO0tdx/NIgj9BTfjf
dQZ4zF4Oh+oP9P+Z9XtdTlVuysiDHtXw1o5Z5xPP9de3iK6nrmYAx+17kjEH7Fc6
hSqVbxBvNnxyNcG1QYzK/yFR4X4xJGpVsb8znHRs20m+uPNii2MJhhsZCR1kYYq5
zKLwJOMvCVEFOznL46R8sv8AhzhzAw==
=SqSS
-----END PGP SIGNATURE-----

--5ksmHMDDIafbod4p--
