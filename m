Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2393271EB
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 01:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790990848; cv=none; b=aYT1VNm9+w9CmUvF0r7x9U96R8CRhuB0eBOOi8/nwNraAZmNZq1wvzt1QESYLrwGjcjcCVhC9krVGX7jwVQnnD3vN8cm1xnFqmFVrs0Fh1RXnzIvR+HWVseMJ8gqlrD88iIcpTZv7Emiu39TiGpFV/3KbpBQxWabDvf/s8rn1Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790990848; c=relaxed/simple;
	bh=sAvpzAz2NZN5YAKhznAkiQ3ghITlK/H3MC0boz/bWb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKvxJTzqeb4hJcjf9FhV8r2VgkkugeJUhZzQSzU29inPEe/3RgBV7zzpFv6lIV5i9RdWpNGOvRamYWxOtowoj62YdiRNvWix7dwjGBM0IGOnwjGzvb5lLw6thBj/3+7UbPWUlwoPGznAkxITeQTpfcX5nCqyV1GcnrDjEgOldMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3510b42f4e3so190692eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 18:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790990843; x=1791595643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=luvk4RSDKwxoXOLtb/naS+7NpP4AkbeMINi5BwnyOQg=;
        b=ygGgWKORKBe2UGAVxFOJ53z4Ipm6bmbOLeLhry9vl9zJkk19LKf3uUdM37c22Bj3Rs
         wwOZW4I5ct/7gnUbLXUqZXaZCFfCbLKQ5XmjL4wxMPmP45kUC9tw7XVmg+e0yiVhy/pj
         gv1cjoUNXDOuK27Lprz3Ns/DoNEYKJE76Dwm2dCJ8QhR9laFZdGVD6V1PVJBHs8h78c2
         bCZHGbGCE+h42RNemN+yX0A3V9YfTqyBKIB18B/EEk/Dqz3ydQKo0TBZdW0HGu5rociv
         F4dCLM+xQQYoQ/JUv0f6wi5OdUbSEuS0y1e9U+p2ss5eCqJFM6oCDhziJ5vPRIZDx6zZ
         H/xA==
X-Forwarded-Encrypted: i=1; AKwUvBz4yDWSujHVYrk1q+zxhJw+ZBIbv/EAmtTmmQniebH+VsxZETE3nBseyzhEmkcRwJiM4VxEtd3xjZjLnBs=@vger.kernel.org
X-Gm-Message-State: AFuF++mJ1k/I5n2Qhtyj88ERKKOi661lrK8OgjlkqsC7UoOJf08jalBR
	q+wPNzodTfBmCpUbGoIgfdayTz5+hMH/pntsZHaUM0YyJ8GlqWwclSqV
X-Gm-Gg: AYBFou1qWTS8/IqOxPsOG03k0uqGkJvokufs+jLZaRtzGoMhmFqHnRWJxUUwCsF6kl6
	ckVmU7NDxXD2eYWB83cM/vIPhBIrg4hLWDbWHgeDWLDdKn+xig4Oo9++VdJBgLU6tziQe3rXVIB
	XsGq4CPJ6ZpPbNA2so7KllNOVnOyklBF9autzjUg6077gGqq4UdcKpgJd00W+8Xu3nsa91Rgo4J
	YdA+PFqseXLkZ+GMYXdf5Pt/JamUedYs+IgKvERUmi2BZNd4YVSt2ejN6PcZN8HzDalfVU+7eN9
	ibp/pv0l++DCUurjldujU6cPx6kFmf0P/omiyIyRsHWyxO/3t5loKwR3ivyE1iq4BPAJl0Y2h2E
	0p3aL6UnP1EzulISLepUguUbCvak/qhLMty2JH/YVfEhJKf8NOvCLr0+AxbaRTpTWNjzjey8bzE
	Lg+arnuz4tpegqfxP0TaHgxifUGVW4h24tipCZ1LLbGvHLtScM+rEAcuRQ49tglU6gDyhDeCCo8
	N09AeZI0meL3uOLUmLWREKHnjVCCy0JbhzeY598StQk1j/RDn/l6vk6yZFet/Tcglp5nUebmmfx
	oP0y8C7F3bd4vutjd2lmbSQfBAa4Kl6Q/13oHjsL7D1X
X-Received: by 2002:a05:7022:f51a:b0:151:cba2:effc with SMTP id a92af1059eb24-151cba2f2ffmr1217637c88.30.1790990843319;
        Fri, 02 Oct 2026 18:27:23 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fcec9a95sm1116843c88.15.2026.10.02.18.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:27:22 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] ARM: dts: sun8i-r40: Add SID node and THS calibration
Date: Fri,  2 Oct 2026 22:25:36 -0300
Message-ID: <20261003012534.418820-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003012534.418820-3-otavio@ossystems.com.br>
References: <20261003012534.418820-3-otavio@ossystems.com.br>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without the calibration cell, the THS driver leaves the sensor
calibration registers at their reset value (0x800) and the reported
temperatures drift from the real die temperature by a chip-dependent
offset.

Add the SID node at 0x01c1b000 and wire the thermal sensor to its
factory calibration at eFuse offset 0x40, one 16-bit word for each of
the two sensors.

The R40 user manual gives the size of the thermal sensor key (32 bits)
but not its offset. The vendor SDK key map names 0x48 "thermal_sensor",
but that word is zero on all the boards checked. On an A40i running the
Boardcon vendor kernel, the THS_0_1_CDATA register holds exactly the
eFuse word at 0x40 (0x08780875), which confirms the location.

Tested on two Boardcon EMA40i (A40i) boards: THS_0_1_CDATA now holds
the eFuse word at 0x40 of each chip (0x082d0822 and 0x083d0838) instead
of the reset value 0x08000800.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
index f0ed802a9d08e..c7c9cad695ca4 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-r40.dtsi
@@ -485,6 +485,18 @@ ohci1: usb@1c19400 {
 			status = "disabled";
 		};
 
+		sid: efuse@1c1b000 {
+			compatible = "allwinner,sun8i-r40-sid",
+				     "allwinner,sun50i-a64-sid";
+			reg = <0x01c1b000 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ths_calibration: thermal-sensor-calibration@40 {
+				reg = <0x40 0x4>;
+			};
+		};
+
 		ehci2: usb@1c1c000 {
 			compatible = "allwinner,sun8i-r40-ehci", "generic-ehci";
 			reg = <0x01c1c000 0x100>;
@@ -832,7 +844,8 @@ ths: thermal-sensor@1c24c00 {
 			clock-names = "bus", "mod";
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&ccu RST_BUS_THS>;
-			/* TODO: add nvmem-cells for calibration */
+			nvmem-cells = <&ths_calibration>;
+			nvmem-cell-names = "calibration";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.55.0

