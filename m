Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D8C4CE691
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848144; cv=none; b=l8dKwKRX8ocDlwjaoE0mMk2Wjq0sQG0AoF76Y20j6mRdrY7Gu/Gp+dmy10B/SnNqzntcF81s+OmY+taaxCR0V+hz0Hv4oGL+HkAxVoZZAJc+/+Wl6JLE8yfULmvGZGU+6Hq3XxcaTuD9kNpPFi/1xXDiRsc0nIRFHZVvjcVlC50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848144; c=relaxed/simple;
	bh=3lV2W5Yq4ZKcM3dGyWgNgSKM8NdfLHkFc9UE6IXXhBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fvj14hXEGdceRP9O3YaBiLGsHZDqGAHcJGkVXicG0tVrea+DZyztnTap1xWKQ3wx21qBmvMaurnqNxxpHPXDPSSgr4xHkiH/jtcC8Qk47z2JIi58rMZYyqoxO+LZfE5USx/H3wQChsVeCMR1L3D5TAd+kK0sXKwNpazydsEeRuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=RN3+nUcN; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="RN3+nUcN"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so35200355e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1790848141; x=1791452941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNO0JbRYef2qlds0guIph9NYLgasvSXqBVD4E4nG1zE=;
        b=RN3+nUcNupDbXY0OGYfGaoPtvgrXONaEZrbMuCU6gKkVRt+ybqQzeBQV7mMCUMRBme
         nRRO76+dVh+n+gvY5pQ5p2G7F0GJ2UaamTguHL4DEXy5oUavkguBlywnAxqV/w+ED/8F
         WcypLTtE4NiJfy3o64/22zisJ22OiKc0OthaRzKcNSX4C5ABiXTy3qKeXLds92q7S+k8
         s0Vp/tFIGEfjr2PHPRoM24zF/9DRvUd8BWrL86HeQdSzdivmdtJPIxeav/zBevO2Mipe
         n8lzYWQQRjBhnENsQtKB0ut1iIyVrY+ZQhz/pKCMkMVOajYnGQL6VZb0C1vSnpoQLEHS
         HeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848141; x=1791452941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hNO0JbRYef2qlds0guIph9NYLgasvSXqBVD4E4nG1zE=;
        b=VLs5OBc6Huf4jOfUzmZAULGLw1W4hfLLXiS6iBv0ssnjChI7Ts9q6TMIywvYFMrFNv
         bFaTiO9lWxjJC6gTU+bf0Hzz2YDHc/5X/TiZb6aArMDVgGeVncTrBxzZk0T1NT2rEqED
         JZy89+4oDJ9UvfHyH2MJOn5NCuUN3xJ7UOK0QSVJ3WYvAwxA9B/LolIaJ77/rGbEB6Pw
         F9x7dGCsmFvrHm6diUkWJ+F4vIqZRvRzEEKiJsDpKkvqNmXT/y13W2hPtAZkCqybpoPG
         Rg5h8Ibq0AGHBi9yu70eSpiDG2JETVqhJkwwVVhBVRPS7tzXnDt+WXj34wscDeN+WHI+
         aR6Q==
X-Forwarded-Encrypted: i=1; AKwUvBynYcHyflzs+ib87ebBZLd9sIN9ZA9+eu9MJs1HPQJDxth2+QvI6X+6/ZaN4QR6hyddbZP4nyA+RLfrQyY=@vger.kernel.org
X-Gm-Message-State: AFuF++l6od6qig4fqn9G/8Hi+hC6m/spgSEKn0Li7F1UenWHQYYf/JhB
	DPK6Uun6gW9Db7QFvKHOm6IszAp/WxUsGfq9KytPVR/jB3gsJNfvSRxL+vwE5vEFmdI=
X-Gm-Gg: AYBFou3nLMf1nSP9NFJkLjOiyZjpU4Z2pzDYNan9DAaAidMHDyMFlH298775PI9jgNR
	aT3v7t/5+6UyrYUiL0oH+XZc6Qrs9pwc9hWwHOg5MZ+TKNlVhxHHki6oQu/HU0eMgF2F/DU41ET
	pJNA+CpacH2BBsYnaSmGYd+g7XOarrrKjFoMUes5W6PTvJTpShFcicEMdM9/oyEWI4plmv/OmuC
	PMfL506kQlZQaN63BzVsP8WpBwGKi1CeFd54yTtnZBkbeYddPZxZp+ejn8p/RIm5OB2JGl+m86a
	zlHmTcv7qQ8BKV/FG9mSfD6u7cmgODDJWUBqqkaxg5pmV3itUBSDY6vaYEkZifiIsceT4PO237L
	jOdLKYFytqXekwL8P8GswrLTIZgyD7AnqyFtGNsAz+vgxsKCan5G9RJ8iDm9DAW5rU26DlvsxCp
	JiyQc3PRBzSsnfAMsk4b/m8HENwKusaK8oEY3NaeETA5O0VAy4p3pjXPZAP8m2NQo/7wZgiAwwI
	GNhWG1ylkzPoAKCMMe67QIaNh3WmsLmRP4=
X-Received: by 2002:a05:600c:c3cb:20b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-4a01b11eb84mr51772945e9.24.1790848140848;
        Thu, 01 Oct 2026 02:49:00 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([83.71.242.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db6de0dsm1938341f8f.43.2026.10.01.02.48.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 01 Oct 2026 02:49:00 -0700 (PDT)
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
Subject: [PATCH v4 2/2] nvme-multipath: add fail_if_no_path sysfs attribute
Date: Thu,  1 Oct 2026 02:48:57 -0700
Message-ID: <20261001094857.74567-3-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261001094857.74567-1-kiyer@crusoe.ai>
References: <20261001094857.74567-1-kiyer@crusoe.ai>
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
queueing it when no usable path exists. It is the namespace-scoped
counterpart to the controller-scoped fast_io_fail_tmo: the trigger is
an event userspace observes (a consumer known to be gone, for us a
SIGKILLed VM the host must reap), not a duration picked up front, and
sibling namespaces behind the same controllers keep queueing and ride
out the outage.

A CONNECTING controller stops counting as an available path, and with
no controllers left the policy overrides the delayed_removal_secs
queue-if-no-path window; the two are opposites, so fail_if_no_path takes
precedence when both are set. ANA change and controller resetting still
queue, since both are transient. Controller state is untouched and
reconnects continue. Like dm's fail_if_no_path, the policy is transport
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
index a0bb88ca1694..448692dcb117 100644
--- a/Documentation/ABI/stable/sysfs-nvme
+++ b/Documentation/ABI/stable/sysfs-nvme
@@ -358,6 +358,22 @@ Description:
 		is deferred. Only visible on multipath head devices.
 		Requires CONFIG_NVME_MULTIPATH.
 
+What:		/sys/block/nvmeXnY/fail_if_no_path
+Date:		October 2026
+KernelVersion:	7.4
+Contact:	Krishna Iyer <kiyer@crusoe.ai>
+Description:
+		Shows or sets the fail-if-no-path policy of the multipath
+		head device ("on" or "off", default "off"). When on, I/O
+		queued or arriving while no usable path exists is failed
+		immediately instead of being queued. This is the opposite of
+		the queue-if-no-path behavior enabled by a nonzero
+		delayed_removal_secs: when both are set fail_if_no_path takes
+		precedence and the parked I/O is failed rather than held for
+		the delayed_removal_secs window. Reconnect attempts are not
+		affected. Only visible on multipath head devices.
+		Requires CONFIG_NVME_MULTIPATH.
+
 What:		/sys/block/nvmeXnY/csi
 What:		/sys/block/nvmeXnY/metadata_bytes
 What:		/sys/block/nvmeXnY/nuse
diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 0d6c05f0808b..e43b0f43e73e 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -517,6 +517,8 @@ static inline bool nvme_state_is_live(enum nvme_ana_state state)
 static bool nvme_available_path(struct nvme_ns_head *head)
 	__must_hold_shared(&head->srcu)
 {
+	bool fail_if_no_path = test_bit(NVME_NSHEAD_FAIL_IF_NO_PATH,
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
+			if (!fail_if_no_path)
+				return true;
+			continue;
 		default:
 			break;
 		}
 	}
 
-	if (failfast)
+	if (failfast || fail_if_no_path)
 		return false;
 
 	/*
@@ -1242,6 +1247,47 @@ static ssize_t delayed_removal_secs_store(struct device *dev,
 
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
+	if (enable) {
+		if (test_and_set_bit(NVME_NSHEAD_FAIL_IF_NO_PATH, &head->flags))
+			return count;
+	} else {
+		if (!test_and_clear_bit(NVME_NSHEAD_FAIL_IF_NO_PATH,
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
+DEVICE_ATTR_RW(fail_if_no_path);
+
 static ssize_t multipath_failover_count_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index bac25b287d25..71ec72306c9c 100644
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
@@ -1097,6 +1098,7 @@ extern struct device_attribute dev_attr_queue_depth;
 extern struct device_attribute dev_attr_numa_nodes;
 extern struct device_attribute dev_attr_path_state;
 extern struct device_attribute dev_attr_delayed_removal_secs;
+extern struct device_attribute dev_attr_fail_if_no_path;
 extern struct device_attribute dev_attr_multipath_failover_count;
 extern struct device_attribute dev_attr_io_requeue_no_usable_path_count;
 extern struct device_attribute dev_attr_io_fail_no_available_path_count;
diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index 4ac3ea3a86fd..fe1e5305880e 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -265,6 +265,7 @@ static struct attribute *nvme_ns_attrs[] = {
 	&dev_attr_numa_nodes.attr,
 	&dev_attr_path_state.attr,
 	&dev_attr_delayed_removal_secs.attr,
+	&dev_attr_fail_if_no_path.attr,
 #endif
 	&dev_attr_io_passthru_err_log_enabled.attr,
 	NULL,
@@ -302,7 +303,8 @@ static umode_t nvme_ns_attrs_are_visible(struct kobject *kobj,
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

