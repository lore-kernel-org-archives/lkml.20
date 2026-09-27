Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787F13B9D93
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790492976; cv=none; b=okU6cHH3bERhqlJfIJsuohw8/0BcKZKDsKx0+8EHQr2vzARONEdLwugUXlunWpiINwj1cvlSt9w0BOh+sRRfCTuNnZ4OgknASNwxGVehLF4W8ebTRIUO744+P5ZC7oJCWs7Rj+HayHgGSccfiCufCHzB9JiRko+7QEe9F7QE8DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790492976; c=relaxed/simple;
	bh=imSCfHAFh6XQFMA6nYOQnFRbYIIfx8U1Q4DoiwVg5kE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OuPCR/NHLjmg8YFAXvhlu8yOGA6oRZUxLnshnVswBWPqcH9cXcqAA6GQ2uFZakuV88nPMnDft9KOLxlYBAcBwIheksPMyQPhaWFMk/oH7USYMXzqxz93Pa/N2/JbLETZGjBJHBot07Bh8OpUj8mh5fX2agFZ2e4pFXiC+NH/oYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=Gtz75ZQP; arc=none smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="Gtz75ZQP"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-148b5c829e8so211093c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1790492973; x=1791097773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIYDdjJ1rcyjUwNCj55QdTfFyOHRu8zxJh3wOv/c/fY=;
        b=Gtz75ZQP1Q2O8nrP52HWCpvyzHxATiXvsVFGZ2dMVjbkPBbI8kd7DjZi2ZE1BNh7E5
         4+tkW1O1K4w8NvszS88iLyvbsPEMTz9hziku/w0USkw81Aafd4yoouQDms7koqQYRxhf
         CVhaLgwhtJHSuA4cwtIR7fnCIEBMw7Q3hhz1TrxJwBT3HvWCwP2irk3M9R78g0nMFDiC
         F2z1bT+l4cdevwQQsbvvaiTiwvFicWTJHF22Ihq6ml9EtUVYQCa1Pp8T+4gsNNyTmuzu
         VD/39jbfvDOYzgpz7uv83TG+92ANC94SsfL/9HlpWwG2AI9GoFVsXGSyeZ4uTuI9jjJ3
         OLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790492973; x=1791097773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BIYDdjJ1rcyjUwNCj55QdTfFyOHRu8zxJh3wOv/c/fY=;
        b=KSvbkzPy4MOYZeg7ouMHh58kCaVr7YBvfPAKScVpyHiOKfZcrEaW1FmiX5QBTypIrn
         xUygFWBei+y2EyS/faPdOamWG8lET+PLkJrf4O3C+LN7OGgLL9y2xWGtdG8khJX8M8de
         RseHMGZJ7IGZ4dxR/Fo1KNe5zpAYj6bKItiETJ4MVB06D1NNJZQBZiOyVXn1nbN8OkaS
         oIqrAJnfzQUEVn6q0XOY2xtNtOnd4/6iA6A7E5lgxLig7ldkTI+n7amLmfM7TwaBpbxx
         /xJZgmOS1Sifhs050Ed2YLiixvaAb8uCFf9jry4N8MYNnzb19C1X65616IIY4/AzzmWb
         q2rQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzxYBOAaaK6VgpD+zCsjXynOUo7z/5u2T+pu0XmyBvU1sWV3zBsNx3WjOR1QhyS+ub9PCSTf23RvQe6h0=@vger.kernel.org
X-Gm-Message-State: AFuF++mg3RpRX2xuiPwXmxsn9sV4lKODzt17ROx6Dra3M1ZSN5E3rNpe
	kuIQV4NJuC4ShjhSpJDDJt8p9ZabMNTa1TVqYiSdmsxHRpmPAHoq3oMwPm6RD7UulE3nfn0MHfY
	WmZ5kuYY=
X-Gm-Gg: AYBFou0tjzM5cN/j+2UbuldrIXUIn2MORAUM5GIdWpMW81OQv9Qw+4RsLuvJsUhZZEO
	AyygeaZh0Vr8HhZMtxow3MtUUm62zWIjtS6fVClDVn+AsXpYpw1rYmb6MaLtPlbulH1HYXW+O7+
	rN9hjYVmoYMtm5oUrx+vc/RXFcSFXE+83PoK0fDO8sfmQq1V1cPmmvE1y7f01MTgzdr0VKD7s1T
	D8x9Y6M6HrCnU+WZXLPQfMQXUTUljFjnSJV+sG8KvHbM24oR7UC+vGFz4ddwzHYr5Ce227nm17r
	/JsAMtopzc1SknQbcrP0NMYND+5PxcIzcf1cV1bSy+Ly7bt6QnPDFWG8QEoN1kX4ks1wBfciykp
	W5Lau64jwB6I41WNaPpgEMFgdDhCC/yfKqS7tbuDNcgS07W5xMGkVjOCBjHpIXwLLPYtn32CGH3
	sFfVb+TiA2DAC1iecAbySsDFPBDWYhIDWfDBccYKHvTiI/wT4KUchwb5v40t1jJ0P+4/caM838v
	cT4Dlk07Cv1cMk3r4VOsFJL+LNRyfMdUovGr6QllGrQ6/wDNk6Hjw==
X-Received: by 2002:a05:7022:5f1c:b0:144:c122:6cc6 with SMTP id a92af1059eb24-146d01af925mr4979747c88.32.1790492973282;
        Sun, 27 Sep 2026 00:09:33 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([2601:647:4380:3400:cdfd:5309:3fdc:3b4e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-146bb6551d9sm10322371c88.9.2026.09.27.00.09.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 00:09:32 -0700 (PDT)
From: Saravanan D <saravanand@crusoe.ai>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me,
	axboe@kernel.dk,
	nilay@linux.ibm.com,
	dwagner@suse.de,
	linux-kernel@vger.kernel.org,
	iyamahata@crusoe.ai,
	kiyer@crusoe.ai,
	ganbalagane@crusoe.ai,
	sj@kernel.org,
	Saravanan D <saravanand@crusoe.ai>
Subject: [PATCH v4 1/2] nvme: add per-queue sysfs directories
Date: Sun, 27 Sep 2026 00:09:24 -0700
Message-ID: <20260927070925.47209-2-saravanand@crusoe.ai>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927070925.47209-1-saravanand@crusoe.ai>
References: <20260927070925.47209-1-saravanand@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Transports have per I/O queue state worth exposing, the nvme-tcp
io_cpu to begin with, but the core has no representation of an
individual queue and no place under the controller device to hang
per queue attributes.

Add a small nvme_queue_info that a transport embeds in its queue
structure, and helpers that register it as

  /sys/class/nvme/nvmeX/queues/<qid>/

with a transport provided ktype. The queues directory is created on
the first registration and released with the controller device.
Registration is expected once per controller lifetime, so the
directories persist while the transport's queues cycle across
reconnects.

Suggested-by: Sagi Grimberg <sagi@grimberg.me>
Link: https://lore.kernel.org/linux-nvme/13c160d0-0657-47ce-9a16-58d348267ab0@grimberg.me/
Assisted-by: Claude:claude-opus-4-8 [Claude Code]
Signed-off-by: Saravanan D <saravanand@crusoe.ai>
---
 drivers/nvme/host/core.c  |  2 ++
 drivers/nvme/host/nvme.h  | 23 +++++++++++++++++++++
 drivers/nvme/host/sysfs.c | 42 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index beea23d04a70..211d05a1cc48 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -5197,6 +5197,8 @@ static void nvme_free_ctrl(struct device *dev)
 
 	ctrl->ops->free_ctrl(ctrl);
 
+	kobject_put(ctrl->queues_kobj);
+
 	if (subsys)
 		nvme_put_subsystem(subsys);
 }
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index bac25b287d25..20410f0d6118 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -339,6 +339,28 @@ enum nvme_ctrl_flags {
 	NVME_CTRL_FROZEN		= 6,
 };
 
+enum nvme_queue_info_flags {
+	NVME_QUEUE_INFO_REGISTERED	= 0,
+	NVME_QUEUE_INFO_IO_CPU_USER	= 1,
+};
+
+/*
+ * Common per-queue state, embedded in the transport's queue structure and
+ * backing the /sys/class/nvme/nvmeX/queues/<qid>/ directory.
+ */
+struct nvme_queue_info {
+	struct kobject		kobj;
+	unsigned int		qid;
+	unsigned long		flags;
+};
+
+struct nvme_ctrl;
+
+int nvme_register_queue_info(struct nvme_ctrl *ctrl,
+			     struct nvme_queue_info *qinfo, unsigned int qid,
+			     const struct kobj_type *ktype);
+void nvme_unregister_queue_info(struct nvme_queue_info *qinfo);
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
index 4ac3ea3a86fd..a2780445c33e 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -1313,3 +1313,45 @@ const struct attribute_group *nvme_subsys_attrs_groups[] = {
 	&nvme_subsys_attrs_group,
 	NULL,
 };
+
+/*
+ * Per-queue sysfs directories under /sys/class/nvme/nvmeX/queues/. The
+ * transport backing the controller registers a directory for each of its
+ * queues and provides the attributes through the ktype. Registration is
+ * expected once per controller lifetime, so the directories persist while
+ * the transport's queues cycle across reconnects. The queues directory
+ * itself is released with the controller device.
+ */
+int nvme_register_queue_info(struct nvme_ctrl *ctrl,
+			     struct nvme_queue_info *qinfo, unsigned int qid,
+			     const struct kobj_type *ktype)
+{
+	int ret;
+
+	if (!ctrl->queues_kobj) {
+		ctrl->queues_kobj = kobject_create_and_add("queues",
+							   &ctrl->device->kobj);
+		if (!ctrl->queues_kobj)
+			return -ENOMEM;
+	}
+
+	qinfo->qid = qid;
+	ret = kobject_init_and_add(&qinfo->kobj, ktype, ctrl->queues_kobj,
+				   "%u", qid);
+	if (ret) {
+		kobject_put(&qinfo->kobj);
+		return ret;
+	}
+
+	set_bit(NVME_QUEUE_INFO_REGISTERED, &qinfo->flags);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nvme_register_queue_info);
+
+void nvme_unregister_queue_info(struct nvme_queue_info *qinfo)
+{
+	if (!test_and_clear_bit(NVME_QUEUE_INFO_REGISTERED, &qinfo->flags))
+		return;
+	kobject_put(&qinfo->kobj);
+}
+EXPORT_SYMBOL_GPL(nvme_unregister_queue_info);
-- 
2.55.0

