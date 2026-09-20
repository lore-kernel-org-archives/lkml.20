Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36961A0B15
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789875803; cv=none; b=bknz7pYXmz9AEYLM4u2kK/ursc3lAOmLzCH5K69vn2jPnu3bNIrssCvs2NW+VGWqnmI5FTRtcM2+ctF54lpDdWDi1keFRFPvXwF1v3Hl846aHd19ijgiR3MSwwf6l2sj1Duu3qUgr16Qo2WymPhFsTFjaPp/GyLVNaqJo7NI3mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789875803; c=relaxed/simple;
	bh=8dIKvBVVfzc+soZYOqNhdqddIRXJgaVzkvNRR+bOR8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QkObWFcjsGE6BKz7xSahZH1e60BqEXAsrlwACtDaAg+ox6kxqxNyX8asGT6lH0y/OYkM26JD2aL4ZdnUNFiRv9HfrEyVSRh1un53Xf24VatflAv3ozIq4Iim1Mrcav9lftjDsTbk2t/gBg5AHU591JrDr2qAwLqLOWGy5UhIQf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cJBxbZHX; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cJBxbZHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=8V
	IR0QNjZ1d8DTLtzR+w6Ot69y35D5C5PM9NP04wTDs=; b=cJBxbZHXYJw+Zw5C01
	9IVJCua+Fea0ehdT3KP0qaeLERw+SGHVV9GIxfkbcqX0PNuFwqg7B3GJlKdRxfC+
	vEi2l9ZKRgDUTO57QVHM49AXG7YN0FpPOI8Le6qi+lCPFpCV80O//eKyC8SOimtE
	NLM+x3HvpS9oegTL8f+SNP5pU=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDHCUguVq9qOVkyBg--.158S2;
	Sun, 20 Sep 2026 11:42:40 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: mark-pk.tsai@mediatek.com
Cc: daniel@thingy.jp,
	tglx@kernel.org,
	radu@rendec.net,
	linux-kernel@vger.kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	hppiscas@163.com
Subject: [PATCH v2] irqchip/mst-intc: validate the DT interrupt range
Date: Sun, 20 Sep 2026 11:42:36 +0800
Message-ID: <20260920034236.16229-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHCUguVq9qOVkyBg--.158S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4UXrW7Ar48Ww1xJr1UKFg_yoW8WF1xpF
	W3Gas2kF47GayxJry2y3WUZFy5WwnavFW7G3ykKa4xZr13W3ykuryayFZ0gFnrC3yxG3W8
	CF45Xa4rWw4UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR5PEDUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxRAo8GqvVjB8vQAA3v

The driver takes an inclusive interrupt range from the device tree
without checking its endpoints. A reversed range wraps the unsigned
count calculation, and a range larger than MST_INTC_MAX_IRQS exceeds the
controller capacity used by the driver.

Reject these ranges before calculating nr_irqs or creating the domain.
Check the difference after ordering the endpoints so the validation
itself cannot wrap.

The issue was found by our static-analysis tool.

Fixes: ad4c938c92af ("irqchip/irq-mst: Add MStar interrupt controller support")
Reviewed-by: Radu Rendec <radu@rendec.net>
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
https://lore.kernel.org/all/20260722041443.10020-1-pengpeng@iscas.ac.cn/
Describe the missing DT range validation directly, keep the condition on
one line, and add the introducing Fixes tag as Thomas requested.

 drivers/irqchip/irq-mst-intc.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-mst-intc.c b/drivers/irqchip/irq-mst-intc.c
index b5335f6fd6d6..1070de5de8cc 100644
--- a/drivers/irqchip/irq-mst-intc.c
+++ b/drivers/irqchip/irq-mst-intc.c
@@ -263,6 +263,9 @@ static int __init mst_intc_of_init(struct device_node *dn,
 	    of_property_read_u32_index(dn, "mstar,irqs-map-range", 1, &irq_end))
 		return -EINVAL;
 
+	if (irq_end < irq_start || irq_end - irq_start >= MST_INTC_MAX_IRQS)
+		return -EINVAL;
+
 	cd = kzalloc_obj(*cd);
 	if (!cd)
 		return -ENOMEM;

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
-- 
2.50.1 (Apple Git-155)

