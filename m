Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4D94F30C1
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167028; cv=none; b=cAfZk1Sr83P/iQJPpdrc3mWVfSTsu3fPJOX8a9QXAZNS3g2J9HV5uDq+uZqDThNqwKJ8fw99HPVEPPlpxSbWUf0EjxSNpYxZ440k9Ws1LIoq9jNuVOGTQFPPRXDexuxx7gWxXcPlmeipBM3Un0wcoYtCyvq1Mu/rQgTwXUYPh1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167028; c=relaxed/simple;
	bh=Z1cqtisYX6gOlcbJiiMBLdLFeDVcLISg5aP0QdLPLFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EOyp4WMmqTeRxPETHw5WxBLn/zKuD+TPCBwi2WI054zI0cPss+IQHNpBzdSUfKhv7o8ilDqRwBoGIZfpnA9rjFD8YnC/2JNmiNgC2Wsnh9hbzbUQlovgelcJtNeAZ2VwL6sr2SrM2wyO56cseH0PjFw0uxwo1JJ27jw5fexkXH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=B8f3itCi; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="B8f3itCi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=7Ne54ApzWtKcjZmsIH0xxINmhG2VcxhXAgHz6gJ0SdI=; b=B8f3itCi/Pi0gVLvfWlDPqImwg
	l6UMLH4ZkeRNnv6Q7cMEzYoT9nfa8O4lxhq8YlKgrJMyZDuT1bh751FFwGZU19whQhf54z9o8mMgW
	iva2zoDygswl8EmyeSSfcXZx00490erp8x8hX93nJUeFhfXBFE2nleMyZffv8IQpJ2/WMcm4UI0FX
	7M/OsE5QZ/kbNGNfzDSB1nvWcUUJDStgeQdcMl4ql5SJiw61g4K9jyY62HLil6z/rdvDjBAR80MVc
	rJKL6gncAKJhhan05tJMK7tSTjf4gKZ3VtX6ip9/s+YH1bvf8nRnxJkm3qwK4UPvPlfMQjwwibKCq
	J11QTzNw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xHkVZ-0065QZ-2U;
	Fri, 16 Oct 2026 16:10:14 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 16 Oct 2026 09:07:24 -0700
Subject: [PATCH] mm: kmemleak: scan modified objects as soon as they are
 grayed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-kmemleak-gray-drain-v1-1-3270256fdc8e@debian.org>
X-B4-Tracking: v=1; b=H4sIALtL0moC/yXMQQqDMBBA0avIrB1IxIbqVcRFaiZ2qkaZWGkR7
 95ol2/x/w6RhClCne0gtHHkOSToPIPuaUNPyC4ZClUYrfQNh4mmkeyAvdgvOrEc0Lu70kZ5V5U
 GUrkIef5c16b9O74fL+rWcwXH8QPfxje7dwAAAA==
X-Change-ID: 20261015-kmemleak-gray-drain-fd80160fd946
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=4234; i=leitao@debian.org;
 h=from:subject:message-id; bh=Z1cqtisYX6gOlcbJiiMBLdLFeDVcLISg5aP0QdLPLFs=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq0kxieXIBMRG2C8FoRD+dfhGLD59VRKYz1Wwx3
 kdsAEk1m9eJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCatJMYgAKCRA1o5Of/Hh3
 bTvED/wJr0gBmtXSoX7kSl0kTe3SR1UmPv3y0OCX3Nfb9KG2dUT6w8jCOZG5+USu4Uuln8i9+Bw
 0AEIZOym4nJXAOI5OKzWLfw2eMfqZmbrpuVpkKyhtfqreotlPuDwZMKjK5n5ZSV5Cxww4jhI7Ke
 7okmbfnlJvg4taMIEFmYMRwBkrPRvJcaqoH+gPqy3G89Jffb7u/2JQb2pzK+2qyQZUKe5NyYnGW
 0uuzsuPzxRB50LHrG0mSYta/q5GHqp/eCj3sevdeUhrYicKVC2pHkGxK/0eYEXe3MZM08g0I7O6
 GYzmPyeOw4Ok57mQFr7JZVGoFq0E67gGViOsbcIqDJFj651KE5cfuijyluIugyxgRXzsz0ofba8
 DmjkeNY62XdR9ilqAeCs1UbEkx0OYFXW6bMPlMRJDJP1nw3Lyx54D4aLaZdCYt/uOEJMx7TGy11
 Vni8bc7b/G/wD3gp0aM6zuJsSe2hP4BJXBoDjoNfsRcU9gYW1JlAFBoB0Ni2oFBuk1UJ7oneajp
 4MUg+l8kextpUOdH0FxschMStFSQz5tC6Kwl8yrw3KJegqSatgbWvK74Bq3ee5XHVx9oLkMZh3d
 nmaHNJQHUJf3DyLL5kiJ4Xl9/XwwnexchWNeiJQCCiR9hvGg31N1rmFjg1xsVVVi05wD+5W2p2m
 qZWlaYB0lDXgxRw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

kmemleak keeps reporting the guard page of a systemd-journald thread
stack on Meta's debug kernels, even with min_unref_scans set:

  unreferenced object 0xffff88829a30ae40 (size 256):
    comm "systemd-journal", pid 961, jiffies 4294814590
    backtrace (crc 49b3881c):
      kmem_cache_alloc_noprof+0x2ee/0x630
      vm_area_dup+0x36/0x750
      __split_vma+0xef/0x7d0
      vma_modify+0x11c3/0x18a0
      vma_modify_flags+0x1ea/0x2a0
      mprotect_fixup+0x249/0x630
      do_mprotect_pkey+0x531/0x820
      __x64_sys_mprotect+0x7c/0x90

The VMA is still mapped. It was never faulted in, so it has no anon_vma
and no file, and the only pointer to it is a slot in a maple tree leaf.
The mm tree runs in RCU mode: every write replaces the leaf with a copy
and frees the old one after a grace period. journald rewrites its tree
every couple of seconds, while a scan on a large debug host takes many
minutes, so the leaf kmemleak queued is freed before its turn, and the
copy that replaced it was linked after its parent had been scanned.

The pass over modified objects is meant to catch such moved references,
and the new leaf, being a new white object, does get grayed there.

But the gray list is only scanned after the whole object_list walk, and
by then that copy has been replaced and freed as well. The confirmation
scan has no such pass, so the miss repeats round after round no matter
how many consecutive scans are required.

Scan the gray list as soon as an object is grayed, from
kmemleak_cond_resched(), which already pins the current object while the
RCU read lock is dropped. The live leaf is then read right after the
walk reaches it, before it can be freed.

I was able to come up with a reproducer that reproduce these false
positives most of the time:

https://github.com/leitao/linux/commit/1291579c487303c5ffbea2cf532649d26329c8a9

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/kmemleak.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 8fa409a4f9fb26..6e12bcd95312d2 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -1696,8 +1696,10 @@ static void scan_gray_list(void)
  * Conditionally call resched() in an object iteration loop while making sure
  * that the given object won't go away without RCU read lock by performing a
  * get_object() if necessaary.
+ * If @scan_gray is set, also scan the gray list while the RCU lock is dropped.
  */
-static void kmemleak_cond_resched(struct kmemleak_object *object)
+static void kmemleak_cond_resched(struct kmemleak_object *object,
+				  bool scan_gray)
 {
 	if (!get_object(object))
 		return;	/* Try next object */
@@ -1709,6 +1711,8 @@ static void kmemleak_cond_resched(struct kmemleak_object *object)
 	raw_spin_unlock_irq(&kmemleak_lock);
 
 	rcu_read_unlock();
+	if (scan_gray)
+		scan_gray_list();
 	cond_resched_tasks_rcu_qs();
 	rcu_read_lock();
 
@@ -1910,7 +1914,7 @@ static int __kmemleak_scan(bool full)
 		raw_spin_unlock_irq(&object->lock);
 
 		if (need_resched())
-			kmemleak_cond_resched(object);
+			kmemleak_cond_resched(object, false);
 	}
 	rcu_read_unlock();
 
@@ -1981,8 +1985,13 @@ static int __kmemleak_scan(bool full)
 	 */
 	rcu_read_lock();
 	list_for_each_entry_rcu(object, &object_list, object_list) {
-		if (need_resched())
-			kmemleak_cond_resched(object);
+		/*
+		 * Scan newly grayed objects now, not after the walk: one may
+		 * hold the only reference to another and be freed by then,
+		 * like a maple tree node that keeps being replaced.
+		 */
+		if (need_resched() || !list_empty(&gray_list))
+			kmemleak_cond_resched(object, true);
 
 		/*
 		 * This is racy but we can save the overhead of lock/unlock
@@ -2082,7 +2091,7 @@ static void kmemleak_scan(void)
 		bool dedup_print;
 
 		if (need_resched())
-			kmemleak_cond_resched(object);
+			kmemleak_cond_resched(object, false);
 
 		/*
 		 * This is racy but we can save the overhead of lock/unlock

---
base-commit: 587858367581b9c55c3690f4e63382ad622719d4
change-id: 20261015-kmemleak-gray-drain-fd80160fd946

Best regards,
--  
Breno Leitao <leitao@debian.org>

