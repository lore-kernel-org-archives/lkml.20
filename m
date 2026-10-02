Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557AA3C3C08
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931100; cv=none; b=rFJcqXwSviXy0ndNs8gRqImNnjd1JNxfKaU53mp40zwDmWaeAiI0d3KHiTXcNlWn3KX8PqeJFpqLYETvUOyuGwO7gpDUY0QzjU5PXVydHCsSiNW99cREMhFZeH0miKAPrXf5ISI2UUNpZjMOu8Pwv5QwWnH0qzLq8HpQO0Xhhd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931100; c=relaxed/simple;
	bh=q0+WZWWpbUwk7OaIqFdQLngua7dC6tHeIz40hmGWwiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOEn29O9Pk+1nfy0eCDeyw2bkruZ43nFmPYX6zi/iHd7cheRTsyRB3ChDv76AyCo23Z7Oc8w8MNBvghzEnb3S9xDeDRSVLJjpXgAz7313oKzjrCrkEFkmNjF/tYkSHVORWAkhLuhDwPvYyv9h7kXBgcKUgvUBVcQkVH8bTLkPms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B0MJqgmk; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B0MJqgmk"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0eeda3e03so3212194a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790931098; x=1791535898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cFDRc4rOIO+c40lpmKovemaErB2R9zNLl58jsdIqFX4=;
        b=B0MJqgmkGWHJlResHoCiWH/Rp+ZUFCmpTXmCaCXHjurxxsDBCxMC9AV8/We17NH5QD
         ongB15C3HqsDNFzsxwc10EWzMo86aq79mjJwS+aqQk55VoH5rgf+iPWlNBHR1/4Ux1ac
         usVZr1ju9LtZ9y/V4Hxs7H5nCnF/WO0NSUVhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790931098; x=1791535898;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFDRc4rOIO+c40lpmKovemaErB2R9zNLl58jsdIqFX4=;
        b=F3bYc1NpJD/qQYxrNXHGva2QFDupNgt1s6i7RcBEMlq0qQiwgxyl0BdDIbzjPGZEdf
         k4q492B7vDc6RdSdLw1ww8dZPhGpDLJyrLFKfo/1N41VkzsZ/A5rhVr/N+86FKqOq7+h
         modLjtTCcS7TkggC0g9NTl6g2PpVuQb1C2+1XMKuE4459TDiDUBU6+4JRryJm6TiKebR
         S5ARxT6BBOJVS2DxCoVY/sZvq/ZrD+0vxpjChUYHB1AxyLs03t4XL2hG4hpkZ/7i5vAT
         cwgEmJ06aivDvXOf0PzOj16lAcKzMoSNQtid6HBvEXhBMdRwbFzKM3Yw6mCgGq1cptKK
         iitw==
X-Forwarded-Encrypted: i=1; AKwUvBxgs8zb8E2soSYzxqte1QEUiupNVsJJzm/Kr4htNTYzR+4vtfX2NAeeVXNsV9p8N3Jl2Yav8b3ZnDdaO8s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKuanCG6A7V9CXt3C8lU++uad4B1GIhnfGpXmk0qEYqmbrYsr1b
	sn8iefcepzcS2jOXiEHkdVHHESUDLOiCJZm/VjeEd2SW1QIBCJb2nGIbOy8oa6UyFw==
X-Gm-Gg: AYBFou1hg+3EdHvwkArvWTcVUvDB/HpudPMw/B97sKz9VyWrSOhjuhTE1LOJokuRsIB
	rrE/JEFADTOVa4MKJCF4CpdC9uMSZYZoWv5sr1cBJuruK5B1apNvvQvTI8TikhYm5cFkY7YgZN/
	K+sqqWn+g2N15UWWNmF2DnlYzwwtdkdI+jbqgnQmzjTEJJ+EbnOnooa9mU9BBv8NH9mKDiBn5iW
	dHvzHdMKDICTEmJs9zXSpKQVxZGsXe00is8Hxw1j65tcf5QPem4lDM4FPiyLUIkHNRifcTW6qCK
	xVLklKGYmUOQb8GcCJiUyJ7cAqwUYsPZHpvc+my7QjXD20wr9jCpdZgIJFEKQIEoIiTryj0jn2X
	F4dInzyNvzAKtcdd2ROhFE614uL0jHu2hEVdOOt3n8OOEVvVrJL3vHxHMYpIRSFkGY/Ygp9T1cs
	HZ3r8/8l9tT2fqMm/6SaWt74PBpx1UCCiwUkSkWQ+0K04nIOFC7h8mq64J5pBj6wMrdpa9UzSyG
	QL68i2owxZC9w0Ogp7AperHCz+s5nQ=
X-Received: by 2002:a17:90b:48ce:b0:3a0:cc3f:b93a with SMTP id 98e67ed59e1d1-3a6cdda1a3dmr768222a91.0.1790931097477;
        Fri, 02 Oct 2026 01:51:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:203d:7:eb6d:4917:3e16:43e8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd4bd483sm1024611a91.4.2026.10.02.01.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:51:36 -0700 (PDT)
Date: Fri, 2 Oct 2026 16:51:33 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC] arm64: dts: mediatek: mt8183: Switch to undeprecated
 qcom,calibration-variant
Message-ID: <20261002085133.GA2343595@google.com>
References: <20250225101828.107509-1-krzysztof.kozlowski@linaro.org>
 <c50e114a-bb5b-40a4-ab01-69ee33b984b8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c50e114a-bb5b-40a4-ab01-69ee33b984b8@collabora.com>

On Tue, Feb 25, 2025 at 11:23:23AM +0100, AngeloGioacchino Del Regno wrote:
> Il 25/02/25 11:18, Krzysztof Kozlowski ha scritto:
> > The property qcom,ath10k-calibration-variant was deprecated in favor of
> > recently introduced generic qcom,calibration-variant, common to all
> > Qualcomm Atheros WiFi bindings.
> > 
> > Change will affect out of tree users, like other projects, of this DTS.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> 
> Ah, finally. That's nice :-)
> 
> Regardless of the RFC status....:
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I think this can be applied now?


ChenYu

> > ---
> > 
> > Dependency/RFC!
> > 
> > RFC, because this should be merged release after driver support is
> > merged:
> > https://lore.kernel.org/linux-devicetree/20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org/T/#t
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts     | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts      | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts      | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts      | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts      | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts    | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts  | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi  | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts      | 2 +-
> >   .../boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts      | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi   | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi           | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts       | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts       | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi           | 2 +-
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi            | 2 +-
> >   16 files changed, 16 insertions(+), 16 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
> > index 83bbcfe62083..f2303d9f125f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
> > @@ -35,5 +35,5 @@ trackpad@2c {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_COZMO";
> > +	qcom,calibration-variant = "GO_COZMO";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
> > index 3935d83a047e..13ec15fa284f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
> > @@ -31,7 +31,7 @@ &mt6358codec {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_DAMU";
> > +	qcom,calibration-variant = "GO_DAMU";
> >   };
> >   &i2c2 {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
> > index 72852b760038..b576b974cf23 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts
> > @@ -40,6 +40,6 @@ &touchscreen {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL";
> > +	qcom,calibration-variant = "GO_FENNEL";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
> > index 757d0afd14fb..d64581f35d2c 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts
> > @@ -28,6 +28,6 @@ &touchscreen {
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL";
> > +	qcom,calibration-variant = "GO_FENNEL";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
> > index 6641b087e7c5..d0c98d0aba95 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts
> > @@ -28,6 +28,6 @@ &touchscreen {
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL";
> > +	qcom,calibration-variant = "GO_FENNEL";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
> > index 877256eab262..3a81786084da 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts
> > @@ -14,5 +14,5 @@ / {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL14";
> > +	qcom,calibration-variant = "GO_FENNEL14";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
> > index b981dd31a430..959c4d3d9707 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts
> > @@ -14,5 +14,5 @@ / {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL14";
> > +	qcom,calibration-variant = "GO_FENNEL14";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
> > index 078bc765646f..4788edaeab87 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper.dtsi
> > @@ -22,6 +22,6 @@ trackpad@2c {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_JUNIPER";
> > +	qcom,calibration-variant = "GO_JUNIPER";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
> > index ddb993521bbf..01cd59993a7c 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
> > @@ -14,7 +14,7 @@ / {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL14";
> > +	qcom,calibration-variant = "GO_FENNEL14";
> >   };
> >   &mmc1_pins_uhs {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
> > index 10c4f920a7d8..c939ef3965ec 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
> > @@ -14,7 +14,7 @@ / {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_FENNEL14";
> > +	qcom,calibration-variant = "GO_FENNEL14";
> >   };
> >   &mmc1_pins_uhs {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
> > index c942e461a177..14d03419b92c 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi
> > @@ -37,5 +37,5 @@ trackpad@2c {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_JUNIPER";
> > +	qcom,calibration-variant = "GO_JUNIPER";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> > index ff02f63bac29..c4c08c0f715e 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> > @@ -370,7 +370,7 @@ keyboard-controller {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_KAKADU";
> > +	qcom,calibration-variant = "GO_KAKADU";
> >   };
> >   &panel {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
> > index 2b5a8d1f900e..7428efec95a0 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
> > @@ -32,5 +32,5 @@ &panel {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_KATSU";
> > +	qcom,calibration-variant = "GO_KATSU";
> >   };
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
> > index 75fadf2c7059..a36b6ddb71f6 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts
> > @@ -32,7 +32,7 @@ &panel {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_KATSU";
> > +	qcom,calibration-variant = "GO_KATSU";
> >   };
> >   &sound {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> > index da6e767b4cee..2b283a55f653 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> > @@ -349,7 +349,7 @@ keyboard-controller {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "GO_KODAMA";
> > +	qcom,calibration-variant = "GO_KODAMA";
> >   };
> >   &i2c_tunnel {
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> > index 8b56b8564ed7..00da50a41574 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> > @@ -353,7 +353,7 @@ keyboard-controller {
> >   };
> >   &qca_wifi {
> > -	qcom,ath10k-calibration-variant = "LE_Krane";
> > +	qcom,calibration-variant = "LE_Krane";
> >   };
> >   &sound {
> 
> 
> 
