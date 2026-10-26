Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028625;
	b=E0njnhh+WhSvVEYFgZ32W7mqYpPf3EurCMnIGlY24PJYJPiNyiLR8Z1TzN/zVj4MgBrq
	 pkqYqT7TPjgP3aVwUUBpKlORAlkGHzMm6EAMLAlRPkr5knkV83iGcoYFAvwNCGuvSQ6Lq
	 NJU2aF6Ol6HOlpZtmkbtAE3Ge44DGEzSRVgTN76uZTb++TWoNXIEtxtAiKSk0PHCZWSoi
	 WtWjx4Ffim0sx6dedNLiQsiWjV2UiP3ifhCmjvtmgTRw3jxNQl68ShwCBBRgMjhHIZuil
	 tpfy/yTcDSgucrPVD/Lf8NM2FTmqyfetCsrIDBQu9cvtypeIj+QWSj6tgieKd4psT9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=HmO/VpEv2fHoPCxCmGbSbedwbN0KwgfnJNJbKtenalY=;
	b=i3e1qCqoBpRH6Olf3m8vgk82lq3HrtZcCUtxoVZJ8JaEiwleFY75cI6GDgNGd00BvX5k
	 2SNmq6dVrtRmDKbWeLi+uOCCLiHEz8SaWLsoZx6g41qxFjz0GVZBBtRfW2kXlYdEhBq0t
	 a2zREiluu+YN0pRI08xwDd9kC2rS/DPdwijFUKOL3TsLATe6l0TdYLJZR+1IspO41Wzc6
	 75Npg+WYPC9X8G9uKMPLQUJe1OqJSSTOccl6iQRrK08yOmHi/gQgp9//LHb0NyRn/2I0s
	 wGDOtTpSArXK8Cb3T2ABSwZRyLAde2gYmTfA2V5xm/LcgH5Vt7eBz+fi93jsDGVWv/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dXFCAUGn;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3FA606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA3FA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dXFCAUGn
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso1860924b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793028624; x=1793633424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmO/VpEv2fHoPCxCmGbSbedwbN0KwgfnJNJbKtenalY=;
        b=dXFCAUGnU1RR72VqY0GcstFtLimgSRgTuI6HnJnxoPcEwba6MDxQRwYBDQQuJJpb+/
         4KKZCe9ps9idhry6cxFNbhXH87BDPZOnQP1ZHHOeG9caQCBcjJxhCTSh3IaL8yNIFiP6
         bKdSGBY86l9rC3Cg9amQ1SC8BkuNg81cMQ0nzrDp0hFn1/rUYnirFC/fSK8XEay4fxSX
         FjxtSVyIFu9O/OwUHwoiuUJAicae3qLjH1Sp4sgVVvzfDQtaGuVirHUpTEak0i4Tm4A5
         45N01eColYyMULdEo1GqwsgXlnM/TdkdMM8GbBaaDRMhfVxkXnRdFkvBQrMr21rmi2ku
         rcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028624; x=1793633424;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HmO/VpEv2fHoPCxCmGbSbedwbN0KwgfnJNJbKtenalY=;
        b=wBmqotkhbdvc1283hcbMM2NOfTJIhkoIMdvrCIBiIpKE55QAARaXbYjg2tUuUKc/e1
         cIIkyZoquiOlf4gdRLcCtiO/cLLIPEft1No0jFwngrQIA1KBkGmgPBMMojB1hY75PwTN
         zAFIcvdLcZaZ4O1lSjAcJWFeQA/hdMz2po9Gop6WpivIzNuSiU66FdRy0HEydWeTkVao
         dMh9BkYjoZg1q1wJHzMcCsHiQYgN5sYvEurckZKscqijulJR+h22rNqkpm3EZ5jTVqlV
         dLjztfz3PV/s48QPTsoqnwazvKfheIhBXYdTB1FpLqKOxCpzn5L/PRzmOEAqyuHyOzf2
         zSuA==
X-Forwarded-Encrypted: i=1; AKwUvBzVBNgiKypdwcz0jN0ZYfr8Yms//atIu8PtsgXb95gxBlhphVemiZbZsBX73rVDHBZQ6fCeqxT/JNHkXIo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6lWvR+eInCaiBBFt4/z1tSqNrlyRwlVCxnNdqL/EyBP6lADOW
	zbhBMvcBNW6nw75sCx6lvO/lAYD32fNO4M19vkWZHNbvOyMH89ScQa6k
X-Gm-Gg: AYBFou0dZSk9hw0wPIEokZMkvau0yxwdXrEsCtCP9BrslEWh7AaCbXIxq/j+v065x0f
	DJSxnF4KCINFFWwJA48U8Rw5QzwuR8bcrAcCKMl9yfkGob75ezAV2LgGR52k7D1mzhjJgV3Vr6V
	cnO6q4QVM3rDmEaa0K3cYZc9+t78Hz5pgkmuUI+m2+g0gkLE6ZZbncwRyOOXyCLuIWKOdTQlQJy
	WrW8CgmHxw8jj3IeGCrxbpNtIk+gqEDcs5aaRRAn9wFGETseYpGuwgYrd9mgZgSQQS5TiV4zOF0
	5lEtLfDuZvXcih1Y6RN4MJA9c3ff/LcBu0U/sJqoaip3bEzJG+8a9tU+K9g19qRZKCGsR18dZFL
	zQbGOE+LUocAzCQCN3ZoSqAWo21fZILiahr7XGn+zLfbP8bqdFTndftGRDdWLndYSY3sHrtZ3vS
	7TSBkBQEHnXF8rx/ciLlN0f0g3FPF1TcLKWr1zxnpZzSiu5QE1D3hssiGJnInzgHufPTFeDga8p
	qLXnkWqEQp9K7k5v9LfzMO9ft64PP1fFxoDvLE40pzC9yT5snroos1Ue/AFwfZalMp830AosDwQ
	J0iITA9Z+ovZDk5falHKPQGP1Uy32K7kdgOB+qf0xe46JT+jqygpi/m9xsgsgFvOLgYaeYE7AVg
	qT720Y55gphjr6w+LpZwu15ML4mxyLfjg8A==
X-Received: by 2002:a05:6a20:548d:b0:3e6:ea1c:fd2b with SMTP id adf61e73a8af0-3e7cd52c08fmr6897195637.35.1793028623902;
        Mon, 26 Oct 2026 08:30:23 -0700 (PDT)
Received: from yupeng-XPS-15-9520.. (c-73-169-192-12.hsd1.wa.comcast.net. [73.169.192.12])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc67961sm1784346a12.17.2026.10.26.08.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:30:23 -0700 (PDT)
From: Peng Yu <yupeng0921@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: Keith Busch <kbusch@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Jens Axboe <axboe@kernel.dk>,
	Maurizio Lombardi <mlombard@arkamax.eu>,
	cgroups@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Yu <yupeng0921@gmail.com>
Subject: [PATCH v10] nvmet: add cgroup_id to charge namespace I/O to a cgroup
Date: Mon, 26 Oct 2026 08:30:20 -0700
Message-ID: <20261026153020.47791-1-yupeng0921@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The nvmet issues namespace IOs from kernel threads. So the io.max and
other cgroup controllers can't apply limits to the namespaces.
Considering this scenario: The LVM creates multiple logical volumes on
the same physical disk, the logical volumes are assigned to different
nvmet subsystems/namespaces. We want to stop a remote noisy user from
using all the disk iops via nvmet. So add a per namespace css. Each
namespace could be throttled separately.

The per namespace css is good enough for the io.max, but is not good
enough for the io.cost and io.latency. The io.cost and io.latency may
put a thread to sleep. If the thread is shared by different namespaces,
all of them will be impacted together. Submit the IOs via a workqueue to
avoid this impact.

Performance test:
On a 4 core VM and 4G ramdisk, export tcp-nvmeof targets to 127.0.0.1,
run fio with below parameters:
fio --bs=4k --rw=randwrite --iodepth=32 --numjobs=4 --ioengine=libaio --direct=1

file backend result:
|                           | IOPS   | Mean Latency | p99 latency |
|without v10 patch          | 424.4k | 301.4 µs     | 330 µs      |
|v10 patch, cgroup_id unset | 425.1k | 300.9 µs     | 330 µs      |
|v10 patch, cgroup_id set   | 363.4k | 352.0 µs     | 1171 µs     |

block device backend result:
|                           | IOPS   | Mean Latency | p99 latency |
|without v10 patch          | 446.4k | 286.5 µs     | 313 µs      |
|v10 patch, cgroup_id unset | 446.4k | 286.5 µs     | 313 µs      |
|v10 patch, cgroup_id set   | 356.7k | 358.6 µs     | 864 µs      |

With this patch and no cgroup_id set, the peformance is almost the same.
When we set the cgroup_id, we can see a performance decrease but it
is still very fast.

Signed-off-by: Peng Yu <yupeng0921@gmail.com>
Assisted-by: Claude:claude-fable-5 [Claude Code]
Assisted-by: Claude:claude-opus-5-5 [Claude Code]
---
Changes since v9:
* Queue one work item per command on the namespace's workqueue, with
  max_active set to the number of online CPUs, instead of running all
  commands of a namespace from a single work item (Tejun).
* Rebased on nvme-7.4 (aaedcff90148).

Tejun's v9 comment: https://lore.kernel.org/all/aee729fd53ef9c7c084a443216cfeb39@kernel.org/
v9: https://lore.kernel.org/all/20261023043423.176002-1-yupeng0921@gmail.com/
v8: https://lore.kernel.org/all/20261002152821.410591-1-yupeng0921@gmail.com/
v7 (with test steps): https://lore.kernel.org/all/20260929232411.101087-1-yupeng0921@gmail.com/

 Documentation/ABI/stable/configfs-nvmet |  16 +++
 drivers/nvme/target/configfs.c          |  47 ++++++++
 drivers/nvme/target/core.c              | 145 ++++++++++++++++++++++++
 drivers/nvme/target/io-cmd-file.c       |  19 +++-
 drivers/nvme/target/nvmet.h             |  51 +++++++++
 drivers/nvme/target/zns.c               |   6 +-
 6 files changed, 279 insertions(+), 5 deletions(-)

diff --git a/Documentation/ABI/stable/configfs-nvmet b/Documentation/ABI/stable/configfs-nvmet
index 36b587404ee7..ea9c4083c6a0 100644
--- a/Documentation/ABI/stable/configfs-nvmet
+++ b/Documentation/ABI/stable/configfs-nvmet
@@ -314,6 +314,22 @@ Description:
 		attr_subsys_vendor_id: Shows or sets the PCI subsystem
 		vendor ID. Displayed in "0x%x" format.
 
+What:		/config/nvmet/subsystems/NAME/namespaces/NSID/cgroup_id
+Date:		October 2026
+KernelVersion:	7.5
+Contact:	Peng Yu <yupeng0921@gmail.com>
+Description:
+		Shows or sets the cgroup2 ID of the cgroup to charge this
+		namespace's I/O to. Writing 0 clears it. The I/O is
+		charged to the cgroup's effective io css: the cgroup
+		itself or its nearest ancestor with the io controller
+		enabled. The namespace must be disabled before
+		modification. Enabling the namespace fails if the cgroup
+		can't be found or if buffered_io is set. A cgroup that is
+		removed and created again gets a new ID.
+
+		Only available when CONFIG_BLK_CGROUP is enabled.
+
 What:		/config/nvmet/hosts/HOSTNQN/dhchap_key
 What:		/config/nvmet/hosts/HOSTNQN/dhchap_ctrl_key
 What:		/config/nvmet/hosts/HOSTNQN/dhchap_hash
diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index 7cd88d6bfd61..f3c665d1558d 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -561,6 +561,50 @@ static ssize_t nvmet_ns_device_path_store(struct config_item *item,
 
 CONFIGFS_ATTR(nvmet_ns_, device_path);
 
+#ifdef CONFIG_BLK_CGROUP
+static ssize_t nvmet_ns_cgroup_id_show(struct config_item *item, char *page)
+{
+	struct nvmet_ns *ns = to_nvmet_ns(item);
+	struct nvmet_subsys *subsys = ns->subsys;
+	ssize_t ret;
+
+	mutex_lock(&subsys->lock);
+	ret = snprintf(page, PAGE_SIZE, "%llu\n", ns->cgroup_id);
+	mutex_unlock(&subsys->lock);
+	return ret;
+}
+
+static ssize_t nvmet_ns_cgroup_id_store(struct config_item *item,
+		const char *page, size_t count)
+{
+	struct nvmet_ns *ns = to_nvmet_ns(item);
+	struct nvmet_subsys *subsys = ns->subsys;
+	u64 cgroup_id;
+	int ret;
+
+	ret = kstrtou64(page, 0, &cgroup_id);
+	if (ret)
+		return ret;
+
+	mutex_lock(&subsys->lock);
+
+	if (ns->enabled) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	/* Writing 0 clears the association. */
+	ns->cgroup_id = cgroup_id;
+	ret = count;
+
+out_unlock:
+	mutex_unlock(&subsys->lock);
+	return ret;
+}
+
+CONFIGFS_ATTR(nvmet_ns_, cgroup_id);
+#endif /* CONFIG_BLK_CGROUP */
+
 #ifdef CONFIG_PCI_P2PDMA
 static ssize_t nvmet_ns_p2pmem_show(struct config_item *item, char *page)
 {
@@ -833,6 +877,9 @@ static struct configfs_attribute *nvmet_ns_attrs[] = {
 	&nvmet_ns_attr_buffered_io,
 	&nvmet_ns_attr_revalidate_size,
 	&nvmet_ns_attr_resv_enable,
+#ifdef CONFIG_BLK_CGROUP
+	&nvmet_ns_attr_cgroup_id,
+#endif
 #ifdef CONFIG_PCI_P2PDMA
 	&nvmet_ns_attr_p2pmem,
 #endif
diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 4955872dc1fc..624955cc7fb5 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -4,12 +4,15 @@
  * Copyright (c) 2015-2016 HGST, a Western Digital Company.
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+#include <linux/cgroup.h>
 #include <linux/hex.h>
+#include <linux/kthread.h>
 #include <linux/module.h>
 #include <linux/random.h>
 #include <linux/rculist.h>
 #include <linux/pci-p2pdma.h>
 #include <linux/scatterlist.h>
+#include <linux/sched/mm.h>
 
 #include <generated/utsrelease.h>
 
@@ -474,8 +477,144 @@ void nvmet_put_namespace(struct nvmet_ns *ns)
 	percpu_ref_put(&ns->ref);
 }
 
+#ifdef CONFIG_BLK_CGROUP
+static int nvmet_blkcg_ns_enable(struct nvmet_ns *ns)
+{
+	struct cgroup *cgrp;
+
+	if (!ns->cgroup_id)
+		return 0;
+
+	/*
+	 * Buffered writes will be handled by a separate thread,
+	 * these IOs have no namespace/cgroup information at that time,
+	 * so we don't support buffered io.
+	 */
+	if (ns->buffered_io) {
+		pr_err("cgroup_id is not supported with buffered_io: %s\n",
+		       ns->device_path);
+		return -EINVAL;
+	}
+
+	cgrp = cgroup_get_from_id(ns->cgroup_id);
+	if (IS_ERR(cgrp)) {
+		pr_err("failed to resolve cgroup id %llu: %ld\n",
+		       ns->cgroup_id, PTR_ERR(cgrp));
+		return PTR_ERR(cgrp);
+	}
+
+	ns->blkcg_wq = alloc_workqueue("nvmet-blkcg-%u",
+			WQ_MEM_RECLAIM | WQ_UNBOUND, num_online_cpus(),
+			ns->nsid);
+	if (!ns->blkcg_wq) {
+		cgroup_put(cgrp);
+		return -ENOMEM;
+	}
+
+	ns->cgrp = cgrp;
+	return 0;
+}
+
+static void nvmet_blkcg_ns_disable(struct nvmet_ns *ns)
+{
+	if (ns->cgrp) {
+		/*
+		 * No command is left, but the work item of a command that
+		 * completed from inside ->blkcg_execute() may still be
+		 * returning: destroy_workqueue() waits for it.
+		 */
+		destroy_workqueue(ns->blkcg_wq);
+		ns->blkcg_wq = NULL;
+		cgroup_put(ns->cgrp);
+		ns->cgrp = NULL;
+	}
+}
+
+/*
+ * Charge the I/O that the current work item submits for @req to the
+ * effective io css of the namespace's cgroup, looked up for each command.
+ */
+bool nvmet_blkcg_begin(struct nvmet_req *req)
+{
+	struct nvmet_ns *ns = req->ns;
+	struct cgroup_subsys_state *css;
+
+	/* a disable waits for the command: don't throttle it any more */
+	if (!ns->cgrp || !READ_ONCE(ns->enabled))
+		return false;
+
+	css = cgroup_get_e_css(ns->cgrp, &io_cgrp_subsys);
+	kthread_associate_blkcg(css);
+	css_put(css);
+	return true;
+}
+
+void nvmet_blkcg_end(bool associated)
+{
+	if (associated)
+		kthread_associate_blkcg(NULL);
+}
+
+/*
+ * The io.cost and io.latency enforce their limits by putting the thread to
+ * sleep. A transport thread may be shared by multiple namespaces. In the
+ * tcp-nvmeof case, all namespaces in the same subsystem may share a
+ * thread. So we submit the IOs via the workqueue, thus the current thread
+ * won't be blocked.
+ */
+static void nvmet_blkcg_work(struct work_struct *work)
+{
+	struct nvmet_req *req =
+		container_of(work, struct nvmet_req, blkcg_work);
+	unsigned int noio_flag;
+	bool associated;
+
+	/* its queue is being deleted: abort it rather than throttle it */
+	if (unlikely(percpu_ref_is_dying(&req->sq->ref))) {
+		nvmet_req_complete(req, NVME_SC_ABORT_QUEUE);
+		return;
+	}
+
+	/* reclaim must not wait for I/O queued on this workqueue */
+	noio_flag = memalloc_noio_save();
+	associated = nvmet_blkcg_begin(req);
+	req->blkcg_execute(req);
+	nvmet_blkcg_end(associated);
+	memalloc_noio_restore(noio_flag);
+}
+
+static void nvmet_blkcg_queue_req(struct nvmet_req *req)
+{
+	INIT_WORK(&req->blkcg_work, nvmet_blkcg_work);
+	queue_work(req->ns->blkcg_wq, &req->blkcg_work);
+}
+
+static void nvmet_blkcg_init_req(struct nvmet_req *req)
+{
+	if (!req->ns->cgrp)
+		return;
+
+	req->blkcg_execute = req->execute;
+	req->execute = nvmet_blkcg_queue_req;
+}
+#else
+static inline int nvmet_blkcg_ns_enable(struct nvmet_ns *ns)
+{
+	return 0;
+}
+
+static inline void nvmet_blkcg_ns_disable(struct nvmet_ns *ns)
+{
+}
+
+static inline void nvmet_blkcg_init_req(struct nvmet_req *req)
+{
+}
+#endif /* CONFIG_BLK_CGROUP */
+
 static void nvmet_ns_dev_disable(struct nvmet_ns *ns)
 {
+	nvmet_blkcg_ns_disable(ns);
 	nvmet_bdev_ns_disable(ns);
 	nvmet_file_ns_disable(ns);
 }
@@ -602,6 +741,10 @@ int nvmet_ns_enable(struct nvmet_ns *ns)
 	if (ret)
 		goto out_unlock;
 
+	ret = nvmet_blkcg_ns_enable(ns);
+	if (ret)
+		goto out_dev_disable;
+
 	ret = nvmet_p2pmem_ns_enable(ns);
 	if (ret)
 		goto out_dev_disable;
@@ -1160,6 +1303,8 @@ static u16 nvmet_parse_io_cmd(struct nvmet_req *req)
 	if (ret)
 		return ret;
 
+	nvmet_blkcg_init_req(req);
+
 	if (req->ns->pr.enable) {
 		ret = nvmet_pr_check_cmd_access(req);
 		if (ret)
diff --git a/drivers/nvme/target/io-cmd-file.c b/drivers/nvme/target/io-cmd-file.c
index 695963dd932e..673df713c954 100644
--- a/drivers/nvme/target/io-cmd-file.c
+++ b/drivers/nvme/target/io-cmd-file.c
@@ -257,8 +257,13 @@ u16 nvmet_file_flush(struct nvmet_req *req)
 static void nvmet_file_flush_work(struct work_struct *w)
 {
 	struct nvmet_req *req = container_of(w, struct nvmet_req, f.work);
+	bool associated;
+	u16 status;
 
-	nvmet_req_complete(req, nvmet_file_flush(req));
+	associated = nvmet_blkcg_begin(req);
+	status = nvmet_file_flush(req);
+	nvmet_blkcg_end(associated);
+	nvmet_req_complete(req, status);
 }
 
 static void nvmet_file_execute_flush(struct nvmet_req *req)
@@ -266,7 +271,7 @@ static void nvmet_file_execute_flush(struct nvmet_req *req)
 	if (!nvmet_check_transfer_len(req, 0))
 		return;
 	INIT_WORK(&req->f.work, nvmet_file_flush_work);
-	queue_work(nvmet_wq, &req->f.work);
+	nvmet_req_queue_work(req, nvmet_wq, &req->f.work);
 }
 
 static void nvmet_file_execute_discard(struct nvmet_req *req)
@@ -274,10 +279,12 @@ static void nvmet_file_execute_discard(struct nvmet_req *req)
 	int mode = FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE;
 	struct nvme_dsm_range range;
 	loff_t offset, len;
+	bool associated;
 	u16 status = 0;
 	int ret;
 	int i;
 
+	associated = nvmet_blkcg_begin(req);
 	for (i = 0; i <= le32_to_cpu(req->cmd->dsm.nr); i++) {
 		status = nvmet_copy_from_sgl(req, i * sizeof(range), &range,
 					sizeof(range));
@@ -300,6 +307,7 @@ static void nvmet_file_execute_discard(struct nvmet_req *req)
 			break;
 		}
 	}
+	nvmet_blkcg_end(associated);
 
 	nvmet_req_complete(req, status);
 }
@@ -326,7 +334,7 @@ static void nvmet_file_execute_dsm(struct nvmet_req *req)
 	if (!nvmet_check_data_len_lte(req, nvmet_dsm_len(req)))
 		return;
 	INIT_WORK(&req->f.work, nvmet_file_dsm_work);
-	queue_work(nvmet_wq, &req->f.work);
+	nvmet_req_queue_work(req, nvmet_wq, &req->f.work);
 }
 
 static void nvmet_file_write_zeroes_work(struct work_struct *w)
@@ -336,6 +344,7 @@ static void nvmet_file_write_zeroes_work(struct work_struct *w)
 	int mode = FALLOC_FL_ZERO_RANGE | FALLOC_FL_KEEP_SIZE;
 	loff_t offset;
 	loff_t len;
+	bool associated;
 	int ret;
 
 	offset = le64_to_cpu(write_zeroes->slba) << req->ns->blksize_shift;
@@ -347,7 +356,9 @@ static void nvmet_file_write_zeroes_work(struct work_struct *w)
 		return;
 	}
 
+	associated = nvmet_blkcg_begin(req);
 	ret = vfs_fallocate(req->ns->file, mode, offset, len);
+	nvmet_blkcg_end(associated);
 	nvmet_req_complete(req, ret < 0 ? errno_to_nvme_status(req, ret) : 0);
 }
 
@@ -356,7 +367,7 @@ static void nvmet_file_execute_write_zeroes(struct nvmet_req *req)
 	if (!nvmet_check_transfer_len(req, 0))
 		return;
 	INIT_WORK(&req->f.work, nvmet_file_write_zeroes_work);
-	queue_work(nvmet_wq, &req->f.work);
+	nvmet_req_queue_work(req, nvmet_wq, &req->f.work);
 }
 
 u16 nvmet_file_parse_io_cmd(struct nvmet_req *req)
diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
index e315f1c24e73..9a9fba051248 100644
--- a/drivers/nvme/target/nvmet.h
+++ b/drivers/nvme/target/nvmet.h
@@ -115,6 +115,22 @@ struct nvmet_ns {
 	struct nvmet_subsys	*subsys;
 	const char		*device_path;
 
+#ifdef CONFIG_BLK_CGROUP
+	u64			cgroup_id;
+	/*
+	 * Resolved from ->cgroup_id when the namespace is enabled and
+	 * released when it is disabled, so it has the same lifetime and
+	 * visibility rules as ->bdev and ->file.
+	 */
+	struct cgroup		*cgrp;
+	/*
+	 * The I/O commands of a namespace with a cgroup, except Reservation
+	 * commands, are executed from their own work items on ->blkcg_wq, so
+	 * the cgroup's throttling doesn't put a transport context to sleep.
+	 */
+	struct workqueue_struct	*blkcg_wq;
+#endif
+
 	struct config_group	device_group;
 	struct config_group	group;
 
@@ -507,6 +523,11 @@ struct nvmet_req {
 
 	void (*execute)(struct nvmet_req *req);
 	const struct nvmet_fabrics_ops *ops;
+#ifdef CONFIG_BLK_CGROUP
+	/* the backend's ->execute, called from ->blkcg_work */
+	void (*blkcg_execute)(struct nvmet_req *req);
+	struct work_struct	blkcg_work;
+#endif
 
 	struct pci_dev		*p2p_dev;
 	struct device		*p2p_client;
@@ -746,6 +767,36 @@ void nvmet_bdev_execute_zone_mgmt_recv(struct nvmet_req *req);
 void nvmet_bdev_execute_zone_mgmt_send(struct nvmet_req *req);
 void nvmet_bdev_execute_zone_append(struct nvmet_req *req);
 
+#ifdef CONFIG_BLK_CGROUP
+bool nvmet_blkcg_begin(struct nvmet_req *req);
+void nvmet_blkcg_end(bool associated);
+#else
+static inline bool nvmet_blkcg_begin(struct nvmet_req *req)
+{
+	return false;
+}
+
+static inline void nvmet_blkcg_end(bool associated)
+{
+}
+#endif /* CONFIG_BLK_CGROUP */
+
+/*
+ * The backends' work items of a namespace with a cgroup may sleep in the
+ * cgroup's throttling, so queue them on the namespace's own workqueue,
+ * where they can't use up the max_active or the rescuer of a workqueue
+ * that other namespaces share.
+ */
+static inline void nvmet_req_queue_work(struct nvmet_req *req,
+		struct workqueue_struct *wq, struct work_struct *work)
+{
+#ifdef CONFIG_BLK_CGROUP
+	if (req->ns->blkcg_wq)
+		wq = req->ns->blkcg_wq;
+#endif
+	queue_work(wq, work);
+}
+
 static inline u32 nvmet_rw_data_len(struct nvmet_req *req)
 {
 	return ((u32)le16_to_cpu(req->cmd->rw.length) + 1) <<
diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
index 92f5c1435582..06d9a1224571 100644
--- a/drivers/nvme/target/zns.c
+++ b/drivers/nvme/target/zns.c
@@ -498,8 +498,11 @@ static void nvmet_bdev_zmgmt_send_work(struct work_struct *w)
 	struct block_device *bdev = req->ns->bdev;
 	sector_t zone_sectors = bdev_zone_sectors(bdev);
 	u16 status = NVME_SC_SUCCESS;
+	bool associated;
 	int ret;
 
+	associated = nvmet_blkcg_begin(req);
+
 	if (op == REQ_OP_LAST) {
 		req->error_loc = offsetof(struct nvme_zone_mgmt_send_cmd, zsa);
 		status = NVME_SC_ZONE_INVALID_TRANSITION | NVME_STATUS_DNR;
@@ -529,13 +532,14 @@ static void nvmet_bdev_zmgmt_send_work(struct work_struct *w)
 		status = blkdev_zone_mgmt_errno_to_nvme_status(ret);
 
 out:
+	nvmet_blkcg_end(associated);
 	nvmet_req_complete(req, status);
 }
 
 void nvmet_bdev_execute_zone_mgmt_send(struct nvmet_req *req)
 {
 	INIT_WORK(&req->z.zmgmt_work, nvmet_bdev_zmgmt_send_work);
-	queue_work(zbd_wq, &req->z.zmgmt_work);
+	nvmet_req_queue_work(req, zbd_wq, &req->z.zmgmt_work);
 }
 
 static void nvmet_bdev_zone_append_bio_done(struct bio *bio)

base-commit: aaedcff9014876387504a8b92d227766cb95015c
-- 
2.53.0

