Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986689;
	b=cUUNFaQR/XX+EzLrj7zbU+iDF8kYAvJw7ERAMtC34QisLoTiIgDoqrzCfCBj9s56SCNm
	 VifkRIg31RL08PX4lpGAKJUkSWw+/9MjXD44RIzQTsjJg2Ckk5NlWghpwm7cfhq1EhSCO
	 6dUSQ0uAXp0dqM9h1jvJOm8zy+SJSauCdhi4NHqPDZzsJuazzwTrukcp3zLa5D9qOqi07
	 3cdRKtYaLikDXH10IjrfPgdzPLttOW8Sl+VyU9Ud9Ud0RQaO5gPHuQifqeo0DHdO0oDWr
	 djRk5e2ZilbC56ezGqDxWzUxg6uPHpr7v3P/joIw0sl9wltJPYmJwtMMuAQY/icBD3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986689;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-FB-Internal:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=54s/XY28gPj1MdKye4HEZJivjTWRn1il+4R4YG/d41w=;
	b=4A4B4JJHpp3bQRjG9hleYz0zQeVJWPNxazuRz5KZmRlTwTKY82lfIkPJcN2kC3Brl9kV
	 aWrqgv7Kmnd6wsD2MUMWRSwJfAwv/waW/z8ilDAvR3m/fCVOqwidK9HI7twmcetO3LnSz
	 lhkWuq+acyJ1/GOkBYSIWX98XJuP3wEi+hSOzcPRtpY1VgrhrbSVOzS9eRTCkLwV/z/2g
	 Td27Vx8pSBx9nMrXY/qP7c+TWwUHrtxgth/wUVF/FE9MIJxq7+roaDNuwaaaLFQxqqkjv
	 T+pcCxi2ccMrTwPZ2bKN2+00u8QQRIf9YGCxiXMy3AIW5SZqJbZCeLXHrYvzEVe5cPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=V6bzAZZp;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE396606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE396606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=V6bzAZZp
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6HWuKE3339540
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:38:08 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=54s/XY28gPj1MdKye4HEZJivjTWRn1il+4R4Y
	G/d41w=; b=V6bzAZZp/Rc2cTsp8cq5olqq6mtXTE6YVi+1+c4PL6W/fnsbpLW3Q
	JszVcshdN8V/kLGzX0PV7lxGEghED6LFpHhvbi7KSuRv1QRGv7Ipb1yoUEi4jzlI
	WcVWXzdBHnDOxr1QM3LVUcFI0kvF8DjzxMqWV9P7gy+oIxCGlAD//GzHbgJrxn6g
	e32OlJwxFKkz7wlVw2ty8Y2w7zsDkcoFKAb0phnZoNxw6kh4jFVnTdA3v/Bjq1Qr
	oQcRnYOsLdX3ep6PF2q3V69BSSAyr3oP+8I5l6F/3Y76fi9+tiQ2xJEYsawJBMqw
	2sfH70LT+viIkaEUfLOqp9CvvxNralw0A==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hs3r35njn-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:38:08 -0800 (PST)
Received: from twshared8585.02.snb3.facebook.com (2620:10d:c0a8:1b::8e35) by
 mail.thefacebook.com (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 6 Nov 2026 17:38:05 +0000
Received: by devbig197.nha3.facebook.com (Postfix, from userid 544533)
	id BE5952E8DCBF3; Fri,  6 Nov 2026 09:34:55 -0800 (PST)
From: Keith Busch <kbusch@meta.com>
To: <tglx@kernel.org>, <bhelgaas@google.com>
CC: <maz@kernel.org>, <lrizzo@google.com>, <hch@lst.de>,
        <changfengnan@bytedance.com>, <namjain@linux.microsoft.com>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-nvme@lists.infradead.org>, Keith Busch <kbusch@kernel.org>
Subject: [PATCH v3 2/2] PCI/MSI: Implement irq_mask_noflush() for MSI-X
Date: Fri, 6 Nov 2026 09:34:48 -0800
Message-ID: <20261106173448.34794-3-kbusch@meta.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX4G79HdS6vV0e
 Yzrw6kzbIYLgK1GS8e880qIConCy2SiybjZjW+N7bY1Rl8xHuWWuD1UJqyi2rDQQIDGiJNrCvC/
 f0j3Syskt//VcWLx3TT1I46gsB9KAgsjSwx8EQKM4bAqsgVfvv7EFVq9iVG6ogmqYCk1ctrbUod
 aI7Q3iQmkURLlq7P8LRiUyH00/uDO2RBjyrxZEyJMLao5QO4wQOw/fQxurb4zYzWt/h76LXAQTa
 qFigf1PGnPWWNJU7XS6rVqvjNgfCvrRSqQOKt5itSdk/fjek7ezYIBSAEeV74wFh46DymInQCVp
 TC6rmoB5e13ddVMsNAMSd5sG3O6X/egMAdxo6ocyfOaL1Fv+Gj3BPh0EN/OPsa/ZexSLp/oDH97
 mnWhlAyNh4k1+G212iXehvuu/RyIm5xnkWY5D7r6pqH5HCFRP/lLLdNpIN8ZpKvtcm+jmjnIe58
 iuIYDCYfw0DFF+xo2PQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfXxFu+McdjU5CO
 eCysvqW/9mC53oTahVjTPQ2/+e96u4LjmheTKWEQ3LVSMvyFL/aHXxPcy2ShNOxe9TEdbCJPZUl
 j1Gd2jjvXxc20rUGsgbgHPbJKZcvV9c=
X-Proofpoint-ORIG-GUID: 2RWzcDlWvx4gHelZqocvb9yjGKyOB-y_
X-Authority-Analysis: v=2.4 cv=N468hG9B c=1 sm=1 tr=0 ts=6aee1080 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=03ozwUkBphtHgyqjj1sw:22 a=VwQbUJbxAAAA:8 a=hxC21McARV9yLVABsx8A:9
X-Proofpoint-GUID: 2RWzcDlWvx4gHelZqocvb9yjGKyOB-y_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01

From: Keith Busch <kbusch@kernel.org>

Skip the read-back that flushes the MSI-X mask write. Parent domains
that mask on behalf of PCI/MSI keep using their own irq_mask().

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Keith Busch <kbusch@kernel.org>
---
 drivers/irqchip/irq-msi-lib.c |  1 +
 drivers/pci/msi/irqdomain.c   |  6 ++++++
 drivers/pci/msi/msi.h         | 10 ++++++++--
 3 files changed, 15 insertions(+), 2 deletions(-)

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
index f987cf897264e..c40d24e5ca901 100644
--- a/drivers/pci/msi/msi.h
+++ b/drivers/pci/msi/msi.h
@@ -44,14 +44,20 @@ static inline void pci_msix_write_vector_ctrl(struct =
msi_desc *desc, u32 ctrl)
 		writel(ctrl, desc_addr + PCI_MSIX_ENTRY_VECTOR_CTRL);
 }
=20
-static inline void pci_msix_mask(struct msi_desc *desc)
+/* Posted write only: the device may still send an interrupt after retur=
n */
+static inline void pci_msix_mask_noflush(struct msi_desc *desc)
 {
 	desc->pci.msix_ctrl |=3D PCI_MSIX_ENTRY_CTRL_MASKBIT;
+	pci_msix_write_vector_ctrl(desc, desc->pci.msix_ctrl);
+}
+
+static inline void pci_msix_mask(struct msi_desc *desc)
+{
+	pci_msix_mask_noflush(desc);
=20
 	if (pci_channel_offline(msi_desc_to_pci_dev(desc)))
 		return;
=20
-	pci_msix_write_vector_ctrl(desc, desc->pci.msix_ctrl);
 	/* Flush write to device */
 	readl(desc->pci.mask_base);
 }
--=20
2.52.0

