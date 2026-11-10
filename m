Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323389;
	b=ClffVOPHesZtZmLL0P3+ZeAUqilm12R1jXd6PfsNUyWoLz0AZImeLWgL95iJerB4N05y
	 NKRXzPzFaoEoBKt4kGB7AtdbEZZtbsPp+V9oVxpNqH1trKLLeHTVtApxK6qxz6B2DYKVs
	 E2HlLqrzDxe/jWleryWXHHqdlY+7DsZUdLf+FjkpzEUPtHA1v4DVpQ6vfN53WMIEWz9KP
	 xoHJKpQdw228csGQ6kRITkBl0EeeAgZVT6S5u+jDn9EoG+Ra/DYpGcTbgm8wG5tjik7gv
	 e2YsSJ1lKpihXkZ2NE1cDrObhxof/axfas7R1ayH57JZuR44fBeLyV9fbzztioQ/zPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RYs2hSwn8nYjE7NjLz5FT3KJmBw5ONd9purncIQHNZ8=;
	b=hGKgFmTlyhXmHDQYxv7kAlNF0oJdlyzpBPyWjQ90cCqbGTUKEo7jMsBQGK/tu/mglUDB
	 rQT6QKZ2ZL1IYjOnMVczALTElnWUsTqmcfKE8prUaCzuNoOJh/3md8zGCODz4rxo3Iev+
	 VUb7oceQ0hO2gzolawKAGkfwWAQ85JUqMsi549uFTBJcTZClKVqVU/bA8YRmUP5p5pXSU
	 5xtJAG1FU/PKY8/zxavlGz0WKpiE3HzbXHehWzzi+/NapDxKRw1g+juIUV+Oid36UMVzX
	 9Y5g5Iwy1iLW5JeNgYLxxlS/xl9nEQaZl42Cbz2HaDqyNr9TxpJPZPIf0/HbSEonotw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SrJ5RiG0;
	arc=none smtp.remote-ip=74.125.224.136
Received: from mail-yx2-f8.google.com (mail-yx2-f8.google.com [74.125.224.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72D7606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D72D7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SrJ5RiG0
Received: by mail-yx2-f8.google.com with SMTP id 00721157ae682-8b366548461so7714337b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323388; x=1794928188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYs2hSwn8nYjE7NjLz5FT3KJmBw5ONd9purncIQHNZ8=;
        b=SrJ5RiG0ULTyDT0WBwweENuPWz6WzTROfD+dPQGt/xomU3IX5Xml4GIrMKgumaK2gu
         pZwSe/RACygM70GGSQ9yD8aPsCywYBxqChwTKg5NxVIWSn0Aga9enS4tlLYnYhdMhcUz
         IYH5TQEpnSu4sOhkhbPksrnjDm1efRX5wFwbVQPCvkQIRX/WAh9NKcW+QVJKImFQj/iw
         8lzguli+zKnNDBded32fLOBFRRkUu1LhOrivUIOuv1+xp5ScmN3fa6IkEx4ekw/f73lm
         wg1qt0onDhLRxKSsACto4OGDA0ZPQFhNkz83DyhoXceP1zo+VS9D3biz8GsPv1E82GO9
         y+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323388; x=1794928188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RYs2hSwn8nYjE7NjLz5FT3KJmBw5ONd9purncIQHNZ8=;
        b=qMENTCHeXyInihzISpkiei0nFtPUvIauPYzoU5IhrHq/PJS0iVUBW5DoupVm22ouCT
         5LsNsTs2a0J8JMEY6OtVLd/vVQC8XPB1bjxVuw1jV/E2Jywmh9EURJn5Xl5H+W5QLdEd
         FYDkLMG58GspasU+Ju0dg5Y4EoxFWM0oAod3qlYtr6xYgqSsQE/fd36oUTG8LzrpCY0r
         cCt2gbS4u67azCkS3v0xfICoD8soXziuQG48JlgLmzv0lM8rZf40/weRGat4yJS0nWpV
         JBFq3w0bmEfQewpR6A+gFUqAs6HWQLbNwPH1Tj2PEXFdStkIPJc/jC3vrI+wGD+13MCZ
         hxtg==
X-Forwarded-Encrypted: i=1; AL+hErECo5YBiK7E6OVe0w5INeH1Nr54HZgZz1jM1lmuiK1hPk1OErSI0pxmX/LP95XraLJejmM3+Ijx2AoNpko=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FeHqHB+Ogcxr9HpVVJpJe1rPhaPhBI5MLLxW4p5vCo5xu7cuJ
	gb64b0tQTRGWyptBWZzoCgQ/ADBDLxcyEkW76lOHMx1tHDDzt+fyHY4AftlKV2VO
X-Gm-Gg: AYBFou0tPGWzCf4BAFfWScM8KD9z2cnF3VsDmmgzJPZWkS5qQEcofZsb/XX3kX3NYQR
	l01EcUKgABnczmclfH4UhHdID5sC8Dak17uLQw+0L6PeGBpLggznVCZLpd7wtU2LdX0hqKAXIC4
	XTZIBx+U9UB/y+r9NfUibFXHqUZ6/NmEeA/1g1KC3H+EhmMN91r7J4rOyM9n8U+111RmioaNiVy
	PGPST+PYj+wu6MxxW1gTzKr/yxRDg1nvwxSpvsvUaegcr13QgPmGLfmHT2HZcJQ+3g4RWqb6mJw
	yVD/leZmKCGAUHJjAylTmaL7eh/THCvMRfpnutqBSK2Cqq2KIY6zztlOhJOVi/VV/9qoM/Xsrnm
	ySDDq4hHkJtNOOPMMGoWN8lOvC5ysaaUP9j2y3QqYT5vPiTanzqq5pm0W6jp1fkvvwCNyDhBYO2
	b5o34tf0FRQHr9vspkJ3NwXRHfWhQxJ70PIzZJ9axrLlXR0DiP5ZIKVvCc578UesbLzDslttIN4
	sW5cXb0TvP2lOoLc8nBwuGcJZjepxm3ULvJG1vpglWA3u4dwKtGNWHEnXcTl6RgBGeDOr74mw6i
	fx5ClbUuLy7VJ+i5EF4xUhGg97LbeVACuPQ1uSF6UGpJtIGL8EsVrY2X2ikw/mexgljQTf5lN59
	PDf2RPLCT
X-Received: by 2002:a17:902:e751:b0:2dd:c053:a6ee with SMTP id d9443c01a7336-2edb9260ab0mr26092925ad.32.1794316893463;
        Tue, 10 Nov 2026 05:21:33 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:21:32 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [PATCH v5 2/7] fs/resctrl: Do not allocate a monitor context when releasing limbo RMIDs
Date: Tue, 10 Nov 2026 21:20:49 +0800
Message-ID: <20261110132054.3702-3-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110132054.3702-1-ruanjinjie01@gmail.com>
References: <20261110132054.3702-1-ruanjinjie01@gmail.com>
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

Busy RMIDs of a monitor domain are normally released by the limbo
handler once their cache occupancy drops below the threshold. When a
domain goes offline, its busy RMIDs are released without checking
occupancy, since the domain is going away and the RMIDs would otherwise
never return to the free list.

On the monitor domain offline path, __check_limbo() allocates the
monitor context that an occupancy check needs before it scans the busy
RMIDs, but without using it, and returns early when that allocation
fails. Then the caller destroys the domain's monitoring state, including
the bitmap that records which RMIDs are busy, so nothing can clear those
bits afterwards and the busy counts never reach zero. Those RMIDs never
return to the free list and, where the RMID depends on the CLOSID, the
dirty count of their CLOSID never decreases. The allocation can also
wait for a monitor to become free, which stalls the CPU offline path on
a context that is not going to be used.

Only MPAM systems are affected. An architecture that can always read an
RMID allocates nothing for the monitor context, so the allocation can
neither fail nor wait there.

Move the release of busy RMIDs into a separate function that does not
take a monitor context and leave the occupancy check to __check_limbo().

Fixes: e557999f80a5 ("x86/resctrl: Allow arch to allocate memory needed in resctrl_arch_rmid_read()")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Cc: James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>
Cc: <stable@vger.kernel.org> # 7.1.x
---
 fs/resctrl/internal.h |  2 +-
 fs/resctrl/monitor.c  | 72 ++++++++++++++++++++++++++++---------------
 fs/resctrl/rdtgroup.c |  2 +-
 3 files changed, 49 insertions(+), 27 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index e62a277dee85..1c85e06f09bf 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -405,7 +405,7 @@ void cqm_handle_limbo(struct work_struct *work);
 
 bool has_busy_rmid(struct rdt_l3_mon_domain *d);
 
-void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free);
+void release_limbo_rmids(struct rdt_l3_mon_domain *d);
 
 void resctrl_file_fflags_init(const char *config, unsigned long fflags);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index b8f4e1ff4083..ae9ddd380515 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -124,21 +124,45 @@ static void limbo_release_entry(struct rmid_entry *entry)
 		closid_num_dirty_rmid[entry->closid]--;
 }
 
+/*
+ * Release the RMIDs that are marked as busy for this domain without
+ * checking their LLC occupancy. Cache lines may still be tagged with
+ * these RMIDs and will be accounted to the next user of each RMID.
+ */
+void release_limbo_rmids(struct rdt_l3_mon_domain *d)
+{
+	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
+	struct rmid_entry *entry;
+	u32 idx, cur_idx = 1;
+
+	for (;;) {
+		idx = find_next_bit(d->rmid_busy_llc, idx_limit, cur_idx);
+		if (idx >= idx_limit)
+			break;
+
+		entry = __rmid_entry(idx);
+		clear_bit(idx, d->rmid_busy_llc);
+		if (!--entry->busy)
+			limbo_release_entry(entry);
+		cur_idx = idx + 1;
+	}
+}
+
 /*
  * Check the RMIDs that are marked as busy for this domain. If the
  * reported LLC occupancy is below the threshold clear the busy bit and
  * decrement the count. If the busy count gets to zero on an RMID, we
  * free the RMID
  */
-void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
+static void __check_limbo(struct rdt_l3_mon_domain *d)
 {
 	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
 	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
 	struct rmid_entry *entry;
-	bool rmid_dirty = true;
 	u32 idx, cur_idx = 1;
 	void *arch_mon_ctx;
 	void *arch_priv;
+	bool rmid_dirty;
 	u64 val = 0;
 
 	arch_priv = mon_event_all[QOS_L3_OCCUP_EVENT_ID].arch_priv;
@@ -161,30 +185,28 @@ void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
 			break;
 
 		entry = __rmid_entry(idx);
-		if (!force_free) {
-			if (resctrl_arch_rmid_read(r, &d->hdr, entry->closid,
-						   entry->rmid, QOS_L3_OCCUP_EVENT_ID,
-						   arch_priv, &val, arch_mon_ctx)) {
-				rmid_dirty = true;
-			} else {
-				rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
-
-				/*
-				 * x86's CLOSID and RMID are independent numbers,
-				 * so the entry's CLOSID is an empty CLOSID
-				 * (X86_RESCTRL_EMPTY_CLOSID). On Arm the RMID
-				 * (PMG) extends the CLOSID (PARTID) space with
-				 * bits that aren't used to select the configuration.
-				 * It is thus necessary to track both CLOSID and
-				 * RMID because there may be dependencies between
-				 * them on some architectures.
-				 */
-				trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid,
-							      d->hdr.id, val);
-			}
+		if (resctrl_arch_rmid_read(r, &d->hdr, entry->closid,
+					   entry->rmid, QOS_L3_OCCUP_EVENT_ID,
+					   arch_priv, &val, arch_mon_ctx)) {
+			rmid_dirty = true;
+		} else {
+			rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
+
+			/*
+			 * x86's CLOSID and RMID are independent numbers,
+			 * so the entry's CLOSID is an empty CLOSID
+			 * (X86_RESCTRL_EMPTY_CLOSID). On Arm the RMID
+			 * (PMG) extends the CLOSID (PARTID) space with
+			 * bits that aren't used to select the configuration.
+			 * It is thus necessary to track both CLOSID and
+			 * RMID because there may be dependencies between
+			 * them on some architectures.
+			 */
+			trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid,
+						      d->hdr.id, val);
 		}
 
-		if (force_free || !rmid_dirty) {
+		if (!rmid_dirty) {
 			clear_bit(idx, d->rmid_busy_llc);
 			if (!--entry->busy)
 				limbo_release_entry(entry);
@@ -843,7 +865,7 @@ void cqm_handle_limbo(struct work_struct *work)
 	if (cpumask_empty(&d->hdr.cpu_mask))
 		goto out_unlock;
 
-	__check_limbo(d, false);
+	__check_limbo(d);
 
 	if (has_busy_rmid(d)) {
 		d->cqm_work_cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask,
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 57ab090072c2..5d0351453c2f 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4590,7 +4590,7 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *h
 		 * the RMID as busy creates RMID leaks if the
 		 * package never comes back.
 		 */
-		__check_limbo(d, true);
+		release_limbo_rmids(d);
 	}
 
 	domain_destroy_l3_mon_state(d);
-- 
2.43.0

