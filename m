Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42835415B6E
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169761; cv=none; b=lOI+cJeEPygMPly6z3p4dw5ND2rlWClCAb4kkLV9OmT1LkPjAIYU7oRhsOf3+A/dd6cLSiIAyP4jROd2TQbJN25bq5Jv7S7Tks+YHrdjDoLFp2TXtbCJgSS1I5YKNWQb0DsGgWcs3d/Fde2BAYvtuXD8aqoBaUoZv/wFd+hI3J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169761; c=relaxed/simple;
	bh=fCquuyOPRRvbPPN7j4s4PTEgnAMO3NXPFcnuc+77eGg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u6SV7Q39NVCx60SuSFFnaDdc+sTi8pzTtHSjRYfcJ6SC5aLqsqA47dn6xTsPTIU2kyfIH92JFSFgXnG7+H8/u9By+C3/j36yICfG6X969ixM7dVgdmUvKWldHcaue+FPnpWzMZ3oWEuy6l0DmHSJJPRCyIhmss05H8IGSWahDEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=LY2FQLET; arc=none smtp.client-ip=209.85.215.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="LY2FQLET"
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc149372c14so1126389a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:35:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169759; x=1789774559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZPUdMQ+HBavjfYhKEMnyLWMnsWpuuaQ9A5Q74lcIlU=;
        b=FGcvwwndzfZZvt/OR+pQpuzOCb0plhcsUz2YsCWvHwqnlb/pJL+nGYYYv20sMFzsC6
         LlwABGEX49/rcvhmWE/si6/p9oTyWYT4qvCMu76ZmWr2h6hriEXCKBEqnwRKa4lybrfR
         Gpt3INt0p3rmQ4yjzhySdy/aau2VYoQI9BIkw0izZMREvK3uX2677obsDJiKWbFkfM0p
         5KLzTTIGUS1TvGYMx/d3hA8vnxNrSV/mMlIqA8QXMcHQ4kI5Jm/DC6A7Ld3hSCc1NTr4
         zhz505uSv7nU5TdCTE2pczDz9NPQOS4fc6bAbw3A+zCIDB8IQ491a2Pu5yUHTROrkyZ2
         Hu4Q==
X-Forwarded-Encrypted: i=1; AKwUvBy7jOAm6XYoI8pIt3cqs0yDQoeD1ElVOMfPLjiL5w615MoTAOMchbeItUSJdr/P6uvhVzeCIKUUw1XVFKc=@vger.kernel.org
X-Gm-Message-State: AFuF++lXs5srq+Y8B/RXBPBHFY1tuM8IsVvxcYQhr7jtideI7qims5ME
	fyu874uHDQ9f76muQlSMzhyHdFnR3DbMOTqmPs62PtBujgrpax4BZvGOY4YPeqst6imGnaRWxl1
	yIknfjcrBkyIY2m1xndsun680zia0+7r0CTsp1oGZYUwLSaFuNeMd4ckInmiB7a9NggBAM9E9md
	7nEKsKDXwv8/k6Gq2eAV4KkjBn3lMtTXWnlp37s255voSgIsotScPPNtpTWcHPLnAOxQVBVT9Ny
	ltDQ9fV7LIT/gCzfdSp
X-Gm-Gg: AYBFou1NbctHiz55AQtCChVRUYSkRJWgh7zDKGL/3GGZf0mUA2iv5jPWI6awC3iIgvT
	ZTnKEqi/+jKyzsz0xpptA334KTFiFhZX28Dwi8TAwcaaP9JgRHgqP2jf7Lwcad8L/1ivI7e653c
	TEckBXLfRdMxjkc/lb+xV8OqP2YjXpdmVJKgAWJRWeioaJ3KC8w2XCmRk2K/1IMnb8f58fmOtXt
	PbX+6vrl02kyPk7ZHdg+oIquZ/SqHCO8HqKzYZ4XtQyNae7rxexERVXdiXohxIMCO4dekOpMTDm
	bUHEWlTOJoTRQQElPenGP6y5pJNaFAZOHEfzS84zZInePGnkPGaLcugWU006qDQBdrIfRf59UZA
	yfrCd9jtB4t46vShivjqEWUnPOUGGMPqZ+NKXrp45wHf07kSRRUBxI3bKxfiZDcVosg6kBRxuEa
	Y9RAZXKmCwQY5+R6u5/tbiqSK9Ew0YQ+beY+BHa0I=
X-Received: by 2002:a17:90b:3a0c:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39d9bc10065mr10562275a91.1.1789169759253;
        Fri, 11 Sep 2026 16:35:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39d95edba31sm2319795a91.3.2026.09.11.16.35.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:35:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91043af01d9so25487336d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169758; x=1789774558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WZPUdMQ+HBavjfYhKEMnyLWMnsWpuuaQ9A5Q74lcIlU=;
        b=LY2FQLETPE5YZVVWUKgWtnbmOtbslSyU4AhPXvYp3ezyweRnv57uaVixdbLNgOkTgS
         /bK7Z8mAtF7v8ermAjjhuAGg97JLcHPHJLONgHuJthnaG1IqqZrEqDdM54eNgqHI4F2F
         fAOn3qavX921OYEWfcBnriI3jmBAh3oQPQJQU=
X-Forwarded-Encrypted: i=1; AKwUvBxIcSjQjioHatKCByjQyKH2C2Iblhu7W45aWotBQJtQ5cDxaswpUrykTmLMfXAMeS+aduERi5OXWJnfbMo=@vger.kernel.org
X-Received: by 2002:a05:6214:d4f:b0:910:3453:66e with SMTP id 6a1803df08f44-9121210d369mr86980126d6.32.1789169757923;
        Fri, 11 Sep 2026 16:35:57 -0700 (PDT)
X-Received: by 2002:a05:6214:d4f:b0:910:3453:66e with SMTP id 6a1803df08f44-9121210d369mr86979786d6.32.1789169757456;
        Fri, 11 Sep 2026 16:35:57 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:35:57 -0700 (PDT)
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
Subject: [PATCH 06/13] PCI: brcmstb: Declare and assign flag IS_BMIPS
Date: Fri, 11 Sep 2026 19:35:31 -0400
Message-Id: <20260911233541.1650895-7-james.quinlan@broadcom.com>
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

Eliminate a function that evaluates SoC chip IDs and instead declare and
use a flag that indicates the SoC employs a CPU with a variant of the
MIPS-1 ISA.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 401898d04d52..8927d1d97f4a 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -300,7 +300,8 @@ struct inbound_win {
 #define CFG_FLG_HAS_PHY				BIT(0)
 /* The SoC PCIe HW can dump to the console PCIe error info */
 #define CFG_FLG_HAS_ERR_REPORT			BIT(1)
-
+/* SoC uses a Broadcom variant of the MIPS-1 ISA */
+#define CFG_FLG_IS_BMIPS			BIT(2)
 
 struct pcie_cfg_data {
 	const int *offsets;
@@ -361,11 +362,6 @@ struct brcm_pcie {
 	spinlock_t		bridge_lock;
 };
 
-static inline bool is_bmips(const struct brcm_pcie *pcie)
-{
-	return pcie->cfg->soc_base == BCM7435 || pcie->cfg->soc_base == BCM7425;
-}
-
 static int brcm_pcie_bridge_sw_init_set(struct brcm_pcie *pcie, u32 val)
 {
 	unsigned long flags;
@@ -1176,7 +1172,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 		return ret;
 
 	tmp = readl(base + HARD_DEBUG(pcie));
-	if (is_bmips(pcie))
+	if (BFLAG(pcie, IS_BMIPS))
 		tmp &= ~PCIE_BMIPS_MISC_HARD_PCIE_HARD_DEBUG_SERDES_IDDQ_MASK;
 	else
 		tmp &= ~PCIE_MISC_HARD_PCIE_HARD_DEBUG_SERDES_IDDQ_MASK;
@@ -1189,7 +1185,7 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	 * is encoded as 0=128, 1=256, 2=512, 3=Rsvd, for BCM7278 it
 	 * is encoded as 0=Rsvd, 1=128, 2=256, 3=512.
 	 */
-	if (is_bmips(pcie))
+	if (BFLAG(pcie, IS_BMIPS))
 		burst = 0x1; /* 256 bytes */
 	else if (pcie->cfg->soc_base == BCM2711)
 		burst = 0x0; /* 128 bytes */
@@ -2001,6 +1997,7 @@ static const struct pcie_cfg_data bcm7425_cfg = {
 	.num_inbound_wins = 3,
 	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR
 		| CFG_QUIRK_OB_WIN_MAXSZ_128MB,
+	.flags		= CFG_FLG_IS_BMIPS,
 };
 
 static const struct pcie_cfg_data bcm7435_cfg = {
@@ -2011,6 +2008,7 @@ static const struct pcie_cfg_data bcm7435_cfg = {
 	.num_inbound_wins = 3,
 	.quirks		= CFG_QUIRK_OB_WIN_32BIT_ADDR
 		| CFG_QUIRK_OB_WIN_MAXSZ_128MB,
+	.flags		= CFG_FLG_IS_BMIPS,
 };
 
 static const struct pcie_cfg_data bcm7216_cfg = {
-- 
2.34.1

