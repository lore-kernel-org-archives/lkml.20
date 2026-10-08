Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2764A1DF6
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468856; cv=none; b=h0F3a5cTzeePDn73Wm+vGFkW4IYiqM+3Pi2bJ3w6zaICop24E6qJGU9sWB7OrEYBuTQJ3gZv0fZ05eMpNRNtm+Ub/DzVdVTvkUAQDZI2VcSL935Rj66sjepGRwkP9cyX0vNJt0fvpDrwDvlW3USS4Mt/nEgwJHU9jZ6kZFb69pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468856; c=relaxed/simple;
	bh=sCRLYpyPFJmL0JBLRdxr11598KMk8+jnUXcIOxPAxNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MQMhcFm13L8JfnFV+f53gjMC2RdHxMZsdhXaeGB+QVTMvrMSWeg65o7wOFdYRoAxDh3Ew9cUhg39rjW774g3fYZG4ePnFGssoSfNQQqsMqNSuAzeFjBSDzMWl8Q3QSch2NJ/o0DzLxMbkrmxfJT6J4M/kWEhTAn72/x8B4y0/XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=ZkjssoVm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="ZkjssoVm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so26546695e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1791468852; x=1792073652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AOdtfe+YngmHP+/rnhkczaw3OqI2GufIwxv4z5Xa+0=;
        b=ZkjssoVm5jpMNyJSTWpcPRNvhcJgTprSZtXQjCSbljBDavu3lRqkIdrxI3Ogftscmh
         FILRlQxkPSCJoUkhnuMPcrEGZ9qimTDtKtR3K9j/JKrogTbVDgGnpBFMUQz/rVRQ9Lp2
         eOZCEDK3J8/dPqwGW3o4QyEVhN1ZrPZZHtDHYpqTTAY+OJFWOSxZxqxzAOiOQZJJk4MF
         fJiJT4jrsSLj6TaWf3p+4CQsLPpn95LefyN+pBHUSY2IKRtZaJKaX/Jt7A75UBPm4fA1
         YcD0ppymqO+C+1acNWwmR+h6z3Az17Qlo3hdxmJWLc8Elr9+YEVwpNgYKoNzalkF6VhF
         xeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791468852; x=1792073652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2AOdtfe+YngmHP+/rnhkczaw3OqI2GufIwxv4z5Xa+0=;
        b=cs9wPc9qPi2hzdfL3C6B4w17SNEvRRsNeDr/6CSxdu2slUemibpiv8c58Cf/JK4Z36
         6D3cKejyijS/WE/CIskP949G6jIgs5RWcSXsXuIYnzMBO6SQ6Tgx8jZe2gbOLSrjaMad
         23DTK08zzrXxfR1N/S1phgqRZpe5kYDuAlyWtArvbvfP1gTKsvUY5LM05+yIaFnW9eRM
         KCWqN8Trc9mQMecj8gFH/80WcmZyRvwfgxiGNpIII6wJACkqIuCjkdtIa1t5q+7VI302
         VGYFI7GflSLhoR7AocQmdbeFFh9EnaYbFKB2oBQqGYyHqlnFS5zBNmsogvvSJ5Y7mZBL
         lVzg==
X-Forwarded-Encrypted: i=1; AKwUvBxrab6j+hqQ12RL0+HgiXiiopK2wl7dpPO7y4juiYaY+7dXU4mNi/jDl1/9b2xuCEU3LsSfpT0EIpagKUY=@vger.kernel.org
X-Gm-Message-State: AFuF++kg/Id/k7ma0gtFBamycHVMP6FiZ29OgosiSUXvBCTBBwIwXyDe
	1UjwGSe4eLdfpRYBQSOZ61vmim/7sh3VztSMwpHXZR/Hl375C6Lv+UtyJyOv8UwQ/I0=
X-Gm-Gg: AYBFou0iiLXvQar0zXb4QgE1Nx/+Cetr439axjCjDZCbQ8S5cGq+0QYrBMmei94/+y2
	D/MsophScJBM34pHTPK2y8wPz9Rx8VW/ExXm3u80tRRbfQ6EI2v9swsOI4AOjhwWsKK77LFA7qz
	xYF5BiYojFe12qH7gJfiZCqUuUp0yKJ1xwjm5hMFKPUrbKw8tZ0fbgNIc9tVg4Ry2PlJSMDQkuW
	9XRgblJRuDvI4x7cTuCQwyE0gysQy9qD/Rvx8z609Ho3BpUR/coMHknPBIkmODnXzdMqExb9lFz
	Vrou088Q3KN+wfhv2UvshsTUXu5j/0bdZ6bzWVNJlrhTyKgickshVsIZkfK2E1/cwKrabJVWt7v
	voy2DLRklHi5py8DZlDSxpL5y69b7hoNGsFpGVPV9fJid/4EfeHEb1lJwjSoa5TDpOttcDmOS9k
	0eo3wLyOhRHpzwtmp/JwMRlMWl/YF+sb7ZZ6YFle4C2NP3bHzoA9lig18MYj0EeYYbOsXiSWTyi
	nIHSXEsSpP18n5yolYEmj5KkugaNdFr2ok=
X-Received: by 2002:a05:600c:8218:b0:4a0:1f9e:5f7d with SMTP id 5b1f17b1804b1-4a1802e9661mr105955535e9.7.1791468852466;
        Thu, 08 Oct 2026 07:14:12 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([80.95.100.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a185d914fdsm113358935e9.7.2026.10.08.07.14.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 07:14:12 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nilay@linux.ibm.com,
	hare@suse.de,
	saravanand@crusoe.ai,
	sjpark@crusoe.ai,
	Krishna Iyer <kiyer@crusoe.ai>
Subject: [PATCH v5 2/2] nvme-multipath: add fail_on_ctrl_loss sysfs attribute
Date: Thu,  8 Oct 2026 07:14:07 -0700
Message-ID: <20261008141407.22992-3-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008141407.22992-1-kiyer@crusoe.ai>
References: <20261008141407.22992-1-kiyer@crusoe.ai>
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

Add a fail_on_ctrl_loss attribute on the ns-head disk: a persistent
per-namespace policy to fail parked and newly arriving I/O instead of
queueing it when no usable path exists. It is the namespace-scoped
counterpart to the controller-scoped fast_io_fail_tmo: the trigger is
an event userspace observes (a consumer known to be gone, for us a
SIGKILLed VM the host must reap), not a duration picked up front, and
sibling namespaces behind the same controllers keep queueing and ride
out the outage.

A CONNECTING controller stops counting as an available path, and with
no controllers left the policy overrides the delayed_removal_secs
queue-if-no-path window; the two are opposites, so fail_on_ctrl_loss
takes precedence when both are set. ANA change and controller resetting
still queue, since both are transient. Controller state is untouched and
reconnects continue. Like dm-multipath, the policy is transport
agnostic.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Krishna Iyer <kiyer@crusoe.ai>
---
 Documentation/ABI/stable/sysfs-nvme | 16 +++++++++
 drivers/nvme/host/multipath.c       | 50 +++++++++++++++++++++++++++--
 drivers/nvme/host/nvme.h            |  2 ++
 drivers/nvme/host/sysfs.c           |  4 ++-
 4 files changed, 69 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-nvme b/Documentation/ABI/stable/sysfs-nvme
index a0bb88ca1694..20f398b1bcb1 100644
--- a/Documentation/ABI/stable/sysfs-nvme
+++ b/Documentation/ABI/stable/sysfs-nvme
@@ -358,6 +358,22 @@ Description:
 		is deferred. Only visible on multipath head devices.
 		Requires CONFIG_NVME_MULTIPATH.
 
+What:		/sys/block/nvmeXnY/fail_on_ctrl_loss
+Date:		October 2026
+KernelVersion:	7.4
+Contact:	Krishna Iyer <kiyer@crusoe.ai>
+Description:
+		Shows or sets the fail-on-ctrl-loss policy of the multipath
+		head device ("on" or "off", default "off"). When on, I/O
+		queued or arriving while no usable path exists is failed
+		immediately instead of being queued. This is the opposite of
+		the queue-if-no-path behavior enabled by a nonzero
+		delayed_removal_secs: when both are set fail_on_ctrl_loss takes
+		precedence and the parked I/O is failed rather than held for
+		the delayed_removal_secs window. Reconnect attempts are not
+		affected. Only visible on multipath head devices.
+		Requires CONFIG_NVME_MULTIPATH.
+
 What:		/sys/block/nvmeXnY/csi
 What:		/sys/block/nvmeXnY/metadata_bytes
 What:		/sys/block/nvmeXnY/nuse
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 0d6c05f0808b..7e5b50f158cf 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -517,6 +517,8 @@ static inline bool nvme_state_is_live(enum nvme_ana_state state)
 static bool nvme_available_path(struct nvme_ns_head *head)
 	__must_hold_shared(&head->srcu)
 {
+	bool fail_on_ctrl_loss = test_bit(NVME_NSHEAD_FAIL_ON_CTRL_LOSS,
+					&head->flags);
 	bool failfast = false;
 	struct nvme_ns *ns;
 
@@ -536,14 +538,17 @@ static bool nvme_available_path(struct nvme_ns_head *head)
 				continue;
 			return true;
 		case NVME_CTRL_RESETTING:
-		case NVME_CTRL_CONNECTING:
 			return true;
+		case NVME_CTRL_CONNECTING:
+			if (!fail_on_ctrl_loss)
+				return true;
+			continue;
 		default:
 			break;
 		}
 	}
 
-	if (failfast)
+	if (failfast || fail_on_ctrl_loss)
 		return false;
 
 	/*
@@ -1242,6 +1247,47 @@ static ssize_t delayed_removal_secs_store(struct device *dev,
 
 DEVICE_ATTR_RW(delayed_removal_secs);
 
+static ssize_t fail_on_ctrl_loss_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct gendisk *disk = dev_to_disk(dev);
+	struct nvme_ns_head *head = disk->private_data;
+
+	return sysfs_emit(buf, test_bit(NVME_NSHEAD_FAIL_ON_CTRL_LOSS,
+			&head->flags) ? "on\n" : "off\n");
+}
+
+static ssize_t fail_on_ctrl_loss_store(struct device *dev,
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
+	if (enable) {
+		if (test_and_set_bit(NVME_NSHEAD_FAIL_ON_CTRL_LOSS, &head->flags))
+			return count;
+	} else {
+		if (!test_and_clear_bit(NVME_NSHEAD_FAIL_ON_CTRL_LOSS,
+					&head->flags))
+			return count;
+	}
+
+	synchronize_srcu(&head->srcu);
+
+	if (enable)
+		kblockd_schedule_work(&head->requeue_work);
+
+	return count;
+}
+
+DEVICE_ATTR_RW(fail_on_ctrl_loss);
+
 static ssize_t multipath_failover_count_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index bac25b287d25..a8ef62b8e34b 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -589,6 +589,7 @@ struct nvme_ns_head {
 #define NVME_NSHEAD_DISK_LIVE		0
 #define NVME_NSHEAD_QUEUE_IF_NO_PATH	1
 #define NVME_NSHEAD_CDEV_LIVE		2
+#define NVME_NSHEAD_FAIL_ON_CTRL_LOSS	3
 	struct nvme_ns __rcu_guarded	*current_path[];
 #endif
 };
@@ -1097,6 +1098,7 @@ extern struct device_attribute dev_attr_queue_depth;
 extern struct device_attribute dev_attr_numa_nodes;
 extern struct device_attribute dev_attr_path_state;
 extern struct device_attribute dev_attr_delayed_removal_secs;
+extern struct device_attribute dev_attr_fail_on_ctrl_loss;
 extern struct device_attribute dev_attr_multipath_failover_count;
 extern struct device_attribute dev_attr_io_requeue_no_usable_path_count;
 extern struct device_attribute dev_attr_io_fail_no_available_path_count;
diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index 4ac3ea3a86fd..b3abb852a3ec 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -265,6 +265,7 @@ static struct attribute *nvme_ns_attrs[] = {
 	&dev_attr_numa_nodes.attr,
 	&dev_attr_path_state.attr,
 	&dev_attr_delayed_removal_secs.attr,
+	&dev_attr_fail_on_ctrl_loss.attr,
 #endif
 	&dev_attr_io_passthru_err_log_enabled.attr,
 	NULL,
@@ -302,7 +303,8 @@ static umode_t nvme_ns_attrs_are_visible(struct kobject *kobj,
 		if (nvme_disk_is_ns_head(dev_to_disk(dev)))
 			return 0;
 	}
-	if (a == &dev_attr_delayed_removal_secs.attr) {
+	if (a == &dev_attr_delayed_removal_secs.attr ||
+	    a == &dev_attr_fail_on_ctrl_loss.attr) {
 		struct gendisk *disk = dev_to_disk(dev);
 
 		if (!nvme_disk_is_ns_head(disk))
-- 
2.54.0

