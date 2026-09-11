Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7085440E8CD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789169760; cv=none; b=RMgiHSkl6iph0QLSXQ/3NdZWLylGT3Wpb6j8umVgOSWmIRt3+vITeis+S8yx/spwWZkTR4KxFnfFwDbkrJTUtK2dtwKfGdtSu0LFm7ifyyLQJJ9+/GEZbCK9J55lhmRMRY3mjMWGCtqjp2tpaI/yRz3NlZStokHH5ooRaC+NjRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789169760; c=relaxed/simple;
	bh=13qbqAzryTLcOBJ/NrIGKEz5d3AP9UnaGQRUX5OGeo0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qwC1ZuqwnqifveCFnAan5RhHeTzaPItXTEGhPEgZwyXKopxPQkB76ozvYmhWHoHcVyw11gmn5bGf4FPy9stAN+IiZXekIC+BwdWoQOapi0vGz8EuwygiN58Uv4Awx7f7fHYSMbOCL+kbiqFTpDsSHc3EftruOvmlX6K97z+PpFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dCvy9JHN; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dCvy9JHN"
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-868b3248b2cso356506b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789169758; x=1789774558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArH91frdffOdQcxWygxWviJhRnyFFFtxyckVO+/C0bo=;
        b=qutL7fIqUXK527CCZLKqkES7q8F/olmprENNO+vW/nvXJmVT5CbVW4yUSYqTrkh8O1
         AkamW84aYqiqTdPlWcxQi78wCxXtUeNk9DvlsbYDhx6KxygmYddt+gF6H/W3W7S9+mQt
         uqUHfiJ8bmouu49yN4ttC/XwJC66nJej0Fq6hZaXDrCi6ggmfDXmryrpMI/msj8iMfyk
         rA3ARrKWFufwL1jYNb4ihD9xHZc5Fw1yX01DMF3fJKLYC2vH1dCb3ZOywBAWt/orL+g+
         d99iU+Kp05AujWwfWzB9U0oDrnRlv9bLQA2HHZc5Y3B80LuxQlr+h3hr9ib8F++CXS9k
         8DPA==
X-Forwarded-Encrypted: i=1; AKwUvBxLstajjhI7j/xgGOpQwKBEY828bn8kMPacoGTk1ac5roLA/+RE1szV6n+EeQDoW8Kj7S/6t+5IDGB5Swc=@vger.kernel.org
X-Gm-Message-State: AFuF++kyCvKQO35zbMIMedsIGYvpWtxrdvcGuXlauTHqmj8fuokCuSYy
	v+HO+kZoL5CLuK9DsHpQyOYbjstwAZUP7Ylbx75Pt88Oi/wDnK4g3dvjKBq8ftvLwHI8YnoK4CQ
	sxRh4289AQG05WabWkT7AWE7XdRzG9REYZF+ZFwmCPrTcpUM0yM96VnCG5IVr5b7Edj8xbl8c+s
	tPMpf+OzhxyIi+p/dC7EQYgllrPrroFIBFKzMndOZMUdqibLz9UdxF/QH2m4g9DvcF2GKlOhdy3
	QUfRZycX1AUkowzsYD3
X-Gm-Gg: AYBFou1BU66S58qdosbgkB2d61j2zSUW1PR0qscQ8SZMuEE90gg6WEolDYY29Sjkki2
	5sCiqVLEMwmrKdlP6DGxYH8nuY+4EsFC/9WQqVm1AiQiaxO672DJZDakzu89bn5+XV/41acswQB
	Kgkd9/KHtZNX/1QPK0b5PMWhIYSVXXcBMAaU20kv9JdyoUHap3nRq1nrPbZyB3sCAzJ3XySBs6n
	Rx0oQ8FyZhstW44Vk4Q5cgPD1oo3yupQdK8IU180sFZq/xmMDDdXE1Idy8UuoF8CXxIWyRgTzls
	jif8uRbUQeHnSw46rzlc+47DaFqVBIpDlrrGv6uNLvb98hzKXUCZg0OF/WNM1h484lE99BKRb2m
	IdXBkxYyoudoy4hCQ8Q1OKVuWD52ZKdY+qytwJs6fnsbKjfAPKwCSJNtsLDYjCD1iOdC0cmt3Io
	LIcV8jyY7KFeitI1mpaYZDhhHuev4vrR4qeOaG
X-Received: by 2002:a05:6a00:1822:b0:868:ce09:7c4e with SMTP id d2e1a72fcca58-86b342f54e9mr10157935b3a.23.1789169757697;
        Fri, 11 Sep 2026 16:35:57 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-86b27dc0f73sm1001319b3a.5.2026.09.11.16.35.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Sep 2026 16:35:57 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939d6c515deso258070385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789169756; x=1789774556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArH91frdffOdQcxWygxWviJhRnyFFFtxyckVO+/C0bo=;
        b=dCvy9JHNCgDuDdq2QGRIzPDZha80q+mHVC58ZUudGIHMCwZvGhZ/fIFdSJWnyzlNBf
         06Io73X97Q0b7N+n6ckzg1/s1CBq/VRJlSpI7Zf6OHiP72kQnmv6FqMCayvgeSCFv/Fa
         sZKMwd7uhXvRqQ6Qi8PrluT/D/QI9F/VrFtow=
X-Forwarded-Encrypted: i=1; AKwUvBwJKGo+inoaauFOZC9s63xeLEZmxSTDR2fiFwCKPH8dpK5w34A0yMCMEelElwuTUHppbmclp7Nf9dvLeTc=@vger.kernel.org
X-Received: by 2002:a05:622a:164b:b0:530:b2e2:9038 with SMTP id d75a77b69052e-530c87b2e6amr91266261cf.56.1789169756363;
        Fri, 11 Sep 2026 16:35:56 -0700 (PDT)
X-Received: by 2002:a05:622a:164b:b0:530:b2e2:9038 with SMTP id d75a77b69052e-530c87b2e6amr91262541cf.56.1789169751039;
        Fri, 11 Sep 2026 16:35:51 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45ab71sm31717326d6.12.2026.09.11.16.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 16:35:50 -0700 (PDT)
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
Subject: [PATCH 03/13] PCI: brcmstb: Add Broadcom quirks macro
Date: Fri, 11 Sep 2026 19:35:28 -0400
Message-Id: <20260911233541.1650895-4-james.quinlan@broadcom.com>
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

Introduce a 'BQUIRK()' macro to shorten the calculation of a specific
quirk's value.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 drivers/pci/controller/pcie-brcmstb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 47862569937e..bf002bcf6bd5 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -277,6 +277,9 @@ struct inbound_win {
 	u64 cpu_addr;
 };
 
+/* QUIRKS */
+#define BQUIRK(pcie, quirk)			((pcie)->cfg->quirks & CFG_QUIRK_ ## quirk)
+
 /*
  * The RESCAL block is tied to PCIe controller #1, regardless of the number of
  * controllers, and turning off PCIe controller #1 prevents access to the RESCAL
@@ -1627,7 +1630,7 @@ static int brcm_pcie_turn_off(struct brcm_pcie *pcie)
 	u32p_replace_bits(&tmp, 1, PCIE_MISC_HARD_PCIE_HARD_DEBUG_SERDES_IDDQ_MASK);
 	writel(tmp, base + HARD_DEBUG(pcie));
 
-	if (!(pcie->cfg->quirks & CFG_QUIRK_AVOID_BRIDGE_SHUTDOWN))
+	if (!(BQUIRK(pcie, AVOID_BRIDGE_SHUTDOWN)))
 		/* Shutdown PCIe bridge */
 		ret = brcm_pcie_bridge_sw_init_set(pcie, 1);
 
-- 
2.34.1

