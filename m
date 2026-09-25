Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F191DDA18
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790312815; cv=none; b=g3Rcvs3CKUFxIKpe2eB9QsGKfC+pkvkGwcLYj8askQGTYHDae4GHJLqpitIGKCXt9+iK08PSL7kMkMhRt2kNIyCahih5xCCD9QeKaPU3VNEDIMlqr8AbS+FemO4wkUg0Eta8Q7jIVoKJED95tp7BcQ+Yoey1e7ReLpVoU5Z7QQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790312815; c=relaxed/simple;
	bh=FgNvILV90xm1SMzdCLuDcjJ9uRlnlkG2a/778kvewAU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oe+Tr5LZydyKPLWWC2j3fSJAFU93rtUl/zdoWvUtou1uCJ21ExvKvrWq+Ap8x5a7o+Q7EByd/hbMg2fPHAHWlHpDYNd+P2v7tQOOYSSbw+WxETC/+RzqLjTBWvUblBw/t++DgDnZeJFNiHV5od79l2/wt5bsUXDfhH1vl68opuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfRHeiNo; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfRHeiNo"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso6206225e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790312812; x=1790917612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bTHdBxfhS/8AwdrGP71aETufCPYtjaKQTmoOMEZkDuQ=;
        b=jfRHeiNoh7sNbXk9UmmecJwQyhc40M7Ke/ibgUD+EzQ2CTlAzg3tH13Alip7xpHo+v
         9HFnzgFsWzkZwntGqEWSFfPDB68GmLC2sgCBp+13MjNJKxSNxFHOd6aYcDF0s9O8gs35
         nLdWKkrflpeYBeR/xODptpYqwwTiSWAnD9YumRSfWT9o6+bVyttaKMGLhhJuDT1A0jur
         PB3/aRjsxEdyBDA4Iw6cHSKc51S11vOXPq6G6rfQE3rRH+81xjJJvrq3DwwfSGXNt3ns
         mz8wgPSCHC53n7sxdCHoSjrBrgPjsAi9CuOzb/8KvDX6l8hmmibk0eYXoKmm9+YU7gpk
         uVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790312812; x=1790917612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bTHdBxfhS/8AwdrGP71aETufCPYtjaKQTmoOMEZkDuQ=;
        b=k1nVtfLxV0VvtbolZp2FPxxFp7QrAI/WatAlHosmCYjQCroq1E4iZcLx+rQpZSep3g
         SONNizj3ODFcTnjmzvM9pKQVfnDJP29tyPEpsw64YF1WX92OXusGPalOKoRby7OQtof+
         eenw0Kz4SOefzcjwxISohud6S0eGDZzRexK+usnv/jA2w+seFQv4NTqzKteo6TSYnZSe
         HlYPMAsWZMXV74FaP303Qqo9JD0XKOkRynAt2tgvqb1TP+GpeuTGp12KzDK91m3rgJwh
         r1rJdF+p52YTzWtguTuWo8dRkID4rQz2rbF9MGY1n5lHGsvPBtcIqCcEbdAX/7pZwHjd
         cwtA==
X-Forwarded-Encrypted: i=1; AKwUvBxOoEZ3j6EVenzlMI0MXMmH/MK/auvQopf3ZqHxRWbGUKAAlvLDjeAsGB2HroizPr5E8WiazBPe/+cyKCg=@vger.kernel.org
X-Gm-Message-State: AFuF++k18Pqk02/015ATSsbjh/XEDrMvxvyPu+05ycz3GfnG7VlLGyhh
	8Sq1El1z9A83qF1tlgwfRBu6Zxv/gDoqzmBZ9nMyoUPvSBA4P+jVCrdd
X-Gm-Gg: AYBFou3v+Yb9lAuZw4JXlR/Z65jg6DgPxawRVtniYYPuY5gwTvh6cCmfvRBLVWr4tMr
	beeqTicPqBFumGpUA9vlzj9Wn/KjhEQ0bUu830q649iL7ETbmWJHZhXM9Q59Sm0NgcJNKE6k9+A
	5RL4WOiDMBeNkQwVnZi3Cl2po9CZ7UIUvxJy+dk/52f4yV4Cr/m+IDzGu8Gy8a1Yx3VcF4YmHZG
	My31Gz1QqAxPd2HYkgLwo1yqY96zbvSoZhpdjc9Yz8N4EigrorZcLu/2hEmG5VWutUWRfcXgdVr
	tcugpNrCFehgegSFaDHVu/7pROgpYu6mpJk4+GXvyujNyZvmHe1KhJyhfpVCGKnoM5RmnpcFtuh
	GVFNfwfaeLHssRkDZv7xAVM8cmQT76svzom6wWGCNI+dOGcPy6RBBhpNA6Q2Jv3vy4El/7jjqN0
	I7riw1FbjrhIjT4pUdXYp68o3oS5E2n0+E9X9BStPqMlMadOelcWiZOVCguYWgnq4V23CS4+qSR
	9099hHYdrdBHcEu+heiGmnGTf+XJeH0vrqff3ZfEn+O5JsEeApWXxWiQVU6rSa7eV0xsLk=
X-Received: by 2002:a05:600c:154c:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49fe66cab86mr77104535e9.7.1790312811460;
        Thu, 24 Sep 2026 22:06:51 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06bdef2sm29882305e9.11.2026.09.24.22.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:06:50 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	x86@kernel.org,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH v3] mm: don't schedule deferred kernel page table freeing while booting
Date: Fri, 25 Sep 2026 10:06:47 +0500
Message-ID: <20260925050647.86913-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Booting with a boot-time function tracer and a filter, for example

  ftrace=function ftrace_filter=pud_free_pmd_page

panics on 7.3-rc4 as soon as the tracer starts:

  [   23.531178] Starting tracer 'function'
  [   23.675800] Oops: general protection fault, probably for non-canonical address 0xdffffc0000000038: 0000 [#1] SMP KASAN NOPTI
  [   23.819917] KASAN: null-ptr-deref in range [0x00000000000001c0-0x00000000000001c7]
  [   23.964025] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 7.3.0-rc4-fe2ec83746e5-with-fixes-v2+ #195 PREEMPT(undef)
  [   24.252248] RIP: 0010:__queue_work+0xab/0xf00
  [   25.981629] Call Trace:
  [   26.125727]  <TASK>
  [   26.413912]  ? pagetable_free_kernel+0x20/0x120
  [   26.990283]  queue_work_on+0x97/0xf0
  [   27.134382]  __cpa_collapse_large_pages+0x501/0x6f0
  [   27.566662]  cpa_flush+0x394/0x620
  [   27.998953]  change_page_attr_set_clr+0x321/0x4a0
  [   29.151729]  set_memory_rox+0xa2/0xf0
  [   29.584018]  create_trampoline+0x431/0x6f0
  ...
  [   44.343347] Kernel panic - not syncing: Attempted to kill the idle task!

The boot-time tracer is started from early_trace_init(), which runs
before workqueue_init_early().  Making its trampoline read-only splits a
large page, and CPA collapses it again right away.  The split table has
been a kernel page table since commit 9e4a3ec3411b
("x86/mm/pat: Allocate split page tables as kernel page tables"), so the
collapse frees it through pagetable_free_kernel(), which queues work on
system_percpu_wq - still NULL at that point.  That commit is correct in
itself; it only lets CPA reach pagetable_free_kernel() before the
workqueue that function relies on exists.

Keep putting the table on the list, but don't schedule the work while
the system is still booting.  A core_initcall schedules it once to free
whatever was queued by then.

Fixes: 9e4a3ec3411b ("x86/mm/pat: Allocate split page tables as kernel page tables")
Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Link: https://lore.kernel.org/20260924064321.23787-1-mikhail.v.gavrilov@gmail.com
---
v3:
 - Schedule the work once from a core_initcall to free whatever was
   queued during boot (Lorenzo Stoakes, Dave Hansen, David Hildenbrand).
   late_initcall would work just as well; workqueues exist from
   workqueue_init() on.
 - Keep the fix in pagetable_free_kernel() rather than skipping the
   collapse during boot (Mike Rapoport): that would only avoid this
   caller, and any other early free would still need a workqueue.
v2: https://lore.kernel.org/20260924092307.22813-1-mikhail.v.gavrilov@gmail.com
v1: https://lore.kernel.org/20260924064321.23787-1-mikhail.v.gavrilov@gmail.com

Tested on a Ryzen 9 7950X with a Radeon RX 7900 XTX (lockdep, KASAN),
7.3-rc4 plus unrelated local changes, by booting with

  ftrace=function ftrace_filter=pud_free_pmd_page,pagetable_free_kernel,kernel_pgtable_work_func,kernel_pgtable_drain_early

The boot that panicked without the fix completes, and the trace shows
kernel_pgtable_drain_early() and then kernel_pgtable_work_func() before
any other kernel page table is freed.

 mm/pgtable-generic.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index b91b1a98029c..cd227fc05d2d 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -438,12 +438,30 @@ static void kernel_pgtable_work_func(struct work_struct *work)
 		__pagetable_free(pt);
 }
 
+static void schedule_kernel_pgtable_free(void)
+{
+	schedule_work(&kernel_pgtable_work.work);
+}
+
 void pagetable_free_kernel(struct ptdesc *pt)
 {
 	spin_lock(&kernel_pgtable_work.lock);
 	list_add(&pt->pt_list, &kernel_pgtable_work.list);
 	spin_unlock(&kernel_pgtable_work.lock);
 
-	schedule_work(&kernel_pgtable_work.work);
+	/*
+	 * The workqueue may not exist yet while the system is booting.
+	 * kernel_pgtable_drain_early() schedules the work once it does.
+	 */
+	if (system_state != SYSTEM_BOOTING)
+		schedule_kernel_pgtable_free();
+}
+
+static int __init kernel_pgtable_drain_early(void)
+{
+	/* Free the kernel page tables queued while booting. */
+	schedule_kernel_pgtable_free();
+	return 0;
 }
+core_initcall(kernel_pgtable_drain_early);
 #endif
-- 
2.55.0

