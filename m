Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDD441D62E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790065562; cv=none; b=jvSuAqEHebYmYDoF3sBwr1z2NBsc4gAJdbbsSXtk8QgWrcIDi/+7t5YiiGFwhgoxOA3g4tbDwJ5vGTxRS8ni0T9vJNPyJKNBgwAST7nPCPQeKefb7t83PrMjgTm/sm3bmqah5Viay53rqZAvReqjCqWDxL9tCdyLDG+McXG+j00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790065562; c=relaxed/simple;
	bh=dBBpa7Ydst38i8cZsMQVxzXK9rqMNseU8twqVhQtE78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XLrssaPIDqMHt0xGwcN5m3S3JYar5V+Q1Ymo0KbrBpVaMn+XM0hESrtLXp7CAZjbJ0cv0oEJSYeVgMtTVMPpo8ZngJyEXO2nZPCdvTpEb7JqXaWwROlRKZg23VoP0/oqNliLIs2IXJiy46tVieUoCpLOTj2T+bkVydlzcl8yVUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=EHyNhINq; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="EHyNhINq"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334ddcso31954605ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790065558; x=1790670358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Id4aiEwWk24mT8CByvlZpwQS9RXne8NT6QXvKFa3y1M=;
        b=EHyNhINq+oMknrG/8IGrEy2BE5yyRk8MEMJKq7Jbnnt/Sz0/usHcGFLqXJ4X8+kQS7
         UHZ8rN8b+/Qv4tJGJAbDRTXU+TcvuFLd5vBBWT3ZQhLu5VlDFyiCVDwLUEjLhfKu0HYt
         qSZWTDDmfKD85R0WFIEohMZKKnX9slN7Ii3rYNEWkVvpJAeIuI3KXXDhojiUZOgyzM1y
         mZDyyVet2TkAY4X3csjUQQtk5geFpHZpuGoQT7GwunKmS2L7BQu/BoYwjWPujhB+iyjh
         N524K2N4wC2wE8Xc8Mdn5NlvxK4sLgYlKFTx9rdvJrYBElfskWNQ5WX8iJC2iJbI9++k
         0vWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790065558; x=1790670358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Id4aiEwWk24mT8CByvlZpwQS9RXne8NT6QXvKFa3y1M=;
        b=a/P7onoCoO9Q7KXu/AB3nhix+vX3JM19jTEo9LhCz94lzRDGprk1Z1PUlS4hlFelAZ
         vplNzvTQUPmpObAAr8+wZo5o6DXoKLeIcYMxvED9uSPdcRjRyfWNWLNjzZ/5gouRzdCx
         S9Ux4TlprEldd0ESF7j+YMnYCrpToqH/KpZBZQEFQ1LpUxpSu2/RcuM3HNh1jVXUT5IC
         AL9bFGCDOELiciFrhwhH3E1vwkQ47qwyiXkdV2G9hOtaKXS1R0XboCVVl0rhWPms9N3u
         EYHjzQA0SCytMjm5JQEz95d2usdc0ozUxfVRllS1w+QukAfM1wEFvmJZ5Ox6LkzYRf84
         YqgA==
X-Forwarded-Encrypted: i=1; AKwUvByCEG+2LywsajJA+S+hl1DM7vewi4bJs5PRNGq/tlKGLziSyCLAP94wuGKVhV6/MilxAl3wj+zPzCRFC/w=@vger.kernel.org
X-Gm-Message-State: AFuF++la8RGng2oB/sAxsBWkqpp9B8nh1W5oMJimsMnVnwqL1vwPO33r
	tpX49cORXsvN6fsd0CSuqEiI4bPJwsv6OfNrLLecKXi4B44bd8QAc6ORGSYpJwQSfeqTScJfBYx
	PTzx2CVs=
X-Gm-Gg: AYBFou1pNKJ7ePSGnEluQms7rNjkSghnSLlRyGLab2Y/0/cvyVuqUV/D8GoPhYIfPCf
	fUxSmQIzvliayQkBrjXhw9Axg+4YfJqV3KzBpMkDUClonpyyRYc7ghXlZP+5ENCrggYpzSEuK9B
	cyG1rphNjxh2Ku+J7bBlgD9+HJfG4j2Z0F3GDh5r8qQO0VtVHq9b2uWw0ea3KtAc+A8gH2J5WiG
	iWc1POesxqQ/ZQFdCEaACCbp/RxDwXigV0NcJzUKtGfI9VkZy0Apk0CK7RTayvM/n8CNHRwvp64
	bMoJt1SdU3FWhbxgFTmVGE+32LZGGgyg+lmPXNr+rnCmSewNT3wfhS7+KJ3JzVZ0RrrFt24HznH
	toYXjecJsxBLcP7q5S/G/gmfWdxYNe2RNijTPFkiXWTFl5IfyJYCS6IKXkwZCKnzFFsRnUQKUKw
	NUDEBcLR3QqniPL5UXUD8WNVqaGoooSxFw9znxVNu3Izd0bsmUKtufIQnyRu3f00jBSGzRIa/YT
	NWz2xUHJDhYkzY+P6AJ
X-Received: by 2002:a17:90b:1e53:b0:39e:2c5c:a69a with SMTP id 98e67ed59e1d1-3a07309eb75mr436231a91.5.1790065558109;
        Tue, 22 Sep 2026 01:25:58 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07385e516sm223056a91.0.2026.09.22.01.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:25:57 -0700 (PDT)
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
Subject: [PATCH v2 0/2] dax: Fix Device DAX range allocation validation
Date: Tue, 22 Sep 2026 16:25:49 +0800
Message-ID: <20260922082551.874901-1-songmuchun@bytedance.com>
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

v2:
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

 drivers/dax/bus.c | 142 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 110 insertions(+), 32 deletions(-)


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.54.0

