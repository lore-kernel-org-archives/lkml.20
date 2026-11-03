Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696674;
	b=3Jb7Q9qDt1NTYHRdF5Yril5ERcQXENkcRLbLaVhEh5oorWKGHbOqkDNvCRJy++YAfxaY
	 Wo2TvrY9a7y1jUoCpAXI94R81u+/koBXp48BnYn9LPjb5IOaE6lG1wM6q7/oxF2TtHLfI
	 Z0H3macbvb/GDkwIJL6ua+fWhuyToC/2c/LkMLE5Is38BhMBFVtzRqLkGOIwxpOx6HqFq
	 hsHHBrMpuqYPJsiDv5bNZThzgp+foVsAVJHX2vmD1cLFYXJOYj7DFjVoYvcSvZsAmXlZv
	 f3NxcflAzvPm5OLs3sZ1XF+dhfLTJ/srWB6HuYTLoJbt0Bnrnwy/yucTNtYsc1OFv4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696674;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Uyv+Mc5d9d1gCJCyssw8BshM15Hv025jfZyc5jx49Bo=;
	b=3WHep3ukpuTfkGXc70aGFV3/5EbOHIR2ZEL6tbqE26WaYJeHzDR4wtQKGzVNURJy6IJr
	 vFzP42LgnH5nksdpqNq84H2Kwh0KUYCTUVG+gRoVp+lWY1B5F16nnjD+6szueoBE5i8rB
	 gbkJJn96UQ/htANU0iu4Jmp55XJ5SKqE6jgP+t1WvXf1qJM1KO0GRaoPLuBHnzZ88hoyH
	 /tOdU8d9vwC1Xn/xVxO5ZQ+lNKUH6OU3MxZ22xEG17S9hkrUwKn6hHpdbbiE6NOXTwuLL
	 bH5t5qyKcRxNL/S3s9kh7XWwpuB4NY/K3MsPpji/7OVxqifVmR/Ov+9eiNRXU2Ws3Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=dRgz4HUv;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A965F606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A965F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=dRgz4HUv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Uyv+
	Mc5d9d1gCJCyssw8BshM15Hv025jfZyc5jx49Bo=; b=dRgz4HUvWa1NktTmMP7G
	/lyCdZIMnsCBeSR9X7GPgUXYjS44XP1ojzhQbML2eqiAKTIJRvooKNiiKKFrQTxq
	XxrBMzJHHPTX9kcVsOvpf0ZR1QJwrONIdHGYDDSkMBeM/8jfn7zWxAl3oPZDenLW
	N3L3/zl8f+wGNpWx7rJclM7cBsSLBmriAGL5/XmT0NpNt1joO+bJ2C1lvUhJu6VO
	Qb4DIGZSRkMF+fy07btxTN5kl9I0hOh13FMCP7jsSBZkqqXX8vewmwP8+VkxRQ28
	yG2h/G6XQefREoLck4e/6dHNQRjEEADjI/l2W3QfBQREK2GDfgl40f3LAcw9I7Uq
	7w==
Received: (qmail 214200 invoked from network); 3 Nov 2026 10:04:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2026 10:04:22 +0100
X-UD-Smtp-Session: l3s3148p1@I1NYjFtfbsI+ZpL9
Date: Tue, 3 Nov 2026 11:04:21 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: peda@lysator.liu.se, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: Release pinctrl handles on
 deactivation
Message-ID: <aumjke-mSGP8WVl1@shikoro>
References: <20261103082905.1167633-1-vulab@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8CkNpLJWHo1/LwAO"
Content-Disposition: inline
In-Reply-To: <20261103082905.1167633-1-vulab@iscas.ac.cn>

--8CkNpLJWHo1/LwAO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 03, 2026 at 08:29:05AM +0000, Wentao Liang wrote:
> Each master activation calls devm_pinctrl_get() against the parent I2C
> controller device. Switching or removing the demux only releases the
> adapter reference, so the pinctrl reference and its devres entry persist
> until the parent controller is removed. Repeated switches accumulate
> these entries. Activation failures after obtaining the handle retain it
> too.
>=20
> Use pinctrl_get() and keep the handle with the active channel. Release
> it when activation fails or the channel is deactivated, before dropping
> the parent adapter reference and reverting the device-tree changeset.
> Keep the no-pinctrl case working by storing NULL when get returns
> -ENODEV.
>=20
> Fixes: 50a5ba876908 ("i2c: mux: demux-pinctrl: add driver")
> Cc: stable@vger.kernel.org
> Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

To get a better picture, how did you test this?


--8CkNpLJWHo1/LwAO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmrpo5EACgkQFA3kzBSg
Kbad/A//WCwjjBQrxpHVXSeJWb+Xs49uCukN1xzEiEoagUqDhjukYpVsmstAY4lm
jzOEVsDQo5aN3U0uNOQU/o7RwkXREGj+9ZhjqcG5hHN0XsELI3XZXzNQQdd4Otf3
fkyZsuebaUAondP8tRBvQpJCqVuVkUU19Cr3be6b6UInimkzrmMxfNJNdQMDZeT9
83xsGz1ajtlYPBt6y0zJfpoyXlAcFtZ7J0QwnRlXQyr3l+voDSA6p3epj6pNpiFF
vj/ASfXXGmXNPopIzBEQwL4GG5qQZ7H/+o+w6dbaDfOBac2ZqZHbyVYDj0YeGIhi
z/3aCV6Vh3BXw7x5+2Zff7OYVRalL/80c153S9T0ZHWqsrOBZZR5zYRUK6afLl7V
wLI+P5MaOSvHSgriMD2tgXH1yzMTgk/GWF81IOcEptbbfz8sB0aeAjGFd2+lagEL
4jIFAMgmiqwQSdIrFjGhWj0nMzU0LAx9+Ofjkv2kVsuK+bJpKIMDKonbQbx4BDTn
f/NJdXnf584+kJnLxVSP4fCH9Z2Dn0KNPlPZd04jLVZmiwkFK46sqUf9QB9AWW8V
reflwo19HV9xtoakJ+dQkXSESXThAgw7THGAlbFmWXuSF5QkHtaYmV4iXlSRrnwH
LDK6vkUFsZXsgbePvP7Nsvxt7poFiY6/i/YE76n9wJ3ZVoXth2U=
=79Zl
-----END PGP SIGNATURE-----

--8CkNpLJWHo1/LwAO--
