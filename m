Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C27D4E50BE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790617312; cv=none; b=FZ8uc6iN/1Gjka/QH3KCFeL1xAiG+HDH4rVjN+vxNxVXaq0/3S/+/A5yA5qw8C2Z81Gcj8T7p7mwdt6lfNsrCx+Ff5S3fJfl7aLSABPLtXSQkhSVZBHTzSKl53wtSAXvV7we7ad9ZbSZqrHwaWTEbr0Y7dHgGXXCWQCxqcl8fm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790617312; c=relaxed/simple;
	bh=oBxdLKzu1tEOdRfcRuf4qFtiL4lcXsW2YMerrRbbXZQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Noh/me5Bzu+U3fpmS6jNibq9ZEI0CDIgTs956mJCrE5jXPMeyPd9SwPuqWAWBVH2+mSKEk0uiSyNa1/F/9Kx0omfcrRR7IB/Gd8niDLzYqqYoPDKpQTG9ZiWl7LcuFjQbQxSL0ExuGSHirpBFzrWyfltFOxeeA5+AjE1mXgjnJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K7iUmNHF; arc=none smtp.client-ip=209.85.221.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K7iUmNHF"
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48885f0ffe7so1432501f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617308; x=1791222108; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/R3jIsuFxLI+ycNCkUkycnkKQylo65Jf0ypcBShLiJ0=;
        b=K7iUmNHFkvdPI6eeZM38hawvFWytRuLT41xJ6X7TBNoi36AvY4jOHai0Z4KbPAs3Dg
         7roEu+nfr8sL/Gcv5LDCwSU1X2RO5Jo3rlZ5KZZM5kxWc54puzp4yx+wQXHDDJHjXkHC
         BJDf4rugv2dWNDx24YC3NmrZRtxqLDzpNDGZu+T8k340d1JDALDHyMdAJtRReoqNSNkE
         Cr0fBH1coDzPKGA6vb5jtz2IFEW4jCfFMWUjLBN+Z86EtdC1orJZqweVM+UoqU95uO5g
         Zb6NGP7VqdXKPGTic5NrSzOYT1/KeH/ul5kvdbcWQFBQIk1ybk8BisiKzAnP2LMaVAq6
         5xDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617308; x=1791222108;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/R3jIsuFxLI+ycNCkUkycnkKQylo65Jf0ypcBShLiJ0=;
        b=frdF28/KtXZRGOdTn29Qoa/gwuJ1WcVTOakKXZcJYwJrVxfvRDYr6s4ivznpBxWVlE
         2AK10J5QS/sROn2vXRq414gWa5HBj3PCuC2tTSqY6/nZLP7mB3PD4oJ64JqZaUcmjJRt
         0meoyAshxQuZA5v25ZKyfVdAQSUEX9lVoStkYjekO5NhYMFSeF8Do9ROJYAfJ6H8ekDc
         G4C+ZxuoKds3HU5WRJgcaF2e37xnPg+FsqekT/uO87ulyRYDSTFISqcOjVX7n7bl4zR/
         gHFKZk0MHaDJBW8gzYm3iNGP4EeY5FqjZ3s6C174qHSJ9I4uu/QbihEGCM8nEmkVorw5
         HwYQ==
X-Forwarded-Encrypted: i=1; AKwUvBwm8hb24k+c00iyYhtLOJuI4mucirDfyQWYjjrvnrN0WAjejWOvtov1qzHR7+jHgiBxTA4BOzD2ezxrvKE=@vger.kernel.org
X-Gm-Message-State: AFuF++lj2CoUT8z+yEGbs7/3Oqd7agctAWPSTg7GkoZTHNxi/lpqgkIB
	KXyi3xxLwMehKlx6Ev+yzbadTquKTgiDifBYG7d+3BfojxmjMVWYK4oihOcnM6ERaUuuC9oZ/gV
	D0v4n1F8dyEUnEw==
X-Received: from wmoy19.prod.google.com ([2002:a05:600c:17d3:b0:4a0:23b:31a7])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b1b:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49fe66c8a1emr263025785e9.2.1790617308191;
 Mon, 28 Sep 2026 10:41:48 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:08 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-2-smostafa@google.com>
Subject: [RFC PATCH 01/15] fork: Remove assumption that vm_area->nr_pages
 equals to THREAD_SIZE
From: Mostafa Saleh <smostafa@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	akpm@linux-foundation.org, urezki@gmail.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, kees@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, gustavoars@kernel.org, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Linus Walleij <linus.walleij@linaro.org>, 
	David Stevens <stevensd@google.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pasha Tatashin <pasha.tatashin@soleen.com>

In many places number of pages in the stack is determined via
(THREAD_SIZE / PAGE_SIZE). There is also a BUG_ON() that ensures that
(THREAD_SIZE / PAGE_SIZE) is indeed equals to vm_area->nr_pages.

In the next patches the kernel stack size will not be a compile
time constant and would be less than or equal THREAD_SIZE based
on a command line arg. Therefore, use vm_area->nr_pages to
determine the actual number of pages allocated in stack.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
[Rebased, also skipped intermediary helper variable nr_pages]
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Stevens <stevensd@google.com>
[Update commit message]
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 kernel/fork.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 5ef413368912..2065693e762c 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -315,9 +315,7 @@ static int memcg_charge_kernel_stack(struct vm_struct *vm_area)
 	int ret;
 	int nr_charged = 0;
 
-	BUG_ON(vm_area->nr_pages != THREAD_SIZE / PAGE_SIZE);
-
-	for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++) {
+	for (i = 0; i < vm_area->nr_pages; i++) {
 		ret = memcg_kmem_charge_page(vm_area->pages[i], GFP_KERNEL, 0);
 		if (ret)
 			goto err;
@@ -488,7 +486,7 @@ static void account_kernel_stack(struct task_struct *tsk, int account)
 		struct vm_struct *vm_area = task_stack_vm_area(tsk);
 		int i;
 
-		for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++)
+		for (i = 0; i < vm_area->nr_pages; i++)
 			mod_lruvec_page_state(vm_area->pages[i], NR_KERNEL_STACK_KB,
 					      account * (PAGE_SIZE / 1024));
 	} else {
@@ -509,7 +507,7 @@ void exit_task_stack_account(struct task_struct *tsk)
 		int i;
 
 		vm_area = task_stack_vm_area(tsk);
-		for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++)
+		for (i = 0; i < vm_area->nr_pages; i++)
 			memcg_kmem_uncharge_page(vm_area->pages[i], 0);
 	}
 }
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

