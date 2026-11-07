Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794045231;
	b=lbr8ZRu/F8M98a3ukVe/ejr/HBxebM6X260VhiVxFlE8i6vFd8gtdWjuQ33CRuqcklss
	 Y9VtQXfcw9bED9KhfR++6LFTleuYVQdT878d2RM0Bs6TkOgvcyhE/NFyA6qeKNlL2a1NZ
	 FBLXXMkWhpmOkKgEnXrNPlamCh0/ltfnu04Y+uBenGnji0TX6cjcA1K/TRc8E0Akb8GgR
	 diLP3fDdJG3dyxEt/VoYmr9hpv6A+T3vCzpdwfFOFQdCc8YUk0rp3W1jN0nzWXseKSNJv
	 Y0DrKkTrzbjut2ZtlP7hZPonQ3HkgpJ5B03VefBhJJJGPCg2N8X+L2qxYEMgMOTN9Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794045231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6unXmLTVj63gMaJt+DomEkh1Cx4zZ4gKd/LFAI0Dsr0=;
	b=XBZvW3CiNC08GYosmd/3RhoIF+4S+n5bJ4oZndzZ/kga8b9/RGPh/Mtu67wUse27sZpK
	 VpPGLD/PSijWFxYmNU4OuQ+AkFayCrLNNgcpIIjksPGgh3g/v+bXZ8/x49cYg0uv2bfhh
	 ltAciKsiXpbJZEprmLRYN4dg4H2gWFkFdDebY0Nc2Hs652Kn+qbVHuCzS/oYDQ2heX9eb
	 hGo+h/+AkNlTcCqAE6N/p6b7peh/z3p0/Qy9ttsif43+gy53nryuYM5KD3avWp3tVn3U6
	 kTIhuohj6wYnsUUDVoe4c0U3tSf2ncOuzibY/30F8F3PBNdbbzL9gXSGdUf3RlHE0Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=Jf9BegxD;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8BA606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 09:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E8BA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=Jf9BegxD
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so12281305e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1794045229; x=1794650029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6unXmLTVj63gMaJt+DomEkh1Cx4zZ4gKd/LFAI0Dsr0=;
        b=Jf9BegxDskDzrQEiSIBHd3/W0EEN80regkwAbtOD2oMuSwC6cyHw1oXVYUULRAF0Pw
         ouego0YCCTaSOfFLSO9SjR662jFwePqxtIeoD8hkVGpOBGoXy9mi+QPPs7RbTDfova9Y
         96VjF2u0jeiw5IQdqdqm5pKm45ZrLBrfc/a2ZQG+qtew13s4y6PBH0/HjDpe63u/NqHa
         BUhmv4/4ee5oY1qW2Ln/OEf8Xt+OdOT1gC4/5z/tJnj3kslyORhnZsMwVXeOLbVhTs7n
         g0mYARHgFuzI59WcLBp3tnQa8OfryEm+voX5JPze3KXILVGtzHfsjxS2vnGg5V0aTHDO
         V4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794045229; x=1794650029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6unXmLTVj63gMaJt+DomEkh1Cx4zZ4gKd/LFAI0Dsr0=;
        b=ISB5hVZzZmULgYo8NEm79ktQClgm5feiS7aqeO44jukoVh1x0tnDc7lz54FK73YjZJ
         3r1wEz2SY39cF/9q6ik/jhZ06wbzE0QVKL9g77RwPPyvCDZRSsWZypvqa/EaRKtBcQw+
         tefZAawd/vzXzrmZfLyD0v7kb/Qv/d7eWih28L+dEU/2OzZyvd78vfKpJgx0Mx20OM3J
         53zGhPT+uOy9FbLhh3Ueze9FhedckhzuqqlMFsLZl90UD3A/pg8cVZeuWhPq0N5+BLYj
         YK+yt0nTBb8FxAK0n2foV5SftS3B9Q59B45rmY5j5t8chy3U55DLgPR7Asw5iagZnMiq
         FBeQ==
X-Forwarded-Encrypted: i=1; AKwUvByu8AoXflJJsgC76jfszisKiZPR8HlKHJvZJEM16hlMLd7wdvAepnFTWrMEmFVmRq0MGzaGi6gWEUCPeLo=@vger.kernel.org
X-Gm-Message-State: APuU4Z83YK6g4AHQ/zsezH2ge6KSfllpDv0p9IEfWceYe1hLI5p4HBzW
	OAi6osPJiBnEWDHg/NrTHTiMPh9qg92eEHY8WQtIbX9wc+bYWYTgnRUfW2e9s6MDvmI=
X-Gm-Gg: AYBFou3J/3El3BT9TpFwsa+/v8evIf+wYjkkr59FLWBUK0fZFQvFOVx+MjwGKrJ05qU
	NYPiyGRiyjYXYu/bMeMebNQm+mjZXNf8yprvnPDovUvgIpa5did53VxERHRABw1mYXZoLGhbA8G
	lgT+sXJYrHzKMz6FK7/tWYtc5DhFjE/w4VjRPVmxVsESKUucYz0nvH98VvzI/uG6uWqNZklrxb1
	hO8ocohDdgOqQezixjNBbgsqW9MFXsu/IlZSgay9UTiZBc6OeloAMmOs1D58JpZGdcVpf61IWcV
	iV5Qz/YICiXLDQGJH//BWuDkcYtHuzYBPVq/ySSniCkDVR6w8L4RpWFAJqomNvRuPJTxUBYquT6
	gt12dQ4IezFQsQBlVVu6Behyo2oi+sbKmFjQPSy8IfWBO8LDyeHDlBZr3r600ok3tS73aRYTcnL
	iaWMZ1pddbfa8ap2bkE2HWIQw1yHQgMKmF5neE1wY07bPDfS+G87+R6/GNp2333Vq3FIB9ytoTh
	jHIJD+WXmSkeOPtkeKox/JpmmjYYcxWtiz5hh/y+WpvxIQI+rnDp6VsWPtu8rxw7Ki2U0afjLex
	/NH58ML3s03Zqmgv1+q2okFva27XWrDqkLIuIdwTyjNozwGQxgiK0xWSf3A6art/r1BqWvYAyA=
	=
X-Received: by 2002:a05:600c:4e05:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4b6de973c54mr78810225e9.10.1794045229548;
        Sat, 07 Nov 2026 01:53:49 -0800 (PST)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([185.57.101.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b8af10dd35sm37607545e9.4.2026.11.07.01.53.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 01:53:49 -0800 (PST)
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
Subject: [PATCH v8 1/2] nvme: add per-queue sysfs directories
Date: Sat,  7 Nov 2026 09:53:36 +0000
Message-ID: <ce12f1742ea7f8699d85666e4d9d8a2a9d77c90e.1794015622.git.saravanand@crusoe.ai>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1794015622.git.saravanand@crusoe.ai>
References: <cover.1794015622.git.saravanand@crusoe.ai>
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

carrying the attributes a transport sets in the new queue_attr_groups
member of struct nvme_ctrl_ops. For such transports nvme_add_ctrl()
creates the queues directory. It holds a reference on the controller
device, so nvme_uninit_ctrl() deletes it before deleting the device,
after the transport has removed the queue directories.

The transport adds a queue's directory when it sets the queue up and
removes it when it frees the queue, so the directories follow the
queues across reconnects and changes in the queue count. The core
allocates each queue directory and its release frees only that
allocation. Removal waits for running attribute callbacks, so the
transport may tear the queue down once it returns.

Suggested-by: Sagi Grimberg <sagi@grimberg.me>
Link: https://lore.kernel.org/linux-nvme/13c160d0-0657-47ce-9a16-58d348267ab0@grimberg.me/
Assisted-by: Claude:claude-opus-5-5 [Claude Code]
Signed-off-by: Saravanan D <saravanand@crusoe.ai>
---
 drivers/nvme/host/core.c  | 12 ++++++
 drivers/nvme/host/nvme.h  | 25 +++++++++++
 drivers/nvme/host/sysfs.c | 90 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 127 insertions(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index cd0df9b03806..66e1e2c614e8 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -5208,6 +5208,8 @@ void nvme_uninit_ctrl(struct nvme_ctrl *ctrl)
 	 */
 	cancel_work_sync(&ctrl->async_event_work);
 	nvme_hwmon_exit(ctrl);
+	/* transports remove their queue directories before this point */
+	nvme_queue_dir_destroy(ctrl);
 	nvme_fault_inject_fini(&ctrl->fault_inject);
 	dev_pm_qos_hide_latency_tolerance(ctrl->device);
 	cdev_device_del(&ctrl->cdev, ctrl->device);
@@ -5352,6 +5354,12 @@ int nvme_add_ctrl(struct nvme_ctrl *ctrl)
 	if (ret)
 		return ret;
 
+	if (ctrl->ops->queue_attr_groups) {
+		ret = nvme_queue_dir_create(ctrl);
+		if (ret)
+			goto out_del_cdev;
+	}
+
 	/*
 	 * Initialize latency tolerance controls.  The sysfs files won't
 	 * be visible to userspace unless the device actually supports APST.
@@ -5364,6 +5372,10 @@ int nvme_add_ctrl(struct nvme_ctrl *ctrl)
 	nvme_get_ctrl(ctrl);
 
 	return 0;
+
+out_del_cdev:
+	cdev_device_del(&ctrl->cdev, ctrl->device);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(nvme_add_ctrl);
 
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 2543e52d6358..95b598c71b4a 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -356,6 +356,28 @@ enum nvme_ctrl_flags {
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
+void nvme_queue_dir_destroy(struct nvme_ctrl *ctrl);
+struct nvme_queue_info *
+nvme_add_queue_info(struct nvme_ctrl *ctrl, unsigned int qid, void *data);
+void nvme_remove_queue_info(struct nvme_queue_info *qinfo);
+
 struct nvme_ctrl {
 	bool comp_seen;
 	bool identified;
@@ -377,6 +399,7 @@ struct nvme_ctrl {
 	struct srcu_struct srcu;
 	struct device ctrl_device;
 	struct device *device;	/* char device */
+	struct kobject *queues_kobj;
 #ifdef CONFIG_NVME_HWMON
 	struct device *hwmon_device;
 #endif
@@ -675,6 +698,8 @@ struct nvme_ctrl_ops {
 #define NVME_F_BLOCKING			(1 << 2)
 
 	const struct attribute_group **dev_attr_groups;
+	/* attributes of each /sys/class/nvme/nvmeX/queues/<qid>/ directory */
+	const struct attribute_group **queue_attr_groups;
 	int (*reg_read32)(struct nvme_ctrl *ctrl, u32 off, u32 *val);
 	int (*reg_write32)(struct nvme_ctrl *ctrl, u32 off, u32 val);
 	int (*reg_read64)(struct nvme_ctrl *ctrl, u32 off, u64 *val);
diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index 3724b5ce03a0..ff81030f161c 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -1311,3 +1311,93 @@ const struct attribute_group *nvme_subsys_attrs_groups[] = {
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
+/*
+ * nvme_add_ctrl() creates /sys/class/nvme/nvmeX/queues/ for transports that
+ * provide queue attributes, and nvme_uninit_ctrl() destroys it.
+ */
+int nvme_queue_dir_create(struct nvme_ctrl *ctrl)
+{
+	ctrl->queues_kobj = kobject_create_and_add("queues",
+						   &ctrl->device->kobj);
+	if (!ctrl->queues_kobj)
+		return -ENOMEM;
+	return 0;
+}
+
+void nvme_queue_dir_destroy(struct nvme_ctrl *ctrl)
+{
+	if (!ctrl->queues_kobj)
+		return;
+
+	kobject_del(ctrl->queues_kobj);
+	kobject_put(ctrl->queues_kobj);
+	ctrl->queues_kobj = NULL;
+}
+
+/**
+ * nvme_add_queue_info - add a directory for one queue
+ * @ctrl: controller, whose queues directory must exist
+ * @qid: queue id, used as the directory name
+ * @data: transport data, returned by nvme_queue_info_data()
+ *
+ * Adds /sys/class/nvme/nvmeX/queues/<qid>/ carrying the transport's
+ * queue_attr_groups. Calls for different queues of
+ * the same controller may run concurrently. Returns the queue info, to be
+ * passed to nvme_remove_queue_info(), or an ERR_PTR().
+ */
+struct nvme_queue_info *
+nvme_add_queue_info(struct nvme_ctrl *ctrl, unsigned int qid, void *data)
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
+	ret = sysfs_create_groups(&qinfo->kobj, ctrl->ops->queue_attr_groups);
+	if (ret)
+		goto out_del;
+	return qinfo;
+
+out_del:
+	kobject_del(&qinfo->kobj);
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
2.56.0

