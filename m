Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792821064;
	b=RVpznf37W50e/t8Q4gXR8055Bn/ZzQpnQOz8lF4KgG+kyNRYBGVPaBD9ng23JK14CAe/
	 bdGophJqWTEpPEt2RsR0ywu1dmiJiM3R2W7TAuv+cGwL2NR0iUWLSQ0uhwI9zb+q8etjj
	 1P/t2GEDIjLnbJfXDMmdcg+M3afpWn8gmqHyYkKMG3EBzehLzN7owvLq86hlypLZMna69
	 gWxkc28+zLED4e2xG85cQdHFuBfBnVsRqgzjW7tZ1zWZgFDDHJb7gonhx6tSCO158Mk3u
	 DRGidUtFJQfHiHv4tMHB8YtT6Su5CPZIdOQeKI2uElPaYjV9MpW90kEA8+GTHx1yaiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792821064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UTgJhh5osdcHCY8BH9121XidstbaJ6g4TqSB4Lg76bc=;
	b=5GfSxhzHxVPjRhaCif0lvDTzYZw1lUjSY4RMx3p/GYJ/YViOoChog8i8G7q9/ccK0KJy
	 c6wcJKSX5LZAioI0lfakr+xC1vDKSHBRZofxLX3/QNXfZG2VXCjahqfuEGY0QzXxCvTxc
	 Z2Yb0NrQSKbu84ySddegchxl9u6VjLvYjSUF9Zk+lR3ehlLa1dJdEKWt7Oz9uvVkTxK1n
	 Ew126DoGwfIkYKcS/9S+tLPQ4FuTr5acnZOmZyNpNU4vJ8ePziB49xp7Bq5MaxM3h+lnE
	 G7XQ0q7MbP6gUwPRqp5CL9b/+iGZbu624VFIWfMpBuW9hFKHKHpSvjb5E+GUTnDHTtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s4OM9n+7;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230F6606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 230F6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=s4OM9n+7
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-18cdcfc05ffso1782884c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792821063; x=1793425863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UTgJhh5osdcHCY8BH9121XidstbaJ6g4TqSB4Lg76bc=;
        b=s4OM9n+7qph3oBgJcrYrgpk07twkYYUQvFipvI5EeuHix7O1hPpTHQ545U2bt1wPy9
         zwjpKXxRa7vig3l46sWbQSxAJYvye5S/XSqoj1OBX5i7pewHe/FeqDR5aR4jEdwJiVd9
         ZjfaM96WjSG79tB9I1CP1Lz3cE0XScdk+V8k/WuykCeuyk+Hci0P3eHzvGP6Dhw1JEv9
         kb2gDUjEgtwCTIpHDr4m6icHOgXaQnIRZWDOAelkJY1FFHixdfTAZx4OC7cZoTg2BSNB
         fBqJC74Bhf+7jqh7AaGveqX/HIZZTWI2HAsNHt5vya++G5zDvgWsyXV+tUpMjZQlg9CB
         XQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792821063; x=1793425863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UTgJhh5osdcHCY8BH9121XidstbaJ6g4TqSB4Lg76bc=;
        b=PGr89O11Iv7+gsuucz+cCladMLBGHAiw5eYRQbqb6IH4+2vneD7/3Vs4cq2ShHT3DQ
         YDOxqq6+4tLieiSMtspsS4JMW13btw/4VpfDMJauWtf4fOnEpsNCsLh2HXlLSlZmm8xa
         0l/0xEi9lx4texYQi9F/LFsHPOLV7OVUQO50WjGyzxFifRlB+OXsfNYhUZ3nEEOdHdis
         7tU1t/gPz1jcLCCvTu+lLvsTAtsYlcwsAY8cnPLmSgG+Gd5YoJkBo3/tJfxIEO8NjEHH
         GCp1HRiwgnffoSkwS+Ml9eSKLeVqOocHJRwZjWbBW7hA36zzQAuMdyMf0hZ5D+QDPPJ7
         sW+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxbJFqks/jLgOMTsKOAAdXMmFB8DzM8nGyuiCMt2RGrzxIp3f0u6RvNERJvMHIpzWaQb9u8QKLHkmigkz8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdAt1sHyL9rO0Em3q9Z/78tr0eAUVv71Cf4BC0nC/rwXfFoQ5P
	RZAV3UpNk18wbWbR33JRiGxnXzTf3KiU3Yf9+d/yG55nldtdvx3Ole9s3kwPHQ==
X-Gm-Gg: AYBFou1y7P6uDUVu7DCuc/e9SAVkfg+8J1ZIAjgLidyzlw8ne/j92P89iB/TeAcs1eN
	HCu1w83SQtBoowV9iamgvcgfHImNrhOAmmUPX5gDCpGqwfxe6eVnHR83T6l0q5qvfjC5MGjXpZg
	PsgyPMWxCfIoSmYUAaaQ53aVMi7Sxw1jySLWkCZojS8DiHwuYJeYsFBht5zsE7D7oRvtmN6YHq5
	FrIQV8KdOHs6GhcUjDmnkxFLneWKYsUQJFcEmtgEMCq967rSMiyuQKQwvyW003mxuI5hzX8FNaS
	eHrOKrobGPmjjYgIYWhCrVTFZyOQF13aj5zgi22scYZ81gIWtE2ODxw4dMP4eOOjWEiwt6Pgysd
	01tsuOTPeOjid9z9Bheit/YskNgYM3Y7kjwpJDVZHSTA1nvAK3x60rIHjHirs4rlm4s+Swp8CVg
	NPrXfy8MnB+b18RIzBjV/8jdlm3FsG+NjGgzyP/JAb5G0nXT9X9l+UH5SEqB6YJHRY0PoQMB3f8
	3JaRDtoJgJe9OecmsMvmjmZDGf4FXroALS1XSFG5xv+3lWJwvA2DA7gP454EHMy2TjW3MLLxOvD
	MsPNEZFf0rYw32MyYSN+l+IxhXw5mL9WZbCY3hs+aDoqPJk2nAEIU8+1peo2QLFwldaokKO+zxM
	ZPaPOgNc=
X-Received: by 2002:a05:7022:3b8b:b0:169:9f67:a91b with SMTP id a92af1059eb24-1993505df87mr2027148c88.12.1792821063066;
        Fri, 23 Oct 2026 22:51:03 -0700 (PDT)
Received: from server1868-4.tail96fc24.ts.net ([199.188.91.198])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a277b26csm3761565c88.18.2026.10.23.22.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 22:51:02 -0700 (PDT)
From: Austin Schuh <austin.linux@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Austin Schuh <austin.linux@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Aniruddha Rao <anrao@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] firmware: tegra: bpmp: populate debugfs in the background
Date: Fri, 23 Oct 2026 22:50:54 -0700
Message-ID: <20261024055055.602558-1-austin.linux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <n59f1S6wQICe5ZxgcNxb3w@nvidia.com>
References: <n59f1S6wQICe5ZxgcNxb3w@nvidia.com>
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

Populating the BPMP debugfs mirror takes a series of synchronous BPMP
requests, several per directory.  On an Orin Nano (Tegra234) the tree has
about 10,800 entries, and the BPMP probe doesn't return for between two
and six seconds, depending on the L4T release.  Every device that gets its
clocks, resets or power domains from the BPMP waits for it, which on
Tegra234 is nearly all of them, so PCIe, NVMe and the root filesystem all
come up that much later.

Commit c7fc690da6f1 ("firmware: tegra: bpmp: Allow BPMP debugfs population
to be skipped") lets a system that doesn't need the mirror turn it off with
tegra_bpmp.debugfs=0.  A system that does use it, for instance to set
clocks from userspace at boot, still pays the full cost.

Nothing in the kernel uses the mirror, and the probe already only logs an
error from it, so populate it from a workqueue instead.  It isn't an
async_schedule() job, since kernel_init() waits for all of those before it
starts init.  The workqueue is freezable, so a system suspend waits for the
mirror instead of failing its requests, and the mirrors of a system with
several BPMPs are populated one at a time, as their probes did, so that one
failing can't remove the shared root while another is filling it in.

The mirror is filled in as .debug-populating and renamed to debug once it
is complete, so userspace never sees part of it.  Userspace that needs it
right after boot can wait for debug to appear: the rename sends inotify an
IN_MOVED_TO event on the directory above it.  With systemd, a path unit can
start the service that uses the mirror once it is there:

	# bpmp-debugfs.path
	[Path]
	PathExists=/sys/kernel/debug/bpmp/debug
	Unit=bpmp-clocks.service

	[Install]
	WantedBy=paths.target

A Type=oneshot bpmp-clocks.service needs RemainAfterExit=yes, or the path
unit starts it again each time it exits.

Measured with initcall_debug on an Orin Nano running 6.18.39 with
NVIDIA's patches: with an earlier L4T release, the probe returns after
1.2 seconds instead of 6.36.  With the BPMP firmware from L4T 39.2.1 it
returns after 0.51 seconds, and the mirror is complete and renamed 2.2
seconds later, about 1.3 seconds after init has started.

Assisted-by: LLM
Signed-off-by: Austin Schuh <austin.linux@gmail.com>
---

Notes:
    Changes in v2 (thanks, Mikko):
     - Embed the work_struct in struct tegra_bpmp instead of allocating it,
       and cancel it with cancel_work_sync() from a devm action.
     - Fill the mirror in as .debug-populating and rename it to debug once
       it is complete, so userspace never sees part of it, and can wait for
       it by waiting for debug to appear.
     - Queue the work on system_freezable_wq, so a system suspend waits for
       it instead of failing its BPMP requests with -EAGAIN and tearing the
       mirror down.
     - Hold bpmp_debugfs_root_lock across the whole population, so two BPMPs
       are populated one at a time, as their probes did, and one failing
       can't remove the shared root while the other is creating its
       directory in it.
     - Move the work into bpmp-debugfs.c; tegra_bpmp_probe() is unchanged.
    
    Based on tegra/for-7.4/firmware (1bbcf4a19f14).  Built for arm64, W=1,
    no new warnings.  Booted on an Orin Nano with the same change on 6.18.39
    with NVIDIA's patches: the mirror appears complete, with all 10,831
    entries, and reads correctly.  With a 20 second delay added before the
    rename, the path unit from the commit message started its service 3 ms
    after the rename, and the service saw all 10,831 entries.
    
    v1: https://lore.kernel.org/r/20261017065012.3063980-1-austin.linux@gmail.com

 drivers/firmware/tegra/bpmp-debugfs.c | 67 ++++++++++++++++++++++++---
 include/soc/tegra/bpmp.h              |  2 +
 2 files changed, 62 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index 2efc48b522ac..bfc13e990eb2 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -782,27 +782,30 @@ MODULE_PARM_DESC(debugfs,
 
 static struct dentry *bpmp_debugfs_get_root(void)
 {
-	guard(mutex)(&bpmp_debugfs_root_lock);
+	lockdep_assert_held(&bpmp_debugfs_root_lock);
 	if (!bpmp_debugfs_root)
 		bpmp_debugfs_root = debugfs_create_dir("bpmp", NULL);
 	return bpmp_debugfs_root;
 }
 
-int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
+static int tegra_bpmp_populate_debugfs(struct tegra_bpmp *bpmp)
 {
 	struct dentry *root, *d;
 	char name[32];
 	bool inband;
 	int err;
 
-	if (!bpmp_debugfs_enabled)
-		return 0;
-
 	inband = tegra_bpmp_mrq_is_supported(bpmp, MRQ_DEBUG);
 
 	if (!inband && !tegra_bpmp_mrq_is_supported(bpmp, MRQ_DEBUGFS))
 		return 0;
 
+	/*
+	 * Populate one BPMP at a time, so that one failing can't remove the
+	 * shared root while another is creating its directory in it.
+	 */
+	guard(mutex)(&bpmp_debugfs_root_lock);
+
 	root = bpmp_debugfs_get_root();
 	if (IS_ERR(root))
 		return PTR_ERR(root);
@@ -818,7 +821,11 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 		}
 	}
 
-	bpmp->debugfs_mirror = debugfs_create_dir("debug", d);
+	/*
+	 * Fill the mirror in under another name and rename it to "debug"
+	 * once it is complete, so that userspace never sees part of it.
+	 */
+	bpmp->debugfs_mirror = debugfs_create_dir(".debug-populating", d);
 	if (IS_ERR(bpmp->debugfs_mirror)) {
 		err = PTR_ERR(bpmp->debugfs_mirror);
 		goto out;
@@ -830,12 +837,14 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 	else
 		err = bpmp_populate_debugfs_shmem(bpmp);
 
+	if (!err)
+		err = debugfs_change_name(bpmp->debugfs_mirror, "debug");
+
 out:
 	if (err < 0) {
 		if (!IS_ERR(d))
 			debugfs_remove_recursive(d);
 
-		guard(mutex)(&bpmp_debugfs_root_lock);
 		if (root == d) {
 			bpmp_debugfs_root = NULL;
 		} else if (simple_empty(root)) {
@@ -846,3 +855,47 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 
 	return err;
 }
+
+static void tegra_bpmp_debugfs_work(struct work_struct *work)
+{
+	struct tegra_bpmp *bpmp =
+		container_of(work, struct tegra_bpmp, debugfs_work);
+	int err;
+
+	err = tegra_bpmp_populate_debugfs(bpmp);
+	if (err < 0)
+		dev_err(bpmp->dev, "debugfs initialization failed: %d\n", err);
+}
+
+static void tegra_bpmp_cancel_debugfs(void *data)
+{
+	struct tegra_bpmp *bpmp = data;
+
+	cancel_work_sync(&bpmp->debugfs_work);
+}
+
+int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
+{
+	int err;
+
+	if (!bpmp_debugfs_enabled)
+		return 0;
+
+	INIT_WORK(&bpmp->debugfs_work, tegra_bpmp_debugfs_work);
+
+	err = devm_add_action_or_reset(bpmp->dev, tegra_bpmp_cancel_debugfs,
+				       bpmp);
+	if (err < 0)
+		return err;
+
+	/*
+	 * Mirroring the BPMP's debugfs tree takes several requests per
+	 * directory, which on Tegra234 adds up to seconds.  Nothing else
+	 * waits for it, so do it in the background rather than hold up every
+	 * device that depends on the BPMP.  The workqueue is freezable so
+	 * that system suspend waits for it instead of failing its requests.
+	 */
+	queue_work(system_freezable_wq, &bpmp->debugfs_work);
+
+	return 0;
+}
diff --git a/include/soc/tegra/bpmp.h b/include/soc/tegra/bpmp.h
index f55db918ccb1..f961c265326c 100644
--- a/include/soc/tegra/bpmp.h
+++ b/include/soc/tegra/bpmp.h
@@ -12,6 +12,7 @@
 #include <linux/reset-controller.h>
 #include <linux/semaphore.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #include <soc/tegra/bpmp-abi.h>
 
@@ -103,6 +104,7 @@ struct tegra_bpmp {
 
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_mirror;
+	struct work_struct debugfs_work;
 #endif
 
 	bool suspended;

base-commit: 1bbcf4a19f1495f769b69e9569d8c1e81df074f5
-- 
2.47.3

