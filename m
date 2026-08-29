Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE52535C69E
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787989648; cv=none; b=XMrzMr8q1rE7qKau/Vul1GFuTxLkZ6mIE38SVJFlFLwByQwTwJ6tObPaejXakSkDLwsWWS3ogvmPchD6LimmpZYmwGi1860Air5CsG+LNjmSxwe46sTyBN0w6HFroq5BMqopop8e40HGuQ4IlIh6eTNUWMxVhTqVvc5sQXVF1m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787989648; c=relaxed/simple;
	bh=CM6cPd6FOwbZ3CIDYweTMGQ1LQbkEFKNsimGOKG1Mjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FtjgKfgOWQP+m2odyuM8xCdrUz72il8R0Sud4t1gMI8IAmtdOyFnKINof2DTvCNj+Bq5CVKfa6PKLh3hDmf2FZ1SF5MD/4iAM5LaHCeCYjQVzhOtVXJX5ktTch5GHXwTllxKoqmheO4JuvGB+HSXgOFPyQYujvwsCIEr11eBDf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZBULyKY; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZBULyKY"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso2081727a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787989646; x=1788594446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajNLhdeOa3qTi7x0+Rqx535kN8WB+xlcS2id0wkaitw=;
        b=gZBULyKYzH3QwnMzHgGvj6R2Pj8jE3qBUN1lSnJZPShUvYMJXJ/RsJKmxqj9FQqA/8
         dfWGNUDR9TINH+GTSSOi/cXy3jhWUttB/kvqlklCEaGwR/kwGtKFzm7ix1l9Cv5r2lh+
         PAjVGmCbR3sZisbFPXny4iFdSG4Sny1cyBibYcKFFb1qhH/5qjmNvH3QrjeoojSts2jl
         W7V4bLOwpgxuf+CVEtAnoKa8aj9umafLxz2FEUBf4B+bVxQh+gG+buz0RyCSV1KCiMAo
         RpPNsj0MMF2F03NfNw5UZXDUn+XfyAJROMa74sjzxaBzq6hU7/njeRGnRpRJpgoWl3xc
         r4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787989646; x=1788594446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ajNLhdeOa3qTi7x0+Rqx535kN8WB+xlcS2id0wkaitw=;
        b=Vra7N4I9IpwAx+tTmeegn0TgrVPYzllAE/zsQm/bm4rQB9/swyq+SU6wIbQPWSbOX+
         0AsPn66geM6CvFnU/8KJ71qNQAH8+hnz49CutKqL7UzeYJHZpp3ZBm8H6RcLspDZtzX+
         rgGaNr3ikbIvqXcUfeSwBjA+RB9c0W1s3SlGgQeG7RzZYjsUnWmRbMBHpAqEslpu7DSl
         6boJvmXJcscSRrLSg/6pki9q7VfhJEN6L3SSRetXV2ftjDAOuWOrkJYh2LWXTjCYbjpf
         MYu8YjnbfgmBxs1djKyNDTiysxQKTRqG5AXJ2+vCbwk+qzl4BZMhMkVIJk+vixuPOjBd
         dUIQ==
X-Gm-Message-State: AFuF++kwFWwYC4YjAvmt5p42Tk7V1edQYvZB5Um1pBlwE/ORSxsub4yg
	uZzLbkdUAhsTIjT/3nX0w5mCwj8QibRRfrlCFxWNswzKltBXTQE1hfc+
X-Gm-Gg: AYBFou3rtc8TJ2UFz2PfXQzg8ikwCCtRy9F/hEzv9X1Grw/v+AeAr0dt5b69d0wt3B+
	rvqfEXI/kCZce0QFAw6KFRpoBTDTqCw8r+0fazMClEtivPggNH2c33QRrGNCoKd6/TVSBvwMxCC
	DinEWADro+xsPUnfwr8rohWeFq05ue9UebNKSxCyzTCSa103Z3O42gtotgqWlgJ4kZBeRTkfLGS
	bNfpeGfPZV7YDrMpgDFu3zaRs/6NFlXv6ers4IsG0+C1H2o6FlukyKY7AV3o4QSlzUh636cYbIh
	Ax9rIER3uqYHjSdl6IBGseVRVddYlP7TCK0F/jhdVDvmdhcwpLw8wtCUXdyBWN9VW5vDTJqTX8+
	OyAGzjLVWxivcAbBFATybwO3O3WDoNoDJ51rCKXVCFuyC7HYJ9etzhZ8aDCEvLRpp2XAOIRn0go
	dRXu2nnfnKZ26wUaUK3DaJVVCfRjDoH9Lb8iKDrWnG34XQBmB7EIP4b81F0w68O8pRa4yuHLrG7
	l4aUNkC5QkkQRl8EnrxvEktYgQE
X-Received: by 2002:a17:90b:1806:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-3989be8eaafmr5958988a91.21.1787989646053;
        Sat, 29 Aug 2026 00:47:26 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398a14768dcsm853443a91.4.2026.08.29.00.47.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 00:47:25 -0700 (PDT)
From: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Kairui Song <kasong@tencent.com>,
	Jihan LIN <linjh22s@gmail.com>,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [RESEND RFC PATCH v2 04/13] mm/swap: introduce swap device iteration helper
Date: Sat, 29 Aug 2026 15:47:17 +0800
Message-ID: <20260829-swap-pcp-priq-v2-resend-4-68d3d925578c@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
References: <20260829-swap-pcp-priq-v2-resend-0-68d3d925578c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

There are many users that access the swap info array just to iterate
through the swap devices to find usable ones. Introduce a generic helper
for this to prepare for dropping the lock convention.

Also slightly adjust __swap_type_to_info to allow access of swapped off
devices by moving the sanity check into its only current caller, and this
way makes more sense too: the only caller is __swap_entry_to_info, where
we should never see an entry referring to a dead device.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang (ProcessMission) <lianux.mm@gmail.com>
Tested-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 mm/swap.h     | 12 ++++----
 mm/swapfile.c | 77 +++++++++++++++++++++++++++++++--------------------
 2 files changed, 53 insertions(+), 36 deletions(-)

diff --git a/mm/swap.h b/mm/swap.h
index 90a551a88df6..403574a7fa8b 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -107,16 +107,16 @@ static inline unsigned int swp_cluster_offset(swp_entry_t entry)
  */
 static inline struct swap_info_struct *__swap_type_to_info(int type)
 {
-	struct swap_info_struct *si;
-
-	si = READ_ONCE(swap_info[type]); /* rcu_dereference() */
-	VM_WARN_ON_ONCE(percpu_ref_is_zero(&si->users)); /* race with swapoff */
-	return si;
+	return READ_ONCE(swap_info[type]); /* rcu_dereference() */
 }
 
 static inline struct swap_info_struct *__swap_entry_to_info(swp_entry_t entry)
 {
-	return __swap_type_to_info(swp_type(entry));
+	struct swap_info_struct *si;
+
+	si = __swap_type_to_info(swp_type(entry)); /* rcu_dereference() */
+	VM_WARN_ON_ONCE(percpu_ref_is_zero(&si->users)); /* race with swapoff */
+	return si;
 }
 
 static inline struct swap_cluster_info *__swap_offset_to_cluster(
diff --git a/mm/swapfile.c b/mm/swapfile.c
index d7115b9195a6..3847717f4d1d 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -106,6 +106,34 @@ static DEFINE_SPINLOCK(swap_avail_lock);
 
 struct swap_info_struct *swap_info[MAX_SWAPFILES];
 
+static inline struct swap_info_struct *__swap_iter(int *i, unsigned long flag)
+{
+	lockdep_assert_held(&swap_lock);
+	while (*i < nr_swapfiles) {
+		struct swap_info_struct *si = __swap_type_to_info(*i);
+
+		VM_WARN_ON(!si);
+		(*i)++;
+		if (flag && !((si->flags & flag) == flag))
+			continue;
+		return si;
+	}
+	return NULL;
+}
+
+#define __for_each_swap(si, flag)			\
+	for (int __i = 0; ((si) = __swap_iter(&__i, flag));)
+
+/*
+ * for_each_swap - iterate through all allocated and inuse swap devices
+ * @si: the iterator
+ *
+ * Context: The caller must hold swap_lock. The lock may be dropped during
+ * the loop body but must be re-acquired before the next iteration.
+ */
+#define for_each_swap(si) __for_each_swap(si, SWP_USED)
+#define for_each_avail_swap(si) __for_each_swap(si, SWP_USED | SWP_WRITEOK)
+
 static struct kmem_cache *swap_table_cachep;
 
 /* Protects si->swap_file for /proc/swaps usage */
@@ -2210,26 +2238,18 @@ void swap_free_hibernation_slot(swp_entry_t entry)
 
 static int __find_hibernation_swap_type(dev_t device, sector_t offset)
 {
-	int type;
-
-	lockdep_assert_held(&swap_lock);
+	struct swap_info_struct *si;
 
 	if (!device)
 		return -EINVAL;
 
-	for (type = 0; type < nr_swapfiles; type++) {
-		struct swap_info_struct *sis = swap_info[type];
-
-		if (!(sis->flags & SWP_WRITEOK))
-			continue;
-
-		if (device == sis->bdev->bd_dev) {
-			struct swap_extent *se = first_se(sis);
-
-			if (se->start_block == offset)
-				return type;
+	for_each_avail_swap(si) {
+		if (device == si->bdev->bd_dev) {
+			if (first_se(si)->start_block == offset)
+				return si->type;
 		}
 	}
+
 	return -ENODEV;
 }
 
@@ -2335,16 +2355,13 @@ int find_hibernation_swap_type(dev_t device, sector_t offset)
 
 int find_first_swap(dev_t *device)
 {
-	int type, ret = -ENODEV;
+	int ret = -ENODEV;
+	struct swap_info_struct *si;
 
 	spin_lock(&swap_lock);
-	for (type = 0; type < nr_swapfiles; type++) {
-		struct swap_info_struct *sis = swap_info[type];
-
-		if (!(sis->flags & SWP_WRITEOK))
-			continue;
-		*device = sis->bdev->bd_dev;
-		ret = type;
+	for_each_avail_swap(si) {
+		*device = si->bdev->bd_dev;
+		ret = si->type;
 		break;
 	}
 	spin_unlock(&swap_lock);
@@ -2830,12 +2847,14 @@ static int try_to_unuse(unsigned int type)
  */
 static void drain_mmlist(void)
 {
+	struct swap_info_struct *si;
 	struct list_head *p, *next;
-	unsigned int type;
 
-	for (type = 0; type < nr_swapfiles; type++)
-		if (swap_usage_in_pages(swap_info[type]))
+	for_each_swap(si) {
+		if (swap_usage_in_pages(si))
 			return;
+	}
+
 	spin_lock(&mmlist_lock);
 	list_for_each_safe(p, next, &init_mm.mmlist)
 		list_del_init(p);
@@ -3827,14 +3846,12 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 
 void si_swapinfo(struct sysinfo *val)
 {
-	unsigned int type;
+	struct swap_info_struct *si;
 	unsigned long nr_to_be_unused = 0;
 
 	spin_lock(&swap_lock);
-	for (type = 0; type < nr_swapfiles; type++) {
-		struct swap_info_struct *si = swap_info[type];
-
-		if ((si->flags & SWP_USED) && !(si->flags & SWP_WRITEOK))
+	for_each_swap(si) {
+		if (!(si->flags & SWP_WRITEOK))
 			nr_to_be_unused += swap_usage_in_pages(si);
 	}
 	val->freeswap = atomic_long_read(&nr_swap_pages) + nr_to_be_unused;
-- 
2.55.0

