Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792796701;
	b=SCHY/lY9EH5a4K/X+1dreIgxZDvvMmzrhzJB0b5Q6T58jDW2VKpYLIaaUD+vTbGmRSdR
	 J6FG2OvUNrhOH9+TSdemdCHS8gjczdbv4hpzohsMDhqxm4Jj1zRtML8RPqP3hLBEGy/O6
	 rXMKcOBVq599lrwLkrj7zGF96I8Iq/6Pa5C6CWIzLtIrfMewJoebm9PX1jvo0GJoiIa3c
	 TPreJCayHnzV5U+H8zROJhlqoMPIcbRPLp1dqPe8WjEGtu8Rn6qkEw6pE7d6hw7VtDwR8
	 UEwKq+X9dPX805B0ia7bbmTLgSujRN6XXdOZpjQGA0bQudwklpb1a3zQAE3QCm439qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792796701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9UHLjeKrYRjfbnwwuY8ZM/Qh+DkT6uaF+f3tpZdmmVI=;
	b=OS8ou3G+MnxI+svm88lO1+Yhqdoif8uBjXwANep6s7QMn5uuVaRkiwGiOJxGlGlt6N4z
	 W45KpAcC0pn3QIQi63X3T7IBDZnseOutJ9TpdxfgHkILAL/mkFbFRrKR5CKMvXrNY3yex
	 el9dKNsKx4o/Q3JyzNNaxhhAlDA5q5ekPKHxXljH4QfAouJxsi7COah4kn2l4lWxOWHHb
	 Yuikv3oyS498jNPmGhr5iU2cXgDphT/S2pdGEUeQaA7Xj/WoKidQjQNbOSaqvWpa3gvzm
	 AWClqrmCDNwLbrYbL4GXa1WOFsYUahW/Q6LA0+pdOxpU7Xv8i/5jTdi+tTvcUEmUpHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=agkpqJpA;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A774606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A774606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=agkpqJpA
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2488999eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1792796701; x=1793401501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9UHLjeKrYRjfbnwwuY8ZM/Qh+DkT6uaF+f3tpZdmmVI=;
        b=agkpqJpA3vbwLdTi2m73huVcFzNEmQDDA5BnBkUjo/GDs9T2X7kThUWAqm7GT16lkH
         Nn67VzskCZLjQKcETE7xMxGNYzc3UfYa2lR++wrkvO7om8ogO8/mHyjdkT1YUlcykAsa
         obgI2STo8lKFuXij6UC2HYMSDFIX/eQbe3sbGT6NwujUEqQsa/KomdhkXP4gSamGKx7w
         bTFwkV9VGHCEuFgkm6+8ceJjUvmq7MhWlnkWTTE1tRKj6beIlriVs01R9BqCe0ibK8x0
         5zkqwrDAn2gCgabwAH+gU/x1XbbFTjma4ckmgeMJiEvcU5iR0c0k6s54oCYL4n35DbzF
         GUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792796701; x=1793401501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9UHLjeKrYRjfbnwwuY8ZM/Qh+DkT6uaF+f3tpZdmmVI=;
        b=sg1VzzcePA6Wuo5FOZXUiOHKmYJ8bKcfR+rmZGxbxkfQO+9NfegOWZ+WNK+FjJozp/
         vaQGmcNCQLnEkuojG8R2Bv2pB6f8+/GDhs0jDzhrJzXmUUcM7TDfLLxDMh6OU9qNkc/I
         OlmycwSbNvbi6QUbs4hux5WXszLA0zt6WP22fpSTVL5dxB6kZEAg74AMP6fT2r3f67Op
         e+ICRG2C7wUtlT9GiFA1gsBY0Gi6j/XH+TwkZ+53H5BG66VMeR6/poOUi2l6NMJog8U1
         awboTFuuXzJoeAcKh8fjyzUyUrWWbr41yzztfWWnlvQIGFXjWnvf6KzZSjBpI8sXCO/7
         6O5A==
X-Forwarded-Encrypted: i=1; AKwUvBzMs+8x2woytKkAvwU1xqXz0N7t0fIZqfB1PHXuL1SZcQuR0J9K7Y036lyV3YXa5YzTL9rRcc18dl3Muvs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIA/ivs7Hg62OvZYeGyQIca34xftfkV95dLr/375FfR7cBvVyTn
	4MediXvzkE/VReZIBu9Z2Sw/aGa9jOygoqXUp+sbbyxfCJ9wnJ0dR7nCvRmYkIOt84Q=
X-Gm-Gg: AYBFou3wtX7TCatIK02eFsQ4veKHLJ7yfmPb+9EoG16s3jiBsDuhDJZkCT3HU8xqjD1
	Y7Z9174yoWIQZKIVKH1C7EZJUYM2cwLV0CWamTsP7fGc2u6P4yU7K/Ya0vQToZF9wbVNIgTO7Ue
	QmzTCpoML3VD2/AN/aZIbzKs9ptbrC48xwoON3HFgnSC2erQmbbB88grBbkUvr6N2X2a7jpnoKW
	NJxj/GwdjMxJwtP1aRhJIlYvMxQnb4ZXC8ptShMgwKE80P1C+edk+UHqvbqblkWi+CBzV9nSW5q
	XXtFYCwvWrcXkQvz6PSY04uFb3fHR+YJKjW/JRdkkUJ3zbIuWfi0X0kfZIb7GgYliq/h4ToaZru
	2+QlyuUt0yhtZgiz0boRpReRJ3TXW+BW37xTRfcMygg2LTkoKkqq6LFEiJ5CgOx97EzWHfh4yYx
	fA92HvXbsC4Dby5lbPzG54003tdab4XJzYfW097J1pZCI10s21cqd7EzTE00UE9TNvExBRl5MVL
	MFDsRoKQ9ZTf/lua8vQj6ELPkM4UHbke4WTZJXmF4iAUO2b8tGEc6w2lNtfBEGQbovZ+QyIn7jn
	sr+DsSH+UKfddjOo6lICEWrQkg==
X-Received: by 2002:a05:7300:105:b0:366:913f:4d27 with SMTP id 5a478bee46e88-369e85027a5mr811308eec.30.1792796700299;
        Fri, 23 Oct 2026 16:05:00 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([67.208.231.220])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ecf087sm1356203eec.27.2026.10.23.16.04.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 16:04:59 -0700 (PDT)
From: Saravanan D <saravanand@crusoe.ai>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	nilay@linux.ibm.com,
	dwagner@suse.de,
	sgogte@purestorage.com,
	hare@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sjpark@crusoe.ai,
	bchen@crusoe.ai,
	Saravanan D <saravanand@crusoe.ai>
Subject: [PATCH v6 1/2] nvme: add per-queue sysfs directories
Date: Fri, 23 Oct 2026 16:04:25 -0700
Message-ID: <20261023230426.6425-2-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023230426.6425-1-saravanand@crusoe.ai>
References: <20261023230426.6425-1-saravanand@crusoe.ai>
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

Per I/O queue transport state, such as the nvme-tcp io_cpu, has
nowhere to live in sysfs, since the core has no directory for
individual queues.

Add helpers that create the controller's queues directory and add or
remove one directory per queue

  /sys/class/nvme/nvmeX/queues/<qid>/

carrying attributes provided by the transport. The transport creates
the queues directory from its controller setup path, adds a queue's
directory when it sets the queue up and removes it when it frees the
queue, so the directories follow the queues across reconnects and
changes in the queue count. The core allocates each queue directory
and its release frees only that allocation. Removal waits for running
attribute callbacks, so the transport may tear the queue down once it
returns.

The queues directory holds a reference on the controller device, so
nvme_uninit_ctrl() deletes it after the transport has removed the
queue directories.

Suggested-by: Sagi Grimberg <sagi@grimberg.me>
Link: https://lore.kernel.org/linux-nvme/13c160d0-0657-47ce-9a16-58d348267ab0@grimberg.me/
Assisted-by: Claude:claude-opus-5-5 [Claude Code]
Signed-off-by: Saravanan D <saravanand@crusoe.ai>
---
 drivers/nvme/host/core.c  |  6 +++
 drivers/nvme/host/nvme.h  | 23 ++++++++++
 drivers/nvme/host/sysfs.c | 88 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 117 insertions(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 531f9bb14bab..41e1c9d0ee58 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -5153,6 +5153,12 @@ void nvme_uninit_ctrl(struct nvme_ctrl *ctrl)
 {
 	nvme_stop_keep_alive(ctrl);
 	nvme_hwmon_exit(ctrl);
+	/* transports remove their queue directories before this point */
+	if (ctrl->queues_kobj) {
+		kobject_del(ctrl->queues_kobj);
+		kobject_put(ctrl->queues_kobj);
+		ctrl->queues_kobj = NULL;
+	}
 	nvme_fault_inject_fini(&ctrl->fault_inject);
 	dev_pm_qos_hide_latency_tolerance(ctrl->device);
 	cdev_device_del(&ctrl->cdev, ctrl->device);
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index a8ef62b8e34b..d198214d7f8b 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -339,6 +339,28 @@ enum nvme_ctrl_flags {
 	NVME_CTRL_FROZEN		= 6,
 };
 
+/*
+ * Per-queue directory /sys/class/nvme/nvmeX/queues/<qid>/, allocated by the
+ * core and carrying attributes provided by the transport.
+ */
+struct nvme_queue_info {
+	struct kobject		kobj;
+	void			*data;
+};
+
+static inline void *nvme_queue_info_data(struct kobject *kobj)
+{
+	return container_of(kobj, struct nvme_queue_info, kobj)->data;
+}
+
+struct nvme_ctrl;
+
+int nvme_queue_dir_create(struct nvme_ctrl *ctrl);
+struct nvme_queue_info *
+nvme_add_queue_info(struct nvme_ctrl *ctrl, unsigned int qid,
+		    const struct attribute_group **groups, void *data);
+void nvme_remove_queue_info(struct nvme_queue_info *qinfo);
+
 struct nvme_ctrl {
 	bool comp_seen;
 	bool identified;
@@ -360,6 +382,7 @@ struct nvme_ctrl {
 	struct srcu_struct srcu;
 	struct device ctrl_device;
 	struct device *device;	/* char device */
+	struct kobject *queues_kobj;
 #ifdef CONFIG_NVME_HWMON
 	struct device *hwmon_device;
 #endif
diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index 5224597a32f1..cf62ff905a35 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -1313,3 +1313,91 @@ const struct attribute_group *nvme_subsys_attrs_groups[] = {
 	&nvme_subsys_attrs_group,
 	NULL,
 };
+
+static void nvme_queue_info_release(struct kobject *kobj)
+{
+	kfree(container_of(kobj, struct nvme_queue_info, kobj));
+}
+
+static const struct kobj_type nvme_queue_info_ktype = {
+	.sysfs_ops	= &kobj_sysfs_ops,
+	.release	= nvme_queue_info_release,
+};
+
+/**
+ * nvme_queue_dir_create - create the controller's queues directory
+ * @ctrl: controller
+ *
+ * Creates /sys/class/nvme/nvmeX/queues/ if it does not exist yet. The
+ * transport calls this from its controller setup path, which must not run
+ * it concurrently for the same controller. nvme_uninit_ctrl() deletes the
+ * directory.
+ */
+int nvme_queue_dir_create(struct nvme_ctrl *ctrl)
+{
+	if (ctrl->queues_kobj)
+		return 0;
+
+	ctrl->queues_kobj = kobject_create_and_add("queues",
+						   &ctrl->device->kobj);
+	if (!ctrl->queues_kobj)
+		return -ENOMEM;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nvme_queue_dir_create);
+
+/**
+ * nvme_add_queue_info - add a directory for one queue
+ * @ctrl: controller, whose queues directory must exist
+ * @qid: queue id, used as the directory name
+ * @groups: attributes provided by the transport
+ * @data: transport data, returned by nvme_queue_info_data()
+ *
+ * Adds /sys/class/nvme/nvmeX/queues/<qid>/. Calls for different queues of
+ * the same controller may run concurrently. Returns the queue info, to be
+ * passed to nvme_remove_queue_info(), or an ERR_PTR().
+ */
+struct nvme_queue_info *
+nvme_add_queue_info(struct nvme_ctrl *ctrl, unsigned int qid,
+		    const struct attribute_group **groups, void *data)
+{
+	struct nvme_queue_info *qinfo;
+	int ret;
+
+	if (WARN_ON_ONCE(!ctrl->queues_kobj))
+		return ERR_PTR(-EINVAL);
+
+	qinfo = kzalloc_obj(*qinfo);
+	if (!qinfo)
+		return ERR_PTR(-ENOMEM);
+	qinfo->data = data;
+
+	ret = kobject_init_and_add(&qinfo->kobj, &nvme_queue_info_ktype,
+				   ctrl->queues_kobj, "%u", qid);
+	if (ret)
+		goto out_put;
+
+	ret = sysfs_create_groups(&qinfo->kobj, groups);
+	if (ret)
+		goto out_put;
+	return qinfo;
+
+out_put:
+	kobject_put(&qinfo->kobj);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(nvme_add_queue_info);
+
+/**
+ * nvme_remove_queue_info - remove a queue directory
+ * @qinfo: queue info returned by nvme_add_queue_info()
+ *
+ * Waits for running attribute callbacks, so none run once this returns
+ * and the transport data may be torn down.
+ */
+void nvme_remove_queue_info(struct nvme_queue_info *qinfo)
+{
+	kobject_del(&qinfo->kobj);
+	kobject_put(&qinfo->kobj);
+}
+EXPORT_SYMBOL_GPL(nvme_remove_queue_info);
-- 
2.55.0

