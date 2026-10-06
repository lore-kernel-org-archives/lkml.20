Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F9A372EE2
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791324890; cv=none; b=sln1h0DfJieX5GtqqsLLU/9KU1pyc0BdfiGJ1YSWTrMahp9Tji0IMtppmQtoeRTBPOfcltYU7g1ihcY6vDJoo0IQNnU2ImT76FXXJEvOFTF/nJ0bawLaRvEveGIyNtBXBzxDl35QuilTOXARjRO2N5NtFYsC4A6oc0pVtPzjEno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791324890; c=relaxed/simple;
	bh=AQ5om9HPRYY1azjZjV5O8dkragpfD0aeCFgbpoF2+m8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nOfj5aH3vhpTiYww7t0c2AHNZH07QVrTV5XhBTCBQYwfLziOiADJp/5rU8O3dUdilXi5/VeI2pa1wiFLsn8AU1aFhKQrSEieJRhRbMWX9+Qgg4bZbDdkPU6zEhCEXzQd3jVmbRGGYxuzPq6FJ+5SYBpG32cCI4T3bATgusFLbbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=UxJ5od23; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="UxJ5od23"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6aa9606ddadso2327570eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791324888; x=1791929688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=asZCHctIeQVz0B1gy7RhxULncl4dgzZFWQT5KkoIqI8=;
        b=UxJ5od238vq0VA0dDEi+fLislHD6K7TcYghV3NlTAI8oT2lhlhHKckWVbPLjoeaQg6
         tI+8rCEhUZPrwNV2UZzoX7pn2BnB+1XHd95Mz4KJuaj0EO7bY/CcTQzq+bJcKL0IJlNq
         5MYkNZA8Gw0XirftlT9eIUJN5hjC6SAgJv9q0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791324888; x=1791929688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asZCHctIeQVz0B1gy7RhxULncl4dgzZFWQT5KkoIqI8=;
        b=i+NIeyU56lMgEGRWcOePIjKU2TYFmZzojsAbEqxE8ooaYTYR/0tSiu8QXcWV6qhe6/
         D3+Wt1NtXLMRfevkSgsfFiBcwxnf1a2qZa1/ETyJLmO7m56aKH8JpReupl5fGy4rsR3V
         iH6kjcp9SOOV2EHOsrwz7yoNvdo1xUguGt65exJ35U4ZXluoG7eEc8SUExyVGHrHKvNt
         7yk5uRWs26bl09gOIJaRKmQPpxQorKIMpLtKRbcYGK4Gth6And91OUJtpLIsUosYB4JG
         Ipb1wdtT8nwSwDvqtFFBmLjBrmIUA5VMVQze6ksHCLDOYDfHqeoGchZIzDwhn+O8qybk
         dKJg==
X-Forwarded-Encrypted: i=1; AKwUvBxyeV7lt4LqqYlrIp/oV6atI3H0ENXwPkM+PoOp7WDILeWK9gAaibyjQkFoZ8/ALnY+t32ONdtCMMvpKdQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n36podsZ8IvePqMmWKZ+KBaiaWpegbdmbMC8eKFTf/9lPs8L56
	BEvDGf11o3kTSxAJPQoLCHSIXh1Ma4xx1Z9EGuS2T/bY3GEqHMXzmCoiMjkXmhwgqNg=
X-Gm-Gg: AYBFou04i4amSQ0V8avUn1jJYHbsQrbkBQV9nqMgnlLoTvQPnDovg5UmaAwuV+lxg5J
	wGtR2M3kIh7lsaZOXkFlf9wwov8eziTvIJ9LfNtnIbmawbew6zKmMeuRju2Zv0y0zwDeHA7/UOT
	qtWx08PAijUcfxX37ASSDT6+27/y2sRGszxEEtS1x//KFGrYxUhk10sn8LcZ92t/AXz4DhgParv
	gQu4ZVAV6N578Uy/+Mhy5n4V4jsNXqMcINfJkXdF7j0H88pAT92aNAbFHFjADejOPLT1+w1w8Aa
	2CwTyQY5cKCHJ/qA6iDsD6YxBxYAwYlrcmLuDYT3bQAbNVgeV+W+KTWlO5yCbqFebWFGYLR4th8
	E5pWZo/JBYnD+xyVz1YEI7eH4F6fN1bOTZsK56nAOVTe6TfpTMg3WvmkUf8cddG90vaV8+z0blc
	0fJsrCvLjAtE9k5juVEAmG4pTSiET12TbMJn/zoCc3ZqRUdi4+pGAfP8jShD+DXGZum45GFvNiP
	ld82oi/LAk+lGU5SrrZqaSJDkSYDPQDgzA+/bQ7HyqxXZPy4t9KrdSCdKBSlIcIQRjMnZpjE5U=
X-Received: by 2002:a4a:edcd:0:b0:6ca:4a52:798d with SMTP id 006d021491bc7-6e7a65da2e2mr541644eaf.28.1791324888130;
        Tue, 06 Oct 2026 15:14:48 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e7947969bfsm660861eaf.13.2026.10.06.15.14.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:14:47 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-mm@kvack.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kees@kernel.org,
	outbounddisclosures@openai.com,
	Kyle Zeng <kylebot@openai.com>
Subject: [PATCH] exec: serialize argument stack bounds checks with relocation
Date: Tue,  6 Oct 2026 15:14:44 -0700
Message-ID: <20261006221444.35641-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

setup_new_exec() drops the exec locks before setup_arg_pages(). At that
point a ptrace-authorized task can reach the new mm through /proc/pid/mem
and expand its temporary stack.

setup_arg_pages() validates the size and computes stack_shift before
taking the mmap write lock. If remote stack expansion wins that lock in
between, relocate_vma_down() instead uses the enlarged VMA. On a
native-to-compat exec this can move the stack below mmap_min_addr,
including to address zero. A still larger expansion can also underflow
the new start and hit the relocation BUG_ON().

Acquire the mmap write lock before inspecting the VMA bounds in either
stack-growth direction. Keep the existing locked relocation and send
both size-check failures through out_unlock. The size check and the
range passed to relocation now describe the same VMA.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 fs/exec.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index 819643408e6d..1ab09c5ebdda 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -617,6 +617,13 @@ int setup_arg_pages(struct linux_binprm *bprm,
 	struct mmu_gather tlb;
 	struct vma_iterator vmi;
 
+	/*
+	 * The temporary stack can be expanded by a remote memory access.
+	 * Hold the mmap_lock from the bounds checks through the relocation.
+	 */
+	if (mmap_write_lock_killable(mm))
+		return -EINTR;
+
 #ifdef CONFIG_STACK_GROWSUP
 	/* Limit stack size */
 	stack_base = bprm->rlim_stack.rlim_max;
@@ -628,8 +635,10 @@ int setup_arg_pages(struct linux_binprm *bprm,
 		stack_base += (STACK_RND_MASK << PAGE_SHIFT);
 
 	/* Make sure we didn't let the argument array grow too large. */
-	if (vma->vm_end - vma->vm_start > stack_base)
-		return -ENOMEM;
+	if (vma->vm_end - vma->vm_start > stack_base) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
 
 	stack_base = PAGE_ALIGN(stack_top - stack_base);
 
@@ -641,8 +650,10 @@ int setup_arg_pages(struct linux_binprm *bprm,
 	stack_top = PAGE_ALIGN(stack_top);
 
 	if (unlikely(stack_top < mmap_min_addr) ||
-	    unlikely(vma->vm_end - vma->vm_start >= stack_top - mmap_min_addr))
-		return -ENOMEM;
+	    unlikely(vma->vm_end - vma->vm_start >= stack_top - mmap_min_addr)) {
+		ret = -ENOMEM;
+		goto out_unlock;
+	}
 
 	stack_shift = vma->vm_end - stack_top;
 
@@ -652,9 +663,6 @@ int setup_arg_pages(struct linux_binprm *bprm,
 
 	bprm->exec -= stack_shift;
 
-	if (mmap_write_lock_killable(mm))
-		return -EINTR;
-
 	vm_flags = VM_STACK_FLAGS;
 
 	/*

base-commit: fd179f8a05be3ccae366b9b96e176b51fbe54aab
