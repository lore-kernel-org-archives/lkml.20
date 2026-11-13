Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551230;
	b=IP3P5hvIAgs6AM9cKTURhVyhHQrkd04JqAZuihwHCyMLUXM+e+iDxjfU3ZNP/92j9QX7
	 JzRdPqcRtcZNuZan+fquU+2x2CFpddk4LErrUERAReVOq9eNSCpD22DIh6zr/bXtN/01U
	 LJdrYJdSA9QGO5x3/dQcUIKUvmAUkfGmyDifArCaHQP84TD350q4ZNDBwGhhD4a0uQrPV
	 N1u8PSqtmDWP67VmZRWCjFSBHQHYM4BSNRdUM+cn9Q5b16DgfytYaaZgUAjJKAbkaxsNJ
	 HtO0Z7Ia99E7Po1Bp2L6BQIwCxQJmWsIpsrPBR3FZdJuqffX9cVugL7QNy6k12kdRSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XltNWiKtwG9iBw8+GH1SYk3VMgJFEJVDDOL9ejVnQFk=;
	b=uhmB93Yn3d5swq22zJWZNtVgqK2msEwIjaSeP8l0uGf/vj3geNxG9wW2L4baFN91spbF
	 NlPCF67RNP7m2jubT3FNtOUIbsGOKxvAPCvvtH8SZCb9VNTdKVPLFzUMczE6dM7aacfSP
	 rgB68I/uLfbNUTRJW76bHRmcxu+a2tRapciWMzDq+e8xTGNaA8FDYAIAhIfOZeFZULM+q
	 khuBNB9Ii13VUw6Ihqnz0ksJGOH38GkGBl7jPE7C6v0lOP+vxiU1hbOp1X+osHFI6q9po
	 fXG7QgIRW3Xmri2YxsDje7GMXMAKoGAWSNhlI73tmJ+cV++J9avL/DMbk1YmWAezeVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MUvxZhYm;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6DE606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F6DE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MUvxZhYm
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so3681855e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551229; x=1795156029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XltNWiKtwG9iBw8+GH1SYk3VMgJFEJVDDOL9ejVnQFk=;
        b=MUvxZhYm5+xi+SJfP8nHhsZ1GXHZRgKcmtYpFlDoXTjjRpAAhHrxK/sL0p5zR3UDxZ
         zoFe6J+qpK86Rz4t3v2DUKvCLnSK0WziR5goLmM6ybJ96s52a7n4l6ssjhqsUYaR+Jm/
         Xs9hOLXj9PE+uwryRlkvLuERCrqJTf3zLvvS2FCslyTZTd9wswIAMULtnwF8vJn7f2H0
         3wTzjD8Hp6/wsmtQJ0eNgdgUe4JwuhUhUM8UnvqdKeyZwp2YYRSg+jZBqsj6tEhsE3zD
         Pz/u5C9YRb5rfcke4Gy7OJXnRI/iCfjiVWknhEe2HE/M51peV4kwHUDOt1TkMoov2shs
         xFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551229; x=1795156029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XltNWiKtwG9iBw8+GH1SYk3VMgJFEJVDDOL9ejVnQFk=;
        b=GAmVJlwcoY0Ph1A2YI2UiGM9JHU4b6Sh0WADNGFraNLwp/tlc3eHS2t2alE71V5NV8
         jI9Hf1pZBk9f4mMpZ3PNlChbTdyOBuQRuH37lE1BeodqvX6fTubJSootHxz4NstoGd3x
         ILgtxIKlk8YsFRvabxNMxUaexHuKedcpCG8OR5kCVetLaKWUvZeOqdqFcBLaLCs2/bNu
         HAaqaSxGe8C23ONwW7YQbQtDhTfma2jiRJjvHbAhtD87dFigwSt4rkY6mLgfpueVkqAA
         6/kJOUxsfJ0NuFC1R9NfJHI8Lx4peAOh0GGk2g3OnFX7z+QIivzBSMqa3/L4i3m6nOc7
         ByEw==
X-Forwarded-Encrypted: i=1; AL+hErEzHSU8geHTwiLUHKpUvamASLkvh2EEeFZqEOoZRXTk6yf/+fEI8C+hqyumSkzrw4GCOdiZXR6zGyJ19Tw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9Rm5wS9bwnFnkA8aGfRAjdKFtIAiECk8O0cTo5GAYQuD1SRk8
	XyqF0eDMztlU/YIdQHAWKTcDL6qjkWihNEzu8apt/fmX4BctUugex/nOYuT49mTn7Oo=
X-Gm-Gg: AYBFou0MmNAuzOV0k9CwSZaK6H9Pu/3vK4KvriXEAg8Wv3dw9J/ZVSEXzzsEVaH5Ziw
	yDXxBqbmL9i3t2qlQ9f6Ec6RY7I0u5d1Xg7fyc5mnky+i5dgOBzlyEJ4nx6tME2xwgxdXcGeYjN
	suBMA8ST6FDeAF6/oOiL60k0T1XeOYJyzKANZeXwMDocXMnlWX/uW1uVktZnL8Jum+c5fWak6Hx
	OE1CWByUwMQ9rQ/1HoVmW5Lb7S2hC2w5FeEa0NOuc9cOdKLsSpsHtqMrjZp+JUEEukC7SADKF48
	b82WUVHfjbiEE/5ywLO+mBfHA+AcLoCrF7DV7RuyE2ah2IFlQxxvAeHi1RtJD3ry4mov16n858+
	7KDEG4u2ogugvuDDj0zYdTYHNyKyqagD5V0LgTcKf6PpoJ8hGJ5GFhjKbEEEJwncGpnGaDvjvz/
	Jswl3QEmaeBiKtIKcwcII+wM2kFWXRzn6LqOrM+mPbdHw+aECVpuRPdSnc2uhCDr5i3uO13oVHl
	KTGQtasSkI071pgj4rHYj8a039sYQkB+PKXFsVYZHNw3Muv7tgGWB8CjAZUejFC3KfzDiJM7W1n
	XOEeK/YgeukchrL7b12IWr+MSfgGO0HkyplrMGMjc7AuQfwmdffTOR8chVm8nGU6dRDLbwdZbg=
	=
X-Received: by 2002:a05:600c:4ecd:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb5599a73fmr36037725e9.0.1794551228841;
        Thu, 12 Nov 2026 22:27:08 -0800 (PST)
Received: from localhost (ip-091-089-005-024.um28.pools.vodafone-ip.de. [91.89.5.24])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb4e29daa5sm133039875e9.12.2026.11.12.22.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:27:07 -0800 (PST)
Date: Fri, 13 Nov 2026 07:27:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Val Packett <val@packett.cool>
Cc: Sebastian Reichel <sre@kernel.org>, 
	Marc Lainez <marc.lainez@gmail.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	=?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Danila Tikhonov <danila@jiaxyga.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] power: supply: add Qualcomm QGauge (qcom_qg) fuel
 gauge driver
Message-ID: <avatRCrAgoPjV7rP@monoceros>
References: <20261112170841.2189322-1-val@packett.cool>
 <20261112170841.2189322-3-val@packett.cool>
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
	protocol="application/pgp-signature"; boundary="mwyna4jkd5v6s5iv"
Content-Disposition: inline
In-Reply-To: <20261112170841.2189322-3-val@packett.cool>


--mwyna4jkd5v6s5iv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/5] power: supply: add Qualcomm QGauge (qcom_qg) fuel
 gauge driver
MIME-Version: 1.0

On Thu, Nov 12, 2026 at 02:07:28PM -0300, Val Packett wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>. That introduces a bunch
of unneeded build dependencies and of_device_id is already provided
(without these dependencies) by <linux/platform_device.h>.

> [...]
> +static const struct of_device_id qcom_qg_of_match[] = {
> +	{ .compatible = "qcom,pm6150-qg" },
> +	{ .compatible = "qcom,pmi632-qg" },
> +	{}

Please make this { } (i.e add a space) to match the most common style.

> +};
> +MODULE_DEVICE_TABLE(of, qcom_qg_of_match);

Best regards
Uwe

--mwyna4jkd5v6s5iv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2rbYACgkQj4D7WH0S
/k7nbgf/b6/rA4kIW1NyMoOtnNVBeGIHHHNfMkct33HHb1h0CiT6Hd1RLEJ6HH+F
sW4pjg7G0QStID55MbOeFsfsHKUaOEsaLwutZ3fATturnz7k7RZRvLfAjNtR3k18
hiWFbFdsTjH6SuQ/g7OijXpDO+E2v/5FHg8g/V0U5xwL0w4sWAME2Gxrc9Aed+1Z
yb1H38UcmdaYkNs0WgAyYt2rGVtGDyt5nQqLm9gBfrCvoxDzCIxgiXJ61C9JMF0t
UIk/sLbujBcPF2qrtmodX0CUE07kBKD7PV1TOWjB7Gcz+f3E/X3eQGPNNOk8mEQn
pqgA7hr5DNGO6zRenFbDHgtssAhenA==
=HgBt
-----END PGP SIGNATURE-----

--mwyna4jkd5v6s5iv--
