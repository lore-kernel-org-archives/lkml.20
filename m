Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440032;
	b=LUcRLvTvYqcGEkdFBwRrpuzjZArDJV7ipyHJS8K/lZlerym8Qu3z4SR8w5xfpOB70RIh
	 yn5HaJZsPsJs0mPyrkG99VzDctudcnAPqtVspHV1NkEiVpL2GQinKLUy4tCtM/eo29DFY
	 PSigygDt1ZYs4MHEGumr62Aeb6Lcz0OoHrnYPFPQfRzF2JsYjU3GQclSfuC7nxyERadfp
	 rIZpMUVTAPE3iId/tQ7J82alGlD8GAzbGOb0zxf+5Y5yc5XRKgA7E6xCsSWrzt56k3jfV
	 cTU137ANDnIzP9uIQg8II035I/LKobVFzyQo5qE4WyGAKkx3gQQaSSaTMfR71+J5DMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=i+///8mnECIM/kitzuhNw6Hg5zOvNqOpkINZPbtisJU=;
	b=5AtqthJNizzIBaC8oNP5G1Oq51eIAmhnuib70rehUkHUCfaku6FdZLLf3/Bs66rJyGSz
	 //4Rgw52MPB+e6tWy/zoQ9OpsK6VzMz6QZLg73LEreLEymPLxF8AgKI/97Ec3+jIfcqRX
	 CoI1Wp/dJJn9SXflxRMnE+Y6W/burBY3zkqjySayaZV8LPfKMG80L/FUi7suRI06uccux
	 eorzX5rxuOO2QalvZ/qhcJUGgEDoHKF/s5+nm1StGOBqGWpY6qRvrI2LCOuIxYKgfSHjX
	 pw5yw5G5K7LE0E7BS2CpEmsolr6OkcP0I5RFNw//FqiZeMQu8B9MPcVbQczMzF6T4UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=W4OTN2wS;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959F2606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 959F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=W4OTN2wS
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so6304429eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792440031; x=1793044831; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+///8mnECIM/kitzuhNw6Hg5zOvNqOpkINZPbtisJU=;
        b=W4OTN2wSGX+iJF02FjnMhtc8QQRsGRKcVs2U57m+y0v/ffear/cMUrUDHXumScPdiw
         S0FvXpy4JaKRHZVT9/4DvL/c76b/mBFwyKryyY9QYvLyFZUoYigcffT9/ZmScUgj/1VV
         DFjUNossJluJpGDSUH8QAQpYyckaIevwmvFiqHsXN05IrGwTGAeTUiW4tXnxJvw9oerA
         BZjMrm2E0Hfxc7Ul08Cj1L58t3DVvhqdEbLJJSB8Rryct6bURy7SWWPH6RcxUgEVpYLn
         aq0x2Qp36I0UxX+H5zP1eJ0yVzBTPDJj1PkQdN5MkfJjJFY+Y2jWHFNXm/ikJdffyRlJ
         fgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440031; x=1793044831;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+///8mnECIM/kitzuhNw6Hg5zOvNqOpkINZPbtisJU=;
        b=RpARfllOpR04pjogiUng5FVr8GL+Fiu5sHxHFqSHNsTPc96sq5s2X3ZWmd09DN35MO
         DXFN4f4vWn3zGRKSQg/SdDWGPWPw9WfkANuijoabURF+8sfXBNXS6x2vRk3nfQe/SOoo
         Re/JxTey3VHiMbD0Sgq4qNCBwD1zUTwH+qsybqCkpFTLjg1bUGwN2IwwZ5Jlji1Nx+hl
         kZrwkWqPj9vCVud5pjCF14jyVNt3mhyDMH2HZIsQ3J8CR+9cmIa8Q1X6cxfAZGGE3lgs
         3+ACmCb+F5gvfN1TQlrijONc8dd25KXFLxGE/44i+4X1vbnvNpaJBj2JZbfWrJ2ioIbf
         pl9g==
X-Gm-Message-State: AFq9FYLhATS0wg9ed0MBJSGrpn7saYdT8HJIHHY6J+V+VSARNTSp2+VJ
	+oCRbK0sEymXDMFcf2z4+AOlWSxoaCWJxePOq0xBoCvaFLFtj2x3Dq83EU3yaQBXrw2V/BOaRkM
	JhiLW0M4OvmkdhSJqoKHDgfR5+tocVxcwpQ==
X-Received: from dycmb7-n1.prod.google.com ([2002:a05:693c:20c7:10b0:350:9a68:218d])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:8092:b0:35c:ea0d:a9a6 with SMTP id 5a478bee46e88-361a2942afcmr13177681eec.32.1792440030193;
 Mon, 19 Oct 2026 13:00:30 -0700 (PDT)
Date: Mon, 19 Oct 2026 20:00:23 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <cover.1792439751.git.abhishekbapat@google.com>
Subject: [PATCH v3 0/4] alloc_tag: Introduce selective tracing for MAP
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

v3 changes:
- Patch 2/4: Minor refactor, documented the `CAP_SYS_ADMIN` requirement.
  Moved the mutex lock / unlock outside the for loop.

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
 include/trace/events/alloc_tag.h              | 122 ++++++++++++++
 include/uapi/linux/alloc_tag.h                |  21 ++-
 mm/alloc_tag.c                                | 159 +++++++++++++++++-
 mm/page_alloc.c                               |   4 +-
 mm/percpu.c                                   |  13 +-
 mm/slub.c                                     |   6 +-
 .../alloc_tag/allocinfo_ioctl_test.c          | 113 ++++++++++++-
 11 files changed, 572 insertions(+), 49 deletions(-)
 create mode 100644 include/trace/events/alloc_tag.h


base-commit: 4dbe24720eb3811563cd56b35d87ddf3f9beed2a
-- 
2.56.0.218.g1ec904b173-goog

