Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C693D2E719B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 01:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792285279; cv=none; b=sssVbYpdoA0n8wjr1lFBlRkR0KMcfWyCHqtEz5JWLloCpm82n4/zsU9nNoO4RUjeL4gaanBe2N5k4F/QrJ4mvXKbFtSC8GD0OXuOqhENgUZwyYBHilDl25RZx9HtHGuykB8TOqIcYjzKwPSd+8pZ0ewXpstb2ZJvG6PUTg2LElg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792285279; c=relaxed/simple;
	bh=dFZKGF6YNraJq1WUQ9f+qxKEboIa3btWkrx96r/dBLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZmVXPmMmhejQzJumtE+t5bPE1Pq2lH6OziEh0iP+Lebm/yuY1roNmn3R4XkA/pFg4iSf7aaZJD+mUz4ghy8F9NLuodD3UdU5BeH2p1FEGOnvtMwBrPGeYWtbRPtECUwsWaSoW2gD7qK10obJ0AqeQT9y51vdthZuOtyFeMYOhyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=K5A8EbpA; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="K5A8EbpA"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso2565673eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 18:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1792285277; x=1792890077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PivaMmF9oZn4Vnk3j4KO7AvXjPFZ8gVgtvOFy1s1a9k=;
        b=K5A8EbpAaWoEbIr80hy1P1neVs4K4TnnVj5y1S2HjsIvyAt5P/G5nWRmHeSIQXovcF
         SBEqz8HnWEYthN2TFjmX8kBY7KpgNV55t0VxN8Tacd6jRehl0l9FxtzraBat/HsG76g8
         6mYF1qj66X9ZSmaOcPU1TrgmPe8CLcE4DL0CfDJTM2h1hyhWrZYzYLcWduwP4XxjExwW
         4uAvOLdWmYOAI3LM150Kuy6lUnzLPycVVUhpGOPIPEVIlxbujxY9JJJKkLTrKMy2H1Ct
         /OzYd+6QMlXFFxvqDZTSYJr4RxB/1a/hW/UxUuUyNyBPsBZDkw569sRMa+7EdrEkwZx/
         8PUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792285277; x=1792890077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PivaMmF9oZn4Vnk3j4KO7AvXjPFZ8gVgtvOFy1s1a9k=;
        b=D7ar8kCcKRpCPhayntRatyDJzU+5LReDepmmWdw1yTRKLMvOXO7ryYxhv+dVHAhjbO
         Ghvsjm3eJshQgMkOjOnHm2deTs4rmz8nCPSLTzLIrmoHDiHMsOBGkzO8F4ZQWc4bSFJc
         8u3kx62tRrkKsq7Qik3/zrDhDzwhO5OyW6O07rrmmxOxhIGclvweL/fCZdLBEx1jji0d
         JcaYPcfXF11n0jt90wMw3/fUuY+TH8pZx939E26d9wPtlBMYAVTxEy/ZqaUsam4Xocqb
         dWnYrogSZncMqr+TLMvpa4aL/WRH7SuscK8lTSH4phsm69+aoPa1FLLEwfvWV8RliOdi
         Ojsw==
X-Forwarded-Encrypted: i=1; AKwUvBwmEqPvMwyeZUY3+OTQ2K1czsvOz/51o4A558s1WhH0Z+TCldW+uknaPMn69hRGpYGXwEGloxyr6mqGDrI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJe+xaBKkcwLCC/LO/ppzPV9TFRPr6YC8Y8uZQrthNtpWA8DByp
	EdUl0BEgrZsaf9vJZL/5kZS293KTvyms4vrcmcFNlrb7txgPumxeopN4thoEjCYMnew=
X-Gm-Gg: AYBFou2YSA0/to6aIM2zQGq0SFoTrZvfWVGyximOY8oJzEMsokuP/rpgk5ETdpoSxv6
	lxJcku26qKfpBN+R7K1x3pzoNe0CidR2Olq6A4lV9HMN4c99sXqNc0d4T2EjaeTEus2WFQZ0hxr
	FwAUdtRv+TbZ+PsBfGalqjXDnl6z2rhhu5Zmm5tOo3zRpEGn5zgWhJBpIqY96/lKl+AhtJ7dGO0
	EnZnQRUmgpAUO4IH1MtP2EhgKsQPtLMisbiBZCyYT9KD0dXtdByXTv/T+cdhVqSXjrN8xFHgv1K
	4Ya9tDR4inPsWmNMZs0j2y0uH3noMFD3Ke7z7US1xR3B/2bv5TAwOblgsqhRiNOF488j5+z+Xw8
	Qw6mAP8dnoyOnljXAhhh+PRNM7fzUtGlaqLdLHwRcM+04n80piJzMuTBGUX2VcXduN6oBtM6bfM
	sG8M18gZI83gJ8f/ZhogXFlIAaLykmZheubmzt22K6/rJP5uWlDzbuPipKUld6WNEbN5IunN216
	oj4vsFHZak385UKdictKlBpUxJzFo6Lv0zqFpqFsZQ=
X-Received: by 2002:a05:693c:88d0:20b0:35e:f4ac:5f8e with SMTP id 5a478bee46e88-3619b8fc307mr5225921eec.0.1792285276746;
        Sat, 17 Oct 2026 18:01:16 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([71.202.170.54])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm24198870eec.20.2026.10.17.18.01.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 17 Oct 2026 18:01:16 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sjpark@crusoe.ai,
	Saravanan D <saravanand@crusoe.ai>
Subject: [PATCH v5 1/2] nvme: add per-queue sysfs directories
Date: Sat, 17 Oct 2026 18:00:58 -0700
Message-ID: <20261018010059.83120-2-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261018010059.83120-1-saravanand@crusoe.ai>
References: <20261018010059.83120-1-saravanand@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
directory when it allocates the queue and removes it when it frees
the queue, so the directories follow the queues across reconnects and
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

