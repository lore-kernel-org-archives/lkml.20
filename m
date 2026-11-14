Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667810;
	b=mCnvqMUMT3ncBz/YsajGbBankYWio2Lv52UXCDVuOIcq+CDRCIuJGMKO6WmW8gAlT8Io
	 aZjm9wwGVYLaZ38TB7XKZsCIct1VlQW5XgqI6U3An13sVrhy5a0UZNcNt3bdfBFlNFt7J
	 1NiQsB048YDQb2uWnZBq6rqN2Rl9Hg9v0lqN+ohfTUxDr/KKtIeLyoYVk4LcLG7oYtrAE
	 3y+87xqN7fQ93+Cyz03rHuTekLhHniXb9uHC89fRDDv+sA83Euxso8eU7Q9XN7TnVplEv
	 Cu4kkYqEYTqz5eHAKsFFAnYOm4p9w36TItHizy9+k8eKlMcBHmdhXkQubwBUOSjmSpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=61DsEOxba8skZR4p3LqyMSQOqgKdFaCOdElEjJjoWTU=;
	b=y9vUfnN6S9p5ftXTr35Ka2CsdCmyhpmEyOeKRQm07bWbJIe03304PJIVuOYWzZjcLcPv
	 SwTXRsGKprzRqzYH7/8Swk2oTbmxL0QiIN4H01pMgDxF5gN9vfL8d2aQ78+49ruWxGfRm
	 Cv8p4KFkJ4gSO69orJsHz7wraTV1aFQyFRzocLCC9l7Q/sngxg7nk3r6PfR9TDKwQmmJf
	 MxUdE8ejDZzOf81vyFmf637bqqWTjPtRp+drucIIz2w6yz/uID4SbkzyQXks507VClXyX
	 bFYWrAuixv6q7FDNPKTPe5+8KgMJEfnbgyVmQATNDLBOO3sZBp+kZ28fLBWaRjoun1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mUIL9BTl;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFA7606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDFA7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mUIL9BTl
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ee0533d249so7178735ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794667809; x=1795272609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=61DsEOxba8skZR4p3LqyMSQOqgKdFaCOdElEjJjoWTU=;
        b=mUIL9BTlS0dmocio5ZxOhki/8vWVly2KHdKU5Xvbut/jpOp67tuicY4D0n7O7ETNhG
         auwoHkEfp+aIDunNEeWKLhREVaIAnQFtHCFYA9zIW6V18wuzYNmrfYWehz2KyaAGVEc3
         mgUk2szJeScZtMW9EIdr21YPj6uV82B/Uj34tG98LCDpvkGxc1KfMsssStZOTqwc09Yw
         WQk4Rs5424BU8thGY5BSk12ODnfxfinS1PBgauZGf4SbNQJIkNND47fbPPAcBgNOzUzC
         RMGCiD0UVOvo2bLPABTPvMquC7de/e0Gu/CyV9SBfuO/dftkzykde9Gzm4ffFSBYgx6c
         GTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667809; x=1795272609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=61DsEOxba8skZR4p3LqyMSQOqgKdFaCOdElEjJjoWTU=;
        b=q6BcLUWEavVnWsLJB0eY6Hy3O58J876XbLIlQ9x2su/8X61Amf2+GgOyjC4FquFwg+
         KPVbLvqavDSuTn+3Bo5UWK+G2SRrCjdZYqxxgSg/KP6a61DM5zKpnm4Svj6DwuTYMMHO
         bJFQn4K8lI5kiPiNi+XScYIDrbVeockRl9oqOqYxrbA3LLuPoCz/FrJ7J/PFdqPZ1WYP
         sOX2vKu+xFHSQwCf3D07sA856P3TRu8ypHQQcgO8CjiZ6JqbEVTVvD+2vdY40IB5CGum
         /t2m7HnfOH4B2VF3Ca9fgMzJPLQfzcMCKUwH2sm9NUyiApMgudeiK2SosX2qw9MedqPD
         IluA==
X-Gm-Message-State: APuU4Z9IzQgVs1QSk6wxcRBFRXY6p16gW1D/EG/bligNoz/RnujdJTuz
	5NHw0+r5H5TxIDjl8OOJMTy72JShn9mZx48lgHShUw5OVZE+esmsL8Xa
X-Gm-Gg: AYBFou1AQNpOud3+EsSMC/6bnhZA/krE5K1mhOpvVcxU0l82PGffldr7mTDVOfVEREv
	VIZfQ3LsDt8y8c9CqQn1iGXqjulAmnPOIOlzAyP+AdGa9lMHu6wJ1UmFzDHp5sCS7+za8hjy6sy
	+JB3/DBH2VU93Ly5rIkKZWgKQKeT/DftCAy/a/5r1JS1MOJ1T6qLu2PSjC/G6MkjcNHjlMAQkAX
	rpm6gqAXDpFXmREHHOdcFHUv5mUp4NiCRelRQmKtSANtP42V+tnaxIZMELdlb60BxaIBA/2D++2
	JznSjkW1yxMb10LT47L+Z1rnCpGeobFoYBIsqHWwaw4KLlWLBgpeoV8SB5DziSan5jSLOlB5Xm4
	unBvvUXO81NO8JO+Htuf796+satIzM4Xf5R4/CsoqnCOiEocO8rQn31A3YjBdYKXDelyLYLfZRz
	8OYAyJTAySSP7kSISdYDBHT5jgzrUXgWL+nXb0H+eQ1P6zrGI/9/MLPISRC2/eJzuRyYiu+0+Fv
	shkoFXfSwuFmJDXIoQtRx4a9Lru/RP9CrJfTkpgMU2pAYtQhYjCg+DxXlJbYOMQBzo39LgYKhXV
	LruLFo9HO6dfj5p76gLl63zGDKFbf0OPHvbufXgyJpHnaJNn78RE+9doOF+zhq6qS4rsXIfJp1W
	mxeoB3toTGPsiLw==
X-Received: by 2002:a17:903:1904:b0:2e9:61bf:6587 with SMTP id d9443c01a7336-2ee0df758b3mr57253215ad.49.1794667809095;
        Sat, 14 Nov 2026 06:50:09 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa3ee33sm20913015ad.76.2026.11.14.06.49.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 06:50:08 -0800 (PST)
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
Subject: [RFC PATCH v4 06/18] mm/swap: serialize swap publication before removing swapon mutex
Date: Sat, 14 Nov 2026 22:49:54 +0800
Message-ID: <ed10255256780c856689549e65654f8b01d40c2e.1794666741.git.lianux.mm@gmail.com>
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

Move publication of swap_file, resurrection of the device reference and
the writable transition into one swapon_rwsem writer section. Split out
a writer-held enable helper so initial publication can share this
section, while failed swapoff can use the locking wrapper.

With file publication and teardown serialized by the writer, remove
swapon_mutex and use a topology reader across /proc/swaps iteration.
Keep the SWP_USED filter when advancing the swap_info array.

The publication boundary excludes proc readers from partially published
state and gives the lockless live-reference users initialized device
metadata before the device becomes an allocation candidate.

Signed-off-by: Kairui Song <kasong@tencent.com>
Co-developed-by: Lian Wang <lianux.mm@gmail.com>
Signed-off-by: Lian Wang <lianux.mm@gmail.com>
---
 mm/swapfile.c | 39 +++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index ae8421e18448..277a5c749987 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -139,9 +139,6 @@ static inline struct swap_info_struct *__swap_iter(int *i, unsigned long flag)
 
 static struct kmem_cache *swap_table_cachep;
 
-/* Protects si->swap_file for /proc/swaps usage */
-static DEFINE_MUTEX(swapon_mutex);
-
 static DECLARE_WAIT_QUEUE_HEAD(proc_poll_wait);
 /* Activity counter to indicate that a swapon or swapoff has occurred */
 static atomic_t proc_poll_event = ATOMIC_INIT(0);
@@ -3161,9 +3158,9 @@ static int setup_swap_extents(struct swap_info_struct *sis,
  * Mark a fully initialized swap device writable and expose it to the
  * allocator. The caller must have resurrected its percpu ref first.
  */
-static void swap_device_enable(struct swap_info_struct *si)
+static void __swap_device_enable(struct swap_info_struct *si)
 {
-	percpu_down_write(&swapon_rwsem);
+	lockdep_assert_held_write(&swapon_rwsem);
 	spin_lock(&si->lock);
 	spin_lock(&swap_avail_lock);
 	si->flags |= SWP_WRITEOK;
@@ -3173,11 +3170,16 @@ static void swap_device_enable(struct swap_info_struct *si)
 	atomic_long_add(si->pages, &nr_swap_pages);
 	total_swap_pages += si->pages;
 	plist_add(&si->list, &swap_active_head);
-	percpu_up_write(&swapon_rwsem);
-
 	add_to_avail_list(si);
 }
 
+static void swap_device_enable(struct swap_info_struct *si)
+{
+	percpu_down_write(&swapon_rwsem);
+	__swap_device_enable(si);
+	percpu_up_write(&swapon_rwsem);
+}
+
 static int swap_device_disable(struct address_space *mapping,
 			       struct swap_info_struct **swap_info)
 {
@@ -3340,7 +3342,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	if (!(p->flags & SWP_SOLIDSTATE))
 		atomic_dec(&nr_rotate_swap);
 
-	mutex_lock(&swapon_mutex);
 	percpu_down_write(&swapon_rwsem);
 	spin_lock(&p->lock);
 	drain_mmlist();
@@ -3355,7 +3356,6 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	percpu_up_write(&swapon_rwsem);
 	arch_swap_invalidate_area(p->type);
 	zswap_swapoff(p->type);
-	mutex_unlock(&swapon_mutex);
 	kfree(p->global_cluster);
 	p->global_cluster = NULL;
 	free_swap_cluster_info(cluster_info, maxpages);
@@ -3401,20 +3401,18 @@ static __poll_t swaps_poll(struct file *file, poll_table *wait)
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
@@ -3435,7 +3433,7 @@ static void *swap_next(struct seq_file *swap, void *v, loff_t *pos)
 
 	++(*pos);
 	for (; (si = swap_type_to_info(type)); type++) {
-		if (!(si->swap_file))
+		if (!(si->flags & SWP_USED) || !(si->swap_file))
 			continue;
 		return si;
 	}
@@ -3445,7 +3443,7 @@ static void *swap_next(struct seq_file *swap, void *v, loff_t *pos)
 
 static void swap_stop(struct seq_file *swap, void *v)
 {
-	mutex_unlock(&swapon_mutex);
+	percpu_up_read(&swapon_rwsem);
 }
 
 static int swap_show(struct seq_file *swap, void *v)
@@ -3958,7 +3956,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		goto free_swap_zswap;
 	}
 
-	mutex_lock(&swapon_mutex);
 	prio = DEF_SWAP_PRIO;
 	if (swap_flags & SWAP_FLAG_PREFER)
 		prio = swap_flags & SWAP_FLAG_PRIO_MASK;
@@ -3970,11 +3967,14 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 	si->prio = prio;
 	si->list.prio = -si->prio;
 	si->avail_list.prio = -si->prio;
+	/* Publish the file, live reference and writable state together. */
+	percpu_down_write(&swapon_rwsem);
 	si->swap_file = swap_file;
 
-	/* Sets SWP_WRITEOK, resurrect the percpu ref, expose the swap device */
+	/* Make the reference live before exposing the writable device. */
 	percpu_ref_resurrect(&si->users);
-	swap_device_enable(si);
+	__swap_device_enable(si);
+	percpu_up_write(&swapon_rwsem);
 
 	pr_info("Adding %uk swap on %s.  Priority:%d extents:%d across:%lluk %s%s%s%s\n",
 		K(si->pages), name->name, si->prio, nr_extents,
@@ -3984,7 +3984,6 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
 		(si->flags & SWP_AREA_DISCARD) ? "s" : "",
 		(si->flags & SWP_PAGE_DISCARD) ? "c" : "");
 
-	mutex_unlock(&swapon_mutex);
 	atomic_inc(&proc_poll_event);
 	wake_up_interruptible(&proc_poll_wait);
 
