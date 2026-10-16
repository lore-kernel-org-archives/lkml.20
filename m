Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657604E2F10
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160072; cv=none; b=EanfNTYyp0QYW8VBfUCVkEQW7xk6Rc3OBa3N435AyyGPVFgOkPDv7LOr4w7kMSnJ6TkFdrE9q9BYNsKRdC8nmClVoOk55PWhjPpKs/x0dnUWwqhkuqsSNX8BGcrZaABNliLW3ypbaIjmWNcQbA/cdMA6mB3Gy3lbJuGgngQq5FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160072; c=relaxed/simple;
	bh=ElCYGNQMTIin0s2ax+t5ue/ikCAhStrtE1EWGR1lKTA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FTRE8SzYLQiJ/rPeBDKGaGDkx2G4BfNEx4Pt+oeLdeVvHFMsWGlmSTRZ8PSL542JDV8CSSEm/nEOAF36aT7b9vUgNhLt7xdL7PiswfRPQfC8CZiAyVvOCCgvpYXyIu7e3Q+mAahdXXAxHU5GclqMMUQ0wBVhrz7I2AI1OdBD5B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=A2pGCTWR; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="A2pGCTWR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=HO
	cCHX0Za+CLcU0bVyHXOgKIc/guArAklcRiiJB8+6U=; b=A2pGCTWR15RJCOzryQ
	+SA3xCDFlELar5xUDfW0bdbprnUQDTy6lPIFsh3ImOCBXqoo7YQqSxlD1CHbC5Pl
	RgVajfJvGf74aqlWXFic9WjvguHi5/cdl/pyv57MDFZbzOmdz1NFrwZ+2Idc6Amw
	fKk57FXRv2RYyePndaRfb5VJQ=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3NysnMdJq1dUUAg--.27711S6;
	Fri, 16 Oct 2026 22:14:04 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 4/6] irqchip/gic-v5-its: validate MADT translate frames
Date: Fri, 16 Oct 2026 22:13:55 +0800
Message-Id: <20261016141357.2793046-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016141357.2793046-1-yaojiale02@163.com>
References: <20261016141357.2793046-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3NysnMdJq1dUUAg--.27711S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF18Gw45AFyfCw4rZw1kZrb_yoWDWwb_Cr
	1kWFn7JF4xKr47Jw1xGr45ZrW2vw4v9Fn5uFZ0qa93Gr48Xw13XFnrX395XF4DGF1vyFn3
	Gws8CF1fKr129jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sREMKZPUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7wym4GrSMSyidgAA3U

The GICv5 ITS translate-frame callback accesses IDs and the base address
without checking that the MADT entry contains the complete fixed-size
record. A truncated firmware entry can therefore cause out-of-bounds
reads.

Reject incomplete translate-frame entries before using their fields.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 28e39b065de0..dad3b95ba150 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -1233,6 +1233,9 @@ static int __init gic_acpi_parse_madt_its_translate(union acpi_subtable_headers
 	int err;
 
 	its_frame = (struct acpi_madt_gicv5_translate_frame *)header;
+	if (BAD_MADT_ENTRY(its_frame, end))
+		return -EINVAL;
+
 	if (its_frame->linked_translator_id != current_its_entry->translator_id)
 		return 0;
 
-- 
2.34.1

