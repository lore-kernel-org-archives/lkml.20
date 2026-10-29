Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309138;
	b=WwGtNZNQA35ngtl/1VAzwyljUT3avgbY6eK4cL9c9NkBIB9TTdtN33CxhU5aGq+Xnbz5
	 KTfBbFabHKCjkTek1VmeBfvuitGNidie4mSZKlQlDELeAKmir5/yO0ONDoUSQJrETh1Yx
	 Nil4lfK3wZGziTYdd5YmovXmSpoWv5ZoiMkrgeH77wu9TEUjLUAlhW3/3hg071bVpbT0c
	 e5/8s1baqpyGbmlZ8XE6w1oihPHvBG8a9d4W5XhIu5Bvc6u2F+qdyGYW6zL8eSy7aYM6r
	 WDqm7RHMfUtaCp+1iCLCeEZEafwhzmO0ZJETj4ULYcZZQYengef5GqHW1KAxW0S9+CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309138;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
	b=FrPFLpZlGU/H7RX4zkJjfyoBC7Kra8oTvUG4TEiOzr7GylWmeB6NFCdEVtqGzPc34YfR
	 AA9N4UunABEBmMEldfHSaTTPZKzNpHR1WRSBBMKgN8QWXmTvOA8VokaSo/sbiJRnyQSJj
	 VnKKCPwSsdTAWxW8sSaaeKU7HosZjwk6gcNRftFq0fZIqB9nd0kByWOlT8/LeXs1Im9ut
	 sK3twJyYxtvdXHCVViN/LfGBnSDSHaw8uI4q08XvhQUE4HWVUOUmuNLfZNRYeMG1pRv8l
	 g6s/LZoG+GV8VhzKnfPFSg4yBoTMrhy+RwvPFE15tgMm4lpYiAaQToJ3va0VS1bZQwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bFHPBXlr;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984A0606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 984A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bFHPBXlr
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so33484a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309137; x=1793913937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=YlNkYLJ6LN4yrQvOSz9w61+V3K8J6nhJ4nX5OTm2EeGhTIbNLEA2iesqo5gpokcJnx
         Lxtl8xW4tAWKdXyKZOmmMX49cpObnRnQRTB4vOIpuHqEiENcK9bxc0w/9H/0ybBJRHWl
         Xj5jkyhthsI9RxnenGLdiS21BxFCuLoZLHyaKzK/9DU1P2vS39Ezo+TTmnsZgv245V6m
         C2sfo4s5WHea01KdISwE0+RtzkfEL5RO4VJUQWhPryEf8AnFT1q/DC0ZPBugA0xHHryy
         lj4MVgLDX92FOIs0mYHWVBYKrq3X9N4eSOFm130j7bkgMSwCjZVbAobtL/6JJM6L5YIN
         zdpA==
X-Gm-Message-State: AFq9FYJeXzSDIxAZIo29Oz3it4VVxIR5nrBkB2psobjdzBMaY7uEZosM
	+cuhhWRVr0Vq4KM9shJCEMZvJN2xX7Zb2GpxtiXcZjI+PfUjEEHPO1j4ZKieAWg7hNeTZA2bX89
	qmn+Gx9H5XpCv9WblfNo8IuMC2ueWpd2acgBeQsWA7EJf9XpIJd0bCXjoUBa1PqMDko/izaWyvN
	1My3RptsLcExT1oj4nLkS/v9ovzKXH37xskKEU5WDgodYycnXnTPqXWMB17BUZQnWcjgba+YbjP
	tFEAxcH3idZDMZ2ipmIyxD9Dec=
X-Gm-Gg: AYBFou2gn+ltS+FQKUgbpkbq0/qYLSzwd8fvhadYywvLJBNvapKeaLB50UMBRH+SMbO
	mqZD5vBSkmKSoBKS6o6iVm158RTo/jnaGLv11/HcWzznpQ2LCg8wDLAbNcDq/Z6JWbVkRP1g8IA
	qlE6CnHjhHCLeykXcQ2kUOQPp6AwOZgptPlXT4slivGWxQ+n6twuKxZ+9jej/zbzz6DLwuCG1Oh
	bobxq7xxjkTz0SrzEldziQHaIAfmydeLry6kYotCBTeglSPqBK/H0G6O5ZlSHibkMm7n5TRCg9E
	BJXN+HTdnDKkhE2jyN92v1b6Saa+G1XOpEPOnGObbgHl00Luo1Gr3AeCChgheadDif/l5a3Y/9g
	chb1HiyVapQwFjoeTagbAQHOW7d+UD0oMOoW8yWje52Eim8K4dYDb5B/Qm/arZjg9sqyKCMuaee
	vcjU6bmzCrS0559K+3tyWqpf0eq7VW3kauCBVd0NcQ
X-Received: by 2002:a17:90b:534d:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3ae898392e6mr182885a91.51.1793309136982;
        Thu, 29 Oct 2026 14:25:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae88034c2dsm108225a91.3.2026.10.29.14.25.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c7cb9e267so1032176d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309135; x=1793913935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MIbl2zx8FaPW7oX7ST7fbgJ9gFOgJZeuRxXV0E1qzg=;
        b=bFHPBXlrCZqeSrza6y9QN/PCksgH3GlMFsd0qYxVx2yWQRFasH6roXUKzbyfRvd8ah
         97E3wRJmHt+zcAoPnSwWQ8Z+AuXDKYp4rNmCwOwkgVI4Rc5ts2zKtGASHV3zriPn7bJ3
         UW2fT8u5h/SXTFZUAUnGfmLt+WbqWsgLa6eOQ=
X-Received: by 2002:a05:620a:8385:b0:93e:48fc:aa88 with SMTP id af79cd13be357-944217118e3mr84086785a.44.1793309135651;
        Thu, 29 Oct 2026 14:25:35 -0700 (PDT)
X-Received: by 2002:a05:620a:8385:b0:93e:48fc:aa88 with SMTP id af79cd13be357-944217118e3mr84081485a.44.1793309134993;
        Thu, 29 Oct 2026 14:25:34 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:34 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v4 4/6] ARM: dts: broadcom: Add the NSP SATA IDM registers
Date: Thu, 29 Oct 2026 14:25:11 -0700
Message-ID: <20261029212513.4126083-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The NSP SATA description omits the IDM block at 0x1811e000, leaving the
interface clock and core reset dependent on firmware initialization.

Supply the IDM as the third controller register region so ahci_brcm can
perform the downstream clock/reset sequence. Extend the AXI bus range to
cover the complete IDM aperture.

Fixes: 8dbcad020f2e ("ARM: dts: nsp: Add sata device tree entry")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
index 6a4482c93167..9dbcd810e27b 100644
--- a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
@@ -168,7 +168,7 @@ periph_clk: periph_clk {
 
 	axi: axi@18000000 {
 		compatible = "simple-bus";
-		ranges = <0x00000000 0x18000000 0x0011c40c>;
+		ranges = <0x00000000 0x18000000 0x0011f000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 
@@ -538,8 +538,9 @@ sata_phy1: sata-phy@1 {
 
 		sata: sata@41000 {
 			compatible = "brcm,bcm-nsp-ahci";
-			reg-names = "ahci", "top-ctrl";
-			reg = <0x41000 0x1000>, <0x40020 0x1c>;
+			reg-names = "ahci", "top-ctrl", "idm";
+			reg = <0x41000 0x1000>, <0x40020 0x1c>,
+			      <0x11e000 0x1000>;
 			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.53.0

