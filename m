Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793903420;
	b=gNgqYIfMsp0P0Decf2Lppkh3HMIm/CppSfFaA/rZL99ao6c8KsaMZShZZM1vXFqa5CSV
	 mqeuC/9J2TuIHq7F5tNaxuSn6nFtdzpcFP1yiVtGt4lRhS4LzohWTfeg8IrTOhXT017ng
	 hcujAWMu+xud1TaZ7R/suX6XAfOY1Cu55a2FaQlJIy04c21/fsNyFs+1k/mrJobI3VVhf
	 s5+oUi7e+YGVIKbIEBmiavm0OikoKd82NCVKnEQ6ZDPKxO361gJNO5LS07lWkXQnDpvT0
	 mxEGckbELdFNj4bEQ38t4ret4F88Y0LT+IuHn5dEHsVORmsM6ga3+nzboWMC9mS+aFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793903420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-FB-Internal:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=eV4V6Ql1yhUSOIj1G8kZxYoZiaKbhuIw/lAOeIWjF9M=;
	b=I2Lvym2KJkdJjBepYvDEcuFvvKf9kKVDCI4EMfWJgE3oeuQnbI5QwB1hyY6N8kOtcSP6
	 F8Hq/fx9bj/LZlRg2DKRrPjo6CAYZmCFT544Iyb+y3Kg5L9k+IwfPm26kQ2+abVKpB9lA
	 cqGEky9h0FMcxuftiA3N81aVa2JdZRXC7n/9qkzRB2GDTswsPVdChMcJsiaYIHpzlcOns
	 jUWxs9eT6iVUQ/bLC5KAF6IB8SIaKGaB4EyBk6q2IBlgWf2pyhOyc0DVU2zLSp0lDgmlB
	 SZtZaiI2EMwSXe7F95AqXhVBjO710ujRuhQOdavmMaLu+Lk4PRYBU0pavGUip4l2L8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=T8emXqUo;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B170D606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B170D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=T8emXqUo
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5ITeKF3625204
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 10:30:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=eV4V6Ql1yhUSOIj1G8kZxYoZiaKbhuIw/lAOe
	IWjF9M=; b=T8emXqUoqVc4kTuT7RyenACt8BFRKC2HrVq1TKtuJX6fh1RZSRp63
	OmFyza33VwCHdS2CnBiBZcEIXhXhncktS3LTL3eIGDnLe/BrVe9ZItYyejncS+VJ
	rLZjxN3EKiAalZC5s//I3b/OKYTG2yrGw4mtT5abzsWn1lirXe5sTyUfuG0qQNt2
	dIjYf9Gk0s1KfIMR0I2f7aU6lJ77Ml3viCTcpHYcpkuIzD1gk0RHPb9bji5QNgEy
	uW9k6Zlnvzg/Pp52TTaPK6z+i470n/Ndzu36EDKWw3ZhR/WhIlNodefNC8evCAxO
	gkhxhBfPf6H05VXXSTVC2TqcrbUuKSkAw==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hrq68ujf4-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:30:18 -0800 (PST)
Received: from twshared21535.34.frc3.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Thu, 5 Nov 2026 18:30:10 +0000
Received: by devbig197.nha3.facebook.com (Postfix, from userid 544533)
	id EB5882E80C129; Thu,  5 Nov 2026 10:27:06 -0800 (PST)
From: Keith Busch <kbusch@meta.com>
To: <tglx@kernel.org>, <bhelgaas@google.com>
CC: <maz@kernel.org>, <lrizzo@google.com>, <hch@lst.de>,
        <changfengnan@bytedance.com>, <namjain@linux.microsoft.com>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-nvme@lists.infradead.org>, Keith Busch <kbusch@kernel.org>
Subject: [PATCH 2/2] PCI/MSI: Implement irq_mask_noflush() for MSI-x
Date: Thu, 5 Nov 2026 10:27:06 -0800
Message-ID: <20261105182706.3700908-3-kbusch@meta.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261105182706.3700908-1-kbusch@meta.com>
References: <20261105182706.3700908-1-kbusch@meta.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MyBTYWx0ZWRfXzVQXc8VStZwx
 AXU1lylgr1B3ibu4tJMY1Lqqy6WsDrhPFMU2w6yAiM7NUIEuEAIf28JXsCr/lRuGBOWA/PZotKR
 oSMBkK4lddy6U6nHWgshWJig1KvtIyGSmYvL/mZIUYju4Tt2nDk5aAH6gnjNyndz3r4ams8JWhL
 S8tkTagC4OKhDDFmycaiGJ2/Nvap4xMM+az0t2Dtbe4tUH69yuFZvfFLGZdJNSi+h6tOXs/2LmO
 fqw4pvue4ksa7omuMRFbExx69CSD2PcBo/3hH+RD/ItTkFSg/ShGbSGv2m8c+ue87zg+P3Bx/iN
 E7BxCGoBQUyCxf+Y2J5MCQlETbzKDmJNEq3kgZOy+FgF/aBokPD1XJUuzVsESfQLRs8cYCQE2N4
 41ysPItZELUD9CgI1mNpOvi2rO9pNBH0plt+vNnt5N2N2tpJoRH3/3jttsdFz6fJbiY0NrvaH+9
 0f/ZeoUzALRuzazEk6Q==
X-Proofpoint-GUID: clpE_uObtnxbCGiREmxkMucuCl_5O9qp
X-Proofpoint-ORIG-GUID: clpE_uObtnxbCGiREmxkMucuCl_5O9qp
X-Authority-Analysis: v=2.4 cv=adP0Dhot c=1 sm=1 tr=0 ts=6aeccb3a cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=kkcUborcUVj0H7zxAXTl:22 a=VwQbUJbxAAAA:8 a=zwF_Yp6pZpUqULGlHS8A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MyBTYWx0ZWRfXw5bVeBkVHMHY
 GlpqX0a+QRGKyqVWpNUkUYQKz6F2KwfUJNa0YG2w09KAOm49ggzrIRFXvpoS2dGsbXded0moZ6T
 LFF+csZSjIxbVtkLa1Yh4hMvz4VxVkw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01

From: Keith Busch <kbusch@kernel.org>

Skip the read-back that flushes the MSI-x mask write. Parent domains
that mask on behalf of PCI/MSI keep using their own irq_mask().

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Keith Busch <kbusch@kernel.org>
---
 drivers/irqchip/irq-msi-lib.c | 1 +
 drivers/pci/msi/irqdomain.c   | 6 ++++++
 drivers/pci/msi/msi.h         | 8 +++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.=
c
index 45e0ed3134ce1..97bc95d592122 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -126,6 +126,7 @@ bool msi_lib_init_dev_msi_info(struct device *dev, st=
ruct irq_domain *domain,
 	 */
 	if (info->flags & MSI_FLAG_PCI_MSI_MASK_PARENT) {
 		chip->irq_mask		=3D irq_chip_mask_parent;
+		chip->irq_mask_noflush	=3D NULL;
 		chip->irq_unmask	=3D irq_chip_unmask_parent;
 	}
=20
diff --git a/drivers/pci/msi/irqdomain.c b/drivers/pci/msi/irqdomain.c
index 6e65f0f44112e..2b9a5a0c305fb 100644
--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -162,6 +162,11 @@ static void pci_irq_mask_msix(struct irq_data *data)
 	pci_msix_mask(irq_data_get_msi_desc(data));
 }
=20
+static void pci_irq_mask_noflush_msix(struct irq_data *data)
+{
+	pci_msix_mask_noflush(irq_data_get_msi_desc(data));
+}
+
 static void pci_irq_unmask_msix(struct irq_data *data)
 {
 	pci_msix_unmask(irq_data_get_msi_desc(data));
@@ -182,6 +187,7 @@ static const struct msi_domain_template pci_msix_temp=
late =3D {
 		.irq_startup		=3D pci_irq_startup_msix,
 		.irq_shutdown		=3D pci_irq_shutdown_msix,
 		.irq_mask		=3D pci_irq_mask_msix,
+		.irq_mask_noflush	=3D pci_irq_mask_noflush_msix,
 		.irq_unmask		=3D pci_irq_unmask_msix,
 		.irq_write_msi_msg	=3D pci_msi_domain_write_msg,
 		.flags			=3D IRQCHIP_ONESHOT_SAFE,
diff --git a/drivers/pci/msi/msi.h b/drivers/pci/msi/msi.h
index f987cf897264e..db4dc37888f73 100644
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -44,7 +44,8 @@ static inline void pci_msix_write_vector_ctrl(struct ms=
i_desc *desc, u32 ctrl)
 		writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
 }
=20
-static inline void pci_msix_mask(struct msi_desc *desc)
+/* Posted write only: the device may still send an interrupt after retur=
n */
+static inline void pci_msix_mask_noflush(struct msi_desc *desc)
 {
 	desc->pci.msix_ctrl |=3D PCI_MSIX_ENTRY_CTRL_MASKBIT;
=20
@@ -52,6 +53,11 @@ static inline void pci_msix_mask(struct msi_desc *desc=
)
 		return;
=20
 	pci_msix_write_vector_ctrl(desc, desc->pci.msix_ctrl);
+}
+
+static inline void pci_msix_mask(struct msi_desc *desc)
+{
+	pci_msix_mask_noflush(desc);
 	/* Flush write to device */
 	readl(desc->pci.mask_base);
 }
--=20
2.52.0

