Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906357;
	b=jIt+tzjLjlLdOXc9K9M/R6kX4ASQAgb/R4IW/yEDKmbpGDwe36UNd6g042nX2wdckoWR
	 W5wAH9CAcLhTgkLfGsC/UtiLlKKEpLNQJpOiEl6jcuZNNJjoKMY0lyR5j59nj5hvUiS6F
	 pMyzRO4tX5af9L2IjD8aIGjhQ0d/k2Sia1yTCSCPYi3/my0x1EZJtfxszmFHjNo1eD8pI
	 51y+jpM/hirfBROsHPy36+6S/m3AL0tNqWo5a/bCkFOXYqIzEFcFgSZgfhNS87kUoyMkV
	 +Rg2Z1NAlP7vLieXRb9aZU5foW5jsaKNL3H94cDYV/wvIahr/sMBkvDodnRjo1ZEFaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906357;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-FB-Internal:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version;
	bh=2u2HaXWVBlsAShP0j1POHMWxhhA5tg6guUv3sGangSk=;
	b=QUShXzDnhg0e0bJOoz/3xnC2RMxr4dK+wiqUEzhXg0Ib2rNQhRSgKsvk4edParnCZkWZ
	 wcMBTU+QOwWriDRv9jadbHogTv7zMBQOf7i9ntxn43gnmxWW/PXzcXBaICbdm8pK2VbSX
	 1pzm+89AS+a+IqKK/AniKEUF7Vg9JdGd1QtY4JnScpJPgJuCyNXmodtEdoOYwvC1w+7Lb
	 +35+bpPs6mz4VKuO1tOs4Dvd3RgEmJdS4YmrfaPpgwuQv+cC0Mfb8ryzhLlG5zBcvc0lY
	 r+6k8wCGGINyu1CB/osc9EVwXkafW5OTSFelM1OxeuCeHbc7Ta9lacZLOE8PVAnFIPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=iaNcJSjq;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66E6606A33D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C66E6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=iaNcJSjq
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5J5qn8737403
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 11:19:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=2u2HaXWVBlsAShP0j1POHMWxhhA5tg6guUv3s
	GangSk=; b=iaNcJSjq+xKM+jm8kXik2b60JEih0xOzmPbTcN/vQL4Gb80hb5D7d
	qh98FI6PlZZD89dB3UwK2wqdJweOG+hSz+hn9e2mT24qI6rhL61ZUrFi1Z/T6U3E
	baDG/kN3F0rTNuQdsNyNetGmFdUrtoxXTnoBqDBhTOo31VDUEfhKrOYv5dh52HL6
	8y4xV60zKsNS2ij279XDsBtfQjqnvvzPfgK1QZgP2b6Dre3y8xUdI1H27TUGyMIG
	/ZMjvxOEMSUbXzvgWdJsTPTGtcvfNAaoXp1KrHwe+qWnc5vKEbsGD2pQtH6lpD7y
	Lq2uQmsBmnhQFx2EGOrc+ACOcoTfk3ebQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hrbcj0ktt-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:19:15 -0800 (PST)
Received: from twshared21535.34.frc3.facebook.com (2620:10d:c085:108::150d) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Thu, 5 Nov 2026 19:19:12 +0000
Received: by devbig197.nha3.facebook.com (Postfix, from userid 544533)
	id 0E84B2E811C68; Thu,  5 Nov 2026 11:16:01 -0800 (PST)
From: Keith Busch <kbusch@meta.com>
To: <tglx@kernel.org>, <bhelgaas@google.com>
CC: <maz@kernel.org>, <lrizzo@google.com>, <hch@lst.de>,
        <changfengnan@bytedance.com>, <namjain@linux.microsoft.com>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-nvme@lists.infradead.org>, Keith Busch <kbusch@kernel.org>
Subject: [PATCH v2 2/2] PCI/MSI: Implement irq_mask_noflush() for MSI-x
Date: Thu, 5 Nov 2026 11:15:56 -0800
Message-ID: <20261105191556.4042191-3-kbusch@meta.com>
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
X-Authority-Analysis: v=2.4 cv=PYtqFShd c=1 sm=1 tr=0 ts=6aecd6b3 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=crHB47gyY4rKiduisYu9:22 a=VwQbUJbxAAAA:8 a=hxC21McARV9yLVABsx8A:9
X-Proofpoint-GUID: VeCsnjPqzGnwn1aOgmwWjbVGheHA7F1k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3NiBTYWx0ZWRfXxyv+QCkBGQnt
 i3Oa95pOoBJPKh+/pEU5PL0Z7B8/n9evvSJBFzEUPnHEyRynNXpNJfOYseIVzcvJwmOwgLxQDF8
 4+BXO7gR+ONDVEPm/dzm3KLsSz8ka1E=
X-Proofpoint-ORIG-GUID: VeCsnjPqzGnwn1aOgmwWjbVGheHA7F1k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3NiBTYWx0ZWRfXzyzUoMcyX2BM
 R8Io1ZZM2VJIkJaWnuXoRhBDogYsbt9iN+WWA+VhJPzpHU8MFbjZmJxkRH20Dm937W56Rubfxeg
 5G5u3206B6/DMQCYLOwE/vSoJT5zyvf6vv4K4v03s/t5NPIhOqJuoyNr9Ao8BAKxTkObrMryJ3S
 J0FmhzSwPSUmcjvERT0ezxmVAmNQHg7ZgBO7zrMrLzac60XHl40OywKgRO1Tt3rlvip26fwn1qR
 2drJGbXa1zNA98xOlaYyzjs8BYIeMXKVurfdpc1iM7TcNCTmnCB5F0sq+ZE8oaz3HwOajOc0KUP
 G+21qsgpZ0ZR7RMU8e/0CUM1zuS8NDu37uQqSkiyU9cXrxOycMYMGa+usyWtV5yB7y+7MyFenmI
 BRrBt429XasrDpOUcNiK8V0pwLvO+XcR1HGCVsVAo3NuJsI3aE+ZYLUUb49LxjMuiANgcTX1lqZ
 9dFNpSnT2jNmELnn4Dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01

From: Keith Busch <kbusch@kernel.org>

Skip the read-back that flushes the MSI-x mask write. Parent domains
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

