Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326146;
	b=F6DGybVxP6EnmNj9aRdBTkhYxZxnkIPy8vme0DyTFWpZQ/oYj5Emldfv2dWNGNqRWVmt
	 LG8RKFUmcW2quo2ZrPguO6QHsVVBAQmMG+G61Nhj5RldyBpAf9WBta0QEJQpX2UvPzi/a
	 t7KS2A9RXsYfxlfOxyLoBxmP8oEpTFmTPoecvBoc4id+V8Yiyk2SIPQcXV/nvWdtmunws
	 JrS+5AkQorV3NB3P+4gulsM9OhfidQSfa8BLqX51Zv+L1Q17MzYmGL1xaz89vOHLKeiPx
	 zVnGBpOcSL0/j23mzS+yQ0n99INrHWpGPlgNLhA05JaI3BU3loJAz4HPBwuTNbdjiRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=aM5tBn3ODTZ1/FCzgvJ2PUNZD7PoTyZUo4VRYYi2yLY=;
	b=ftmDHh5rph+zgk7ggxQCbWmF/wkq7RS5scKDZmkXpxSe+ZesEQRhKxYDjh27Lz0ipkf5
	 BUp35MnpPTpiKevF0t/SUxh5IfC17NSApRH+UTBodADZiJcnwoWpcZEgMTiH5W3EBdGec
	 upuGGNp95oKQpGIjqDGHoHAMUKHYA0ZVu7xFbRupveNvtLt56kikjmZjjxzFU025DgVD+
	 wHh9P5WmMrbP/noqRWGrp96SdKTJY4AnROGntrtTXymDJ2NmLcViS9I+N1raHRn3QjbtJ
	 uh4yNtm9NmuUaJo4MZNPxBQCQHvK3DIBfLXBGieTZnpXPbgIFxntNmtAUmXQGCtNdlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JC8ZByDM;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0D1606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A0D1606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JC8ZByDM
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so19837165e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326144; x=1794930944; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aM5tBn3ODTZ1/FCzgvJ2PUNZD7PoTyZUo4VRYYi2yLY=;
        b=JC8ZByDMjknsyEpwTuwVgXFmocCEOhUTrbthwhiblOhrsWSGvDJo7/Rg/6oEFhuNUi
         O1ygA4AJMvLYdlLXB8F/Ic71Fa2a+fpsHV54QBhMrofde7CTX+mnhHq1vvwUsgcAwYW1
         qpJciVL0a2oVKA+g2iEbs73aA9+1JAkpg6dsyKW0on+P3IU47ixO+vShx0DX/NUTmURy
         gjUTvi0Cj6LWYxSgTyTYbI6EbBfV0EvkxS5T0NktsFJopDDZ+8THjRFBq1UlLBPvr6Dc
         dBbU7Z7JvrwMKD3qNU8vtqoO1OfbSSxXnTCIBPNX1VryJZyrK1hFuwkDt/8kyQtcjMGH
         GO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326144; x=1794930944;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aM5tBn3ODTZ1/FCzgvJ2PUNZD7PoTyZUo4VRYYi2yLY=;
        b=cZowfg9fZgFq6S131YT19wm5EERtTk8YBixdtFhdfnAyFEZ/oy8VoYIj5Unllm3EJ3
         7ULVN73CvayKelyUGmcCsEjqSUkg8muFo5ReccaZ+hFgv53agCDUJtVeNQydBqClwyDT
         3BWGAJWdITtvHxywdtj64grB7vfzUjq+V+BDPW+3Mvn8aN7EwUpXKvaCWsMhWmPyKTcN
         SVswJ1qTzkWgAQDMc1gOmTZNlcGwh+2ytgmqHSqiWywNZkwqfoRDLU4VZdWSAb68rlxq
         MoH0qHxnSRer4Lxsv3hXu102opcDsOUDgEgXodJsPepxNpTbG06ZD5J4Eeg+XkFBgcUK
         FX3w==
X-Forwarded-Encrypted: i=1; AL+hErFWHVo9EHc89rIPw87cizlLzyqx054500HcxswqgPriLqv8IJoEEIT4IDIuSPK2PmWIcbDsFdt/24fIXIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gp02NmTUu3FQegJWLQQDhy662li5b++rjr3SnfGki4vIFV8B8
	2giqD44ePpON/3MwP29OOMAIc4MpF8sHXHBGlaZnEqM0uT8yT/VBVb/X
X-Gm-Gg: AYBFou36OY4xkccPZHI8w/kSkUJh6uStshW7Nbo/ZwU9rWhdILqOg7CQ41t3mHcOcF6
	CiyQdYnwmHdXL2bvTbjSXi342YwX3STinOMa5oFIzG3+VcgAMQrHl6d+m3xjnopWosKQ6q++1gj
	6pmcINxfZdjbk4egK55bCN2qfK9XmpndYjwEeCV2VlmEVUXBpimGJtpPCjyz5b6BQVaaZHFTl7k
	9+ZVS4ebS6kyREZVaUEiSN+/0XevecFfK9qPHVvQNzVBdz6vzi6DrEUdsjkyrnBpltvx0mX48kw
	gzieEOYY1osTLIP3tDlMByk870GBNk8RiGyLJtsr3R7MF1k1bXZytAl8T6cc4iRl2wt8v5DnjeZ
	9a5p3WOOUxYcKr4EBPgYPxTV8qzgT2SgcqF5GwPfm4qyOl1s/xHp3QlcndC+Qc6Oex3/VkHEhE0
	PIGhK7vVQ3S97+WUxwtOKWNXnrB0Ose7nee41boGxeXWfhQiVyHj7GYwLwgJndops1q5+hwawCE
	/eE/Kq0qgkkbkRT0e0MZuT0+P3SKx3ndrLbK2AgSPlhyeNVzEHxaOKDg+FYtpb5CKIPvwanew2j
	sNlAqcE/Dk1GLJTwi9VNVQeE7/dxE+5o7DUczG0l/93NGjueHpEwOEe7OmRvlaz6PHY+tPOjjbP
	v6SIxlLqV6oPNRTVjnIfMENWCJyL41IJyyktCMGYMS8hCJvTWSsMSjIRxl4MRDxSZeakGaJvQ+j
	T+6+OUna0CdcJhjVJgk2ysUd1LWNXCmmHZgTnrsDIqi4NLqrj0tZBphNt93IjsR2ZUnZGCRmjAf
	mEHSKUgrqM4Q+RYl5ydk7axb2JYCI4iXLXTQ+NmG82AfpijZS59vg==
X-Received: by 2002:a05:600c:c4a3:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4ba02308542mr51845065e9.2.1794326144134;
        Tue, 10 Nov 2026 07:55:44 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0234a5dcsm73237085e9.2.2026.11.10.07.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:55:43 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, aiyengar1990@gmail.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject:
 Re: [PATCH 2/2] clk: sunxi-ng: h616: Let the S/PDIF clock set the audio PLL
 rate
Date: Tue, 10 Nov 2026 16:55:41 +0100
Message-ID: <ThOkLORdSauix4Mt72r-lQ@gmail.com>
In-Reply-To: <20261110-h616-clk-emac-spdif-v1-2-e5e36e8963e4@gmail.com>
References:
 <20261110-h616-clk-emac-spdif-v1-0-e5e36e8963e4@gmail.com>
 <20261110-h616-clk-emac-spdif-v1-2-e5e36e8963e4@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 10. november 2026 ob 07:03:01 Srednjeevropski standardni =C4=8Da=
s je Arun Iyengar via B4 Relay napisal(a):
> From: Arun Iyengar <aiyengar1990@gmail.com>
>=20
> sun4i-spdif asks for 22.5792 or 24.576 MHz on the S/PDIF (OWA) module
> clock, depending on the sample rate family. The spdif clock has no
> CLK_SET_RATE_PARENT, so it can only divide down the rate pll-audio
> already runs at. Unless another audio device has already set the PLL for
> the right family, the power-of-two divider rounds down and the request
> succeeds at a wrong rate: about 12.3 MHz from the reset PLL value, so
> 48 kHz content is sent at about 24 kHz.
>=20
> Propagate rate changes to the parent, like the audio codec clocks
> already do. This is the same change as the one just applied for the H6
> [1].
>=20
> Link: https://lore.kernel.org/all/20261104185027.883011-1-jernej.skrabec@=
gmail.com/ [1]

There is no need to link to H6 patch. It's clear that patch is needed.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> Fixes: 88dde5e23da1 ("clk: sunxi-ng: Add support for the Allwinner H616 C=
CU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-n=
g/ccu-sun50i-h616.c
> index d2625fec651a..f703d690a563 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -529,7 +529,7 @@ static struct ccu_div spdif_clk =3D {
>  		.hw.init	=3D CLK_HW_INIT_PARENTS("spdif",
>  						      audio_parents,
>  						      &ccu_div_ops,
> -						      0),
> +						      CLK_SET_RATE_PARENT),
>  	},
>  };
> =20
>=20
>=20




