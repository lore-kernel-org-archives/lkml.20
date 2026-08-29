Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAD33264C1
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787989665; cv=none; b=nk+aaKdic1enumAWihN0SUAPEfDTaStrnDR/v1kU9uyfAqCt3KWp55TwVRjEdeWojGfcLXtsvwDt5rSmqnb6tpssGuWmuNJJVtamKtyHp5LYiXxs4I/KpNptk5FnkesH0yRQbIGHJFTLe05hM1ZvBDC3wx7K+XFNQoo1Hq66e24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787989665; c=relaxed/simple;
	bh=rrUrHgsNZcNvQrQ4/aoZC1ACLWxdnMwtaUSsbxGf3M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQ4sGE5n1+SYsjTUtL7veukoUG3CpxqYvJdoLvi/xWzMYzhyuK3BNQmpZ1Np6j33HjJFjZErHowmBBgNZFPfIIs5H89D57uUrmOYkdX0DWC8CitJDCzKOkzkr2GtxKiGDKaHyriIzVDj3AfcYPrJZaMCQY0XF15N/9I9TeAVf9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rh/vAyP6; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rh/vAyP6"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d58efc7356so20786395ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787989664; x=1788594464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iWn6EGMddmTMon7V+5jiUnHk1hdkEvtDIqVtgSXnKtY=;
        b=rh/vAyP6ZxvlAtc/8E/bSpuiekJ3tke2Ht2Xa76Zy11EMc8LMyok9wOotb4HpnK6xH
         siMF3wZ/9jGWM2zT22tveHm7DNUuTgH6xZY1uDfHcCn1M0quR+vep2ZW6mz/JRiPcXio
         2AZy1UuIV0Z9Gemzuait7eY1kdSMUVrDtbYEZPCuJWQ79lTVV6Owfg0v21Q9xONJNorM
         lcsd1aBKkScopYJasY04qEkoxwVSZNFI3M2Y7RZUYfxK0Vwz2Df2io6NAJs8TLtNG/+C
         aq6e0jxSlQozJMBavscnE0yBxU1X3y/tPcMqCIgLy9uLsn1z2MSsirbxusUACBveR7yn
         YtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787989664; x=1788594464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iWn6EGMddmTMon7V+5jiUnHk1hdkEvtDIqVtgSXnKtY=;
        b=UI9DNCkaHiEAl5dE0qF2SfHwGwthI6lN7AsdWCYJp4z/VlIfSi/i9EA77BTT6DTt9D
         S5k5XXNC5fiVxfIF0LswkyJDmMBx0WdOZZa+VDQdDJvZT3O5+BCd09mOGtJBrAQl7mCU
         2dfDVLpghr83/PIvmZLxYr3mDq52hs3x3J/HTrawTA4KMLlnJmwRPYKvmREADJh3MscU
         5V7xnr+D84SalaGvHEdSIWczDECue9tSR2xdoVdgeLfJd+pD2liOJJNmAh/FW78nyuVu
         yDzTBPBIS0QIXtoItYLfBnZwKS11KRTspa9yDeYHsHSa3JoI82A+EBxzUkBlyxTcOYgA
         cRhw==
X-Gm-Message-State: AFuF++mAy6rg8450z3uwZ+lNytQ1BgmPsSFa+YChD6x5yz30mhEV2pnd
	ywZ6OUYIL5ecENlDFTfuR47c0pMhQSn8HTjHMbLOuO7ChZjVdsDwQK1N
X-Gm-Gg: AYBFou09lvuof8jf+zKGApwKI+8tNqvfIrOANUzqv4jTfHa+X26Pns8m8huTyHMRFVs
	5mVYHCy9Jjy6poIkNNamYk8wGypTCGkHsckmKBLdSiKO6oV/Ov8grAdydOSw1KDZwRWuLyYFJ1C
	IBIxbJaaVtWHw2B20Q09pgPfHBfgBemnNr3lzhQ3PcNkQRHRAQH8/tbMhQBX7rBXtSPRM1WgUvf
	itisZL4pDGpP1duIulcvVvPtm1c83yoHY237xh2nJv2L2dnxo8XUG9tbe/m3AKizTk4Dr/ziVHF
	/FQyIM0lqotVBWWB6a0NlthIgVu/Vqp+wXbu9QQncSrRbM8h0iEp4R9Tn8Ct8HOZ4jO5kzWTGdu
	bBCMk6z0i/jEPurIu2HcyN0Wv7Kcu6xskg/Wujx+d6JSlEuWPl/B+oPp2T6hUokbRAjGwrnWlbG
	4Nqm1gw6u19lQultIkXOF7Hrp5rHoo7bYAR1jWG2btkrFSUbqBhrWzzgKCzL7kRzgXQL5NV0R3J
	EEInaQRP3t6+6qu1FAUZWOuEZC0
X-Received: by 2002:a17:902:e804:b0:2ce:9c48:22d3 with SMTP id d9443c01a7336-2d74df05f9cmr199834015ad.11.1787989663724;
        Sat, 29 Aug 2026 00:47:43 -0700 (PDT)
Received: from localhost.localdomain (vmi2317720.contaboserver.net. [84.247.152.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75986aea3sm12686395ad.52.2026.08.29.00.47.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 00:47:43 -0700 (PDT)
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
Subject: [RESEND RFC PATCH v2 06/13] mm/swap: remove swapon mutex and update proc reader
Date: Sat, 29 Aug 2026 15:47:35 +0800
Message-ID: <20260829-swap-pcp-priq-v2-resend-6-68d3d925578c@gmail.com>
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

Now that swapon_rwsem protects all swapon/swapoff-sensitive data,
the old swapon_mutex is redundant.  Remove it and convert the
/proc/swaps seq_file reader to use the rwsem instead.  Also convert
the swap_start iterator to use for_each_swap() for consistency.

Also adapt swap_next, it needs an explicit SWP_USED check. swap_file is
not reliably protected by swapon_rwsem, so checking SWP_USED is more
accurate and stable for filtering in-use devices.

Signed-off-by: Kairui Song <kasong@tencent.com>
Signed-off-by: Lian Wang (ProcessMission) <lianux.mm@gmail.com>
Tested-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 mm/swapfile.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 173375a7a215..6809c099eecc 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -140,9 +140,6 @@ static inline struct swap_info_struct *__swap_iter(int *i, unsigned long flag)
 
 static struct kmem_cache *swap_table_cachep;
 
-/* Protects si->swap_file for /proc/swaps usage */
-static DEFINE_MUTEX(swapon_mutex);
-
 static DECLARE_WAIT_QUEUE_HEAD(proc_poll_wait);
 /* Activity counter to indicate that a swapon or swapoff has occurred */
 static atomic_t proc_poll_event = ATOMIC_INIT(0);
@@ -3174,7 +3171,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	if (!(p->flags & SWP_SOLIDSTATE))
 		atomic_dec(&nr_rotate_swap);
 
-	mutex_lock(&swapon_mutex);
 	percpu_down_write(&swapon_rwsem);
 	spin_lock(&p->lock);
 	drain_mmlist();
@@ -3189,7 +3185,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	percpu_up_write(&swapon_rwsem);
 	arch_swap_invalidate_area(p->type);
 	zswap_swapoff(p->type);
-	mutex_unlock(&swapon_mutex);
 	kfree(p->global_cluster);
 	p->global_cluster = NULL;
 	free_swap_cluster_info(cluster_info, maxpages);
@@ -3235,20 +3230,18 @@ static __poll_t swaps_poll(struct file *file, poll_table *wait)
 	return EPOLLIN | EPOLLRDNORM;
 }
 
-/* iterator */
 static void *swap_start(struct seq_file *swap, loff_t *pos)
 {
 	struct swap_info_struct *si;
-	int type;
 	loff_t l = *pos;
 
-	mutex_lock(&swapon_mutex);
+	percpu_down_read(&swapon_rwsem);
 
 	if (!l)
 		return SEQ_START_TOKEN;
 
-	for (type = 0; (si = swap_type_to_info(type)); type++) {
-		if (!(si->swap_file))
+	for_each_swap(si) {
+		if (!si->swap_file)
 			continue;
 		if (!--l)
 			return si;
@@ -3269,7 +3262,7 @@ static void *swap_next(struct seq_file *swap, void *v, loff_t *pos)
 
 	++(*pos);
 	for (; (si = swap_type_to_info(type)); type++) {
-		if (!(si->swap_file))
+		if (!(si->flags & SWP_USED) || !(si->swap_file))
 			continue;
 		return si;
 	}
@@ -3279,7 +3272,7 @@ static void *swap_next(struct seq_file *swap, void *v, loff_t *pos)
 
 static void swap_stop(struct seq_file *swap, void *v)
 {
-	mutex_unlock(&swapon_mutex);
+	percpu_up_read(&swapon_rwsem);
 }
 
 static int swap_show(struct seq_file *swap, void *v)
@@ -3789,7 +3782,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		goto free_swap_zswap;
 	}
 
-	mutex_lock(&swapon_mutex);
 	prio = DEF_SWAP_PRIO;
 	if (swap_flags & SWAP_FLAG_PREFER)
 		prio = swap_flags & SWAP_FLAG_PRIO_MASK;
@@ -3815,7 +3807,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		(si->flags & SWP_AREA_DISCARD) ? "s" : "",
 		(si->flags & SWP_PAGE_DISCARD) ? "c" : "");
 
-	mutex_unlock(&swapon_mutex);
 	atomic_inc(&proc_poll_event);
 	wake_up_interruptible(&proc_poll_wait);
 
-- 
2.55.0

