Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868395;
	b=IiJiDwaQ18QbuSiXYHJgrSuYQOn/3p2WS3RYMRm2d8y3OV05yg4G935t+1o7rUwGlA8h
	 rEQVKDCHAX0yCAOXTCGLQCxXFamff1v+hhhheLDsBRIyUztLH0j5fSiIe5doayehE0O7/
	 t0dkrxAqZSWq8MdkpUBRkPNPp+xg0HH7lW4pg0CcoQ6IslVTlfBirUXI0w37Qn2sOO4nq
	 B66f8xz9D1eiR8gsFK6xbFJeDiA2L4X93oW4zzl2WEGs7bb6RAEERii//Osbo6M4bW5G6
	 SEcB1pXpeebqMzlrlGihMl2/MygClS5ldHou8FmLOX2Zn7A/kyBFGAp0+dIELzsJDFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=LAjrtpG3yMBtaw72gpwmwsyACrUESbNEG0x3WEcUFPM=;
	b=b6LDp22KCc9lhqbGi+UJkt3Lrq/Af4RSjQy2MQmEB6euuzyzMm25HN+Ju5EBJToXJL7c
	 foGaiFV9vhNX05QbARew43cgw9TL6UT+NeyadLAGBrmxHBl6hIpleHN71AO5ZT6ilrfZN
	 Vg1dA9qg8Eyppzd2TBuOs4mO7CFPlmqm+Te/VaJtELQOjgyRJ1yomiJW3uzmh2y0BQ1x8
	 qDEN64ciyOHXu5zFKn+RlzyD3XqnFAcXd0zQLAYCexAOEeu8l6o38AT+LfswKQ8T8270C
	 Tq7ErCxDar1liSKBOA2xu4sONc8hW+aKGMyz/lYvLIiNE6m3jlIKnSClBB75q/n2hFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mlKqdynp;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECDA606A889
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ECDA606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mlKqdynp
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38131260a5dso633907eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794868386; x=1795473186; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LAjrtpG3yMBtaw72gpwmwsyACrUESbNEG0x3WEcUFPM=;
        b=mlKqdynpdtA+PdhjhAZZ2Iai0d09Zs+2K9bhBWuuVIYcZdz2O/nbGvUr/u6oqGRwYI
         Otu1dByUoITyn9DTg2JhKs2gxOMzT+eNPX0Mjxh2WgPqrsL+93qOjukJVqhoT8lhWjEZ
         kP/mrhUsmOJYe4vmqM1H+yMZH2f2qTG4nVhAJdUkh2qfgL1OSQALdZOXav2TLDWYyBYH
         j9zYUKahnCDb/ybVQ4DBcsNh3GB2DTxyz2xtWsZQbo/z0t5rgn4yVRGgIzAP3k55F1XA
         dQ+FjChLiDLpbHcIKzXIdmeUaLlO6Q5usFRx30maVgd14ZsT2YCz6VY89k+aH51Fg8Lc
         CbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868386; x=1795473186;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LAjrtpG3yMBtaw72gpwmwsyACrUESbNEG0x3WEcUFPM=;
        b=kK+xHFtVRObc3/7pG/JeC2un26j6D+CMH0u3GUHWnhr7snUpOOii8F4VRn+c2mAmjO
         orR5xHjOmqEkWSYdhEgmbkI8ndrS69Rl/hAUCV5Hj5b6qjBifdIbGdp0YIgMW7romesF
         TI3dttHwJ7Qq69LcYkdEmqIinIeRMDtLlfT9ZifAu3gA+Igcwzoqsfe2g8075E/HFIWM
         nxqloHS0Vadx+rMYpOkFJFMqpLPxScCWUOjhYjy6EV06SFDKAiXQNu91WMVkizGD0/49
         JNo92BTlLFJtht+9fh0Li7Ye/ZLJGFyHsRuU/I3HhK8gUu6ej5Yh6vh5hNIu5kSuLvEL
         5pqA==
X-Forwarded-Encrypted: i=1; AL+hErEo9QU+SuqHeeVllBoQsVfijDaQoR1T+nj+zDhjh5SgSjC41LkfrxO68A94n47GUzeH+GpaaN9eLZDxh1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AA/ic2M5RpCcJcKEvtV/oaRfoA9QoXEfDOzxw8yj0gxk0+U1z
	xSJUj6c2w+Gc5hdJHxnnvbjZljKMAs8/gaJASjdmsVe3+juV6vCvMJEo5ICm46s1C9N+4h1Y8Ze
	N+D08Ebnp4znFuVkIBFRUE8gnLYo2MvhtHFlvZA==
X-Received: from dyad21.prod.google.com ([2002:a05:693c:8355:b0:359:a8c8:38e2])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:424a:20b0:168:3243:c911 with SMTP id a92af1059eb24-1b503137b4fmr13707934c88.37.1794868385967;
 Mon, 16 Nov 2026 14:33:05 -0800 (PST)
Date: Mon, 16 Nov 2026 14:33:01 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261116223301.1706170-1-sarthakkukreti@google.com>
Subject: [PATCH] dm-verity: export verify_wq to sysfs
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>, Brian Geffon <bgeffon@google.com>, 
	David Stevens <stevensd@chromium.org>, dm-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

Under heavy concurrent read bursts, dm-verity workers blocking on
dm-bufio reads or locks can cause workqueue concurrency management to
spawn hundreds of per-CPU kverityd threads across the system.

Export verify_wq to sysfs via WQ_SYSFS so userspace can inspect and
configure workqueue attributes (such as max_active) per dm-verity
device under /sys/bus/workqueue/devices/kverityd-<dev>-<id>/.

Co-developed-by: Brian Geffon <bgeffon@google.com>
Signed-off-by: Brian Geffon <bgeffon@google.com>
Co-developed-by: David Stevens <stevensd@chromium.org>
Signed-off-by: David Stevens <stevensd@chromium.org>
Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>
---
 drivers/md/dm-verity-target.c | 22 ++++++++++++++++++----
 drivers/md/dm-verity.h        |  1 +
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
index 306ed1f6c118..730adf931494 100644
--- a/drivers/md/dm-verity-target.c
+++ b/drivers/md/dm-verity-target.c
@@ -18,6 +18,7 @@
 #include "dm-verity-verify-sig.h"
 #include "dm-audit.h"
 #include <linux/hex.h>
+#include <linux/idr.h>
 #include <linux/module.h>
 #include <linux/reboot.h>
 #include <linux/string.h>
@@ -26,6 +27,8 @@
 
 #define DM_MSG_PREFIX			"verity"
 
+static DEFINE_IDA(workqueue_ida);
+
 #define DM_VERITY_ENV_LENGTH		46
 #define DM_VERITY_ENV_VAR_NAME		"DM_VERITY_ERR_BLOCK_NR"
 
@@ -1065,6 +1068,8 @@ static void verity_dtr(struct dm_target *ti)
 
 	if (v->verify_wq)
 		destroy_workqueue(v->verify_wq);
+	if (v->workqueue_id)
+		ida_free(&workqueue_ida, v->workqueue_id);
 
 	mempool_exit(&v->recheck_pool);
 	if (v->io)
@@ -1421,7 +1426,7 @@ static int verity_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	struct dm_arg_set as;
 	unsigned int num;
 	unsigned long long num_ll;
-	int r;
+	int r, wq_id;
 	int i;
 	sector_t hash_position;
 	char dummy;
@@ -1637,6 +1642,14 @@ static int verity_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		goto bad;
 	}
 
+	wq_id = ida_alloc_min(&workqueue_ida, 1, GFP_KERNEL);
+	if (wq_id < 0) {
+		ti->error = "Cannot allocate workqueue id";
+		r = wq_id;
+		goto bad;
+	}
+	v->workqueue_id = wq_id;
+
 	/*
 	 * Using WQ_HIGHPRI improves throughput and completion latency by
 	 * reducing wait times when reading from a dm-verity device.
@@ -1646,9 +1659,10 @@ static int verity_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	 * will fall-back to using it for error handling (or if the bufio cache
 	 * doesn't have required hashes).
 	 */
-	v->verify_wq = alloc_workqueue("kverityd",
-				       WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_PERCPU,
-				       0);
+	v->verify_wq = alloc_workqueue("kverityd-%s-%d",
+				       WQ_MEM_RECLAIM | WQ_HIGHPRI |
+				       WQ_PERCPU | WQ_SYSFS, 0,
+				       dm_table_device_name(ti->table), wq_id);
 	if (!v->verify_wq) {
 		ti->error = "Cannot allocate workqueue";
 		r = -ENOMEM;
diff --git a/drivers/md/dm-verity.h b/drivers/md/dm-verity.h
index e104a651c657..53f894f259d3 100644
--- a/drivers/md/dm-verity.h
+++ b/drivers/md/dm-verity.h
@@ -71,6 +71,7 @@ struct dm_verity {
 	atomic_t corrupted_errs;/* Number of errors for corrupted blocks */
 
 	struct workqueue_struct *verify_wq;
+	int workqueue_id;
 
 	/* starting blocks for each tree level. 0 is the lowest level. */
 	sector_t hash_level_block[DM_VERITY_MAX_LEVELS];
-- 
2.56.0.679.gc527c65306-goog

