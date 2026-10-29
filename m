Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.207.212.86
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793254270;
	b=23iAcAggaWuqk5ksRgtFJPAoVWFolNeaaNzoiMofj2gw+3ZlPIFGbYFWpMLmt4kUcPAk
	 +IYCJXdYE3kAELwAAUm44MiZ+GQxj52oZec4OAdO0tu8P+tgNQA0U4EWDCJ+U8VKksNb2
	 X8Td7yWBu+cpP4rZ26k9hROnCU2GUhQOhSnkpmXa3Xh4TmqIjrAlGD41Khc+UGW/AH2IR
	 ilPyiYMbpZG2SnWI+peyXfmYS7ZLb64+QPN/n5HXbSkZDYRhK+0AcVT6h5gESDGdjf0yD
	 cglGuc7hl11cMYvbrDpIKSBobJD+RllrC7JlxDfPOrVyrkPEx8UV1pSOdBsy8qXQZug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793254270;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Originating-IP:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info;
	bh=skr222lx5y9b/nfDvYW96T8hrnWFf4QPQl8CDYkFwS0=;
	b=3Qn109sXMgrj4VV3CW8JTPeFbw4fOqCSYvQoqdxf9uyCHdcumk1iU1Mf8nZ51BEkvVDc
	 OXYxOCdQjdq1AmCeh8Hj1UR0lavcx6bSSHmdtBwuqPKoTly/v2NxF2kVIzoiA/rFT3iE0
	 hSKsTZ+EnLsxnt5+7qEsMP28xa/dbSYSU8s85MOcliar9JkSnLGAS/8nIoyBa4DZs/9GD
	 jSsKJpBmVx5zDxR2jLAbAGc4q03oqG+pYO26LrZz/OQfUW2cMwq26Qec3XXP+Sm3GJ9HP
	 jXKNV2wjT89gS7o2Mo51MkD7JhnFojh4ttfHJ7YXcw4t3kS2UCsK0AaaJsfObFdwhsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=Vi2S0iv4;
	arc=none smtp.remote-ip=91.207.212.86
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E821D606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E821D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=Vi2S0iv4
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T652WU3047993;
	Thu, 29 Oct 2026 06:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=skr222lx5y9b/nfDvYW96T8
	hrnWFf4QPQl8CDYkFwS0=; b=Vi2S0iv4tRdjKQi4Xy04UPhBFwaYnmuFpZJ87o5
	NVSlztk8x4ReyBGoi6KlTcPlRJJQYW/ITM2RB2vcGYENIdjasdSHZEEqKHXzDVeU
	HwRJAw7/tSJ16x12r5Gj1QZkYGl4F3g/sQUeQMKfafLDn0fPkG56SglIPGkbWNQa
	K1flGfeliB2Rvcez/hU5Hft2z5kMlnQCWQzb9qfdfpfUPOCBg61uGyh31u7piKmH
	7Ii/v0kvFJT9o5B+0remWVgj+nEL3Hz7f+J2AOOET9ga95aJa8bjWaDyoxx8JT8E
	dYQj3PWvH+NKs1er+V/WfNTA6K58TVUOGwokE+ZGML+bM8w==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hkvd1048d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 06:10:47 +0000 (GMT)
Received: from [127.0.1.1] (172.25.10.25) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 29 Oct
 2026 06:10:45 +0000
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Subject: [PATCH v4 0/4] drm/imagination: Clean up MIPS firmware interfaces
Date: Thu, 29 Oct 2026 08:10:11 +0200
Message-ID: <20261029-b4-simplify-mips-pte-defs-v4-0-9656041e040b@imgtec.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEPj4moC/43NTQ6CMBAF4KuQrq1phwqNK+9hXNB2gDHyE4pEQ
 ri7BTcYE+LyZd58b2IeO0LPztHEOhzIU1OHoA4Rs2VWF8jJhcxAQCKFVNwo7qlqH5SPvKLW87Z
 H7jD3HMGgzBMZO6lY+G87zOm12tfbJ/unuaPtF3BplOT7phvX8UEuvX92BslFOGcuNSbRCHChq
 ujRHm1TsWVogA0FsEdBoBBBCbAizpT5oeItlexRcaBOOhU6dToDrb6oeZ7fERaD3WsBAAA=
X-Change-ID: 20261014-b4-simplify-mips-pte-defs-e2be1f613d14
To: Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paul Walmsley <pjw@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>
CC: <linux-kernel@vger.kernel.org>, <imagination@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>,
        Alexandru Dadu
	<alexandru.dadu@imgtec.com>,
        Matt Coster <opensource@mtcoster.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793254245; l=2906;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=EQXnezp83QvFn/h1J2Q0UeVY8jzdKMxbrdTfddfJYKA=;
 b=G00SPfx+8iBU64Fl5ilmP53lWfBhbxlVjvUYZqZygshF4QdmGmh5kR1yp7XlKtmNIOalJ9baP
 KpnNL0ndqA3AvCK+6rx4PuIG5gQdqZ/SMxi0M8hymTDBnPvtusAWzGC
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMyBTYWx0ZWRfX5GuO4tuiYm6X
 wasAUgJDVgxW4abN3UFdUvbz9qpxNgXZHZCk5gser41n09OkRMN/yDEg2GSrihPYhoUJchmL9X/
 I98yxyDoweLoiTcoZ2pH2cL4DkNGSR8rQM42D1u2I8g2cx63ylc1k72OhwJosyMoOBJR3Ytpy3I
 oHHzxFibyJuNlZnrQxv+wZNwzkoeagT6uClg/q9tWfN/9yXYKiC7+1v5NNFTsGQsoR7FepnNKwo
 6AQuXhXj1a03uJzSSZM6YEIJ1POtymUPQJRd9yM5Pltr/EVUklmPiJE9cH9HSDNzFDRv0Gee9Vn
 GeXZSN5mZQvgmpaZ5a7X6VJi5tyK094C0ggS+ss9L8d85ca8ZmOnxJjyYP/unN40tNf4UqSG0mB
 uynphvruhWf3EW6Q10Jzz4EEPupVKObJp3y7dRCQSE/QMHl5MuOQqsf1GxgqVUrMpxiLbSbxWz7
 b0S+YghuFqrpV2grjqA==
X-Proofpoint-ORIG-GUID: nORf-4Qwieee6_x3WRlDZPJ-Ic0H1t79
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6ae2e367 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=1spURiKJc90A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=bC-a23v3AAAA:8 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=_O3DOGVWAAAA:8 a=e5mUnYsNAAAA:8 a=gXtLJ4WPg2CJrXxS_-4A:9
 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=2TKV-7w1aU1AVAwN0oqT:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: nORf-4Qwieee6_x3WRlDZPJ-Ic0H1t79
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMyBTYWx0ZWRfX8MQxro7r6RAr
 agYWprone4CD8JMZmS+liJjxHxGxq8qjNzWE38dGRBIB7EnVAyd4Y195q9gngf5tub7PaVXezuC
 FhtszlpCpSmaMZ6JkRERP0bzgBiICyw=

1. Limits access to the MIPS firmware interface, keeping its state
   within the relevant implementation.
2. Align MIPS firmware headers with the other processor headers and add
   "_fw_" component to the headers filename.
3. Improved logging in error paths.
4. Simplify MIPS PTE definitions.

Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
Changes in v4:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v3: https://patch.msgid.link/20261026-b4-simplify-mips-pte-defs-v3-0-587087d8a284@imgtec.com

Changes in v3:
- Squash a commit that ads "_fw_" component to the MIPS firmware headers filename. 
- Link to v2: https://patch.msgid.link/20261022-b4-simplify-mips-pte-defs-v2-0-ee2402c03a4b@imgtec.com

Changes in v2:
- propagate the commit update to PVR_MIPSFW_TLB_GET_PA().
- removed the RISC-V group from the target group of this update.
- Link to v1: https://patch.msgid.link/20261014-b4-simplify-mips-pte-defs-v1-0-b4ad7bb68e22@imgtec.com

To: Alessio Belle <alessio.belle@imgtec.com>
To: Luigi Santivetti <luigi.santivetti@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org
Cc: imagination@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org

---
Alessio Belle (2):
      drm/imagination: Limit access to the MIPS firmware interface
      drm/imagination: Make the MIPS firmware headers arch-independent

Matt Coster (2):
      drm/imagination: Improve some logging in error paths
      drm/imagination: Simplify MIPS PTE definitions

 drivers/gpu/drm/imagination/pvr_fw.c               |   6 +-
 drivers/gpu/drm/imagination/pvr_fw.h               |  11 +-
 drivers/gpu/drm/imagination/pvr_fw_mips.c          |  79 +++--
 drivers/gpu/drm/imagination/pvr_fw_mips.h          |  49 ---
 drivers/gpu/drm/imagination/pvr_fw_mips_internal.h | 309 +++++++++++++++++++
 .../drm/imagination/pvr_fw_mips_internal_check.h   |  35 +++
 drivers/gpu/drm/imagination/pvr_fw_riscv.c         |   1 -
 drivers/gpu/drm/imagination/pvr_rogue_mips.h       | 335 ---------------------
 drivers/gpu/drm/imagination/pvr_rogue_mips_check.h |  35 ---
 drivers/gpu/drm/imagination/pvr_vm_mips.c          | 162 +++++++---
 drivers/gpu/drm/imagination/pvr_vm_mips.h          |   2 +
 11 files changed, 519 insertions(+), 505 deletions(-)
---
base-commit: 6e375de99d0c420169481fcd36064177ab55b09d
change-id: 20261014-b4-simplify-mips-pte-defs-e2be1f613d14

Best regards,
--  
Alexandru Dadu <alexandru.dadu@imgtec.com>

