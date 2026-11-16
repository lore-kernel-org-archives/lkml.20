Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839112;
	b=vT/xezBN9M1rpWZI2RlBVMqgsuiZIaTLqxE8vj2NbGX/130JsY/0kXFRSi2GtBtWW0X+
	 d2l/Ku1Hg/UfG9HiqOoUMWUMbXnhUdG2D2NGA9DslgCEbAf/klAXbP5YDt5CAiqZhy94d
	 oHh3A78TopI4cVTC5u6aTp+uuRdcGtGHg4CaEQLTubQY6vRMdgc0barIah4dHu5CiB+WQ
	 Qqtui4ZwriB5E8N2hUNo0haVV15yNkmC/BshgOTBuuvVcj+VurB7Yl2qxATCKgsAPKhVl
	 r+a+rqlJ15NEAEvpYBRgppWXwLCMMPSs9aUkYnHqWmptxYj0NKW1ms+uQk9FHjfN1Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8droy8SkDbf75L1AVTA69UoLCcieNW/rhnOo3JtrCC0=;
	b=XMvcUJDlII+McaqoQoBMQkSLPw7UfeRmyAAFsqxFtGCXZgq/i+/QJJOmcaeASI33sVWD
	 YDDhG28KV4MHmErU+AMPPUgpTbQSpB2TW8w6fNsXCGmIBP/YBHsar7NEQfSe1HyhmmSaU
	 VZTu3pqYkywSR+TOyCv2oA0QjiaOw2d6ZrYGgG1bAj7Aikk1I9MIz3+izv7Coz99ShQxz
	 HjyQRcJ+w8SmJgcby9uqWcdT/5TEIhv2lsAKD727ecoj7Cyqj3cQ3gEAgQgDPOXA/3eef
	 0A22w5RDYF3wZJFF74yL9pFFjpXvbbvSsvphoRvcUcqvXHyAeoZh8ZwM6rP55WB2ENA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rdnB+/Zh";
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E9A606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E9A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rdnB+/Zh
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so2124019b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794839111; x=1795443911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8droy8SkDbf75L1AVTA69UoLCcieNW/rhnOo3JtrCC0=;
        b=rdnB+/ZhhgSe+IpZn/PJ9byBPBpOFlpUvLmE+fYt2aOnkTzu8B1+Sd5e9h5Xq7pkex
         xQaovwrY+iBOf9WrkUEehBiFNeNohjpXp98vbuT1y9Y+vw+HONLpB+k+wuCPaS7reV5Q
         1o2X3Ftk4/NGFwHjn0PkRJyeiAhKuap1ciJpErLP7PeJm9VUiS2o34EAV2FE768aJHrL
         EIEoJSUMeLpbszTumbIRh2o5vqgpnbhTy3gbEIjfYaVA3nM3wBMdMN1dZ7q0OQovfZpk
         7pat34Y2NdG/bMjTTzEb03QeMiz5Njo7GWUFr8sWVN2NvSQ9EBGXCyF3pUd0aRvd606Z
         kzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839111; x=1795443911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8droy8SkDbf75L1AVTA69UoLCcieNW/rhnOo3JtrCC0=;
        b=fJ2hIIcBuI4cRVeYQRnk1mJJMVk2C0ohRsCTRWSpPOQ0jeJL0qOK4bbVNL1nl+pnAy
         WTbDHpDnwgmOTjyQ5v2qy0ylsAGMXwbACUulliP3OlfPfgH5jGu/BVxPPDltuOCQ+H5q
         7NsHBsxt2/44KFJX7/SzthtoR0bK35vf8tUAKUYsH66EWTAGLKVQXUIWKMV8rsqm37oj
         UygI32N3vmAGaZC2LmqJQA7vhnQ87hnoW1x9oPsoY8ojKZZXX6oA+xv7Fb1im2aABAVN
         YWv8Yinkwk9+flHTcEeH8Qy7kjiEDQQxbMUX+qu9DMjswx2q5l2nXJ9Hmzob4gfXS2ZK
         tOuA==
X-Forwarded-Encrypted: i=1; AL+hErHlHQYNtWzZ9pcDg4/EXyDADLXCSIfsdvW7p/4LprgdVmKBjIPuzVWsZeuy7JCKDwIEQcKgPcy/gDNaTmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lnmW32gE2R0yb6ndikOjxMQ/BnpL5sGoScjBgUcLMB2eCVYMD
	obgdwl9VPJgfFbxJuN9JFBhRHsR61rXFpWEiW8DOUZpEk+iWNkV4MpPg
X-Gm-Gg: AYBFou2Co0N2ScBA5oREP8/8SXJiWYHUTg7+Jdo35/0mD0y45HxBkPOODngtef1vOri
	2BaBXH1B5NiHAnYW+Hk6fEPQqo4WUrWu/lVInLuTIJbTyqp0XQFm8mG/tNFJ3KTCXTnWL4bwRXK
	1iYBCyQg28iJJyFCUtMRpOjRCb9rOb1TAkbr4iU6RqapI/wOUx5/kf0dJdTnSGJe1520n0MWgVh
	ZM6Vl9JY1Gq6+KZMepyCTm6AaSrDU+wuyvdcE6+MKVI0llNZiiP/CHEuyHnN+97PtoRm+eWbJUf
	JzWbtDaqlk+aSctfnI5Gy0Ng6hpbDVhigw/PTLsm26P3CwW+ZBYew2FbryLctscHpqbTsBSJLST
	gvdhuS+pNrsOQCgQq1mCM2XP/nT8tvsV8OEWWW3fWW1M/HnjH4wdpr9Yw4gbzg+TadQDS1nnfID
	MLJiIo//eO/SHPFP6Dl9jEzUAw5vb7cg0GDxFyWgEu55l6F4GGDwSg6EfdTLxLNOQgVHLp98+a4
	QcNDo+1O3BPA9t4UHaV8mifIQcFjjA4nELbdzmgc/CE4vVKkdauImqw+ZMJe3P6mmY154JSsTFK
	GHv6XqupbeIXcOcEUe911OL1wl0rGmwt4fSZzDqGqdfkp9vovBMEV5azdeUz
X-Received: by 2002:a05:6a21:8883:b0:3e2:2234:62a with SMTP id adf61e73a8af0-3f7a84cef9bmr7584081637.55.1794839111006;
        Mon, 16 Nov 2026 06:25:11 -0800 (PST)
Received: from arch.localdomain ([152.175.35.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed2053d26sm3834158b3a.36.2026.11.16.06.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:25:10 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: jernej.skrabec@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	james.hilliard1@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: allwinner: h6: Enable Ethernet on Tanix TX6
Date: Mon, 16 Nov 2026 22:25:03 +0800
Message-ID: <20261116142503.671907-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115171148.37784-1-jernej.skrabec@gmail.com>
References: <20261115171148.37784-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jernej,

> The AC200 MFD and Ethernet PHY drivers and their bindings were merged
> in v7.4-rc1. This series adds the device tree parts needed to use them
> on H6, starting with the Tanix TX6 and TX6 mini TV boxes, whose only
> Ethernet port goes through the PHY in the AC200 co-packaged with the
> H6.
> 
> Patch 1 describes the AC200 in the H6 dtsi: the I2C3 controller with
> the AC200 on it, a pwm-clock that provides its 24 MHz reference clock
> from PWM1, the RMII pins and the EPHY calibration value in the SID.
> Everything stays disabled.
> 
> Patch 2 enables Ethernet on the Tanix boards.
> 
> Tested on a Tanix TX6: 100 Mbit/s full duplex, about 11 MB/s in each
> direction, and the link comes up both after cold boots with no
> Ethernet initialisation in U-Boot and after U-Boot has used it. The
> TX6 mini shares the same dtsi and was not tested separately.
> 
> The arm64 defconfig does not enable CONFIG_MFD_AC200 and
> CONFIG_XPOWERS_ACX00_PHY yet; I can send a separate patch for that.
> 
> Best regards,
> Jernej
> 
> Jernej Skrabec (2):
>   arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
>   arm64: dts: allwinner: tanix: Enable Ethernet
> 
>  .../boot/dts/allwinner/sun50i-h6-tanix.dtsi   | 40 ++++++++++++++
>  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 53 +++++++++++++++++++
>  2 files changed, 93 insertions(+)
> 
> -- 
> 2.43.0

Same AC200 setup on TaiqiCat (TQC) A01; I'll send the board enablement
separately once the H6 dtsi changes are merged.

Thanks,
Jun
