Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680695;
	b=wOdzK+/TpQ0b6jBuqBRaMHHE/f5xH0c8Fzp49MjZzNOvkgJwhHJPH9UnNFSFSxkSMAzw
	 m2RHXxppmyOIMpI2uMQIpWfOL1/vi4Iu1Mizc+W742qw6tXwjwf6CuTYla/R9Fjq9TbkE
	 RX9fRPpkM3Z+RXzDM3UcEyb4NksxRnMIubugof5nv28boxr4ePFFk4RRmFU6CE8Fr31xz
	 JbWxjSb5VpOxI/Wrm564yzv9+orzW6x+baM5jIOCz4FyqisjKD/b5p87O2MvijlnPIY9g
	 ewVm4TEL/SLTjybuLU97sQWCy1MiDrSoi4CEgyQbeCq4F7JKAAScbxlERFUJKHB9/qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zgiOgJde8AO2Ant4XAq57iC2YxxS16EtAa2Unl+I3/g=;
	b=33lBoNyc++UXjsrwtl/dubKJ+0yKXsXbpzxOleoTK+SAk1ihmmXs7wagRc5I1L3MJjDV
	 z76UVKD+vkAz6t/Pom7UZ7HUDOmBY+DZEuuSQ5NLTDqCarjMDeJWQeVb4rnbZqBQemLXp
	 jubApqA9qDZbUwHsB6rsHt4PwiPbRNlzz/KlwLVvY3mXQbpwyJ+1Ah+/Uvc2xfbo8tUzx
	 7jxuDlHH6R/4fIWUXKAOTvgRbF4EwrE4fOmnZFIWqKwyYlDc/I6Ycj2QDz4kdJv1774PW
	 QiQtU8HagQ27r44K38LTaRhwI0bwLyuwLjJh0TVvFzbVabyuAA6K9/5DTIhbNdLMLDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RoNQqV9j;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFCF606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:38:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FFCF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RoNQqV9j
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso2295729a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680694; x=1794285494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgiOgJde8AO2Ant4XAq57iC2YxxS16EtAa2Unl+I3/g=;
        b=RoNQqV9jBrmKq8aPFdUcTGbhVq76VWe87Mk0rL8irAkCHESNHOA4Uxwferz7yyQfJh
         SJWMN3tlTNiv8tPOeYP9r1CMapa9/kJJVIQpyaVj8d/rM5Joxn/TAlRqQpNSj5fXICvl
         EDvslT7pOQqwACyXNaamHO6m6jd1OzMy6DMpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680694; x=1794285494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgiOgJde8AO2Ant4XAq57iC2YxxS16EtAa2Unl+I3/g=;
        b=Dr/sk6KdpxLngylIF0z1fNx2xAZFHQaIaUKYyIzZqvWOlxxdex4xyiQMDoXISGbrxy
         03BXzqk5W+8essQca3FGoxUTv73JYw01QRO12VvYMaZe4Pk3Rp1xdSKewgxOZ06/Mh1M
         8gZkn6sQYWzzYyT54SsETeiYgShfNtM31v7w+M30X1ZQgPGmxqb5O3avLrvHvv+wvcvh
         i8/l6kanszGrzbEKGlOWhTtb7NYBloYjPVo/Cu0CysCHqw9s7eBYYbApBQdwof1ARg9R
         5q4EoM51jjy0sF33d+aYfZwYoqjr28qA9gPpakYndVu/K2XZv/CXtVhdjPE+6+H7FU8W
         UwIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFJWS5N9VJHTJW6i4Sj1zT80VbMhN9+MynavCZ/cf6RJEbnn8BiPIPvveasR5k+v84c+mJeNfUfyMaFaY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+qs0klI6x+aA5A+au1gyv0WrSqspiXv84Z50CGOV952hYn2Ap
	C3wiJlAVgRQQgYgaIbg0OqXl1iXdhLywjJ24QIVsv6dFNdQkbAYyXBCrFPgrP0REQg/MqH9ETej
	V0io=
X-Gm-Gg: AYBFou1eeeLPeaOm8giWnxlfgngyoNACrjMvIqmiD0Hh2M2ErwBmqwxm9fKmtfnmhH4
	iLslC8sE5hzJcsexeaGAhQwqeXiN97VCFEfTagQmlhscuiE3QK1S4Ztk5txE2KIkUzNwguvI4Jz
	gDr0PYtXi1GNdrToNrklhLhqT39ftyxJzhRC/mSBIzPQKtTV+zKh43mf5G1EQlYUjRlEAxfwcaJ
	hMijZSksDryLqvXbwqrq6amXTI+KLXtb2I7G/kTF4wxZRw1FzbeqWCqoatAerfNNEWzYClej+tH
	auBdRHu3KoteU63Af/rjQks3gkJy0SkfkNMi4IXU7BA9JHgggzNVR+FVmlA2IQfkkedpKRtul29
	KcfSRYlFOikTj+Zw4FSFxVu70RD4pHTxnR4PGK+NQ0QQAnrCZIZsnnn7EqNy9ayct5lVp4DqZvQ
	Y5AA2c9djlojXXYLwj4dOoeoOqOdsG3OaiF1I9qMv7JD0hPOBIhReEZE22S+wXuKT79HyIWSoFu
	ViFNyy61bNLnaR2Bd/Uw/d3VEgIlvjUg3Tt5DKjaJszQnrnUxglVxGOvFQGhOEC6IFGYsQNpCHs
	DLVQcFq0I0HHaZ8tOt7z+xkPabtlCOQKOM8srNK8Mfh9iz6ieoRpKFJ43lrsgTdD2/13JfZgnWM
	jrQZ79yNOWzag
X-Received: by 2002:a17:90b:4b10:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3ae89724b06mr9920661a91.10.1793680694591;
        Mon, 02 Nov 2026 20:38:14 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:14 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable+noautosel@kernel.org
Subject: [PATCH v7 7/8] arm64: dts: mediatek: mt8173-elm-hana: Unmark trackpad supply as always-on
Date: Tue,  3 Nov 2026 12:37:31 +0800
Message-ID: <20261103043734.2179858-8-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
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

Up until now, the MT8173 elm/hana device tree has set the dedicated
regulator supplying the trackpad as always-on, simply because the Elan
driver was missing proper delays. As a result the delay for the
Synaptics trackpad was also omitted, as it was not strictly required
under such a model and delayed the availability of the trackpad to the
user.

The Elan driver recently gained proper delays after power up, with
opportunistic skipping of the delay when the regulator was originally
on. The I2C HID driver gained similar opportunistic delay skipping.
So has the I2C OF component prober library.

Now fix the device tree to have the regulator not be always on, and
let the I2C HID device have the correct post-power-on delay time.

Cc: <stable+noautosel@kernel.org> # needs matching driver changes
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added noautosel tag
---
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 8 +-------
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi      | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
index 1004eb8ea52c..b9e311fcd9a0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
@@ -62,13 +62,7 @@ trackpad2: trackpad@2c {
 		pinctrl-0 = <&trackpad_irq>;
 		reg = <0x2c>;
 		hid-descr-addr = <0x0020>;
-		/*
-		 * The trackpad needs a post-power-on delay of 100ms,
-		 * but at time of writing, the power supply for it on
-		 * this board is always on. The delay is therefore not
-		 * added to avoid impacting the readiness of the
-		 * trackpad.
-		 */
+		post-power-on-delay-ms = <100>;
 		vdd-supply = <&mt6397_vgp6_reg>;
 		wakeup-source;
 		status = "fail-needs-probe";
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 777da2129e77..2c6ec714e117 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1098,7 +1098,6 @@ mt6397_vgp6_reg: ldo_vgp6 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-enable-ramp-delay = <218>;
-				regulator-always-on;
 			};
 
 			mt6397_vibr_reg: ldo_vibr {
-- 
2.56.0.385.gac671c819a-goog

