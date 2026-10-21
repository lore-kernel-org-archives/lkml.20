Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562637;
	b=QkqcN9PW1KtQbmXDxyJznHSZ9JR5JixRDLxOznfpXTyCZDJcGGSUURLj5bhrjeVTl7Da
	 5WSC35fqhRfmiEu57MxFSWgVMG+s7yUY/Q3IxiOq7JQxBxdTNZUC94I9Pn3NfG672FG6R
	 LccVTdmhuBMU1FIKHKRC9ssR2a26rdQiWrYIEg5OWhJwAYj7VFdZDpuu6MFgbol4gbrS0
	 IOAcEo1p+vWkyfYQn5rXOLGgMrenxfugI2jAilAZJITnyBntmk+Y/6/F9D7i/YnC35FPC
	 ACzLVbO3u8eqyRvN84q2NZGnqEZe8G+JJ6wvwn5CBaNc4Jc1YWN1NhOaS8GH6SDs7uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FeGd0iaaX9wfTd3kx7wQwl7QfCj0iIAuoGLe+aoH7yI=;
	b=XPOJm4uTpcH/k0sOPjFDgrlEU0S2z+EVZwAKP9KO//Lq8yqhUkYZtcppD0WTjw1eVTTd
	 3cX30ZIk/k0Apt4KAHe9LH5HDSq7UbM+5TGzu8D0WVV0zfCuMM1IA627z66IjsIU5p60Y
	 dk6VPdPSBbezz9DGgkRvIpi0kiKPho13bOGKuX8HeUQyNHB1aizXKEhSoaHi27sBFGgT2
	 vAtSIaGyRSVzo4I/BBZO10R1r3Ky2TmVjvCvmD0mCSPLUeSXj8sZJg2LvgCOwmKbSwaar
	 Ak1/j9F9v5XxHuCRq5tuzu1TQwRkUL9Zjxn/muNVjDX3Q/Ol52lhtwvSawJbZ5dFRjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cFHBudiq;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DAA60A3834
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09DAA60A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cFHBudiq
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8ac4806e210so3210737b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792562636; x=1793167436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FeGd0iaaX9wfTd3kx7wQwl7QfCj0iIAuoGLe+aoH7yI=;
        b=cFHBudiqdnv6DAu+tQmyNNZRynSkOYTlu2N06wKLPRU41eE3jBx52bn87pBU7yE6Zu
         m58pe/p9uIWeanxtVlPsJ2OSp4BusAsA26Pw4oSery9Vh4Ekn0kntCNUXHAM6GqCaEdT
         5sXoumkGf6MfpU7PtAgfy6ArFeoXqy4ea0v4Sg8p1XOCYdWfoLwfAVsQzWjDeKoN4nFY
         qKIjsx+x+b964+u0eqbROXdRj4tfp9jVA9Kf3BDuQ0gi22vBh60V9wl744es9ds89JIm
         qVZL+GbC50Exbo90BRGe8pSxKsikoelIsDLlxAYta+NtER/B7rjsltI+RedNs7QZ53KT
         JV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562636; x=1793167436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FeGd0iaaX9wfTd3kx7wQwl7QfCj0iIAuoGLe+aoH7yI=;
        b=1LYgo6e1QyUaIycn9YGugjubXVbNUKVGbATdKjrXrXKUqSyqXT3hv9DyyfR8J/cQHp
         YJfqaTi+NEABH+Pw8PQipgQnqVBQTuOi6rmHy3XXQgAtHVn4vi3Ztwq//ikxNhf0dC3J
         bnL9zTC4tFkJbX6bNgkHbMbuzo9KcAKlRnhqLhz+NbhqRbPdVd7oRQPo9sB14aBpaPvs
         Ybtw2EFYAhZtxrzLD66U4Lhr/fTBXIdtOdpwsFa+77toPnVsdASR0pc4pxiQ5kqueQnX
         cezJOLv1aHhysp7GouC7233zOw8CCuWIBRog/mI8+CCBXTpbPL2INPQQ0d/Uwct6zA6X
         V89A==
X-Forwarded-Encrypted: i=1; AKwUvBzxTZhrm+zKZua58cR0Pi9QRPZ3BoD8Kj38ygMQjx2DaYqu1KOF276So/OyvfgQUmSLbN7+tzmkKWYf7WI=@vger.kernel.org
X-Gm-Message-State: AFq9FYID2U8lMBX82wXo8az+Gh6SDLXBIVo0/eGSdlu78VWE2e3w7kj4
	waWqit8KWlocPLpskmuXJqcDQ6QRMah1MW6bMBg3NolAJ/ukkuaT3mh6
X-Gm-Gg: AYBFou3/TKcjONJ4OfXtUeLvgumcaBFMQEJhjx5blG4MUqWqkzQElZv8sqdkKZj7RlA
	RfivDlb0attRvtbvlL9HVtTdeX612Xd0Ufa0B0pG5DjDCf6+wPgZUKuUHR02OTZnHyIcKQkXTDh
	rCxXSkSmTTX0Uka4K3HavTCaHLXJLb4ngVOFWbe9PNpw3VUPcmi7VxOF9PGoIa8WFy8hbO+VppH
	QPfnk+kf0Z4VnPYDook0oeIStulsmbBADi7se3eyIKwt1sJC+S/DarzdqEahlFF9SB9LvgXkAx4
	0YEfQighjDvddkpqsFgRdh2FgFKnb1mLnWKwVQ/xVpfMwlUtG3QMpD7Ptam+vp1hkLsstmBxjj4
	zGKeCbt+3CRyTPYhLorwZxs3JrYUq+/4Mp7yLrsNZo77OhH1vKXrFl0t0smbdTr6wsbZVLsHAT+
	datrt0tEFbSZnvpK0wI6K8nhpKT5fBZZ9IusLqb0wcPNBKYqnvPPnjUoxbvBEu+522DkhPzyzkn
	Bsrv3tJ+0T5iDKeriuDr/n0YOqNrGeliZiXwSqdw421xOXL
X-Received: by 2002:a05:690c:660a:b0:8b0:d3c7:52e9 with SMTP id 00721157ae682-8b13400d0d0mr4996737b3.36.1792562635989;
        Tue, 20 Oct 2026 23:03:55 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:55::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1300eb0ecsm7200107b3.26.2026.10.20.23.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:03:54 -0700 (PDT)
From: Nhat Pham <nphamcs@gmail.com>
To: akpm@linux-foundation.org
Cc: chrisl@kernel.org,
	kasong@tencent.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	yosry@kernel.org,
	david@kernel.org,
	muchun.song@linux.dev,
	shikemeng@huaweicloud.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	chengming.zhou@linux.dev,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	qi.zheng@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	riel@surriel.com,
	gourry@gourry.net,
	haowenchao22@gmail.com,
	corbet@lwn.net,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	tj@kernel.org,
	mkoutny@suse.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	kunwu.chan@linux.dev,
	kernel-team@meta.com,
	nphamcs@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org
Subject: [PATCH v6 09/12] mm, swap: add debugfs counters for vswap
Date: Tue, 20 Oct 2026 23:03:20 -0700
Message-ID: <20261021060323.553433-10-nphamcs@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261021060323.553433-1-nphamcs@gmail.com>
References: <20261021060323.553433-1-nphamcs@gmail.com>
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

Add /sys/kernel/debug/vswap/ with two counters:

* used: virtual swap slots (pages) currently allocated
* alloc_reject: cumulative pages whose vswap slot allocation failed

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/swapfile.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 341077fee23b..12cd5caeaaf2 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/blkdev.h>
+#include <linux/debugfs.h>
 #include <linux/mm.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/task.h>
@@ -146,6 +147,7 @@ static DEFINE_PER_CPU(struct percpu_vswap_cluster, percpu_vswap_cluster) = {
 	.lock = INIT_LOCAL_LOCK(),
 };
 
+static atomic_long_t vswap_alloc_reject = ATOMIC_LONG_INIT(0);
 static void vswap_mark_cache_only(struct swap_cluster_info *ci,
 				  unsigned int ci_off);
 static void vswap_clear_cache_only(struct swap_cluster_info *ci,
@@ -1997,6 +1999,7 @@ static bool vswap_alloc(struct folio *folio)
 
 	this_cpu_write(percpu_vswap_cluster.offset[order], SWAP_ENTRY_INVALID);
 	local_unlock(&percpu_vswap_cluster.lock);
+	atomic_long_add(folio_nr_pages(folio), &vswap_alloc_reject);
 	return false;
 }
 
@@ -4874,9 +4877,25 @@ early_param("vswap", early_vswap);
 /* vswap does no IO on its own. */
 static const struct swap_ops vswap_ops = { };
 
+static int vswap_used_get(void *data, u64 *val)
+{
+	*val = swap_usage_in_pages(vswap_si);
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(vswap_used_fops, vswap_used_get, NULL, "%llu\n");
+
+static int vswap_alloc_reject_get(void *data, u64 *val)
+{
+	*val = atomic_long_read(&vswap_alloc_reject);
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(vswap_alloc_reject_fops, vswap_alloc_reject_get, NULL,
+			 "%llu\n");
+
 static int __init vswap_init(void)
 {
 	struct swap_info_struct *si;
+	struct dentry *root;
 	unsigned long maxpages;
 	int err;
 
@@ -4926,6 +4945,12 @@ static int __init vswap_init(void)
 	mutex_unlock(&swapon_mutex);
 
 	vswap_si = si;
+
+	root = debugfs_create_dir("vswap", NULL);
+	debugfs_create_file("used", 0444, root, NULL, &vswap_used_fops);
+	debugfs_create_file("alloc_reject", 0444, root, NULL,
+			    &vswap_alloc_reject_fops);
+
 	pr_info("vswap: created virtual swap device (%lu pages)\n", maxpages);
 
 	/* Last: everything above must be visible before routing starts. */
-- 
2.53.0-Meta

