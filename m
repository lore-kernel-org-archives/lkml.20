Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667783;
	b=5sVHFFzGYPWAu+2mtnpgLaP8+F/c0tgxtJXj57g+fbNGCqntahE20z4dIhoYRskYyAv9
	 iqWsmcCUsxXiA2pWs+V0t9ydmuiSAFVfG500hjZXiwZIwIJ+1f23J5ZUN37ZUWCSLgaqH
	 0CfpS5Nk5hzsa0OOVo8QklTzR/fqTJcexMbrSMHDYx4Y/iWQLCOpHunkI2V1KOiLTWAaT
	 2lPiyEe3Xm8dHK0fhQ3e7IN1opuuXQWIWFt+ViVOoX4QXtcv1OUVivTtZSSgeZfx+2L72
	 RvwzP84EwnkQGcME4O22m3f6qOzdCVlxz04364XxqOqPN5db+C7TKofOrmsGrzBr3vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667783;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/xmpeLN3tjFh9PjQPZhkSHJLU+h0hkIrqBfSHYgvILA=;
	b=VHF+vnfmUvjnu2hfvmepzBSGj59l9Oxy+wxpUnKNwIc2ACvAfCbJPxbEvppC7mOF8M/6
	 k891QZDFPTwn0UG5yORw4c5JLPYSkF6VQvjAiNgqDOZDGQ4qilC18448xbL9i1zXuFrSM
	 Pa72Sv6gMwsH30aOnbtf+BpZrr+FMolFwSuWCA5qremcsz9XqCIFhX8XVoWO6lbqoF1uQ
	 c/XnuCl4dFYUIo9q/JAfu7i8L2ZiwsB2QMLSnWXd4KqiiIOWZK5OfHaj4w9Un0bajsuIR
	 305h2Rm3efyNL5sXGjeYiN/b3pOQQHjUxiZXNDaKfi/in9Wf+uMHwis6tPpwFvAGR2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xvSrzQr1;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC01F606A32E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC01F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xvSrzQr1
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdde3597d8bso176437a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667782; x=1795272582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xmpeLN3tjFh9PjQPZhkSHJLU+h0hkIrqBfSHYgvILA=;
        b=xvSrzQr15yBbBkoCVHldwhf79lFc8WFa8qYZ9BhcIC1lSRdTaaHE9LofdyHQK5LoMS
         d6E+UdH4ZrmgOysq4v2uLVGRsUA7+0DyPeRr+s6cZlvV16+Uc15dfXrqBAiOGYsL4fjv
         PrFstX7L50odIlfYlo+MYEgLlWrVXhwsbca5mdIw1lhCXDUbMds5TECm2nlKA+Ktwfya
         DFK7SM3exSYIA8G0YHhqeCCQd1zlTYTKOjpufKquiQxoo8lsfZM3D89BTTZW3Z4PuUpG
         A5X/IRIWSQ4KjruBC/a6RE/Qrnw00rVV4vwPvTyRh9lB+gQGIN24b2JkdQrj4lCaakB2
         zi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667782; x=1795272582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/xmpeLN3tjFh9PjQPZhkSHJLU+h0hkIrqBfSHYgvILA=;
        b=Wh+dTwpE/8KRkuodCZmt9Gl6Obv8pbgkgokJ+FfUaz2rt/ii/4idZ06ZY3LH88mRFD
         i7SaDf+j9/yNnWlxk/sBfsoc+b0ZrlIyLrxwkJqLw8Ifh055PUvSz6vmMKz5d99SEcaR
         wtEqKUl2wIYbv5+r2rr9QGSoVvxuVOo5M9WSjcBQgCkVYSSfPFURWpNla5eJCJCrYmI/
         BmwAM7NyMqNrcU8k9fz4z1tTjnQqL2a89QPHmsgsUG0JBtHJR+W2jfJ6+f8TVyfwUf+b
         2gkr530MViuFS5WMpcoGI9daftaUDtVSQV2GZi5r3LpTxdwaz8Z4AEZM6yWfVOqIlZze
         14Ww==
X-Gm-Message-State: APuU4Z8Oaf27vMBJS+xn8LkiQUN8D9MukPGvEFEkM3Bu6yNN6ClLICY5
	Y7I+TZhELg7w4mGYhR9z+RVghbZlXp57lWsr4yrf/mXC3kCcaVD1BH2H
X-Gm-Gg: AYBFou1wKaT8L8KK78zzXu3tIJnBj6YrMe48XDhg7pnAj9jSumwCHc4y8vMrszHPasC
	e/YgavD02yOhlOmDKdHF3knzm34vn7hHP0wht5TYIywr/ChsfZ8FkiywXE9MO+rZVjdQQdxD5ug
	BMOj0CLJ6oRAXvU9M0rlk9+YecTXr6ss5bIdK1f2HikgrHJKdpkXP3eJwCdB2k7tPRFB45XYpxn
	Y1weV7dQkvbSfjLC3iFdAti5yhWUvdFH5n4ils+wraCdY8cegL38r3NsqLJB6l85MKUhHuvI1HO
	t91S5dw2MIC3HAzDcYXa8A8E3mXdcxJh+ehMSypqjc+aNZxfvI20/p0NsfDk70D2FvKJ0CU82xl
	pRCleo5k6W05DL+44FHeILZYhcA8nsNHV3eh48NH/JWJBy2wJlvk3rjE2gR2VPpMhXR+8AzlmfS
	n2bT1ADKeYx3tTVwGoZ6MNodxO+lXfoWjmOzWr/A7FVv5ukTIqYyYSF/+D8tYvPzgqLG8X1AZWi
	JGfXWKhpWDh5X1CvrsvAoJd3Ia30RHSRAUbnmAueDblwl1mJJAStQrqdQtGOdgTf+EtOTPZjYih
	qArIj8ExDpppsxWbW9ZYCtkU2KccKk2PhA2FxE5htF2crhTStTBF/b3mBzY9X8Ez7vvZ1XmMcAZ
	Q06uNIMroWJqwZA==
X-Received: by 2002:a17:90b:17cf:b0:3a8:9d4b:2788 with SMTP id 98e67ed59e1d1-3b197d30295mr7107823a91.12.1794667782210;
        Sat, 14 Nov 2026 06:49:42 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18c800esm2419014a12.29.2026.11.14.06.49.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 06:49:41 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
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
	Kunwu Chan <kunwu.chan@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [RFC PATCH v4 04/18] mm/swap: introduce swap device iteration helper
Date: Sat, 14 Nov 2026 22:49:31 +0800
Message-ID: <8e1766da4ddbf22e36f8689360dfea64377269fd.1794666741.git.lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794666741.git.lianux.mm@gmail.com>
References: <cover.1794666741.git.lianux.mm@gmail.com>
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

Several swap users scan the swap_info array to find in-use or writable
devices. Add for_each_swap() and for_each_avail_swap() with SWP_USED and
SWP_USED | SWP_WRITEOK filtering, and use them for hibernation lookups,
drain_mmlist() and si_swapinfo(). Keep the swap_lock requirement for
iteration.

Move the live-reference warning from __swap_type_to_info() into
__swap_entry_to_info(). The iterator must inspect descriptors before
applying its flag filter, including descriptors whose device reference
is dead; entry-based lookup retains the warning.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swap.h     | 12 ++++----
 mm/swapfile.c | 77 +++++++++++++++++++++++++++++++--------------------
 2 files changed, 53 insertions(+), 36 deletions(-)

diff --git a/mm/swap.h b/mm/swap.h
index d488a69c2809..70fd3ab655ff 100644
--- a/mm/swap.h
+++ b/mm/swap.h
@@ -108,16 +108,16 @@ static inline unsigned int swp_cluster_offset(swp_entry_t entry)
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
index 6485c8020d3a..1669a46515cd 100644
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
@@ -2284,26 +2312,18 @@ void swap_free_hibernation_slot(swp_entry_t entry)
 
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
 
@@ -2470,16 +2490,13 @@ int find_hibernation_swap_type(dev_t device, sector_t offset)
 
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
@@ -2996,12 +3013,14 @@ static int try_to_unuse(unsigned int type)
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
@@ -3997,14 +4016,12 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 
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
