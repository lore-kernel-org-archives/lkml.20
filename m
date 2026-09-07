Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B605233939
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772449; cv=none; b=abj+PR7jyFb/NdlKMaUcR+x59cj9EbIE9bIs4OSTzMsZgzvWpZvtQ2XdwpWvwMUErkyQ54FbwGX2ueUffEpZv716eQNTI4R80Sc5d3uNxacUrtbu3ZFum4Xo9NJTL52Pgz9638HRs1STnzuWWiCPNdF/cdbuZYLoqVe30IgFT7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772449; c=relaxed/simple;
	bh=bm6HelTpYam3AbyGIrMt/r7eiokV0oTpgUPWeL/pRGs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=bqjjWX+Sh/z2iG70ZGp97wfN8ZQfFiZFhefPjCV/JfPe2bY1suOYOwqGoW9rZrwpk8/6v0Qlf/yVw2s7h5WJfuJtTkIXmxAJwCqnBFQZuTkmHL1DGhEkS1Aj4nU/suUl+Ou1cPOv05Zg3KufAHwKc6qDc0NVQeRxsbNvweoiOhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hdhF271K4zYQwwk
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:13:10 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 7CB5440574
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:14:00 +0800 (CST)
Received: from huaweicloud.com (unknown [10.166.163.161])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgCnZbNWgJ5qMElGBA--.7816S2;
	Mon, 07 Sep 2026 17:14:00 +0800 (CST)
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
Subject: [PATCH v3 0/4] mm, swap: some random fixes and cleanups
Date: Mon,  7 Sep 2026 17:13:52 +0800
Message-Id: <20260907091356.53026-1-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgCnZbNWgJ5qMElGBA--.7816S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr4Dtry7Zr4rtrWDXryUtrb_yoW3KFc_GF
	W0yas5JrWjqFy7GFWUKrn5JryrGFWqkF10gF1Sqr4ftr1xXw4fXF9rGay5Zr1fWw48J3Z5
	Ar4DXr1rAwnrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
	6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

Hello all,

This series contains some random fixes and cleanups. More details
can be found in respective patches.

Thanks!

v1->v2:
- Collect RVB from Youngjun nad Youngjun
- Some minor improvements
v2->v3:
- Address memleak problem in patch 1
- Add description of current memory order guarantee in patch 1
- Collect Ack-by from Kairui


Kemeng Shi (4):
  mm, swap: Fix potential NULL dereference when trying a sleep table
    allocation
  mm, swap: Move setup_swap_clusters_info() after SWP_SOLIDSTATE
    initialization
  mm, swap: return early from swap_extend_table_try_free() on first
    non-zero entry
  mm, swap: Remove unneeded swap_extend_table_try_free() in
    swap_dup_entries_cluster()

 mm/swapfile.c | 53 ++++++++++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

-- 
2.36.1

