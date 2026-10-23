Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747752;
	b=36aq9WdW5194JsYQLY/zM5sSh6vPeqOziJ4cum/yonfGfqmqu1u1n0u34Z8LuHSvQDpX
	 iaqNxhQR2T1U6A9JaZBA2xL4sNNUtOq6i9OlEEhNw/PviAMGLVImWalq4IjRwQZPkpdyn
	 lzu4ufzFUWKfSGiHwli1NKToF7d+u2PjqaQbxgAAXnqunvnHcDTbCj7DrOl/E3JjSAU7k
	 Yay6IPQ2qg5+wn8yZRh4kFHIkEvHjaEqGQo1S8Bqf6paX18XkV9GXmTD6zi/Kr70j5F0X
	 fRF5pAcbHx/rbHPqf0f3dc+rOepcgVRbGM8yDQMPdt2B0TzV4LpYQsiBgbiF/9ckx6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747752;
	h=Received:DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:
	 Subject:Cc:From:To:X-Mailer:References:In-Reply-To;
	bh=ApUOemm/+wB176QXWNQqZzhMXHryTGIJ+8y1XhrUjak=;
	b=fjUhG4FywIwfbuz/GiTz/n35wzBfd2WO6NfjQtJTbZO9D4TbK1VfGPgU9u20J3aN84VY
	 UMPhhZQVrHJ1HK1NRVGY3NjME0jopHOKY3HecX6z4vhSh2vycajg+5VwFI/nyRWdO9M61
	 dY7xvcoevbPdq9O9TWKE0ISP2rddvHlDDLCc/it/Fmn6dZQHLs2MxRF/Sk41Osq1Q3Vu6
	 T1ocgE9w3IAdZ2akZY0MQFxo10xHmeX/zvX94HEIHQ8LaKBZgxLxeL1UlRT3DFoU61orR
	 MKoIAC7Vq0yd4uk0HnQDujaVct+mr+pCc3UyE12kXa6KB7GBLRCQ3P9rru7MlybTblw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H3PW+9+L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id EF2C7606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H3PW+9+L
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 069B91F031E5;
	Fri, 23 Oct 2026 09:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792747751;
	bh=ApUOemm/+wB176QXWNQqZzhMXHryTGIJ+8y1XhrUjak=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=H3PW+9+L1G8I9O/jkz5r503Dc8BTCAHY97Rdo5IlGYc/DZuI/owoBGy5iWrHlQIjn
	 HdfHj4q04tYXhomkndPLOmAH24Vtn8hYrvF656dds+0Nn8TcSAY86hwl3kmG8YDP2r
	 dLhGEgdueHR+mgX3v5Z4tapFRbPy9yV8m06GvSBksxBFF7Vzx3HKGZ5yKspcLTdIYe
	 BLq21DZWus/UZA8Iki+1fj+zJNy4SMgrUWEXOJTEJoYDHV2tGdNokVBTogoQIaXST0
	 01zuESmCre2hI65O71t6sGLApsQZESZwRlzayu8SOq/mZi/z+LSOiO7dB/11l6WUCS
	 I9+jrqQDKPTVQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=d49a4ba38a51693f880b561d78b3c10aafad54b49134b8a43e636d36a692;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 23 Oct 2026 11:29:07 +0200
Message-Id: <DMC41DHV2V37.12QR2S7OFTWW6@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: swp: remove unnecessary else after return
Cc: <pratyush@kernel.org>, <takahiro.kuwano@infineon.com>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Shuai Liu" <847807867@qq.com>, <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <tencent_25C57E270CDC01A4CB5894E4EF9B80708509@qq.com>
In-Reply-To: <tencent_25C57E270CDC01A4CB5894E4EF9B80708509@qq.com>

--d49a4ba38a51693f880b561d78b3c10aafad54b49134b8a43e636d36a692
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Oct 23, 2026 at 11:24 AM CEST, Shuai Liu wrote:
> Drop the else branch following an if that always returns, and move
> the trailing comment onto the fall-through path. Cosmetic only, no
> functional change; silences a checkpatch WARNING.

So what is the checkpatch warning? IMHO that change make the
readability worse.

-michael

>
> Signed-off-by: Shuai Liu <847807867@qq.com>
> ---
>  drivers/mtd/spi-nor/swp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 235070b21..3b8176b9d 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -135,9 +135,9 @@ static bool spi_nor_check_lock_status_sr(struct spi_n=
or *nor, loff_t ofs,
>  	if (locked)
>  		/* Requested range is a sub-range of locked range */
>  		return (offs_max <=3D lock_offs_max) && (ofs >=3D lock_offs);
> -	else
> -		/* Requested range does not overlap with locked range */
> -		return (ofs >=3D lock_offs_max) || (offs_max <=3D lock_offs);
> +
> +	/* Requested range does not overlap with locked range */
> +	return (ofs >=3D lock_offs_max) || (offs_max <=3D lock_offs);
>  }
> =20
>  bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, cons=
t u8 *sr)


--d49a4ba38a51693f880b561d78b3c10aafad54b49134b8a43e636d36a692
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCatso4xIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/geXAGAtmA1bXnVFLtWXOCoVlNCz/JjY81JBKrX
HuSNRkg/SpVTWIGYXXqCmmUF62/MMvgNAX965Xq+msnzoy+l5lKPcS/aLyLzEGid
4pWC+BcJ6IFEEdkXFPWpDt58aiFiWmMF+po=
=QF+o
-----END PGP SIGNATURE-----

--d49a4ba38a51693f880b561d78b3c10aafad54b49134b8a43e636d36a692--
