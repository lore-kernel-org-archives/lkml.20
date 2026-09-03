Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F43E22FF22
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 00:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788394588; cv=none; b=YvzDnaYHvVs5O0mKLaTbNnaRfamoswKsGLngqLQ8GTJ6x+2wC/zHEiJ6jXRdbC6K+I2uDnk0Fu64wAs/kdwxVshi8PelgppaeMJvfgFcOvAoYMTpAgAvqqYPTsDWcWzWCWzj2fyoclLRnrRUEj+SyBdqc/I2r9ZGM1teYTXvoCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788394588; c=relaxed/simple;
	bh=p3kIujUfclIHgrp+ae99x6feuE7UCrPnVXI5HMFwwzc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LSFduhW25WQtgxCHvv13K0Q3WlQnWJ4qOx+QUu1q9vK+Ff5szT3Zid00BXHZi9hBA212ZTXbgXM8vFjvZxFUYjLUO1bL10gzK82RS1EVxC0Fg2KPoJDZFilznTuOtb++QC7qrjxDd1arFrMnLNNIVnVubtm2egCjwnLX1c0uCFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=efKg0w/t; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="efKg0w/t"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so2471567a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 17:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788394587; x=1788999387; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vzm816r0LGTVzlU6FqzDKHr2Q746+h0dW3Jpg0VBIpA=;
        b=efKg0w/taBRBJcPdfJpXdvZ59L2HHla0sWveYv+OxG4yzMf4YiBxTzU2H1Dmr/MFMz
         PBREBteo5oDWHOsXcZCUe2nMzG4jSp+glQbu3U7ufWuNqWw/slBoI9GEQD+C8DMR98ng
         2ksIaJItybyM5mHiydhBB+WYfwpdmcBvqhZYey23d9mACKbke81gsHQV0v/if4apnub6
         SAFHbJM23L2fAxTHHnLOVwCPuZdj9l9j394ckVYPebfxewdz+GN6iGq0opdrcY1mF4K4
         UYpxKVGzsYGjD35h1BDcQTAzGSC5zZQaD7W9KhBBRZRr6Zzpr612eUk6eM5nTB2534XC
         c3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788394587; x=1788999387;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vzm816r0LGTVzlU6FqzDKHr2Q746+h0dW3Jpg0VBIpA=;
        b=bNxFdUs5YC2NXToDMsHGr/tcLIEKJzFmi+4LS8/762ko7SO1VdakesRdwH8SSDL7sg
         y2rFRsWMZKfj/LhFCDoyAuYl9v9BJgLyM4gytmtFk682y1fFDaNcJn5OIKBIbTHfUC6S
         t7CA5byQWoVxzgl7LfVUDUVZHcX3wdEkBuhHrMAQXQ8ipJEcRKoCc3gOQqLr2Jy4ZUlo
         k97O1Qd1xUuq7wggVLxhFp/e+CRXAM5kMQE7Bwv5urlXwNbk1YDKbBjpavp6BPqrsh0Z
         bs/CsJD1dzm2xItWJJvIrg2XNHPnLrYYRUIh4sy13z7TbTbzu3dlpD6TB1K9YXrgZQqI
         ZPZw==
X-Forwarded-Encrypted: i=1; AKwUvBwWS5RDKelnlPv3lOC8oe/tUaYDcHX0h6d+QohiTSV6jEsQib9YZhv1K2Ddx2EmmO5yO7yqStkukS/Wiqc=@vger.kernel.org
X-Gm-Message-State: AFuF++nAT8xDu/aJCcQP1sr/8ZVmVahmOwHVj5x10fJiOc7rt9DLSGQf
	3uHYPoQ9dGgU//r0+Cf3ikogHUs7IaxpxbYJAzLYcsBZTdpxImRmfJth0Qw8m6QivtEat3ATuId
	hkrmsyA==
X-Received: from pjzj20.prod.google.com ([2002:a17:90a:eb14:b0:398:c817:fd48])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:57eb:b0:398:9be6:f995
 with SMTP id 98e67ed59e1d1-39aee1110f5mr12722550a91.20.1788394586534; Wed, 02
 Sep 2026 17:16:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 17:16:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260903001625.2792367-1-seanjc@google.com>
Subject: [PATCH 0/7] KVM: selftests: Fix maxnodes bugs and cleanup related code
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shivank Garg <shivankg@amd.com>
Content-Type: text/plain; charset="UTF-8"

This is a spin-off of Shivank's series[*] to fix "flaws" in KVM selftests
handling of @maxnode in various sycalls.  In quote because the flaw is that
KVM selftests followed the docs, and the kernel has a longstanding, poorly
documented off-by-one bug.

Along the way, massage the xAPIC IPI test to automatically run its page
migration testcases when possible, because that's the entire reason the
test exists.

I didn't included the guest_memfd changes that were the focus of Shivank's
series, as they are bigger and more involved (I'll let Shivank tackle those).

[*] https://lore.kernel.org/all/20260901-gmem-selftests-fix-v2-0-5a273153354c@amd.com

Sean Christopherson (5):
  KVM: selftests: Account for kernel's off-by-one bug in NUMA node
    syscalls
  KVM: selftests: Compute node masks on-demand in xAPIC IPI test
  KVM: selftests: Add common helper to get mask+number of usable memory
    NUMA nodes
  KVM: selftests: Automatically run xAPIC IPI migration test when
    possible
  KVM: selftests: Skip xAPIC IPI migration test when forced but
    unsupported

Shivank Garg (2):
  KVM: selftests: Fix maxnode argument to migrate_pages() in
    xapic_ipi_test
  KVM: selftests: use BITS_PER_TYPE() for NUMA masks

 .../testing/selftests/kvm/guest_memfd_test.c  |  2 +-
 tools/testing/selftests/kvm/include/numaif.h  | 43 ++++++++++
 .../selftests/kvm/x86/xapic_ipi_test.c        | 78 +++++++++----------
 3 files changed, 83 insertions(+), 40 deletions(-)


base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
-- 
2.55.0.970.g62bdec98f9-goog

