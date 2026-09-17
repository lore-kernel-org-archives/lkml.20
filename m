Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDC848C3E3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 23:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789687016; cv=none; b=lgyjcgXD8S3p1+KB24dQK8HSIzse0uh0TThpK/glLQ3DD/wUAznpSYg26h9pfByRoq45PJQ3Dspo/B0BCoqK593aG+biuJnsbc0fGYCUZR1fUf/Ewa6CxZx6prtcjqDMhl6tooCjdsfK7ThMAdLWQHKgO0HX4klHz7nywTjRqMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789687016; c=relaxed/simple;
	bh=zMuzWcCeTgLed65SEK164iUl0lJnsZco6+lgu9cY1JE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=utCDxWH8zb+CFtR2kz4kbfX2moVja0phm+/4eff17uExfoBOyzzCqQkU/ECqx7bTSG7YwG3oGSc0Eo/tm9oD9OwRXC6JR00qOgJE7H9kbRzSWIDPEn9uSITlDrd4SaHHgYE827E5EPVh/CkjLpqBssWOPrfs0jYN3TidgSsm0MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=O9dDXhkg; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="O9dDXhkg"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so139343a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1789687010; x=1790291810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U54GrV6tfeeuoW58jIS1gKLXAmziisaAbUtJKoV5Tmg=;
        b=O9dDXhkgCOove+AIe1G3ccYCTmm5tKgQOnxw0cUmV2+Vl6VxDPywCgPM2nu4xdPi8N
         X21qMwlu0zqp2JOz5tpqU0hYFddyQNFW7gTMYBkXWMIqNN820Gwmk1yLMCOmFTkRkDE+
         STBcOYaajl7WGgQwo0ACFNlCBPTHTbTwRs8lbjDwSzGhEdFhDvkOOgfXCT08EZVS+IyB
         FEGEOc1PjvNPe54SjExMekDctGXwU1ztf0GjLcv53LFbjnoWq7oM5ztgGeAtDjYweAH3
         JUeiaoEQUSixrqAE+V4SJS3wwZqjWmJ92w7hyAqXUaLuC1QNH2z+SCdsNdRSusem3et/
         5Vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789687010; x=1790291810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U54GrV6tfeeuoW58jIS1gKLXAmziisaAbUtJKoV5Tmg=;
        b=Tn/8bZavUv7+XVEUoJNh/I3Dj4upon4n/PJCcQAGmoWXa1/g2KKky+hYnY81RTBY/l
         fwSBEKGwMyzj/VXj9p5nb3xV/G1uuElidvyV4ivhUMmvRBtWCMJmKb4J66Ob04AInypt
         dmHy+rlKjwbgCjNFcC/3lX52o/BK8n73c4PwXFn4iPs5eSBA7zPhLnX845uVCRDJPxHg
         kI8yEOqtVqo6FTZUYGPeXXYQCMULL5/iRjJNVRwGdi4n1FGAdW6bu+qDUyTnpqW3Jf1d
         6htFrbA9jXqtYjSVsE+Gh3ZDJ0quefvKMa99RU/tLxm0HiV9V4uUPAZU+vF9zTDafqOU
         ZbVA==
X-Forwarded-Encrypted: i=1; AKwUvBwgxgvmeLm42u7sxWZly+j6s7MqKXS7K2LTrnZMUCvDl3bLuo4DKQ/oLVMG0kXzXbizNywX8g05APxWNNI=@vger.kernel.org
X-Gm-Message-State: AFuF++mfUW8S9+IQMFiRQIA35CzSqNNzncqbUSIBiydlA9I92fjsTT7J
	0mFj3kI50J5UxwwSa4YF/nBYqntKJVTZLhyimnM2DiPLY2pZ6VELAllDcdxh6ZiR1oGLAMiCqFz
	3Guy9VZhPcQ==
X-Gm-Gg: AYBFou3/yr1A3rqnIfcSQsaRUAUYn3e1CK4YwCQ20UYMkQ7G0v/49SfRE1LwRk7AKX6
	E55s33Q0SsUH0Vb6J/dZy0uxbZTPbEQUfaiqBnqrFSrZvpzML90FbTr3DjmtUNnFss2jjn8SpGy
	/U7HnSdDmJ+5+XngIQpFWC1G4GtWAeIqNuAnzaoS+V2s+pPI7asbCMYEXc4/l+fMiqYEo3SE8ho
	xNojZi53Q8JSqVqthaZgFUexcRHa3NaPymD5KeVZlu7sP2C94C7BXradvzfLCbVMo9FJ/jO6pCd
	yor25129ur6H78/Og2EnDaPEXlnI6DD1p1ZFvz8ID4ls8IN3sP60/6xRBQq+qqWjr/ZDgQE1VCW
	50aC9RA6kKo3DzQVHywyrhdgYNu5Lv3V2C0ZwSzBldmyZUi5k+RwcCK+RcX+dQZh4Byjl0okxhw
	I+bt1+6XHuZlBwqLSgMbMUqOddbLqIaEiB9PauGxPgED5sIGp0GOhONd/fXBJcQNcW2IRalOlyo
	lT1VRYCHQ+bQlS2e5IBbqd4BCgo4/rOYw==
X-Received: by 2002:a17:90b:5281:b0:39e:4c7f:8b17 with SMTP id 98e67ed59e1d1-39e54cf8bc1mr1423054a91.28.1789687010086;
        Thu, 17 Sep 2026 16:16:50 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([4.7.95.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c13f09408sm7146854eec.7.2026.09.17.16.16.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 16:16:49 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Jens Axboe <axboe@kernel.dk>
Cc: Nilay Shroff <nilay@linux.ibm.com>,
	SeongJae Park <sj@kernel.org>,
	Saravanan D <saravanand@crusoe.ai>,
	linux-kernel@vger.kernel.org,
	Krishna Iyer <kiyer@crusoe.ai>
Subject: [PATCH v2] nvme-multipath: add fail_if_no_path sysfs attribute
Date: Thu, 17 Sep 2026 16:16:47 -0700
Message-ID: <20260917231647.79956-1-kiyer@crusoe.ai>
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
Changes since v1 [1]:
- rename fail_io_now -> fail_if_no_path; persistent policy, no
  self-clear when a path returns (Nilay)
- enforce inside the nvme_available_path() loop: only CONNECTING and
  ANA-unusable LIVE paths stop counting; resets and ANA transitions
  queue as before (Nilay)
- override delayed_removal_secs when no controllers remain
- keep visibility transport-agnostic (Nilay)
- rebase onto nvme-7.3 (Nilay)
- add Documentation/ABI entry

[1] https://lore.kernel.org/linux-nvme/20260904032605.65758-1-kiyer@crusoe.ai/
 Documentation/ABI/stable/sysfs-nvme | 13 +++++++
 drivers/nvme/host/multipath.c       | 57 ++++++++++++++++++++++++++++-
 drivers/nvme/host/nvme.h            |  2 +
 drivers/nvme/host/sysfs.c           |  4 +-
 4 files changed, 74 insertions(+), 2 deletions(-)

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
index 3d46c4f28a47..23aeb1737ab5 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -499,6 +499,8 @@ inline struct nvme_ns *nvme_find_path(struct nvme_ns_head *head)
 static bool nvme_available_path(struct nvme_ns_head *head)
 	__must_hold_shared(&head->srcu)
 {
+	bool fail_if_no_path = test_bit(NVME_NSHEAD_FAIL_IF_NO_PATH,
+					&head->flags);
 	struct nvme_ns *ns;
 
 	if (!test_bit(NVME_NSHEAD_DISK_LIVE, &head->flags))
@@ -510,14 +512,25 @@ static bool nvme_available_path(struct nvme_ns_head *head)
 			continue;
 		switch (nvme_ctrl_state(ns->ctrl)) {
 		case NVME_CTRL_LIVE:
+			if (fail_if_no_path &&
+			    (ns->ana_state == NVME_ANA_INACCESSIBLE ||
+			     ns->ana_state == NVME_ANA_PERSISTENT_LOSS))
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
@@ -1181,6 +1194,48 @@ static ssize_t delayed_removal_secs_store(struct device *dev,
 
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
+	if (enable)
+		set_bit(NVME_NSHEAD_FAIL_IF_NO_PATH, &head->flags);
+	else
+		clear_bit(NVME_NSHEAD_FAIL_IF_NO_PATH, &head->flags);
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
index e0260f4d24fd..ff886673d7ca 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -589,6 +589,7 @@ struct nvme_ns_head {
 #define NVME_NSHEAD_DISK_LIVE		0
 #define NVME_NSHEAD_QUEUE_IF_NO_PATH	1
 #define NVME_NSHEAD_CDEV_LIVE		2
+#define NVME_NSHEAD_FAIL_IF_NO_PATH	3
 	struct nvme_ns __rcu_guarded	*current_path[];
 #endif
 };
@@ -1096,6 +1097,7 @@ extern struct device_attribute dev_attr_ana_state;
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

