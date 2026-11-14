Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625570;
	b=czzrYzJlvOVZ8PAbAG3N1jk+QuTqPDUZwQtTpyHgcuRmCHfsJZ1cRRl8/KfSEj8by3EF
	 nCvtJw8ErdrqknvbScNyqI741U1rwR18lAtj5NQ6wZrjTVQ4jAvhEOBeypncW6yMdvfSB
	 11ct/oRgCdRVlzBeQYp2Z3RNqbyrcGXC7HTnWOx+XLSGvyeSSYE+7kbSB3pqCJl/WQhur
	 SccrTeo07qDqLTZqa/2x/aYYeZFbATc9DdFkLXSrT8gqlkb2+KAzRWvclRtUeAyHT3qoK
	 hQNFPpTkxS5yd8dZ6vhMNuBjjbG3x903Wg4YqYlWhAyasCFDQVuHkaQTAUMNUcP5dTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QzzAuwBvXpGS1giWx5a2wnFFnezHwVRGJZ05fOS5bGU=;
	b=Y2fMUAv2KooClsP4Tc465c9plXADufcaE7FuZvKW9Qt+xGJO1nggcXOmei62dyOlHUzY
	 6aVSoomZ2JuvZRnO7EDkv0nri7PaGsuzinIve77dLeZGWqbsSLDRvkT3HRklb65SxntrF
	 zXU8rN51aJDW/lLvcMJ9bdw/clcX30lVYxuHjTISDZMxxPaPgzN07LMz8Cr8xezQnbCJY
	 Ynbk8wPUghjtmrczSZUjRHj4c3Ij7idgBmQkCiaWZssX2a7B7hwrXf73CUCxQ+si2E/zc
	 DPd93Nql20DL8WEifM3LVd4c5Q08rlLZfRLcTzm/IBWRMCVST5uch9prTK3Nry1jIkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=gLdK4lKR;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CABD606A88B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CABD606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=gLdK4lKR
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1199335c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625569; x=1795230369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QzzAuwBvXpGS1giWx5a2wnFFnezHwVRGJZ05fOS5bGU=;
        b=gLdK4lKRUfpspugO2uFiijrnzAOS4XX6IruDrRlOo4z5K1p82fLHk3q3AIzwUCuN84
         KIJHxZE3EVChfagbfrprYoW4AtnidsQzmOd6pJAVXrIozUjDEeXbOWsLgcX3fjzSxmaM
         p/DHmICo+3JczTaw6NhPkZx8hn3JjnPmhp2AXDT7h+hQ3S2ABMS6P6dHD4jq0JCpjT7C
         Xhgzrv12r+MTjuuxSxH/qJi59HxoaABHTQ0dIHWeSqZMNS9hVYEr8ExLyQ0hVbDeUCQx
         EO7rUGPFHEpnEmRqEEYDPQAtGgVQYEl9bVfIResLpus7sB5kDt5PiZ1peS0joewXrOlI
         VVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625569; x=1795230369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QzzAuwBvXpGS1giWx5a2wnFFnezHwVRGJZ05fOS5bGU=;
        b=cAY26bT44gpWfsz0BI+TBkohYwTh/Qoz0L1Ly/ZXhoAMYZNSxYNX4RiN4skJrMz5gS
         YcHWED8yQVfK85ZztJkfzT8LcqirleDFzhblTDxTn09u+FcxnHgJxfk6Ajxiq5fb33S4
         PY3IBCCcVQP9DiESOv+k0P9DRPy7wg0qrdwxSNaiq0xs+ppPz+asQuGT9AnXJGJgzP4E
         ys976IKeGX6Qu0Zzfa903jkuOc/aZ0oxs40/SBuKkYurf3+yieb8JcMaxGdQMYQCXALE
         /qdayNYfhInilrCKfmkxfpLSaCtPLnFEqYF36Yx8EYqrki6FgNqRtBeia9cJ6b1bNQt4
         v1wg==
X-Forwarded-Encrypted: i=1; AL+hErG0rRZy1Q+Tq3rVgNcnD5DllDBWmSQ4OUXjp5PcB9fbsC7zOj4fl1B+/g1ZA40CYQQ1NYBRixut8+XeYnA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+OmQ1D+YCLsmajRbhWwcs08cXdsqHkqmIdQZNyjf/y+hJxUpK
	WPAATTlhOUKI4uUfJPjSNvExO50MMYSSUrq0VjEY81i5wkLRDAr/lq5LUUycUTEQfX4=
X-Gm-Gg: AYBFou22KzDN09dL5+DzG0qw09jrD2w17PymIr2IrVtG/jWW8fn5+qqO/zU2ZgbQcrs
	xlpI44uNkJ/+ABTV5aLa7i5+yfGczTMD6YEP+XeHn/NeAvThEtJ2GitWYr/rNcGQfbsBbDxG6LP
	kuspkR5MzT+pQRiOvcrI/Ph2z0FPZAdR8n6/hPTXEuoSVcXLho/uyxQ7Y3pg7CABc0RKab1ffdQ
	b4/Q+T3u9slpXso+g5iEQjNJOQvTe4AcKiqrjkq3lCCKhNQuZTizcvrXKp4KPuxIWTJBIWBMQ8c
	HCL3/hwWmTQyMOVm5J90gMM1Iodhd7kYl2w7CpSU9PiQGZkLa+llI3a6juUp682VhoVvnBcWACM
	Sba4uJmdZ6bzzhtsh7YnZuen77b47NzOiJEkYYDqQNkK8F/Fsd3m54KQKXAEyKH0m5VWW/i6Hzm
	WY2TS+CSQcmS850E7YdQXix2X89zwCEjzTOxwoKTRTzaCDs89RgA3mFkALcn6b47k22OEKovhjj
	rWgu9ajcGpZ9tkcGxM3RrABZpY7nH8fP8noGdDZ2pHd2eIyS3UVIoKYcudkVeYaI/vXOjP9vgj6
	fBpxxkbKr1f6EBXiD1DhC2UfIJsWYcOuh0ohk3D7z+TazLtLKBxm
X-Received: by 2002:a05:7022:c9a:b0:1a7:77ae:11f6 with SMTP id a92af1059eb24-1b5030ae14dmr3601227c88.17.1794625569068;
        Fri, 13 Nov 2026 19:06:09 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:06:08 -0800 (PST)
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Daniel Wagner <dwagner@suse.de>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 17/17] nvme: Add support for CQT to nvme host
Date: Fri, 13 Nov 2026 19:04:31 -0800
Message-ID: <20261114030454.2836543-18-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261114030454.2836543-1-mkhalfella@purestorage.com>
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
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

TP4129 KATO Corrections and Clarifications defined CQT (Command Quiesce
Time) which is used along with KATO (Keep Alive Timeout) to set an upper
limit for attempting Cross-Controller Recovery. Add ctrl->cqt, read its
value from controller identify response, expose it via sysfs, and have
nvme_fence_timeout_ms() account for it.

Use CQT to drive time-based recovery in fc, rdma, and tcp transports.
Add a fenced_work delayed work to each transport controller. If CCR
fails, fencing_work switches to error recovery immediately if CQT is not
supported. Otherwise it schedules fenced_work after the remaining fence
timeout, which also switches to error recovery when scheduled.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
---
 Documentation/ABI/stable/sysfs-nvme | 10 +++++++++
 drivers/nvme/host/core.c            |  1 +
 drivers/nvme/host/fc.c              | 33 +++++++++++++++++++++++++++--
 drivers/nvme/host/nvme.h            |  5 +++--
 drivers/nvme/host/rdma.c            | 32 ++++++++++++++++++++++++++--
 drivers/nvme/host/sysfs.c           |  2 ++
 drivers/nvme/host/tcp.c             | 32 ++++++++++++++++++++++++++--
 7 files changed, 107 insertions(+), 8 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-nvme b/Documentation/ABI/stable/sysfs-nvme
index df883d644fb4..75ac22a3fd8a 100644
--- a/Documentation/ABI/stable/sysfs-nvme
+++ b/Documentation/ABI/stable/sysfs-nvme
@@ -120,6 +120,16 @@ Description:
 		Shows the Keep Alive Timeout value in milliseconds for
 		this controller.
 
+What:		/sys/class/nvme/nvmeX/cqt
+Date:		October 2026
+KernelVersion:	7.5
+Contact:	Mohamed Khalfella <mkhalfella@purestorage.com>
+Description:
+		Shows CQT (Command Quiesce Time) in milliseconds as reported
+		by the Identify Controller data structure. CQT is the time the
+		controller needs to quiesce outstanding commands once the
+		host loses communication with it.
+
 What:		/sys/class/nvme/nvmeX/cmb
 Date:		October 2016
 KernelVersion:	4.9
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 54b83092a9e8..4c5448dbbfbd 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -3873,6 +3873,7 @@ static int nvme_init_identify(struct nvme_ctrl *ctrl)
 	ctrl->ciu = id->ciu;
 	ctrl->cirn = le64_to_cpu(id->cirn);
 	ctrl->ccrl = id->ccrl;
+	ctrl->cqt = le16_to_cpu(id->cqt);
 
 	ctrl->oacs = le16_to_cpu(id->oacs);
 	ctrl->oncs = le16_to_cpu(id->oncs);
diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index 5e8977ad51cf..2d5d2ad6082d 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -168,6 +168,7 @@ struct nvme_fc_ctrl {
 	struct blk_mq_tag_set	tag_set;
 
 	struct work_struct	fencing_work;
+	struct delayed_work	fenced_work;
 	struct work_struct	ioerr_work;
 	struct delayed_work	connect_work;
 
@@ -1888,6 +1889,19 @@ __nvme_fc_fcpop_chk_teardowns(struct nvme_fc_ctrl *ctrl,
 	return ret;
 }
 
+static void nvme_fc_fenced_work(struct work_struct *work)
+{
+	struct nvme_fc_ctrl *fc_ctrl = container_of(to_delayed_work(work),
+					struct nvme_fc_ctrl, fenced_work);
+	struct nvme_ctrl *ctrl = &fc_ctrl->ctrl;
+
+	dev_info(ctrl->device, "Time-based recovery finished\n");
+	nvme_fc_flush_held_requests(fc_ctrl);
+	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
+	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
+		queue_work(nvme_reset_wq, &fc_ctrl->ioerr_work);
+}
+
 static void nvme_fc_fencing_work(struct work_struct *work)
 {
 	struct nvme_fc_ctrl *fc_ctrl =
@@ -1908,9 +1922,22 @@ static void nvme_fc_fencing_work(struct work_struct *work)
 		__nvme_fc_teardown_association(fc_ctrl);
 
 	rem = nvme_fence_ctrl(ctrl);
-	if (rem)
-		dev_info(ctrl->device, "CCR failed, starting error recovery\n");
+	if (!rem)
+		goto done;
 
+	if (!ctrl->cqt) {
+		dev_info(ctrl->device,
+			 "CCR failed, CQT not supported, skip time-based recovery\n");
+		goto done;
+	}
+
+	dev_info(ctrl->device,
+		 "CCR failed, switch to time-based recovery, timeout = %ums\n",
+		 jiffies_to_msecs(rem));
+	queue_delayed_work(nvme_wq, &fc_ctrl->fenced_work, rem);
+	return;
+
+done:
 	nvme_fc_flush_held_requests(fc_ctrl);
 	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
 	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
@@ -2528,6 +2555,7 @@ static void
 nvme_fc_stop_ctrl(struct nvme_ctrl *nctrl)
 {
 	flush_work(&to_fc_ctrl(nctrl)->fencing_work);
+	flush_delayed_work(&to_fc_ctrl(nctrl)->fenced_work);
 }
 
 /*
@@ -3672,6 +3700,7 @@ nvme_fc_alloc_ctrl(struct device *dev, struct nvmf_ctrl_options *opts,
 	INIT_WORK(&ctrl->ctrl.reset_work, nvme_fc_reset_ctrl_work);
 	INIT_DELAYED_WORK(&ctrl->connect_work, nvme_fc_connect_ctrl_work);
 	INIT_WORK(&ctrl->fencing_work, nvme_fc_fencing_work);
+	INIT_DELAYED_WORK(&ctrl->fenced_work, nvme_fc_fenced_work);
 	INIT_WORK(&ctrl->ioerr_work, nvme_fc_ctrl_ioerr_work);
 	spin_lock_init(&ctrl->lock);
 
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 884541644240..67cf70e24953 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -409,6 +409,7 @@ struct nvme_ctrl {
 	u32 max_zone_append;
 #endif
 	u16 crdt[3];
+	u16 cqt;
 	u16 oncs;
 	u8 dmrl;
 	u8 ciu;
@@ -1373,8 +1374,8 @@ static inline bool nvme_multi_css(struct nvme_ctrl *ctrl)
 static inline unsigned long nvme_fence_timeout_ms(struct nvme_ctrl *ctrl)
 {
 	if (ctrl->ctratt & NVME_CTRL_ATTR_TBKAS)
-		return 3 * ctrl->kato * 1000;
-	return 2 * ctrl->kato * 1000;
+		return 3 * ctrl->kato * 1000 + ctrl->cqt;
+	return 2 * ctrl->kato * 1000 + ctrl->cqt;
 }
 
 #endif /* _NVME_H */
diff --git a/drivers/nvme/host/rdma.c b/drivers/nvme/host/rdma.c
index da1ec2dd6205..037423d27d8d 100644
--- a/drivers/nvme/host/rdma.c
+++ b/drivers/nvme/host/rdma.c
@@ -120,6 +120,7 @@ struct nvme_rdma_ctrl {
 	/* other member variables */
 	struct blk_mq_tag_set	tag_set;
 	struct work_struct	fencing_work;
+	struct delayed_work	fenced_work;
 	struct work_struct	err_work;
 
 	struct nvme_rdma_qe	async_event_sqe;
@@ -994,6 +995,7 @@ static void nvme_rdma_stop_ctrl(struct nvme_ctrl *nctrl)
 	struct nvme_rdma_ctrl *ctrl = to_rdma_ctrl(nctrl);
 
 	flush_work(&ctrl->fencing_work);
+	flush_delayed_work(&ctrl->fenced_work);
 	flush_work(&ctrl->err_work);
 	cancel_delayed_work_sync(&ctrl->reconnect_work);
 }
@@ -1155,6 +1157,18 @@ static void nvme_rdma_reconnect_ctrl_work(struct work_struct *work)
 	nvme_rdma_reconnect_or_remove(ctrl, ret);
 }
 
+static void nvme_rdma_fenced_work(struct work_struct *work)
+{
+	struct nvme_rdma_ctrl *rdma_ctrl = container_of(to_delayed_work(work),
+					   struct nvme_rdma_ctrl, fenced_work);
+	struct nvme_ctrl *ctrl = &rdma_ctrl->ctrl;
+
+	dev_info(ctrl->device, "Time-based recovery finished\n");
+	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
+	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
+		queue_work(nvme_reset_wq, &rdma_ctrl->err_work);
+}
+
 static void nvme_rdma_fencing_work(struct work_struct *work)
 {
 	struct nvme_rdma_ctrl *rdma_ctrl = container_of(work,
@@ -1163,9 +1177,22 @@ static void nvme_rdma_fencing_work(struct work_struct *work)
 	unsigned long rem;
 
 	rem = nvme_fence_ctrl(ctrl);
-	if (rem)
-		dev_info(ctrl->device, "CCR failed, starting error recovery\n");
+	if (!rem)
+		goto done;
+
+	if (!ctrl->cqt) {
+		dev_info(ctrl->device,
+			 "CCR failed, CQT not supported, skip time-based recovery\n");
+		goto done;
+	}
+
+	dev_info(ctrl->device,
+		 "CCR failed, switch to time-based recovery, timeout = %ums\n",
+		 jiffies_to_msecs(rem));
+	queue_delayed_work(nvme_wq, &rdma_ctrl->fenced_work, rem);
+	return;
 
+done:
 	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
 	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
 		queue_work(nvme_reset_wq, &rdma_ctrl->err_work);
@@ -2357,6 +2384,7 @@ static struct nvme_rdma_ctrl *nvme_rdma_alloc_ctrl(struct device *dev,
 	INIT_DELAYED_WORK(&ctrl->reconnect_work,
 			nvme_rdma_reconnect_ctrl_work);
 	INIT_WORK(&ctrl->fencing_work, nvme_rdma_fencing_work);
+	INIT_DELAYED_WORK(&ctrl->fenced_work, nvme_rdma_fenced_work);
 	INIT_WORK(&ctrl->err_work, nvme_rdma_error_recovery_work);
 	INIT_WORK(&ctrl->ctrl.reset_work, nvme_rdma_reset_ctrl_work);
 
diff --git a/drivers/nvme/host/sysfs.c b/drivers/nvme/host/sysfs.c
index ec4ca1669253..67bd4ae61484 100644
--- a/drivers/nvme/host/sysfs.c
+++ b/drivers/nvme/host/sysfs.c
@@ -490,6 +490,7 @@ nvme_show_int_function(numa_node);
 nvme_show_int_function(queue_count);
 nvme_show_int_function(sqsize);
 nvme_show_int_function(kato);
+nvme_show_int_function(cqt);
 
 static ssize_t nvme_sysfs_ciu_show(struct device *dev,
 					  struct device_attribute *attr,
@@ -968,6 +969,7 @@ static struct attribute *nvme_dev_attrs[] = {
 	&dev_attr_sqsize.attr,
 	&dev_attr_ciu.attr,
 	&dev_attr_cirn.attr,
+	&dev_attr_cqt.attr,
 	&dev_attr_hostnqn.attr,
 	&dev_attr_hostid.attr,
 	&dev_attr_ctrl_loss_tmo.attr,
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 244c6c50cf99..d079ca6412a5 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -196,6 +196,7 @@ struct nvme_tcp_ctrl {
 	struct nvme_ctrl	ctrl;
 
 	struct work_struct	fencing_work;
+	struct delayed_work	fenced_work;
 	struct work_struct	err_work;
 	struct delayed_work	connect_work;
 	struct nvme_tcp_request async_req;
@@ -2774,6 +2775,18 @@ static void nvme_tcp_reconnect_ctrl_work(struct work_struct *work)
 	nvme_tcp_reconnect_or_remove(ctrl, ret);
 }
 
+static void nvme_tcp_fenced_work(struct work_struct *work)
+{
+	struct nvme_tcp_ctrl *tcp_ctrl = container_of(to_delayed_work(work),
+					 struct nvme_tcp_ctrl, fenced_work);
+	struct nvme_ctrl *ctrl = &tcp_ctrl->ctrl;
+
+	dev_info(ctrl->device, "Time-based recovery finished\n");
+	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
+	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
+		queue_work(nvme_reset_wq, &tcp_ctrl->err_work);
+}
+
 static void nvme_tcp_fencing_work(struct work_struct *work)
 {
 	struct nvme_tcp_ctrl *tcp_ctrl = container_of(work,
@@ -2782,9 +2795,22 @@ static void nvme_tcp_fencing_work(struct work_struct *work)
 	unsigned long rem;
 
 	rem = nvme_fence_ctrl(ctrl);
-	if (rem)
-		dev_info(ctrl->device, "CCR failed, starting error recovery\n");
+	if (!rem)
+		goto done;
+
+	if (!ctrl->cqt) {
+		dev_info(ctrl->device,
+			 "CCR failed, CQT not supported, skip time-based recovery\n");
+		goto done;
+	}
 
+	dev_info(ctrl->device,
+		 "CCR failed, switch to time-based recovery, timeout = %ums\n",
+		 jiffies_to_msecs(rem));
+	queue_delayed_work(nvme_wq, &tcp_ctrl->fenced_work, rem);
+	return;
+
+done:
 	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
 	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
 		queue_work(nvme_reset_wq, &tcp_ctrl->err_work);
@@ -2866,6 +2892,7 @@ static void nvme_reset_ctrl_work(struct work_struct *work)
 static void nvme_tcp_stop_ctrl(struct nvme_ctrl *ctrl)
 {
 	flush_work(&to_tcp_ctrl(ctrl)->fencing_work);
+	flush_delayed_work(&to_tcp_ctrl(ctrl)->fenced_work);
 	flush_work(&to_tcp_ctrl(ctrl)->err_work);
 	cancel_delayed_work_sync(&to_tcp_ctrl(ctrl)->connect_work);
 }
@@ -3238,6 +3265,7 @@ static struct nvme_tcp_ctrl *nvme_tcp_alloc_ctrl(struct device *dev,
 	INIT_DELAYED_WORK(&ctrl->connect_work,
 			nvme_tcp_reconnect_ctrl_work);
 	INIT_WORK(&ctrl->fencing_work, nvme_tcp_fencing_work);
+	INIT_DELAYED_WORK(&ctrl->fenced_work, nvme_tcp_fenced_work);
 	INIT_WORK(&ctrl->err_work, nvme_tcp_error_recovery_work);
 	INIT_WORK(&ctrl->ctrl.reset_work, nvme_reset_ctrl_work);
 
-- 
2.56.0

