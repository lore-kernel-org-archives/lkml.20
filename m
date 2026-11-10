Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316911;
	b=AafhXL5ho1PmjUiir/jpPCzl0QvCHitxusd4N/luAmo0cO6ShACDmXx0jLFzq8GHnuOF
	 FkitUmYHWFJ/l3URdEg9n5fl9z+b0PHBm7k3Qth/mHbOPbxS7RhFAnDe+OSKIECpmxxU8
	 q5QNIcZW5WbLqJWrF55+fVD2HOtS/TV1jAwkhW7rP2cWavhpOqufDfgNBwkndDx3fjEih
	 yC4x8nZGSent/sUKIDER023ADl0bIYhyx00JVVTu2MC6J2wBkvLRVDQzUynjXzEldHgHa
	 o0Q748aj3QMcvl+0aPKYo/y2hMfeMxhmhLIZkD02kSQlrj6EZlwFnVXKrQJmsVRig2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316911;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OTx52hVUF9lB6fufKA+RTnJSg0CR3TeUfaD+GwbgFjg=;
	b=my5BeY7xfItqApApYXgtr2dFfmGvLGqTqjyEkwRExdGJZPEYbyBHv5zbxnMGBsrw2IUl
	 VE6iSnvWtWIwJW/O2VphQQyQZ5SMIVbORJlQEAsmrqTjavxXKy6FLxwSbYhF61sIKYnti
	 RAS1OlFUe/aLAGtuggD9Ue8y6kf3k26EANFtu0tedfYPZyfaJ0JI4rKO73n2ukMjytf76
	 2OxjFMsLaJpwj1UMVTJA9nBWCZjDbVAv4svY2djBeyVx1GxxIX8haURx0WuFR8s4ADlqD
	 KhScoaMmDvJ11r8L+pI1nBR5iF4uda+g/n4l7E2epViiVsmr3YeeDBivbJ4p6Nk2T3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bwwQv6k4;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D4E606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D4E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bwwQv6k4
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e95bd1c14cso17877035ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316910; x=1794921710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTx52hVUF9lB6fufKA+RTnJSg0CR3TeUfaD+GwbgFjg=;
        b=bwwQv6k4ch7Zi69wVw03rlERsLKhtmjzvFifgz/1itFmaxm0W6//Aqxxyv5C1LZOG5
         D+JshKqDrmreIiJNzEQpcjSri5eShQY1Ko8kOuEX9doR52jV1+89+dlDhKaFtQqGr681
         nUZ2g6/cD5J64v36BzEzudi+DXODbJbSdM6d7nqthX76r+gbd4Il7M+EUrCE39nwpTRm
         gBW3px2ulwLU9A5g1Ibs2e8G8wIkC5n3pi7INRFTgHeer1Wm7sWeJDN++tt21iP7V5D1
         5DDY/tKbX8BzXVn9MLSDfXTsCYm2pycfPM/+F11N7AXJFEYSSzMeNI6lEia+h6lLsjPy
         iYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316910; x=1794921710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTx52hVUF9lB6fufKA+RTnJSg0CR3TeUfaD+GwbgFjg=;
        b=Uq4uQIEOs9Iy2U75tL1nSb0dlt0M4IHj9NMo6o47n5JjpPBdLNnZFnvgrE2FXj/ZB2
         2qzdKRP3sXi9LpIz8AWAWG1rKnVvh+16pFracDCRjJ5zTJ4Y4g4UpKVV+cz4V+GURG/p
         L0DS7zSFZITFQiD07AA5BqererwBbcbAXWKFXGYeKIqR6omy8WACz6XIFMujtNxjr3LD
         GEtdbkNfem2r6hNEzDrnbIjR3HphDd+7JCtdD4JmXK8tf/ym0oEH5UCIpaFlUxlYAnkD
         S+d5FDFb6ECfO67AoZZ7iY/NgXe9j1qH0W5dPMizpwonvkUeNS0bHatgN7SFUgDzBlyA
         UZEQ==
X-Forwarded-Encrypted: i=1; AL+hErEKdderST81DgXFMwU8gaLbpoVgR1Zfbdl42LHmkhIOp4DqlyIHEOnd6Xs/sIuIbaGgCczjAOMm5DV7HIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t4vtDzec7++KlwZhc7sXDAj2Ibemp4uBWcM4dptKHJC0B5San
	SHwgdnnFPW6k2LuyicVgApyusuTkjkM4JYyGDwQYHj3ir/qjDjwha7x+
X-Gm-Gg: AYBFou3qet3jPn47v/yR2Qc1TeqXIoFrA3fVDyXjLsiQlAFyJLglfscRNpZS2AGFT1c
	MNLR5dIWRiCRwieHoY+eCS0hOcrwqgIFI3E9kyJF8NQYyZXyoZDivdzspXMNpzC+K89Vn+rCo+G
	/k8AnccRY/f9ptU+yFfoR6SOFQevJ83qklKEtnojG3oZ0CKU115pUJl/hJk7UIIdGNB0HSkBEf9
	XhpgPcYlQm4/j7k+2VAVLh9kR/jEWRgJGItARA+o5HKut8t5zZW6N1Ka2IjP2Z3jkSDRORV0nFm
	TDas4xpHMJO5bHVpIbAoEKDCICCmUxeAxdILNoDkWN6cRccdpcIG7trpGFYl2Bhz9D654lfer1L
	EzxUci2K2Ap6Sz+iUjhWjYRp1Dcmy8EKDUlxaIaRC0bNFs2qsaAOqfI8y8xgQsF946NkyP1R0Zt
	uA715WjYMa07Recqx4Sh44vgsD9GCu4NxoXoig/ckVbf4vVFK5BDz0+pQ9O0ssd+ya6AHr9n01P
	9/Jqf40CiOsRX6WyGK/2d+D6ab8FYPmdxvE4e7ogpZVwfDuIkTL+oRlu7XWOswOIXYm74+8QT9v
	fKuOKfqXiZRFFd2UaOMoBYAI+q/+57kY0Ua6YXrfzrZFidD+jdy18iSzmMCkSwE=
X-Received: by 2002:a17:903:1a0c:b0:2ed:ebc:460f with SMTP id d9443c01a7336-2edb91fc398mr24141765ad.33.1794316909936;
        Tue, 10 Nov 2026 05:21:49 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:21:49 -0800 (PST)
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
Subject: [PATCH v5 4/7] fs/resctrl: Stop the limbo handler while resctrl is unmounted
Date: Tue, 10 Nov 2026 21:20:51 +0800
Message-ID: <20261110132054.3702-5-ruanjinjie01@gmail.com>
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

A group's RMID is not returned to the free list when the group is
removed. It stays in limbo until the cache lines tagged with it are
evicted, and the limbo handler reads its occupancy counter in the
meantime. The limbo handler keeps running after resctrl is unmounted,
while the MBM overflow handler stops once resctrl_mounted is cleared.

Reading the RMIDs in limbo while resctrl is unmounted is not safe on
every architecture. On MPAM the counter of an RMID is selected by the
PARTIDs of the CLOSID that owned it, and the CLOSID to PARTID mapping
depends on the CDP state. The unmount clears the CDP state, so the
handler that keeps running reads the RMIDs freed under CDP through the
PARTIDs of the cleared state.

Stop the limbo handler while resctrl is unmounted, as the overflow
handler does, and restart it after a mount on every domain that still
has RMIDs in limbo. The worker can stay queued across the unmount, so
cancel it before queuing it again. This keeps the limbo handler
lifetime the same on every architecture.

On x86 the RMIDs in limbo are no longer drained while resctrl is
unmounted. Nothing needs them until the mount that follows the
unmount, after which the handler frees them as before.

Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <stable@vger.kernel.org> # 7.1+
---
 fs/resctrl/internal.h |  1 +
 fs/resctrl/monitor.c  | 43 +++++++++++++++++++++++++++++++++++++++++--
 fs/resctrl/rdtgroup.c |  2 ++
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 1c85e06f09bf..c95fa6ce62e6 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -373,6 +373,7 @@ void closid_free(int closid);
 int setup_rmid_lru_list(void);
 
 void free_rmid_lru_list(void);
+void resctrl_limbo_resume(void);
 
 int alloc_rmid(u32 closid);
 
diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index ae9ddd380515..f56d0e32fd06 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -852,6 +852,13 @@ void cqm_handle_limbo(struct work_struct *work)
 	 */
 	mutex_lock(&rdtgroup_mutex);
 
+	/*
+	 * If the filesystem has been unmounted this work no longer needs to
+	 * run. resctrl_limbo_resume() restarts it on the next mount.
+	 */
+	if (!resctrl_mounted)
+		goto out_unlock;
+
 	/*
 	 * Ensure the worker is dedicated to a CPU as intended and not
 	 * relocated by workqueue subsystem as part of CPU going offline.
@@ -1001,8 +1008,8 @@ int setup_rmid_lru_list(void)
 	/*
 	 * Called on every mount, but the number of RMIDs cannot change
 	 * after the first mount, so keep using the same set of rmid_ptrs[]
-	 * until resctrl_exit(). Note that the limbo handler continues to
-	 * access rmid_ptrs[] after resctrl is unmounted.
+	 * until resctrl_exit(). Note that the RMIDs in limbo stay in limbo
+	 * across an unmount and are checked again after the next mount.
 	 */
 	if (rmid_ptrs)
 		return 0;
@@ -1033,6 +1040,38 @@ int setup_rmid_lru_list(void)
 	return 0;
 }
 
+/**
+ * resctrl_limbo_resume() - Restart the limbo handler after a mount.
+ *
+ * The limbo handler stops while resctrl is unmounted. Restart it on every
+ * domain that still has RMIDs in limbo.
+ */
+void resctrl_limbo_resume(void)
+{
+	struct rdt_l3_mon_domain *d;
+	struct rdt_resource *r;
+
+	lockdep_assert_cpus_held();
+	lockdep_assert_held(&rdtgroup_mutex);
+
+	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
+		return;
+
+	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
+	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
+				lockdep_is_cpus_held()) {
+		if (!has_busy_rmid(d))
+			continue;
+
+		/*
+		 * The unmount may have left the worker queued. Cancel it so
+		 * it is queued again on a CPU picked now.
+		 */
+		cancel_delayed_work(&d->cqm_limbo);
+		cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
+	}
+}
+
 void free_rmid_lru_list(void)
 {
 	if (!resctrl_arch_mon_capable())
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 3312637fb514..b702fe6dbbec 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -3267,6 +3267,8 @@ static int rdt_get_tree(struct fs_context *fc)
 						   RESCTRL_PICK_ANY_CPU);
 	}
 
+	resctrl_limbo_resume();
+
 	/*
 	 * Ensure root remains accessible after mutex is unlocked so that
 	 * kernfs_kill_sb() can run safely if called by kernfs_get_tree()'s
-- 
2.43.0

