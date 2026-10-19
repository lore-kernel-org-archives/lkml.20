Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A7B48F003
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395321; cv=none; b=dd+OnwFWXTYJEzgF4dzQSc5QeJep7+w8QAQwA1Ex4b6w7p/aCTz7LHkXQ/aL14QuZVjErPC0XX1eFYPZz1RjuKDrYDBdjPXLmiwnuBp8IKAx28y5hhZdGUcNgMZZpbJf6fmvbLGdWvzML3UGhFHlAG/80h0gsY0P6fXMkq4vO60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395321; c=relaxed/simple;
	bh=x8LEyfUNNjYVk0qmBHhBYMlxYVzf1DdyPySSnAX/yYY=;
	h=Message-ID:From:To:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=n8dtd6ZO3NuCfKGeZ6LzDLD7MHqWa6TaEe8GqXXF8CehUWSzDIyDQthLSu4BhBzuQA8TzseOtra8VFqwFJtE58vT00a0/mK2ySBIRFG0gvIfIxJR+rTJ7qcX6Ts9DzMzFif37gIcfYBBe1pJZ0vj36FuDclGN4t5nsP6dpko3nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=drrKxccq; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="drrKxccq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792395309; bh=sqLE7EMTs/Gy1swDex8mLgyvhnomKDF+BGCjrVjjvkA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=drrKxccqmwx2inetdTSpaYykOyH7GSblb2PbBcCJLoIzluo7AdBBKGSVLIuEb+y5n
	 Pj5niwL9hyS0jU9mlLSaCnkoJWOavBI5YZkLyjS5lu9eT8q36QJ7GYHb83GTJlnOqc
	 9YmHAeCCHWfK/uUA+q/GHoAhwKmYVVLaVdbL0K8c=
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 8B707E35; Mon, 19 Oct 2026 15:34:55 +0800
X-QQ-mid: xmsmtpt1792395305t2r8c1m9z
Message-ID: <tencent_E020A2DEC64A55CD801C9BAC30A4E94CF80A@qq.com>
X-QQ-XMAILINFO: N/tkE0oBJLbntSt2pA5cYJjIvdj1i8pYa4ABJYX7d5zidqHes4knGnIvWyiFkH
	 2PgcrSYqH2+bmsaH91fiCnryiBSYtEEulYM9fmPa9skaSZ5KOVpiW+PcOTmDrIb8fa7mXsXQiDPD
	 rnytRHeQmujPFf+R/UOnYCBvNghIFQliRE0/M1YqtXj4C+yLx+2yPE4v4m1/6AQc8cXqgCWdhmnY
	 Dagmv0AYFT34XVnW7rdSCDNP82Ypm65cUF/5KErf8yuBoJjCS8Oe7HT7wSzadGj3TCzQTHiVkYh3
	 GP2lYthOWpjXthrvMtXsrH9ZNn/un+8E8jFEhVdXqCAe07WIPx+HZKSYY6rtjX5BEYe8yzZE1KWB
	 9vUSul/Sp9gL4rqElOjQz6SVhuyfIi63FTbE5fJyfJmIMQCXXr+RrEIYVUVt1o9A2SHZKURJ/1lN
	 J9R58XCeBRKfxbdLGZXnIaKAWd+2O9c2nYvn0T9b3mXr0sRh8Iu582obfVPdagIwy3NO8NZIX/RP
	 zUOcArjuKbkfDGq/wPxHxzi8tRecQ0GFhTYADJkRVESv7Esvb7SZCt8UBl7grr2TAeLXvTLi7hRt
	 TzKiKFeXEG+epvCcv/D10TupQrKaPHHngUFzu+vzn3n3T3xh5MzIcoHbkpv3+MBOcOsOnKoosGgs
	 rW3pYGG4nVBBSr0AS0rNSutiRXsqPuL+Wp5Db3pUtLeY+yi6oshqQHBdH1WQBDBCcEbi3frRY7De
	 zsw9DB5SgyTq2L21JoZF1JDHCt8f/i+Vj/ELVXV1tYdz9NsWg3pu9azCIETBp3lh0NHSRoIYju1R
	 GiIPqU+Xh+da9nITi6yP6ezg6GzJCO+ASo7sRJIyg2IVFliALxYX+dG/+EI6dO5H2kKIsZmWLkYD
	 pRAQNITKc/TRumXqcB3SnxT9tmr1wPGWAL6Ll9RBTfJAf4PB7poiJwmXkIP5dyVqpQbiRtyfJ6GV
	 MYdfGDJiDAl7SPYGWxdCzbgTPiysq2F8L0RXgffrwAmp0YRJl5wdDP39gfwYVcOqrWkQCBx7s+BH
	 SYfD3Gn19EOkyONkLNPzh1o7GDPdJUOYcTtc77P3YhnKeLY1sW3EwbTU01jqQxghz2ZU6Nyq2Ciq
	 tvq9Bi
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Jinjie Ruan <2118537295@qq.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	reinette.chatre@intel.com,
	ruanjinjie@huawei.com,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 06/15] fs/resctrl: Unmount resctrl with the CDP state it was mounted with
Date: Mon, 19 Oct 2026 15:33:32 +0800
X-OQ-MSGID: <20261019073453.2142856-7-2118537295@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019073453.2142856-1-2118537295@qq.com>
References: <20261019073453.2142856-1-2118537295@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zeng Heng <zengheng4@huawei.com>

resctrl disables CDP before the control and monitor groups are torn down
on unmount. The architecture translates between CLOSID and PARTID using
the CDP state, so the RMIDs freed by rmdir_all_sub() and
resctrl_fs_teardown() are parsed with the wrong mapping. On arm64 the
RMID limbo handler can still be running, and a CLOSID left in the limbo
list is re-interpreted with the CDP state of the next mount. Enabling
CDP doubles the CLOSID on arm64, which can push the stale value out of
range and take an MPAM error interrupt.

Disable CDP after the groups have been torn down, so every CLOSID freed
on unmount is parsed with the CDP state it was allocated under. Return
the RMIDs still in limbo to the free list and stop the worker, so
nothing carries over to the next mount.

Cc: Tony Luck <tony.luck@intel.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Babu Moger <babu.moger@amd.com>
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v9->v10:
 - Use cancel_delayed_work_sync() with proper mutex handling
 - Add comment explaining the lock pattern
---
 fs/resctrl/rdtgroup.c | 46 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5dcbb0a964e8..40821cf07649 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3145,6 +3145,41 @@ static void resctrl_fs_teardown(void)
 	rdtgroup_destroy_root();
 }
 
+/*
+ * The RMID limbo handler keeps running after unmount. Any CLOSID still in
+ * limbo would be re-interpreted with the CDP state of the next mount. MPAM
+ * doubles CLOSID when CDP is enabled, which can push the stale value out of
+ * range. Force the limbo list back to the free list before the CLOSID state
+ * is torn down.
+ */
+static void rdt_flush_limbo(void)
+{
+	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	struct rdt_l3_mon_domain *d;
+
+	if (!IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
+		return;
+
+	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
+		return;
+
+	list_for_each_entry(d, &r->mon_domains, hdr.list) {
+		if (!has_busy_rmid(d))
+			continue;
+
+		/*
+		 * The limbo handler acquires rdtgroup_mutex. Release it
+		 * here to allow the handler to complete, then reacquire
+		 * to maintain lock ordering for __check_limbo().
+		 * This matches the pattern used in resctrl_offline_cpu().
+		 */
+		mutex_unlock(&rdtgroup_mutex);
+		cancel_delayed_work_sync(&d->cqm_limbo);
+		mutex_lock(&rdtgroup_mutex);
+		__check_limbo(d, true);
+	}
+}
+
 static void resctrl_unmount(void)
 {
 	struct rdt_resource *r;
@@ -3152,13 +3187,20 @@ static void resctrl_unmount(void)
 	cpus_read_lock();
 	mutex_lock(&rdtgroup_mutex);
 
-	rdt_disable_ctx();
-
 	/* Put everything back to default values. */
 	for_each_alloc_capable_rdt_resource(r)
 		resctrl_arch_reset_all_ctrls(r);
 
 	resctrl_fs_teardown();
+	rdt_flush_limbo();
+
+	/*
+	 * Clear the CDP state last. free_rmid() translates between CLOSID and
+	 * PARTID using the CDP state; clearing it first would make the
+	 * translation inconsistent for the RMIDs being torn down.
+	 */
+	rdt_disable_ctx();
+
 	if (resctrl_arch_alloc_capable())
 		resctrl_arch_disable_alloc();
 	if (resctrl_arch_mon_capable())
-- 
2.43.0

