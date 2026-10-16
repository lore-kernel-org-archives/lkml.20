Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FCF40B360
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792182569; cv=none; b=sZqNFeJlHF5tiIL0nh2ASztx8y1eFj/yhyC+a6YKFOUc38w2CTvTfpaFqIyk68M2LcyUe24dsqSr5tRxM0lItq81QXnpMO0x6flUdiKr1nKEMEJjgZUSYFhqGXUEoO1+lQ1RYF2HMnf93E6DrKOVs1sYUVr9KDlm45SBdG9veu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792182569; c=relaxed/simple;
	bh=K/eiPh6wdByAcPG4TnUSQON8b7aKE6ICed5QBrHg5Uk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k4qEm1kx9jTdv12PbPjHi9OgeEWl4eGzw1nFgxUGRLAxWavyY0x1q6Fi6C2AV1LtSXz8Dl+GWXdQNKLe7wr8W2xWKSuj0QdKn2hAG0THmvYND5/hkWZLpxK6KW5ojsX1Lne4ZoeR1WAEApOFGOY67Ztu+LLxSprLE55erQ+qMec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=Su//ULe9; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="Su//ULe9"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5e9239c772cso235253e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1792182564; x=1792787364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nxphn8qi8chEITJAq0WxifpclpFq8ct8M84yutQx3UY=;
        b=Su//ULe9FM3nbKuUjRrVH6jCG6Zl3AtKQnib4G3JF6NGoszkJMuW/s+ambaz8bs+WI
         AnRCnYUi8E2s1v52nx8QtjomnGjkcTb9OkYcb0VHmvBgMJto7yItofvOnuHwZqC6DNyy
         ebIaL1oKpy25pzTciFPuegIHZx4IqIKq9asmmK4BTYivKlPXH/EpkNiheT+xKb2va2Ca
         3IPwRrXfXez4MR4BUkOUu3NXkGqggzVY51YjOZhkf1UVWF0AWpEhatGVf/ujqQ9AlRQQ
         1DVmIVUN9/Co4G9qIkUJqHb1E+pQbbdLD7r7D0Xb3ByVn4saaitlULbzlbH6XvqDfzEx
         xNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792182564; x=1792787364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nxphn8qi8chEITJAq0WxifpclpFq8ct8M84yutQx3UY=;
        b=Zd8XFpxswlJFLhUkaYeM5oaDQqZELy7zGKnKHwu06JWBC0orm1eU7awIX5GegWizpA
         rDjuk9BUDMDfj9BYmQa20xnZ1puHEJbPJftazIMkPVjJHL43nRM0MrDQUAz/+sioqMtX
         BbrSFC6abaysY6E+ida7fMvliIABB+XowqbzrgNQankwuBhCeRczhmjb1bkSSBToAOxc
         LdbbvCftsTt8mvu93HZaBv3hUnl9jbGQ7bZhiV40QuUfv4qbohmzwqsIN1D1Zw4yAbuG
         oRAxAsCfZN/rjHIupNBxgjgd1D93sxBhPYkgb0sw1bBIC/0qxJhqTVx7TKdKA/3SFcpY
         ZRyw==
X-Forwarded-Encrypted: i=1; AKwUvByApHEIVsHzcjolM2QEhrF/oUbIMUUH5KbtNnYhz4Ob2jOJNS30ShuX+LpJ40LR2fmMWYJ4/8dbsyRRew4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJS65LRGhioFZaN/Kw7HCeDA3lEU2g46ZxG20vXzLGTpDLBBFnv
	jl4ScAH25D8k72svxI1uwK9cqGIDn//1eEYeC2kic8DpbJOe9XXPLaW4tiZhxBVbZK02
X-Gm-Gg: AYBFou3cvUsjSI3PGeSS6DbOU1qklAa2SwBYwg0pOAKGqdmDP7eB+k7wgC2/iRKH64d
	DFYt/2cAHLeLPJ5ftEsT22tgdC+suESFl3eeTUBwC7ZubYgXWNHC4TpAVzEuZ5D0OPmKuTz+3ll
	CkXz7SPtptMsdyNA/drmy78L6PJ0xaFUxhoJEKKfcSiypCynQkI6jjMBJJ2qSkmBMVG4nnXfK5M
	MExvb64nZPpe1YYMGn0SMdqe8vwcOYmEzH3aaEUXqswfJkJew5epljeUM8d3BYsRlLnRG29EEWq
	jSLJZt5ECxmykK7c0kT7g51RjEyO4qwVL2r2D2mEU66S9l2XF34tWQbTBYSmlRd4Rw1EBGy/SX+
	vUbSlT5WZJDXoIcNDTbog/eaMpSj82Nv/7M3PnUj8WFjPbBDl7uGINIlHLkADUWt3UxlBNzZ+0I
	AR/Yh3AEMDSe5fNo1XBIeUPZ+ZvA+Hf4DKfLEM1u8tmDCyPGteufODbKcWf3ja+2KHlQTsRPUgz
	TZJWEkVjBeDIIFyJ+Q8J70CHDXcQ75XhJwNZPYvtmgCeXCQv3jrwOHxK6FHDwYaRlU8sCoRgQvi
	zfDDWrAxOw==
X-Received: by 2002:a05:6122:c1c4:b0:5c9:8b3b:deb5 with SMTP id 71dfb90a1353d-5eaa9ecb28amr507582e0c.0.1792182564282;
        Fri, 16 Oct 2026 13:29:24 -0700 (PDT)
Received: from worldpeace10.c.googlers.com.com (119.20.221.35.bc.googleusercontent.com. [35.221.20.119])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b5201b1sm2588281e0c.12.2026.10.16.13.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:29:23 -0700 (PDT)
From: David Hu <dhu@x6u.co>
To: Mustafa Ismail <mustafa.ismail@intel.com>,
	Shiraz Saleem <shiraz.saleem@intel.com>,
	Tatyana Nikolova <tatyana.e.nikolova@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	David Hu <xuehaohu@google.com>
Subject: [PATCH rdma-next v3 0/6] RDMA/irdma: Add support for ioctl
Date: Fri, 16 Oct 2026 20:29:03 +0000
Message-ID: <20261016202909.1289496-1-dhu@x6u.co>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
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

Changes in v3:
- Improve patch 4/6 to split umode cq creation to a new callback
  .create_user_cq() (irdma_create_user_cq) (Leon)
- Clean up duplicate bounds and NULL checks in cq creation path (Leon)
- Link to v2: https://lore.kernel.org/all/20261015011940.4122452-1-dhu@x6u.co/

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
 drivers/infiniband/hw/irdma/verbs.c | 756 ++++++++++++++++++++--------
 include/uapi/rdma/irdma-abi.h       |   5 +
 3 files changed, 568 insertions(+), 205 deletions(-)


base-commit: 978361dd2ccff357d4fe6aac6ce057d1bfae8312
-- 
2.56.0.176.g3575e65682-goog
