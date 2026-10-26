Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042298;
	b=zpIHotwQ4xEb1WjIFyL8/tFm0a5RvomhOBNqOh6CP3fT+MreEft2WgML1qBh47ScADya
	 Gz92cTSoku9GsfQQWNJMvJF5lEPaMJDdZy83R1ZUzaf5YgO4IEgNm0uw9L122PHXWKcgl
	 m9z9OAgc/IIqynp7dqKl1QCTBF7XU8tDAeFhxVMWuJvwQoDNglmH6cZDZClEFj+BnOFVH
	 Ppdmw0N0ttkKGwd3d5Ms1qbW+CDyOFusnKYfOeWq+D1che/wk5I5BAXj0iCZV//MwvdFB
	 Pq1utHP3BDIlLNro4Ds0VSHlxxb8S2PvDwW7RA35L8fR4Dr/lgyhtEKN6Z4IRgI2vug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042298;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
	b=40yiwrjSKLQL3Q8uIupFl8ZRnHNTkafXtBpaHsTj2nIoB4AO2WG1PfNj1ez8PybI7JjJ
	 wFmtTu2HvsRgk+EK5h8caf2KfEVLB+qf0e32UnMuwRu/7vacVONdpy9hdj0EUDHd4s77e
	 fKJZ/OsSXEQHuOMajBEn2R48B+1KFt735hC+mWXUmEH4gvWXyeIyVJ9dUCxjSX+4ey+VX
	 xW4MgzZCYfe2X+96O7rSEI+FAD652x/pC2VDBvx851Z1dgZkYHPaDG2IcrWrlhCXRFaeG
	 U46ycLsNiiqlGtHFTL0Ev4WWTn0urAocSoHEmfrf+8kF8jJFzD6YVMwYnKFZO3s96qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=S4MriBoQ;
	arc=none smtp.remote-ip=74.125.224.99
Received: from mail-yx1-f99.google.com (mail-yx1-f99.google.com [74.125.224.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF9A60A2604
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EF9A60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=S4MriBoQ
Received: by mail-yx1-f99.google.com with SMTP id 956f58d0204a3-679a2b5fe87so3163990d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042297; x=1793647097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=NwPnifpnDthMGhTiLntHBvmRIciNbQ8rNpeKQ+BJj2/xeHHLFnj9gQ1L1h8gj7kxGq
         3sGSd+u+pyh2PuUdPUjNL2IP/Xk/2UJ9fPy0eG6j/n4y3n31ytO9/dA/KHRg3Xf1JuB0
         KueAC91V8p8/TI/r0Kfw0knsah0BkNYNb+3tzCdpuq9rci4VuTBDM7vg7f+pBnBdQHC9
         s0I/IoimIlQmqyvmLa0bzRG/zOf0fTbqTKcMmAkUbBrG2edlK1Fne1C8T2d1cRJrqar/
         dxhscJlWtvaJuqV6XfrhD7vF56ubWv8GUHDeDX20zvNYNt7hH7BhLTw4kaL1tDkaNTrI
         1ddA==
X-Gm-Message-State: AFq9FYISfUF3NdwOwMQZAYKfoxo+NJRrYMzjzN4eQ2AmBeZtpZESa8xr
	i1kQnVnGJEvdi5WQBNHF8gACIxMAcP6bnkSgNqeqGW5wR2OJwC8E8uUY6sUWFavvfH0YK8X0r7a
	oGEhP74Kl2BkUuicQ0q18dgfpSdi2Ulh+581SZKZ+d1lVYwKNscV/LY4YYIzi8DJkIE5NOzFv2Q
	OE+Q8UKjzPx7xcBn3xUbK8Nkwbxn6tVWv+pdH0cdDeHwu6V5C2ZtV70Ekhs+Cc7NOLv6QTYZlRM
	WMADferzcObBvPvYqM2eakFKEU=
X-Gm-Gg: AYBFou1qO3Dcc63EUBTv4wx5cngB/uwziEdAhvfK/FI0NVv122YMmH3yCorcyf6ambW
	6tXP5rNIXbvNs9JquOU9RW7pUq3tSOe5Um62N/WcotnrY3Zk2o/xK2kSDlJvFJA3NAGUF1A8LHv
	tvyQc8j5SEwkbFwa9NiFRf4mjYsLfclVzKiR5nxlFNgjfgR86dloCETALKo3URPVEmwPwIewcbF
	pSwIKZUENQXU2CvfzjBbqA4byxHXenHLPRk1CRaPuJJZQB/mon8gQs006zyQt+RC4bN3Hzo4bXF
	NM9AcugAQn+5rNjnjeCLicc+CNphBAgbGA4knICL5p86P8ltRMY7FWteDjR5xqEu+vE3eBmCdNe
	9cRYl0GEk2dfHwveezIByRObCDYjv2ktyghtpo7m/UYjrMNcWZG20Z+vTaYbB1VB8iNbjal+yQJ
	shjyHAKuMAb1fepV4I2IfmQhNfkRLnJuLThABj/iGq
X-Received: by 2002:a05:690e:4808:b0:679:3b0e:3e11 with SMTP id 956f58d0204a3-67a45440249mr3027432d50.109.1793042296987;
        Mon, 26 Oct 2026 12:18:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67a4611f1a9sm102216d50.38.2026.10.26.12.18.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so699013885a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042296; x=1793647096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpNaT8q0SGvIEMd/N1soAJa02WC3uqlIifzAi5jpoGQ=;
        b=S4MriBoQogvcAb9W58quK4VocXvh1bDHpCJk3q08cXXexUn3fBk434Wg82+eNpQiby
         yFHxjeNQuy/NgTN4tvwsUt88ezHzUJI9mIXBj06P4LjtBjOhipbyCqaRQYWkuP2cv40c
         tZGDBmIj/X4B9gh/8VwWDu/XTmG2lT6GdJLDs=
X-Received: by 2002:a05:620a:4487:b0:93c:29b3:3525 with SMTP id af79cd13be357-940ef8e9ad7mr1116013685a.36.1793042295736;
        Mon, 26 Oct 2026 12:18:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4487:b0:93c:29b3:3525 with SMTP id af79cd13be357-940ef8e9ad7mr1116005885a.36.1793042295194;
        Mon, 26 Oct 2026 12:18:15 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:14 -0700 (PDT)
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
Subject: [PATCH v3 5/6] ARM: dts: broadcom: Use noncoherent SATA DMA on BCM958625HR
Date: Mon, 26 Oct 2026 12:16:17 -0700
Message-ID: <20261026191618.3178830-6-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
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

The AHCI controller on BCM958625HR fails with the dma-coherent property
inherited from bcm-nsp.dtsi. Soft reset times out waiting for the first
FIS command, subsequent engine resets fail, and the disk is not detected.

AHCI allocates its command tables and received-FIS buffers with the DMA
API. Declaring the controller coherent bypasses the cache handling that
these buffers require on this board. Removing the property restores
hard disk detection and operation, as confirmed with a diagnostic DTB
that changed only this property.

Use noncoherent DMA for SATA on BCM958625HR, matching the downstream SDK.

Fixes: 56e2ff0346a3 ("ARM: dts: NSP: Add dma-coherent to relevant DT entries")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm/boot/dts/broadcom/bcm958625hr.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm958625hr.dts b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
index a9b6aa04d573..53acae385822 100644
--- a/arch/arm/boot/dts/broadcom/bcm958625hr.dts
+++ b/arch/arm/boot/dts/broadcom/bcm958625hr.dts
@@ -182,6 +182,10 @@ partition@700000 {
 	};
 };
 
+&sata {
+	/delete-property/ dma-coherent;
+};
+
 &sata_phy0 {
 	status = "okay";
 };
-- 
2.53.0

