Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906348;
	b=WQEXQUkiFFtwtVb+t3nxq0gGLa6NpPE3L6aujjaWG5BZMzv678PdhoOvT53Zimy3O2eU
	 uNKgVhxvx9+jLhX6gVT9B6MyWudMDzPG/z6XXR/4ZcSf9Wus3hY55ZSrWgcudagOCcCoC
	 xv8Uq63mWU3ezEsDmnawu6NRBmy0dQ3DH9At5+pxe2X1uvOU8xJamDe4mKrS0UK02z3pz
	 88iEGFTqw7InvT+TiBCUY5yMvZwcsBMwQQnO6iFlNApqd8Y7RNCybj9Kew469U/s6+mGn
	 3aGz0tdFqnMdC1ZldnStgAyTNVzSoLRAHbXCx12qrRcMfnkhbbK/Rr5HdLmL0ywCHMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906348;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-FB-Internal:Content-Type:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=8QAiaS4n20R6Be5/OEFRscYsIl59MRsTRHc5xWVH89k=;
	b=R4LwjSurvqPog71IbcHhl4v3GiLx7qCtc/v93o8onzb91Kom7ErDZBSBMW/wmtvDF6qp
	 QR1FcXaG319qkNdFTtLtvr/d8SFBBNBA5yNdwzoGF0fKcVOX6+3eRY/O1aITuAoikS0uB
	 yUfy22odQjywHVC5wQJkxSDCuXJwF3pJhx3wEiWddnV70POkXzsU12NjS6CeNbjgsWnZb
	 l4cq+IZ3KHG8S/0UBJqp9Kw7OIy8KVWR4UtQnriD3plPuOVciNdr5AHlsifWwktyAGFlE
	 Z4F+x0q1+OhYyrMg2pJOccchMcHHBvRI9PWnxqqIzDyEl8d/wDt78lkAw7jtqC2tN5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=IZ7ZEI0U;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539C0606A335
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 539C0606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=IZ7ZEI0U
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5J5taM309860
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 11:19:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=8QAiaS4n20R6Be5/OEFRscYsIl59MRsTRHc5x
	WVH89k=; b=IZ7ZEI0UdIx9/iIIJg0/ZJkubgMoE91hTiRxoDu5bcnmMXIpG0QPA
	EMiE8JHMhg4KRLq3OMzcNqXSvSIE++zGS6/R/wfjcWe0OgEt1DHg+tMnFgdZKOI/
	l9Va/2oMgeNjPCFKcq5TgGRIwZGZkYRkJUW4EcU5AyMuaJXqRIfCEB00VfQGU6wN
	/zD2slBts4KFdNLEW7k2DaKnt6XwGRNmsSc0HDFFFKVrBvvQ4zxRibZNv5XNbU0e
	kByMmRkJC223RBRWFPBZa45OBYJyANghRyWzL3+0P+o4W5io8qH3ncjgAPi2m9b3
	zdJIKFZVZLcNWbXHdgpfNRbDQl082nlLg==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hrb4a07fv-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:19:06 -0800 (PST)
Received: from twshared31846.02.snb1.facebook.com (2620:10d:c0a8:1b::30) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Thu, 5 Nov 2026 19:19:04 +0000
Received: by devbig197.nha3.facebook.com (Postfix, from userid 544533)
	id 06B712E811C66; Thu,  5 Nov 2026 11:16:01 -0800 (PST)
From: Keith Busch <kbusch@meta.com>
To: <tglx@kernel.org>, <bhelgaas@google.com>
CC: <maz@kernel.org>, <lrizzo@google.com>, <hch@lst.de>,
        <changfengnan@bytedance.com>, <namjain@linux.microsoft.com>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-nvme@lists.infradead.org>, Keith Busch <kbusch@kernel.org>
Subject: [PATCH v2 1/2] genirq: Add disable_irq_noflush()
Date: Thu, 5 Nov 2026 11:15:55 -0800
Message-ID: <20261105191556.4042191-2-kbusch@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261105191556.4042191-1-kbusch@meta.com>
References: <20261105191556.4042191-1-kbusch@meta.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3NiBTYWx0ZWRfX16OD/hzcOKOY
 HYPoQND3S0QbqYn2sd0/wOvMsj8AQoRUZLcSPjeRF9ZQp2JAc/IBpk6Orxt91wOrOJ7SLMg5cQD
 1su5iKFUF3X53ia0m4uts+grh8bdSus=
X-Authority-Analysis: v=2.4 cv=U7sHnuru c=1 sm=1 tr=0 ts=6aecd6aa cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=wpfVPzegXHpEFt3DAXn9:22 a=VwQbUJbxAAAA:8 a=aOCmZ3BWbme0XkIVnlwA:9
X-Proofpoint-GUID: k9aFZTotyORl_ItbTMortDJjvFgci9-h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3NiBTYWx0ZWRfX/1IR5K5L4bRu
 gfgSVHL5Z+OJJOzKQfw0H75hnQIlBEOh4NGLmjIE3U6DtLSPUIE8twE/Et8GyMvxqIleoTUD+p2
 m/3rZOBOY+klP3h1SkvQPx79c+qNRSjuW9HG7mNJ0xgQ49/MXO3FDvFUJtxLAf5QkPZKLkmv1a9
 48UW3UjucUnk9LPtzMxTri8oHR50LpCTAJlzYxE1kkO/fF1dbG4Fbq1YTNVZGFGJ0MZc1vVcro7
 /ZtmDTncq7CV0BbJ9CIiYWYxTndZyC6tzcY3Pk+SeRxBJFMc200UEe8DlIKMhw7JQoB5nyGc0hK
 TeiE0e4iOAEo7/Ps7J+zRAy+gWxy0biZr1O9J8gf9WaFAPxprFGJV1m3sW9mqvY4bJLqQxrr1x6
 YH4XLFKEF15jPbElfqqKwSn8quknnF35GwtSLXljCHdNoUdhsqzgx2+kKBmI8S3uXWS78uKCpc7
 xajvBuUgq0DILtwNb/w==
X-Proofpoint-ORIG-GUID: k9aFZTotyORl_ItbTMortDJjvFgci9-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01

From: Keith Busch <kbusch@kernel.org>

Drivers that switch between interrupt and polled completions don't need
the mask write flushed to the device; the disabled state already
keeps their handler from running and a late interrupt is replayed on
enable. Add an optional irq_chip::irq_mask_noflush() callback, falling
back to irq_mask(), and disable_irq_noflush() to mask through it right
away rather than lazily.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Keith Busch <kbusch@kernel.org>
---
 include/linux/interrupt.h |  1 +
 include/linux/irq.h       |  3 +++
 kernel/irq/chip.c         | 31 +++++++++++++++++++++++++++++++
 kernel/irq/internals.h    |  1 +
 kernel/irq/manage.c       | 21 +++++++++++++++++++++
 5 files changed, 57 insertions(+)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index ee2dd5349697d..6cfa1f8f3d400 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -233,6 +233,7 @@ extern void devm_free_irq(struct device *dev, unsigne=
d int irq, void *dev_id);
=20
 bool irq_has_action(unsigned int irq);
 extern void disable_irq_nosync(unsigned int irq);
+extern void disable_irq_noflush(unsigned int irq);
 extern bool disable_hardirq(unsigned int irq);
 extern void disable_irq(unsigned int irq);
 extern void disable_percpu_irq(unsigned int irq);
diff --git a/include/linux/irq.h b/include/linux/irq.h
index f485369b1b4f7..3a428dad6666e 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -455,6 +455,8 @@ static inline irq_hw_number_t irqd_to_hwirq(struct ir=
q_data *d)
  * @irq_disable:	disable the interrupt
  * @irq_ack:		start of a new interrupt
  * @irq_mask:		mask an interrupt source
+ * @irq_mask_noflush:	mask an interrupt source without flushing the writ=
e
+ *			to the hardware (optional, falls back to @irq_mask)
  * @irq_mask_ack:	ack and mask an interrupt source
  * @irq_unmask:		unmask an interrupt source
  * @irq_eoi:		end of interrupt
@@ -505,6 +507,7 @@ struct irq_chip {
=20
 	void		(*irq_ack)(struct irq_data *data);
 	void		(*irq_mask)(struct irq_data *data);
+	void		(*irq_mask_noflush)(struct irq_data *data);
 	void		(*irq_mask_ack)(struct irq_data *data);
 	void		(*irq_unmask)(struct irq_data *data);
 	void		(*irq_eoi)(struct irq_data *data);
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index de754db414d1d..28285d7274e69 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -399,6 +399,37 @@ void irq_disable(struct irq_desc *desc)
 	__irq_disable(desc, irq_settings_disable_unlazy(desc));
 }
=20
+static void mask_irq_noflush(struct irq_desc *desc)
+{
+	if (irqd_irq_masked(&desc->irq_data))
+		return;
+
+	if (desc->irq_data.chip->irq_mask_noflush) {
+		desc->irq_data.chip->irq_mask_noflush(&desc->irq_data);
+		irq_state_set_masked(desc);
+	} else {
+		mask_irq(desc);
+	}
+}
+
+/**
+ * irq_disable_noflush - Mark interrupt disabled and mask it without flu=
shing
+ * @desc:	irq descriptor which should be disabled
+ *
+ * Like irq_disable() with lazy disable turned off, but the hardware may
+ * still deliver an interrupt after this returns. The flow handler deals
+ * with that the same way it does for a lazily disabled interrupt.
+ */
+void irq_disable_noflush(struct irq_desc *desc)
+{
+	if (desc->irq_data.chip->irq_disable) {
+		__irq_disable(desc, true);
+		return;
+	}
+	irq_state_set_disabled(desc);
+	mask_irq_noflush(desc);
+}
+
 void irq_percpu_enable(struct irq_desc *desc, unsigned int cpu)
 {
 	if (desc->irq_data.chip->irq_enable)
diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index 703a062be8783..7995970babb77 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -101,6 +101,7 @@ extern void irq_startup_managed(struct irq_desc *desc=
);
 extern void irq_shutdown(struct irq_desc *desc);
 extern void irq_shutdown_and_deactivate(struct irq_desc *desc);
 extern void irq_disable(struct irq_desc *desc);
+extern void irq_disable_noflush(struct irq_desc *desc);
 extern void irq_percpu_enable(struct irq_desc *desc, unsigned int cpu);
 extern void irq_percpu_disable(struct irq_desc *desc, unsigned int cpu);
 extern void mask_irq(struct irq_desc *desc);
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index ec3ecb0e48cec..152dabea3102b 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -706,6 +706,27 @@ void disable_irq_nosync(unsigned int irq)
 }
 EXPORT_SYMBOL(disable_irq_nosync);
=20
+/**
+ * disable_irq_noflush - mask an irq without flushing the mask to the ha=
rdware
+ * @irq: Interrupt to disable
+ *
+ * Like disable_irq_nosync(), but masks the interrupt at the chip right =
away
+ * instead of lazily, and does not flush the mask write to the hardware.=
 An
+ * interrupt that still arrives is held pending and replayed by enable_i=
rq().
+ * Use this when an extra interrupt is cheaper than flushing the mask, e=
.g.
+ * switching from interrupts to polling.
+ *
+ * This function may be called from IRQ context.
+ */
+void disable_irq_noflush(unsigned int irq)
+{
+	scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+		if (!scoped_irqdesc->depth++)
+			irq_disable_noflush(scoped_irqdesc);
+	}
+}
+EXPORT_SYMBOL_GPL(disable_irq_noflush);
+
 /**
  * disable_irq - disable an irq and wait for completion
  * @irq: Interrupt to disable
--=20
2.52.0

