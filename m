Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B33400E11
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394686; cv=none; b=buEO3xPzAHtEUx1bO0uQi3P9kAOCViWxecjWGnJ42RfZtxMSyUrvvCBVD8bNf6iDxfcSEV1dCcUyWWXDhzS3te2RNE4gXr/u1LyOjDCyQcn7EdY+LVKbCqlgls0MQgV4BIWCx5WexElzjjCXedb11VmHEGPNbZuSNA3upY8VrM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394686; c=relaxed/simple;
	bh=4UvBLqNBye9PbHAYAVSv51+Ycq/5kneBcsnxjMGGF/s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=DtGJMF6dMrbIaxJ5QiHHupXttwtTmvx7E4SlC7Q1AfK/yQa/ljaERaKT8aRNYeWUtDB3yKKxCRdHcHaqIfaFz2pXsmEz+Hz3CGC/4qCnHcSLA+myDGODZGt4WWUhFYMf05lVX1vhXSXppwrOrLG4rEj1m13Zpqi3ff04tFzWvBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjem+oUI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjem+oUI"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 66F2D1F00893;
	Mon, 14 Sep 2026 14:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789394684;
	bh=4UvBLqNBye9PbHAYAVSv51+Ycq/5kneBcsnxjMGGF/s=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To;
	b=mjem+oUIuDEMNflIniaUaEGfzZ2Dvuc8B/Nl8O399qtKkGrah0dmlKf9mzBpx9j7j
	 5u8w0V0PU66pEIaKm7IlsGnxPveNfw5Fs/WMSfdnldhDwSuribuWN5Ki9wr+E7314o
	 kVjQCtSGMzevWBLwzEUoxhjwBZvg3m7zT25Yo+5Tg0yUWrxZ2eLF+Q19jj3E6E762a
	 2jNgnMITxopnKrl94xTJJoUn/BcVA7+nY5PwGIP9KLHSdQlF7Sl7VHTbrAqskuT5Tb
	 ztP+ecXMt+pDmJR4DSCvvdjXsX2xwgGAQfQ9bWkSM6k2mUBn0oUBFm3oP8uchv/Whs
	 5R5PpdfvJKAzA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=73224e4c0f3a263ea2f87dff3430fb651e1d994a3e10946ad5fb6eb997eb;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 14 Sep 2026 16:04:40 +0200
Message-Id: <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
X-Mailer: aerc 0.20.0
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com> <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
In-Reply-To: <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>

--73224e4c0f3a263ea2f87dff3430fb651e1d994a3e10946ad5fb6eb997eb
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Sep 14, 2026 at 3:42 PM CEST, Nuno S=C3=A1 wrote:
> (*): I should note that the command actually failed with -EIO but it
> actually unlocked the chip! And the reason is because the flash as the sa=
me
> FSR register than the micron-st flash. So WEL is set to 1 but can only
> be cleared when clearing the FSR register.

Why doesn't this affect only the locking operation? WEL polling is
used also during write and erase.

> AFAICT, we should do something similar as micron so the writing to an
> actual protected region fails rather than being silently discarded with
> that status bit set. The question would be how to do it? The code is
> pretty much identical to [1]. The masks, the opcoded... So should we
> somehow handle this in the core (by having some common helper) that
> could be set in .late_init() under a common MFR_FSR flag? Or just keep
> both implementations separate for now?

I'd like to keep that out of the core.c, but also like to avoid any
code duplication esp. because there is already handling for the
intel spi controller in there. So maybe move it it into a new
common.c.

Apart from that, this patch set looks good to go.

-michael

> [1]: https://elixir.bootlin.com/linux/v7.2.5/source/drivers/mtd/spi-nor/m=
icron-st.c#L585

--73224e4c0f3a263ea2f87dff3430fb651e1d994a3e10946ad5fb6eb997eb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqf++RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iVegGAyT/hKwwPtVPZ1rEp6XYMK0Mtc/28+h8j
69pul5/NnLvDiXuxhNelXY0Kxvt1xShNAYCViwThHdSy5XQk93euXIMKiF9dElr5
1oxLt+xNBvwPQgrbKJ1QysOZIikXTx1D8vk=
=a2i8
-----END PGP SIGNATURE-----

--73224e4c0f3a263ea2f87dff3430fb651e1d994a3e10946ad5fb6eb997eb--
