Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506713546EA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160068; cv=none; b=tfJxt081ZhQRvN3TYe5R70Xh+DYaoNTn+KRxLNNuIsZ2MLMF0GN5pWSqY+/5qry0QVsfA0WptmvR4ERxiY/Lr9MwtSMBhv+OwP1mnKfPF7wXtSLcWL+4EWxpE95AtdbiGWpCG97Byx97EGtsJEBQtR1o3zul8RM6KzKzS+/PX2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160068; c=relaxed/simple;
	bh=7O1CJbcwZtu2SmL9EjuCOwTDNmpN4pgHgis5Lg0SOeo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QqVlZYt/jda0YgaRbuab9LB3RUdEi9SonMuzEQw6dpHN7/Ze9Fljh75KWTVLXs7HLxhxwuakQhq0M1sVmTCafD/wpnU0KHUjtcz4TCo7TtsD8/BVxWArZVGbR/Sjd15XkN+WaRshRczusHZuA3RDg9o6lm9fd1soNlggngn7ueI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mu2SVuG1; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mu2SVuG1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=6f
	ZThZnYNPE85kHBIb7C/IQ+qE8b8A0zCuSfmGZOXM0=; b=mu2SVuG1dYVUlk6DkR
	DhNVcJEv9G1funlMNw/+deAFEClR/CWC8s+tJHZ6GXP8iJ8hn2D5255YwhdLTFyG
	vWreuAjlwP8eEgJ5F5n8v37ySRm48S/QSIDhs7XAby+xqYt4WZaB8xf75SQw8Ywv
	3E7z1wUdKOYhXA6vDqwNPta3U=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3NysnMdJq1dUUAg--.27711S4;
	Fri, 16 Oct 2026 22:14:02 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/6] irqchip/gic-v3-its: validate MADT ITS entries
Date: Fri, 16 Oct 2026 22:13:53 +0800
Message-Id: <20261016141357.2793046-3-yaojiale02@163.com>
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
X-CM-TRANSID:_____wD3NysnMdJq1dUUAg--.27711S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWDGw15Jw45Gr4UGF17Jrb_yoWDCFc_ur
	yjgFn7JF4qgF4UKr1xtr1UZryY9a109w1kurZ2va95GrWkZ3W3urZrZ3s8ZrsrGFsFvF1f
	GrZ0kr1S9r13tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMrWrtUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8Aql32rSMSqrSgAA3C

The MADT ITS callback reads the translator base address and ID without
checking that firmware supplied a complete generic translator record. A
truncated entry can therefore cause out-of-bounds reads.

Reject incomplete ITS entries before accessing their typed fields.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/irqchip/irq-gic-v3-its.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index e9807af23537..485a790e4856 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5725,6 +5725,9 @@ static int __init gic_acpi_parse_madt_its(union acpi_subtable_headers *header,
 	int err;
 
 	its_entry = (struct acpi_madt_generic_translator *)header;
+	if (BAD_MADT_ENTRY(its_entry, end))
+		return -EINVAL;
+
 	memset(&res, 0, sizeof(res));
 	res.start = its_entry->base_address;
 	res.end = its_entry->base_address + ACPI_GICV3_ITS_MEM_SIZE - 1;
-- 
2.34.1

