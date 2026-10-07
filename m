Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309AD20D4FC
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 22:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791412808; cv=none; b=Il0EyVLaXeQt0syxxcwFkOgftSMmf8S0wNde0EJveVIN/vWvcc3+Bde3xS9bEDGtqZi3+DF9UU2nv0ourOH0H/wB9Gfp1Vu5WIHghobRdpNcdGsTXmP4Rh3qxwIO0kJ8rhjyYQRNu6efZ9UioIM87qXneDqpUZ2Prw3MW/jYhrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791412808; c=relaxed/simple;
	bh=wDQs/sh20h3xtqVv0dW4uZdpBTmUfFDpqyEnKvT8U8o=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gQi4X6ooCL/mtRD60V3HPPZzyvJ/8bGJ7p49Y9yexfaekl51lp07+0llvHtELHPpo0bBLIxYxYPghnGWoSamtbt6myHtH+cLq4eX5WOa3zelOrBdwgrb2KrsOsMzm3Mfp2OpyijM6Fhg975k2TI3qS9KpQB0t+y/BqDMn3WWUXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jKFcnT+P; arc=none smtp.client-ip=74.125.82.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jKFcnT+P"
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so9280355eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 15:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791412806; x=1792017606; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIFYPTbMlvK7LEVP07VoMQmv5kgwn2c+6+4FzK8N/QU=;
        b=jKFcnT+PnFnU4LgtEEEGIA40DBSxiUpgsAKwmGWYGVfYcDDIhMOR8h8P6d/xNWJnb+
         I4ukwjJViogKU5QQ1CcbYD71CYfRpqzURvH0hXFcL2f73TFVsoMekAEW/od6FgHmvUCL
         EyimkWH39zSrY7K4r4EPhEmDMq2aaqHG3/7X1JbH2nxUqWF6LHkh12V+lotzjwDCRn91
         YJoUEqGsN8sc0CmJfQtXd3BzwsNSc4ma1Ll78W1qq5CRGyeF98YH9M5xmTAP12Jtld0D
         wj3LRCecdiZb9MDp+FJi22wX3J7c3Fwct5ersPixIw7xaGYI4i5sNYc/GeX3JULy3fB9
         k0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791412806; x=1792017606;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vIFYPTbMlvK7LEVP07VoMQmv5kgwn2c+6+4FzK8N/QU=;
        b=dOpW6aZ9tuw2eCqWmjFPnDL8RIpqaAoe8mMZEMNFNv3OAxkXZp+6sT4auffLr+D25g
         olDl0iTjEenMnxT37P9EpA7MhY0S3IIbZhj2f3rwTEUEI1F6q2f1qszGFOdbEg4ZwCxJ
         j6tGJlacwL7Jq1b2EWRfjmN1sUdreh9ZSdP3VWMBLT+9EX2A5AYarqYDC73pQCrmeEDu
         DGnTTn/IWqeiY8n87jkY2/ja87WuQeY+wlSrBnanhdHEp9eQEeYiaqo2KTbLgpxpwQqT
         cIMHkXrv1Z+dfraliI0ePu6Un9MekTS9ABoXpNIfactxeQja3q7IDA5/ZW7PQZSKnG+K
         UXGg==
X-Gm-Message-State: AFuF++nLEkSUZkQmIqw8y9YH5Y+PS5MVU6IUl5eCVdhRH+I792Qze2Wv
	0CAIYDX8HsqaPypGBHW/qFBkK6uJBL95k0eqV0U3wpZmERUn4HxsvNfabokyT6K6o6ckQV/9p2I
	HicIKuQyq8FEdaYLcDTMQvPJ9wCjPjBPiGg==
X-Received: from dlam7-n1.prod.google.com ([2002:a05:701b:2087:10b0:15e:35b8:18c6])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:7e02:b0:143:2967:c0b1 with SMTP id a92af1059eb24-16206b2b3e2mr4893297c88.25.1791412805684;
 Wed, 07 Oct 2026 15:40:05 -0700 (PDT)
Date: Wed,  7 Oct 2026 22:39:58 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <cover.1791410885.git.abhishekbapat@google.com>
Subject: [PATCH v2 0/4] alloc_tag: Introduce selective tracing for MAP
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Hao Ge <hao.ge@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"

The existing memory allocation profiling (MAP) tool accurately maintains
aggregate counters for overall memory accounting. However, relying
purely on aggregated counters restrics the visibility needed for
targeted debugging.

This patch series integrates three new tracepoints (alloc_tag_hit,
alloc_tag_mem_alloced and alloc_tag_mem_freed) directly into the
alloc_hooks_tag fast path.

Enabling trace events globally for all allocations introduces a severe
baseline overhead. To limit the performance overhead, we let the admin
select specific allocations to be traced.

A new IOCTL is introduced to allow privileged users to determine which
allocation tags need tracing enabled. The IOCTL utilizes the
pre-existing filtering mechanism to specify the allocation tags to
enable tracing on.

v2 changes:
- Patch 1/4: Changed the trace events for the page allocator to track
  pointer to the head page instead of codetag_ref.
  alloc_tag_trace_enabled() no longer takes a tag arg, that arg gets
  added in patch 2 instead where the function makes use of it.
  Introduced new sections in the Documentation expanding on the newly
  introduced trace events. Minor typo fixes.
- Patch 2/4: Toggle traces IOCTL now uses the same filter as other
  related ioctls. IOCTL returns -ENOENT if no tags match and an empty
  filter matches all tags. Added a subsection in the Documentation
  expanding on the new IOCTL.
- Patch 4/4: Updated the test to work with the new UAPI from patch 2.
  Updated commit message to accurately mention that the test flips the
  state of trace_on, verifies it and restores to the original state.

Abhishek Bapat (4):
  alloc_tag: Add trace events for tracing allocations
  alloc_tag: Introduce IOCTLs to toggle allocation tracepoints
  alloc_tag: Extend allocinfo_filter to support tracing queries
  alloc_tag: Add a test for trace state toggle and filtering

 Documentation/mm/allocation-profiling.rst     |  73 ++++++++
 MAINTAINERS                                   |   1 +
 include/linux/alloc_tag.h                     | 104 +++++++++---
 include/linux/codetag.h                       |   5 +-
 include/trace/events/alloc_tag.h              | 122 +++++++++++++
 include/uapi/linux/alloc_tag.h                |  21 ++-
 mm/alloc_tag.c                                | 160 +++++++++++++++++-
 mm/page_alloc.c                               |   4 +-
 mm/percpu.c                                   |  12 +-
 mm/slub.c                                     |   6 +-
 .../alloc_tag/allocinfo_ioctl_test.c          | 113 ++++++++++++-
 11 files changed, 573 insertions(+), 48 deletions(-)
 create mode 100644 include/trace/events/alloc_tag.h


base-commit: a663a4c75b63341fa6cc16e15feb29f36321f5f2
-- 
2.56.0.385.gd3acb90ef8-goog

