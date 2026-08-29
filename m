Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B43E1A262A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788016803; cv=none; b=lK68lXUimhk0bkSOc3pnQvWN8esBtlTLKv9edrimkjx3Cg4c4jczkdrTWmNU7mEcEDWIWTf4/dfVRWoK0DEK8QEmJ3S+PeH1pOafsf0QQkWYhR6McNAERnqqw4/pBIaJDT9gDU/OMrMQZygNk54bMS002h4MPF62Xq85pXdelaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788016803; c=relaxed/simple;
	bh=rRUx/95FOy4sgA5H4dvr49vB4SgWTuJknnNRbGFm4LM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TX8EkSFo2e766HYIoZNw/ErmE2u2gqSqMBU18Y+Kiin2Suicer3tt2pEwnC/ebpomDyp1Pup9jOhGzouI7AIW8SVh23Q5VbEmLM0/Twe2qdV27uiZb86xJSbywFsI+pD+R8TPo4hre/CzZZnt5fSmoQ+Qoync787wdhUmpsuIxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E34/S85i; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E34/S85i"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482fc2b44a7so1425736f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788016800; x=1788621600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=521A9KUhtW0cKM/KRBSLU9rkYQy9/A8z8nlm+NiGrho=;
        b=E34/S85iky/B/QElnc9GVft7vRCmV4IjASO9Pg6ZvHXDVBN7cyeq5wRMRqRxtoxbxT
         s9bJ8YJmZK5ZkB2zmBLZA0jHbLup0CkrYbqEwFwbrMI8WSuvgVOdH20Fu2ktlHMYqXPT
         /Xm6Bdyvm0tgXGfpuoCyaNs+/8g1uej0P0R1o4Iy8x86uFqVYHusOqIvj668DWlZv/ej
         e8V6FPlZI0IMayFuHH1u7vLE8bP0XeQ5UJraBoHmcggdaBqqucJmzuXFlDxsiyq7DRuL
         cKJIfI0R2+aCdhPvtj2H7mxedlcjRyoQiYK7xOW7DjXTy2bSiJ7H1STUl41hYmFC5iKI
         683Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788016800; x=1788621600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=521A9KUhtW0cKM/KRBSLU9rkYQy9/A8z8nlm+NiGrho=;
        b=W6ZRMtzEwsXFjOETBhz3X/FGfPx0C7nE7ikYWhTaf/4t0TR2A9U1gnEurdQZozCf9u
         jg3cyRd2IDHG0dNSTUElpQne/xygaayUImbQHcqrctCODnLTV07asdS+xdVoQQCASG11
         Cd/4iEaciKJVp1us6W0FqU8OenhIdO8QyX89O5A5gXAx2woRPsgfqC/2fclWC55YzsoZ
         6eBLiqMa9YmlHD45DiwIhuNO/sByAZcwXXq8zptd4jPhyfIXsddXhPAqCudl7n+BUgB2
         /GMSewHlFCEl+hX+ZJDMuly7bJ2WBf3bOYhKCfT5IscPiE4UOCZDgTldRP60vMD0i8PX
         tXpg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4dk5VeRiQ0bORrqdPDMmV+p8xEOWRDujXvEOs5iTJCEakmp+jKUwUNDkGn5aOXvaDrYo9njqFNfXTyeY=@vger.kernel.org
X-Gm-Message-State: AFuF++kmbKN7jkA7+vSOQdv8BL4RoFReguvVK7S2OPDvKDiXko1PBceA
	aaokDW6YQWvA0N2x8od1Vzqi6lEJOoGfoXkpVyc+6Su03NRf0Ylzna4=
X-Gm-Gg: AR+sD11obI6uWW1ult5TIKbQBdQntJYf7nEWKijlQs5WjlmQbIwsGQtGmusqNGq902k
	G1u0ms/0qImgELWEluQuc4WdWQB9kDSiUCSTX6anafCoijH0sI/n8/sLtjSFaOLyNj7XNJuIxgP
	+5GpD2TTmLWONFo5hg/6NPPc2FLfnAdxzN9ISxUDcf/qUb8uQjlZo5fsXWSRnXaeXhgX9zUlRH5
	nThULjRXmatdVasqC/WQPPbOAME2FAE0Rj6/Vj4HA2f4vpLdMgxuY55FfWOY6ntQfSXTkhKSC+D
	Hrp2EiYMN/2mo5sx50u66gaKUapxhe3/e4Niw+cP8tJ91/COurBzmwtjAiT0iwFYpT4dHnBzA2l
	841hg/r14Gs8FUEjFpRezvB4VosJOSytEE7CL/w3tmphTmzQ+ozRHdcaWe3JUXFlBcHas2dYEm/
	nMVN03DsZCLCU7P5dQ/NrlQC2J5B8RHeRDu3+1dNDwkjAE2UumdSncNzwyUkqos5hbmSM7UAPgY
	+kU0+UV9rDyWJ0eJJ4r3Q6O/iVWLND6IOPrNut8
X-Received: by 2002:a05:600c:3546:b0:499:dbc0:370d with SMTP id 5b1f17b1804b1-49b91c1dad9mr216188385e9.2.1788016799980;
        Sat, 29 Aug 2026 08:19:59 -0700 (PDT)
Received: from localhost.localdomain ([193.160.247.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm38959855e9.0.2026.08.29.08.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:19:59 -0700 (PDT)
From: Andrea Pesaresi <andreapesaresi82@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sam Shih <sam.shih@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt7986: correct timer frequency
Date: Sat, 29 Aug 2026 17:19:55 +0200
Message-ID: <20260829151955.3661893-1-andreapesaresi82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT7986 architected timer runs at 12,986,200 Hz rather than 13 MHz.
Firmware reports 13 MHz through CNTFRQ_EL0, causing the system clock to
run slow by about 1062 ppm. This exceeds the kernel's 500 ppm NTP
correction limit and leaves clock discipline saturated.

The corrected rate comes from MediaTek's downstream OpenWrt feed, where
it is applied to both MT7986A and MT7986B. Since upstream mt7986b.dtsi
includes mt7986a.dtsi, add it once to the common timer node so the
architected timer driver uses the actual counter rate.

Fixes: 50137c150f5f ("arm64: dts: mediatek: add basic mt7986 support")
Cc: stable@vger.kernel.org
Link: https://github.com/mediatek/mtk-openwrt-feeds/commit/6a4c41c41410cd5042ad10c39da6593ba036283c
Link: https://github.com/openwrt/openwrt/issues/24789
Signed-off-by: Andrea Pesaresi <andreapesaresi82@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 9ebc19610..318639a7c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -657,6 +657,7 @@ cpu_trip_active_low: active-low {
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
+		clock-frequency = <12986200>;
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,

base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
-- 
2.43.0

