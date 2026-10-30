Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348546;
	b=BRcfb4Ory4YRFlERKXbsC5zjPc5VDrA6oFFdDRZGMv7yuWkChGQG2fo7h/YvcPnJeT0j
	 +LYWIZThIwCjFocFY+FgyJ/Qpy9q6Z4kRDmiEabWBZ8+ETpEtpfaqGQ9nZHVL9jzbAu3O
	 y+fmzq40Es8JYkngEZK9067ejCnLbeLi+XDylaMZJjelRZ1VGOmsfjPTyioNJ8VJuAM0x
	 KFrS5eGiEYQSotNRoRX6SzpJ7gDfmZ37C2KyC+QbvonvbSdoaUMzYY/Yb7TZ4vu1Hnn/1
	 Jh6wxOgVypZaYi+qpNr7ZFQuPfi3TdFiZLAr9QBkT7biUZipSXdlwMgDRCRPCYneuVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DIShynWiIS89/lV1Gf1CIiRpO7YkvZ3/xDCYL33Wzfo=;
	b=z8Ba6eoUL3FzI8G5gH7K+He135nuk/Ajg5gune+wksf1d0vFLX1/8FdfrOUvEIpS1OCc
	 7BjvUc6ZOgCvJ/pmKLTmf+mpDRTDtC4/RBZz7sa2XEMuDGYLx0rGoLS7yzvi3w97bpGrm
	 v/5+WAhvfrE38SfbgqnjhMQME6pc8FE2BjF57RM8imPmuB7mmiLiacb1Z9lb33JwnmjIB
	 OUFEJv5wyCJF8SIIYWINCQf4P6X4Y3HjCQ6qjtSD8ETNkQwkjYb0j5sNgncJGUTtxudCc
	 cZ3ptNrCwy4bp5FEPtUTNwuxVNj2rg10byd8E7nBoPT6GZKV8bdPuBEcwuT3G9XLdog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1ZREggf;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57297606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57297606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1ZREggf
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so8055235e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348545; x=1793953345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DIShynWiIS89/lV1Gf1CIiRpO7YkvZ3/xDCYL33Wzfo=;
        b=m1ZREggfyTCtsChEl/GSqGiNOSP5BkUWTz/F+p/3M0HRrgRV0JhBRzRevAK+47vxHR
         YZaBZKHwKCUNv3K+A8IZzbizIb3BTTt0AppO3dYzMTzM2nACT8t/Nn60y1l9E4/5jlVN
         /UbHzGYSbtNKxiMRkv85Gv7SlUeyipKAJQe118OSn4M9gtK8TjUfpbyOy/4rrFxEr+B+
         ikVhiYacZQVrkGMxMFY6i0R+LI+NA88Is1ZONluXuUgxAORwTpn6SaL82RPJTVxY2cd8
         FnevyLCzq458HW0tTimEvTMxY9qly4HzuBGoB0LMnhOSSSNmTgTBSR++QLnwMhtsymH4
         CBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348545; x=1793953345;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIShynWiIS89/lV1Gf1CIiRpO7YkvZ3/xDCYL33Wzfo=;
        b=c/LBLfcS9iz1IxHOFIL+/SjMsA8T4oZgA6SxPGvHPBEivgeBa/qx+oVmPN1BYHXQTN
         2asYyZrsnAUlc5OibIjjPermIerJTncb81C8eqH8FjHCeW0x7VdZrNjm1UEqcHOYWKFo
         Hk7U/FW04PXgikzsvHtM4Hdv4WcdoKt2u6KOTiIs9mpZ814J770PBjjXxtGpgzSXOkIt
         +jCfgKV1dwo/Upb56Z3EDQMorTD3RsL8FcF9KGH3lDbz3hLdu64s0DGqXYVRWN7ukBJL
         M87umLg0Dx+a8wmw1jQcPZkqWaOsi4vGh4PPYRCYmbgeAQXeT50zrBVi5PFeyEzk8FTY
         RDHw==
X-Forwarded-Encrypted: i=1; AKwUvBynZlkDUquLG3FRdF1koFXOp0LFbMblx+cJP3+z4ZH8NuiJH0Y5eIoDnuntiQuSpSXTzfMzdJMtrsztorA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk5T3w6hE8u3oRUZbampmik3VtcmjNKCYx9nHx3G35hRuF1dl/
	YYHtAW5gQ02NvCTwmthIIHqdnRITb+ewEkhOFNCP5rlITA0bG0NQs7qjQvikhg==
X-Gm-Gg: AYBFou2vbNInG+o2oujVjGPD6m1C4TQd1mA349hjfVn+fmRvGWGHGJOINrLeel0r1gz
	Fqvrn6m5gh8G2HxMtoazWAPbySt6AtjE9RoCMqQpjBGuKvKz66ubo8+0Dza2aaj/h/il1Xw+FdZ
	8PQ8s8lI7xBaXV8KtJxO2wZyeR6hZK3ZhPCu6oGK1J4zPpaO5i2+p+/r+/ydEpM1krq01OHRcUF
	aQq4rNwsljlpBgr3T/BfUamhQb9Wet4UzO52Ra4QFiPHQz7vBL78tYMlL9Nh5QUP/A9xzvbuyMT
	6+/gNpGrsyKGyREohBqqqfT8KSO+nKyMWygR88jgBL2CYryGGEscYZVumh1DZTZf8HhBqu3Giwi
	gw9G8s+vJlIPDz2MdV47RxP06ICr6P/HiI4A1o260uUPB2xkzI4lFBVDoykqXQsAhp4dV4aQs+E
	NTA6qAFHGGF4sfgUE0YXp84Cvaj/Qgf9STifyFuCU1/m5FDKwos5iLJYcWBy5BKANtHasP3QlG0
	OSqsPk9oIKuInT/Z2TmwyU3OADOjtTFFotkwVxVXy+zhbnp/AgNt1bE9nNFIOokSIWKfAT8hFCT
	BjTI9F0IGnED3sfWYolnU2bUpKiECK7HdX3myAbuhwW+G3e0qbPn7Ku1a+JO09ZkZwVQZZDJgKJ
	j/XaoGQEgxvMZFxuT4ihBmP7Vzb9XiguWItXn7z9f/OjbAqSINRYPbx//IybvWsNavo+nKP3hib
	uyFSNmAjZ+HSLYVXnWPt20i9G35gR8g3QEENUvVoENiVd4Z9DZ1VB0AFKWS2pfpxuKXyDB+Fu+F
	/2lPjyo4kP3sPC50bRMAZKt8RbQgGN+eZI+jzU=
X-Received: by 2002:a05:600c:5595:b0:4a2:d6cf:86e4 with SMTP id 5b1f17b1804b1-4aa8a7ad60bmr85653065e9.10.1793348544537;
        Fri, 30 Oct 2026 01:22:24 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a1dsm1902966f8f.24.2026.10.30.01.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:22:24 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:22:26 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Eddie James <eajames@linux.ibm.com>, Joel Stanley
 <joel@jms.id.au>, Jonathan Cameron <jic23@kernel.org>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, Paulius
 Zaleckas <paulius.zaleckas@gmail.com>
Subject: Re: [PATCH 3/3] iio: pressure: dps310: keep the user's settings
 across a timeout reset
Message-ID: <20261030092226.000005f5@gmail.com>
In-Reply-To: <20261029220635.18816-4-zoone.rupert@gmail.com>
References: <20261029220635.18816-1-zoone.rupert@gmail.com>
	<20261029220635.18816-4-zoone.rupert@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Oct 2026 00:06:35 +0200
Rupesh Majhi <zoone.rupert@gmail.com> wrote:

...

> @@ -328,10 +327,14 @@ static int dps310_startup(struct dps310_data *data)
>  		return rc;
>  
>  	/* Temp and pressure shifts are disabled when PRC <= 8 */
> -	rc = regmap_write_bits(data->regmap, DPS310_CFG_REG,
> -			       DPS310_PRS_SHIFT_EN | DPS310_TMP_SHIFT_EN, 0);
> -	if (rc)
> -		return rc;
> +	return regmap_write_bits(data->regmap, DPS310_CFG_REG,
> +				 DPS310_PRS_SHIFT_EN | DPS310_TMP_SHIFT_EN, 0);
> +}
> +
> +static int dps310_startup(struct dps310_data *data)
> +{
> +	int rc;
> +	int ready;

A very small nit, but reverse xmas tree.

-- 
Kind regards,
Joshua Crofts
