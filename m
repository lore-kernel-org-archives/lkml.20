Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C03551D51E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 19:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788810036; cv=none; b=nnYnhVO6fMkkKfu+d5c49bl5CFKPhqNC92Pw6IfQuYUX1Ke9ydB1YR/B+vzgaLqlvVg2FjJCYHte0nNcmYaKe026lF6LfngU7UXpdKqtql2oPDJa2VpO3u2jG/8jT/bw9roeFgm3IJ6WKGRXbjugtmLdYZ7Zg43PAAu6YmAChZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788810036; c=relaxed/simple;
	bh=S1oBtUxfx51L+HaoM1uDY8wNWLzal8JzhXXt56gkyZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dxs56Hu7TNmK8ZBPYjefdpaX1WNL8qeA/qw/UKwTzYlnP81u6kzfMBcjhI+bb8lGvWeScNjjmSf1bNgCxOuIUw/0BdxA1dDYWMbStrRNc7Wg7Qr0UbEsc1CWbLBl233wmf7xSiSOvSUQ2BvvvmVFo2pRsimPm6h3BZYD8+UNLTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jVEgcE78; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jVEgcE78"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d032846c95so42314765ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788810035; x=1789414835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UY5V4769IH4Ej/gBFK5P/RDOlj2xF6MyPqJ3qhvhir4=;
        b=jVEgcE78YH4qiQaYjGV7v7W8tZohcnSHjD9tA9ztHlVYoVnjrpYQ1XUQBWr7u/UlLv
         ExcSMv75bGBAfreysi//YIyeR6ss2MH49n9w98IpTVfm65HL5IGdqHlIGPWW0xbmT7WZ
         8vi7mPW1sD2M0KyhSt4ARAc/B6pCmf6bjQeo/oDTyG7ynI1JHWzSMiVxZ5QMOrYcsLmK
         RXc4Zprun8BMUCWH4yDSakRbfIDb33A6tJDYQnPvyoKTucG1deSy9CcgsSwqaQLbuagQ
         EXOVolypQOSJSGjAuME7YjhqAbukA0qAbQnJDaB8MhzzH3XFTQkq2AHymihcU4IgLDfl
         TDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788810035; x=1789414835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UY5V4769IH4Ej/gBFK5P/RDOlj2xF6MyPqJ3qhvhir4=;
        b=if6jMNVfG4T5/J17oKYjP+3/lT2Jkhg8mFvyTMnBNWTJC0NIy/GXwhtXXeldY/JbZI
         6G14oKdH/t9amRkeY1O3xrMX/kIFPlfnjkO8obkK6dnfupsaoEedwaRlobRzBS0w1eBW
         +5m1eL4FuFHc4D1P07p+gTESu6frqeAgTOED45uzzBGws0Ji/W5zzQ1vlTe3ZuRgw6f6
         OYuTl1Y0BTTT6by0X/kyLRo6wCzfRkRs+ebmY6LQgu/o6pCdAR6D9ENGH/fGUJofSMMR
         gHsRHjIWfo7bCIdEgb3ITEM4vdU/Ijq/qYngakMf+TFTuDYSbD2hRhlcxUX4veQCQrrE
         lv7A==
X-Forwarded-Encrypted: i=1; AKwUvBzu56mtJXYT6lfpSfMtK2QTZWBoWn9XMVqJghyF9UxHaTtnCMI6/WRLRX11mtyAHW4ZhJ/eoz6hjrNwtEQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l4DX5H8wr9M9iWMOJbUG2f3TeTeSHxoT62QwnI2BDaX9koLKb5
	xW3PugLOa7abTSCgpLAwtUXe5Nl4IXtHumfHwp94usxsBKRv7zuOyhrgsrSVnQ==
X-Gm-Gg: AYBFou3xI6nrcrEV5tTVqD2qWq9xdM7cnBvFhvU2ToPOt7fWiRajCQKB/XAu1lCpgPx
	2wn/R7zetyT2gBZmpWT7oiQzSTJPgG4Mm44pYgjBMa+TsXXKZHsl0hTHrRCMU1rgqKKI013LrOq
	uBfFbArYYu7J06PKP7kj8VPHCTwSZeH8Ff1zm5x+7GJIq3xCQfgMSE0J7swPb7GosUltV2p+qPv
	VdAQCwUiFUIF7RZ1Hl89zQ7hUcQanPC8eJ6KEyZWnKqNGDRCjbpEBHUsAE832A48vhYAViptizy
	GQJkf8vLtELVJ9J4x7pszhy161aYPIXKV1W0hh+Gvkfyf3tW3sf/wUc4HxHH5J0qcQNYTJHLNMq
	lSMLkJ2dl302l49jRUk6AodafDMxHlwPgRoOqTylITQggc6O9xDsf/M/RWYZ4Ze2u6sCD6kaGcX
	1yNXC2Ft3uFH6t8QShN6wfa8Wib37YWSHx2vdyVf3nlEDESidO9EnNNFCMcZW0sZlVNZNfD5ec3
	K6O3LGDAfAm6ARV5PIKWne+XZ8R8sWlHGco5295IhNRYolQw3JTrkVsTCOA8Y6xcbCaCaJ6iMDJ
	aY0pLajlUgOS45vLS7Odkcepcg5eChehbR1EpZg=
X-Received: by 2002:a17:903:22c6:b0:2db:7269:38ef with SMTP id d9443c01a7336-2db726939a1mr31543325ad.14.1788810034741;
        Mon, 07 Sep 2026 12:40:34 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497e9e5sm47901105ad.38.2026.09.07.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:40:34 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: BCM5301X: AC56U: add nvram node
Date: Mon,  7 Sep 2026 12:40:32 -0700
Message-ID: <20260907194032.20042-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add it and set for gmac0, which is the only GMAC used on this board.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index c80ac16ad949..550cc67f5ba6 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -92,3 +101,8 @@ button-wps {
 &usb3_phy {
 	status = "okay";
 };
+
+gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0

