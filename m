Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACDC448393
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772449; cv=none; b=WKSxC6TSSa+Vh71r74rUW8Mdyhav0hVHQsfiRSEW9QWzQuK6VlEoRWR1VpNK/486iQmAPrbIOYiAFiplJ9t0esvOqtDu7XQRqJEBzd4auDWSaURciPKgEok4rA7rvBt7CdrgTXz1t4vdS3g2sy3PJnERydE4pa8mLtMs+knLNOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772449; c=relaxed/simple;
	bh=PM6zuGMhk0g9CuM/kw01q+sl3bgp4A53kP4BilzK/Ew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UCHH0LwAZNbHrcDnJ2AlM8HfTRf0CFJy//go+7cBlwdN6OfRpJ/0f7ivZRY/FaU0BXK/n033bTyT7+P+GrKybQmg5T3Y9Z6MzbK6OXSpX7Qohl1ys+aztnuP0qHLPKfiIK5foNvWKqWzQVZ1S5ybGld8aIanC7sdHCAWqkyQodI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hdhF46kvFzYQwrg
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:13:12 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 728D240576
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:14:02 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgCnZbNWgJ5qMElGBA--.7816S6;
	Mon, 07 Sep 2026 17:14:02 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kemeng Shi <shikemeng@huaweicloud.com>
Subject: [PATCH v3 4/4] mm, swap: Remove unneeded swap_extend_table_try_free() in swap_dup_entries_cluster()
Date: Mon,  7 Sep 2026 17:13:56 +0800
Message-Id: <20260907091356.53026-5-shikemeng@huaweicloud.com>
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
X-CM-TRANSID:_Ch0CgCnZbNWgJ5qMElGBA--.7816S6
X-Coremail-Antispam: 1UD129KBjvdXoWruw1rGrW7uF17KFyDAFWrZrb_yoWDZrb_ua
	95A34kJr45Ja1DG3s3t3W2qrWvgrZYgr1Ykr1rtFnaya4UXFWrWF17W3srA3s2q390v3s5
	Ca1vvF1Sy39rGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb6AFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
	IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
	F7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr
	1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r
	43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbPC7UUUUUU=
	=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

Since commit 0475fde0f68de ("mm, swap: avoid leaving unused extend table
after alloc race"), extend table is always allocated when any swap count
reach MAX - 1 and is always freed when swap count decrease to MAX - 1
or MAX - 2 with cluster lock held. So the extend table will always be
freed properly when decrease swap count in __swap_cluster_put_entry().
So swap_extend_table_try_free() outside of __swap_cluster_put_entry()
is unneeded and can be removed.

Signed-off-by: Kemeng Shi <shikemeng@huaweicloud.com>
Reviewed-by: Youngjun Park <youngjun.park@lge.com>
---
 mm/swapfile.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index b73f34ff44f8..449890074c28 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1729,7 +1729,6 @@ static int swap_dup_entries_cluster(struct swap_info_struct *si,
 failed:
 	while (ci_off-- > ci_start)
 		__swap_cluster_put_entry(ci, ci_off);
-	swap_extend_table_try_free(ci);
 	swap_cluster_unlock(ci);
 	return err;
 }
-- 
2.36.1

