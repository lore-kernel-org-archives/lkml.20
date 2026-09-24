Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com [91.207.212.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0D143441C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235026; cv=none; b=dKzUHwZWMDqgSTGJsBL7gxjjrrEcPBam1+rj/RCPV9U3Y5caNMOE9ZCjEKRPY5IMdbNu0q4eUM4tN7nL9k3PqtXCPqZ4UZ+YmNmdLzlPS9ogQ4rhVNlFgfdZnW1Xe6k/PbDxlNKvijtlRhTgg3Jvnymq9QUPyZ1nNdOVeD432Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235026; c=relaxed/simple;
	bh=I0wnj4cfP9QXKZMSQcKBmdn44XncswUt16pM8bKQD8g=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Fbj6yK092iLDz7qa1rb3pvbWGwEF//ubkUF5XyBq5SkucWiurnVFgjL/sU9YOTe7cps2XPIsnBAEIpBleeb6nI/iUF3vhdLiauwt7npnewcDm8d0F9Bc5P/ilD+K0pbWenfOJFFVvzJZ8p/dHRPnDIjc3ZH/OwJ2DmWV3VgCXt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com; spf=pass smtp.mailfrom=imgtec.com; dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b=Jd5v2332; arc=none smtp.client-ip=91.207.212.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imgtec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imgtec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.b="Jd5v2332"
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
	by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e24G1074552;
	Thu, 24 Sep 2026 08:30:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=dk201812; bh=GwCWX0hIymZeTk8CBCaMjoo
	M7BcItLFtPQbi77JUdFw=; b=Jd5v23325a19gML8KqntxFnEsMQVH52fG7HNaOY
	5stKy9fu+K8Bjje2kuX4JnW3hfCt87ijbZsOltmBjE2AsJi8nrt86s/CPJt5SPe/
	urECcP7kKS2ZpMAftpv76cDyNv1ymaWd+caKI8w67cWVim1HWB0nEeLUbzO+sEhu
	jKXO8EgyaZVY4bWSRnog6arKXG2VplV1TWE4WEdiBvbmUI2qeiIxwl/HftVV+rK/
	HLFLdhXcupQFTKTzubWiOcpx09sVoPbcqzBK8yvEVh6H600PHDqnCAB+S9qTFxwb
	gXthURuAy4uGFd+k2UFu5tEfzGy7ZYN7Hzg9IU7lQJ+DqzA==
Received: from hhmail01.hh.imgtec.org (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
	by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4gsgnq3w1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 08:30:01 +0100 (BST)
Received: from [127.0.1.1] (172.25.5.18) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 24 Sep
 2026 08:29:59 +0100
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Subject: [PATCH v7 0/3] drm/imagination: Propagate all KCCB command
 submission code errors
Date: Thu, 24 Sep 2026 10:29:42 +0300
Message-ID: <20260924-b4-upstream-propagate-all-errors-from-kccb-cmd-submission-code-v7-0-584796cb599d@imgtec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGfRtGoC/63RwU7EIBAG4FfZcHYMpQztevI9jAcKQxddlga6j
 WbTd5euMdb0WI9/MsP3T7ixTMlTZk+HG0s0+ezjpYTm4cDMSV96Am9LZoILxduKQyfhOuQxkQ4
 wpDjoXo8E+nwGSimmDC7FAO/GdGCChXztgs/Lq2CiJeBWk3QcnemQFWRI5PzHvcDL63cuK29kx
 kVdJk4+jzF93htO1TL3U6baW2aqoALnLKJAaZUVzz70I5lHEwNb2kxi7cndnihejTWi0xa5po1
 X/3pH3uz26uJJbFrNC+jUcePJ//Vk8TrVSoeFVGZ7H669dreHxUMSSjSikii7jadWntj/fwo42
 KPFukGlkOwfb57nL6kKgOZPAwAA
X-Change-ID: 20260810-b4-upstream-propagate-all-errors-from-kccb-cmd-submission-code-0dae4f05fcb5
To: Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti
	<luigi.santivetti@imgtec.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <imagination@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790234999; l=3152;
 i=alexandru.dadu@imgtec.com; s=20260304; h=from:subject:message-id;
 bh=I0wnj4cfP9QXKZMSQcKBmdn44XncswUt16pM8bKQD8g=;
 b=QGG6eKW3DWzvNpYkoO4D3babR/2lWhNiCFpLGBo6yqwbTscZauk4hxOFl/Kzz5hW+mEIOmNv+
 4cP1OPCIbO8CGiENU2RKUNyf5uBEHQRhoLMevN0L/FpCGxTw114cNy4
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=ed25519;
 pk=FU07SyNrYGwhahqSxbWEuzyXlUh47xBXvLvOR7UA6+U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfXzHBI9uc9K3Ga
 BcDhZzgLD3mAgU9xB+Vo6yw45MjFJw1wiI0Pe6BomYnS5DVv228TUCw+MJiH8Tf6wrIRfmQGyKS
 FEcOiLKV6gUTKawJePASeMURbShTI3D9wQQguPziVAPl5SIijcmlX4iR6dkrOplNXWUkfLFLVU+
 9GZIVXQ4+iPcNfohhRmzm1JLg3vK9MTN8Gr8dldM2BSnQNRhFbJM+pIsUhkttQOc6d5ib6fLAd1
 7zGjWHX2eQ3AjZhJM9kHARRUSpqIMxyVDJyXxWV3CHQbKA00Ap5uMazDZYGeREIn7x4xtagTmc5
 jw9xhRzDIyIX6a+gBDZRF3FgZ4XvHYGTh2wcwth94FDX2YlFqa4dBV+52Rg/9XXMDh8PsntKqoU
 QqUwbTk3/ddr5XSiBHhObLrwa1fj26hfC/OMH2k/2rnJAAMoL0O/ZLq8o1+VBUDvwHI0jB/pwJs
 2e2F04vvJ9/KwDpIYZQ==
X-Proofpoint-ORIG-GUID: GXyMmWuXaQQdvdCvwVNHd2xY6qEsACHU
X-Authority-Analysis: v=2.4 cv=fYs4WEQF c=1 sm=1 tr=0 ts=6ab4d179 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=sVS2Dey4ZWMA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=bC-a23v3AAAA:8 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8 a=-Nkvb9cpL7o7CB8Fd5MA:9 a=QEXdDO2ut3YA:10
 a=FO4_E8m0qiDe52t0p3_H:22 a=t8nPyN_e6usw4ciXM-Pk:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: GXyMmWuXaQQdvdCvwVNHd2xY6qEsACHU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfX4i8kZ5m2S5We
 /BL6FglGlLwWbNOhGHz9gFcj/VsgKoY4gEkeNDyjEUaIXNBVwloOOQNkWZoVw9G9/wgO8vZPUQa
 zphu48oRHnwBk5DXqgYG6ozBQBlKXXQ=

- Set up an error path for pvr_queue_run_job().
- Propagate errors from KCCB submission functions.
- Early release pm references in case of errors.

Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
Changes in v7:
- Fix for the early release pm references in case of errors commit.
  Error variable was being overwritten before having a chance to be
  checked.
- Link to v6: https://patch.msgid.link/20260924-b4-upstream-propagate-all-errors-from-kccb-cmd-submission-code-v6-0-d9d5375665ed@imgtec.com

Changes in v6:
- Refactor the patch into 3 commits.
- Rebased on a more recent drm-misc-next.
- Link to v5: https://patch.msgid.link/20260908-b4-upstream-propagate-all-errors-from-kccb-cmd-submission-code-v5-1-5e262721454b@imgtec.com

Changes in v5:
- Added pvr_job_release_pm_ref() to the kccb kick command return value
check.
- Update v4 description typo.
- Link to v4: https://patch.msgid.link/20260907-b4-upstream-propagate-all-errors-from-kccb-cmd-submission-code-v4-1-b684f58a06ce@imgtec.com

Changes in v4:
- Added a check over the return value of the kccb kick command.
- Link to v3: https://patch.msgid.link/20260907-b4-upstream-propagate-all-errors-from-kccb-cmd-submission-code-v3-1-4578a0fadf69@imgtec.com

Changes in v3:
- Dropped the job->kccb_fence check since pvr_queue_prepare_job() makes
sure that the check would always be true.
- Dropped the power references from the patch.
- Link to v2: https://patch.msgid.link/20260814-b4-upstream-propagate-all-errors-from-kccb-cmd-submission-code-v2-1-35355fad50ae@imgtec.com

Changes in v2:
- Provide an error path in pvr_queue_run_job(). The path will use
pvr_kccb_release_slot() to avoid resource leaks.
- Link to v1: https://patch.msgid.link/20260811-b4-upstream-propagate-all-errors-from-kccb-cmd-submission-code-v1-1-ffd55254d6d2@imgtec.com

To: Alessio Belle <alessio.belle@imgtec.com>
To: Luigi Santivetti <luigi.santivetti@imgtec.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: imagination@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org

---
Alessio Belle (1):
      drm/imagination: Propagate all errors from KCCB command submission code

Alexandru Dadu (2):
      drm/imagination: Release KCCB slot on error path in pvr_queue_run_job()
      drm/imagination: Release pm references in case of error

 drivers/gpu/drm/imagination/pvr_ccb.c   | 33 +++++++++++++++-----
 drivers/gpu/drm/imagination/pvr_ccb.h   |  6 ++--
 drivers/gpu/drm/imagination/pvr_cccb.c  | 12 ++++---
 drivers/gpu/drm/imagination/pvr_cccb.h  | 20 ++++++------
 drivers/gpu/drm/imagination/pvr_queue.c | 55 +++++++++++++++++++++++----------
 5 files changed, 85 insertions(+), 41 deletions(-)
---
base-commit: a8fe4e162ba8212b7e51fdb024b37800f36b496c
change-id: 20260810-b4-upstream-propagate-all-errors-from-kccb-cmd-submission-code-0dae4f05fcb5

Best regards,
--  
Alexandru Dadu <alexandru.dadu@imgtec.com>

