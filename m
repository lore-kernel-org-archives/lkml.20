Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0450638E5C4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788492370; cv=none; b=ctEIhd2vrojze+lpRP8C8UXgPpYx2HxsIVz9hB+ur9DSxR15Sn0VpmNeIOTKdzmeDJurJystWFE1hfz4wHVttJbS59LiBQyKGC9mXFjZ2RtK0Rg2ccGo4ugZrypu5XC4KEdZzCNDW2MrLZTa1sZfI6qG1I5XeBEPdPdE9JmsbfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788492370; c=relaxed/simple;
	bh=+E5tp7+KTgRu0U9q6ow6GU+k1SdHlAF1SyDCc0fxjFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V+rBwiMAg5Q7fcLQxCarp8a/OWLi4T1i3z5I8jeaSl94aygLqgkUKtIe+Dy4SsP1V9mEi+l9sr/a7wcP7U6Twrpo92U2bgVrhOGOiLXRmYcsQdFLEqWVNq2LD6knmM+GJalNW7WfH+AnNXbvK3le5E9pSm+oYVh3JQL8Jgm49wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=TURPdqyp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="TURPdqyp"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d032846c95so6186895ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 20:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1788492368; x=1789097168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ftGOifR/mSp8VWj3mAkVMyqRorEnxyKaHinJK42TVjo=;
        b=TURPdqypl7SFHLZ8KQjxTLa0UVi2xBEY4cYh9bbaswad7Q6fdBCP17GrtGPFeYVwyt
         o0fLSOf6gjQ+gkL4SocCgHz54/BjJoFvnPB34BC3BStwUBYxlwD+HUfSCopepNqRSnjw
         jG49q0rRiwJ+HaN0jpO4NVbtt6MLMmDuOJgRf/n9y04ud3l/capt28+CcJ0jSiOjjUZc
         Lpx65vKBCAw1f8qypRziPEfGrHhOgTyshHwhKHH2GEE4sK4v9Ac8ZrzAl9IZlHAVv6Dj
         6xtBwmKW867KmGFChwoCukb4EVv82xhi6B7R2F5lT9RwZxCaAnzvI2QJEyJMfQ/mokYE
         Hj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788492368; x=1789097168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ftGOifR/mSp8VWj3mAkVMyqRorEnxyKaHinJK42TVjo=;
        b=MzGQYtqVA24T8v931Uuhbl6shXqBJsdc93LM6cl2fRcuXwmfbaZDfdGo8h3NJmZ+mm
         MhW8ABmsCAyo8MR2oqBZZ/98Kv1CGJP+8OryBVvaHBXDGzUX51DW69H/D8202ouZglPK
         piGWaAC9FhPaz4AsVqPmeu2SDD93fwbk1QMdieOGxH7XejjxEKvli42zNmYP+J7kRTaF
         qzUF2e5iw6r/VJZ7zMulyXKDgwc0S7BeVWMgb2E+Hb+hLEwVGH4oOPDz4ZWscyZ87hN2
         IDTd/KrmssmrLqgXgcnzaZpIzsfqv64Pj3B9ZWZdAoEPas11n9RrBqhYfWpt4w5Nc+Jk
         Xe7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZ81vR2h5bKZIYolnA/pXV3Kk/PXMLf+rltHQjA3Sj1QK7EAH8TxQ6U38i+GyLoq0gtrwmd5fQNivK5ns=@vger.kernel.org
X-Gm-Message-State: AFuF++lE6PPZL3oI+9r8tNXGB92eqrDVlMhkxN7pLX+hYdy+e/s6Cdnq
	TExcMXoZdVgkaUMI4YR0l0GLo5170cyagamxQVLKntpRrN6O5OFg9CHWFi1Ks8Z66FY=
X-Gm-Gg: AYBFou3w+I8dUWOZK2Xh0XA4mh4OUi7oowxjQD2A42q7IAnmQ5weylmxtyOFfdJ0AnU
	w0Qxl0emX5GhyQsuG2LuqfW7dVMMA7tp5H3wGagnaohD9ammYQ/r9uTWTvJpDBGnRr8ECE7zeuU
	HUkebIU3YIIskT1UZd0rdRuKaKylDs13zONbmMfJzTfFuEQy0rBYnQKM1waPehA88wWbhb+ij7e
	0ylRxWjmpuyqmTeuVTMC2Pnf8sRBugUuXa65P6qct+xjzjwNT3MXFVR+MBEHWggFIDGaKo/1eBN
	/msVGbvrFaMqQKQPZ17iamrnk84GWrLLcz7CuTdgf7pWzMTl1dLcrVd/OqK6JR+pdzOR99ujXOD
	Gp2oGplEGhi0QO1HtZB/4vVOgUTWtiMZy+xx9CUBO6YefQaq/aNj8OFWXHypIAFjCIBlkuzB94C
	f/WqJ/9l2p35nhReO17ovtZyU0rCu7qYJlsV/uXxptoC9sxngsK4/Nsou9m++TKQY3Jzg9lysxo
	lxx6RVzOUHt4v6ijyYA4/bSleGizATL01j+Cxp78Iks+Bwc
X-Received: by 2002:a17:902:e948:b0:2d9:51b7:c0bc with SMTP id d9443c01a7336-2db125a3452mr51306755ad.12.1788492367938;
        Thu, 03 Sep 2026 20:26:07 -0700 (PDT)
Received: from MBP-Krishna-Iyer.civet-hops.ts.net ([2601:645:c68a:b830:ac00:830e:a5a6:34cd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ca07sm3145397eec.1.2026.09.03.20.26.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 20:26:07 -0700 (PDT)
From: Krishna Iyer <kiyer@crusoe.ai>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sj@kernel.org,
	saravanand@crusoe.ai,
	Krishna Iyer <kiyer@crusoe.ai>
Subject: [PATCH] nvme-multipath: add fail_io_now sysfs attribute to fail queued I/O
Date: Thu,  3 Sep 2026 20:26:05 -0700
Message-ID: <20260904032605.65758-1-kiyer@crusoe.ai>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When all paths to a multipath namespace are down, I/O is held on the
head requeue list until a path returns. With ctrl_loss_tmo=-1 the
controllers reconnect forever, so during a long fabric outage the I/O
is held indefinitely and any process waiting on it sleeps in D state
until the fabric heals or the host is rebooted. We hit this on
virtualization hosts, where a SIGKILLed VM process cannot exit because
it is still draining I/O to an unreachable NVMe/TCP target.

There is currently no way to fail this I/O without tearing something
down. Deleting the controller (or letting ctrl_loss_tmo expire) works
but takes every namespace on the controller with it and requires a
manual reconnect afterwards. fast_io_fail_tmo only arms on the
RESETTING -> CONNECTING transition, so it cannot be set once the
outage has started. delayed_removal_secs only matters after all
controllers are gone, which never happens with ctrl_loss_tmo=-1.
dm-multipath has had "dmsetup message <dev> 0 fail_if_no_path" for
this for decades; nvme multipath has no equivalent.

Add a fail_io_now attribute on the ns-head disk. Writing a true value
sets NVME_NSHEAD_FAIL_IO_NOW, synchronizes SRCU so submitters see it,
and kicks the requeue work. nvme_available_path() treats the flag as
no path available, so the existing bio_io_error() branch fails the
parked and any newly arriving I/O, for that namespace only. Controller
state is not touched: reconnect attempts continue and other namespaces
on the controller keep queueing. The flag is cleared in
nvme_mpath_set_live() when a path comes back, like
NVME_CTRL_FAILFAST_EXPIRED.

Locking, SRCU usage and sysfs visibility follow the neighboring
delayed_removal_secs attribute; input parsing follows
io_passthru_err_log_enabled (kstrtobool, shows on/off). Validated on
real hardware with a 6.17 backport of this change.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Krishna Iyer <kiyer@crusoe.ai>
---
Testing notes: the 6.17 backport was exercised on a virtualization
host with a two-path NVMe/TCP namespace connected with
ctrl_loss_tmo=-1. With both target portals firewalled off and a
SIGKILLed VM process stuck in D state on the parked I/O, the process
stayed unreapable for over six minutes; delayed_removal_secs=60,
armed before the outage, never triggered since the controllers were
CONNECTING throughout. Writing fail_io_now released the process in
about two seconds, the reconnect loop was undisturbed, and once the
firewall was removed the paths came back live and the attribute read
back off on its own. A namespace on a second subsystem kept the
default queueing behavior throughout. This posting is compile-tested
(including W=1) on nvme-next.

 drivers/nvme/host/multipath.c | 62 +++++++++++++++++++++++++++++++++++
 drivers/nvme/host/nvme.h      |  2 ++
 drivers/nvme/host/sysfs.c     |  4 ++-
 3 files changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index fc6800a9f7f9..a026bdfb9d7f 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -482,6 +482,15 @@ static bool nvme_available_path(struct nvme_ns_head *head)
 	if (!test_bit(NVME_NSHEAD_DISK_LIVE, &head->flags))
 		return false;
 
+	/*
+	 * The user requested any I/O queued or arriving while no path is
+	 * usable to be failed immediately (e.g. to release I/O held for a
+	 * fabric that retries reconnection indefinitely). The flag is
+	 * cleared when a path becomes live again.
+	 */
+	if (test_bit(NVME_NSHEAD_FAIL_IO_NOW, &head->flags))
+		return false;
+
 	list_for_each_entry_srcu(ns, &head->list, siblings,
 				 srcu_read_lock_held(&head->srcu)) {
 		if (test_bit(NVME_CTRL_FAILFAST_EXPIRED, &ns->ctrl->flags))
@@ -780,6 +789,12 @@ static void nvme_mpath_set_live(struct nvme_ns *ns)
 	if (!head->disk)
 		return;
 
+	/*
+	 * A path is usable again, restore the default queue-if-no-path
+	 * behavior in case fail_io_now was set during a fabric outage.
+	 */
+	clear_bit(NVME_NSHEAD_FAIL_IO_NOW, &head->flags);
+
 	/*
 	 * test_and_set_bit() is used because it is protecting against two nvme
 	 * paths simultaneously calling device_add_disk() on the same namespace
@@ -1168,6 +1183,53 @@ static ssize_t delayed_removal_secs_store(struct device *dev,
 
 DEVICE_ATTR_RW(delayed_removal_secs);
 
+static ssize_t fail_io_now_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct gendisk *disk = dev_to_disk(dev);
+	struct nvme_ns_head *head = disk->private_data;
+
+	return sysfs_emit(buf, test_bit(NVME_NSHEAD_FAIL_IO_NOW,
+			&head->flags) ? "on\n" : "off\n");
+}
+
+static ssize_t fail_io_now_store(struct device *dev,
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
+	mutex_lock(&head->subsys->lock);
+	if (enable)
+		set_bit(NVME_NSHEAD_FAIL_IO_NOW, &head->flags);
+	else
+		clear_bit(NVME_NSHEAD_FAIL_IO_NOW, &head->flags);
+	mutex_unlock(&head->subsys->lock);
+
+	/*
+	 * Ensure that update to NVME_NSHEAD_FAIL_IO_NOW is seen
+	 * by its reader.
+	 */
+	synchronize_srcu(&head->srcu);
+
+	/*
+	 * Kick the requeue list so already-queued I/O re-evaluates path
+	 * availability and fails immediately.
+	 */
+	if (enable)
+		kblockd_schedule_work(&head->requeue_work);
+
+	return count;
+}
+
+DEVICE_ATTR_RW(fail_io_now);
+
 static int nvme_lookup_ana_group_desc(struct nvme_ctrl *ctrl,
 		struct nvme_ana_group_desc *desc, void *data)
 {
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index eeabc72863d8..ca93a8934123 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -566,6 +566,7 @@ struct nvme_ns_head {
 	unsigned int		delayed_removal_secs;
 #define NVME_NSHEAD_DISK_LIVE		0
 #define NVME_NSHEAD_QUEUE_IF_NO_PATH	1
+#define NVME_NSHEAD_FAIL_IO_NOW		2
 	struct nvme_ns __rcu	*current_path[];
 #endif
 };
@@ -1067,6 +1068,7 @@ extern struct device_attribute dev_attr_ana_state;
 extern struct device_attribute dev_attr_queue_depth;
 extern struct device_attribute dev_attr_numa_nodes;
 extern struct device_attribute dev_attr_delayed_removal_secs;
+extern struct device_attribute dev_attr_fail_io_now;
 extern struct device_attribute subsys_attr_iopolicy;
 
 static inline bool nvme_disk_is_ns_head(struct gendisk *disk)
diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index 93513c17ad5f..c154cc78c290 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -261,6 +261,7 @@ static struct attribute *nvme_ns_attrs[] = {
 	&dev_attr_queue_depth.attr,
 	&dev_attr_numa_nodes.attr,
 	&dev_attr_delayed_removal_secs.attr,
+	&dev_attr_fail_io_now.attr,
 #endif
 	&dev_attr_io_passthru_err_log_enabled.attr,
 	NULL,
@@ -297,7 +298,8 @@ static umode_t nvme_ns_attrs_are_visible(struct kobject *kobj,
 		if (nvme_disk_is_ns_head(dev_to_disk(dev)))
 			return 0;
 	}
-	if (a == &dev_attr_delayed_removal_secs.attr) {
+	if (a == &dev_attr_delayed_removal_secs.attr ||
+	    a == &dev_attr_fail_io_now.attr) {
 		struct gendisk *disk = dev_to_disk(dev);
 
 		if (!nvme_disk_is_ns_head(disk))

base-commit: 011e0880d366be065d273c22ad1638934748d3e0
-- 
2.54.0

