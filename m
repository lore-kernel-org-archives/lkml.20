Received: from mail-wm2-f8.google.com (mail-wm2-f8.google.com [74.125.225.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9920221FB6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616938; cv=none; b=Q9iYxagsnxcE17w3t/klmdkg1RtydCbxBz5D1mFZAcXMhcfviEO/zUtJJgKI6sBNVd5gZru5yZeL3LhytdfqJyMAxKyr04ubOnmp1fUFwHS6/N5z8uXc/lsqUwdsmkBRW9Vp8z+F/jT5W7jvWicFDeCc+6OAXGyKVmoU8n1SvtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616938; c=relaxed/simple;
	bh=fVURs952Qxa+Ey6m7QLrY+2zX9hiMyr1lqWQc/XAV7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sHDQwziYk8gN00UEFbSmikrrsok65bWRrUQPJlNrpWLQONq0bFSzgkxNdjyONHb6QBAoGT6mkVPcMtBHOhn+dGgVna61JGrwLZW1Z7pKZJrduucVo/155l2bIhVOid97/I4DRrGjegogeI3ZMxI5o5Si9qStBln5MMVcZt6BYpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jETfmPkI; arc=none smtp.client-ip=74.125.225.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jETfmPkI"
Received: by mail-wm2-f8.google.com with SMTP id 5b1f17b1804b1-4956bc73c0eso7428485e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616924; x=1789221724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYwBU5ZHVueM1YfQFwjzrz4zbhTksf0+irRokmEvL88=;
        b=jETfmPkIzfjOrQHlfkZkTC4icmnUvlICnczkIUqcSSatvMQlQIEu/BQ/Gvh9lqr9ta
         zCFnggOTdQ+DGgnl9XvOl+ihTwkYD2tQCoHaNdP10KuU1HD63AhfIpvNHgCifUCb+ENA
         9WD0YJEdPHPUZys7QCR0AYnxB6Ya5bwW05gsM5pBqsxg50vZLTJKGuZejFkeBWS8zM2b
         8Eqk923Kq83+KOEQmXU7yax6UuctSNrTGsMoep0hLCTKRK7hQGDsVSG1O3G9VLOxs8oL
         qukFkmhN9T+1OfqxbuttLyhGcNJZCJYLmDXx6xxupIO6cZpXSA/oWPh3pUZjJZOFXJ80
         Cy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616924; x=1789221724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XYwBU5ZHVueM1YfQFwjzrz4zbhTksf0+irRokmEvL88=;
        b=kmRmwYWAatIPsFDEKTsPL918lyuHHgEPXjT6qu2vnQzkBx6EEilv4FOSVQDToXapDf
         RqNGti3SCDCQq43fUrRqqK8RGLWRqTCXAUtUFqDP8kENuIkpe6oqQ56ZcaQNahr6VmJ3
         lFVkIcOFswg4oR+smkHYqBJyIDQrrRKExGT4KM+h1oPgC1TiCzWKHBRDwMxlOnwOZ6Fg
         enq+Qvmu/gOM5Z4PqsndZ8mscZlKi/apVXGrQzozQzenLha4Z0c/e4rSj6vWEHKvAi4T
         lUI8/9PBHqvw7NPcUBNIGBjaMkFmE5sVzx2Ot1w9h2yFcv023RuWaCTRs6xbKSpix45A
         bejQ==
X-Forwarded-Encrypted: i=1; AKwUvBww/4yHDUP+B+e4+x827B+ALBkNuz0ixnJYWgpF5OOxtOk5XqlAlVY9YWN3v1JbhAmfy0KTsVZ1Ij5i/3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mberKGj/hyCjsVtZhYW5rYdiwW/wfB434AAiTdwrWcZ0P+ddbt
	UCSXnLIAZ7DO0pMICP3pUffmOcS/B754XCtc1OV7N3j9c0b9oX3ghb7G
X-Gm-Gg: AYBFou1cUuHMVrhu81fhnMf6NCnNzhuSD3bsOuVsPa0hdP4nZX1T+m/Nf3biTN67Hq1
	hMy5scjGRvxlRgcuGPvieRC4Nc55IjtEnlUUYbj4+vsWW7A0Fr9MGCClbjO1LMP/TxYaA0GLy4L
	WfdXoIFNlD7hr0UyuYI2LyZFClMZMWfS3gc4kWwZKI3lYPVTR4rwOQ36w6QIHmkl0/BjpUgnsw7
	KZ0L9ZiH85bYVDPQDuovz7OMi88hnxw01DWx8OcwQ/fwNesBpB3T92Gqfeg4EnSEQUzHBEV+7wJ
	r+kIv24h/nLXlcxz0J5MiH+Fr/kfPo2KoURoYyu8Vvx1U/uYDbcms+pLl892X8REknkO1ljz9Fc
	7ryU1YtCrR+IkcZ8xpm/wR743tXkZrbWvfN/QiJ18Gz8BT3hBvbkTKPLmNDDY7OEvyW8dAiuZTY
	zUEQxRVmhwC9AeATpprgg0FSfMOBlaLaRsC/dEn5utlLYJZfNtiW7WljuFx1mycHP3UmEp+0L8v
	3PHRKuqRjwbUlPdHgHg/6dEFqZ3t3OpBgNPIv+TQg==
X-Received: by 2002:a05:600c:81c5:b0:49d:433:c3b6 with SMTP id 5b1f17b1804b1-49d0443096amr36943665e9.27.1788616923081;
        Sat, 05 Sep 2026 07:02:03 -0700 (PDT)
Received: from outlook.com ([2a02:587:6022:4b00:84ac:4417:9f37:a496])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm149866765e9.0.2026.09.05.07.02.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 07:02:02 -0700 (PDT)
From: Christos Skarlos <christosskarlos.kernel@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	ljs@kernel.org,
	hannes@cmpxchg.org
Cc: ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	mhocko@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Christos Skarlos <christosskarlos.kernel@gmail.com>
Subject: [PATCH] mm/huge_memory: fix various coding style warnings
Date: Sat,  5 Sep 2026 17:01:37 +0300
Message-ID: <20260905140140.60792-2-christosskarlos.kernel@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905140140.60792-1-christosskarlos.kernel@gmail.com>
References: <20260905140140.60792-1-christosskarlos.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve coding style issues flagged by checkpatch.pl Specifically:
- Add missing blank lines after variable declarations.
- Remove unnecessary braces {} for a single statement block.

No functional changes are introduced.

Signed-off-by: Christos Skarlos <christosskarlos.kernel@gmail.com>
---
 mm/huge_memory.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index ced400f72d43..371ee8d38c45 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1104,6 +1104,7 @@ subsys_initcall(hugepage_init);
 static int __init setup_transparent_hugepage(char *str)
 {
 	int ret = 0;
+
 	if (!str)
 		goto out;
 	if (!strcmp(str, "always")) {
@@ -1510,6 +1511,7 @@ static void set_huge_zero_folio(pgtable_t pgtable, struct mm_struct *mm,
 		struct folio *zero_folio)
 {
 	pmd_t entry;
+
 	entry = folio_mk_pmd(zero_folio, vma->vm_page_prot);
 	entry = pmd_mkspecial(entry);
 	pgtable_trans_huge_deposit(mm, pmd, pgtable);
@@ -2613,6 +2615,7 @@ bool move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 
 		if (pmd_move_must_withdraw(new_ptl, old_ptl, vma)) {
 			pgtable_t pgtable;
+
 			pgtable = pgtable_trans_huge_withdraw(mm, old_pmd);
 			pgtable_trans_huge_deposit(mm, new_pmd, pgtable);
 		}
@@ -3901,9 +3904,8 @@ int folio_check_splittable(struct folio *folio, unsigned int new_order,
 	 * swapcache folio split. Only uniform split to order-0 can be used
 	 * here.
 	 */
-	if ((split_type == SPLIT_TYPE_NON_UNIFORM || new_order) && folio_test_swapcache(folio)) {
+	if ((split_type == SPLIT_TYPE_NON_UNIFORM || new_order) && folio_test_swapcache(folio))
 		return -EINVAL;
-	}
 
 	if (is_huge_zero_folio(folio))
 		return -EINVAL;
-- 
2.55.0

