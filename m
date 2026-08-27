Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A204C6F08
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787853581; cv=none; b=futegugPQlqoYvFhjednPduX1CIFgIz/r476Ft3KsphRyWnXEa23LTrMA628sgwbVv+PaylFLcv7fZlgNForKXu1JI8cGpLGsHvG3iEdVIhTEjx5CNjdZjdZHXPZ9K+mNiRAyvsGo+CuDnzlxnFhgJNAPm6xOHPmdMlNkzLYWCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787853581; c=relaxed/simple;
	bh=fvwOjzjb68iLXfxjnAH+3KiPR2+e9W9RzpwuwKdgZAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YTKGOtPAgsvC8Lnla7F9HYU1IS5lqBPpt8E+6THBOBxIGQ0EJc2xtZ/KhSmScVy9SbbGVSIc8yHkkyfhnPBklV4+iidMDPcjzueN1a0fhYGD9bZu0PgbO5A9XDZilAh2DrHl4fs+6mbv2vdrRfdoc3DK9oWCDRrqztgqyzzQyjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qIcjQZMQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qIcjQZMQ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482ddbc11aaso78740f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787853577; x=1788458377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=18Tf5eq7c7EPz0T/T046bTiRGn0IVK3Q1r6G0x0NgoA=;
        b=qIcjQZMQ0vx+2TabnJY5Y8eTuKK1pBLKBGWNvqR9x1q+mP5JnT8kaCCJnwR78j2pL+
         VPSdNgW9TvbY2IO7xQ7nGaSw1ke0ScDC3QxfE6KZk4j67MdrLZ/VEbxV429jIKyulaZY
         UGUBRBIsOYYAU/Ga9joJxFq5dT7CS4RcIda3kqJHIj7NKMMHS9NFCpUZLkX9vXuqJBJq
         FP9BGZ1XyHOznnG30eIg0Oc/FPKbCBYxQkmZ1cbEzF99JE28hvAAaqmHLDGVvli2IN7N
         k2hvHWis3VTwuAioiDSBrD1+na+6hJbevqkpOl+E2ElyVlkIaZyPQl3rYNlZVkOz/8zj
         0cdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853577; x=1788458377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=18Tf5eq7c7EPz0T/T046bTiRGn0IVK3Q1r6G0x0NgoA=;
        b=sMAakJTl310JA97Z63lXOVCN48N0mp3cU3/wXE6Drp+lalTjh4wEyGE0Gr9g89qfQj
         D64MMkGcFjs4K7rxJBONtejPQ9gLDEoPvjVkTgx+yeoKYR7Qh5xhmCTcm3+I1zY9FtrO
         v/Vxl3oTf5ezN2evly2OZOYopcrtZEH/rM4+Z6GL7DWlxqk8dGoJyEwJlhab4amZYKF6
         UdosfYFcUcByMxo7Ibb/gR3BgDazJlIUPDZ2IHi39nogcU/3rYVm05cCnIsk7yAaIPQx
         4+tPVQ1xuy3WM4arR3eecdc6e/1y9G/hEXeB2VaXZ4mW0IMgOvJsiPtcVUrqk6Y2aDRx
         4XZg==
X-Forwarded-Encrypted: i=1; AHgh+Rqug3yV9SltQW9VUnLZ+GSQgBsGbb5EGA8Zv06twML9UmPeayFrJjeNc8TIOa4ncbE+CdxEszIeZSnlhnY=@vger.kernel.org
X-Gm-Message-State: AFuF++lWz3k+jp9Oj+Tbej/f1csoxKGNjngNP0fqXPEjlqTJAKTVeU5P
	8z8J55A7A/vkFLrigptV6mpLjsiJfhIbU5hwzkEQz8CjRMfB0fkj9YSA
X-Gm-Gg: AR+sD114a3tdj3oFVSBZx7UnSW5u1lfc5PP6TCjHSSkjdjI1Dx3l8yuddX63bnOwlHH
	jETMwwCN5wD/Ph7ilT9lUxrseytEj3jwEbxusME29FuqqUzUCA0TgoUHTLc6VXJ27LdGoojhSh/
	Yyei04aFEBrTxpD/MQbfQ5W7wx1a67tJ4wTMJrONQwuqKSTapvgch14/tlyM7fPBz4SoR04UkJR
	h9t3bhqmSQ09bb6HBU1Y7PALwI6K1K34F5mCuZRcR8jySIXyMdswqAOoblx7kAprwnQ2kkqJ70x
	z0+VpL16+lBZhHO78IsA8OwhRqTbJM+l3j3SKPIXixPldSbysotKK7iTBe+4sLtWXWekO5sE1/J
	ndnK1xOcc0Ky0bVSjiVmWh8tSkXB6m4BI8qKzVRHdAEDMTeXx7qdK1TTHvj6ftkSQbXCIY3A4lW
	fbijkqAeslh1Sh+nxVrBppe73zo4KNAixIYt5iPxnkdYPHcPM+Mdi7EEWEpACmIacCpBLh57mvR
	0l0eRbzPWdrfVQvLd2V+1sILCNVTVQHecHqJz4t2Cj91NuzpBdo4kzx0cujOr63
X-Received: by 2002:a05:6000:4b14:b0:47f:5ec2:d54 with SMTP id ffacd0b85a97d-482f799da2dmr823346f8f.5.1787853577114;
        Thu, 27 Aug 2026 10:59:37 -0700 (PDT)
Received: from localhost.localdomain ([85.118.83.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27a9945sm10272342f8f.9.2026.08.27.10.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:59:36 -0700 (PDT)
From: Georgi Valkov <gvalkov@gmail.com>
To: briannorris@chromium.org,
	johannes@sipsolutions.net,
	andrew@lunn.ch,
	krzk+dt@kernel.org
Cc: francesco@dolcini.it,
	johannes.berg@intel.com,
	kees@kernel.org,
	miriam.rachel.korenblit@intel.com,
	rongqianfeng@vivo.com,
	wenst@chromium.org,
	rafael.beims@toradex.com,
	avraham.stern@intel.com,
	error27@gmail.com,
	s.kerkmann@pengutronix.de,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	chunfan.chen@gmail.com,
	arend.vanspriel@broadcom.com,
	peddolla.reddy@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	gvalkov@gmail.com
Subject: [PATCH v9 3/3] ARM: dts: armada: WRT3200ACM: add marvell,invalid-reg-hint-in-rom
Date: Thu, 27 Aug 2026 20:58:50 +0300
Message-ID: <20260827175850.89395-3-gvalkov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827175850.89395-1-gvalkov@gmail.com>
References: <20260827175850.89395-1-gvalkov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WRT3200ACM and WRT32x routers always report a fixed US regulatory domain
from the mwifiex ROM, which conflicts with the platform regulatory
configuration on units sold outside the US market. For example:
- phy0 mwlwifi 5 GHz, hard-coded region 98 EU mapped to FR
- phy1 mwlwifi 2.4 GHz, hard-coded region 98 EU mapped to FR
- phy2 mwifiex 2.4 and 5 GHz, hard-coded region US

When the system boots, it detects a conflict between the user selected
region and the radios, e.g. BG FR US, and applies extreme restrictions,
preventing phy0 from starting on any DFS channel. phy2 works.

Add node wifi@1 with a flag marvell,invalid-reg-hint-in-rom to the
WRT3200ACM device-tree, which signals mwifiex that its regulatory
hint from ROM conflicts with the platform and should be ignored, so the
platform regulatory domain can be used. This does not allow the user to
change the regulatory config of any radio. It only allows phy0 to start
and operate according to its certified configuration. All radios in
WRT3200ACM/WRT32x are locked to the hard-coded configuration for which
they are certified.

On WRT3200ACM, the platform configuration is stored on the devinfo mtd3
partition, which is read-only: cert_region=EU modelNumber=WRT3200ACM-EU

The Linux kernel sources do not have support for WRT32x. An equivalent
patch for these routers has to be sent to OpenWrt.

[1] https://github.com/kaloz/mwlwifi/issues/173#issuecomment-307879699
[2] https://github.com/openwrt/openwrt/issues/9956

Signed-off-by: Georgi Valkov <gvalkov@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
index 4ab45f294de2..2bf29981a031 100644
--- a/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
+++ b/arch/arm/boot/dts/marvell/armada-385-linksys-rango.dts
@@ -165,6 +165,15 @@ &sdhci {
 	wp-inverted;
 	bus-width = <8>;
 	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	wifi@1 {
+		compatible = "marvell,sd8897";
+		reg = <1>;
+		marvell,invalid-reg-hint-in-rom;
+	};
 };
 
 &usb3_1_vbus {
-- 
2.55.0

