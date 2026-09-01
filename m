Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F126C3D9DDF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788231198; cv=none; b=FwSOMwstEQKhdyRULiOkKkvnCQNboDfo62ZJWsBa5RTvYcRNXQnVEkl6v7Rw8nGS2SKTuaVwLYhGK4a6OR87bgeFVikqmBCdhooga78uh7a08xg5t7qJw5BfbxI3hRiAhR02keLzXiZpl0+73oCu34AgalgJUqebFjohr0q2i/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788231198; c=relaxed/simple;
	bh=OEHTaTAcpQRiynZYruqCpTdYunZ1q+plyEFQSfcW0bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fv+idOjfZNE/hnhQCo3gh8GJY0p0zDJwnpUAu9MvZVCHvH7lujqhUaKsNz3jUivHnjrhODjr5JW8kMVVs0//q/bWrbfiLe8Tzfcb5x4YMlmlJGdPr7yTqsqPVSwua0r0NIsiXlE2OUyVOieb+GNt8VKHNOis/O1ps/qZ+FQs7q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKhl+6DC; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKhl+6DC"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d94c868ea5so8326105ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788231194; x=1788835994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycaVktr9GUautRfaUy5FlWIJEqAYyOLe3etWF2OPKqA=;
        b=MKhl+6DCh3iKCVG8cKb2zBpXPPlyWHPIBi8ztroFMLFY3gXKdcOThADfuhhkphNTVS
         TYV8VP7xuTIyQAVui4+RF3XX4XuEqFrteI3OjMJL/Lt0qDCDiLon9S8McuYqcRTAtkzv
         7ivkYUqYjghozHnzrogCgH5Pi7p86krOUhRNCUr/3hFEhBmlupft47AsZ6ySeMvLosow
         cbu3umWhTHawIlZ+eUDp5P3d37GVFjMwUFA+za7rfAYpYzNzg+f/9o7a0KN7nI22pYZ7
         n5oZ8D5J/p7fsYH0IEcI1or5E65Sa3Z+agpJANp0BxVUNI5RPuWLBNOtMm19v1x4KnIk
         Y0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788231194; x=1788835994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycaVktr9GUautRfaUy5FlWIJEqAYyOLe3etWF2OPKqA=;
        b=bQyl8sOdyjIIXDWUbmAcxDuZUu4n7bGW7pgCJYljUFuO2Sw6Px4YZF/ObNay7Gg/oQ
         +94vpmE8ptE/kcEXy/EOgZ81BE5C00wFpcsSJ+/aT/XsAw2WlVPMUhpYBvgKK/kLXpGX
         km7nZhXgDMXlOkKmMXB5eM2k2ATkuzIlhtqHf+2IAKOCsVgRkM6gq8pUpeeYl1AM9NSZ
         w8l2nuThyiwtCQWLCc3to5Oy1F9Gwca/dvoiwUCFygeC17AiwYu/vKITrNf6kuOBOeMr
         EHGlVu7pQd88rtVU2HdSmW/V8f53+rFNsxqkAEEgzUWmVZwTOG04/9V55e8+dkYHS1qs
         xmnw==
X-Forwarded-Encrypted: i=1; AKwUvByRVnReFOAsSd1NFjEGdCsXK7kS2gj/NHOY398S3OSjtmgGbLbKZU3o6KJZ7eFZGWTIyYoy+wUevLC/4Es=@vger.kernel.org
X-Gm-Message-State: AFuF++mK94nKpEgCQVFOtzCIuu8LbLNZjo6EkPVj92DrhBvc5t6WsCH5
	mxw6rd+aQ8ZnKWl4mme2YO5hGdw5qej/+9Aai/tycp2BNoCYeyWTJS8R
X-Gm-Gg: AYBFou1FU5YsP15SHrT6MaAkT/RwaTexLQPAsiIM2qcghtnBuloqle19xwSGU0eo/dh
	dgbuU4SnYuhiClrN5Vt1nBlIKYmVktGPPQCfPRAn/oJmPk5FvJXxi+xa56L9tN74cTQQqFTLiuS
	elIOvvyjLdnrL4SSiBo8KStHvP4wYv3nK7Z5vFasouojXSdQaijfXzm2royBuMhdjs7JyxUBIos
	ZyHRmGz3SWZ+QWzDchjtZzUak0qIvW2TIiv2sSCyrR3BvqVVJ8UcRnp5TxTvlsj8lZ+Zf6pVVOl
	cx11Rm5QMNxHuHzf0vqoii0kQQx08jTb1oHJ8G4SxfFnVMZ0ixrMIrsPQeRqOg8h+qHa7fshCKn
	/emn/97Y6KstYyq9mH3RhTzvgxg9NJAqkJD9LV6crfuzRgzwG2hgQ4DIr2zQlvhMQBWeuQX5y/e
	ON8wXhJc6OOXz9unpwDHIjMJDsLvR6keMlqO82pdPNL8DYqCjdPlbG9eX/GwgItR9S10RdJMOE/
	nYXrl12IhbpT+ByYkBaIJ2wgc1HTxmZMz1PpUbJ7Og3/w96qpnPD3e993LOzCR+4+Rr9rE4wTJG
	U0468F/hDbtvhpY3m4njTFn7zLH5FOtGbJqQYA==
X-Received: by 2002:a17:903:fad:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d74dcc2d3cmr460608505ad.8.1788231194184;
        Mon, 31 Aug 2026 19:53:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f552473sm37613800eec.0.2026.08.31.19.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:53:13 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: helios4: add Wake-on-LAN gpio key
Date: Mon, 31 Aug 2026 19:53:11 -0700
Message-ID: <20260901025311.955936-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a gpio-keys node exposing Wake-On-LAN on its gpio0 18 input,
allowing the board to be woken from suspend.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 176198d99c26..e3376c703cbf 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -87,6 +87,18 @@ fault-led {
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&microsom_phy0_int_pins>;
+
+		wol {
+			label = "Wake-On-LAN";
+			linux,code = <KEY_WAKEUP>;
+			gpios = <&gpio0 18 GPIO_ACTIVE_LOW>;
+			wakeup-source;
+		};
+	};
+
 	io-leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
-- 
2.55.0

