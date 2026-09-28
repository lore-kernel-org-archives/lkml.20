Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1298F4E01E1
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607661; cv=none; b=YHszPLUR6xnV86xpL9Bb6w2wRS7oRoEVBEb7kZeSdGrTcvZi/+rvib+BjkpP0YImxBSWY6NCEgjwx40ATN8tvdvjdpNbrBY4QiUSvyxr5XgGUYWvPMiZ8p9dzBcbl/hkdCL+vxRTRd4/S8L2Ld6+WpbG7A9SObSO9u1lKK0d2II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607661; c=relaxed/simple;
	bh=GXO6lAFxoFQEwQkkMLCI0y+cMQX6YMSHGHt+/E1eEYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=td5J0OktmFWTjbeXlNIm7OjEXJ7PjrHSlnf71ltCiG44W4V+zEl7nqQ3CSmxsimY7pO9A3qL1iE8KIx2lAqO0IOwuUTDuNPniZie4z+oaUslXyP3sAt9X+kvoKAOyXTylsw4h280246eUKRjMb1aRXfZijC3gR5EUfaf1lWc620=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBpHsL39; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBpHsL39"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffa15f67fso11320945e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790607656; x=1791212456; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PNRLh31Iy3KvKfoOWiJ4SBBap26RwlK370O1RZcEP7U=;
        b=rBpHsL39O+k1l9AUYeSXFOO3t+89j+XWHx09xnFuyUjXdsG9Z5q6AJQVwnwRB88Mo3
         1C+K6IxYtpiGJ24Xpec/jbR48xYBnw9uiql4QOinM7ccOLoqpv+oO4EkqKcvOEKcNzpP
         bJdcNVDAcVtzdNbMbr3gnuAIpH5GunfomdsNp93WNzpliSmpY+kAFTXcj+N8C8t7togX
         XbGwS52OqhH7ApSlregjT7eo9VQKZNRwBAivFTuYBNU42f0VKmi0kAcI8bjMfKZnX9/D
         1BPe7rWmoEZfpxZ4oDgewgtIg7PUhAeE3TyJC+ruhP+9+qcp3fVn/VhyAp5MoKyOybXt
         z0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607656; x=1791212456;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PNRLh31Iy3KvKfoOWiJ4SBBap26RwlK370O1RZcEP7U=;
        b=IvUSFb9lSMc2Q3AOZLsUzbdYjj2dK1Eu9r15WUcb98eBzJjIQfTw105oNUL/95opQ9
         jVlVhihxXRpcgXXsaqDy69ghsRSK15IUQAiyI2LNwY5imyfHXpldPm8zf7HYSs3wZ+U6
         XvyFiJdW8jzLJ4CwaSJ+8FDmE2FoOgQaWirL2twL4+teqe1Q4KFYxgk861Vg6gQ53NTC
         1gE2U96bmvIyDpdqGRo3rOh6Ezq1tv2jmCTk6cXwYNAM69rlYeGajY5MeSopnrJoX675
         5fkVF0HRd1VSSqXDnAbuC2phO1z70CfbN+wYvrWso2Qzazz7NmQvUb/Zg0+uJf500iLx
         Ql3Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7V/AyOw0GX+/S4OH5+NNgG/ez0kWJquSOwHCOA9M8Y5OvYJ84Orlr7yldr97Wk5ftR3ha7tUEbTQNSow=@vger.kernel.org
X-Gm-Message-State: AFuF++n+Wx+UCcWyVT+iFXhWP34cMzDy5DpbxSiFhapVHwc0YDYTBIb2
	gZPBLNSLHcuGxC98XTP+uSSYe0dcKNT0Jd9tCdVNguhhOqTuogiW6mGq
X-Gm-Gg: AYBFou0Z/zwlEyv5Y4w8ZaJZ68HsGmY6hSkydDCeCBhXrCNo1XJQwJHel8y/ll7yTZc
	iMzjvIuZxZnebYCsSmM09N/pIFmKyATLmP10ByxiHNpU4MUsCEu7+NitKsxP4M8YXHxqW27SD7b
	P7h+jXoCkmHokLIge0AS8MP9c5BXtqEoKB5wWGa7ca5oyhgWjjRm+RCojehv53gpYjbbPyu5RKv
	v1YW4hIIu1xwqs+6vN54JffjWg+14i7gyeakT3Sn32nWMn1WSJgL+f5AlGZTaQqYI+UrmzfgCe0
	H/no514+pGlltx3WpGC6cqTBcO6z1vAqQN1t8idTBjwwT/EzuQCH8m05HS5krf61Ey4qC48co8W
	BygA4Pl5JwePMMDPMJjWwORMADZ0K/YeBGY7DHcGthxuz61cUFchZBi8jLDlcKV6YdPMJGRxeYh
	apuQAzDTcW+kN+lR5Tu9m7ivftssXwNuozRlB+YhL4uevUocR9/NgxSvQyWxpGd0v2vXUgfS3xs
	9ghD01gX36hu28Kh0Wh/pP5V5QByLPRghg+uCKQ3pE31rs6Iw8LuxxlpRR7x4Zp5wsRcpE4KWBV
	J0v5U0yrn7CXdWRtDtr+IthgHC49+yULi1XRgTyFIN9voqC0
X-Received: by 2002:a05:600c:3b05:b0:4a0:321:6ddd with SMTP id 5b1f17b1804b1-4a003217170mr61722025e9.34.1790607655941;
        Mon, 28 Sep 2026 08:00:55 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001922102sm151777245e9.15.2026.09.28.08.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:00:55 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Mon, 28 Sep 2026 17:00:46 +0200
Subject: [PATCH] arm64: dts: freescale: imx95-aquila: Enable I2C_3_DSI1 on
 Clover board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-imx95-aquila-clover-enable-lpi2c8-v1-1-9a9755acb8cf@toradex.com>
X-B4-Tracking: v=1; b=H4sIAB2BumoC/yXNQQ6CMBBG4auQWTsJHYNQr2JclPqrY2rBVggJ4
 e5WXX6b91bKSIpMx2qlhFmzDrHA7CrydxdvYL0Uk9RyqK10rM/FNuxekwbHPgwzEiO6PoDDqOI
 7RmvMvoE10gqVzphw1eX3OJ3/zlP/gH9/w7RtH2AAF+uFAAAA
X-Change-ID: 20260928-imx95-aquila-clover-enable-lpi2c8-e71135e91272
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Antoine Gouby <antoine.gouby@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

Enable lpi2c8, which is used for the I2C_3_DSI1 signals on the Clover
carrier board. It was left disabled by mistake in the initial commit.

Fixes: 3f519121e120 ("arm64: dts: freescale: imx95-aquila: Add Clover carrier board")
Cc: stable@vger.kernel.org
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
index 365bce73eddd3..07bf53240958b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -197,6 +197,11 @@ &lpi2c5 {
 	status = "okay";
 };
 
+/* Aquila I2C_3_DSI1 */
+&lpi2c8 {
+	status = "okay";
+};
+
 /* Aquila SPI_1 */
 &lpspi6 {
 	pinctrl-names = "default";

---
base-commit: bf184a29ad1b33bd8922029eb0ca3f2866007258
change-id: 20260928-imx95-aquila-clover-enable-lpi2c8-e71135e91272

Best regards,
--  
Franz Schnyder <franz.schnyder@toradex.com>

