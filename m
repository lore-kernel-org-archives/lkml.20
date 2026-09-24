Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6AB3126C2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790218245; cv=none; b=j2MgFlLNDHMYtn8wVI4n/r0xpySXU6vRY2KlqdF1H9uNXAnSfsIQS6WZziT0MPVGrk9vK7NkQ+gnTUUkoCOXJ/fdammjWXoSozWS5bjihFiDGDlqf1R6x2yWZzrSliyTQsGK381f4Exs+H/n2Vyhf+rqHgd+1JlVg18gd7IF/9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790218245; c=relaxed/simple;
	bh=HZdsv4xPU2mPZq3H1+rj/rzm1nmW2gVvYpGBVmgJSZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IvJsLd816OlR6ZbGjsXwmzqvte/3mgZN2U03D9iLOaYaOmMo+5P3xLTr0amfC9jU5GjW6IpCwuxA2ujvSpDWR4Nq7msd4f5ANiYV0OjTnYZ34xjQ6btsQBpvfraG/NtuXo3bjVo1smeFuVCHkwmKrK7JvxQzf6FSatNKUP/XoEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Q7Uj6jDM; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Q7Uj6jDM"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0135fso10641225ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790218243; x=1790823043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPGTCvzEDldSCqnC4/5DFnL7iPnVDOTde0NQNs3OjKo=;
        b=Q7Uj6jDMw/E5feAf62war9B+nm2mIzExY+zMKqN1nXocTpJ3XguuyaECqD7NWQ9/nv
         +P/gFafhB7CHIDRRCwnJVmf5VDQdQhS1Ph+80ZPec2oH3C/Kw7P6pX1sRi0mou85tWNh
         xeUGtIgBUbCNK2NdtALO3vMbniismqsdU0IJgKMIjacVrEljkI4uD5pCrJzQl6DNO/4L
         deZAV4Wivfb7vriljsT2IvE2mG/ClB9nGZ3dOAT9RPkyxM7anYqe6gI/lYnL+SC7rFiT
         oPB1kYiL2hjD5lrYJ4qb2DKHBdtJGV/Xs4fiR9EJbMIitcywlL3QPiQpOxbIPPCe1KdC
         e18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790218243; x=1790823043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CPGTCvzEDldSCqnC4/5DFnL7iPnVDOTde0NQNs3OjKo=;
        b=NGbyy6g5lCaY6zTs0jPVLprR8RWykLgBFB3nuy+BrO5MKk1cXc0dpPF38bsP/eafw8
         Am3iEQklG/tXIq89kTCmq3UWtXeiQpndPEXvpf1rrY1ATbed5N3GJ5uRi/OlSdIN5jSq
         /ty5akDfVi251R+WHw+apV2Y4gS1g+cuopFZ5QQ08nFg2NTsWPbG1/7MNcyqlI6BKdqy
         ORtXq27nLaKI5GnbAgQl/aPixCdoGPaC4ehPGKDeDxKLL8tkUlQFTGHR1S7fPsKrQFUX
         axlSifosgdF6J9F1vK8NBQ7kgdLBN7GRmxGdyyyakcXTDsNaLH03uli1rp8IM2fsxWs2
         1PZw==
X-Forwarded-Encrypted: i=1; AKwUvBy2QoL1pjg8iVZc6br+KZR4NMiW/mgoRoVkXCjeszmem2PRSrtcn+9myiOheZ8ZWfU3vRoHlN25yXtr4UU=@vger.kernel.org
X-Gm-Message-State: AFuF++mURi49/KbZALY1e8E3nq37MJPn6xhIYhdbCSRzC9lwFNSe5Uj+
	t6mgz3vb98sz31Uq+XwKMiICWHqI0oxRWd8P9oqFogZ5pWHxz0BEHBEoIgoaidsct58=
X-Gm-Gg: AYBFou3rabotqdfuF9FD3AqYJ6lAGxbH+/61QW1fz/NwNkidILesPajEZwmc9b94VJh
	ynfjab7Yv7hRWsNZTdja3+vfN5OGonkqb/oNXGCm/Lv3y9iRcVZrYTfQzbJgaS9XFnykxWsJMHP
	QER0q/kkxaphinQ5XYEVQDjMhepaBX7ivvq1Q4SWAJ2e1qUkufI32idmx/+rbKcvIAG9dY2hlyl
	o4l4pBZdn9Y0ISl3uXjZXLp3vFW9Wgb4Drl+e65Zv86UKYv1NXh6fyrkkHpli8yb4hNdXfZpY5E
	cN/FNzrw2xV1vUXNuwOEMzHTtBZzGCKXgGG9TFHSChFSoV9SAXhV4TJxNK8+bImN2yCtgD2ozXl
	xlbtNjG7M6nBDXLgpz9eCtxSvhyTxCjE1rinW/61xTTIJN1z2RTKPm60jIf2R2ilAD/rIJqZ2bm
	BGAN1qBLKwq99RGwAvdKukCPXZl/h1PInA4zpOwktWrpnYYXamXw0idlueqKlu9VjANAzGTDO9K
	NZ6EsGNyY62QoF99WqA
X-Received: by 2002:a17:902:fc48:b0:2d9:484:861d with SMTP id d9443c01a7336-2df7e24f14cmr8581875ad.10.1790218242834;
        Wed, 23 Sep 2026 19:50:42 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a4f6bsm18638185ad.15.2026.09.23.19.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 19:50:41 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Joao Martins <joao.m.martins@oracle.com>,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	muchun.song@linux.dev
Subject: [PATCH v3 0/2] dax: Fix Device DAX range allocation validation
Date: Thu, 24 Sep 2026 10:50:33 +0800
Message-ID: <20260924025035.1265035-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While working on the HugeTLB Vmemmap Optimization (HVO) generalization,
Sashiko reported that memmap_init_zone_device() could be asked to
initialize struct pages with a large-page order for a physical range
that was not naturally aligned to that order.

Following the Device DAX call path confirmed that the condition was
reachable. Device DAX range validation checks the range size, but not
its start address. An unaligned range can therefore reach
memmap_init_zone_device() after the device binds, and a subsequent write
to a userspace mapping may trigger a kernel panic. With the help of an
LLM, I was able to reproduce the failure.

The automatic resize path has a related problem. It can split an aligned
size request across arbitrary free gaps, consume an unaligned fragment,
and leave the resize partially applied when a later allocation fails.

This series first fixes the mapping sysfs attribute to propagate
validation failures. It then validates both the start and size of every
Device DAX range and makes automatic resize account only for usable
aligned space.

The changes were tested by booting the kernel in a VM with a fragmented
dynamic DAX region. Misaligned mappings were rejected with -EINVAL,
aligned allocation and multi-range mmap read/write succeeded, and an
allocation exceeding the usable aligned space returned -ENOSPC without
leaving a partial allocation.

v3:
- Collect Reviewed-by from Dave Jiang
- Serialize size alignment validation with alignment updates to avoid a
  partial shrink after a concurrent alignment change (reported by Sashiko)
- Document the size validation serialization in the commit message

v2: https://lore.kernel.org/all/20260922082551.874901-1-songmuchun@bytedance.com/
- Return explicit errors before Device DAX range allocation
  (suggested by Dave Jiang)
- Move the mapping error reporting fix before the range alignment
  validation fix for independent backports (suggested by Dave Jiang)
- Keep the alloc_is_aligned() name to avoid unrelated helper renaming
  (suggested by Dave Jiang)

v1: https://lore.kernel.org/all/20260915095621.3744167-1-songmuchun@bytedance.com/

Muchun Song (2):
  dax/bus: fix mapping attribute error reporting
  dax/bus: fix Device DAX range alignment validation

 drivers/dax/bus.c | 152 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 115 insertions(+), 37 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.54.0

