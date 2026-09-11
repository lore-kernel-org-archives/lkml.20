Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B7241440A
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169773; cv=none; b=hP5JAbHPhliPqWsKFyNfKa91ORgKpRHnUoM59eN3fbNV57/JNyjyTqFZwZVzUEoNRaVsNplNr0XsgPDbIUiGFjdpD05s30asU+BpB5pOvZoMxNWH8PF63gKhWGeWgd89VyBW53GiK+wjDXe8UNpekQPCntdBGYtVxkmWTIeW2nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169773; c=relaxed/simple;
	bh=/C4vMYtbzaj6mPGipL5NL0m0Xfkke1JQhHrl2SUMM+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R103y6j8VQ59qiEZxd4ERx9HGBSJhYRbDWaLwZSSB7AdE5su0l9yQwOwuX9YcTRxwdczi50FuoaqLM6Gru47W6qqcjERAnbD/Vr6XhtC5DgFwYZ+fqYXuzmtEaotzTgDHzll0z41+Kz0nS5iCH1ZyV6n6HcURijovm4qYMusXwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bfPgcSf/; arc=none smtp.client-ip=209.85.217.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bfPgcSf/"
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-754ac74c495so29473137.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169771; x=1789774571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsR21IG9GkhkXFxkByd8Q5sMNxfEXtOVC73TP3sSjXM=;
        b=CNJu9sjZ6mXeVb2loG+lwk/MpYU+54ypABncU0T5F8dWAagYmPMJtvAXVuNznXsoIo
         mKkOuGfBriqAaDQJcX7JGdbWkgmEWCWUe39zPE1aw12sDjm4y/8Z4UffDIN27amu2df1
         jmgZA/nGk9SmiUJEvMwq7fyka5pxrvIqOAb/6ZtuPwgzkijoaQUaTM8SYa9r7pkY9atE
         PgI1Kk1tkP4L70TamCrdSsdzUepiBsH3Xc0HRXwWzppnEhNaUpv2plqHAb7ZSFhXCllO
         2hbjCVvO1bZZBQDsg6ucUGOrjwfu/7TOGezRCsYN49DySySzYJxfvgOpxW5/A6ejQPuO
         rDHQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9SoVPP+v7DM84h/anonHVX7OiQdHJCkW7+izReC8p6YPAIrfypWMA9kMBkTOkI2AnPvhvNNty74l8uh4=@vger.kernel.org
X-Gm-Message-State: AFuF++mn6aHNl9L2hBzTtcOD62C9pFX4+FEAzHMF067ZX4cNYTo3Nv2a
	p/U022Il//leQCM/enDMsv90vQkJ8EVSc+Fzx37F5zKdH0ib5aoybisNWu0OWUSVglfW19rfMBC
	qSygENeI8H0EwRhyrhWor4xFYDUqxB4JitEU7Pzwm41mEKoGlT0qPhN+8h7RAmMqqncANqU09zC
	FTfUwPxfQqCw0T1nFP923dMZRHKk9GtLWiiyv+TH/O3OQ/9EsRME/XvYBq0lM2tYBb4rERSV9v2
	gVdOoDyJQoZgsKPlrm6
X-Gm-Gg: AYBFou1Rg8qBCMCQl9821zEbg2lIv88UkxHypiWeAXqcCGdadpiqKKrTgS+gX060zZF
	T3wPGG7768nR6MWcromyJh1AOz20e3Kb90Rnw285mIQnZEipbuz6pO6jKbuAjbcEU98apHB/n8g
	kZJU6/oNGTP5ulksX5y6dF9r4JeZWwcTQxJbQql5FH4CL6f0U/f8YyWSg42B0i/VOwPZWy7DfTD
	0l6zkHQbYqE7v1e1034ZoarelDBy/zBOtbK/LT2Jw4EEpsfnw11Afw73cg4xiVJ/b+Fd+v6fglD
	fqEuHtpUgWFoZE6RTCkifRrNnLt3yMCAJmAtH/MR8UKJhNhzLIfRyWm5hAXPK4E2C/EL1nSsUgP
	+4hi3IW3u0dzTV1YL3RPq5U92527cys3AwpVdk29bRBpakuUJ6fSfBP+ptdm4oq7ZwZcoxyCHV9
	U0bomrDEuJtChzzzMc5hW4BuV+cvI0Yr0+pjnS
X-Received: by 2002:a05:6102:5cc1:b0:795:575:ae68 with SMTP id ada2fe7eead31-7950575b65fmr4888590137.7.1789169770635;
        Fri, 11 Sep 2026 16:36:10 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-79279288b14sm76078137.3.2026.09.11.16.36.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:36:10 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e869793d3so26616046d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169769; x=1789774569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rsR21IG9GkhkXFxkByd8Q5sMNxfEXtOVC73TP3sSjXM=;
        b=bfPgcSf/HyB41Fqy+8s7nc3roKN1NuxWVdktuLfM2An9WY04LZ7Rp6vqlL1EZLs+BQ
         P1mzgKuVCa8Np6GfTRmdvkwpcVziwxiy336zCqv2YzcD3aqcBAPH7P8Qhj+M4lGT82EB
         ZOLicq08KclBFmRDYzeBQZllKa3O43+KynJN8=
X-Forwarded-Encrypted: i=1; AKwUvBylpYAPo5Qlb+sBSywUAT/htsGcZAVlEMdsj57WykqTvK1EK5U6xCMQlsPGrSo3YAL+B1Y4ZTPsEGdSUkI=@vger.kernel.org
X-Received: by 2002:a05:6214:daa:b0:910:321e:2ebb with SMTP id 6a1803df08f44-91212086571mr95943146d6.8.1789169769075;
        Fri, 11 Sep 2026 16:36:09 -0700 (PDT)
X-Received: by 2002:a05:6214:daa:b0:910:321e:2ebb with SMTP id 6a1803df08f44-91212086571mr95942566d6.8.1789169768577;
        Fri, 11 Sep 2026 16:36:08 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:36:08 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 12/13] PCI: brcmstb: Use order-0 indexing for inbound BAR window array
Date: Fri, 11 Sep 2026 19:35:37 -0400
Message-Id: <20260911233541.1650895-13-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260911233541.1650895-1-james.quinlan@broadcom.com>
References: <20260911233541.1650895-1-james.quinlan@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The register names for the inbound BAR registers use order-1 indexing,
e.g. the first is BAR1.  The code followed this nomenclature by not using
the 0th element of the inbound array.

Undo this approach and use order-0 indexing.  Also use a struct pointer
variable in two functions instead of array indexing.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 49 ++++++++++++---------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 8bca98e6f5fa..53984cfa2c96 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -954,8 +954,8 @@ static void add_inbound_win(struct inbound_win *b, u8 *count, u64 size,
 	(*count)++;
 }
 
-static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
-				      struct inbound_win inbound_wins[])
+static int brcm_pcie_get_ib_wins(struct brcm_pcie *pcie,
+				 struct inbound_win *ib_win)
 {
 	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(pcie);
 	u64 pci_offset, cpu_addr, size = 0, tot_size = 0;
@@ -965,13 +965,6 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
 	int ret, i = 0;
 	u8 n = 0;
 
-	/*
-	 * The HW registers (and PCIe) use order-1 numbering for BARs.  As such,
-	 * we have inbound_wins[0] unused and BAR1 starts at inbound_wins[1].
-	 */
-	struct inbound_win *b_begin = &inbound_wins[1];
-	struct inbound_win *b = b_begin;
-
 	/*
 	 * STB chips beside 7712 disable the first inbound window default.
 	 * Rather being mapped to system memory it is mapped to the
@@ -980,7 +973,7 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
 	 * SoCs.
 	 */
 	if (pcie->cfg->soc_base != BCM7712)
-		add_inbound_win(b++, &n, 0, 0, 0);
+		add_inbound_win(ib_win++, &n, 0, 0, 0);
 
 	resource_list_for_each_entry(entry, &bridge->dma_ranges) {
 		u64 pcie_start = entry->res->start - entry->offset;
@@ -997,7 +990,7 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
 		 * two.
 		 */
 		if (pcie->cfg->soc_base == BCM7712)
-			add_inbound_win(b++, &n, size, cpu_start, pcie_start);
+			add_inbound_win(ib_win++, &n, size, cpu_start, pcie_start);
 
 		if (n > pcie->cfg->num_inbound_wins)
 			break;
@@ -1081,44 +1074,44 @@ static int brcm_pcie_get_inbound_wins(struct brcm_pcie *pcie,
 	}
 
 	/* Enable inbound window 2, the main inbound window for STB chips */
-	add_inbound_win(b++, &n, size, cpu_addr, pci_offset);
+	add_inbound_win(ib_win++, &n, size, cpu_addr, pci_offset);
 
 	/*
 	 * Disable inbound window 3.  On some chips presents the same
 	 * window as #2 but the data appears in a settable endianness.
 	 */
-	add_inbound_win(b++, &n, 0, 0, 0);
+	add_inbound_win(ib_win++, &n, 0, 0, 0);
 
 	return n;
 }
 
 static u32 brcm_bar_reg_offset(int bar)
 {
-	if (bar <= 3)
-		return PCIE_MISC_RC_BAR1_CONFIG_LO + 8 * (bar - 1);
+	if (bar <= 2)
+		return PCIE_MISC_RC_BAR1_CONFIG_LO + 8 * bar;
 	else
-		return PCIE_MISC_RC_BAR4_CONFIG_LO + 8 * (bar - 4);
+		return PCIE_MISC_RC_BAR4_CONFIG_LO + 8 * (bar - 3);
 }
 
 static u32 brcm_ubus_reg_offset(int bar)
 {
-	if (bar <= 3)
-		return PCIE_MISC_UBUS_BAR1_CONFIG_REMAP + 8 * (bar - 1);
+	if (bar <= 2)
+		return PCIE_MISC_UBUS_BAR1_CONFIG_REMAP + 8 * bar;
 	else
-		return PCIE_MISC_UBUS_BAR4_CONFIG_REMAP + 8 * (bar - 4);
+		return PCIE_MISC_UBUS_BAR4_CONFIG_REMAP + 8 * (bar - 3);
 }
 
-static void set_inbound_win_registers(struct brcm_pcie *pcie,
-				      const struct inbound_win *inbound_wins,
-				      u8 num_inbound_wins)
+static void brcm_pcie_set_ib_win_registers(struct brcm_pcie *pcie,
+					   const struct inbound_win *ib_win,
+					   u8 num_inbound_wins)
 {
 	void __iomem *base = pcie->base;
 	int i;
 
-	for (i = 1; i <= num_inbound_wins; i++) {
-		u64 pci_offset = inbound_wins[i].pci_offset;
-		u64 cpu_addr = inbound_wins[i].cpu_addr;
-		u64 size = inbound_wins[i].size;
+	for (i = 0; i < num_inbound_wins; i++, ib_win++) {
+		u64 pci_offset = ib_win->pci_offset;
+		u64 cpu_addr = ib_win->cpu_addr;
+		u64 size = ib_win->size;
 		u32 reg_offset = brcm_bar_reg_offset(i);
 		u32 tmp = lower_32_bits(pci_offset);
 
@@ -1202,11 +1195,11 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	u32p_replace_bits(&tmp, 1, PCIE_MISC_MISC_CTRL_PCIE_RCB_64B_MODE_MASK);
 	writel(tmp, base + PCIE_MISC_MISC_CTRL);
 
-	num_inbound_wins = brcm_pcie_get_inbound_wins(pcie, inbound_wins);
+	num_inbound_wins = brcm_pcie_get_ib_wins(pcie, inbound_wins);
 	if (num_inbound_wins < 0)
 		return num_inbound_wins;
 
-	set_inbound_win_registers(pcie, inbound_wins, num_inbound_wins);
+	brcm_pcie_set_ib_win_registers(pcie, inbound_wins, num_inbound_wins);
 
 	if (!brcm_pcie_rc_mode(pcie)) {
 		dev_err(pcie->dev, "PCIe RC controller misconfigured as Endpoint\n");
-- 
2.34.1

