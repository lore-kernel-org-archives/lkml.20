Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09911C84DC
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789955798; cv=none; b=X8b+QVrWerYOPnDjLcJn1YeuVMbN+byax950Dq6KiSH1Law6Etrw8H9SvAbjrAzWANmoICjfm1UIqachQYPPBgX842Xv8AYxcZONNVUhlFX7yVOMXiHsFKP/F0bPddzM53G81LDtFiiMJzMNuXFxyMPGFy4TswNRO6cPpy1ql4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789955798; c=relaxed/simple;
	bh=kR0GFGBHG6d5S7FTgGsGIl7eHACpc/mLsls1x89xBFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kxIqTuFzW0GvuyCgkB3GFXjf4jBr1tFSI7/pwK7J7Gf5MOztNUs8mRHh8iR7we7jy6CESOh9HBW6DNBiJJOuRGTDg6631YuNQyWsthYFNGOiRUwgjDk+Z2q37efLxl96bw8irapBRGugggBgSaD2otxz6Rp6Kzt5vJrSN4K0EXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvP/S9Cw; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvP/S9Cw"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b9184fa80so2150925a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789955797; x=1790560597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9iPlkY3CknuAFyY3M8TOGdUAXhGOxVAJ6BaVRsWDl0M=;
        b=qvP/S9CwRmx9NmbCSqKy2UpBsxzkdH76BBDcmnb/b8AnZ2mO95O/BFxrlxJmWAqP4n
         ZzYjJdh2ebGOPoB3L+dODBsOZhRWfRmQMXWaeL/damJKRdZkdrpe/XJlH3Bdw125fquf
         /gYVeJBRRwIFCevU+A/oAZWRVdexSRDUz4/B9pSBHhv9Ufz7mRTKYR1g6aOZoT0JvxJ4
         xb8iBBywMxFEJj8xiUI7XR9AIVLha3C66k/bEZmWBC8Hokd8fG2Icf2aknM35Oa0Fbay
         JZ1yHUNuYaNLlrdIMY4kXJtublD0u/OYbeaJSDYh5kFlaWT8W1q2LVnNjcndLS9Pvvhm
         p5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789955797; x=1790560597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9iPlkY3CknuAFyY3M8TOGdUAXhGOxVAJ6BaVRsWDl0M=;
        b=utlmDlfU0nVN3txOgK/mkeOIA2bCYSfJ9/3IPIafeacJuRUby3Jc89eLrij0waxHdx
         bPmXka4gjAe+YOS3EqYCiuIGeF0fsTjRPr5b0dik7p1CtPAqXJCZFntmWF36QIwwYZbn
         crNIkWEbitjJF4DMlWCCd+P8M0NvkDtAickQVIOJirjvZztcEZRg2roxG/pTpzPoesDa
         +qXo6kj0Id9swQRXqA3pG/LD5qc6UJBfvGOCEQDK/3j/FMlpB/38Zost1MSF0nQMkyP4
         yfOVxxLU3ckvxQnR7J71gu1ae1AtQIYoasyNAtdLhPOzzX7kYLl3qo8wH8h+Updf/fJu
         anFA==
X-Forwarded-Encrypted: i=1; AKwUvBzPm1MrZ8wvi4i1vbXG09GXpNy/vguWndYJ5WwrVnSgH8OoECBFatwYIPPBHGKiN/2me1hTsAyuoCTYhFU=@vger.kernel.org
X-Gm-Message-State: AFuF++mUJjrrgmkqsrWLnYAnRj2RqPu2XHegg6oQ0mf8RS+jt5S0dOLn
	nokaWeCeQVOU2zVHEgB841qAJjr/6swBrO7r94DC3y+3IP5iB/o5i0IDBl4uzw==
X-Gm-Gg: AYBFou1Dxw0/bRh9pFF4UUVzoNlNZ4tF/DrivflJCu2c51WC+5SxIMo6SfOAHuH9zLt
	3KN/YTz++lPws8jGjQ37E/OFwwJgXaO+6o670lj7z/qciQzMNlsvwK13KXX35pZjks7IrXmSW1O
	XmdW3QaphIiDkqsrUxO9CAfGwOZIxk0ENbHrMVqDrFR6KvWzjtOEegCBMlGWOceq8slr53t1tML
	hdOYGwQEt/gebli1MtdQUYXLPE2s0VNg5zXLy2QyIix7VtQy0LPVn8+f/eiwYd73qPQJiKEd8ES
	j0tKih1ylYFpoqLVYwsWF7k7hDkfD/ykZjnKzLy4x4pbWsdY1mWqSSyWbLwB8CSt9YIkwLE6C3W
	78VysPgJs8dOpY5K+w0oycIuAxJ22XjVS7o5RdDu33kToW1T16wCqj+UFmr6We8PPp59t1Cg1tG
	alK3AuuS1TkTnSxwOCs6IdjpX4UARdP0tWz3sXrqsEi2jC5sW8MRDr8cfjL0/EIknTayNKlEzHI
	9jc3gNAx1Ed4F8hG+wWJQrawMU8Q+bfxh/KHvXPgBslpI5vAGnwhk4ok8GMtccVuRSMEhShNb41
	PqHgpzMty8SHIJnRgE7lBOWwSSChTp82cV2b7w2AJgGjFtzUwpj7rYDbTJc=
X-Received: by 2002:a17:90a:d2ce:b0:3a0:42a8:b357 with SMTP id 98e67ed59e1d1-3a042a8b394mr2631643a91.4.1789955796847;
        Sun, 20 Sep 2026 18:56:36 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a041b87bfesm4094223a91.3.2026.09.20.18.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 18:56:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: broadcom: rename pl330 DMA nodes to dma-controller
Date: Sun, 20 Sep 2026 18:56:34 -0700
Message-ID: <20260921015634.1044454-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each PL330 device node in the Cygnus, HR2, and Northstar Plus dtsi files
was named dma or dma@<addr>, which does not follow the generic
recommended node name for DMA controllers (dma-controller).

Rename them accordingly. The phandle labels (dma0/dma) are preserved,
so existing references via &dma keep working.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm-cygnus.dtsi | 2 +-
 arch/arm/boot/dts/broadcom/bcm-hr2.dtsi    | 2 +-
 arch/arm/boot/dts/broadcom/bcm-nsp.dtsi    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm-cygnus.dtsi b/arch/arm/boot/dts/broadcom/bcm-cygnus.dtsi
index 07ca0d993c9f..a017e46fd78f 100644
--- a/arch/arm/boot/dts/broadcom/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-cygnus.dtsi
@@ -331,7 +331,7 @@ msi1: msi {
 			};
 		};
 
-		dma0: dma@18018000 {
+		dma0: dma-controller@18018000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x18018000 0x1000>;
 			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm/boot/dts/broadcom/bcm-hr2.dtsi b/arch/arm/boot/dts/broadcom/bcm-hr2.dtsi
index 75545b10ef2f..13bc358adcfe 100644
--- a/arch/arm/boot/dts/broadcom/bcm-hr2.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-hr2.dtsi
@@ -154,7 +154,7 @@ uart1: serial@400 {
 			status = "disabled";
 		};
 
-		dma@20000 {
+		dma-controller@20000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x20000 0x1000>;
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
index 6a4482c93167..5f14cd3ce211 100644
--- a/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm-nsp.dtsi
@@ -201,7 +201,7 @@ uart1: serial@400 {
 			status = "disabled";
 		};
 
-		dma: dma@20000 {
+		dma: dma-controller@20000 {
 			compatible = "arm,pl330", "arm,primecell";
 			reg = <0x20000 0x1000>;
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.55.0

