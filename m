Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251724;
	b=x1rXVerUI+cDGIl8kOK0cX2MzCV3o425ECfl4R03Yew4kfgu0eiiIMGCwSNGHbMANu6s
	 cVdhwWY2bHOPcWonRoYNVZ7KR6L6aMUBjc1fRD7RcKonLGwMuBVLfdkgITdmiePZUL+cz
	 zcgK181fBm+urY1R2tWSioYpBl6kDsC0452Jy4sdPfkl9RmjCb8hGuY1cCBR42Yyt3eIp
	 KYM6kBFB3SAS8SXzheP8QOdWrmR8BYcf0BlYZQEA1+tohE00x9FyLyYeN443x7s1dro56
	 NMZkJA5RbSrMecuDC9R/JYrllNPY2R3tseNjZcb76mCGwYzKpuMa5Bp3lGwwbKIGu3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fZHVIr5VM3Vdi5D5Up21cs6aWZnNMbMTKTcUaOf0MM0=;
	b=UuJil23aVGpuKOri3QmC0U+bMsPrqMR1pcOPrb3sqsT4Pvo8V3a4qrESYRjEdeDMKYfj
	 L9TnWauTDcB2rfLLsggPD6nvEPLCtG+VoA59uybaZhFZ+ypRVOSUGZJDbXM4x0aF7ok3n
	 lPvQn56jza8p3UrKRRIxklxTF2Mw6CY1pOW+jL4wYH/DtmwejfgyvNnLDpgbGwQ6fHE+S
	 cxvJeYE2JnIpqUsdSu2F4OtEriRaSrnDH9RLJfHuGYD1e52qdQ7rb+pu0DwVJDAOHTcUq
	 kiZzrLg2LZQP90Mm2Vk0MGxoUh+rqbkqGxudMXNx7cAygTaF7UxEPIFKcSj5qbyINGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8b21OmD;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC300606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC300606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8b21OmD
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso966586eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794251723; x=1794856523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fZHVIr5VM3Vdi5D5Up21cs6aWZnNMbMTKTcUaOf0MM0=;
        b=Y8b21OmDMSSkJP9Tzh0krIHPFzrpRaPrewCuQOc2mZr9BLZuWFE8r8fUaflAt4AMab
         haL1A/lWGiVSri4DXvPSpy+Y6y3y0r9SxhV+FH5JoPTFk9lxrMMNexUyFrBQfxD7q3DI
         kgJE5p7xnxaGaroNTNpsYj7frtb90iUIMP7qi5wSpolcrRHpRngGW7AQeTOcjcFt4ySy
         g+Q/XKKfUvYUMNryS8v69Pwf/lipJkUxFFMshTy45fUrWwqolbQmkq9TnhulI7iTpNbX
         QcQ8RI/P/9I3fwE5zZjmYENV8s4ENgWIcAQWA6msu2yDLnW7qqd1kT4a5+ZaHAHcjgVB
         mNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794251723; x=1794856523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fZHVIr5VM3Vdi5D5Up21cs6aWZnNMbMTKTcUaOf0MM0=;
        b=DMzt4ZoUrq9+lh2JSh7O0+mnKSxZGHzbiYwIDH0i31uFQnkqWkhJ1ICxud8KQkQegg
         PlFaHAp2tdutO3H5OGbguMmp7YyKo3JZfN/1+9ROaCaaLUtApA2IgbJgZ1wwbf79mWar
         sHsuGt4TYM4gCSlyUlxaktD9pMYUZbrPYKPXCUDeXe2u5rMfPun0qk2Fs3piELZbrdZk
         dtAvD0JpLKEfpznRiQFxhnr+4FVLBYZiYpWTQH03mq3IydiG469OsM0R3JSDg333fqaU
         /vOCq7Pe1HJ0L/OUwTzE6k4vhVfRw/eRx0gklv04EUap6Ay8pLvR5OFXt1isxYnfE27K
         fsSA==
X-Forwarded-Encrypted: i=1; AL+hErHuHi3kiOej1t3CatZzKrpCHTxi1PD3rujfoliH4N/ff7jhXR0w7Qd7xzEjQqTooZ95qif3gviGSAOFBBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TCFfzIy8y08YGlD5Yqn8sNBIFA6hQqrvmh6k6LHcT3gla+9i9
	9gQOSyjkZp7Co8EvlSrdcpsX2z9D8JU+7DqnU/OTqiLIpxVXmoaAnqAj
X-Gm-Gg: AYBFou3dcOfCDioDEPekDjgNpTJ89muWHyGve9uNMC2a3DJ5CFQjWiRjU6kvZ6J3hNF
	rqTqDS6LcoDz9XFy/8yjPnxDoNIduXOh9M2YXnRhrnLOzAtOAyEj2qK53XVdmVO5NICR+A6QDua
	BAr0KyySJgcOXMxQlqusg4cE6w2KST8pmgIQsiD7gNWZcYm81/te/j+C5+4vGETZFf8GQrscmh3
	WUpe6QY8j0xx9PMITV2+67dhz+W/2pUcQ9T57OtgX++Op5U/10cfMovzPdX/RenLWIC1QoAfQCw
	xidxp0lhToErgBSkpUv7oGowrjnAsg1cVuv/035xYHTH6Zb1s8McF1esvl82GsT9kskKdtrDsNS
	VSxjbNM15UQNIVh2yu4S2U4TpxH75Ozrn+Amyo1DkRKn6RarJz5WGpHjCZ3gqhmUKHzMIWVbNqo
	GaBuT4cWFGvSO6Iwe/5NNkYENyAocHRGFQcM7R24XwUhbVCbsCoFQR3G3zfyvXzWS8hdwbmw7XO
	ES1wvdVahLfyYpZOCqj/COWmXfmBPeTLzRq0teLDFHO7bF+NK+xc5jWjPLyd0rOQ3kvuVYwJQ0e
	Ui7ObhSuiCfhgsdpcWK3do5os7ZgvQ+IbbabzG2HVzy7ecl/nhrnmaYreKrzOcOhJ59KqvI=
X-Received: by 2002:a05:7022:2207:b0:1a8:ff0b:a4e1 with SMTP id a92af1059eb24-1b3b5fed706mr643373c88.18.1794251722468;
        Mon, 09 Nov 2026 11:15:22 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b20c55sm788478c88.8.2026.11.09.11.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:15:22 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: andrew@lunn.ch,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] arm64: dts: rockchip: use rgmii-id for LubanCat 4 gmac1
Date: Tue, 10 Nov 2026 03:15:15 +0800
Message-ID: <20261109191515.252449-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The LubanCat 4 PCB adds ~2ns of trace delay on both TXC and RXC, but
that alone is not sufficient for reliable RGMII operation.  With
phy-mode = "rgmii" and zero MAC delays the link comes up at 1Gbps but
drops ~90% of the packets; the PHY's internal TX/RX delay is required.

Use phy-mode = "rgmii-id" and keep the MAC's default delays.  With
this configuration a direct link to another 1Gbps NIC passes 2GB in
each direction with iperf3 at ~859-905Mbps, 0% packet loss, and no
CRC or error counters.

Fixes: 6d9430d58714 ("arm64: dts: rockchip: Add EmbedFire LubanCat 4 board")
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
index 0d28c6165..a042aa702 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
@@ -168,12 +168,13 @@ &gmac1 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy1>;
 	/*
-	 * The PCB adds ~2ns of trace delay on both TXC and RXC, so the
-	 * required RGMII clock skew is provided by the board itself.
-	 * Neither the MAC nor the PHY should add any internal delay,
-	 * hence "rgmii" (not "rgmii-id") is correct here.
+	 * The PCB adds ~2ns of trace delay on both TXC and RXC, but that
+	 * alone is not sufficient for reliable RGMII operation: with
+	 * "rgmii" and zero MAC delays the link shows ~90% packet loss.
+	 * The PHY's internal TX/RX delay is required, so use "rgmii-id"
+	 * and keep the MAC's default delays.
 	 */
-	phy-mode = "rgmii";
+	phy-mode = "rgmii-id";
 	pinctrl-0 = <&gmac1_miim
 		     &gmac1_tx_bus2
 		     &gmac1_rx_bus2
-- 
2.56.0

