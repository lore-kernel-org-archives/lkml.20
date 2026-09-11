Received: from mail-qt1-f225.google.com (mail-qt1-f225.google.com [209.85.160.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ECD420E7C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169767; cv=none; b=N2wgcro7TBboC4UDJIb6EVgHJ81IErYav1rtgjmupvm07x0QCMuP+WbwFj3fqPZSYJUrDJIsazioevgqLEpkzl52uw7bIOYdWyI58iZq3l+BeNvvqkKt/j+GsT9Pl9Lrh0QXFeVhE9KqoHrcMn5of/ibvYloHOExRHF4IDWm+y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169767; c=relaxed/simple;
	bh=J/jQK56h9wDwCDpAQwgf0gACTUTfBrKcYQEPP0WTr0c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Te24LnW740fTeN6abVMvUIMO/HvOw1mJ3matAPwYmPvlrbkb1cCOadJdEmwHu0pHjeCzzKs3kW6EG9YwCscFc4pJG+D+WiS2r0Vo3H8S4CmrpZkGenEwlJGchdCqoBK4eKUblDdmwo1oK5XcexgLThTVEwuP3v0qP/rIYBERiJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DFTE4iLy; arc=none smtp.client-ip=209.85.160.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DFTE4iLy"
Received: by mail-qt1-f225.google.com with SMTP id d75a77b69052e-530dcadb4f5so9097861cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169765; x=1789774565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/JrxdF8t+QTOTmJ7fVNc0ZXDeEsvlNdyHKnTguJqLTM=;
        b=Fu3yN8mF00+JC3zaan/bsqztwd/V2aK2az9vkYo0bB339clcGzfQi8hDV7fjDQ/W0z
         bQiam0lkHESRIzkkD5JvS4kDGncgPi8eDOww0z2n8NiZ6xAwcoWzIXYzkvKtGTt8RGG3
         zeH50H764ZBNkLi060zk++AzDOnPpC8kotrgmTXUZN/zBjsl5gtF7IOvFKNRtl992HAw
         eZUyXFoMaiMN1IL7cuk1aPBg5RQvKkJeiJWbyeTvXMToKM6vBs7qQiHd0+t22iPS4EZe
         KPOS9WA0PE2zgyGyHpUrULETViBvsEfs4nVepLGuqeLYa9MTzcCI0feHe5VK1lfz3tKO
         vpvw==
X-Forwarded-Encrypted: i=1; AKwUvBzVwEXoC4T15cO6eWbG1RVcVWVCygDV7/ruyB0YNAFptJlmzKHAGYgAzgM/a35YIaOFSlpYVrl/t4/XDD8=@vger.kernel.org
X-Gm-Message-State: AFuF++lf4ylI6tEQwmgWcIZeVFAbwVFi41hQwWZcN1ObDDgP5U606d+J
	zbalCD+DVy6Ojey5DHFkShXgqtGBmEG7R0LeSyn67nTojvtsqUPEkIZSAQCm1wn0SA852CPWrcE
	c/9ZvljaS0IFuB1f8eVl2hPlyNNyHecOqVq3ngShQUobQa+lptOhG+8ymwJBulOsEOPnTHNC8yZ
	0uCZWOk71ht1Y5b81GVnQm5AoIu+hs8HG8SMfw9L0WOacKkaohMiOZAAImOXwzW8xDYJ90pksu7
	RDuVD/BLePdevJqvGoL
X-Gm-Gg: AYBFou11qe04+Ay+WyxyENN32S90TuaI5hgFeadk3RK4JDfDlVIx061C4dii9SpePof
	hYVFueNe6BxuNvPdP5C6ycDHM9BMglg/0bm/LiFb0AKKPBC6YD/z89tF0VLdbL2bG4xFqD/dN1d
	Bivrt6jskV1uQSuKvg4R1DxOH/gx5av6QOiT7tzFw2EKPgIdrK3sNKWwhFcVo3yKJtrwoHfsW9U
	66qmQCfAsilODPtj07piY5NGo2mlEt34/1jS1NdG9KVcRFB3HpHVsv/pa3EhRVXXzAHSpkiASXS
	cTA44iLOFlcv0vXNU0FMEA8mhrKaEy7cri2r1+HyuSQgzh+ALVsQf2huB+hwv9gPY0HVoBuAtnW
	m7z24B/fTRekh/EOwcnAfQ0XeGsq2XBacIpXmZSe5mQAaddzXqBGf9FnhrxpZptZmfT8NugrI8X
	XPpXXmGgwOaEFciUx/cYTeD004g+/5b0rrY2H7
X-Received: by 2002:a05:620a:46ac:b0:939:a0f3:6aef with SMTP id af79cd13be357-93a0368ed61mr94876285a.23.1789169764739;
        Fri, 11 Sep 2026 16:36:04 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-939e810de2esm41658785a.1.2026.09.11.16.36.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:36:04 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91219341db7so15339946d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169764; x=1789774564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/JrxdF8t+QTOTmJ7fVNc0ZXDeEsvlNdyHKnTguJqLTM=;
        b=DFTE4iLy7PzPnI/CkY1LZhtN7NzKoI/0ynlgqfJJfZYuekzyF7X4sjY9qqeuKYQZ7Z
         8vW2Y0sMGGBr6NKTKtk8rHIT32Kj6+X9GXNkbG/vxdAZQHij92nI/fw4/mQPIG/zBl9C
         CgoTgVxLlWXEhnaKMeOGRyl7AEx6g83aB7sqg=
X-Forwarded-Encrypted: i=1; AKwUvBwR2nQiKLl/HNEPjj1c+CeafcQBHQgm3ek7UuJmn5NhZCzleQdeHvFaekXmWWLyLXYFwGWIJAKnzeze9Kg=@vger.kernel.org
X-Received: by 2002:a05:6214:ca8:b0:8ef:e0d0:9fae with SMTP id 6a1803df08f44-9121d8f1169mr10166846d6.14.1789169764081;
        Fri, 11 Sep 2026 16:36:04 -0700 (PDT)
X-Received: by 2002:a05:6214:ca8:b0:8ef:e0d0:9fae with SMTP id 6a1803df08f44-9121d8f1169mr10166536d6.14.1789169763636;
        Fri, 11 Sep 2026 16:36:03 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:36:02 -0700 (PDT)
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
Subject: [PATCH 09/13] PCI: brcmstb: Declare and assign quirk EARLY_PERST_ASSERT
Date: Fri, 11 Sep 2026 19:35:34 -0400
Message-Id: <20260911233541.1650895-10-james.quinlan@broadcom.com>
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

Declare and assign a quirk where PERST# must be asserted prior to an
internal bus being turned on.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index e2284e114241..dfd703571091 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -296,6 +296,8 @@ struct inbound_win {
 #define CFG_QUIRK_32BIT_PCI_OPS			BIT(3)
 /* PCIe HW does not have an internal bus timer */
 #define CFG_QUIRK_NO_RGR1_TIMER			BIT(4)
+/* PCIe PERST# must be asserted before internal bridge turned on */
+#define CFG_QUIRK_EARLY_PERST_ASSERT		BIT(5)
 
 /* FLAGS */
 #define BFLAG(pcie, flag)			((pcie)->cfg->flags & CFG_FLG_ ## flag)
@@ -1159,8 +1161,8 @@ static int brcm_pcie_setup(struct brcm_pcie *pcie)
 	if (ret)
 		return ret;
 
-	/* Ensure that PERST# is asserted; some bootloaders may deassert it. */
-	if (pcie->cfg->soc_base == BCM2711) {
+	if (BQUIRK(pcie, EARLY_PERST_ASSERT)) {
+		/* Ensure that PERST# is asserted; some bootloaders may deassert it. */
 		ret = pcie->cfg->perst_set(pcie, 1);
 		if (ret) {
 			pcie->cfg->bridge_sw_init_set(pcie, 0);
@@ -1965,6 +1967,7 @@ static const struct pcie_cfg_data bcm2711_cfg = {
 	.perst_set	= brcm_pcie_perst_set_generic,
 	.bridge_sw_init_set = brcm_pcie_bridge_sw_init_set_generic,
 	.num_inbound_wins = 3,
+	.quirks		= CFG_QUIRK_EARLY_PERST_ASSERT,
 };
 
 static const struct pcie_cfg_data bcm2712_cfg = {
-- 
2.34.1

