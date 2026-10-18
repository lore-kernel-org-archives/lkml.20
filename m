Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E2838A717
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341113; cv=none; b=P+tH8hG1+3akxHeXHjGOCJjySbqZ8i194LCxSWP+P8jF8X5ORZhoxj0QA+KKsL35pkTgQJTRE/7y7f5ZzpcsFUbPbXKg/jLNFKJa2S/mrFeDq2h4ORuKF/ptVtWm/h/mjVFlUD5iCpLR4aBpz1cA0MJ4sf2vkGTnUAGc6h6eH80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341113; c=relaxed/simple;
	bh=sCP6gp7v4kua0OIiD2f4Nb3Lrarw7N2ZRp8nfSOx8xc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ht3CGiH5b/7jzFylypECDHHO0b78bnR1fbbrE6cpx4ZdED/MdawvJMpovrHN0throoVr7hxSuvahLKWi8w6VuWTyqecKxfR43poArdZI+vOKwB46aTg6ABcN37ZRD1NlDDR8wJCqDE/yNUmbITJqtX09gsXbk1IsTUqI6I1Ykg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oEQiH74x; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oEQiH74x"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1517bda04a0so814340c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341111; x=1792945911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rC079flF1ea2UIC6V0VoUeWhWKPu+OYvPPnysw6iStQ=;
        b=oEQiH74xrmZRf3K9XLOQip3aBUl+tICfhE6hvUKUQNm4GQaOUhPhHyW6yfehjAQL3q
         girtdGujZ4Gb/5xdgvJbazp2UYIAmBF01cTChkTIrwzjjF/7hGUPU1RA+LNkjIfQt0zB
         yuYpymD2oLErp3noJ5Q56Y86ir4JO0uH39KiFKFORgStr5gCSeOXsqtu1n/Ex+P0V4mt
         eB/opFNjFPj6lnFVrVd83JGbWqURXKbACqDXF8kC6mGEEt2mqXtx1OFQ8e75ls2DBWUA
         oLUpB52el8iD67E9Yw0I/N6zm/Y5O/pIZCpdzl7x7COAoKPEi/knACsO5SNrHBlRs3j3
         RT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341111; x=1792945911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rC079flF1ea2UIC6V0VoUeWhWKPu+OYvPPnysw6iStQ=;
        b=i4bG1QBe/P8Oi+LtgXuAvER3ThmEROxWdEbA4xGUPQ5GKYJzq/SVb4x4O+EBX7OknW
         4UNzuLnIStbjY3tZyZ2lLvg3+GxSnDvkoX6CBqH9iTVsO3QhEGXkUUrv1fM2kLoK5DXl
         xi9k0o7TXImmNUExGj3TU1zSoeFhLiGE3/WrHcMtIgG2lxDHHtuuLnsc7xFI6chUw9Em
         5mF5qqeDXzzMSXvyQw007G9CUjeclGOLzP5Yde210k3B7YwviKz9gBSdBo4fWIz3CHzc
         CqNIsWW8fvGaMC6OoesII2PrXB7LQmF20xnDg26YAJ7pnmZhM7+16V3O3W1IAZtVqbGD
         r87w==
X-Forwarded-Encrypted: i=1; AKwUvBwVGCbEGKHnaWbrZcB5zXtcS/VMdi7jClRJtzxuCsKbXtoRJyMGPeol7S+/S7ViVJ0iJiK28QrHFoTh5gI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8Exn91XQEvtyHmj1GUkgwoJmzrOygPSNCdRbIwYDJCYV6Zyvf
	d03MGtp3SDsbDKGndRLKdrQ/j/ClaDwm+UQLTQ8cgC/K4MICk9RRZgYW
X-Gm-Gg: AYBFou3vOJRDyWkY/iMKsG4lhuUD23L77Pjn+z6W+Dnb5cv0bfi0z+FoEIhH1UIksB+
	Z6DCN+0xYEXgvOeLmHdhmTAhcMc1zTwhp3b3KavX9F+ZSgpUhJfU9Npgm4i5eiDIOrPyHcVQTUx
	+QWG49PeAKuIjBFDhzICiytBzWJgyVkkhX+/77ygbdmecYHvVGSDPcGG4hSBUuQCMSKrFMm9f74
	b4zTJSPCG53IwBDBj3FfK4lqrLRCO8UAB6dMXi+UAyePCm/bzh2bYjhVgntV325fvzg3hV5dOxD
	78K0G1YUiYM2SDlHHMbmRnqdRga+huxSb024An1QxsLbG74y1B7Mw+mK/C/Z0PgvPyE0lH05q0U
	YOuKFIMpIwhuk+6TD7yDhDtldu3UjEGbSBnsdMj69hAvntl/sQ2yXp/G4NGFJluJTi4seVnz64e
	mYNHIvSMcSdp2KdSBZdHZwIEQeCyIwJzcl4R5TkWKFIMW5IsEzwqXYTqxaP4y8xSBJoA3yPAJlC
	flnpo1loxaZHL+v1H0SfVw8E2ETI5a9dYUaeIuh1girtHsQpQJ/KOUEewXtTQ+1pQMO/mPS9ccl
	XhtDVA==
X-Received: by 2002:a05:7022:fc03:b0:128:d4be:7428 with SMTP id a92af1059eb24-1851229662fmr6253633c88.19.1792341110987;
        Sun, 18 Oct 2026 09:31:50 -0700 (PDT)
Received: from codespaces-393231.mimvmn1ww3huhhjmzljqefhnig.rx.internal.cloudapp.net ([4.240.39.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm21629178c88.5.2026.10.18.09.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:31:50 -0700 (PDT)
From: Eklavya Singh <eklavyasingh2106@gmail.com>
To: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Heming Zhao <heming.zhao@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eklavya Singh <eklavyasingh2106@gmail.com>,
	syzbot+5d4e96acd0febccb5e87@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] ocfs2/heartbeat: serialize concurrent writes to a region's dev attribute
Date: Sun, 18 Oct 2026 16:31:21 +0000
Message-ID: <20261018163121.128911-1-eklavyasingh2106@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

o2hb_region_dev_store() checks reg->hr_bdev_file to see if the region
is already started, but nothing stops two writers from doing that at
the same time. configfs only serializes writes through the same open
file, so two processes that each open the dev attribute can both get
past the check:

  A: hr_bdev_file is NULL, opens file A, sets hr_bdev_file = A
  B: hr_bdev_file is NULL, opens file B, sets hr_bdev_file = B
  A: start fails, fput(hr_bdev_file) drops B, sets it to NULL
  B: start fails, fput(NULL)

Both calls also use the same hr_slots, hr_slot_data and hr_tmp_block,
so the error paths can free the slot data twice.

syzbot hit the fput(NULL) with an unbound loop device, where every
start fails with -EIO. With four threads doing the same thing on a
KASAN kernel I get both crashes within a second:

  BUG: KASAN: double-free in o2hb_unmap_slot_data+0x14d/0x2f0
  BUG: kernel NULL pointer dereference, address: 0000000000000158

Add a mutex to the region and take it in dev_store(), in the
block_bytes, start_block and blocks stores, and in dev_show(), since
they all look at hr_bdev_file. dev_store() sleeps with it held while it
waits for the heartbeat thread. That is fine because neither the thread
nor the teardown paths take it.

With the patch the same test ran for 10 minutes with lockdep on and
nothing was reported.

Fixes: a7f6a5fb4bde ("[PATCH] OCFS2: The Second Oracle Cluster Filesystem")
Reported-by: syzbot+5d4e96acd0febccb5e87@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=5d4e96acd0febccb5e87
Cc: stable@vger.kernel.org
Signed-off-by: Eklavya Singh <eklavyasingh2106@gmail.com>
---
 fs/ocfs2/cluster/heartbeat.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index 1c3def99b..2ea870098 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -269,6 +269,8 @@ struct o2hb_region {
 	struct list_head	hr_handler_list;
 	/* Serializes timeout arming against failed-start and teardown. */
 	struct mutex		hr_arming_mutex;
+	/* Serializes the region's configfs attributes against dev_store(). */
+	struct mutex		hr_dev_mutex;
 	bool			hr_stopping;
 
 	/* last hb status, 0 for success, other value for error. */
@@ -1676,6 +1678,7 @@ static ssize_t o2hb_region_block_bytes_store(struct config_item *item,
 	unsigned long block_bytes;
 	unsigned int block_bits;
 
+	guard(mutex)(&reg->hr_dev_mutex);
 	if (reg->hr_bdev_file)
 		return -EINVAL;
 
@@ -1705,6 +1708,7 @@ static ssize_t o2hb_region_start_block_store(struct config_item *item,
 	char *p = (char *)page;
 	ssize_t ret;
 
+	guard(mutex)(&reg->hr_dev_mutex);
 	if (reg->hr_bdev_file)
 		return -EINVAL;
 
@@ -1731,6 +1735,7 @@ static ssize_t o2hb_region_blocks_store(struct config_item *item,
 	char *p = (char *)page;
 	int ret;
 
+	guard(mutex)(&reg->hr_dev_mutex);
 	if (reg->hr_bdev_file)
 		return -EINVAL;
 
@@ -1748,10 +1753,12 @@ static ssize_t o2hb_region_blocks_store(struct config_item *item,
 
 static ssize_t o2hb_region_dev_show(struct config_item *item, char *page)
 {
+	struct o2hb_region *reg = to_o2hb_region(item);
 	unsigned int ret = 0;
 
-	if (to_o2hb_region(item)->hr_bdev_file)
-		ret = sprintf(page, "%pg\n", reg_bdev(to_o2hb_region(item)));
+	guard(mutex)(&reg->hr_dev_mutex);
+	if (reg->hr_bdev_file)
+		ret = sprintf(page, "%pg\n", reg_bdev(reg));
 
 	return ret;
 }
@@ -1879,6 +1886,7 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
 	ssize_t ret = -EINVAL;
 	int live_threshold;
 
+	guard(mutex)(&reg->hr_dev_mutex);
 	if (reg->hr_bdev_file)
 		return -EINVAL;
 
@@ -2156,6 +2164,7 @@ static struct config_item *o2hb_heartbeat_group_make_item(struct config_group *g
 	reg->hr_key = crc32_le(reg->hr_region_num + O2NM_MAX_REGIONS,
 		name, strlen(name));
 	mutex_init(&reg->hr_arming_mutex);
+	mutex_init(&reg->hr_dev_mutex);
 	reg->hr_stopping = true;
 	INIT_DELAYED_WORK(&reg->hr_write_timeout_work, o2hb_write_timeout);
 	INIT_DELAYED_WORK(&reg->hr_nego_timeout_work, o2hb_nego_timeout);
-- 
2.55.0

