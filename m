Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686294;
	b=1eXjVTGrxGthNt4fGWZERnDJH2KD+zuFm0O79ywMPdlac3nS2X5RZe0B9Adjw1nfVmme
	 4gjPtwBViAD6SK4qE56zLAGi/vqE83ji6jNOeNwJdQciVxqXu5RN+CZtMxlsZcCycJ4wr
	 76AfzAHneceGDQZiav9Vjk8V7pciqAPjtWpl18qf7or2aj8d6qICgN1F9uRg36xxgVBkg
	 P8/Oc+Kf6LCXoY/hF/gHZg+qUNd8MlK0j32sMSkhyJ7J7REeVey9KRiSOa/+VAgn+Gzvr
	 M3FkXLNMEmOgMvTTVozUlH9biaRQDZyD3vvPRoSASi9scgMybuMYbZ9lC5IGjOp6yew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F0209+Z89QTPwT7tMHgAe7LOb7Q5n1UZPPZHjeaiFsU=;
	b=fwH+JS1flLp/HOp6ySrfMJUx2CSai0YuqhJTYfUoF42gPBUptZ2MI22r2xzkpY/QYy6H
	 cskcJ8l+N3XUkzkbjd+KG5xN8r3GCsa9iEU6o9W/tczsaoxv3jCBPnb6VeMIOQDUhrV1z
	 iFwlcQ7e5WlwCWRquJlNvG1OP763UBpIxdNCiCqt0w0YIStc0hVYm4bMem21H/jjcsCXo
	 BYBQnp8fJYNhu4P+kcmR+a988bCt5AaEpoMFplmzxPn5+wAB/Aw7aRmUFt4Qah2XjwHoV
	 DVtskgUp+RqEvMiMTvYVIJlzauqdBGkfjrbi5w0olUtosWeL7XWvbWI3MyDEMZSnG3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a0ao3ep7;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF92606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AF92606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a0ao3ep7
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3486597eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793686293; x=1794291093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0209+Z89QTPwT7tMHgAe7LOb7Q5n1UZPPZHjeaiFsU=;
        b=a0ao3ep7hjhR6N9ZECtaIVo2g+0dAoCdB9AWmAt9XDSV4uWIvoQoBLtji+gMdwCKvy
         eq/RwX0+Evgcmpf5Dp+fQuF3cLqmr+wztJ5uFuc3oq0Q0GZXkgeXGEOFNiZJAYNxqE7V
         fcIXsjKAukxhU1KFy1kJEoXzSrVpQmMb6WH7SC7fSjtrnM/a5xCVoqVHI2jn4X5kghPp
         eY+4TaJK2q4R9wJ3qbD62eGByLcSwIxyaJCwcTY8qj7LPmJVY6SM3CdvwBv6RPACV/wo
         mhf9aDewF9TdOiogZv7dIAQXBJ6U126bcY408d8hxb68aeEvDfwrWEyVxf5lQD0IPC8Q
         v39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686293; x=1794291093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0209+Z89QTPwT7tMHgAe7LOb7Q5n1UZPPZHjeaiFsU=;
        b=ikm/bD0egyPf6C4RAdJIteH7ifH3502bkDOHvr7mTRegJbECR7d3X3GRjBjtrBGDi3
         xhvYl27tKmD5X1qvUbd/VFZjqwnt1X5z1gChyvsUZs8TCyKKz/2o+9YyRD3nv7inEoLN
         XKXfWiP7t8KcA9kmSOqY31J8lTbeHH3NSq6yNumalYEHAVLWNZbz25UPfT7puwAPKnSq
         WQf1gm+fvAgNEgB+9VKDKB8AJZUUHhf7+4bch2anrYSPMy1A9hL29C7cmsyQyx89qU2j
         4KDFq4rwNmtFB1BhYJBMOMNaEGEcRCz8bsz4xGVDI5R2NGyMmKOskhzpqZehVtf2nrJJ
         R/RQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlH6aFWVXsjXofs5A21VVb4Kj+yJdgaXwvazcB2//3Qwr9/4HxrLpUn6ik+DGYcx7O7BUJaskHVP2Gbl0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AqRJD4UgW/4+3rPVGDlLbIJtKAHW/MjFXRUae0wj8KFIy1T43
	AQihd7VQBkn6RF0DNjtqfgCtvbXgW9Ni0cYPvTJc+inaFB11Fk9FN7O1
X-Gm-Gg: AYBFou2EZOh00nUY6Aet7eGK4eGG9Qs6z3Tg+lwpH+npvyZ1oPabkEQVGS6Pmzvk4V8
	HMkzKTIyh6W/W4/I2rNQgGGG7FcQWlMGlLbfsCk1nzKi8rWBrNuYucJ9/GM0svQqOr4n5iwkKi/
	8390JvZN/PUWRGmtZKWzFbs1EDvlsxQs6bce3J6MzbvXrqZJg/AR4clV0/ayan9BFq4y+VKP9bT
	5G/E7q4wATuno/E9Zo3jweef8/QTseynkw+Myqbd6VYn2VqTX1A1NhFKvXVfVmVQFQeAg+RkVp9
	4gxUUY7eKfBEKCsbkdzNaqvU3vbrS5Nr4J10ZsCv04sWH8vjgNQgv4uO0+xPq25pirrjlhHZPrA
	eRIM+S83mFB3ZW5LQox1v4Ki/OM9dITqloJiEkbjgFqpCY37D1fIDtV/UTDUxq/Ej0l+az4cc+N
	BiMv4Xnquy8ayF66A6MQt+XbXVnptPZEcGHUk1KSP/CtEPkCX6gGySZaK1chg8IRSNA9FfLjHsT
	E2bwmcvsTwpy8rinpte+4xzMhC9NtwKG4f1OX6B4gRvZIwgJcxPeDhl6NnuDTG6TY9IOBJW8184
	W/M0EcMjaH1Bkuuigh+ZzCFeupAGChsJrvH+ubGqufIl2uLotsxp6kBMgn8vthTYz3xByOFsLSV
	7gZK2hddqunR4bpLQDM+FeRT9uQ4maACAa08X2Evt/QDl6J28dqHcEbFqoyWgxy4u/7+IplNxPd
	n0Al8=
X-Received: by 2002:a05:7300:c39f:b0:366:6644:2839 with SMTP id 5a478bee46e88-36a42203e90mr18824616eec.3.1793686292916;
        Mon, 02 Nov 2026 22:11:32 -0800 (PST)
Received: from server1868-4.tail96fc24.ts.net ([199.188.91.198])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm50827480eec.22.2026.11.02.22.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:11:32 -0800 (PST)
From: Austin Schuh <austin.linux@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Austin Schuh <austin.linux@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Aniruddha Rao <anrao@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] firmware: tegra: bpmp: populate debugfs in the background
Date: Mon,  2 Nov 2026 22:11:23 -0800
Message-ID: <20261103061125.3825178-1-austin.linux@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Populating the BPMP debugfs mirror takes several synchronous BPMP requests
per directory, which on Tegra234 adds up to seconds.  The BPMP probe waits
for it, and nearly every other device on the SoC waits for the BPMP.

Nothing in the kernel uses the mirror, so populate it from the freezable
workqueue instead, which system suspend waits for.  Create the mirror as
.debug-populating and rename it to debug once it is complete, so that
userspace never sees an incomplete state.  Count the users of the shared
root, so that one BPMP failing doesn't remove it while another is still
populating.

On an Orin Nano with v7.3-rc1, the BPMP probe now takes 0.5 seconds
instead of 2.6.

Assisted-by: LLM
Signed-off-by: Austin Schuh <austin.linux@gmail.com>
---

Notes:
    Changes in v3:
     - Shorten the commit message and comments.
     - Populate several BPMPs in parallel, and count the users of the shared
       root instead of holding its lock across the whole population.
    
    Changes in v2:
     - Embed the work_struct in struct tegra_bpmp, and cancel it with
       cancel_work_sync() from a devm action.
     - Create the mirror as .debug-populating and rename it to debug once it
       is complete.
     - Queue the work on system_freezable_wq, so that system suspend waits
       for it.
     - Hold bpmp_debugfs_root_lock across the whole population.
    
    v2: https://lore.kernel.org/r/20261024055055.602558-1-austin.linux@gmail.com
    v1: https://lore.kernel.org/r/20261017065012.3063980-1-austin.linux@gmail.com

 drivers/firmware/tegra/bpmp-debugfs.c | 62 ++++++++++++++++++++++++---
 include/soc/tegra/bpmp.h              |  2 +
 2 files changed, 58 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index 2efc48b522ac..d90ef912b66c 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -774,6 +774,7 @@ static int bpmp_populate_debugfs_shmem(struct tegra_bpmp *bpmp)
 
 static DEFINE_MUTEX(bpmp_debugfs_root_lock);
 static struct dentry *bpmp_debugfs_root;
+static unsigned int bpmp_debugfs_root_users;
 static bool bpmp_debugfs_enabled = true;
 
 module_param_named(debugfs, bpmp_debugfs_enabled, bool, 0444);
@@ -785,19 +786,18 @@ static struct dentry *bpmp_debugfs_get_root(void)
 	guard(mutex)(&bpmp_debugfs_root_lock);
 	if (!bpmp_debugfs_root)
 		bpmp_debugfs_root = debugfs_create_dir("bpmp", NULL);
+	if (!IS_ERR(bpmp_debugfs_root))
+		bpmp_debugfs_root_users++;
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
@@ -818,7 +818,11 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 		}
 	}
 
-	bpmp->debugfs_mirror = debugfs_create_dir("debug", d);
+	/*
+	 * Name the mirror "debug" only once it is complete, so that userspace
+	 * never sees an incomplete state.
+	 */
+	bpmp->debugfs_mirror = debugfs_create_dir(".debug-populating", d);
 	if (IS_ERR(bpmp->debugfs_mirror)) {
 		err = PTR_ERR(bpmp->debugfs_mirror);
 		goto out;
@@ -830,15 +834,19 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 	else
 		err = bpmp_populate_debugfs_shmem(bpmp);
 
+	if (!err)
+		err = debugfs_change_name(bpmp->debugfs_mirror, "debug");
+
 out:
 	if (err < 0) {
 		if (!IS_ERR(d))
 			debugfs_remove_recursive(d);
 
 		guard(mutex)(&bpmp_debugfs_root_lock);
+		bpmp_debugfs_root_users--;
 		if (root == d) {
 			bpmp_debugfs_root = NULL;
-		} else if (simple_empty(root)) {
+		} else if (!bpmp_debugfs_root_users) {
 			debugfs_remove(root);
 			bpmp_debugfs_root = NULL;
 		}
@@ -846,3 +854,45 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 
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
+	 * Mirroring the BPMP's debugfs tree can take several seconds, so do
+	 * it asynchronously, on the freezable workqueue so that system
+	 * suspend doesn't make its requests fail.
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

