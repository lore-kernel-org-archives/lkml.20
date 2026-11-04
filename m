Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801235;
	b=qbvvBgGvpef2euAcDaFH5dQSrxodYJI9HRd014+YE4uzOd7msdyECaiaXVa/SmoGSUNF
	 1vRfIKnb0V52R9pJV4CCpXj4v2oPjR1xGoowAVizNT6b7rZdJF4MXAFcmbm/juGkevc5a
	 XE9CTFuzeWhfBZc4O1mVAKOmP0a/hnGP+PuN4UlyyHaa+srLAcYQdyQc2jQ6NtFKaJJU7
	 8OTZKe1v9R5nZsqazGAzl4nGi+tvnoMJ8lZOAHc+zQXMImbXxoAtQmPUpXyYlG6yq60lT
	 EvPzFcLfsaE9B9i2488V8uTyZwU3aIDct90MKPbCuqGgodOjF5gTpuvOlJAGAgMyG+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GDa77zPiXxM3itv0C4+65k7d0sCF8HaG3BofMHNFQUg=;
	b=vdTr22+8gpcu30HyuYkxKUyHasVZdttWC8bnYb9VCAxOZvtcy6A7vhC5g6dkvMFBeMBk
	 VY7fhCG/sW8EK1wRF/9Ifd7E1A9ih9XZydjK6Dm2f/XjwFqVt58mNVAKb9QgkH8+E9g3Q
	 tsoNUB8nlFyQz1ClVn192AbdGgjCc8u4UKArPYLDvX+QuQqcm9JwC22dlE6FKnXoVHhxO
	 iPEiVR94Se5/ROS8fMT5MUvQRhPfHDQCyos786tr2+bMkMSzWekciTdTtDXG/d/103W0v
	 xwRHVweOYzD9q5V0oNwQzDfTTcHszQO8+BclyptDoK48toytU9Jd2aFOXlQ3znTUYgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b="de2s/vSP";
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FD0606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0FD0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=de2s/vSP
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15943c9c005so1921429c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1793801234; x=1794406034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDa77zPiXxM3itv0C4+65k7d0sCF8HaG3BofMHNFQUg=;
        b=de2s/vSPqXUBZTyBOs2JjZBK+7D3y6aNtoen+dLSn3kd6OFJCI6+9B3dl6EBf9uxMD
         sHQMWJh9zxET6CAY8+UDMG7rucliu8DqLn+CC8itI2kmyjRnoEjPujxTELlWxZZh/sES
         jAR5JJGHC609hDHmGhMKPR4fwDjAmdeGAGj7nHHiGSBiVhodoghpqJPCkbbgppWsZZWo
         nVnNXbt/N4obfrXa+LS9tLGPJmLDsp7PaA/JCs3uqwbta/eEenxsEPCmChq8xi5twRj4
         qJJ6SHi2JtYznBebpfKsMXB3LFSLQGB4W22TaVoufoykxgOOpOCPejRauEZCSn4oYsSX
         inxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801234; x=1794406034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GDa77zPiXxM3itv0C4+65k7d0sCF8HaG3BofMHNFQUg=;
        b=1G4QNr/9eq7J03bSHkDVBpvmxBlnsw2Ff+kk2uD+w7UsBwjy8Ais+v845g+Uun46wg
         YT4Ik3N6QBs0wbTRRn66wlM9KxMhmQ4Bd2Z+tpzMlh2zrnCqHsZltcbZYk5lxv4rhEKl
         urzsfinixdvQc2y/4Gen5Nc1Jt1TlqVLSgkawULfR6iM4ai23kAtskTQh+qNnGLFr/7G
         3Cy0zJsAhDqkJn/0ZPu0p8lPvsYunuiffibmtf3hOj3IYBfHf0qAOGyk7FuFOnijnkT/
         See/5lF+S39pzIJOsdMRPK8XMVRyeH8x9Ka3L4OEwMGrdDdNF2b9UuJ8HJFXSCKccVU8
         pQXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBuA0BqtirXDYTrunYEe7b0rvM+//v5/tsJLxSltgL29rQ9JB97fkPo8aiCMWE6/gSB4Zj5DqWwsihgfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dJKFL2xsmZUuA7LFHG9oUpKVp+8gmsINPIaUOoQho652dAHws
	ijxpRIhm4SKsnB6ZMtTiSiQ82k+c1/jQ1avtiuWYFdVKDmy00GRiuhWsaDtdIDYF2nM=
X-Gm-Gg: AYBFou3X7hD7g1Uo/0K1FG/2TCCgwYLl93jVkEXooaNSFCV5WV4lQ1C9L46oReZcoMw
	zS50SiZteejR5Q8Y6MUbCIwV+uy3yn8qFXWH35+e84Cyw/Z5OinfuyggEnLkJVCzn2qC1zDW8iN
	sbPWcd8wC9qcwCJ7qwIiEx5XNY1mq3JClNTK88Qt0CBdpnWhUOmithL+JHnkoOyajnijymawIqB
	VNtM4IOk9F3yl189XJoYJXJjwvcOlMajvZBzeaVVDb/tEprWh4dsVaJELPljQ5ZMF0vsreVH9wY
	LmydxAuAvIW5NwoVN25xWYkQUg5cH7MDSPERj943peDvraoTwIQ/TuPq49vuDRAkiH2/hffzUsa
	BadRE/cQti1PFRekXP50sk5k+84MKRETc9gA3n51fDi0LzMbpnHEjJ+ww9EBya+YjT9YKJ0NF2Q
	lfT5oKo1oLIPZJu/H9dGoXOk+EVtHzviQupPddlP+1C87omnhGo02GYle0oQiOs196rWNVuA5rs
	BHomKBgg4pwByo2V4sKlVneJwfqoje25iLTeLivPxHvQYYRTli6nh/mKNJK5nZa8n3ag5AcEq00
	Js0UwUetxAhWP7f0hPp9JdTCxyRkO1S3CxfNXhbNGwSqbFLZCHSz9G8jkY0puSWL04W/qcXfmw=
	=
X-Received: by 2002:a05:701b:4519:20b0:17b:fea8:1425 with SMTP id a92af1059eb24-1ac5da753f6mr23409689c88.30.1793801233256;
        Wed, 04 Nov 2026 06:07:13 -0800 (PST)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([71.202.170.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c748eesm7938399c88.23.2026.11.04.06.07.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 06:07:12 -0800 (PST)
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
Subject: [PATCH v7 1/2] nvme: add per-queue sysfs directories
Date: Wed,  4 Nov 2026 06:06:29 -0800
Message-ID: <656dac7329c8452efe786b0c76a3b8c0bbf53159.1793800758.git.saravanand@crusoe.ai>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1793800758.git.saravanand@crusoe.ai>
References: <cover.1793800758.git.saravanand@crusoe.ai>
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
 drivers/nvme/host/sysfs.c | 88 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 125 insertions(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 9ea9db0271c2..7246502f1e66 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -5183,6 +5183,8 @@ void nvme_uninit_ctrl(struct nvme_ctrl *ctrl)
 {
 	nvme_stop_keep_alive(ctrl);
 	nvme_hwmon_exit(ctrl);
+	/* transports remove their queue directories before this point */
+	nvme_queue_dir_destroy(ctrl);
 	nvme_fault_inject_fini(&ctrl->fault_inject);
 	dev_pm_qos_hide_latency_tolerance(ctrl->device);
 	cdev_device_del(&ctrl->cdev, ctrl->device);
@@ -5327,6 +5329,12 @@ int nvme_add_ctrl(struct nvme_ctrl *ctrl)
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
@@ -5339,6 +5347,10 @@ int nvme_add_ctrl(struct nvme_ctrl *ctrl)
 	nvme_get_ctrl(ctrl);
 
 	return 0;
+
+out_del_cdev:
+	cdev_device_del(&ctrl->cdev, ctrl->device);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(nvme_add_ctrl);
 
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 92c048002ecd..017e23e449e6 100644
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
+void nvme_queue_dir_destroy(struct nvme_ctrl *ctrl);
+struct nvme_queue_info *
+nvme_add_queue_info(struct nvme_ctrl *ctrl, unsigned int qid, void *data);
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
@@ -658,6 +681,8 @@ struct nvme_ctrl_ops {
 #define NVME_F_BLOCKING			(1 << 2)
 
 	const struct attribute_group **dev_attr_groups;
+	/* attributes of each /sys/class/nvme/nvmeX/queues/<qid>/ directory */
+	const struct attribute_group **queue_attr_groups;
 	int (*reg_read32)(struct nvme_ctrl *ctrl, u32 off, u32 *val);
 	int (*reg_write32)(struct nvme_ctrl *ctrl, u32 off, u32 val);
 	int (*reg_read64)(struct nvme_ctrl *ctrl, u32 off, u64 *val);
diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index 10018c6356b6..8a982453cb69 100644
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
2.56.0

