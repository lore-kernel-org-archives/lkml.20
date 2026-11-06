Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986685;
	b=JXPldfs3EO1SgXgtqfqUajBvEMM6ddpilr1U75yUaJkw1+50la46Oa+sJq0nU1Z/r9yB
	 g2U/nP0AErWmFUnIcBhEaVEz53MjzjbInBOQ8pH+WqPY03e5kHFAZLCKrW4HllTWqYNh/
	 x7ItB9JKKWv9MTAAQPa+tpf5kIGQG1NrZ3mTU3Ix/RzO9hqom/pMR3v92NClTOgrgefs9
	 NAoAeSZGVWaKd7Ru3P+fK/kFqGFfWOTKBTH+Yj66WYg6zbIQb97HzPKDChQSLNwbYoNaw
	 NPKRjpP2uKwpoQSsG66JjuC7F+is97TwMbqpKqN3C3dXHJFL+VLcLBCPAcWzdWAucsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986685;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-FB-Internal:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=Aa1inciFCzYw1Srr/tci0p6G+k8c03Dt2gAFbSarJOc=;
	b=f9AoBbSCIZWr9d6h9dG7s7w3Eyr9A1JSUo0S0+bRp8dUB0U2+siRAWzr4H8NRz6u7a1H
	 DnInXG8jWXGJyOIeqlvqMumR5OtiR3x5BfyZOKfBy5tyaiTdYzKU/u2vrrGEXZEa84mCX
	 rsOnvsM0ZaQFpZat/AcDojPO3IUeOPjuNr345jFHWHefYASruQbsTcgaKzrv+NBQfHuVS
	 aaECPJ3SFxBQt9g22ipmBkNd0mCTZtHmlvT2GDZ5Qoyid/7X6kWchnjdgY+lrvqCNyKoe
	 Ucl6FVgjL8ZsHSnuFFt8qfnVLNeUik5yrNupmcBO+IRgA0sEKlxx8bMGLvpXd4t88zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=IO9RGWok;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4344B606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4344B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=IO9RGWok
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6HWTb71219991
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 09:38:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=Aa1inciFC
	zYw1Srr/tci0p6G+k8c03Dt2gAFbSarJOc=; b=IO9RGWokpUqk3ljwDRugG0NxN
	vtZtht1R1cG9huXjIcWFdhoMthQOefBihrp6P4fmVny9bjBcOvWZpUXH1Uot7tq3
	PbnxVYGHeuF0YuyOjWW+ULB8d2S/jae/lubKt8MmB5qrsK2GoBu8c9FJwPkGprcZ
	/Tp7FhaH1HRKz5l79H1rWqgKQLmx6dzezXZhdsJNZJJPZCz7BueFiPkievH9jx1P
	NvwVbBs2jx4pH8KEqUEsZMPrXfECs0zbtwlwGvCT3hAR1ELK3jsd+8lbfd9dsnUi
	mKAAtwOs1iPaFAdslvIPwj6a2Culo1UC/2MMQ0o+iucTcPf859meXz8sNV5Gg==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hs3r6nnrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:38:03 -0800 (PST)
Received: from twshared31846.02.snb1.facebook.com (2620:10d:c0a8:1b::30) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Fri, 6 Nov 2026 17:38:02 +0000
Received: by devbig197.nha3.facebook.com (Postfix, from userid 544533)
	id 72ED32E8DCB9F; Fri,  6 Nov 2026 09:34:48 -0800 (PST)
From: Keith Busch <kbusch@meta.com>
To: <tglx@kernel.org>, <bhelgaas@google.com>
CC: <maz@kernel.org>, <lrizzo@google.com>, <hch@lst.de>,
        <changfengnan@bytedance.com>, <namjain@linux.microsoft.com>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-nvme@lists.infradead.org>, Keith Busch <kbusch@kernel.org>
Subject: [PATCH v3 0/2] genirq, PCI/MSI: mask without flushing
Date: Fri, 6 Nov 2026 09:34:46 -0800
Message-ID: <20261106173448.34794-1-kbusch@meta.com>
X-Mailer: git-send-email 2.52.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX7T+ev/qEzmxM
 p5tUg7ltbm1kKJiWsZKI2vDRpSMGEBmcgrda89OmEi9skdP5VZqh1PsSr+ekiDM/aVtg4KxH2bT
 agh87h6Ah4VQaxHZ4CN9Dp1K/5OLl5sv7w3Ed8rLBcixATxSQNiJg7z5s0YquECBLw7wheDIQs8
 ayKLXni7s8MCsoUCmn1EnqCcAGWMwhZ8u9cE6W+RkSWb89FF4GyDF5CuxAAfJtUXV+RtIPnWnIt
 jyQzTGrsin2XBbSqS9DqO/cRJ/pzRW1ui8hNnxhelbhZDZthkiMPz/v34iQKtpm63vr5zBJ1jSX
 Rtb4xnsLa3nedlXDlqUr1YCeU4QvKgtpxq3kycdDKmXKXu3h3fCYSsWCZPD/zSvPV2Qv4slEp2p
 LsQTybtOjStf2uBHjjAxcw9cvzAEiWXOMxkj/YQiFblXZxrKzQ42jycfOUd3LYBwsPJeMc2Z2Lj
 oUTR0i7tCLtcUy6nyTg==
X-Authority-Analysis: v=2.4 cv=IsGL47/g c=1 sm=1 tr=0 ts=6aee107b cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=PAz_-FQ8hEVmOPYdF0yf:22 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8
 a=TAX1gFrxjG5BdyIcG9sA:9 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: YEebd2R_ZLXJdhRgaBVJ-BSwxVC58Pbz
X-Proofpoint-ORIG-GUID: YEebd2R_ZLXJdhRgaBVJ-BSwxVC58Pbz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfX4X095TrxJjI4
 4gSvAb3rTYZmesVX4vaH4L8Am1CaClnW8h8iruH4IC1tBPaj+IKM1Dl3T7gMNRKo5JupLBjZEIw
 3bB+ODBnZCxWnL+LMEax2ou4zSWijBc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01

From: Keith Busch <kbusch@kernel.org>

This adds a new irq api, disable_irq_noflush(), backed by an optional
irq_chip irq_mask_noflush() callback, and implemented for PCI MSI-X. It
writes the mask without reading back, and is for callers where an extra
interrupt after returning is harmless compared to the added latency of
flushing the masking write to the device.

There are no users in this series; the hybrid irq/polling work from nvme
is expected to use it when switching between MSI-X interrupts and
polling, so these are posted separately as prep patches that are
hopefully generally useful.

RFC with the nvme usage:
  https://lore.kernel.org/linux-nvme/20261013223543.395054-1-kbusch@meta.=
com/

Changes since v2:
  - Just the commit log to use the preferred "MSI-X"
Changes since v1:
  - Keep the channel offline check guarding the flush read in
    pci_msix_mask() (Sashiko)

v1: https://lore.kernel.org/all/20261105182706.3700908-1-kbusch@meta.com/

Keith Busch (2):
  genirq: Add disable_irq_noflush()
  PCI/MSI: Implement irq_mask_noflush() for MSI-X

 drivers/irqchip/irq-msi-lib.c |  1 +
 drivers/pci/msi/irqdomain.c   |  6 ++++++
 drivers/pci/msi/msi.h         | 10 ++++++++--
 include/linux/interrupt.h     |  1 +
 include/linux/irq.h           |  3 +++
 kernel/irq/chip.c             | 31 +++++++++++++++++++++++++++++++
 kernel/irq/internals.h        |  1 +
 kernel/irq/manage.c           | 21 +++++++++++++++++++++
 8 files changed, 72 insertions(+), 2 deletions(-)

--=20
2.52.0

