Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986694;
	b=as4Bf+XJWY2e2yLMFZ1p/mTOPLei3h0gfil9JrbQ07Q1W3aOn2eOmNJHgVHEL0JLJ0w5
	 2y1BwrOJVkbTqkov3grIe8B8PGd/1sNglc4p2MDcVLw9qpDWmqnqTXSbLlz/2OPNOPnDX
	 FX+Evvmmp6ND0Kb8BWAbEgZ5ELQA8v3cIKCKg6Qkh/vIEFpGxt4rnJdOHzYvAupdoP1xa
	 jVNmGVAi04+zOzR+LdRJWoxHs+SrmUXIFRu5CXi3ENZbMaHhyNVRgDyC3zMrbNuwjcKgI
	 MharQ8qapOcWxSPlPkocp/PL7k7dQjmQNP+JBoizLm7T4N5fWpUDecHZUpVKx+f+E3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986694;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-FB-Internal:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=8QAiaS4n20R6Be5/OEFRscYsIl59MRsTRHc5xWVH89k=;
	b=guo/CpUWvUvkVxTTN+hfuNBKegTI124JKInI+iPz+ZXQdqo0bVQfFKQXtdn5X4B3Mtzr
	 jogZb5dyznOaclILjvLXmwVB0UoBP+Epi+kohUCln8DVefA591x51/nbHRl9pv7F5OzSd
	 VIOgdW5f11Aap4WB06oHHsuY1rdP5Jsga8KaF772v+gYjs2gQ6GQj2BvM53OFNu6hWGk8
	 Ee0dmPgF0lL8f3J0/+BShxUBPWoJOUCWAmQhcl2rsAS6sRxCN0lxHPKxnPqMGu0zMV0mg
	 HKPPj4b/tOC1Ts+pEgoHJflYb9NzO/9+Q9Fx2OKpSGuw/lGBZqLhdFNwi4oeFSA8rQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=QKrB1xVm;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7D7606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A7D7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=QKrB1xVm
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6HWTbN1219991
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:38:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=8QAiaS4n20R6Be5/OEFRscYsIl59MRsTRHc5x
	WVH89k=; b=QKrB1xVmgcQ9yaWQ00XVASIQvGqbjtqtCuwO4s+Y0cDOGAVwdfJxH
	kRXbRHgfpEy6bxfTd2pVV1QLxFAs+8ckfugy2W2rskwBhRuCz/zRG9IJwCIlI3kL
	b7VVcqlMF/HeEdZNv0eSFO0Mj6VBI5zQ0Uy8nNrr4ZAJrjzDme3IFsB4Zpl16iox
	+KYzvN5U2volmy7tgFReA5voOwHfaBV/a9DWGMbIr/++x0K/a/w9X3+osNyw5I9G
	Qb2HNoI6dMflxaHg3XXqAOuROSljPJp9yfkv+30uawrF+VhL06gs5I+5C01SEVQ6
	HIRJJE2pIiHVvmM1GbTlysBIZEjHDqVGw==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hs3r6nnrv-17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:38:12 -0800 (PST)
Received: from twshared98006.17.frc2.facebook.com (2620:10d:c0a8:1b::8e35) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 6 Nov 2026 17:38:09 +0000
Received: by devbig197.nha3.facebook.com (Postfix, from userid 544533)
	id A46CF2E8DCBEA; Fri,  6 Nov 2026 09:34:50 -0800 (PST)
From: Keith Busch <kbusch@meta.com>
To: <tglx@kernel.org>, <bhelgaas@google.com>
CC: <maz@kernel.org>, <lrizzo@google.com>, <hch@lst.de>,
        <changfengnan@bytedance.com>, <namjain@linux.microsoft.com>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-nvme@lists.infradead.org>, Keith Busch <kbusch@kernel.org>
Subject: [PATCH v3 1/2] genirq: Add disable_irq_noflush()
Date: Fri, 6 Nov 2026 09:34:47 -0800
Message-ID: <20261106173448.34794-2-kbusch@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261106173448.34794-1-kbusch@meta.com>
References: <20261106173448.34794-1-kbusch@meta.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX1ttrLdFo7wWn
 nHxc0nIAJumqmQ+h4wMN519pW4zr528/IieBpTiiJtO7zcg9fnpCmLCra+BY5ILeaezJI4tjQoP
 tiN0NwbkzxA9LvhEHTThggZCq26ilOCs+QsgeS1XNLyvezhcNBLmS5ver789gtEPlgUg9I4Q2ps
 Jy64qJhkZj1bINieqkBuZZ1nJKd4VRfDkzL0NsjtUx84VFfJiUe5b0Xjl7ifmSsI/YWB91Ms2sp
 Q8M0SXrcnt/kB5xzm/BruMZGOxy1U5I6OXhd1E0c85PTNtHkQ3Se0xllUgritVkbr3f1Nffe2kU
 108OcWZrLgFqFKcTUUL9PhszBrQdvejU+iBvlcRdHjx5ozHTBNm45r3pBpNo/xfX2yrnPpNJVu9
 LzLYRAgNrKCSTcIiYWE2oa5oFXSYSudHs64WVK0x+/sUdZ1jkUIPlDugrYPrWT0orQd+W1ywnub
 Znn2JCp7XcOJVMHR7eg==
X-Authority-Analysis: v=2.4 cv=IsGL47/g c=1 sm=1 tr=0 ts=6aee1084 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=PAz_-FQ8hEVmOPYdF0yf:22 a=VwQbUJbxAAAA:8 a=aOCmZ3BWbme0XkIVnlwA:9
X-Proofpoint-GUID: 52IbyTj4kavTBmGzO_6pzPByJWU0lOg7
X-Proofpoint-ORIG-GUID: 52IbyTj4kavTBmGzO_6pzPByJWU0lOg7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX0RZExAkpAPUs
 6eX38lJsurLAMBgS/wNR9jp4XPHhgpDJYZr1L0sXYl3M1Z5M39p960cjvOCHPM9DwgTpzVtO/yG
 iAL3oWTel1gxj/TX4YzwjFQ3kn2wJ2c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01

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

