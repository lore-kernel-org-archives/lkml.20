Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793074939;
	b=wfb0QMtVNNkNWwoDcsCyWw8D2AUfNV2NCjXuhEZPYHT2200MIHCELWiJwGH69LJOVWst
	 DlXhVnBj74Kt7NAh8l01baL9EDAd+9TI1UR3Xc4XSCzFUA4kZehu/QtMAdxfWt0too97C
	 42EVeF8PigNrCE2/oF+k5ONmvsRpn0vxlwaJSo2ZQZWA5vOCPCPYgNuD5yo3Oa6vAiH4w
	 xakWwOItOG1yKORtIbiVSCBfxunJltRzpEnZTCfWSyFSVrg2Hp31hmLBbMjHuwlO37+rq
	 fLPba261zb6IGeKSpx4kavDlrfUNxXeT525G9DUMN5zWGPlWAQkyKg08DJ7Xamy0GbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YK5LaBMFpVaVrqLIEsL57jG1VfZYq1+Fawu+FzQQ2vo=;
	b=OP+jv5P3jkesA1TgF42iKrDllTBLHpaWpOunbRIqCL6aAeQTjdNxhRjbKY34RZ9mPqU+
	 zjnFIj5BurvW7UpKOTZgys5URLNFkwQ5QccKub0oA5ltryqpSX2oMbUj0gt0zGoAOytFR
	 3vM7OdxbgDHdarL/uqSj8YdBPynp8Jrdb31eCTNtnJ6ZQX5B3BNY3n3KvK3I3AoEFNHJq
	 viK0lfB5zX5CYqp1zWdvQfoSkUHzuhpZfr3tmMn0mXPPXFbx56ftyoLGM5DYStu3stVc7
	 WFzG/HJfwwdSFWiIHSrhaV4NNIBpUPMSXUryT8NBLdLSLbILMTVMWn6J1jSFiHlNUhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=GPE8+0kF;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A26606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65A26606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=GPE8+0kF
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f259cdc86so338471285a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793074938; x=1793679738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YK5LaBMFpVaVrqLIEsL57jG1VfZYq1+Fawu+FzQQ2vo=;
        b=GPE8+0kFu72jV0ihXCtD42paUML7FqexI5dNiWXTbUjvgLoA8C2CfR6UyzdskAt9Ev
         2MV0zRW5gCY3jajbt739cG24dtp1Dz9n4MlCDA1kMT1u6p0C+PgGoUV9jiK4eg2HTw6T
         3YhOj8hvZ8xH5SP8AWZVR7Y0SRPmE5sczojI3/N/ou2x/IMa3+Hq8YSSUq2hFJzKPJkp
         VFzX7W9Ux1E7/pl+z3pitE7jUTX+z1IA92Hv1bN/rtftaqq7PknPMs9whxmef3ZoO9at
         UHcVab/32SbQkG6ZjbgjXVZQznveGCDRjaO0k+7WH9CX0MU5yFA3UQi/rjLfSpSO20JC
         nslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793074938; x=1793679738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YK5LaBMFpVaVrqLIEsL57jG1VfZYq1+Fawu+FzQQ2vo=;
        b=o3r9A/JvksIrbZLSfv79B3VJx8Yig93yMqefGpTLdtRBJEekO+xbtf4Sw1VgC0krue
         3+xliEGYOlJkjxAKe3neaKojx8jN1OlpqnqdQUpf5/y14oWrTiHBNJUWH2fcOZm+FbsA
         k3goYvdnJs46BhrjYdRFnz6gJPb8IIBuGvMmM7RYFnqx5PcvEgfH/CKjeFDwZ/eDgBDu
         zYCRe9zOHU/sWVXrFUlvbVgEvHqLScebG7f+zqVWAj6IbLZ7mXJYD1EbDvceGPS6mNwH
         eHxR40U/i1q6x42r9ZPgbhbNYAIg8aWqR2jDDjqbku7vBwyJldF9nhtKQOXBq+/oduRA
         QtvQ==
X-Gm-Message-State: AFq9FYKk7XwI/sxDTvnLAS8N2TjSUag0csqjMN/DkIpNffW4Y47LRFmg
	A1eAh5jj9C2+/gguPmTDNnrEFBJ5aT4MIJfA2nKINyScAqCnJjGD1moDy/VqONvnbpA=
X-Gm-Gg: AYBFou3MmSHc3x0cngWY1f2qXxKEBEqQKp/u9byvG78baEKtmuwHpSnGgPl7i9QEox6
	NgTWAqsj58StgdQSg1LNhJ78h5PHlY3WezOGI3a8i39HIFDe0OKgEx+uTtHKbtXwDMTv6prNPyq
	Ep8uZChRTbBKcfBrC/MDTrbEaNgyDSFfv8jTQYj9HXppjH8jU/v7SYFUcUxT18pytZq/9U5QCp3
	mLnVXo3NvrkqxWKoBpCc9L6KvNEvwfxS/66mBbKkklHwAzoEyo2sgQr3x9ZqqWi9biDTPlnFPq+
	Kt/IX8nXlgwTdFHsxnvxU0+E8031B4fiFHvuLlA+/sA4pOspjCYcPfRe/6oOi7+icSSydGppjNU
	QMyK+mqEW8vWnhSfl3V12eIIJIQ2ux1HeAyc2xBMwiZ3JavZU/9ShrJik0vAEIut2YOuxb8IqyU
	8inWLsiNP3y/Bz+ailbbWumJSGuRN0GjN2YicQEi/sk9Q78NyzEncVON+cAmrdyf6P7yDB+2mW/
	L9sd6phhIg6AC/ImZ1BJgurBsLBooxv7r0cWYxDO2b/Prmi7m5/Bj7FioWurDg0+X+gRUKL2nas
	yRo2KBinVlkRnVkUlo6uN19TrZIcF+S0hlI23PwL3w==
X-Received: by 2002:a05:620a:4549:b0:93e:f4f4:346 with SMTP id af79cd13be357-940ef8ef6e5mr1336003385a.39.1793074938389;
        Mon, 26 Oct 2026 21:22:18 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47bd01cdsm91139676d6.7.2026.10.26.21.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:22:17 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	linmiaohe@huawei.com,
	nao.horiguchi@gmail.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	osalvador@suse.de,
	muchun.song@linux.dev,
	iamjoonsoo.kim@lge.com,
	anshuman.khandual@arm.com,
	stable@vger.kernel.org
Subject: [PATCH 2/6] mm/page_owner: hold off memory offline while a page is read
Date: Tue, 27 Oct 2026 00:22:00 -0400
Message-ID: <20261027042204.3741307-3-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027042204.3741307-1-gourry@gourry.net>
References: <20261027042204.3741307-1-gourry@gourry.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reading /sys/kernel/debug/page_owner while memory is removed can oops.
read_page_owner() checks a pfn with pfn_valid(), and print_page_owner()
can sleep in kmalloc() before it reads the struct page:

  CPU 1 (read page_owner)             CPU 2 (remove the memory block)
  pfn_valid(pfn)
  page = pfn_to_page(pfn)
  page_ext_get()
  page_ext_put()
  print_page_owner()
    kmalloc()
                                      offline_pages()
                                        remove_pfn_range_from_zone()
                                      arch_remove_memory()
                                        frees the vmemmap
    get_pageblock_migratetype(page)

  BUG: unable to handle page fault for address: ffd4000006000000
  #PF: supervisor read access in kernel mode
  #PF: error_code(0x0000) - not-present page
  Oops: Oops: 0000 [#1] SMP KASAN
  RIP: 0010:__get_pfnblock_flags_mask+0x3e/0x2b0
  Call Trace:
   <TASK>
   get_pfnblock_migratetype+0xf/0x20
   read_page_owner+0x629/0xf00
   full_proxy_read+0x102/0x190
   vfs_read+0x153/0xcd0
   ksys_read+0xe4/0x1b0
   do_syscall_64+0xbd/0x630
   entry_SYSCALL_64_after_hwframe+0x4b/0x53

Offline alone faults the same way on DEBUG_VM kernels.  The page_ext is
safe; offline_page_ext() frees it after an RCU grace period.

Check the pfn with pfn_to_online_page() inside a pfn_walk read section,
which offline waits for, and move kmalloc() and copy_to_user() out of
it, since offline waits with the hotplug locks held.  A full read of
page_owner in a 5G guest takes 1.36 s before and 1.34 s after.

With a kprobe sleeping the reader on a DIMM pfn across an offline or a
removal, base faults in 3 of 3 runs of each and this patch in none.

Fixes: 48c96a368579 ("mm/page_owner: keep track of page owners")
Cc: stable@vger.kernel.org
Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_owner.c | 45 ++++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/mm/page_owner.c b/mm/page_owner.c
index cfc31c92d7657..d2c0b831fcd3b 100644
--- a/mm/page_owner.c
+++ b/mm/page_owner.c
@@ -13,6 +13,7 @@
 #include <linux/memcontrol.h>
 #include <linux/sched/clock.h>
 
+#include "internal.h"
 #include "page_alloc.h"
 
 /*
@@ -600,20 +601,14 @@ static inline int print_page_owner_memcg(char *kbuf, size_t count, int ret,
 #endif
 
 static ssize_t
-print_page_owner(char __user *buf, size_t count, unsigned long pfn,
+print_page_owner(char *kbuf, size_t count, unsigned long pfn,
 		struct page *page, struct page_owner *page_owner,
 		depot_stack_handle_t handle,
 		struct page_owner_filter_state *state)
 {
 	int ret, pageblock_mt, page_mt;
-	char *kbuf;
 	enum page_owner_print_mode print_mode;
 
-	count = min_t(size_t, count, PAGE_SIZE);
-	kbuf = kmalloc(count, GFP_KERNEL);
-	if (!kbuf)
-		return -ENOMEM;
-
 	print_mode = state->print_mode;
 
 	ret = scnprintf(kbuf, count,
@@ -637,14 +632,14 @@ print_page_owner(char __user *buf, size_t count, unsigned long pfn,
 	if (print_mode != PAGE_OWNER_PRINT_HANDLE) {
 		ret += stack_depot_snprint(handle, kbuf + ret, count - ret, 0);
 		if (ret >= count)
-			goto err;
+			return -ENOMEM;
 	}
 
 	if (print_mode != PAGE_OWNER_PRINT_STACK) {
 		ret += scnprintf(kbuf + ret, count - ret, "handle: %u\n",
 				 handle);
 		if (ret >= count)
-			goto err;
+			return -ENOMEM;
 	}
 
 	if (page_owner->last_migrate_reason != MR_NEVER) {
@@ -657,17 +652,9 @@ print_page_owner(char __user *buf, size_t count, unsigned long pfn,
 
 	ret += snprintf(kbuf + ret, count - ret, "\n");
 	if (ret >= count)
-		goto err;
-
-	if (copy_to_user(buf, kbuf, ret))
-		ret = -EFAULT;
+		return -ENOMEM;
 
-	kfree(kbuf);
 	return ret;
-
-err:
-	kfree(kbuf);
-	return -ENOMEM;
 }
 
 void __dump_page_owner(const struct page *page)
@@ -734,10 +721,17 @@ read_page_owner(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 	struct page_owner *page_owner;
 	depot_stack_handle_t handle;
 	struct page_owner_filter_state *state = file->private_data;
+	ssize_t ret = 0;
+	char *kbuf;
 
 	if (!static_branch_unlikely(&page_owner_inited))
 		return -EINVAL;
 
+	count = min_t(size_t, count, PAGE_SIZE);
+	kbuf = kmalloc(count, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
 	page = NULL;
 	if (*ppos == 0)
 		pfn = min_low_pfn;
@@ -766,7 +760,12 @@ read_page_owner(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 			continue;
 		}
 
-		page = pfn_to_page(pfn);
+		/* Offline waits for us before it poisons the memmap */
+		guard(pfn_walk)();
+		page = pfn_to_online_page(pfn);
+		if (!page)
+			continue;
+
 		if (skip_buddy_pages(&pfn, page))
 			continue;
 
@@ -825,14 +824,18 @@ read_page_owner(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 
 		page_owner_tmp = *page_owner;
 		page_ext_put(page_ext);
-		return print_page_owner(buf, count, pfn, page,
+		ret = print_page_owner(kbuf, count, pfn, page,
 				&page_owner_tmp, handle, state);
+		break;
 ext_put_continue:
 		page_ext_put(page_ext);
 		cond_resched();
 	}
 
-	return 0;
+	if (ret > 0 && copy_to_user(buf, kbuf, ret))
+		ret = -EFAULT;
+	kfree(kbuf);
+	return ret;
 }
 
 static loff_t lseek_page_owner(struct file *file, loff_t offset, int orig)
-- 
2.53.0-Meta

