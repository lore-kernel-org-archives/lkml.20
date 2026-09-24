Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77C7449B3B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790241797; cv=none; b=gTEOJiA3f8OYI4Jd/hj/AfpMgphnqcp+ENn8o9Psycgvjmk8NVFonyEv9ZMf6WepA5pBwsOYitnKbE9c+Y1FPvjCzcyyeEFajwMbt9IP/2Znagz7d7W7OSH2GMLHuVQxhyssD4jtpADJhlr9EriyjvVb75JUpQv1avK6hg/YgrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790241797; c=relaxed/simple;
	bh=JPetP2Z7gxwCfIfjyw7nBBtyy1O/JrS80AC6dx7KIYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pjnjq2I65Io26//ZVwgdcwK78/wtWxZNI4VAiWk+4RhXHYQo7TC5hzOVB1XPzcKPjb5SJCGO3qXH5s5f7sp0qv0OeSGJiCEwBntCC7lxMsbtx7lyslQRAThR9/pOTMWycNI4Rqc8DFL7kq5J6ZrRocCGJhOUezvyIGAVjKPS18w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iH8aoV5T; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iH8aoV5T"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so1428514f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790241791; x=1790846591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7QZ8HgImhCopDFDWHquBQ0HUnxqZBWvfTbRoX5PG3mc=;
        b=iH8aoV5TUGHTRhODPDTzcxMz+y1m5XLEhP1tBk/TGDEcrq6tigvtdapzq8On9Yo4Tm
         afpR1w7Vqps2HcM5y3en1fNOM4ACOd7rbnrja3firQkLPm1zGGoc493ONcps8pg6XkL0
         6RGIsL/MC7unsz8yCvPYG9OUR9ykXgIw864EQrkp59m8YUcxsKhI2oEEujoUpEHLGgRy
         I76g/eWdAbPcfkK6LV4zMRDG0OSs+MgHZeNmevc94MxN5KApNfPScnQa3J1JzslYUJAv
         INVmsvhr+z37bsqjgqRg8J3Xuq/fAYJ33zH8GgNJYKDwTQd8ZbyNFGwVAAvL/0uAibPR
         0uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790241791; x=1790846591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QZ8HgImhCopDFDWHquBQ0HUnxqZBWvfTbRoX5PG3mc=;
        b=Gl4TvXQU7VSX5nRwcrGJtLJMV2CgXAQ4D94ZvXr5ohhPyriTlfMsCGQc6Yv6XNfuvu
         K/k8oYqe+Ex8Y+0aMCURcN6ZzXI38Gep9UVQtJ7lOg3Td0EvKUavHK4xPi/FaS3nG4je
         OZfrg3TKBgTm4hXoZ74N2Nxlvd0TxB+1SdZx35xAmYnczlUoPnp3NUM5rF61rdw+BvfY
         MA5vTIs4EKhHpEg7TIHdI5dJx9e5n0ivmrLjtFiu6EY109Aq2cu3p5SZtbWG1TdE0+sD
         CPqB51enoUl8kQEQwzGWTf+XI5LcaMz+uW/sL5ckKyOTzr9QWFukL/3edqzlIBf85XUb
         acHw==
X-Forwarded-Encrypted: i=1; AKwUvBysflubyWLSrTzbIhnh75AJT3lLHLON2C0sFqfoNspVHnmAkQq2ZrxNuNN8hFn4Ws0Uio/QwgUHGnMnCsI=@vger.kernel.org
X-Gm-Message-State: AFuF++kkjKYwc1BkL9IvR4CpsIYn4HOoR1YB8E56t6CnBeZ/sFMQ3eJ2
	I8qx+x8Ueo1YSqzXkwhFKNQaoxAZGOigDHm5ckkisWMJelHndu9YIA3b
X-Gm-Gg: AYBFou2YOGyN+62O8+858/ORbDSIlwRCi7hEHIeeL00OQz/ZyZ6TKGVdjMEKEfTMQ+4
	sd7mfHdNic1JfepyokNbX2vnvyH1lqC3g6fL0IsD+ntHaQr6P28ZFltHg4r4UI2A8sDrmdawURS
	hr2Z1R9hr36MKIbEclYHhSCRVQ5ZHSM51zhwrsfUv5VgkGoc3QjssA79N7268HNcsKMGehwJUnJ
	8QxX/aI5YeE9I44QPuBtn0iueWPYgaCKmDa0hftjCi+c3n5AJGk6SyJ1i+TjofhDeNC2DrWYC53
	WUs8+CaWNxAZW+duhTEA8k1Yl/EclELwzvKHj7gqRlhXG8dKaLqzz6Q/HShnRrHxgTuQQa5DIpZ
	Fed3RDscymZZsJJkKgWsoK0m3UPP6DmER1MATgza97Keqp9JtewJQdgiNh53AfPYgyp66mNFRmv
	U/Tq/1IFGonA5oDOHjwVSVkOdeH5XLnxIBcLbmohyur6TGu+e8RXbJvyk90S1fQFJ8lC5UcS33j
	HtL4dJuWz/LS9ZT+iHr/Db3iUv894jlNpQ7yLFlzCYKAmkj7kQivfyIn85zKgjfUWe3P7tp
X-Received: by 2002:a05:6000:2c07:b0:486:fa7b:d3aa with SMTP id ffacd0b85a97d-4887172d776mr3144237f8f.23.1790241791054;
        Thu, 24 Sep 2026 02:23:11 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488684862a3sm12164848f8f.7.2026.09.24.02.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:23:10 -0700 (PDT)
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
Subject: [PATCH v2] mm: don't schedule deferred kernel page table freeing while booting
Date: Thu, 24 Sep 2026 14:23:07 +0500
Message-ID: <20260924092307.22813-1-mikhail.v.gavrilov@gmail.com>
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
the system is still booting.  The next kernel page table freed after
boot schedules it, and the work then frees the early table too, after
the same IOMMU flush as any other.  If no kernel page table is freed
after boot, the ones freed during boot stay on the list.

Fixes: 9e4a3ec3411b ("x86/mm/pat: Allocate split page tables as kernel page tables")
Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Link: https://lore.kernel.org/20260924064321.23787-1-mikhail.v.gavrilov@gmail.com
---
v2:
 - Keep the table on the list and only skip scheduling the work while
   booting, instead of freeing it directly (David Hildenbrand)
 - Say that 9e4a3ec3411b is correct in itself and only exposes the
   problem (Lorenzo Stoakes)
v1: https://lore.kernel.org/20260924064321.23787-1-mikhail.v.gavrilov@gmail.com

Tested on a Ryzen 9 7950X with a Radeon RX 7900 XTX, lockdep and KASAN
enabled, on 7.3-rc4 (fe2ec83746e5) with the same unrelated local
changes as noted for v1, booting with

  ftrace=function ftrace_filter=pud_free_pmd_page,pagetable_free_kernel,kernel_pgtable_work_func

The boot that panicked without the fix completes.  The table freed
while the tracer installs itself does not show up in the trace, since
the tracer is not live yet at that point, but the first kernel page
table freed after boot does: systemd-modules-load freeing one from
__cpa_collapse_large_pages() schedules the work, and
kernel_pgtable_work_func() runs 0.8 ms later and drains the list.  From
then on every pagetable_free_kernel() in the trace (660 entries, none
lost) is followed by a work run within a few milliseconds.  So on this
box the early tables wait until the first module is loaded, and no
separate drain is needed.

 mm/pgtable-generic.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index b91b1a98029c..f7f504f57914 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -444,6 +444,12 @@ void pagetable_free_kernel(struct ptdesc *pt)
 	list_add(&pt->pt_list, &kernel_pgtable_work.list);
 	spin_unlock(&kernel_pgtable_work.lock);
 
-	schedule_work(&kernel_pgtable_work.work);
+	/*
+	 * The workqueue may not exist yet while the system is booting.
+	 * The next kernel page table freed after boot schedules the work,
+	 * which then frees this one as well.
+	 */
+	if (system_state != SYSTEM_BOOTING)
+		schedule_work(&kernel_pgtable_work.work);
 }
 #endif
-- 
2.55.0

