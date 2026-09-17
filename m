Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85A837B018;
	Thu, 17 Sep 2026 10:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639777; cv=none; b=MsVRgMRtVhh5Z/tspH61zFNTsbFoFDXeGbEmxH1vDnJUYXLlC0+eGXHbynwkJAbINlNFmol4JTu81I9n6bqD5RzJ3+BUmEinaB+YOV7HVw8jP5Hzfi58/0wG4wLDrf447+Ku2pSo4tmqQl726l13dZWyvB3GABBdCgGElt9m4Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639777; c=relaxed/simple;
	bh=+vM4iam60z6KEMZ9Fm7CWrPAoXIWYPpYAI+Auic9Xdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8P0Qvv3B2D1sF4Yqaf0rndTQR67HtYFZXL6DvYvrps2QcS6bThHXORwAYJt4/OzRbGNtNbdTM+Ej7m9ikoUEm+Vn/W2EzenkLGzhR+BG+mWDPNw74nG3oqjQ4PX5nvrPR3+ZZ2+pNawnWW0BZfXHvTLGbIySDNigeYz0M8Il6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HvhOvwMl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HvhOvwMl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407DD1F000FF;
	Thu, 17 Sep 2026 10:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789639772;
	bh=odyX8Gm1Y2ZTjmiQ0iSsIgjm/HtHjgSv+tCSjKDPb5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HvhOvwMlYlnZ+cN0MAQXkcjZrD+linEkZtim1BW+RbYdDK02HVd99vKbs/TbCTZgg
	 aOUGF0UQYBeLkG6BKTzfTdO7VJ+QI/8U5hfqnZ4AImilGLnfIFKIE3PyXhP/WZoz+p
	 u+C1uFhlnsynh2gcUET2p7QvGWQUSwy81Kc7urw99Jfq3lkKNHkXqPv9HMtI0I3xh0
	 w0aeQUahI7tRqEJia+CCVBzc1jXz8IpagdpKCUHLz/laNMQv8nwhkVSEm5+Xe1UgDu
	 ECklgS+47cWHi98UUh0W9oD791fXHyh0FwruElwA/9A20mj238SYKg4srYReaDNNtN
	 OWdCW5Bwv35vQ==
Date: Thu, 17 Sep 2026 11:09:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Seiji Adachi <seiji_adachi@yahoo.co.jp>
Cc: Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] ASoC: amd: yc: Add Lenovo ThinkPad E16 Gen 2
 (21JN) to quirks
Message-ID: <599be753-cccd-4c71-b3a7-d35ebcd349d0@sirena.org.uk>
References: <almeAbvirJwQ5doF.ref@adriana>
 <almeAbvirJwQ5doF@adriana>
 <alnKI3bPaZUc6uwB@adriana>
 <aoukqUoiIzcctf-k@adriana>
 <aqu4HOCmdCUs_unm@adriana>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xKi8rWeAm6eeTz1x"
Content-Disposition: inline
In-Reply-To: <aqu4HOCmdCUs_unm@adriana>
X-Cookie: Whip it, whip it good!


--xKi8rWeAm6eeTz1x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 06:51:24PM +0900, Seiji Adachi wrote:
> Hi,
>=20
> I am resending this request along with the code change (diff) required fo=
r=20
> Lenovo ThinkPad E16 Gen 2 (21JN).
>=20
> Could you please review and consider applying the following patch to=20
> sound/soc/amd/yc/acp6x-mach.c?

Please submit patches following the process documented in
submitting-patches.rst, the formatting of the email is quite important
for tools to be able to process the patch.

You might want to look at b4 to send the patches, especially it's web
submission endpoint which avoids having to configure mail:

   https://b4.docs.kernel.org/en/latest/contributor/overview.html


--xKi8rWeAm6eeTz1x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqrvFQACgkQJNaLcl1U
h9AT3AgAgfqXJPuXiOz2Gzgi7mI9LjPvYOH+q8BtOYx+pzeFb2HdFLteMiNNKhXl
+DHzV4Cpatw6vB4iyoVx02Fz/Te4uLkNR00H9wyomVYXWO5GJmnXoH8CVgKTxKG7
/EJbtaX55bD30SHDUVBeYh755iGhFQP29HIyMt8DNhCP8/VrFQyQKAEvvyigNOTg
LwJSbnj6nUDu2WCTsoVDIw6fgB7OzF8XBLWZ9/ZKT0DU/ZjtA3MnjYX4l1lFvOnh
7PLBj2/7Iqxv801cjyvhVDyHBQM+J2ep7CkcwfVw0tI3iXR//AwifKe0BBomNUh6
UTaREDyrgkbO9T3DloS1pcXDF4z+Ow==
=jZM1
-----END PGP SIGNATURE-----

--xKi8rWeAm6eeTz1x--
