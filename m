Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F393143B49D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108897; cv=none; b=cS4DOfSmNMV3c9s+7162JyhQSQDtpatZdfdGtLRkTLr23Dp4aTdAhCYl8xgpXsNGHy2vpB0RwfpZHJwQkHsCWk4oIUyv6mqCJT/927+HtnfwMo8zqttwMszsiWWOx/P0nX+NDZp5pv4fqZyFREA8v4YwbkLJzN8UVziyhCae9ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108897; c=relaxed/simple;
	bh=PkE3WSX9JtIhEhlJzhCajN7UPABJAQghn++d/wKeH58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OBuDyrLHURa9EWw7m9fdWF69Ljp4wV9pZn5B/xEO7M+CIfPbh7K8qxDg/dlJ/O0cu/cr/ioqsYQMvgxj5n0qNKE/rgD3R/SEHnfCX4vBHYXjB5EdT2ilIj4oOwS5Uhu7bbuek06ye1ga2/yZVU3SuMrBzn36bqo9Q5FpdzHR9HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNiKebdl; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNiKebdl"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so499430a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 23:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789108881; x=1789713681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wCIfihLLndYAlu2pLx3p5U79c1+e8tApd2WKF9yFlbI=;
        b=JNiKebdl6Ng5ZOmPVVrx1bvFbrFQR/gtrU6R/R1T/zhKL0eoBLHqRv90B0F2dazj+v
         fgmyYGSt6+NSWRobOBoehl6JEkrOc+0zhN5kn/s4AiP/cAKxEXzcA8L8n4sAda6CtSRQ
         DHpbqmEUE8Fo/Y0sCBuVN3XsxttXXKu4OQXfMJBllV0PuI+LO8vkUWPmI9HDF+exrjmi
         mE06vnBIhQHNqvRZKqTP8JLRTsJzvogk9TGmr98tHDHlcTXDE6GZ0S3sivMVpqmNWCkk
         vje5Bng5ziVBm61h6i6k8TUPOdW8rBcjym+omsMcBp7xlsRqvPcTvrEZMW3l4jHYvnpN
         EzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789108881; x=1789713681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCIfihLLndYAlu2pLx3p5U79c1+e8tApd2WKF9yFlbI=;
        b=oPvmS8xNfy9AJobdBqj35V5z/G9JBDEQWNCk2NYe1dVcPlSS/bYtCZRKVTEE24jkKA
         FqArwAwTR1wrOscq/2jkyjcutFZ2kujzkaLWsp18M1gzuLhgtUJb3ok5qKb8fOABkvUR
         OWLvZiEj/VMUo4K9lhuZNHEgzSS2OunudjcRZg3SVyfG8xdaYKs3VO7iskRnBqnp14ZI
         wHsbFnUdC3kWKNGMGJ4J57JBi50oRVrhMguveJMrAh4446EoxaotLTcE2hnOwpYJS0Bd
         8e9Hy5xrdbBd0a1swPWVujamlbydWj9FXvl6BF1wyMq+c1mYbnEpHxR3OO1+2IEzcChh
         gYzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCGSr1tQhw+4VTdT+r1HjadPxRoy05RPAcQPh0kz4UFid0fdagGTL2G4oF0L4FFadgYj5N8+O3XpdOetg=@vger.kernel.org
X-Gm-Message-State: AFuF++ndgyT9jg/o4vbBpB68Oe0IhN01CD72mYhvVk9/hxD+uOfl8CuK
	gNr6Y37sGFOWCtcylj3f7lHvwViCV0wTjPROmDCiYHxa+yuU/8nfVMZ5
X-Gm-Gg: AYBFou0sjfE8xrt8af6hhKNoki5wdK9UjDANS7Y631UN8o3rtdi3U3fnpL10tcTmIlF
	8YhOdKD4lbc/Y4S9QUtTcOYOYQ7mH33JsOG18IQEAo2HBrOr7d835QZxKwUg1GQyk3O8/nLGD3j
	08iHasRIGPcA1+2jGDwqmWyp693ihvJot1O0tkUbVHsSFHr2MmynXNCNaoYG2dhjpAuSQWjzz71
	mF6stuKZRcZSRdn1W+UBSzdQhKZm68CY/ZjNYtMUZOxhAuUdKnEVHVUqjsnDaRv8b8AcYftOvkW
	wDclCtlpPxnJyu+kY0/5c5jWcfzNh6nkDs6jLvCOqD+pNM5R8IcAPoHgj/JqqDfUiB9tJ+XTJ2u
	8Q9jIcQOMuWdEk9WE/dZoHvmECQ1d74y1xJWSq148v88KPRLbB2QwNEKKk+CoYCDiLI9pYsrf21
	t76HyQRcO/D2hO0eJf8W4r2nUOIkanUEY+pz5L3gI1hrD3Bpmo+g4OnrCRUnCRGYoyu9SrZKLcb
	w==
X-Received: by 2002:a17:90b:440c:b0:39b:57c6:e280 with SMTP id 98e67ed59e1d1-39d9bd65a3bmr4250586a91.7.1789108880711;
        Thu, 10 Sep 2026 23:41:20 -0700 (PDT)
Received: from localhost.localdomain ([162.128.207.85])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602e7sm3286683a91.5.2026.09.10.23.41.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 23:41:20 -0700 (PDT)
From: fuqiang wang <fuqiang.wng@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: fuqiang wang <fuqiang.wng@gmail.com>,
	yaowenchao1 <yaowenchao@jd.com>,
	dongxu zhang <xu910121@sina.com>
Subject: [PATCH] KVM: x86/mmu: Respect user goal_nr_mmu_pages after zapping oldest pages
Date: Fri, 11 Sep 2026 14:41:12 +0800
Message-ID: <20260911064112.10766-1-fuqiang.wng@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When kvm_mmu_change_mmu_pages() shrinks the shadow page limit and the
current number of shadow pages exceeds the requested goal, it zaps the
oldest MMU pages and then updates n_max_mmu_pages.

Previously the new limit was set unconditionally to the current
mmu_shadow_pages value observed after zapping. However, zapping can
reduce mmu_shadow_pages below the user-requested goal_nr_mmu_pages,
since a single __kvm_mmu_prepare_zap_page() may reclaim more than one
MMU page (it also zaps unsync/child pages). This could then clamp the
limit below the user's intent.

Use max(mmu_shadow_pages, goal_nr_mmu_pages) so the user-requested goal
is honored even if zapping overshoots.

Signed-off-by: fuqiang wang <fuqiang.wng@gmail.com>
---
 arch/x86/kvm/mmu/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 064ecc33b926..efeba58936a6 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2913,7 +2913,7 @@ void kvm_mmu_change_mmu_pages(struct kvm *kvm, unsigned long goal_nr_mmu_pages)
 		kvm_mmu_zap_oldest_mmu_pages(kvm, kvm->stat.mmu_shadow_pages -
 						  goal_nr_mmu_pages);
 
-		goal_nr_mmu_pages = kvm->stat.mmu_shadow_pages;
+		goal_nr_mmu_pages = max(kvm->stat.mmu_shadow_pages, goal_nr_mmu_pages);
 	}
 
 	kvm->arch.n_max_mmu_pages = goal_nr_mmu_pages;
-- 
2.47.0

