Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812131;
	b=xgh5NbJnQNeslmePvd60KlDiHMHF80u7h9RFWJ0wD1lUSJTh+Pdp4yAsvlOe81QPVz+k
	 W4PVtZUfCP2t2AQFKV5d8qzqstVeBE6diuzLXJAM6k0xLUCLgfyh9HCrH+o9QDQ3C49zK
	 GUeefuxQF8ccWkU2R32+TbiaJbbZqWH9Fy8uFG6S48OkiMsrQ1lh3CaLSXlz9cyXORS7x
	 DkresauYApdujD1NUL8ABIcIA2rd/n5F94uK4SAArwsBGJUmAKl2kvpmgXXoxAecOUXGl
	 Y4hID9Op8A5f0uCPfDyn3uPedWpWezcWtyZGXCeFWDO9REet6uMeEjkz8rT1uON11dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=BggNDxA9KgGk5xDWclBWYSnVWHuMCkK7nhX4rgf+QMg=;
	b=kE8GdFlSaSFoE+fKelmbK3hW3kIyoB9Hdnva4zwDxN1WHw73lLeTpboGIvQyzRZiOjha
	 O+pda7sugphAjIKfsmd+Z5dSDKlSx3/d2TGCzVDr5AOaZY//l4bNxPeohv91Mf2FvbjzX
	 C5jyXvhOvYjX40dyYRsFPDM7+TwnHU+/a63kZnODXUl76sd9tAA6T/AlJ81ggmxTRwkDQ
	 CAbM1Gpd5dELUerQD3FPAEpstoDhcXG+wQULJUgo28mlnu0z+e7K8VdR5ffLQPm0yWgnp
	 MzEfxtGX2hoIf37jSW3Bdj6yE92XpeupPYJ+4ev2qDhcsAMmhpaGwfPwoe5bwyD5yxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMiaVy+p;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7794606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7794606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cMiaVy+p
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a3c08d6928so1478707c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793812130; x=1794416930; darn=vger.kernel.org;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BggNDxA9KgGk5xDWclBWYSnVWHuMCkK7nhX4rgf+QMg=;
        b=cMiaVy+pSe19pMljL1uhjFq4kEbCEUt/o/Iz6C2dTV176m5rucfND0PEf2SEpbbZxc
         PlE025Nm9PTscRp/p6IR7dB+llIsWQ/RxTRQ9DMb3zak2OfQIiH4AzmBia7njqIOqfv7
         +6UkapzksH/qN5zgpwwEDIiJP5Zra4K5wMOpP9dnw6Ut8jFNBtafU9CP3+QcghOfWyuS
         VRs1slNBsFhglrZ5hpyjHicvAlB1cY4yMXpAHrE91rIxMDuYxleL7z7x1/StDrDduXTF
         /8oMWy7fE10gZwzPJXEvuhfC6tma6uCe3q0HDDPSHNL+iHzw782M8oIMqk9jJLuN1MeJ
         mURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793812130; x=1794416930;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BggNDxA9KgGk5xDWclBWYSnVWHuMCkK7nhX4rgf+QMg=;
        b=0N7wV2KSqpkEPmRW/CJC7yIPuxEqpZgjaKkxJoYeOjnBeTu3tL+atbiFHyYcJr8r8i
         D/BflCbnPqd9gy2xTBbQK5IfwcO3fs3OJu4yzr1zxiANXmBfJYQp8CeGum05qB2DH2qj
         lioCSybDXL46WsbtBaIW2ZbJnu63FhofIoqMB/pZK/PeSbcx0n74AnO9wKk2ESmpQx/3
         j6wW7soFmrq+yATQIp//Kc7mUybTYPLK2IdG6r5xa2t02ppn5W22TH/J0bXrh3hsQoHk
         ijZHRFo6KN8TmvtolWcQCW5LHXFSShVlQ/O2BGYNLg4zCpNKEf2V7lmz9eR46QIQXXnZ
         5tWA==
X-Forwarded-Encrypted: i=1; AKwUvBybdNgYVk5KYaXiL+Ml50o2Ddq7o8lVG5kxvJLX1VCa3cM80FUX5lv90q7LbBTsGOPNgDffI0rGV7Cjrnc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mAXONuC4gW1blIsk88Olcp2tpR5Ea73ZLQjKnWiF5NkZRxcde
	sAlE4aXhtoycPl1CzOQuKuv0XoimodCi5I/hRWaOH4xGfSG1jZ1Hagn1
X-Gm-Gg: AYBFou37tatqaLaP6cAYVSbK2y8Q6wlbGMthGR8aCwFahPT3kB88Vz3BBeFv+Rv27pK
	M7lsMGe65TdoYxLW5oZGDP2KYVAy9ZugOPPeKuMvhET2a+RA6hGbYjuKIUQvPoi01+4MJUSUxlE
	tQIRzr1OcM6sRoalNQUwbScuUCcER5rk5G0rOSRBa+S+K7n4ZvI+I1JdgfHsG5QseRLflOkKxv8
	DdvMOjZ3YOpiXpz2PmbgGEtFwZ3R6nmAsGjWp9AkU48IqG6PWGv1rUzXG1YrRe3dyBw4S983niP
	PycovO/me10bXx9cipN8DlEffBrvzboljmrhIDwoGBIFu06aIHwj1k3/knNoHxI3hcjA0W0EGmd
	Vq1Sx1NCsvBvTkOGy46dFmqZfAHLgH5mWT7Iq2C6rtXmvj3Vz91sCRfYuVBZRCVBzaZZVTT7WVG
	qTw2tmT2VaVxRbiJQGMSkQar68CTAZawheHKNVLn0XVyfjrOkaUivMkWS8cQgjhhLFlOLqi/ynF
	u3bZQWOJ5OL+VTBxYK5XGl9oNwQVz66gedmExJzAmui0BNz3noS5UKYZd9v+aNb18HzEE+XKked
	oJ/TQ2uKpdVFBBp7pn4KnOhafTGXK1eCdTPOe5iJtdrYfAqaWqyexDoNRnHrT3DCULkW
X-Received: by 2002:a05:7022:b0c8:b0:1ab:6b10:461 with SMTP id a92af1059eb24-1ac5e3231demr21369464c88.45.1793812128406;
        Wed, 04 Nov 2026 09:08:48 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c290sm9034336c88.5.2026.11.04.09.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:08:47 -0800 (PST)
Date: Wed, 04 Nov 2026 09:08:46 -0800
Message-ID: <219a70bd93416777ae88becb34d8cb72@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liuc63@xiaopeng.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] Input: tegra-kbc - check the pin numbers from the device tree
In-Reply-To: <20261103084135.426629-7-zhugl3@xiaopeng.com>
References: <20261103084135.426629-1-zhugl3@xiaopeng.com> <20261103084135.426629-7-zhugl3@xiaopeng.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Guanglei,

On Tue, Nov 03, 2026 at 04:41:34PM +0800, Guanglei Zhu wrote:
> The row and column pin lists are read straight from the device tree
> and used to index the fixed pin configuration array:
> 
> 	num_rows = of_property_read_variable_u32_array(np, "nvidia,kbc-row-pins",
> 				rows_cfg, 1, KBC_MAX_GPIO);
> 	...
> 	for (i = 0; i < num_rows; i++) {
> 		kbc->pin_cfg[rows_cfg[i]].type = PIN_CFG_ROW;
> 		kbc->pin_cfg[rows_cfg[i]].num = i;
> 	}
> 
> The helper only limits how many entries it reads, not what they
> contain, and the pin_cfg array holds KBC_MAX_GPIO entries, so a pin
> number from the device tree indexes past the array into the rest
> of the driver data. The later configuration check validates the
> row and column counts stored this way, not the index itself, so it
> cannot undo the write.
> 
> Reject pin numbers the array does not have.
> 
> Fixes: 88390243a993 ("Input: tegra-kbc - add support for rows/columns configuration from dt")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> ---
>  drivers/input/keyboard/tegra-kbc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
> index e6177f2bdf8d..f086ccf1a075 100644
> --- a/drivers/input/keyboard/tegra-kbc.c
> +++ b/drivers/input/keyboard/tegra-kbc.c
> @@ -522,6 +522,10 @@ static int tegra_kbc_parse_dt(struct tegra_kbc *kbc)
>  	}
>  
>  	for (i = 0; i < num_rows; i++) {
> +		if (rows_cfg[i] >= KBC_MAX_GPIO) {
> +			dev_err(kbc->dev, "invalid row pin %u\n", rows_cfg[i]);
> +			return -EINVAL;
> +		}
>  		kbc->pin_cfg[rows_cfg[i]].type = PIN_CFG_ROW;
>  		kbc->pin_cfg[rows_cfg[i]].num = i;
>  	}
> @@ -538,6 +542,10 @@ static int tegra_kbc_parse_dt(struct tegra_kbc *kbc)
>  	}
>  
>  	for (i = 0; i < num_cols; i++) {
> +		if (cols_cfg[i] >= KBC_MAX_GPIO) {
> +			dev_err(kbc->dev, "invalid col pin %u\n", cols_cfg[i]);
> +			return -EINVAL;
> +		}
>  		kbc->pin_cfg[cols_cfg[i]].type = PIN_CFG_COL;
>  		kbc->pin_cfg[cols_cfg[i]].num = i;
>  	}

Could you please check against kbc->num_rows_and_columns instead of
KBC_MAX_GPIO? Not all Tegra variants have 24 KBC pins (for example,
Tegra114 only has 11 rows + 8 columns = 19 pins), and the loop right
above only initializes kbc->pin_cfg[] up to kbc->num_rows_and_columns.

Thanks.

-- 
Dmitry
