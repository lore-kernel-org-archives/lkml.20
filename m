Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755F23BCD05
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219390; cv=none; b=Z/LHf+MBm9W7F3ICZsf6kXAZWsXX+HGlf4AC5e/KCeNrGbrnV9lyhTuHItfiz3F85lOOFK0trE6hVjlmrykENINPvlj/e+nqJ0UrV0cTQ6xCBw1wbnVxWnix+4tqAulZvdoAjfD7wSBDgprOS+r5y+MmGSN2yRhg9MHEBinQOtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219390; c=relaxed/simple;
	bh=3H8JaHXZ7KeHJkuUYVZ6lz7owGpxdvcLEIEWKZv7rvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=exCOz772EFF3ThmcwjRFnyG6V6XolAKw4vKK1ie5N9FfdQLqZAleY6S/TDocIGv3acK7mafgQxzUUo8ju3Sn0MfBGx/MZjNNjABpbm1ZWyLLDgw+fhioaKSknWo6AKbmB8lNoe8vS8xc30rmrq09CeKYTpBBg+F8Ui3h6KQd7Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ox7bCNrp; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ox7bCNrp"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ce98cb8165so4668845ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219389; x=1788824189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xl9licwXR/swzm5cX9g5EeWFJilD97YjV5zsf+lppfo=;
        b=ox7bCNrpP49wxiN82zzEgCLBAu+kUyWer6C/Ja0QE+vpipN1KRd7Gw+htF36IB3+TY
         /c6G+bLiDR+X4cq15qgyiGzgyDVfSioxlvC5MfGfl4VP6G4z4lFQd9K5lG1PnIyJ1QIX
         9Igg9RCPxInCV4C3Ycl0rwUWmxZFK4V7Kyb0saVmOZ/9p9DpKA4pGsolvs3ywRmh0NHm
         Hjq+V1siC28H4A5UGAM2ObwWSVIp9e2IQmUHpLXmLyqchRv08quaDJATHazpE+Y78g9D
         H6jIw3wNt9soIO9rj4OF58eVh0et3Qzpf8aCgr/hzUoNlah/F5S/XNRWuGoZjEDoIrTx
         WfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219389; x=1788824189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xl9licwXR/swzm5cX9g5EeWFJilD97YjV5zsf+lppfo=;
        b=evQjfU3ufRhs195xqgrfwbYYgPIciZwFBHY2/OciDlIb6IduzKPGxeIf5zD4dj7Sbz
         jgW27krfSTJ1akPeYVk3CrGqoinzvpjSnyCTHYPLZDW1cSff2xAPB4552v1tReIWvzdi
         dofdkxGLNjNQQ/6/3Nc5F1U/TvSuB09ugq25FVvFncxoa8ODsDpP8VJZd9tMTx5x9DWj
         9Wi2EQLTDHvFMKPSB9M7/NCgKa3DZ1ypjLYmpLXR8DtnuygougPvQ/N3u6DRbxxIHMB9
         m/UtkoEFQVIzSMB09ViCQp2kIc1O52r1H0e5nRvi577VzrrxJJHnryit59S7Q8aLqRy5
         n7rg==
X-Forwarded-Encrypted: i=1; AKwUvBwz2eGsynOgU4f6QzOI3CYklfuzXUu38IttZFBGSOTUgULx/2/p8QDHZcNR3caQTTvfjVQsj3HLSfaSeSY=@vger.kernel.org
X-Gm-Message-State: AFuF++kWHAPE9XlByoiQ3oFftudM2VLOyUA/OXQosLbS9qTlskezluZh
	JmctBFFhVk62EDg7da3vM7B5ZQ652+ZIRAtkzfj5BBFmuCTTogdhdLjX
X-Gm-Gg: AYBFou0IKQ5ok0e55Yr5hhHJUECWdEL1Ez+QRCwBv9IbGLzuj82HXk2rQjJwhTXAPMF
	3eTMM4CRLKtSim4CGR8mOHFoD0LrYFCup6hLKCytqnYjXN7bPEXsVZrnvfbI13b/H8PZ70YPJiO
	CD2SV/oyamBL44A4DXzOoGe08/qCUscJnVuCOhpJ4vEuYW3GAJPm4pFykYGfqeXIxYdhkot6f7E
	ZZ+P0+769VkFjtN+N3Oa7Vjn5PoFYE6e0UhM1GcT67Z6xqGgUbL/3H4G+a+NB0YA3DghVnlikPM
	I1QIhG1QOqvq2c9EdvAiX8ZRE+vJtD0Z4hxIU9IywLIbJOZ/NkXK1lSL1RNnOMMnQHlEb8WYsFj
	Hu3iYtn80uHID0k33Khx8GjsmQzykDQxYP/Kf1AeI0sQCG0i2uiEUpt1ZrMPyaK1Zpm6gO99Hm/
	TFDBOvYEX/CXOYIewWeWWjgVLFOGkB0fUcmDXI08pJUTLaK8MqIjqRekgxuWqRSiY58uATRoGSS
	Ew5pYCnjPQcBuCsGpWShrRewHJQUzY2PYbC4Qehh6l8XAWZdu6YOcHOpQ72ZUvaq3zJ/cK8SaER
	4M6tv49cf0iiBH9eJ16RviY04TFbJYvGQbQeow==
X-Received: by 2002:a17:903:1b08:b0:2d8:ff71:66ae with SMTP id d9443c01a7336-2d9526d32b3mr11811515ad.1.1788219388599;
        Mon, 31 Aug 2026 16:36:28 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d951b52bfbsm3732835ad.17.2026.08.31.16.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:36:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: add #phy-cells to USB nop phys
Date: Mon, 31 Aug 2026 16:36:26 -0700
Message-ID: <20260831233626.13947-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The usb-nop-xceiv binding requires a #phy-cells property; without it
dtbs_check reports:

  usb2-phy: '#phy-cells' is a required property (usb-nop-xceiv)
  usb3-phy: '#phy-cells' is a required property (usb-nop-xceiv)

Add #phy-cells = <0> to both nodes. No functional change.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index e63b8b5e632d..548fb92ca811 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -141,10 +141,12 @@ fan2: j17-pwm {
 	usb2_phy: usb2-phy {
 		compatible = "usb-nop-xceiv";
 		vbus-supply = <&reg_5p0v_usb>;
+		#phy-cells = <0>;
 	};
 
 	usb3_phy: usb3-phy {
 		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
 	};
 
 	soc {
-- 
2.55.0

