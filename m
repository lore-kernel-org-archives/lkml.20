Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D4B49362E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790810274; cv=none; b=kgH7PCn0whhOEG+vqih8LlAwoqgtIpKyu47HYyCFUkVyPFlYF1MNXVZoXRSLooZVzDuNaHtoT6pZFfKbzYY1IIsrvt/HPlg8PQrhsYcQ3is3OjaHrQ9BumtY3ycP0AdW+lo3Kx1Edop37CFD+JlAtRHykMMOUbgye4dI7AgevpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790810274; c=relaxed/simple;
	bh=AxYe7f6nYh3N2l6QrGsfcXVIKFgSksN/xsT6CCS4mRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M1VM8+umf/NZjS7MylAFFQDZHLUaBxqLsEIhX7dsvZ9xFD08qTduftmoP6NOYdfYwkEKnDP3diWfoBtCojXxm1awpAEsv5epzqmF+usEW2vnuzfMyrkWOTBSQ5Iqp49d4DQvWSkBeBQAfyb2CPyWPbXksdukpVV7mnd7PbQtzQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name; spf=pass smtp.mailfrom=chrisdown.name; dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.b=dnU4zxxk; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.b="dnU4zxxk"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48affb828f1so1305191f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1790810262; x=1791415062; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qqmx+w7wWMgcq8gW6PkHYUS1zHw7Tje/ih/ffys9GY0=;
        b=dnU4zxxkJPTvTnB1YAOf7BpNu8LLB5yPTxKhu/XyYW/mYSNNyJGGzYtlFMHZx1gP7U
         XCA1Zs/QB/oY9IobZAEqtGcn+s1Azy0/9eLzceFZ3tKmzRNnBXtnHnQas52Hw29In4kK
         dTu4qXGR9+d+sTj5I/5JkiWCPVkpXBOP62MXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790810262; x=1791415062;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qqmx+w7wWMgcq8gW6PkHYUS1zHw7Tje/ih/ffys9GY0=;
        b=Rl5jIPtyYPNsS93k3dDx22mtW6N+8WRm0hXm92bLhjiIf6xvMmVQpwgftUGkeZ8DB4
         C4sN3ftipuUfSh9IiL7XAVH7VkhgJG8WbLzik45DW+qcH79gWzDaXlYRHfP1QV4LCj/O
         h3mBU+iuDPYbSuNIylsfyFvUH/veJNyWyVsn8cnThwaVPv9PpNVvG/W3W63Iv7W8CrQ/
         0/TefoHjWVaq6xjpFlbe96N86XCn7D4C7PxkFfsUmbJNFouia3bX1x3I8T0ZrGRfsGTq
         1UlXb1kA1U2NX7iWypqBZwUCTbJbB3UOrUSARx19X3Hq7xWFtwrVdJhbev+ALKoysgP0
         LQng==
X-Forwarded-Encrypted: i=1; AKwUvBzb9VUT8U6Dz3qWqgU7DrbtWGieNU+m9YPpyfMxESUUfFldhnQMPLoTB7AlJ4g0XGUpAGVXRK8Ti36yvyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaUEl8nbYDSsMEb/bKE7pRwZyNSlAYDaF88DwioJ8JFy+FgDwH
	Tqq3GpgglH8nYiMf+dNmjP6Qv/NJkA+2piVYCaq1tbQFAIcrv/GTHy3mFwUfqDi1UGo=
X-Gm-Gg: AYBFou1f/Jt8VPsUSuQBfKAfXz1Vv3nSftG3/3pLU8BzYTkeySrWk09IhVMWWrYNrmT
	I8nQS8tEgmkvXmK82F8gs5OmBbnw3672B3yhmcQy0rpdTKzbgOCIS3C2nK59IV8CpU77aejIlP2
	4r4hTBwlc8HmONdalY5P4WdrcfkK9iy1L9EX2txHhIiM9g1k25ziHd+oRKgW7p0nwdtKp6OnW7/
	5xrxqG4rBKJOIOczebEmGB/K386vaZSWq36ax8gDFlaE2eUpnFSnkCXCGkjZAOdpPljnqRq6Kdz
	sQL1Jd2DYFJ3PxVa6Aj/sO4voS+trCvLhKStQor7j+rBPYhF3fIxylJ/CktF0aUziuWF1Q7OV/p
	kmQpwh6ULd8JswjHUXSKUwJ93t8Pc8mbxnea31EP71PFjAHyBJalp2zMbRq3PgeFiA6Ny4iHm6K
	EMTwvSDwEmBbRk3O7vUbm9WT02ve8g4uC0/aHjzoFy9pqjaYBq8K2c5CYUTIOIbFO5neTqfJ+nG
	Y6DtEFU/wdw8O1Ms817F2OojhM=
X-Received: by 2002:a05:6000:4811:b0:488:8546:d0b2 with SMTP id ffacd0b85a97d-48b0253956cmr6174897f8f.51.1790810262482;
        Wed, 30 Sep 2026 16:17:42 -0700 (PDT)
Received: from localhost ([213.61.32.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0690e060sm2332276f8f.19.2026.09.30.16.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 16:17:41 -0700 (PDT)
Date: Thu, 1 Oct 2026 01:17:40 +0200
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Ying Huang <huang.ying.caritas@gmail.com>,
	Kelley Nielsen <kelleynnn@gmail.com>,
	Vineeth Pillai <vineeth@bitbyteword.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH] mm: Make swapoff interruptible when unusing mms/shmem
Message-ID: <ar2YlFYjYUZ49ZA5@chrisdown.name>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

try_to_unuse() only checks for a pending signal between mms, and
shmem_unuse() doesn't check at all. That means that once swapoff gets to
a process or a shmem file with a lot swapped out, nothing can interrupt
it until every last page of it has been read back in.

Just as one example of where this can concretely show up, freezing tasks
for suspend or hibernation has to wait for swapoff to notice the
freezer's fake signal, and gives up after freeze_timeout_msecs (20
seconds by default).

Here's a facetious example where one swaps out 2GiB of one process to a
swap file on ext4, starts swapoff, and half a second later tries to
freeze with pm_test=freezer. Writing to /sys/power/state then fails with
EBUSY and this in dmesg:

    Freezing user space processes failed after 20.003 seconds (1 tasks refusing to freeze, wq_busy=0):
    task:swapoff         state:D stack:0     pid:3175  tgid:3175  ppid:2955   task_flags:0x400100 flags:0x00000419
    Call trace:
     [...]
     io_schedule+0x44/0x70
     folio_wait_bit_common+0x1ec/0x3d0
     __folio_lock+0x24/0x40
     unuse_pte_range+0x2d0/0x348
     unuse_vma+0x158/0x248
     unuse_mm+0xfc/0x150
     try_to_unuse+0x104/0x3f8
     __do_sys_swapoff+0x220/0x5d8
     [...]

The same goes for anything else that wants swapoff to stop, like an
admin hitting ^C in a panic, of course.

Prior to commit b56a2d8af914 ("mm: rid swapoff of quadratic complexity")
try_to_unuse() was driven by find_next_to_unuse() which checks for a
signal before every entry, so let's restore that behaviour.

Just as an example of the improvements, here's how long freezing takes
in the same test while swapoff is happening on my computer:

                      before                  after
    400MiB anon       8.925s                  0.028s
    400MiB shmem      1.639s                  0.003s
    2GiB anon         failed after 20.003s    0.011s

Fixes: b56a2d8af914 ("mm: rid swapoff of quadratic complexity")
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 mm/shmem.c    | 4 ++++
 mm/swapfile.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/mm/shmem.c b/mm/shmem.c
index ae08cff4500c..72c8a61db76f 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1742,6 +1742,10 @@ static int shmem_unuse_inode(struct inode *inode, unsigned int type)
 		if (ret < 0)
 			break;
 
+		if (signal_pending(current)) {
+			ret = -EINTR;
+			break;
+		}
 		start = indices[folio_batch_count(&fbatch) - 1];
 	} while (true);
 
diff --git a/mm/swapfile.c b/mm/swapfile.c
index 254ce86fa923..c3288910b3e3 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -2689,6 +2689,8 @@ static inline int unuse_pmd_range(struct vm_area_struct *vma, pud_t *pud,
 	pmd = pmd_offset(pud, addr);
 	do {
 		cond_resched();
+		if (signal_pending(current))
+			return -EINTR;
 		next = pmd_addr_end(addr, end);
 		ret = unuse_pte_range(vma, pmd, addr, next, type);
 		if (ret)

base-commit: 2ddb90ee544ae97215afc4698dc223293997cc43
-- 
2.50.1

