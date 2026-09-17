Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061024AAC65
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683969; cv=none; b=a++DllEV+Y1LqI58IbI4Y5qBPrugmB3w9Z+F5Mq38pBLK4FSCnQbzLPxmUThtbuU5GXZtymFlecgeY7eYea3twHCC/UiFWXD+3/xHHR0FmJmYdNXhRxU6p1Vn15FsM3ySIw7I5JY/XKZtgWVkq6CcCMPO3RrN7jmqZQXKZngw6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683969; c=relaxed/simple;
	bh=Mr0Y0dokj98ChZU0/4pYo8F8AyYpWmnAH/fRb3co0A0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SFDeITMJJ+/vvQ174JmjWDj8IcWtoaJxW9vkGKhuL7dLJ3plZPwj+h8cHhjqnsfAMujGDkibg07g3cK2u3x372YA9I5UF6nT0N+w7RTrHr/gY5aMJ16r6PSn2nylOubl7PZTv15dey1gurWDobfhk0xaC8hL8vJUvydDzTnCOFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oC8LgU2x; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oC8LgU2x"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso613705e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789683965; x=1790288765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncoRs41lRHgHUmK4It/C41pPHXqjvn/8eqzWfObsejQ=;
        b=oC8LgU2xjn39IginmWjc2+QabWyennIEi9UwxS0P7LMD6hUs2ASov50iqaM/bdH+b0
         WpOSz6WfSZYUC5L26AT3ozMU+kzgLnqWgwzwD0w9kX1+3s2CSqQbIAvEgmzw6ksyEFP7
         qqYWN4A3pVBuLHpbrvfQuIY9ILU7a8bO1Ap+hX5P3PGpsy898V/ME1UgctfCk+fboUWO
         BI8tjCPpjAIVlYrMafb9ekYDDU+eVS4m/q7x0xadMhucd5WZOPfHE7cZ2rHmXEj/AuvJ
         yPOQ4bUeLSjp2JO2pTax1GSxWSMKgBChDvi4qgo5YZNS0c0x/PlSkjlQA3V6ah3oKUIJ
         n7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683965; x=1790288765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ncoRs41lRHgHUmK4It/C41pPHXqjvn/8eqzWfObsejQ=;
        b=V7TSgozCNYPAy97qZuFPuPM0HbBm/IK/RYLG7KwWlcMeGg0MwjVNT8xE/XqoR+h2b9
         lNTVsq+ofKwdle3Ysu4wEZ+I/MncjvmDuop2lI3ZzoBOT33+jp9qzJNE2f5fsPkU130E
         2/ixxcZXxzT2/Qp8pLgv/A0Piz4F9np6nuANBZNAqFw/ONDlzE3KEN+zP5Qa1kmlhxYV
         otykoOFycJZMcrUVjfoPxhLq4E1RTOmO4t/EbrADaU6M88XUoHvQXqXmjr3AWsXdx/9W
         h6KkrQKKNKc/KDrcggdgB2Qny4Wibl29UORQp7vyTjcLWkbJVIEh18rGC22Th0JAbcDn
         v7kw==
X-Forwarded-Encrypted: i=1; AKwUvBwArNcOBc3N72qzgmh/R74Iyaw32fdeSmEc48OHuT9C9IIj/DsG9I7M4NjWasKcnwbcszbyi5vAH9zu3XE=@vger.kernel.org
X-Gm-Message-State: AFuF++nxeR0UUAv6Cq1SF1j9frbgU/OCAMTORHgik0PRviFTqvqT1ZIZ
	0WHFtgLe+L3w0QLgkc1pFuPaWIwrPMyeTpE+JrsgJE3Zt0PmEUGPNpEN
X-Gm-Gg: AYBFou1IqI6lvtEj6vgz94eM6XScpDVKwMtP6UQkHjTG7+zZEmCDwATdinHebRWB9oR
	kfzc/Pgs4Ju2a2FrieIhxl+c7jVih1TWodw0stpBngHazf8KDyV8gAO/oQIXwjfqzFC8qO90l2H
	pee3Y30fHHYwZ+lzyeNVmqEW2AYcTzpvLOYoopqc89oqoaf3OSv/jb6Pg42p/Xrtun1gaz8H93l
	JkG2N0DorMigv/53h4lg/n/Jylxacb0AnOKHEkohLjbPyrbbMgMT4y6f7HehoLvX7B/ax0PwKMM
	GvEQJcTbEwBCecV8c4009YNrcaWmbsO0DY4o/h/p1sKseK9yiajCjuCOlC6vocj1c0NvnH+kGw0
	QYK0PlHJgQ+kf1mFqk6/H4QuxhWY6FXlVNUi+ytzdmJVIjMcfSW29SWAVW2pxqU/1nol7XkNUqT
	ABVDN6SH7KAnorcwLdjencXNmhn4yOdRoYOt3CxuwhBoxRfKBi1+ubYdcGdMq3KML+8ULzYbKFJ
	jlVMas1Ak2iSwYVq3aXJnplVTubRlc3JbNdqTNi0p+JqamJjwCfz5/tOENKqL1GqJC9bIkZBt0t
	CD5YhgCd3lNf74J8AU465g==
X-Received: by 2002:a05:600c:1993:b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49fc56dbc54mr3747155e9.3.1789683964859;
        Thu, 17 Sep 2026 15:26:04 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm5583835e9.1.2026.09.17.15.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:26:04 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v3 3/3] arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay
Date: Fri, 18 Sep 2026 00:25:45 +0200
Message-ID: <827798e569775b16aae6c65ff08e3cfbb2324e0c.1789683864.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789683864.git.stefano.r@variscite.com>
References: <cover.1789683864.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The Ethernet PHY reset signal also controls the regulators supplying
VDDA2P5 and VDD1P0, so releasing reset restores the PHY's 2.5 V and
1.0 V analog supplies.

The existing 100 ms reset deassertion delay is not sufficient for
reliable PHY detection. The TI DP83867 requires 200 ms of stabilization
after power-up before MDIO register access.

Increase the reset deassertion delay to 200 ms to ensure reliable PHY
detection across repeated boots.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index cb7998616a87..c5f0e22f549b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -123,7 +123,7 @@ ethphy0: ethernet-phy@0 {
 			reg = <0>;
 			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <100000>;
+			reset-deassert-us = <200000>;
 			vddio-supply = <&reg_phy_vddio>;
 		};
 	};
-- 
2.47.3

