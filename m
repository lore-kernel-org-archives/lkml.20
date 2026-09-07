Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A856A44C51A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772453; cv=none; b=Nrf2KVT7J095OmVobsDv1hFK+2LmsV6IC6NGnSYhuUnQ96T8Wv4uBOD0xFl8YjMqbonrzKeRTOzs3LoXsq7hHjiG+YAnZCsDos5BNq2QYwjw57HZJPPsDs4FBa1H9maa/qvbhZGVZzTBrI4wFoSTzzg5UjTzu8FwFvwSJW0ocsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772453; c=relaxed/simple;
	bh=kMlxtO0vxz7iyrenf5B99YNHUpSGDHuLzd6/P+E+sIA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AePiAUJ8434voDR039bpBrLXmWO9VSp2hF8dPFpOL7pOhpoRgytr8aoHKxy1Al6ANMf6AkfDtrtnR33+8SWZf7Dx4x2MmWJiVdPX3vdxyS7zxVA/NmovlqMx3Ku4DIgCU41okYpadmh0nDOh2rDBOkSvci14XCwnpTp972X3sic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hdhDs40pfzKHPRM
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:13:01 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 865E94056D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:14:01 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgCnZbNWgJ5qMElGBA--.7816S4;
	Mon, 07 Sep 2026 17:14:01 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Luiz Capitulino <luizcap@redhat.com>,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH v3 2/4] mm, swap: Move setup_swap_clusters_info() after SWP_SOLIDSTATE initialization
Date: Mon,  7 Sep 2026 17:13:54 +0800
Message-Id: <20260907091356.53026-3-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20260907091356.53026-1-shikemeng@huaweicloud.com>
References: <20260907091356.53026-1-shikemeng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgCnZbNWgJ5qMElGBA--.7816S4
X-Coremail-Antispam: 1UD129KBjvJXoW7urWrJFy7Zr4xur1kKw1ftFb_yoW8XFy3p3
	Z5Gas8Cw48JF1fWa18Zw1UW34rWwn5KF4UJF4avr43uwn7Jr10gryrt3Z8Ar1DGrn5AFWD
	Ww1I934xuF1Y9wUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUj5Ef7UUUUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

In setup_swap_clusters_info(), SWP_SOLIDSTATE is used to decide
global_cluster allocation. Move setup_swap_clusters_info() after
SWP_SOLIDSTATE initialization to avoid unneeded global_cluster
allocation.

Fixes: 451c6326105b2 ("mm, swap: clean up swapon process and locking")
Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
Reviewed-by: Luiz Capitulino <luizcap@redhat.com>
Acked-by: Kairui Song <kasong@tencent.com>
---
 mm/swapfile.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 45b6154f85ad..767d83d89d0b 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -3731,11 +3731,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 
 	maxpages = si->max;
 
-	/* Set up the swap cluster info */
-	error = setup_swap_clusters_info(si, swap_header, maxpages);
-	if (error)
-		goto bad_swap_unlock_inode;
-
 	if (si->bdev && bdev_stable_writes(si->bdev))
 		si->flags |= SWP_STABLE_WRITES;
 
@@ -3749,6 +3744,14 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		inced_nr_rotate_swap = true;
 	}
 
+	/*
+	 * Set up the swap cluster info after SWP_ flags handling as
+	 * setup_swap_clusters_info() checks SWP_SOLIDSTATE.
+	 */
+	error = setup_swap_clusters_info(si, swap_header, maxpages);
+	if (error)
+		goto bad_swap_unlock_inode;
+
 	if ((swap_flags & SWAP_FLAG_DISCARD) &&
 	    si->bdev && bdev_max_discard_sectors(si->bdev)) {
 		/*
-- 
2.36.1

