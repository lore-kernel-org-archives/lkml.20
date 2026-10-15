Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA5C1FC0EA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792027233; cv=none; b=Vpts/OCstqieAKU0x5kM924gapQNvWYPn626uYA8MG7J7ElwhJvJ9QMQ5Jzm9eGOiBztwhYrZgvwKwjVkOqPqg0zupRWo2gwIrijrItTOmRTE/VjyfIj18Rlm2rbfqcZZ/27fiLwZSk336xfG2l3IPOX2YewVthA9Lvg/8xWSpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792027233; c=relaxed/simple;
	bh=U/uHtn4m+NNYAlOZgFLNrJ0c7na8xGiMuGaK2nPn3Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iB9M6KduPU5s2VgiGdBEo87CHB1Mo51x2Ms6dRFwOsbDNMQ9qsyGpOQkm9uHSRrhR1V17WL0wvpmb9Ldjxgahw/2MJyILQLe2KtVHPnvYWP6qqxx+EH0TYvnaNYozFo6P1msoah9pPvNJQYTuoHn9U2CM3Uj6+pt+L1pDBp3KY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=eAFTnr6M; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="eAFTnr6M"
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-99071945aa7so150827241.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1792027230; x=1792632030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ryVASonw0Dj8PaeKjL5g58hdmwHMfooca29xETnUQg=;
        b=eAFTnr6MUv7XRJj1+UK47OJdMNNeVWe5W2tAdwbe+vuFn9T6PRsWdJjcI/sW4sKlje
         fzvWeyfnSUwRGlUoValrTbLiRwPATJpxAtd9sqhuIYIz+zpDOoORGymoVRX8OGbo/r9j
         bVH6alDm1zrFhgTWkwGs5g6lDmooVafn1pBfppwcG9wkpT4ikLDRTW8ph083W5z7y7K3
         uHq0dyMxkt7nwXg8d4+vJEGc+Sq7lWwjwYOgH2+qr6RjMpjOCFXeHh/agtMLYHKXTlYW
         dSKR3D/Wq8+btICU1eSvtcWelRx/J5Ckv4iLYp8foqIH/iEYRMKOlD7UbcsOv8wB4Agm
         DKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792027230; x=1792632030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ryVASonw0Dj8PaeKjL5g58hdmwHMfooca29xETnUQg=;
        b=HYRDDabtxQChS6/DRVFk9vAfmc1gcWWFAa0CVu0etCnjB6vhzy5mzmNEOXgot/LlE9
         /KiHVAy8rprC/5KVKmUiVuiwxS+w4bKJRLLuIsvDv5/vtkJyE6RBfu5SsfMe/ZFxmp0W
         7idkculf+Vrzz47+INAcabIY9st9M23FOwVAmdQXYlhF9uAyEpuCOccYL3NWqXirbCMT
         F9Q1TxsKpWNkdzCwTga63196R8tEkN1CPM/LpMRy+WW7tvPhgejhGayWxZpSNfXPt4Cv
         GvVyv23T9TCXPUtyeeAUsey1rZWuFmp1NuNOKIn4rrtrLOLPVtuoIOHA5kXnVVxGRo+H
         I7kw==
X-Forwarded-Encrypted: i=1; AKwUvBxyp5NHZorfgaYtjlGe9/Ua1bGVDtucH50HNbeb27CTS/Ymfz/r4KHQGbbZePCh2BVYw7uS4jx5Gu29ZrU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMKfcZFUJDo8Zdo1pPp8fRatq2wA026DUnMpRBdEkDEUujiszw
	CjQMg3ifoVDPRL3hevVii2/d8+F4fGG/7gsTQRUaOVQTTS+J9e0mIxSbQZe6iaC3SjFW
X-Gm-Gg: AYBFou3UMssiZPzQvvLYy7A4vAOaItorhuCjtMR3wLMWhn2pO65/7v+mDBffTMN/aUk
	QiIyJ9lUtUrdd0bHJ0nbzZFQYDWyzEMGmvvoy9ZPFlxc5GjnMyt8uC/LeoZDqMdpervkV64gz+j
	mcGLDNRKt/jTaR8ORPvu2uzNf91r/QdOIMQ6PSPHuLRPMDaETBWSYjKSH2XoAls9g2M7BEiUX67
	j+mknw5iNLRJtiwMTRnATvUQFdJW6qPrXsuht7BOVkMn1wCIk3u2dCve4A2J96PTf6ZpBfC3WJ4
	3336iuOdOBWfT/Pcjgvst0Yhk4g7PjY2MwRmeXAbcgZGufp/M/Op9XYKgUx7TIzeDJWySdCNaqH
	onkgfxZGqS4fis/7AhEWKj+2RPN07VaA+hFnruHB15YGVhkZ2arcCig4NiGLTivNa6HSHxP5qRg
	YnsdLyLaJa3jFYGmwOHSJmnFJKjXV+YVWiZC+D87tgEsJyYeXiwfs62mKNSDFPq4Oe1Vo/ZI9vm
	TF0ydSsn3elRJ4rRcodtk+9pyO9Y4s1PAymrSIwQKG60cyB6L7zDRHLER/hOt8CofUL4Jumo8HJ
	mlNxooCvYA==
X-Received: by 2002:a05:6102:418c:b0:7c8:3b8c:82b8 with SMTP id ada2fe7eead31-7cb3730ba80mr5451079137.17.1792027229862;
        Wed, 14 Oct 2026 18:20:29 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (119.20.221.35.bc.googleusercontent.com. [35.221.20.119])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cab57c8sm12406159e0c.5.2026.10.14.18.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:20:28 -0700 (PDT)
From: David Hu <dhu@x6u.co>
To: Tatyana Nikolova <tatyana.e.nikolova@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jmoroni@google.com,
	eagleshaw@google.com,
	xuehaohu@google.com
Subject: [PATCH rdma-next v2 0/6] RDMA/irdma: Add support for ioctl
Date: Thu, 15 Oct 2026 01:19:34 +0000
Message-ID: <20261015011940.4122452-1-dhu@x6u.co>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Hu <xuehaohu@google.com>

Hello,

This patch series introduces support for uverbs ioctl queue creation
(QP, CQ, and SRQ) in the irdma driver. This series makes progress towards
modernizing irdma. This enables 1-step queue creation from pinned UMEMs
and shared dma-buf heaps (system_cc_shared), providing RDMA support for
Confidential Computing (CoCo) guest environments where memory encryption
otherwise prevents standard host-VA-based queues from operating.

Historically, irdma relied on legacy write() commands for queue setup.
This series modernizes irdma's queue creation path by adopting the ioctl
infrastructure:

1. Plumbs uverbs_attr_bundle into the irdma QP and SRQ creation routines.
2. Registers irdma's UVERBS ioctl namespace definition for QP, CQ, and SRQ.
3. Implements 1-step queue buffer creation for QP, CQ, and SRQ using
   UVERBS_ATTR_CREATE_*_BUF_UMEM attributes and ib_umem_get_attr(),
   configuring hardware Page Buffer Lists (PBLs) directly from pinned umems.
4. Split CQ creation setup logic by umode and kmode into separate
   routines to be consistent with other queue creation logic.
5. Adds support for driver-specific shadow area UMEM attributes during CQ
   creation with CQ resize capability.
6. Preserves backward compatibility with legacy 2-step write() path
   registrations when UMEM attributes are not provided.

User space rdma-core PR: https://github.com/linux-rdma/rdma-core/pull/1766

Testing:
Verified with rc_pingpong, srq_pingpong, and dmabuf_pingpong over irdma
devices in Confidential VM environments.

Changes in v2:
- Add patch 4/6 to split out setup logic from irdma_create_cq() into
  umode and kmode helpers (Leon).
- Rewrap commit messages to ~75 characters (Leon).
- Fix a pble/umem resource leak in irdma_resize_cq() (Sashiko).
- Link to v1: https://lore.kernel.org/all/20261011011022.1445352-1-dhu@x6u.co/

David Hu (6):
  RDMA/irdma: Plumb uverbs_attr_bundle for QP, SRQ
  RDMA/irdma: Register irdma UVERBS ioctl namespace
  RDMA/irdma: Support UMEM attribute for QP creation
  RDMA/irdma: Split CQ setup to umode and kmode
  RDMA/irdma: Support UMEM attribute for CQ creation
  RDMA/irdma: Support UMEM attribute for SRQ creation

 drivers/infiniband/hw/irdma/utils.c |  12 +-
 drivers/infiniband/hw/irdma/verbs.c | 574 +++++++++++++++++++++-------
 include/uapi/rdma/irdma-abi.h       |   5 +
 3 files changed, 444 insertions(+), 147 deletions(-)


base-commit: d2c08575500145dc5cb55075cd9b177626531613
-- 
2.56.0.385.gd3acb90ef8-goog

