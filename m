Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794351930;
	b=kU1YffTwLIlY6vz4tS1Qdrhhajhb2KvyX/bOyZ5An7Bn9br+GZcQTNRHXKQ0hFlFEILV
	 afjJicpIDWvpVRq2jfr/I0cVzU91BO2MO2vxicKXsSTcQnT1/MhQNZCw7o+1dKz0z/yd+
	 lqN6Eg6DXviSUEbT5mOs6ZYMi+u0ayRW8eP+CW38BCW5zyV/O2c1BWWFo6CHMCe0FTZ0O
	 K/5FlQD03UQbu2cdFycn7LcvwPiRW0yNzVqn31B8eTvmFEvagIOU9fgv4xwIN20BK/H6R
	 N5LQ44UYg/ayQSbF6BM5XsxOKuAbJoZvnnym3SRyvBt2P/yJmGAWYmnw5Zwkjvk8faw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794351930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PdeUXT5hL0s7mCt96NfWjkzr/Wr8kB4BYllQsiOMp6k=;
	b=vcSMeh4bvdo/DLrCFALDLq3JlLaMQHq/tb00P63b+4N8WzZFnrvef4GtKO+dDX67+lGI
	 459Ll+xkDSCtuTGPTrA+PVCh4nvGIefIYmihjSNHu/DrWprwkkPxZmzpE8rA70FPYydUm
	 WIrX5IfsqPh5L9MZGHiyXuoePA7hxJARzWq2K4igAR9pJf9H75ACK7LHOWvrc3n8n1YK2
	 HHKV/PXRuiKcm9zske6iJMaAMcOHnZ8uuQ45qZDiYRxeI/e1B6PUgqelmYaBqrDuqYDB3
	 +yMe2LbfzoxWrvdnp+GXrxpMntpQgSUCH6Rk+FjSKoiyfPi6uZvB5f6FAC18Jtk/nTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=chromium.org;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=chFjdaca;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE88606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:05:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE88606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=chFjdaca
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdd89d84521so706699a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794351929; x=1794956729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PdeUXT5hL0s7mCt96NfWjkzr/Wr8kB4BYllQsiOMp6k=;
        b=chFjdacae8HmEtXvTTpixOtHetjdpVIEOWu0SKmNsZ+OZAmtnbalqn+UjJaWfwfcHa
         Bil7QAUuLgladmrlg68W9y0UlVlkhDvYAjM/nJJ7y6vs7k3eJkZe0yJPJzqJ3j4nZi/h
         DRBdA177Ic+2kvfd+LEs4bNw9RPE2CpmX9s/GusG1E/El2SiqCZ6SvjF/uACynhxnVc1
         uoEEESXsABzM7geTckEylHX8eu+yUHLoQqQ/wibrxDlR8hyVKYnO7ZQ9Wpk+Kj1rHvjs
         Jq3eO7fWxICNN1vEmDXldwKS6f8cnAIdUG1+iBl5fd6O+86Rao4SCcHh7bLPnz9Dk4Sr
         oaUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351929; x=1794956729;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdeUXT5hL0s7mCt96NfWjkzr/Wr8kB4BYllQsiOMp6k=;
        b=S8XPkDEoTseICvYO3Y9WiV8zfsgNtYeEtAm0j0VK9833IKlG3kxi36NnZrRsutIhUr
         9YHCwP504tVq4mxJnlyU2R3+QqVOqzMDaDqXdO10IgJ4E9vF6W6iPB872D6KeobIvsX/
         qIQt5HpxEAeO0VOWB0oVbvPVYWa31e8AYMIxSKReaKDQU25XVCQU5mrPdfZ6V97e+99W
         39Xkj79EfLu0qGYsv4nHmlMlhPgrx4qaKcyJ+ss54Cwo2RCIoS7tEHXnV5Cu6TX8Kq5o
         poyqo+2zfDCLzpSTqoNnWNCF7WPybPjOtNxqm7ZbH06jI/mlLvJDkIWFMIOSYNP9BbGJ
         BeYw==
X-Forwarded-Encrypted: i=1; AL+hErEj1t2WPlIKaHVHX4GvpaMr62DOpMwGj/ox9ZHwhRpiOoUBYGAg8cG0D1FxJ6FGXpvDQHYBMrc1skgQLuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WeOp7k6CY5YHKBFjS4I/wtK+4Uhwq+6R2RlyR+Hu2mZ1rT+22
	ChcUJG4glo3d0vXA6lVfHDBht6xpOfx2wf5lNA8P/ViOVDeeZ7s4+tebRBR/koIrQw==
X-Gm-Gg: AYBFou0gScEyRjqdB54//tL0L2rFPn+pbuohvpq7x9YNyjYZtHdnIxfhIFSJkxG8hH0
	b3Dc2hjLkC+lJ/5pBT69NTElxapZis+OsXkfolV6QWcjmBVS1Ph0BW8u6IiNJuZAePh0Fd2Q3Tl
	h7a+Tjv04Pg7mtD/YuZe0QvNn4lO5LTluwQ8fDEZyBjBE4m2cgVpIfW1O90iYvZcpxX9f1MihT7
	mdNa9r+e/EaSUqgiIDKpPxwUxyaSlbhoX8ZngSz/v9ZiKn7bAOUVSvAxWg4XodwFr/lXmz9wlse
	ZXoDpw29Gv9L5VsXjFBOaFzNWMLXK2d6Lq+3MCAgRd2Uqpy8CAoL+cjDZ/tOLMA0tfVcM3Gj/Do
	CXrmecETXDNCvOLG+A/xlN1xjhn5Qf7P1Vp6Tk3Pieom/x0bJl5WKyEChAJZFWEviMQbjI5wl9a
	3fCgyybs3OkoNr2uG8aX7I7hu7VoCX0BGAlFqzo2XY62yX6Tnxv0PW0g7nA2QZMBsgPwCHGkKbY
	Yq5qu/AZK5GQkEqDp+8d2SeF/AbYlBCpy2wbng1huXlN2U3Ut4JKqCI5v2B4UcICgfaBVrBz+vH
	OxUNwJIFsS+61m+3zhOmRIOBm/cyqUD5v+RSlnED4SbTcSqklNmEHbB/h+HwS/Uyan2jt7lKVNP
	iz+m66NzhkmlNNDytJgzr5IrwZ78RF1TU5ve4eu/0cNNsvSM4bJ4SUT0pt4vxxa8b//V13gutp4
	ajmluCr32BwwWA
X-Received: by 2002:a17:90a:d00b:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b182e0c1a7mr350381a91.1.1794351928487;
        Tue, 10 Nov 2026 15:05:28 -0800 (PST)
Received: from google.com (196.126.197.35.bc.googleusercontent.com. [35.197.126.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7df7csm1476956a91.11.2026.11.10.15.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:05:25 -0800 (PST)
Sender: Benson Leung <bleung@google.com>
Date: Tue, 10 Nov 2026 23:05:22 +0000
From: Benson Leung <bleung@chromium.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v4 09/20] mfd: Drop unused assignment of
 platform_device_id driver data
Message-ID: <avOjMhYL-jo5qWnx@google.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>
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
	protocol="application/pgp-signature"; boundary="QGZX1VfFPgOu+2d7"
Content-Disposition: inline
In-Reply-To: <9bf8e674ac935547639dc6f89fc0aab5ac826db9.1794347059.git.u.kleine-koenig@baylibre.com>


--QGZX1VfFPgOu+2d7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:54:34PM +0100, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> The drivers explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop these
> unused assignments
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Reviewed-by: Benson Leung <bleung@chromium.org>


> ---
>  drivers/mfd/cros_ec_dev.c | 2 +-
>  drivers/mfd/mt6397-core.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 529a23b804f7..96aac158fd8b 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -379,7 +379,7 @@ static void ec_device_remove(struct platform_device *=
pdev)
>  }
> =20
>  static const struct platform_device_id cros_ec_id[] =3D {
> -	{ DRV_NAME, 0 },
> +	{ DRV_NAME },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, cros_ec_id);
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 5d5f816492aa..e74936ac206f 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -435,7 +435,7 @@ static const struct of_device_id mt6397_of_match[] =
=3D {
>  MODULE_DEVICE_TABLE(of, mt6397_of_match);
> =20
>  static const struct platform_device_id mt6397_id[] =3D {
> -	{ "mt6397", 0 },
> +	{ "mt6397" },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(platform, mt6397_id);
> --=20
> 2.56.0.rc1
>=20

--QGZX1VfFPgOu+2d7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCavOjMQAKCRBzbaomhzOw
wggAAP4v7fnaGuBxjdQU0SnWBJUfK3YeW/iId1LRt/eBXC0OmQEAioUu55g6cEtn
WOAUBxWTSFHNLgkeLCTw0+Pu3PdU8As=
=e1Q6
-----END PGP SIGNATURE-----

--QGZX1VfFPgOu+2d7--
