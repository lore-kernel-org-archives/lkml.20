Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CB93BB114
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790492979; cv=none; b=WL3Hyb5gPvGTZ/CJ+Fi1LVzxxOGQaE0OImlLzxgPva+DYOxuEY/r37BTTnpAJIw4XpdtWFnPMIyn6LU6jkjVR8i5r4hVipM2+wQ7LmfesR06YeQnE45A5145Hqmb+EPG7+GqZk4P2dCD5kPA5XtrauaVo3LeySkJmdcLsp6TwUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790492979; c=relaxed/simple;
	bh=kbnHjqwGm6rIVOVkIrK29xFM1ZIy3uba9QlFOxAqZ34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3gAvJZlkXyEASZz93y9QmcA3a0BRG69RhMEpkx7GN2ECMO3MxSzsVDFP3xOzoAgRLjLwPTZNd1+3tdpbVq1zDJwXncCvVNmKzx+Ry1so8fK7hkSNDRHLfw4vRQfb/bLYMhI8eJxPJ6qvn7CmD3aBAt9jiE1J3X3KcxuNO6t8Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai; spf=pass smtp.mailfrom=crusoe.ai; dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b=UXPFW7ZB; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crusoe.ai header.i=@crusoe.ai header.b="UXPFW7ZB"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-142dd025d07so1719509c88.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1790492976; x=1791097776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HK2zmqCHh0xDqP3HVCbTRprntu2C3xUCOIeZly28qHM=;
        b=UXPFW7ZBl2fB4+4WeZQq2R6aeCCjLlviaWFFxPtle4CWMLCCI/aVEscFI819Qc6TTh
         vugMcyVT1Yk4rnLFSWIGfBgDnqUGGyLuIPAn4wcrUhmzPMKYnYiEzyv7OOWxMXHqsITS
         es7LdU2sQPXBjBcLZgG1kk0Yq87cGLWCB4/NOGbet5aLYDgrn7WHIq6wvk8mdxsW27XC
         NkVMMRsT3yITWM8pgyvFtox+EYpNUmzO4WY9Vamwk3IwiGtaNYXxg9GVT/Qripfbr46r
         fxAGfVoIg3bz3fBAgU5qroQdMVOoSbRilbsJJ41U+2fTh+jXL06B9+Do4YNPyrgX/06k
         p4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790492976; x=1791097776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HK2zmqCHh0xDqP3HVCbTRprntu2C3xUCOIeZly28qHM=;
        b=lFWVxL8yaPYszGErXLvz/tyvm7K9RuyuUg+XW69paJfBLkV50ms4BJRhRO918SBv3Z
         5w/y544cO6dL4w1r2jlkFCVDSNEzYrLxZmx81Y0jXMsuDaLnzxuIftz1H0GaCOD+o+QG
         l6bojFL2cvwMc008TMoVTozEt7w/9GVGivwSoRmKU2A6d9RFen+DC0nwi//+U6dNR3oO
         sG9B7Om5Y+BR+g1pHgXQ4yGkAkRXDbp4ScP+vBgDAaSo+0srxUvzu0gRYI8hKHFdP2+l
         8ssf+ML+zchaAhN/qxnhH4K9yNWzeKSf+iy9owY9Udwo438sjjw4UePfyCvDa5YrYzJ+
         zhug==
X-Forwarded-Encrypted: i=1; AKwUvBy4fOFQsl8ABW8Yg/eU9WCvRERsjg+buYbMVVSgq81fHKceEiwdap7jsW10nCYmRxaCnrGMN3vaemE4M98=@vger.kernel.org
X-Gm-Message-State: AFuF++nkby3/L7ljfigi85oBz8AjDjITkC8mKMS348LIez57Z/X4/zhT
	Tamntv6Gkb799LMDm2WgZUA3YaYURtQmD1h5fNjRgsFt7t9+P2ZXx55yMMgDl7YWCDc=
X-Gm-Gg: AYBFou3dBLRJHTIRJTjDYCXesk1r1v7BVdxA7cHR9GRcvrVAiayaWBR+VicMTlUMbZL
	R2s6pIj3QvpiHO6nFoEwFZRoKKj5Zb+5L2k0hZRGP/DOedSj50VWZdd9aJCQU+8OUnGED1HvBOg
	4TDA3DwnDVcmDlP2JwbOYhyLAt0/n7/W0uQjrsk0puorErUXPTRTsEzJMlqD5iPjG+IyaQ5CenN
	2iRlGp/3oEBGLr0XQIj6eNF5Y7YydCfS+lTecRxVzecfAJlDgXqERj1vp7ViPBE7uOJexRjA45A
	hkUF4KubwCkSncLH3Cn0kHtax6Xfbk9NN6uF9732c2L2BaH7cp/jfgwD9uNr/3gzWYGb7qvgVNN
	6dO/9SGZXagsmyuhFRQVV7Zo1LFFYdHAeRtKOcAUGSfFuEaM3ncR+ijAp9mbp2c2afjscQ8JEl+
	OOVWWgljtEdmlXHa5rLYCEzx93YYsMP8CjdCePv9XVJdyddQIOWwrtJ8DQ9WCo0pGM1wU9f3l8t
	Kb16WjypGAhZBc8UVoYqjBeH/ge3KvpyQ0R+vkL7vemVEQMBv5FbSV+ucTj1W55
X-Received: by 2002:a05:7022:ea8b:b0:13f:c02f:60b1 with SMTP id a92af1059eb24-146ce67f53amr5479644c88.15.1790492975145;
        Sun, 27 Sep 2026 00:09:35 -0700 (PDT)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([2601:647:4380:3400:cdfd:5309:3fdc:3b4e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-146bb6551d9sm10322371c88.9.2026.09.27.00.09.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 27 Sep 2026 00:09:34 -0700 (PDT)
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
Subject: [PATCH v4 2/2] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Sun, 27 Sep 2026 00:09:25 -0700
Message-ID: <20260927070925.47209-3-saravanand@crusoe.ai>
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

nvme_tcp_set_queue_io_cpu() picks each queue's io_cpu at connect time
as the least loaded CPU in the queue's blk-mq map group, and all socket
work runs there for the connection's lifetime. This decision falls
short when the host partitions its CPUs after connect time. On a 384
cpu multi tenant host with 128 queue controllers, blk-mq folds three
CPUs into every map group, some groups straddle two tenants' cpusets,
and 9% of nvme_tcp_io_work executions ran outside the submitting VM's
cpuset, seen by the neighbor as steal time.

Embed the nvme_queue_info in the tcp queue and expose the io_cpu
through the controller's queues directory

  /sys/class/nvme/nvmeX/queues/<qid>/io_cpu

so a control plane that owns CPU placement can set it directly instead
of relying on the driver's heuristic. The attribute accepts a cpu
number, -1 or "unbound", where -1 and "unbound" leave the socket work
unbound, running each invocation on the cpu that queued it. A user
assignment is marked in the queue info flags, persists across
reconnects and is never re-picked by the driver. The read-only
managed attribute reports 1 while io_cpu is driver managed and 0 once
the user assigned it. The accounting of nvme_tcp_cpu_queues applies
regardless of who set the io_cpu.

The queue directories register on the first connect and persist while
the queues cycle across reconnects, so a write can arrive while a
queue is torn down. The io_cpu changes and their accounting therefore
serialize under a controller level lock rather than the queue lock,
which is destroyed with the queue, and the controller teardown waits
for the last kobject release before the queue array is freed.

Suggested-by: Sagi Grimberg <sagi@grimberg.me>
Link: https://lore.kernel.org/linux-nvme/13c160d0-0657-47ce-9a16-58d348267ab0@grimberg.me/
Assisted-by: Claude:claude-opus-4-8 [Claude Code]
Signed-off-by: Saravanan D <saravanand@crusoe.ai>
---
 Documentation/ABI/stable/sysfs-nvme |  21 ++++
 drivers/nvme/host/tcp.c             | 153 +++++++++++++++++++++++++++-
 2 files changed, 173 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-nvme b/Documentation/ABI/stable/sysfs-nvme
index a0bb88ca1694..4d0c7688e8f7 100644
--- a/Documentation/ABI/stable/sysfs-nvme
+++ b/Documentation/ABI/stable/sysfs-nvme
@@ -472,3 +472,24 @@ Contact:	Hannes Reinecke <hare@suse.de>
 Description:
 		Shows the subsystem type. Possible values: "discovery",
 		"nvm", "reserved".
+
+What:		/sys/class/nvme/nvmeX/queues/<qid>/io_cpu
+What:		/sys/class/nvme/nvmeX/queues/<qid>/managed
+Date:		September 2026
+KernelVersion:	7.4
+Contact:	Saravanan D <saravanand@crusoe.ai>
+Description:
+		Per I/O queue directories, populated by the transport
+		backing the controller and persistent across controller
+		reconnects. NVMe over TCP exposes:
+
+		io_cpu: (RW) The CPU that runs the socket work for I/O
+		queue <qid>, selected by the driver at connect time.
+		Writing a CPU number overrides the selection and persists
+		across reconnects. Writing -1 or "unbound" leaves the
+		socket work unbound, running each invocation on the CPU
+		that queued it. Reads return the current CPU, or -1 when
+		the queue is unbound.
+
+		managed: (RO) Shows who owns the CPU placement. 1 while
+		io_cpu is driver managed, 0 once the user assigned it.
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 921934028e0b..567c839e92a4 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -141,6 +141,8 @@ struct nvme_tcp_queue {
 	int                     tls_err;
 	struct page_frag_cache	pf_cache;
 
+	struct nvme_queue_info	q_info;
+
 	void (*state_change)(struct sock *);
 	void (*data_ready)(struct sock *);
 	void (*write_space)(struct sock *);
@@ -171,6 +173,11 @@ struct nvme_tcp_ctrl {
 	struct delayed_work	connect_work;
 	struct nvme_tcp_request async_req;
 	u32			io_queues[HCTX_MAX_TYPES];
+	/* serializes io_cpu changes and their nvme_tcp_cpu_queues accounting */
+	struct mutex		io_cpu_lock;
+	unsigned int		nr_queue_infos;
+	atomic_t		qinfo_refs;
+	struct completion	qinfo_release;
 };
 
 static struct workqueue_struct *nvme_tcp_wq;
@@ -1497,6 +1504,12 @@ static void nvme_tcp_free_queue(struct nvme_ctrl *nctrl, int qid)
 	if (!test_and_clear_bit(NVME_TCP_Q_ALLOCATED, &queue->flags))
 		return;
 
+	/* settle accounting a write racing the queue stop may have left */
+	mutex_lock(&ctrl->io_cpu_lock);
+	if (test_and_clear_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags))
+		atomic_dec(&nvme_tcp_cpu_queues[queue->io_cpu]);
+	mutex_unlock(&ctrl->io_cpu_lock);
+
 	page_frag_cache_drain(&queue->pf_cache);
 
 	/**
@@ -1716,9 +1729,19 @@ static void nvme_tcp_set_queue_io_cpu(struct nvme_tcp_queue *queue)
 	unsigned int *mq_map = NULL;
 	int cpu, min_queues = INT_MAX, io_cpu;
 
+	lockdep_assert_held(&ctrl->io_cpu_lock);
+
 	if (wq_unbound)
 		goto out;
 
+	/* A user assigned io_cpu is kept across reconnects */
+	if (test_bit(NVME_QUEUE_INFO_IO_CPU_USER, &queue->q_info.flags)) {
+		if (queue->io_cpu != WORK_CPU_UNBOUND &&
+		    !test_and_set_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags))
+			atomic_inc(&nvme_tcp_cpu_queues[queue->io_cpu]);
+		goto out;
+	}
+
 	if (nvme_tcp_default_queue(queue))
 		mq_map = set->map[HCTX_TYPE_DEFAULT].mq_map;
 	else if (nvme_tcp_read_queue(queue))
@@ -1836,6 +1859,114 @@ static int nvme_tcp_start_tls(struct nvme_ctrl *nctrl,
 	return ret;
 }
 
+static struct nvme_tcp_queue *nvme_tcp_kobj_to_queue(struct kobject *kobj)
+{
+	struct nvme_queue_info *qinfo =
+		container_of(kobj, struct nvme_queue_info, kobj);
+
+	return container_of(qinfo, struct nvme_tcp_queue, q_info);
+}
+
+static ssize_t io_cpu_show(struct kobject *kobj, struct kobj_attribute *attr,
+			   char *buf)
+{
+	struct nvme_tcp_queue *queue = nvme_tcp_kobj_to_queue(kobj);
+	int io_cpu = READ_ONCE(queue->io_cpu);
+
+	return sysfs_emit(buf, "%d\n",
+			  io_cpu == WORK_CPU_UNBOUND ? -1 : io_cpu);
+}
+
+static ssize_t io_cpu_store(struct kobject *kobj, struct kobj_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct nvme_tcp_queue *queue = nvme_tcp_kobj_to_queue(kobj);
+	struct nvme_tcp_ctrl *ctrl = queue->ctrl;
+	int cpu, old;
+	int ret;
+
+	if (sysfs_streq(buf, "unbound")) {
+		cpu = WORK_CPU_UNBOUND;
+	} else {
+		ret = kstrtoint(buf, 0, &cpu);
+		if (ret)
+			return ret;
+		if (cpu == -1)
+			cpu = WORK_CPU_UNBOUND;
+		else if ((unsigned int)cpu >= nr_cpu_ids || !cpu_online(cpu))
+			return -EINVAL;
+	}
+
+	mutex_lock(&ctrl->io_cpu_lock);
+	old = xchg(&queue->io_cpu, cpu);
+	set_bit(NVME_QUEUE_INFO_IO_CPU_USER, &queue->q_info.flags);
+	if (test_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags)) {
+		atomic_dec(&nvme_tcp_cpu_queues[old]);
+		if (cpu != WORK_CPU_UNBOUND)
+			atomic_inc(&nvme_tcp_cpu_queues[cpu]);
+		else
+			clear_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags);
+	} else if (cpu != WORK_CPU_UNBOUND &&
+		   test_bit(NVME_TCP_Q_ALLOCATED, &queue->flags)) {
+		/* account a pin to a connected queue the pick left unbound */
+		atomic_inc(&nvme_tcp_cpu_queues[cpu]);
+		set_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags);
+	}
+	mutex_unlock(&ctrl->io_cpu_lock);
+
+	return count;
+}
+
+static ssize_t managed_show(struct kobject *kobj, struct kobj_attribute *attr,
+			    char *buf)
+{
+	struct nvme_tcp_queue *queue = nvme_tcp_kobj_to_queue(kobj);
+
+	return sysfs_emit(buf, "%d\n",
+			  !test_bit(NVME_QUEUE_INFO_IO_CPU_USER, &queue->q_info.flags));
+}
+
+static struct kobj_attribute nvme_tcp_io_cpu_attr =
+	__ATTR(io_cpu, 0644, io_cpu_show, io_cpu_store);
+static struct kobj_attribute nvme_tcp_managed_attr =
+	__ATTR_RO(managed);
+
+static struct attribute *nvme_tcp_queue_attrs[] = {
+	&nvme_tcp_io_cpu_attr.attr,
+	&nvme_tcp_managed_attr.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(nvme_tcp_queue);
+
+static void nvme_tcp_queue_info_release(struct kobject *kobj)
+{
+	struct nvme_tcp_queue *queue = nvme_tcp_kobj_to_queue(kobj);
+	struct nvme_tcp_ctrl *ctrl = queue->ctrl;
+
+	if (atomic_dec_and_test(&ctrl->qinfo_refs))
+		complete(&ctrl->qinfo_release);
+}
+
+static const struct kobj_type nvme_tcp_queue_ktype = {
+	.sysfs_ops	= &kobj_sysfs_ops,
+	.release	= nvme_tcp_queue_info_release,
+	.default_groups	= nvme_tcp_queue_groups,
+};
+
+static void nvme_tcp_register_queue_sysfs(struct nvme_tcp_queue *queue)
+{
+	struct nvme_tcp_ctrl *ctrl = queue->ctrl;
+
+	if (test_bit(NVME_QUEUE_INFO_REGISTERED, &queue->q_info.flags))
+		return;
+
+	/* a failed registration drops the reference through the release */
+	atomic_inc(&ctrl->qinfo_refs);
+	nvme_register_queue_info(&ctrl->ctrl, &queue->q_info,
+				 nvme_tcp_queue_id(queue),
+				 &nvme_tcp_queue_ktype);
+}
+
 static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 				key_serial_t pskid)
 {
@@ -1906,7 +2037,8 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 
 	queue->sock->sk->sk_allocation = GFP_ATOMIC;
 	queue->sock->sk->sk_use_task_frag = false;
-	queue->io_cpu = WORK_CPU_UNBOUND;
+	if (!test_bit(NVME_QUEUE_INFO_IO_CPU_USER, &queue->q_info.flags))
+		queue->io_cpu = WORK_CPU_UNBOUND;
 	queue->request = NULL;
 	queue->data_remaining = 0;
 	queue->ddgst_remaining = 0;
@@ -1974,6 +2106,9 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 
 	set_bit(NVME_TCP_Q_ALLOCATED, &queue->flags);
 
+	if (qid)
+		nvme_tcp_register_queue_sysfs(queue);
+
 	return 0;
 
 err_init_connect:
@@ -2022,8 +2157,10 @@ static void nvme_tcp_stop_queue_nowait(struct nvme_ctrl *nctrl, int qid)
 	if (!test_bit(NVME_TCP_Q_ALLOCATED, &queue->flags))
 		return;
 
+	mutex_lock(&ctrl->io_cpu_lock);
 	if (test_and_clear_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags))
 		atomic_dec(&nvme_tcp_cpu_queues[queue->io_cpu]);
+	mutex_unlock(&ctrl->io_cpu_lock);
 
 	mutex_lock(&queue->queue_lock);
 	if (test_and_clear_bit(NVME_TCP_Q_LIVE, &queue->flags))
@@ -2085,7 +2222,9 @@ static int nvme_tcp_start_queue(struct nvme_ctrl *nctrl, int idx)
 	nvme_tcp_setup_sock_ops(queue);
 
 	if (idx) {
+		mutex_lock(&ctrl->io_cpu_lock);
 		nvme_tcp_set_queue_io_cpu(queue);
+		mutex_unlock(&ctrl->io_cpu_lock);
 		ret = nvmf_connect_io_queue(nctrl, idx);
 	} else
 		ret = nvmf_connect_admin_queue(nctrl);
@@ -2650,6 +2789,14 @@ static void nvme_tcp_free_ctrl(struct nvme_ctrl *nctrl)
 
 	nvmf_free_options(nctrl->opts);
 free_ctrl:
+	if (ctrl->queues) {
+		unsigned int qid;
+
+		for (qid = 1; qid < ctrl->nr_queue_infos; qid++)
+			nvme_unregister_queue_info(&ctrl->queues[qid].q_info);
+		if (!atomic_dec_and_test(&ctrl->qinfo_refs))
+			wait_for_completion(&ctrl->qinfo_release);
+	}
 	kfree(ctrl->queues);
 	kfree(ctrl);
 }
@@ -3047,6 +3194,10 @@ static struct nvme_tcp_ctrl *nvme_tcp_alloc_ctrl(struct device *dev,
 		ret = -ENOMEM;
 		goto out_free_ctrl;
 	}
+	ctrl->nr_queue_infos = ctrl->ctrl.queue_count;
+	mutex_init(&ctrl->io_cpu_lock);
+	atomic_set(&ctrl->qinfo_refs, 1);
+	init_completion(&ctrl->qinfo_release);
 
 	ret = nvme_init_ctrl(&ctrl->ctrl, dev, &nvme_tcp_ctrl_ops, 0);
 	if (ret)
-- 
2.55.0

