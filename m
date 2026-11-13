Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604581;
	b=Pft22XH56GI0HIfJmBtWjuesojr+cE/MC/nPLcEcnShbZYjc6T4DWHTLQB02Av06Qa5s
	 Tu1/+lLL1Fzol4F8LTZGMsesa0umliZgHCCK2oeDNq2YP5ex7SR5nxmS35KtPP4C2WxHX
	 lWgoGnCsIPLgLoJtenKd55FPNa6GOxfPL2p9UTIbJjxqi6WxrI6DwRE2PLYG2G1okcN8y
	 vZ56ooq3FhT8C0/zrllSGpQbIyDxQ9vdyeMY3V18IWi5oHVlsJhL3YQOOhIiDwFXbUxJZ
	 zo9sQRvuwPa2GDwaYkwqFhggYc7aaSIIZYqeGSE/ne8qzoK+f7PwjoH1V+ccWnmNAIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604581;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=RQ3Vk/jpF+XnFd0d9LPtGNns0WkiwbIRfoIJESI6ZNE=;
	b=L9JWAo3kisADb5ty2/sgz15rKxtiUpp145B5JeqEpl+xpbAV3Wadcajd7Ud/EMPqPY9t
	 B2avUWCYO9jaCpR3qPPo6U3mFLvS9dTF7hwpjKFNTIkesHjAs1SvpBuCNdcRtxPEHxOf9
	 M9gNEJ9cD8BIImmxoN6LPGvo1I07fGlrEED5Bvl7EbJzceQEnFnpk2Rr4o9FAB3BnQx/R
	 80aBTfEq9Ex/hn/kIv+cPsi/XoRCUsLG7XDc50Lorzk8eKdNAaU/g17mlLhao0jgnw7eh
	 JEB3XcWWm/UWwILmlYU1mhp5rtxSJyAylLDCVroc504cnnT8FvA4FUhtkKePazZrDSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Jb6BfITW;
	arc=none smtp.remote-ip=209.85.210.100
Received: from mail-ot1-f100.google.com (mail-ot1-f100.google.com [209.85.210.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9485606A88C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9485606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Jb6BfITW
Received: by mail-ot1-f100.google.com with SMTP id 46e09a7af769-86103aaac12so2031314a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:16:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604579; x=1795209379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQ3Vk/jpF+XnFd0d9LPtGNns0WkiwbIRfoIJESI6ZNE=;
        b=O9yvJk2xrPqGg5TAjAiLQ9bdY9Kx0lBqIPfD/fh/Ov8U41akiv9JEE4V+5LeYxtiib
         gLHlTT8bQzn1gnw6uYaxMsSYkfWuJPv+dqWgG6p5Amx0jsG4+cPr6OcC4CWrSsmZ5HhQ
         KiAhepAXuohksgtqbEpdKve1IMpF8rFomtod3kuzsGHIz9+QtrnF3YAU7XbZ9nHZaPjf
         N8Ze2CUzt5NwQJMzWDNahhQMFm4Xt5PHLjEQCjskoQND3XL+iY1L9I3xfH0PyI575Ybr
         o0/2TUB7uunGLHh+9cJr1Aufq58dB7Gat0J/HyFKdhAKMrM38xEVEOWYqd+XtTe36+ol
         QNgw==
X-Forwarded-Encrypted: i=1; AL+hErGxqhwY8Wx/G5aI0zNIQILJmZAw1hJrNc9fCpe9Vx2vKhEsrRCVT/yTANLRap5HYYPzm6a3TMoeP0tx5kI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n9X6cN8olrvjoAD8sRRiFkj633TMo8U2mTF/i0YuZo3hSegD0
	G+07pulfXLrVs2i6wdZwzMAWBbYONlVp0IbSqIOaCKHaql8F/y0heASJ59jMiWAIAXfy1crnw1y
	ZzU0ECVc96aDQSAXQEUQBSkAJgOll2Nm0yVr9mFWBmKIg8t3/FMczadWgKPOMbrw8U11FitLNeU
	PN0j/GVRAHmE1CvqWDcTDqx05neG/xZqvj1vFymvHLbIl1B8tbqP0Cwf3rG1Z4IWupTFQuh5VvG
	Arklh0UG3rMX5fTihhYknHg
X-Gm-Gg: AYBFou0ATu7Bry5iwPha9YeDQXo/lAFpWxJM2a2eqNn6nDQrVXY/28FV9HdnQBMMx5l
	ktftjD2hHgI7noHaPiECPSbS2m6AZ8o9FNZXwCTQlxfnj+kkhhG5+EtqkfKosQXjAYv6Vl/xBhN
	UaoXrDx4aDbHqlSo9rf2CTdbPpP+vH+++1GXLi9FJAMflzcVrW1heYilNyNDgiqFpnAk9+15k14
	GRlb8F94fbSbQ3h0w9nqevRQtpIJ/qv9XWDaIDX/I/b4NZGnVTEn+i8Mgz/VmJwLea7bN9n0N1e
	iv8CNIib5wFv+MYuAxYp/3dnC2u8YA59qOkSWePdmgss0oBhqTr+yLHBQAuOEV+UPVowRz2eaLr
	QR1m5/8jIjeY+89apbDVvkMTV0RTuGFgWASi81K2MxqGKdeNZ+1aEfXsULwX3cQcjm5n2zcHi34
	4mh1i67CLdteSjUbdmmiVTDvMRL9a5SKEZlDVoFEBe
X-Received: by 2002:a05:6820:169f:b0:716:bf4e:4558 with SMTP id 006d021491bc7-71ab5098827mr2002082eaf.20.1794604579442;
        Fri, 13 Nov 2026 13:16:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-71ab4114f98sm108031eaf.10.2026.11.13.13.16.18
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 13:16:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so296287785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794604578; x=1795209378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQ3Vk/jpF+XnFd0d9LPtGNns0WkiwbIRfoIJESI6ZNE=;
        b=Jb6BfITWlRyjsDPa8qKBUEKle2bAzo3W8WD5Z9o9QJbmoqKRLM4YeIUomRl6X/Q6Ol
         DveSqc4kF6F9ElQG2tbB5Nex0x5LSt9g5vx9GTJ6ZzkfqYky9AYdI9drFTb0zKR5gEzg
         3JIYAaogq7Mrnk7gpR8vI0DqQoGigsL9MBJ6U=
X-Forwarded-Encrypted: i=1; AL+hErF8Kglq/1rNuOam/9V7Nt/epR77+0+EK/cclpc2A3Oz0AseEFU81Tn4Um2WvuXuvD41HczRQ7p+4id75w0=@vger.kernel.org
X-Received: by 2002:a05:620a:454f:b0:945:d3ba:7d99 with SMTP id af79cd13be357-9494bc2d68amr607926085a.37.1794604578033;
        Fri, 13 Nov 2026 13:16:18 -0800 (PST)
X-Received: by 2002:a05:620a:454f:b0:945:d3ba:7d99 with SMTP id af79cd13be357-9494bc2d68amr607922885a.37.1794604577617;
        Fri, 13 Nov 2026 13:16:17 -0800 (PST)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8f92bbsm273474385a.40.2026.11.13.13.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:16:16 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Doug Berger <opendmb@gmail.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org (open list),
	Mlody12 mlody12 <kudzo51@gmail.com>
Subject: [PATCH net-next 1/3] net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
Date: Fri, 13 Nov 2026 13:15:52 -0800
Message-Id: <20261113211554.2058181-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113211554.2058181-1-florian.fainelli@broadcom.com>
References: <20261113211554.2058181-1-florian.fainelli@broadcom.com>
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

The MDIO_CMD operation code field starts at bit 26. Define
MDIO_OP_SHIFT for it and use it to build the opcodes instead of open
coding the shift.

While at it, rename MDIO_RD and MDIO_WR to MDIO_RD_C22 and MDIO_WR_C22 to
make it clear that these are the Clause 22 opcodes, in preparation for
adding the Clause 45 ones.

No functional change.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/mdio/mdio-bcm-unimac.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/mdio-bcm-unimac.c
index 31e396cc9fbf..6df824aba75e 100644
--- a/drivers/net/mdio/mdio-bcm-unimac.c
+++ b/drivers/net/mdio/mdio-bcm-unimac.c
@@ -21,8 +21,9 @@
 #define MDIO_CMD		0x00
 #define  MDIO_START_BUSY	(1 << 29)
 #define  MDIO_READ_FAIL		(1 << 28)
-#define  MDIO_RD		(2 << 26)
-#define  MDIO_WR		(1 << 26)
+#define  MDIO_OP_SHIFT		26
+#define  MDIO_RD_C22		(2 << MDIO_OP_SHIFT)
+#define  MDIO_WR_C22		(1 << MDIO_OP_SHIFT)
 #define  MDIO_PMD_SHIFT		21
 #define  MDIO_PMD_MASK		0x1F
 #define  MDIO_REG_SHIFT		16
@@ -99,7 +100,8 @@ static int unimac_mdio_read(struct mii_bus *bus, int phy_id, int reg)
 		return ret;
 
 	/* Prepare the read operation */
-	cmd = MDIO_RD | (phy_id << MDIO_PMD_SHIFT) | (reg << MDIO_REG_SHIFT);
+	cmd = MDIO_RD_C22 | (phy_id << MDIO_PMD_SHIFT) |
+		(reg << MDIO_REG_SHIFT);
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
 	/* Start MDIO transaction */
@@ -139,7 +141,7 @@ static int unimac_mdio_write(struct mii_bus *bus, int phy_id,
 		return ret;
 
 	/* Prepare the write operation */
-	cmd = MDIO_WR | (phy_id << MDIO_PMD_SHIFT) |
+	cmd = MDIO_WR_C22 | (phy_id << MDIO_PMD_SHIFT) |
 		(reg << MDIO_REG_SHIFT) | (0xffff & val);
 	unimac_mdio_writel(priv, cmd, MDIO_CMD);
 
-- 
2.34.1

