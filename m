Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.132.180.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793603378;
	b=ISC1WugIhBfWBlvk3tz2gmhvHfHC5IQvX8E/nCFt9BWvtZ0B/9bsbO2uRTT3vW+qqkOs
	 7HzkQLkJ6KDGzTNBsgyft0nY/g5K14NLjw1dJan1dG7WA7GhfAC8X+Pp8GUWkjuH2AlR2
	 C84C/YMLvMw02hKFiqSLppc6aGANPR79zQjDJlETHJKSa3aoYW6klg+vWm+fVozKCCcE9
	 RyqUYQyWzJcmxNoe0dxrbZ/m8zylKg8/o5sxwcVJcUivTIZvDvD4HJbMMgj5SBKLO4rdf
	 vcmp396jfEsUl0kNDSP750QfA2idRLp7C8M/zETiKIe3FXQNKD5Yp7X3NmYtwerxWrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793603378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Originating-IP:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info;
	bh=YpJyZZmSGORziH28K3pH15vp6whkBehxbF9mUb+aca0=;
	b=ebvOP+eDO5HTspOVupji5DnU4IjOB83AonNRBR8LTwdJgSEnNc9tDVOtzNkwgFm9MfzB
	 C69yP19BlB3iJJUaQN+9nHrYy6EK4Gmw6O+xkBaO/7gG0YDXfdWu0TEotj04t98B2VAg9
	 aV8iApMxYdEcP4+zO3m5zJ4I/Ze7ik/3Cha052vznTOfVFP2YLgCQOTAwVyx1G3EH7egX
	 ZO/o+OSW0fwDvmt13bcZIFDUEfNQuV5ga0SOElqcJqutLhZgOVR5qkQ7w0GTzLNoeMn2D
	 363Ea4D1pSMfyGcI+JpFW9zmYiUhxRFCcr6gNuaXkOQnTkkzw7Hm90IK8s1TXvRc4Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=imgtec.com;
	spf=pass smtp.mailfrom=imgtec.com;
	dkim=pass header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=mo4sXqj+;
	arc=none smtp.remote-ip=185.132.180.163
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com [185.132.180.163])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CC6606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62CC6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=mo4sXqj+
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
	by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A26P1CQ3855122;
	Mon, 2 Nov 2026 07:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=YpJyZZmSGORziH28K3pH15v
	p6whkBehxbF9mUb+aca0=; b=mo4sXqj+OSS3n5eyFFH9Sey9Ec1aQWv13pyEosl
	6vD2wPMkSSf7/QVxYlgRnUL1i8/OXM0QBbS/oFHHsrXuufUfYKbicSrKnYMouoDV
	BgMoul1n87oKC7cJwHyGxIGZTtFFhZhV1a09lssUAdWqKFNRwPOHpYQ3hDH/Tdyj
	6yVLVd/ijED2E49yqDTuFBLFnguXEyjPUapCDn5zrQAhCfDZGcVEfFHY1t2OQuUo
	mJVImfyC60RLtwrYq/Oso/3wNyTh+htP3/hzapVBSXh1lcy4ZAZms7OdOtU0HOAt
	2sTTjvv9lZWs7bgVvX0QBiXdZqXmm0sTYUWfMklTwzIyP0Q==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hn99whb67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 07:09:02 +0000 (GMT)
Received: from [127.0.1.1] (172.25.5.26) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 2 Nov
 2026 07:09:00 +0000
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Subject: [PATCH v5 0/4] drm/imagination: Clean up MIPS firmware interfaces
Date: Mon, 2 Nov 2026 09:08:32 +0200
Message-ID: <20261102-b4-simplify-mips-pte-defs-v5-0-d5bcf7d95a1a@imgtec.com>
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
X-B4-Tracking: v=1; b=H4sIAPA26GoC/43OwW6DMAwG4Fepcm4mx5iQ7rT3mHYgiWldlYIIQ
 6sq3n2huzBVQj3+sv39vqvEg3BS77u7GniSJN01h3K/U+FUX4+sJeasENAaMKQ96SRtf5Hmplv
 pk+5H1pGbpBk9m8aaIhpS+b4fuJGfh/359ZfTtz9zGBdw2ThJGrvh9iifzLL3Ss9kNORxHSvvr
 WPED2mPI4e30LVqKZpwRSFuUZgpZiTAAEVN/okq1pTdoopMla4CV0VXo6MnitbUYYuiTB1saYE
 MA8H/r+Z5/gXFzju8tgEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793603340; l=3056;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=Fe8O3E71S6tBaINkH+gbA0bAmh6xj+Y0cVAdpNaIVbk=;
 b=rfrH3ClVkaRjvXWgkFNisSIedFIIrL9Se0VCkB6IGAJf/LT0hS2W2mLJ7ZhW6oDibzwpwKFhA
 uxt76+dfccyCBL/ZqRvfs3MlQhEa5zPVu1bAPAbZXFffjz+gYnKVPPw
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOCBTYWx0ZWRfX/rvM6jV13VOa
 7gcCtRGE/9p7Bm5HYlEDUAIQY1Q34rvHxpXHzvtQzQk8hgBE9Qsa7y90xFqMxX8M2B33FTNOYv/
 mljskpWNA6TnKFoeL3X22vY2aijWEmGMyOe8goGKXCaHeuCjeVYID05EmUcUbjepBvfqfpwya9Z
 KsaRku/vUU9/ZL4ECPZ/KsxveMX/j/3xI3BdiRpmfjIt4oDJkF+p0e3WFVN/mJCFPu3wNIpfEsK
 jMCAvlZ/Gg59eA7gQyq9QxP9HWZWrNZPs1skPBAlrptlFGYAYpVt/ikxsoYLeIuBou4wO+jTjA5
 qef9Ua0yXygWv3XwP191gCtksgEXhVjFaqJGcbXgXsBqsNygKMH9YO5K34QyXlvlovS7msPljR4
 ZX1tT5ggf8PcITygIgpNxACRwJEoVKpggkxCYAqodi9blOuvdlWzJzHgxTirygEN9tRM1WHBG8M
 DCdClk2Q56DtqU3cKUA==
X-Proofpoint-ORIG-GUID: QhsSP6sQVLm8U54Z7iJHtsGV3wPwzAX_
X-Proofpoint-GUID: QhsSP6sQVLm8U54Z7iJHtsGV3wPwzAX_
X-Authority-Analysis: v=2.4 cv=BZlNQbt2 c=1 sm=1 tr=0 ts=6ae8370e cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=h_3jC4m0AyQA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=bC-a23v3AAAA:8 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=_O3DOGVWAAAA:8 a=e5mUnYsNAAAA:8 a=gXtLJ4WPg2CJrXxS_-4A:9
 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22 a=t8nPyN_e6usw4ciXM-Pk:22
 a=2TKV-7w1aU1AVAwN0oqT:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOCBTYWx0ZWRfXyvHNaMBGWC1G
 9+jwKNCINMz/1Kzwdb8bjSXR6YkPfjF4MuHTt+8rNGbhPbHyxwulguzHGctt02pSyu3dKwLlv6Q
 VTZDuI0dUDmjwN2g4OCsiUlQPJY74PY=

1. Limits access to the MIPS firmware interface, keeping its state
   within the relevant implementation.
2. Align MIPS firmware headers with the other processor headers and add
   "_fw_" component to the headers filename.
3. Improved logging in error paths.
4. Simplify MIPS PTE definitions.

Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
Changes in v5:
- Update documentation for pvr_fw_device struct (pointed out by Sashiko).
- Link to v4: https://patch.msgid.link/20261029-b4-simplify-mips-pte-defs-v4-0-9656041e040b@imgtec.com

Changes in v4:
- Update the commit messages to better describe the changes.
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

