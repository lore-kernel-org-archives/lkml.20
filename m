Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.153.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793903416;
	b=YuX6FpueGe00Cm5uK2opYUAGDi0tK/5U+lBUBlQsgm1J3yTUTNt3mAZR+WJ/A8PF9WWA
	 qPP72yE3UoETf39K3shbOFneXY5OQdfcWx+4tIi2oG7JmLCVFEkdCqKB/XhANMfDEdMi3
	 +BYGx/ty5G1ZDm7KJDSpe0hGWG4hEH6Xn+CRcwi/jJ0uBvQcMHHI7zLtqWeIgawR5ap01
	 UBU74+9ZEjKJ8ZxteFh+MTQBgclcZgnZjoeeM2GSy2zqKYw6X8Uulmt8yV+3EG1LUjUfH
	 P2fMCmCqI5DMnPeYOzDeVilXAOqq+VWCrv8Jrp89NtWmeXlrup/cWUE0ySHtDJANtng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793903416;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-FB-Internal:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=ge6S26TMgHzYn7CB5Vllm5OsMg5f83lV+CM0P6k32bk=;
	b=l+eFtfBKrxIy8DaRVuHJEA3E29A1wf/o+HJ61fxtyx1wjcr+CvL/cqHc+oZT6WMXYlSS
	 PvuD5oM0k9wEedp8tUDhBT1b9LEleRZ+dGPOZMGAKGK551JLbOeWY4c4JJY05QGcKH8ic
	 FTMtID//h2pmdalUC2YsWURZ+YSEyEDF8UPqIUsLGmYmaWbljqybVtA5OCB7fsCUqeRio
	 14CHVHx9j8jRYYTgJkIyDEzk1legqH2ERySDqxxAQiCH6/e8EpisrjEKd7XpVO0G+ejPe
	 KTCGAd3mXTGMA3P2GV0VnQYxKF34FaJV+SM5J79Y5TXmVE+ADYK9a9qldbkHQ0kRJFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=JApOvJMj;
	arc=none smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF5C606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AF5C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=JApOvJMj
Received: from pps.filterd (m0528006.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5ITeK93625204
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 10:30:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=ge6S26TMg
	HzYn7CB5Vllm5OsMg5f83lV+CM0P6k32bk=; b=JApOvJMj1JmRjH8w/fAAp1jmQ
	EiuDYbJXzlS3l2CmqsYlxdUuN/MaCm5EWdlHGW99i+/P5lyzzGWLUOdM8u8ukz33
	6YwGUwvY08SvnZArzU/5QaqoDPsMZZde4HdGVKz1yaiqLFbDqmzw9WIibA4veiCW
	AvLNlz++gJ0yZvkR/a68yq9aLUBFvGDdxNbopnHict9YwwX4hXREEiQ3k/hR9pfw
	nvnpV7cRTFDpInrtrlNLzB55u0CvX8ciaAPympYJlpi4uKWYzBfueF1EMSsx8l5v
	0qpUasOOmnPy2XlrA2ln96qZUjqlJxK/COZAnDWV+8RDhKqtjZE0TvPjMwGVA==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hrq68ujf4-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:30:14 -0800 (PST)
Received: from twshared36767.32.frc3.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Thu, 5 Nov 2026 18:30:08 +0000
Received: by devbig197.nha3.facebook.com (Postfix, from userid 544533)
	id DA8002E80C123; Thu,  5 Nov 2026 10:27:06 -0800 (PST)
From: Keith Busch <kbusch@meta.com>
To: <tglx@kernel.org>, <bhelgaas@google.com>
CC: <maz@kernel.org>, <lrizzo@google.com>, <hch@lst.de>,
        <changfengnan@bytedance.com>, <namjain@linux.microsoft.com>,
        <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-nvme@lists.infradead.org>, Keith Busch <kbusch@kernel.org>
Subject: [PATCH 0/2] genirq, PCI/MSI: mask without flushing
Date: Thu, 5 Nov 2026 10:27:04 -0800
Message-ID: <20261105182706.3700908-1-kbusch@meta.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3MyBTYWx0ZWRfX4VFyOr5nO3pQ
 DhnuiJRew2Y0I+WwTJcYUu7Jl0GIg/ZFuy0tmTpHkA5KZPFA0Fc8yr5eAa69dv8renBHH2gdp+U
 5hjVgA+KjDwMT4flj3vbxz/91d67P7XO+qgXIZvFnPT/riYAadF6pEu9ZaE9aKS9PxVq+qMTocf
 bpiMPe/1ddIRcKsZRHMNtPrH0Zk6sF6xU53Q7Eq7/j6rxk4xn8bSDLBvM5/lYDdPcQw1ZYjXcrH
 035FFfTUlr8LgIBgOVuGzIxkHqKoxLKQ0InPeyew3Nm9JOJe8DORgIpSlrD/6VN6NauWgAL07+H
 I9P0tBXWnyM3y0iIp60AoyNJi988zDPFhjs35T74o97YimD5POKzKSLFF2Z7xxTkqw9oYoqkAAt
 Tnx8BOoqdMJcPJGbDhYkOgZyu7moRnxwUD/KVWNreiY4cFnKYFeHdQ2cv3Xtfwp8Ov7nZWKYB/h
 swZs8Y6zKHRo/ccdJgw==
X-Proofpoint-GUID: _PM1Y6p8nPE3lI0hyznnWF2v7QfQkDz3
X-Proofpoint-ORIG-GUID: _PM1Y6p8nPE3lI0hyznnWF2v7QfQkDz3
X-Authority-Analysis: v=2.4 cv=adP0Dhot c=1 sm=1 tr=0 ts=6aeccb36 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=kkcUborcUVj0H7zxAXTl:22 a=VwQbUJbxAAAA:8 a=VabnemYjAAAA:8
 a=TAX1gFrxjG5BdyIcG9sA:9 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3MyBTYWx0ZWRfX4hlGzKJUebmc
 nSmRqmUonD3KtwL82VxUVDNeollo0l0/n/Pawv/w17XL1oflru7xI1QICuKojqYLE3m08zGS3UC
 mHEumC+UtY4zRfmhrADyJFSX2/oXqLo=
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

Keith Busch (2):
  genirq: Add disable_irq_noflush()
  PCI/MSI: Implement irq_mask_noflush() for MSI-X

 drivers/irqchip/irq-msi-lib.c |  1 +
 drivers/pci/msi/irqdomain.c   |  6 ++++++
 drivers/pci/msi/msi.h         |  8 +++++++-
 include/linux/interrupt.h     |  1 +
 include/linux/irq.h           |  3 +++
 kernel/irq/chip.c             | 31 +++++++++++++++++++++++++++++++
 kernel/irq/internals.h        |  1 +
 kernel/irq/manage.c           | 21 +++++++++++++++++++++
 8 files changed, 71 insertions(+), 1 deletion(-)

--=20
2.52.0

