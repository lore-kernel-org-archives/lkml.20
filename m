Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230811;
	b=rMhkHOjSZF6te12HfHThOjmhW7F2681ehWC9oggpa1WzUzzFs4bcuT+am4g6nxSl5qFM
	 /2o0ZRIyTeBQTbIYPwE7XVAmuG0CyZOzmBGrMflDw9U1UIVKPUJLTjNnFyhUCdH7E33oe
	 W3Fb9Y4bYtvpsm5fXCLBb8qOC+EsY15tGKsEH8hqzDmgMMR3YCuTscdJgH25ujkB2xeBP
	 1W+lwjob23E9as5sHNNrvmerjxyf635FKzBNcP+at9x1ZL4B9eN2MirBmX1Jg8QmnDoTL
	 GshTXpefsyUiv+T/kYSZwpuSRl7L59ND8ag5dh5SUjcHj/PuLNUIQ/lY6WaciYAE1jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Mc6ORBvaJXkIqHPJBuJecDTVyV5lInOmdqCj61j+210=;
	b=O4qbwmISnRDthDqrkZyRKFZ3NVAq0VmUVCrbnGrgRvpbs2bsL+iE+zJGGVZELDMgNiqj
	 MC9MZq+X/Fp80TH7GzRkESzVqM/jRg/TibWWNfHVIemt/4rwgYLJFX56BalPpa5y9vqkX
	 ocz/9ury3bg3IVLMYWQMs0+hAw8XQo/A59lC0AjwPaHfQYB6rDYyaonqvNaGph9F6LRHV
	 /AHkFh+/YRAwPAH4hVSJXwfuoDM1WNsos8OEeqKTbQJY0TEz3HhC8PMON6uGTgblU/YC8
	 kCweobxOrVX+RBe11jFFsr41M5axc2ycsCp7af+FZUfqFBm8aBI6pmNxd+LKxdOHcQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zzN7jmUj;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A43606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A43606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zzN7jmUj
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so445841a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230810; x=1794835610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mc6ORBvaJXkIqHPJBuJecDTVyV5lInOmdqCj61j+210=;
        b=zzN7jmUjoC33r29rX5m/xdfS+/JJsKbfBYsMgO9uDQ+XWLo4/bjJ3uT5c9C+P1Ng4N
         ttD5deI7d/vIodSh0E9UUAVAHPFT+HALGci2VTEb/BeLOoMocwf2+3LaKQwTeLRcrq8o
         l0aIKRWwawl9jGsSAaYyMGdg7BG73mlNX5hgBKJbK/siZaqKkq2IRKb2jDv6B0Gdx2BL
         7DNkzjHfBnGxhc5GtpHAZl064tAQdrcqHjXY7lTkcvZgervV6UeXdBxnLR9Rns1p5zkH
         HzXcC+McclI/1pMcvAiVcKVLy4CCz5sbYjk6GrAk5uGr7jBYJKA7S+b0nm/6J46UCeQb
         yNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230810; x=1794835610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mc6ORBvaJXkIqHPJBuJecDTVyV5lInOmdqCj61j+210=;
        b=dBIlLkbwgU7+JDBjWMd8dY73pZZ00xQloYbEwwJF0A9o1nCAI5n/xYZ1EASExkqiBh
         ZEnzBjFgnVXcarMh7i+spbKh3ERAHpG6iHsvAIzgfL1U3eMQGgGbt0G5TpjyHneB57ie
         sscC3G4e1Wy9mqGffcIatBs9Kw70M2zCxWVzxVIXZaQx3DUC2AhtrPChyQt9zTPgsRUk
         t/3RozNRaREBaYZ3ws8Y4qPWnCm8c6IZdHibdgUDbDlJT5TyxZWLHFv/1yM9NnR7JncN
         A9YOZo1QDHX3eIa7CNRe9vJj0msKYGKOdCDj3/2qg3b/xc3PLJhBFtOlIAesSWO9V1eM
         RSiQ==
X-Forwarded-Encrypted: i=1; AL+hErEufM6RFLFqFSOEQK9v/Cc4H1Iw04ObgRHYoPuQkrd/fdvx50XLs/AIuo8bVKcaUFqAogS45siwHcdu1/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VkcdgtQfukutz4tscC7iSFIFoRbNcoIBkdzmrKYpDHZaenR35
	gpDIug8sWRYsz65bIejTgjIu4JCxa328kubHIEqKoLCH1ROqu8dJ8WYv
X-Gm-Gg: AYBFou0Rfp6sH6ef6FhQlzwqcURJtHudENysCMg/gdJIUttGG8A/LgPY7LBPIMO34hx
	MRxXUw+ytYbh0snNjHYsPRITLpl8T+4FWwqaFdia5JSQsKyWTtD9gc4ovvgvlh+DKc2AEIInsyB
	gk+2yO3tRZDQDF9uU4ZpM8fv7DvW0p47rNnwSdCK6IlESPA3slkx9QFIyHw13tGrNNXuRbA+eDJ
	EbLe4vW8tKc1wELSU3pUwaaz8y5pg6bQ8MzNnxamtIQ/Pa2PPVcJ4khbduwZHb5qLBNhEwkzbu4
	ds8T7uKxiKkxDKGAWRiXWKz80s9A2/BgsFl20JXIK+qd+BTMNmB+Cj+3aUs08EGhHPcDDm2927n
	scB0QzpTOBIzqNV9x4G18JnjbgEPi3+C5g6KyC8BzeZZBp9gR/zdsHVOcMNWy3AxML6R/ZE9YFX
	gyBTfQWZ2967DAn3CBbTkmP0MLzVbSFrUvJJOseLD563PvJ07RRWfeWCS7wte8pubiCvA5PtEWA
	VnYZ6r6QCyblT70CiLfJE0geZFlhHaEm0fcHECLe1V5ejhSOBYBgo+nYdA8Ib51w2vn6W3EYpix
	2kSZY6RQfQYEDKBxetathdgtz/cZv1Mjoj3U+b1Gc1tC+TgB+gcNJ4E5KsihFaA=
X-Received: by 2002:a17:90b:586c:b0:3ac:9669:8461 with SMTP id 98e67ed59e1d1-3b1067af4b3mr4721850a91.15.1794230810060;
        Mon, 09 Nov 2026 05:26:50 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:26:49 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	james.morse@arm.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tony.luck@intel.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [RFC PATCH 3/6] fs/resctrl: Take the CPU hotplug lock for software controller updates
Date: Mon,  9 Nov 2026 21:26:18 +0800
Message-ID: <20261109132621.3862497-4-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
References: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
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

update_mba_bw() runs from the MBM overflow worker and calls the
architecture to read and write the control of the domain of its CPU,
under the RCU read lock.

Writing the control can sleep: MPAM uses smp_call_on_cpu() and waits
for a CPU that reaches the MSC, so that CPU must stay online. The
hotplug lock cannot be taken after rdtgroup_mutex, because the offline
path takes the hotplug lock first, and sleeping in the RCU read-side
section is invalid.

Take the hotplug lock with cpus_read_trylock() before rdtgroup_mutex.
Skip a round when it is not available; a blocking lock would deadlock
against the offline path, which holds the write lock while it drains
this worker. With the lock held the control domain cannot be removed,
so drop the RCU read lock. Where the update does not sleep, a round is
only skipped while hotplug runs.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 fs/resctrl/monitor.c  | 28 +++++++++++++++++++---------
 fs/resctrl/rdtgroup.c |  8 +++++---
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 2319e8e619bd..76990bb80ee9 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -640,19 +640,18 @@ void mon_event_count(void *info)
 /*
  * Find the software controller's ctrl domain that contains @cpu on resource @r.
  *
- * Only called from the mbm_over worker via update_mba_bw() where the returned
- * domain is kept alive by cancel_delayed_work_sync() in
- * resctrl_offline_ctrl_domain(). This drains this worker and then waits on
- * rdtgroup_mutex held here before the architecture can free the ctrl domain.
+ * Only called from the mbm_over worker via update_mba_bw(), which holds the
+ * CPU hotplug lock so the domain cannot be removed while it is being used.
  *
- * Context: Call from RCU read-side critical section.
+ * Context: Call with the CPU hotplug lock held.
  */
 static struct rdt_ctrl_domain *get_sc_ctrl_domain_from_cpu(int cpu,
 							   struct rdt_resource *r)
 {
 	struct rdt_ctrl_domain *d;
 
-	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list) {
+	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list,
+				lockdep_is_cpus_held()) {
 		/* Find the domain that contains this CPU */
 		if (cpumask_test_cpu(cpu, &d->hdr.cpu_mask))
 			return d;
@@ -713,7 +712,8 @@ static void update_mba_bw(struct rdtgroup *rgrp, struct rdt_l3_mon_domain *dom_m
 	if (WARN_ON_ONCE(!pmbm_data))
 		return;
 
-	guard(rcu)();
+	lockdep_assert_cpus_held();
+
 	dom_mba = get_sc_ctrl_domain_from_cpu(smp_processor_id(), r_mba);
 	if (!dom_mba) {
 		pr_warn_once("Failure to get domain for MBA update\n");
@@ -882,11 +882,19 @@ void mbm_handle_overflow(struct work_struct *work)
 	struct rdt_l3_mon_domain *d;
 	struct list_head *head;
 	struct rdt_resource *r;
+	bool cpus_read_locked = false;
 
 	/*
-	 * Safe to run without CPU hotplug lock. Work is guaranteed to be
+	 * Reading counters is safe without the CPU hotplug lock: the work is
 	 * canceled before the domain structure is removed.
+	 *
+	 * Programming the control can sleep and may need the hotplug lock,
+	 * which cannot be taken after rdtgroup_mutex. Try it first; if
+	 * hotplug is in progress skip the update and retry next round.
 	 */
+	if (is_mba_sc(NULL))
+		cpus_read_locked = cpus_read_trylock();
+
 	mutex_lock(&rdtgroup_mutex);
 
 	/*
@@ -921,7 +929,7 @@ void mbm_handle_overflow(struct work_struct *work)
 		list_for_each_entry(crgrp, head, mon.crdtgrp_list)
 			mbm_update(r, d, crgrp);
 
-		if (is_mba_sc(NULL))
+		if (is_mba_sc(NULL) && cpus_read_locked)
 			update_mba_bw(prgrp, d);
 	}
 
@@ -935,6 +943,8 @@ void mbm_handle_overflow(struct work_struct *work)
 
 out_unlock:
 	mutex_unlock(&rdtgroup_mutex);
+	if (cpus_read_locked)
+		cpus_read_unlock();
 }
 
 /**
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 57ab090072c2..b32831871f70 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4519,9 +4519,11 @@ void resctrl_offline_ctrl_domain(struct rdt_resource *r, struct rdt_ctrl_domain
 	 * no new worker iteration can find it; drain any worker that already
 	 * holds a pointer to it before the architecture frees the domain.
 	 *
-	 * Software controller is enabled/disabled on mount/unmount with
-	 * cpus_read_lock() held. Running here with cpus_write_lock() so
-	 * there are no concurrent changes to software controller status.
+	 * The overflow worker holds the CPU hotplug read lock around its
+	 * software controller updates, and mount/unmount enable/disable the
+	 * software controller with the read lock held. Running here with
+	 * cpus_write_lock() means there are no in-flight software controller
+	 * updates and no concurrent change of the software controller status.
 	 */
 	if (r->rid == RDT_RESOURCE_MBA && is_mba_sc(r)) {
 		struct rdt_resource *l3 = resctrl_arch_get_resource(RDT_RESOURCE_L3);
-- 
2.43.0

