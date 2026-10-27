Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117142;
	b=eiwpdCkeouk2Hcyc6YSn+xBTbv+ekTgu58E7wKGHZWOrGov13w7iETJzqX/98rEvPKb8
	 l5foxg5GxifeFQPzWDhG7ODF7g34NXi3IxwdrRN9MlINDjNrSGFAN3eltBJu0MbIZ25X8
	 efyn02ob+AlOKPURCZiMJ4Fam5ceh+e92M/9P3s6M2cVc4rWlxjpRyW/cT7xLFNz207vU
	 cxofgKJijk3vNFm/0tin0JbSPkc7loXPghnHWbX+/hCQO8F2t6muprGVAQyXCxFdYxEdg
	 ey7qXKzyq1iN27KItq+g/SPrzR9TkpPtKEgTwMnMyj4bg56vxiUNyUthGlX/mn0TAsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Gimspkvzpv0L0LYJWO8vCB44gcFGH0Ui/jyvcrmF/LU=;
	b=0PkGSLCTiEJklr/mzfqJHNi+g4vqVYd1SZUFJC3gxUvMPApv2QAJHtbOlNZ4a24U1Zjw
	 47pqtGrhp6ts6qBwlm0mt1ZG/L1BuL9s7/RcjegJRcI6h8YiPTHQuzCy4T/IUI5cOd1tJ
	 CrsxB37RXDozSJWV7x0zldQQ7AP7aebf8Zis7oloRBYY+riUVsRHQdVlcmlSeAnwEZa0a
	 AEFPZ+N30JcxbUL0c66AZVExS5jpbe+skg8ePjMzyVfOJGgPC2bpddm+J8dI2OpHmCecf
	 fAlDjdFn+ka7MB5q1N7fQT0hgyhrlXYxUS0sQkvRoh/vpuhy7a16ZRruwmMxC1g9VWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gvMlyVSc;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB4860A2602
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CB4860A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gvMlyVSc
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso44512a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793117142; x=1793721942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gimspkvzpv0L0LYJWO8vCB44gcFGH0Ui/jyvcrmF/LU=;
        b=gvMlyVScOXf6a/zmRxZpk4fzMWXajFFDf2b6DydtgSAuxVGkofZa9OduTp19PgEX73
         ZsleyYxbhNh6Gn+3Eois3oML80olCN+af5eCo8Xox/QQaI5sNA/TS+q1uvpaWyFIqxHg
         80XMKUlfRtuHpvKUpKru2nIhMARCIyeYEfZXaw2sO/jUTEcFBzq3ZYNDIW6Xb6T2lJlT
         k2q2UsMCd+jY6DUf0vXvQswCcW8LjY9sWpBPccOgm0FsZfck5or8W9ZDhrwAmioPEAgO
         tzZoPJumIzpJ74rZ1YUPv+RMQ9ItfpYdd15nlOI/s/s20Tm4u1Ml6BQ41ExHusXggzEQ
         TSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793117142; x=1793721942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gimspkvzpv0L0LYJWO8vCB44gcFGH0Ui/jyvcrmF/LU=;
        b=RP93eupV1AKu2UI18GA6cWpLXom4cTQQXi4t0uMUkU5wW7AF0kKYgn3FaAPxc/BaqD
         Mwhs812YPDIKdDH79hps10MJu/ILMHQ4fKO1l6A4Lz4gbtR2VRl5lM1QHMGp/Rhk1rF/
         C2kOjeQ/0pEcNR7i67mgMTwjqtMSGMW3LHhdI+SAU7guMZV6yXDLOPNEUyA9D2JMByjJ
         amMgnRYNs8o4p3V3d4MFtS2bJmys/3ksCL/X4/JPpn4WAtGOQfS/Bxj23YUJ+pN23zhR
         F6OXF+hu5SHLvnI8vkxl4aAnlTYvNTgV0Gv9DRYFRMRIgQ9uy4dY0yL5f76IerJKyLnk
         gWLg==
X-Gm-Message-State: AFq9FYJ+5gjIURVXO6SubunndVRyG9/2W5NkuezrTplmcHJw55DSiVXC
	nYChpPFNcsilaWoZbDSdsdzwy1waZGPzxTIZOblgvK6fS/YjRxuT/xZK
X-Gm-Gg: AYBFou3xT1zVjmUu3GC84k2h62MtFH4saBBqq+jz07CKWueuv9ATRfgYz5D8Q1oxxlY
	1GfUj2mhT1ArjKJbExW7w+eKywQnE6tyvuviIobYC+EgMd+Reu3gWcAj/8ebi/X8K3zltFGfMnL
	U03z7QwEakpalipF46o9WNEC6IyeXmBaJKS3Wso0BeOvUj3Zai//C6TZTedL2YR2yKcUxPe67YR
	awPj4OEZhQXdvXcRzQf8QEH36DXPVzMWCp50KvoWn/HS+gZ+B4okp+T7wyghVBwfHal0XVtG9D7
	fHmovuFj9+fIM2ZQcrIGLMedfhDnriTQ+DyBNQCFMlTxfh5IrNMxG2YpXSEkBhG1mlv+2Z005UU
	F4uA7K2NvLUjpe558MxbRGliNki8DpCQY1mLsAcT7ZhuvTDSOFx6Wquzw6BMX47Pc64VJMOQr47
	YDwM72NxhsneoM8Hq19VIpqlEvTsEN87Es+10aIXfhcK0nKV/bVqIUKD+fYi3zeqeNhtIKMaxeA
	dmINWmvF5WKEtR0M0IgKLJSEhLdHHYRG4f6ax2lNlehbuJK0ZubvZ77ZV00nOct5qZhJYji6yx1
	b++hvWx8KIBnviZ0TjBO
X-Received: by 2002:a17:90b:4fc2:b0:3ac:9a5e:9ce7 with SMTP id 98e67ed59e1d1-3adeae70fc6mr8364278a91.49.1793117141630;
        Tue, 27 Oct 2026 09:05:41 -0700 (PDT)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40472ed9sm4449271a91.16.2026.10.27.09.05.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 09:05:40 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	kasong@tencent.com,
	linjh22s@gmail.com,
	kunwu.chan@linux.dev,
	kees@kernel.org,
	gustavoars@kernel.org,
	tglx@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v3 04/18] mm/swap: introduce swap device iteration helper
Date: Wed, 28 Oct 2026 00:05:13 +0800
Message-ID: <f2d75ba96189520fe66a99ea9c7c0d9894b8ec22.1793106426.git.lianux.mm@gmail.com>
In-Reply-To: <cover.1793106426.git.lianux.mm@gmail.com>
References: <cover.1793106426.git.lianux.mm@gmail.com>
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

From: Kairui Song <kasong@tencent.com>

There are many users that access the swap info array just to iterate
through the swap devices to find usable ones. Introduce a generic helper
for this to prepare for dropping the lock convention.

Also slightly adjust __swap_type_to_info to allow access of swapped off
devices by moving the sanity check into its only current caller, and this
way makes more sense too: the only caller is __swap_entry_to_info, where
we should never see an entry referring to a dead device.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swap.h     | 12 ++++----
 mm/swapfile.c | 77 +++++++++++++++++++++++++++++++--------------------
 2 files changed, 53 insertions(+), 36 deletions(-)

diff --git a/mm/swap.h b/mm/swap.h
index d5bf21f517dc..d46d09b8c21f 100644
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
index 4adcfbbb3730..b72f4fc3e811 100644
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
@@ -2229,26 +2257,18 @@ void swap_free_hibernation_slot(swp_entry_t entry)
 
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
 
@@ -2415,16 +2435,13 @@ int find_hibernation_swap_type(dev_t device, sector_t offset)
 
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
@@ -2931,12 +2948,14 @@ success:
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
@@ -3931,14 +3950,12 @@ out:
 
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
