Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6B337A832;
	Mon, 28 Sep 2026 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606235; cv=none; b=jgPS6b8pSaqEHzypbXv+/OU7fryKiehmy5AUwfZwabMomIrcoKVH+vjn6Dp53FmF2tU3Jo+HbGE408LA78BCmlLYNFuvkh6Dsrt+YYn6dCM4OtweOo/fRGhuQBTu22G5R88BkVL1xe1X5HZx8Oj5WH+M0gxzFCWXKHwTj23kq/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606235; c=relaxed/simple;
	bh=sGQzS3INIgeHWq0Y2GgqkXGkJrkSVlTi9gH0NcupwNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o/Z9WI/dvIv8b9hExVDZ4a2QQUf0Q1KV7L2LnF2gx8Jo0SIyPDuGii9K5GCbr3RuT99+aPox3eh/OR96cehuoVbeVcXQdBqLcJUECJxhoXYBaplC3f7Wq8Vs4Jxpa3sIAPA2bMyZnOEeFjEJ6R9CgsE1DhdBJGtEFav918h/E1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGSjnSTS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGSjnSTS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A091F000FF;
	Mon, 28 Sep 2026 14:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790606225;
	bh=rnECBw3XZFgmg4ZbVXxwy0fLdMCEFTRLQjnjEpaI8uc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iGSjnSTSHvnAYdlMksuO+gJLM7VKP89EDY42yZnBJ4vwHlbjJcn7wxsTWixZNff/h
	 rRYy7nhso0HpH6fX5bztr2wxuYwc8dhWsQaRCLk+cYqkil/+z8M/fnsPQQqOq+/RP/
	 xU4vPsRFxcXE/WV5+PTl1k9aNWHfI2C0SkXPuYuxKdsigTN7EaiSYCPmou4ZCXyifV
	 zb8nn/1IfMtqHzgJuGMLNkTOsKsFlzjmf9ARs4MNXO5B5yr9dsn64gQbIQCHzfFl2B
	 ZmwxK0tlUo+4L8LFv1wiCnlvmWutNl0NpFf/4SYbAsinMHhBSVgkNgF0vObR0WA4vU
	 9tcVAPvI1/ZRA==
Date: Mon, 28 Sep 2026 15:37:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the bluetooth tree
Message-ID: <96944c10-2a31-4e54-923f-97a608663221@sirena.org.uk>
References: <arOMTa0L7QhM5RyA@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GV8MxMWk5bw8lbLk"
Content-Disposition: inline
In-Reply-To: <arOMTa0L7QhM5RyA@sirena.co.uk>
X-Cookie: All is fear in love and war.


--GV8MxMWk5bw8lbLk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 10:22:37AM +0200, Mark Brown wrote:
> Commits
>=20
>   4712bd9a14cbd ("Bluetooth: btintel: validate DDC record lengths")
>   7348abd83a3b2 ("Bluetooth: hci_core: free the HCI ID if naming fails")
>   ea983244b99a3 ("Bluetooth: hci_core: Fix inquiry cache timestamps on 64=
-bit systems")
>   2b036342b623c ("Bluetooth: btintel_pcie: reject oversized TX packets in=
 send_frame()")
>   6d21e89e69775 ("Bluetooth: btintel_pcie: fix plen overflow in btintel_p=
cie_recv_frame()")
>   4145a13c1a044 ("Bluetooth: btintel: fix buffer over-read in btintel_hw_=
error()")
>=20
> are missing a Signed-off-by from their committers

This issue is still present today.

--GV8MxMWk5bw8lbLk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq6e4wACgkQJNaLcl1U
h9AZ0gf+O+0+vavU0UXlXy+6JSJROL6NyksAMXbW4F2MsfvgMmmgnaMtfSb38w9d
S9cFY17jfe90ztidmKyJji12cmqccmEVM2Mws8Ko/nlGsUCn3HvPKC8d0B+qE7bl
yHLqAZcqdiNaUw8glKjsLduh98nROp5fEE6sjCSMCirjQ5oZdDJpf43z8DPo8gY5
JegEWWlKGSchb8lByGLKOJwVXzKEJCX2ohFs6lxCTxsWjq6gB6y1pc+MpiVP7SqF
qnjLmoES/WKTSKayvgWRYaHc+RmdqIUXsga8kSVGYHtDkKG0bbt8f7lzhJrKKqvo
XW10Vpq3lc4CxVt0giHHua12RLoJ4w==
=utgh
-----END PGP SIGNATURE-----

--GV8MxMWk5bw8lbLk--
