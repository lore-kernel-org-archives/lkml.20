Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793906349;
	b=jV9EBpAh0xqm9c9men34aOEQzxrF+GtYMxqzT/MpmW8TJIAsP36NoMSFjqivbXZyZSXh
	 CwB6YJxgngkUtFAFWe/mWWngZWWurBeJETaPy1j74M37ZEvi/5LLj669x/30rjkiD4l3V
	 +3QI/4ynq0PEi5FNbXwkjS/8E2sPnBjrTyVpyFLiaiWd72db8nttYbbfHyqLnjoHCmMfH
	 9jfGOm7x8EKGr6kXiPv1YpUlutupPs4jA6jj77YOk2sye+hFlXLxyZI6OLk0mEKcA+489
	 VNV8GtuZ8ziTr2F1vWyjvOuMlX7cv9iDVSMJ+GJgNq1IntOGHZ+r8K0nTdKcQ+HBr1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793906349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-FB-Internal:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=vuMKL4MeBxIRVdSpKFbvUMhYO/YtfoToNH2hzrzeago=;
	b=iE0eThVsXhYIstbuFBMDA1Q7vcYFsNSurnCBWGccVba/lIUt+fqjjLeoT28VH3JX3iyY
	 HUA5zttlDA9nFLynI/c3RCZR/gBloBSqedohl2YJqEP3gyF0OM9eIpzAcX38cxGXDXhHb
	 uE2+Zvp5Nc/X8H6MupF9OVOOkkzUgfA2TlZLZPwpKcl0Vk3t3jkvEq0MaPfKTqpIDnNpQ
	 4XYIRk/IFobCtzx4SyrIiLhbB1RxltSYqDIygOfZho7BrZHhfA3e3shTiPFZzZK33iJaU
	 05bQI7S0A6cAiqJ3B0CfRsrknPNDXzTcMwzVMayph7e3ZxWFwZw8moPpmjpdQ5IjdUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Olw5oDdX;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC70606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DC70606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Olw5oDdX
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5J5oCs576959
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 11:19:06 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=vuMKL4MeB
	xIRVdSpKFbvUMhYO/YtfoToNH2hzrzeago=; b=Olw5oDdXMTbpDd96kwpFhMmQ4
	xR0an3jViZ/tnQFrtdbYuNE8dZDw3UPUR74l5BdB+lEEeRXRk8owyEvnEHhnYJUp
	4dFZRVx0gmh3UFqsyd8ML7IbCf+Nx+aNirzqbFUuH6zK5Rg/gnsVHrQiyOWtWSdk
	CsPxpy6zFOOzikHT10UM5vhxRiwu83lKhDv+KkvYzLn82apA31oghb+i0k+H0Xmh
	Vn0kYGh+aI9jNHuaQdHP1g9wRzwU0DYzp7Jtve/ejvs7UN6DaVUbkwxfkVhxM9K/
	eQQknQW/MNMgTmSOfB9z1/xjI5eBINTw98vyu3yplM8Vflg591gojgzdVKERw==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hrbck8j7p-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:19:06 -0800 (PST)
Received: from twshared18199.01.snb2.facebook.com (2620:10d:c0a8:1c::11) by
 mail.thefacebook.com (2620:10d:c0a9:6f::8fd4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Thu, 5 Nov 2026 19:19:02 +0000
Received: by devbig197.nha3.facebook.com (Postfix, from userid 544533)
	id F296F2E811C62; Thu,  5 Nov 2026 11:16:00 -0800 (PST)
From: Keith Busch <kbusch@meta.com>
To: <tglx@kernel.org>, <bhelgaas@google.com>
CC: <maz@kernel.org>, <lrizzo@google.com>, <hch@lst.de>,
        <changfengnan@bytedance.com>, <namjain@linux.microsoft.com>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-nvme@lists.infradead.org>, Keith Busch <kbusch@kernel.org>
Subject: [PATCH v2 0/2] genirq, PCI/MSI: mask without flushing
Date: Thu, 5 Nov 2026 11:15:54 -0800
Message-ID: <20261105191556.4042191-1-kbusch@meta.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3NiBTYWx0ZWRfX+IifLdFXs0LI
 PnMdM4KzUewKMfiQEn1JZ/PiVrxo/BLN9rbCzNMyDRPBjJGYG573kvR0fB726MkHnQRCFHAlIZE
 9lO3BXEdNntLCJVmurZ9OPhB7xL2rB0gZfxEMU1NSuvr1s6CQ39Txi0mpuQ0oEdmGI49tX9AFtv
 CpoFV7HyZSnMPOzI/nzLqPvAFs8xoUlBA9J/be7o0vdcbXUTujOdmcIPnjJ1bdt9yuDbKY7eL2f
 GXU/sW4wvZShxgnhXAHMBvtn7T78qg8fLeNUgDbrqlOSqDJAw4zg3VfKKS6bw3RIfvE81MIK/1l
 S1MY2ZuQ4fo/B/7zj585PVT+7JN6eF7xJoOg+9+Y3X3+fNmpoE7qqfr8VBVNSmnblIaY6m0CTNm
 YP5l1C3TsfRSnYv4dlIjeuweyKgCAZf2Wu1cHH7B+js1zlP4rqKifNRcCXHtx1pi0FEr/xw0D7r
 sMXdcvzY6QkTFMhi/qg==
X-Proofpoint-ORIG-GUID: XSIPWi3NIbYHEDA-m1Zi5ht9o9gfYw7L
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6aecd6aa cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=03ozwUkBphtHgyqjj1sw:22 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8
 a=TAX1gFrxjG5BdyIcG9sA:9 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-GUID: XSIPWi3NIbYHEDA-m1Zi5ht9o9gfYw7L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3NiBTYWx0ZWRfX6jtqV7+bLMrP
 PKWREbHrPBsp2fAh7ScD8fbxM67CTnLLQ3dfA6weuPMPAc6ZSfd4/UFDh05QuUWqUf55FAXdiPC
 mikxGt0r2FPzjo7TUZtXbaqW44EmYcg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01

From: Keith Busch <kbusch@kernel.org>

This adds a new irq api, disable_irq_noflush(), backed by an optional
irq_chip irq_mask_noflush() callback, and implemented for PCI MSI-x. It
writes the mask without reading back, and is for callers where an extra
interrupt after returning is harmless compared to the added latency of
flushing the masking write to the device.

There are no users in this series; the hybrid irq/polling work from nvme
is expected to use it when switching between MSI-x interrupts and
polling, so these are posted separately as prep patches that are
hopefully generally useful.

RFC with the nvme usage:
  https://lore.kernel.org/linux-nvme/20261013223543.395054-1-kbusch@meta.=
com/

Changes since v1:
  - Keep the channel offline check guarding the flush read in
    pci_msix_mask() (Sashiko)

v1: https://lore.kernel.org/all/20261105182706.3700908-1-kbusch@meta.com/

Keith Busch (2):
  genirq: Add disable_irq_noflush()
  PCI/MSI: Implement irq_mask_noflush() for MSI-x

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

