Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01DD3921CD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232209; cv=none; b=PDN2U6Tb6RuE81UpiK0lKMy4/oiNuIaD55SE9kclb0QHek0yOoxVhwNW3+kBgRJClg5pPgcYayryEGfsBi58KBq82urjGzLxlNIxmKS9U9W7imFtnt+lO5EIJcs3ld+TBj2biK3o8t1fY44+P+MTLZ5CILeHRcYRicarCC3B4aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232209; c=relaxed/simple;
	bh=lrI7esIax69ngJYm931hYNsW1zvRdM31DhVgSi9jBVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CRRUj1ZQGtxHpg+MtndFdTbHr6guEZDzdSERDvPUYfLH4CjGOjR5CoP90bNhylJk01T9q/PRO+Boktq79K/sv0JrH8msv3VSxdSy9wUFXU2/bJKjuFl1bFHbqfWJHU31hB5qV1Tb47JSf+Tiaq1QeHinY8W3iwxJWmvOvadRB/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxlnT6/m; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxlnT6/m"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so18798335e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790232206; x=1790837006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sd81Spa/YxvQixpMcNxhaEy6XglgEfTWtaXZ4D7EaWc=;
        b=JxlnT6/mt5LcXGZ+zgIcn0i+RGB9L+hr2VQu4wBzMMVs+4lqkl0AjGMOXNGVLK6EjY
         LytYnWT1fZz2qJ9oPKcsB3KguzbcPduhYHg6LMlanYrfLDKqpvsvRqAAXeEkeo3UsIbL
         bSLOHNKW+0lgkW+1RkHsvW4lw3p+UaQaa9cQiH/PdPMrdFgWnvV6CFDNGa+5giJ0p9iO
         SukI8K2Dwr510OAswbMKVZogPn2YX/7RNplmUAIKmgW46lVfHZHzEE+yjLzYpEgTROps
         /KbnssZR5iVhggBx+ZXpRIxMQa2VkWvlMr1txskCxp2iynDdO2e8RJKf2vz9Wwyygyag
         PKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232206; x=1790837006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sd81Spa/YxvQixpMcNxhaEy6XglgEfTWtaXZ4D7EaWc=;
        b=OCER8UVQ3J9yiyA7FWSqbwS2qWXBx71XktU6zLEgHIddo9KXRZzqsD9OfH8QCKl+Nm
         JeiDEsPIUqetW3YoXu94p5vlLwIPj1gtxl/EqJl2ZnBNuvdplGNt5kS+LVVRKBNEZjEl
         7CDnnbuifc6SjYfKuqv+jUmRLIGLAlAUMG50AWtj1ZAxfv8c8/uQEVPbUD0etKTH73Wo
         Cd9cE8YK0Q98kMCJORnLwSxz7gjcjuNMrAe8ss4u/AMuxcNVsYypDPkhpKAindURoHRt
         Z7tq7/XFsMWqE6zMyowlFI4pPC/Boc5BovkEWc/XeSCg6l2JQBP1P62CS/Chpowk42Uk
         07dA==
X-Forwarded-Encrypted: i=1; AKwUvBzrr/+MZ7zCZlilraKzcAWAYlvAjMjcKt5IAfVIwqzzlu2BR93BBp09CjkSzalLCDK/7KqgYM2dlyA8ke8=@vger.kernel.org
X-Gm-Message-State: AFuF++ky1Cma1xOBYMuyxjlAL40yWZcyXz1yPtkJD7LfHvuuUM0NLGCS
	s59OSnVDeVHBquTQ88dZG5uY9ZJJxQV2Doqw2WL3GewjuZ9XT4eJQxit
X-Gm-Gg: AYBFou1+gDNe7cxKOEM2JdAAbUksANjz/K5gaZf+H35eNC9vOPRowhu/ocaz9Ttmsnw
	KyEzLNOULS9qprbjwMozVVmLkWHjz4ihyvTLDdwP8UUyuNZXzPfgWexI4n0WF5vZz3ku66mKnNr
	nusDh7m6yMrQx3XrSTJp7OEpfWMh2yYQhnFq+/vPD8GzsFSJJ3+rHt583c+awLK6a+LmpzYFKPB
	1XwAUx9r+jHxrNe5O/P54/XKcAcPw/HPw63PbKeHHNW+xxXsh9S6H/g9tc2hS+Lz4pSybf0rJew
	ecfGIbdEyLRm103OL2wYFiwxG0S+6PPFAVOrGkNVhnIYXiP0jsZmawChHEnJ4Fh3ZJIAk/NFHgY
	5OBvdINTeGorGlC8xwZYRyxmd+cg5dcRdy9NaTJBjq3cm1kO5nYZUpo4hsIbv+KYuAQMdbxB6dX
	1N3Uk8dUZeLP3foi23aAoJzKeZZ7PCgK/IQFtxpqrQffkjNWR4aLDWl5GkP+YLwKJX8Rm4K9dbD
	MaSKt8z6ZL8knDSxSv/elLe6NFF5J5AjVB5dvPi/pexSIpvf+rPvuLSmxT4QOvA5/Y3RU4=
X-Received: by 2002:a05:600c:8b22:b0:49e:6fd2:a45 with SMTP id 5b1f17b1804b1-49fe66d81fbmr22703135e9.16.1790232205833;
        Wed, 23 Sep 2026 23:43:25 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf99df60sm90788905e9.1.2026.09.23.23.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:43:24 -0700 (PDT)
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
Subject: [PATCH] mm: don't defer freeing kernel page tables while booting
Date: Thu, 24 Sep 2026 11:43:21 +0500
Message-ID: <20260924064321.23787-1-mikhail.v.gavrilov@gmail.com>
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
system_percpu_wq - still NULL at that point.

The deferral exists so that IOMMUs using SVA can have their paging
structure caches flushed before a kernel page table is freed.  While
system_state is still SYSTEM_BOOTING only the boot CPU runs and no IOMMU
has been initialised yet (on x86 that happens from pci_iommu_init(), a
rootfs_initcall), so there is nothing to flush.  Free the table directly
in that case.

Fixes: 9e4a3ec3411b ("x86/mm/pat: Allocate split page tables as kernel page tables")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---
#regzbot introduced: 9e4a3ec3411b

Tested on a Ryzen 9 7950X with a Radeon RX 7900 XTX, lockdep and KASAN
enabled, booting with the command line above plus earlycon=efifb so
that the oops is visible:

  7.3-rc4 (fe2ec83746e5)             panics as quoted
  + revert of 9e4a3ec3411b           boots
  + this patch, 9e4a3ec3411b kept    boots

With this patch the boot-time tracer works as intended and records
pud_free_pmd_page() being called from vmap_p4d_range() during boot.
All three kernels also carry my pud_free_pmd_page() v2 patch and
unrelated local changes elsewhere (HID, sound/usb, Bluetooth, debugfs);
none of them is on this path.

9e4a3ec3411b is also in 7.2.7 and 6.18.53, together with the deferred
pagetable_free_kernel(); I have not tried those.

 mm/pgtable-generic.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index b91b1a98029c..2d9b4ba33b46 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -440,6 +440,17 @@ static void kernel_pgtable_work_func(struct work_struct *work)
 
 void pagetable_free_kernel(struct ptdesc *pt)
 {
+	/*
+	 * While the system is still booting only the boot CPU runs and no
+	 * IOMMU has been set up, so nothing can be caching this table and
+	 * there is nothing to flush.  The workqueue this defers to may not
+	 * exist yet either.
+	 */
+	if (system_state == SYSTEM_BOOTING) {
+		__pagetable_free(pt);
+		return;
+	}
+
 	spin_lock(&kernel_pgtable_work.lock);
 	list_add(&pt->pt_list, &kernel_pgtable_work.list);
 	spin_unlock(&kernel_pgtable_work.lock);
-- 
2.55.0

