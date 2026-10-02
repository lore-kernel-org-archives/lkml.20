Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AE03019C8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790904338; cv=none; b=PYRQAxqEFFQ89Vdfj2St4CxOrv7feMqcINiTZw5kiS5TrkuxoP0aVKuis8W/CRisOMS155I1dmutVXn8I+yv/l4+jY3jn8/BFjV8jAzPc/5s9w2F+8xNyjJfiv9CCOtvVoVTs2uZySi/ZYWe7zh3R06XQzvyDRH8nba8mPU040M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790904338; c=relaxed/simple;
	bh=8yM44zOsZj6iwtexTmEmIV+1WksYBvgy3vpPrXfhKx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m1nTrNHkhUj3Snxt3x1AcCY4kTirtN1g8xnzJ+uVaVIsxX0H1IkYWZDIvZEQNQ2bdrxipHeIzkEOPYPQiS7XZpwFZSQsptvesqCj9blvSpiHI7etoW9A/El8ouSXjB9ldFYQFc4Y6RRrdkSrbI/sUNx9sSY3xXLNZX0+sIQpeCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jALX3nxl; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jALX3nxl"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34cde269e1bso1779690eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790904336; x=1791509136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/wpQqWeiDW/7/8YluMY2ot+oHgvGw2IfDVHY3jOKXA=;
        b=jALX3nxlO5LLeG/hZCGV10uh67fcLCR/TgCdLoX1aURMXFtjW0AcJGv/KskkyG0W0Z
         nC8nL/o92WAUZY396rherrXy8sSA/RrKRCas9b5okenRHGGddul/zJYYFNe2ryufrajf
         TNhSyT14+8GB4beW8+H8TBcYaIx486/yRCijm2E9BKnr6V91kh4G0WHP7GFvk5fCRPmf
         eoKiiEAXSU+T2OymCM3mE6kKqTyXzT1pMV1QvLtSWVe4OlGGxxqMOO7WQvyKolqXx0pd
         zc748ebooz1bD1v9PEEEdAqbbuwJ7vkKfyTds01yRyMCjBicj5b/9kEEhDDZWSLIFys1
         xrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790904336; x=1791509136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7/wpQqWeiDW/7/8YluMY2ot+oHgvGw2IfDVHY3jOKXA=;
        b=pukSz5kxxYzGTkd5GYZNkd++BpJ1u6t38dXalhTjh9BqQuncrttPQKGLl121CjvOfT
         6cUEZOitDn3S539F0cn8WZrZHc4BxJwPXUmTKiKoacLAjDyKshRjMs0PEFmkXwB85IQN
         n6obHv9anq4dPBIpNQCY583IJgaY1fTo3xw7QHxjEYYRexlUQP4mfoRPBFdJ94hOc4AR
         Uky5/SgDidyU3an1jwTvwAy512qYQlKBP8DFQkYfrlGmCzer1hsHseD1tOxM70LiTfrF
         3VBtAejlZJ6AVZt1qEBoLumkzxb5aR5rEkDY/tHGQ/lJutZxDel3drPtmDb60swAV15r
         wvCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQIcVFYaX6LZUDez6yiUDWMApyoykHaeOKPXNupVbeG3fM3WpIt9SP3AJ7hhQiuUuHUV4x331U7pEVXVk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPdDcXsPZqSB7ng9JSXbt+1f93Q+G7j0s7IcRbyw7C3WhDkgWo
	N6b4ixnCQFi+k5igoBsX1Iuy/nDibrd923cVhBihS+rKw+1/ZG1gP96E
X-Gm-Gg: AYBFou1maXgUrwCjiGMTDrsBugOrS/Gc4/atv0qVjllTxJ0xknvGcp2YWOVO0sC+HJ7
	PT1z4fFpRsdNIDK5hZxo3uYmyB/zK+umorTSo7FtePsZNArPMcqh+hx9q67NX8i29QJ+GPNRyRI
	Zp9T8d3PdMBpbhIsC6+0YYw+9NQvXkl9kyP767m75utIh47YLpWP69fa9yfJXlBBoOD/a7GYq48
	jOdaVSfH9BUb1YdGao0AQnkeY6TSxiDYeNidiRlvBlA41rpLoF2I/l8MTzTGYG5FJXzpm+bLmL6
	c1CshSmS5B074e2aatVYfEQWDLR0fKwblpe3EW6pjwfGh0q7/Ot9mjH94EOmqxPpeFJ0PhXk9SP
	GUm27koRK/GLDdEE3amCF7A7ZvKp+9CRTIfvvszdv5sUQTeaFnO7Ayv9J8LBIowPYpKdGacuv0h
	ppMaqFBXEZodOFfXWdxTKoyzWeDV16aVJ/TXWVevu7izFSaxM3e+x5zhr4z4UX4+9Tg5793AZJu
	wB8qQ==
X-Received: by 2002:a05:7301:f87:b0:34a:c4e6:27c with SMTP id 5a478bee46e88-34f150bf365mr1102272eec.18.1790904336197;
        Thu, 01 Oct 2026 18:25:36 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f984e4sm1837223eec.17.2026.10.01.18.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 18:25:35 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 02 Oct 2026 09:25:27 +0800
Subject: [PATCH v2 2/2] mm/migrate: raise the do_pages_stat() chunk to 512
 pages
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-bug-mm-move-pages-stat-batch-v2-2-f73b5d20519f@gmail.com>
References: <20261002-bug-mm-move-pages-stat-batch-v2-0-f73b5d20519f@gmail.com>
In-Reply-To: <20261002-bug-mm-move-pages-stat-batch-v2-0-f73b5d20519f@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

do_pages_stat() copies the addresses in and the status out in chunks of
16 on the stack, and do_pages_stat_array() walks each chunk on its own.
With runs of consecutive pages walked in one go, the walk setup paid
every 16 pages now dominates the cost.

Raise the chunk to 512 pages, the number of pages a PTE table maps with
4K pages on x86-64, and allocate the two arrays rather than keeping
6 KiB on the stack. A failed allocation returns -ENOMEM, which
move_pages() already documents.

On 7.3-rc5 in a 16-vCPU VM, querying every page of a populated 4 GiB
buffer, per page and by chunk size:

                16        64        256       512       1024
  4K pages      31.9 ns   15.0 ns   11.8 ns   11.2 ns   10.9 ns
  THP           23.1 ns   6.6 ns    2.5 ns    1.8 ns    1.6 ns

Suggested-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 mm/migrate.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index f4d8bfb9b7b4a..9c77b5e5cf1d5 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2656,10 +2656,20 @@ static int do_pages_stat(struct mm_struct *mm, unsigned long nr_pages,
 			 const void __user * __user *pages,
 			 int __user *status)
 {
-#define DO_PAGES_STAT_CHUNK_NR 16UL
-	const void __user *chunk_pages[DO_PAGES_STAT_CHUNK_NR];
-	int chunk_status[DO_PAGES_STAT_CHUNK_NR];
+#define DO_PAGES_STAT_CHUNK_NR 512UL
+	const void __user **chunk_pages;
 	unsigned long chunk_offset = 0;
+	int *chunk_status;
+
+	chunk_pages = kmalloc_array(DO_PAGES_STAT_CHUNK_NR,
+				    sizeof(*chunk_pages), GFP_KERNEL);
+	chunk_status = kmalloc_array(DO_PAGES_STAT_CHUNK_NR,
+				     sizeof(*chunk_status), GFP_KERNEL);
+	if (!chunk_pages || !chunk_status) {
+		kfree(chunk_pages);
+		kfree(chunk_status);
+		return -ENOMEM;
+	}
 
 	while (nr_pages) {
 		unsigned long chunk_nr = min(nr_pages, DO_PAGES_STAT_CHUNK_NR);
@@ -2683,6 +2693,8 @@ static int do_pages_stat(struct mm_struct *mm, unsigned long nr_pages,
 		chunk_offset += chunk_nr;
 		nr_pages -= chunk_nr;
 	}
+	kfree(chunk_pages);
+	kfree(chunk_status);
 	return nr_pages ? -EFAULT : 0;
 }
 

-- 
2.43.0

