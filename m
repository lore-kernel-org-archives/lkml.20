Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47335498914
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949234; cv=none; b=jWTZfaQUWFhZ586h17mhcBLFzyP1pfZHaC6dWKM/EtWPXhIX+kMx8iPEdvxbembBHuEo9R2kpqF/NaWbEVF+OhJiXyuO18YHrxnvzlVi/3bSJ1Z51FeMViVyy+Dx1X9qMJAAzCaoH3t/bhiG5IcK/7bM5PKcdDOHKeTC9zoTlbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949234; c=relaxed/simple;
	bh=rPfdB3AFtBKPw/1Uy2omaI9Rtdatgf/EWcjp6PUwumw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qDu6ux+b6S3LiMNnq459t+6irAlEE//HENdNW7vSERMn0tui986SlxZI8qND3qj3NP6JjnxpGTv34DPC4XPIcKoPrOEfbr7LaXp7rXKJzxG1KDQAtEwz1dIms6eIzcvAumrFEvxngtSMf2Zy8WvAaWpypiy0aVj6UD+9h7EfzZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tT9Fz2UG; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tT9Fz2UG"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-85a50f6a7f7so78076197b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788949231; x=1789554031; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4U3+AfBAvn6B1ULZHKx9lvgAuWRYBVO83SclUxbDGr8=;
        b=tT9Fz2UGnxETlTmbyHAwZYaiPWS5B0cx5KG3uw+zIkiDXB4fxFV8HteHjg1CMJvcNE
         9Bv0QNlYapPVNxSE1zPdcr2zLNj/dQrH48dgU4rjjuv8PSeMBv3uc3+aKfxjwcnAFTTx
         Frgio4lW8raBbVZkfM5QT2i9GZaj2Miey2MReEoWuQfgvVOa9CsxC/HeLX0MzmYlWq06
         IGFKtqqJMntut2fy7aSV8czLI24+O+PB5sKQxQxtcI+Ge3ATfkB+jB1htGM7dGQPG2vS
         vn9BkOnMOIGre7A5K/55B2TwyQQA65k8AFHVQIpF/B1FUOiztBt1LXVQZ9BBca79zezB
         5L7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788949231; x=1789554031;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4U3+AfBAvn6B1ULZHKx9lvgAuWRYBVO83SclUxbDGr8=;
        b=jgZV9H/cHsC180Dqt6bWpMUOFFrLdS5FYsOQx1cZ1DDBr1PebUGLHVaDKb7e3yOidF
         GO2OdhliBOlHlRSYiq30s5v06u/qAT/i8y2+mjUygOhTPDZ7ck6XTeTlC/ZrJUW6i03Q
         V5sQ0q3MaB1Pdxr3ZEnaNZrcU1YFEvK0ucXk6mtVH58fkEQaNkvwyd5bAf2rrgLB8MUl
         2iL8osq5Nf9WBetwc/RDyqqSVMpJXNC1aClsd9cYc/3nkzTTiUel0zYmWKBBee8csy+y
         gH+iFgAeDa9iQiNaPf7XKSazXUuJz7jAJ1Shr9ITaNWN08IbeVAzVOq1sr+BLrR9Of/p
         8mTw==
X-Forwarded-Encrypted: i=1; AKwUvBwCkABLKhPZ/DieOWKP5LJZZwgp+mHmmlnndPAbaI6q6JvvDxzmohBsC8hDBM/KZYZJANARaHFCMcHoU2A=@vger.kernel.org
X-Gm-Message-State: AFuF++lNpU6mTZhuuVVh60bK10ODpPcabjAv0bFlVRRO5vhL9TpdUAc1
	Ycw4bbOcn3InaBIsA64xCMlBTAlI94dvX6R7N/w5dcMWkDYDNbnyGSKOTX/RZjJbEQ==
X-Gm-Gg: AYBFou20iszaYtw74xjWH9/lm/us+RugwCLZ9/KYM/cnJ3TWrDIWiQOD0J543N15rbs
	SgyLZ3P/OZPJBk/p5FawmCnFtVcXh9/ONirsDeKLGPtIx+V2Lik1Rie9zOiF9pUhoBVi4xPdUrI
	rvUxphTWp7Zbj6kBMSygx3HpaQ+kYEv1WeHrJUKL8gnmeJkM0/KLRFGd/mQeSMEFk1IYj6sq9Gl
	mZnqrBwF0qMUVb+cSP1L+0HUGDB+bgzmlqJKaluj0zqwYE2xjYXVHdxyRNx+K5a2BWSlLaloL/q
	Cgt14hbBczhviZ53UYk5pdtEJyMYunCcFG47XWS0UyPbFkzNV3lXUEbWukbXFsUWr5JFVG1eZ+F
	3RENLAzfU64vRnn7E0pmY2qmf8wR8xavxkTQSzkQEVJmisuhv3FcS08393onwGGQWP3XPvFumXW
	30B7e86zEgVjGqw/iYEBOxmw6nVHCVEBW6aVag2U8evf9sNHf/cwt398Z1b/MLp/3hokMXiLbZh
	rp95fZsOY1UgVKu2SjkBA+jhUpk6yXEwnZkjuK6ReSkFsLL6nGmqesm+iw=
X-Received: by 2002:a05:690c:e3ec:b0:877:e47:f399 with SMTP id 00721157ae682-8770e480a9bmr69779907b3.23.1788949230466;
        Wed, 09 Sep 2026 03:20:30 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714a0b6179sm106432667b3.23.2026.09.09.03.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:20:29 -0700 (PDT)
Date: Wed, 9 Sep 2026 03:20:24 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
cc: Ackerley Tng <ackerleytng@google.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, Alexandre Ghiti <alex@ghiti.fr>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Barry Song <baohua@kernel.org>, Binbin Wu <binbin.wu@linux.intel.com>, 
    Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>, 
    Christoph Lameter <cl@gentwo.org>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    David Hildenbrand <david@kernel.org>, JP Kobryn <jp.kobryn@linux.dev>, 
    Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, 
    Johannes Weiner <hannes@cmpxchg.org>, Kairui Song <ryncsn@gmail.com>, 
    Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
    Leonardo Bras <leobras.c@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
    Marcelo Tosatti <mtosatti@redhat.com>, 
    Matthew Wilcox <willy@infradead.org>, 
    Mel Gorman <mgorman@techsingularity.net>, 
    Miaohe Lin <linmiaohe@huawei.com>, Michal Hocko <mhocko@suse.com>, 
    Minchan Kim <minchan@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
    Oscar Salvador <osalvador@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
    Qi Zheng <qi.zheng@linux.dev>, Rik van Riel <riel@surriel.com>, 
    Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
    Shakeel Butt <shakeel.butt@linux.dev>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Vlastimil Babka <vbabka@kernel.org>, 
    Yang Shi <yang@os.amperecomputing.com>, Yu Zhao <yuzhao@google.com>, 
    Zach O'Keefe <zokeefe@google.com>, Zi Yan <ziy@nvidia.com>, 
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 19/26] mm/fbatch: vm/stat_refresh include lru_add_drain()
 on each cpu
In-Reply-To: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Message-ID: <48e09d89-27d7-60cb-a0ef-d2a5ea74d90f@google.com>
References: <e28f9a94-4339-f8ac-8301-6be3c9b5b7ce@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Reading or writing /proc/sys/vm/stat_refresh has long been a way for
testing to force an immediate refresh of /proc/vmstat numbers: it seems
appropriate that it should also call lru_add_drain() on each cpu that it
visits, before collecting that processor's diffs.

Add that in refresh_vm_stats(). I wanted it in refresh_cpu_vm_stats(),
which would include it in the regular (default HZ) vmstat_update() too:
which might be a wise precaution when proposing to eliminate almost all
the old calls to lru_add_drain_all(). However, that would go against its
"strives to only access node local memory" cacheline care, and bring it
into lruvec lock contention: which would probably displease its authors.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/vmstat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/vmstat.c b/mm/vmstat.c
index cb57714539fb..d66cb67f55ce 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1990,6 +1990,7 @@ static int vmstat_late_init_done;
 #ifdef CONFIG_PROC_FS
 static void refresh_vm_stats(struct work_struct *work)
 {
+	lru_add_drain();
 	refresh_cpu_vm_stats(true);
 }
 
-- 
2.51.0

