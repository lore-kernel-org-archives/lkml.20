Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942F321ABC9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790124604; cv=none; b=Vv5/3LsATnHvi1NzTmWFe7NWTgboPGoqYO4aChwU+xuFbdn21jlLnkZ+i68Zj+9LKFDd3bcwuJWWOYF38AlxnyUY6lJKiRU4KVHVZlRWVQ6OzVGVMSaS1M/E+zy1vfJvm1jJCBZlnG9VZlOQG6YOor3tN41kmRAJejQD8TiPRBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790124604; c=relaxed/simple;
	bh=thJ37qylr06shd7T2+W80KXbcpi1TXUkey6PE9Y8nwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BY54piy4sIQ+DVMQn5JOEZvY3xUbLgLU7bKtKlOOog49oTiLezw4T+VzHzJa+Vy4hnJD11zsu55aL5AMw+EXcrggHZK42hHK7TV+++KLGdCBelhFDBC4j2ag+FhOyqhtQ83nAFdyAp6XBN2PbHFa+WGPoybEmjS5iPqBN1/T7xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=O8Sd6YjC; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="O8Sd6YjC"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a156f4so215104eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1790124602; x=1790729402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R5jpAPIMZLFGTrbvDXQwJHP1pOAi8XkuInl/G/CkKXE=;
        b=O8Sd6YjCTL/qoV3+3cdKSpmoBacx+HPMksO/0JZjlmuwIoic6+/I9bMxo1QEyK7f45
         NlbvoOgCxIHdLH4bWXv0HcqJfnmjp5pXJxPMQy4ipFGN+/ggObitp0raJy/84NZXxqMD
         nHmsyBeyQ8bR5dOEZIYc5SGNLIxKwlsGUp0m4AfJtGATlnp4OYgtrmlYf+l7quSL4E/p
         mNDKHTYH/wHLUORH3Xm392DHX4TcJfepgeBxx3tXkwOEmbykrvdOPvn7Ygx2vEvurvZf
         xJLMehnAcqBfP1rghEHxuetoyMR/NEe1QIhIsa7sJADO/F1xBikaaDaAojxLiCZ9EuK2
         TcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790124602; x=1790729402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5jpAPIMZLFGTrbvDXQwJHP1pOAi8XkuInl/G/CkKXE=;
        b=OzCNxVY21tDg17caY0Orzi7QUAkJ9HG+88G5a++vIu70e/nbrMmpQYMYKJZLGhTLlN
         kTXEjPYaaozrfichFkd3YRGOQnQU0X+mvMbxF0sLa0TWIGrmfExbN6eqkyVnz4E10ZNr
         5SEVfOMqTfb1pjj5t4PB85fE9/8DFQvCMQv8Mi27l9PDMcIj8wbTpTRTCPsu/LBzSZHw
         IhVjF9yO3A9s9DymU4z81psmyxusx7ZvXwVRZ6gLlXBRguVREbj+AhqyUFz1h1+oG8/z
         nTlHtprXUUX0eN+mCj9EMGSsrwseCQrjcu0JP3TM7IYsa6uCqVN0L2jYk51suUH5ybwc
         5vwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcl2PS2SlYD6X7WejYSfngCiKPlkWdCUVZzMYcbnNjmCd4AikCpudbQ/QNdm4TfsZq4Vzn0dsVlKh6+XM=@vger.kernel.org
X-Gm-Message-State: AFuF++lvujAc94LfEiBL0GE+mIuIEaZifzQbvZS4WTcYU7KzkPj5uZ+P
	4zvPMJe/OiVLtlbHNN7b6xgHA8iHYllhlUW0ZXOdf20NMM50eof7T+pqsijRfHi7sy+wN8kGHKA
	p+bTjK94=
X-Gm-Gg: AYBFou3YKhFj/1P0+6ddYb2iOBewu6wty9KXwbnrKA46yw2XC/rfPLlO3S8b2FJi/NJ
	psenhLaQyjba0Xh+gYpzwpM4pqhYDrJxyU1EbwbZKNJ1bPYgGNaKMkJA7hYTQmcyqPO0R0wm9c0
	znFwzku2B6y0a1iLZGkV2ITsFn+FEC4JTqEWuBbo2uG8Pz/cCQFtj8LfxBaWdAFGbVOoDzRZ5nC
	pyjYRAmvl1pQrgKyjB91eC+cVJFaAao4dkFbXdlFAqxDRfK5dhGULStulSurGdaXgDG7PCR31JI
	xEy1rpSvFXCBL8Ttv7Pv/VegjkCcWHqcwmk7RoowvNAYRih9btqVddX6Crj/7SwOPOL5BSrcl20
	VayzxXqDmkOteGz//SpMxjGnv0DwHiJam/7bJXJ5TZr7Lr3B2FpHQ9a7GiQARhm2lU5znTME6/G
	uCG4c8XTsBzMYlRx9ZOdgk9nrUaZpNH+4mgt2+v63u80/bOgWy0nc/FvBioMEgJOal9eecRDMpf
	ZLpT1VXO7qqXTW+ofttp5IB8cu9oASfkw==
X-Received: by 2002:a05:693c:638c:20b0:33e:3f5b:3ff6 with SMTP id 5a478bee46e88-33e8ca260d7mr1084183eec.18.1790124601462;
        Tue, 22 Sep 2026 17:50:01 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([4.7.95.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96e498f0sm1693098eec.27.2026.09.22.17.50.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 17:50:01 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nilay@linux.ibm.com,
	sjpark@crusoe.ai,
	saravanand@crusoe.ai,
	Krishna Iyer <kiyer@crusoe.ai>
Subject: [PATCH v3] nvme-multipath: add fail_if_no_path sysfs attribute
Date: Tue, 22 Sep 2026 17:49:59 -0700
Message-ID: <20260923004959.88440-1-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When no usable path exists, I/O on a multipath namespace is queued
until a path returns. With ctrl_loss_tmo=-1 that can be forever:
during a long fabric outage any process waiting on the I/O is stuck in
D state. We hit this on virtualization hosts, where a SIGKILLed VM
process cannot exit while draining I/O to an unreachable NVMe/TCP
target.

Nothing can fail this I/O without tearing something down: controller
deletion takes every namespace on the controller with it.

Add a fail_if_no_path attribute on the ns-head disk: a persistent
per-namespace policy to fail parked and newly arriving I/O instead of
queueing it when no usable path exists. It is enforced where a path is
known to be unusable: CONNECTING controllers and LIVE controllers with
the path ANA inaccessible or persistent-loss stop counting as
available, RESETTING and ANA change keep queueing, and with no
controllers left the policy overrides the delayed_removal_secs
queueing window. Controller state is untouched and reconnects
continue. Like dm's fail_if_no_path, the policy is transport agnostic.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Krishna Iyer <kiyer@crusoe.ai>
---
Changes since v2 [1]:
- use the nvme_state_is_live() helper for the ANA state check, keeping
  the explicit NVME_ANA_CHANGE carve-out so transient ANA transitions
  still queue (Nilay)
- return early when the stored value matches the current setting,
  skipping synchronize_srcu() and the requeue kick (Nilay)

Validated on hardware with a 6.17 backport of this v3: parked I/O on a
SIGKILLed VM process failed within a second of enabling the policy and
the process was reaped, new I/O failed fast during the outage, the
policy persisted across path recovery, and disabling it restored
queueing.

[1] https://lore.kernel.org/linux-nvme/20260917231647.79956-1-kiyer@crusoe.ai/
 Documentation/ABI/stable/sysfs-nvme | 13 +++++
 drivers/nvme/host/multipath.c       | 76 ++++++++++++++++++++++++++---
 drivers/nvme/host/nvme.h            |  2 +
 drivers/nvme/host/sysfs.c           |  4 +-
 4 files changed, 88 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-nvme b/Documentation/ABI/stable/sysfs-nvme
index a2f5d0710db4..57a827235995 100644
--- a/Documentation/ABI/stable/sysfs-nvme
+++ b/Documentation/ABI/stable/sysfs-nvme
@@ -337,6 +337,19 @@ Description:
 		is deferred. Only visible on multipath head devices.
 		Requires CONFIG_NVME_MULTIPATH.
 
+What:		/sys/block/nvmeXnY/fail_if_no_path
+Date:		September 2026
+KernelVersion:	7.3
+Contact:	Krishna Iyer <kiyer@crusoe.ai>
+Description:
+		Shows or sets the fail-if-no-path policy of the multipath
+		head device ("on" or "off", default "off"). When on, I/O
+		queued or arriving while no usable path exists is failed
+		immediately instead of being queued, including during the
+		delayed_removal_secs window. Reconnect attempts are not
+		affected. Only visible on multipath head devices.
+		Requires CONFIG_NVME_MULTIPATH.
+
 What:		/sys/block/nvmeXnY/csi
 What:		/sys/block/nvmeXnY/metadata_bytes
 What:		/sys/block/nvmeXnY/nuse
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 99ecc73393e5..3736ba709b6c 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -496,9 +496,16 @@ inline struct nvme_ns *nvme_find_path(struct nvme_ns_head *head)
 	}
 }
 
+static inline bool nvme_state_is_live(enum nvme_ana_state state)
+{
+	return state == NVME_ANA_OPTIMIZED || state == NVME_ANA_NONOPTIMIZED;
+}
+
 static bool nvme_available_path(struct nvme_ns_head *head)
 	__must_hold_shared(&head->srcu)
 {
+	bool fail_if_no_path = test_bit(NVME_NSHEAD_FAIL_IF_NO_PATH,
+					&head->flags);
 	struct nvme_ns *ns;
 
 	if (!test_bit(NVME_NSHEAD_DISK_LIVE, &head->flags))
@@ -510,14 +517,29 @@ static bool nvme_available_path(struct nvme_ns_head *head)
 			continue;
 		switch (nvme_ctrl_state(ns->ctrl)) {
 		case NVME_CTRL_LIVE:
+			/*
+			 * ANA change is transient and bounded by ANATT, so
+			 * keep queueing while it resolves.
+			 */
+			if (fail_if_no_path &&
+			    !nvme_state_is_live(ns->ana_state) &&
+			    ns->ana_state != NVME_ANA_CHANGE)
+				continue;
+			return true;
 		case NVME_CTRL_RESETTING:
-		case NVME_CTRL_CONNECTING:
 			return true;
+		case NVME_CTRL_CONNECTING:
+			if (!fail_if_no_path)
+				return true;
+			continue;
 		default:
 			break;
 		}
 	}
 
+	if (fail_if_no_path)
+		return false;
+
 	/*
 	 * If "head->delayed_removal_secs" is configured (i.e., non-zero), do
 	 * not immediately fail I/O. Instead, requeue the I/O for the configured
@@ -871,11 +893,6 @@ static int nvme_parse_ana_log(struct nvme_ctrl *ctrl, void *data,
 	return 0;
 }
 
-static inline bool nvme_state_is_live(enum nvme_ana_state state)
-{
-	return state == NVME_ANA_OPTIMIZED || state == NVME_ANA_NONOPTIMIZED;
-}
-
 static void nvme_update_ns_ana_state(struct nvme_ana_group_desc *desc,
 		struct nvme_ns *ns)
 {
@@ -1180,6 +1197,53 @@ static ssize_t delayed_removal_secs_store(struct device *dev,
 
 DEVICE_ATTR_RW(delayed_removal_secs);
 
+static ssize_t fail_if_no_path_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct gendisk *disk = dev_to_disk(dev);
+	struct nvme_ns_head *head = disk->private_data;
+
+	return sysfs_emit(buf, test_bit(NVME_NSHEAD_FAIL_IF_NO_PATH,
+			&head->flags) ? "on\n" : "off\n");
+}
+
+static ssize_t fail_if_no_path_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct gendisk *disk = dev_to_disk(dev);
+	struct nvme_ns_head *head = disk->private_data;
+	bool enable;
+	int ret;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret < 0)
+		return ret;
+
+	/* No-op if the stored value matches the current setting. */
+	if (enable) {
+		if (test_and_set_bit(NVME_NSHEAD_FAIL_IF_NO_PATH, &head->flags))
+			return count;
+	} else {
+		if (!test_and_clear_bit(NVME_NSHEAD_FAIL_IF_NO_PATH,
+					&head->flags))
+			return count;
+	}
+
+	/*
+	 * Ensure that update to NVME_NSHEAD_FAIL_IF_NO_PATH is seen
+	 * by its reader.
+	 */
+	synchronize_srcu(&head->srcu);
+
+	/* Make already-queued I/O re-evaluate path availability. */
+	if (enable)
+		kblockd_schedule_work(&head->requeue_work);
+
+	return count;
+}
+
+DEVICE_ATTR_RW(fail_if_no_path);
+
 static ssize_t multipath_failover_count_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index a643c4723a69..9773538101ca 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -590,6 +590,7 @@ struct nvme_ns_head {
 #define NVME_NSHEAD_DISK_LIVE		0
 #define NVME_NSHEAD_QUEUE_IF_NO_PATH	1
 #define NVME_NSHEAD_CDEV_LIVE		2
+#define NVME_NSHEAD_FAIL_IF_NO_PATH	3
 	struct nvme_ns __rcu_guarded	*current_path[];
 #endif
 };
@@ -1097,6 +1098,7 @@ extern struct device_attribute dev_attr_ana_state;
 extern struct device_attribute dev_attr_queue_depth;
 extern struct device_attribute dev_attr_numa_nodes;
 extern struct device_attribute dev_attr_delayed_removal_secs;
+extern struct device_attribute dev_attr_fail_if_no_path;
 extern struct device_attribute dev_attr_multipath_failover_count;
 extern struct device_attribute dev_attr_io_requeue_no_usable_path_count;
 extern struct device_attribute dev_attr_io_fail_no_available_path_count;
diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index e1e3dcfd084b..56e0ce1c9d8a 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -264,6 +264,7 @@ static struct attribute *nvme_ns_attrs[] = {
 	&dev_attr_queue_depth.attr,
 	&dev_attr_numa_nodes.attr,
 	&dev_attr_delayed_removal_secs.attr,
+	&dev_attr_fail_if_no_path.attr,
 #endif
 	&dev_attr_io_passthru_err_log_enabled.attr,
 	NULL,
@@ -300,7 +301,8 @@ static umode_t nvme_ns_attrs_are_visible(struct kobject *kobj,
 		if (nvme_disk_is_ns_head(dev_to_disk(dev)))
 			return 0;
 	}
-	if (a == &dev_attr_delayed_removal_secs.attr) {
+	if (a == &dev_attr_delayed_removal_secs.attr ||
+	    a == &dev_attr_fail_if_no_path.attr) {
 		struct gendisk *disk = dev_to_disk(dev);
 
 		if (!nvme_disk_is_ns_head(disk))
-- 
2.54.0

