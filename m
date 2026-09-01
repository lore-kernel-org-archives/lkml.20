Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABF626738C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788225227; cv=none; b=VvxV3nYpWtOTp2Lr+mCVroY3ldE/D6KSZvASaIQqkmjVnh1SBMQnioE7SxJ6dyQ4P3FYunKSeYW6FGtYeekkIz8jftbbHG439iDekPvm1asAAQLFgLAUVDww2Z0JAz7nAdNnkT+VJa155OLJ4YF0+h+Uizc+0MK0hCAzX296IWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788225227; c=relaxed/simple;
	bh=6MU93lD7oPCvVgWA1NeStXtYPktufCBo3mj6HDbyAGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=afF7GeJtEnQUT88w/BjlZh54YCL2afa2cx7Mz34RlCeIlthhLKdOwYnrooqUbuAquc+D1ND42GygnWDxGvux4Mx/9RGFxVrYG06OoWDusx9r2ifU5YOAt+G1nFo1q2dQik05usknJvDXoPPpxvctOIZZmn4At82nqjuMNAsHN3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=xavhA7YA; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="xavhA7YA"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-930f618435cso362701285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788225224; x=1788830024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y08cvUPAERT8DtacgubgZYXObs4Ve5NXsThRcrzdsK4=;
        b=xavhA7YADyS0y7zPAa/fYaLchuSN1gH/eSjP4m9qT/go9icu306dzxGooqf6+jyjV8
         9SYrEFNK1GeSDKiafUERFvPEoqfSpXorrckVa4nyu5qOto+mspMpb2oq5sTK6xgAYtX0
         dRnUNjM4tGGWrbK+jvZ24NDNlTMIigWt11/pKQear/A962//jLUqDc6NQ89ErOpQ/6WN
         4KEbG9336UVO3657LS2/C4N8CZuiJE5uFCgcrO3UaKRy/FSCu4xkWKp/7n/vcq1/+cTN
         gYwUlVReVCl5iKhgK5y4muNboGcf+CzpeKKiHzhx8EFvCzaWS96HGmHp6W9V8sLVUpoE
         +nlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788225224; x=1788830024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y08cvUPAERT8DtacgubgZYXObs4Ve5NXsThRcrzdsK4=;
        b=Ggy60K25tqMGNhjWH3vmAusRNOTsQLSEBnR7tgMjX2SuoL7JhujNOSURTl6OF6qio/
         82oVg08O9WWap891aXtcnF9sSgbHw0goZKdblJ+d+oudCplL6o2+tpPmmgdxOJtzwYfw
         UTNqemdlBzZW+aLgBXA1oNxoIhW90lLPFe3FZETnqV5JcpMvuoMj00d9lAFEySU7VPxy
         8EuSpR1lGQPAudDra1GXEgSV8vvCxhouCjU7YqMkRWld/KcupLYb7XJWf+/3JOQxxu4z
         KXFeCd+9+8JkswSoAD8gF+nxhJe6sMEgtpMmpjg1IWoQ22BGpCYj5GQHZe8W0hTbBSiY
         JLNw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4Ub0g7tvH79k8SYsk+xaIUX1/WpBSuct8URq2ggIBWmDoCdqsHnp6tDSJIFMRS29sfAoXZ6Le/qd5a9s=@vger.kernel.org
X-Gm-Message-State: AFuF++kdbPoIWNDqaTqs7mxyCHM7+PUn8sDVxCUObYN4LS/qwKs2sCmO
	gs7pQGSvDktKbY93pkY5zF3jhsMowpo6Yir+EGxjn+KCLux00NAWlCt/sC6U/7zUsVQ=
X-Gm-Gg: AR+sD11qMMEiN9OaI2+yATh7kq7GFselhI6Hfnmyyf4ARVQ246oOniZFmFyCZiBBS4Y
	8AEElUNrd1g03hntYrEDxJuK12sANH7uR7YtZ32I20rHNJh7vwHJkoGNnF5c31PX3II7yNNZ75F
	Q/K1T6hrnLI0YadywaiSTq8XenSlIkkQiWy47BJ44b9v6i+tqQY9CsJOYE+62FZkKL591dB2/Tw
	xtSBEBb9ol2G34dmwEp5cR9Zaz2nvY5HDOR1T1Cax2N+oy49rJLNI2YR61acQnTcbZM4Giy4R2k
	P8pfw9lz36LwUHD36PtuVIcQXZ84qOCeJrsCfvugF0m40eOUY5QztfOh9Zhnj4keUy2gaKLoNRx
	a0duDbs+PYPnrUXNilaEeHAcrZNl9rXOKgu7r2BdqRcrX4f5KCwXF/PQWxc2ip6NlUIVSr2B4gl
	IejRW941Z+r/r8Hgs/GhLSViPDmPWPPCAPG7RyoAz67F6vqUaorb6l0tDXMAXyPAH8
X-Received: by 2002:a05:620a:2991:b0:939:36f3:fea8 with SMTP id af79cd13be357-93936f400d5mr1392214385a.25.1788225224521;
        Mon, 31 Aug 2026 18:13:44 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9391740a307sm581347285a.42.2026.08.31.18.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 18:13:44 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: bhelgaas@google.com,
	robh@kernel.org,
	saravanak@kernel.org
Cc: herve.codina@bootlin.com,
	daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] PCI: of: drop the reg_num argument to of_pci_set_address()
Date: Mon, 31 Aug 2026 20:13:34 -0500
Message-ID: <20260901011338.1323243-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901011338.1323243-1-elder@riscstar.com>
References: <20260901011338.1323243-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reg_num argument passed to of_pci_set_address() is always zero,
so get rid of it.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/pci/of_property.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
index 75a358f73e694..505226b876c56 100644
--- a/drivers/pci/of_property.c
+++ b/drivers/pci/of_property.c
@@ -52,7 +52,7 @@ enum of_pci_prop_compatible {
 };
 
 static void of_pci_set_address(struct pci_dev *pdev, u32 *prop, u64 addr,
-			       u32 reg_num, u32 flags, bool reloc)
+			       u32 flags, bool reloc)
 {
 	if (pdev) {
 		prop[0] = FIELD_PREP(OF_PCI_ADDR_FIELD_BUS, pdev->bus->number) |
@@ -61,7 +61,7 @@ static void of_pci_set_address(struct pci_dev *pdev, u32 *prop, u64 addr,
 	} else
 		prop[0] = 0;
 
-	prop[0] |= flags | reg_num;
+	prop[0] |= flags;
 	if (!reloc) {
 		prop[0] |= OF_PCI_ADDR_FIELD_NONRELOC;
 		prop[1] = upper_32_bits(addr);
@@ -131,7 +131,7 @@ static int of_pci_prop_ranges(struct pci_dev *pdev, struct of_changeset *ocs,
 			continue;
 
 		val64 = pci_bus_address(pdev, &res[j] - pdev->resource);
-		of_pci_set_address(pdev, rp[i].parent_addr, val64, 0, flags,
+		of_pci_set_address(pdev, rp[i].parent_addr, val64, flags,
 				   false);
 		if (pci_is_bridge(pdev)) {
 			memcpy(rp[i].child_addr, rp[i].parent_addr,
@@ -164,7 +164,7 @@ static int of_pci_prop_reg(struct pci_dev *pdev, struct of_changeset *ocs,
 	struct of_pci_addr_pair reg = { 0 };
 
 	/* configuration space */
-	of_pci_set_address(pdev, reg.phys_addr, 0, 0, 0, true);
+	of_pci_set_address(pdev, reg.phys_addr, 0, 0, true);
 
 	return of_changeset_add_prop_u32_array(ocs, np, "reg", (u32 *)&reg,
 					       sizeof(reg) / sizeof(u32));
@@ -458,7 +458,7 @@ static int of_pci_host_bridge_prop_ranges(struct pci_host_bridge *bridge,
 		/* PCI bus address */
 		val64 = res->start;
 		of_pci_set_address(NULL, &ranges[ranges_sz],
-				   val64 - window->offset, 0, flags, false);
+				   val64 - window->offset, flags, false);
 		ranges_sz += OF_PCI_ADDRESS_CELLS;
 
 		/* Host bus address */
-- 
2.53.0

