Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F481CAA6C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737544; cv=none; b=TykXqWYswgdvyQhJ6+HeeREPlGZUNAJAw5FVufCbYF4NOA9SwrProTbRxg8yTQ9IgnviksZ1Yrv02852UwkmjzLVIzKiGFedJGSZPCc5q8tjc5C+Waxwfq6VGK0/AuKP/lhFgz7nxz4NsrPtGxfK7070/No1zsT6yUGvw7ODHVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737544; c=relaxed/simple;
	bh=rz+u7nKKPKCkeRipCcTkGP8jjZ5LSw18vUegoNJmQYY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=H05+5uJI6QuAxxv5qfNXUxVTWd3voTo2NKfixzXHbhO/nXlM+kBsKtt0qdw0PQjniibLXPtQwKs8Esiy1vunKjSNgpebeNZjmcyrawtjOcrpw+17WLInwECB73PaGB+KMFryEH46xZIeAutBw0sIEr4eLH6XCTb4VsY2aOIabK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l3DfI1zm; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l3DfI1zm"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4957287363bso7023525e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789737540; x=1790342340; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k3SNv/hlO2h0xkklONRKfGgBfOPQjFyFw6MzNkTps1c=;
        b=l3DfI1zmBQITvwk2y1uZjuastry2Vsl6i8GCMuVWq37Eumzbq9OZny7HJ5pSAgwZNb
         Jexu/vTuVvx4jBJteC3n6+GrkUxhUkbCqcNG/4uU/rh8tuuyh74osur/LPb03c0QP9da
         XE00WfQhdQkgSRidQFIjt68GNW9vcb6PpoTo/6x0YTwt5mVukuis3rXHWClrx/Vul+xP
         uI+iuGxsNYS3Wbn7wKtiqRJT/t8XMJIdnf219kDpB4wGcnHMelL4g2Pf5/m2Ts0IgJEg
         xsMaq6pydpwHV/Ru7xe11NWM/FEk9pU11nZhkbHEfF9SEx4pI1wfjowAKXdEjuLdjjMM
         vdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737540; x=1790342340;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3SNv/hlO2h0xkklONRKfGgBfOPQjFyFw6MzNkTps1c=;
        b=lqCrwtbe+j86dvgv5n5n0h8SCMNfmaRA17+TMm+9KOwh0ctgisNHl7XhbmdbuOm1ef
         wL+ywCtkCqT8f2LMGYReA+IlfTJIM5V1qICH5QFg+1nkPcr1moSGJ78ePt58nff9Fd6L
         wW6jB0+KNO6zeDwyh+XvrHYmTQyX+bwJ/Gp6n0GEGxFzXxhzxcDPnR/sqkVwYEvrttpz
         q+5AQCLqsFREiqz8RnfnuSnassFAbjBB+ty7pQXxZjbCrQrp5H6AoZwbw18SwgBPyZM7
         cVzgAY6AAEtnwoXLALN1IUlzIrKc2geXVXHqCedG2GTxnpR7aXlVryY3GoElP/EmDynw
         3t1w==
X-Forwarded-Encrypted: i=1; AKwUvByp/kb/yLUKdZX61ohyUAcTX3TdgYY0vci4RuUxth7Fo1FcsQXQtxNiqV2LLYX6FzPzw8BQAeGuIhqMyoE=@vger.kernel.org
X-Gm-Message-State: AFuF++kCCexZv5RtqszUwwNpVr4P994RPBcXFWsLQnEaMcRNC7ca0hLR
	UFLZvTTHiI6JDbLip8RLmLCL+cu98W85wRqvINkbKiL4V9oqDGQ7J5qbpnvARsaIgjyMK9EASM3
	JxzvzrWqlCY52o5s3QHdghQ==
X-Received: from wmrk15.prod.google.com ([2002:a05:600c:b4f:b0:49c:e349:ff6f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f09:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-49fc56692c6mr32982165e9.2.1789737540280;
 Fri, 18 Sep 2026 06:19:00 -0700 (PDT)
Date: Fri, 18 Sep 2026 14:16:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918131656.3710047-1-vdonnefort@google.com>
Subject: [PATCH v1 0/4] arm64: mm: Allow set_direct_map functions on BBML3 systems
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org
Cc: mark.rutland@arm.com, lenb@kernel.org, pavel@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thierry.reding@kernel.org, rppt@kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

This series is a fork of [1] which creates a new CMA pool for FF-A lent
memory which unmaps that memory from the linear map as a mitigation of
CPU speculative access to Secure memory. [1] creates a PTE-level region
to enable setting the direct map, but BBML3 systems shouldn't need it.

Currently, can_set_direct_map() only returns true if a feature forces the
linear map to be mapped at PTE granularity. This prevents systems
supporting BBML3 from enabling set_direct_map*() functions yet safe.

To enable them, this series:

 1. Use the fixmap for hibernation. This removes the need for handling
    atomic context in split_kernel_leaf_mapping().

 2. Breaks the dependency between linear_map_requires_bbml3 and
    can_set_direct_map()

 3. Allow split_kernel_leaf_mapping() even when no feature requires to
    set the direct map.

[1] https://lore.kernel.org/all/20260902104712.2399797-1-vdonnefort@google.com/

Vincent Donnefort (4):
  PM: hibernate: Add arch specific hooks for hibernate_map/unmap_page
  arm64: hibernate: Use fixmap for hibernate_map/unmap_page
  arm64: mm: Introduce linear_map_needs_set() helper
  arm64: mm: Allow can_set_direct_map() on BBML3 systems

 arch/arm64/include/asm/fixmap.h |  3 +++
 arch/arm64/include/asm/mmu.h    |  1 +
 arch/arm64/kernel/hibernate.c   | 12 +++++++++
 arch/arm64/mm/mmu.c             | 46 +++++++++++++++++++++++++--------
 arch/arm64/mm/pageattr.c        | 12 +--------
 include/linux/suspend.h         |  2 ++
 kernel/power/snapshot.c         | 10 ++++---
 7 files changed, 60 insertions(+), 26 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.55.0.1082.g2b9226bbc0-goog

