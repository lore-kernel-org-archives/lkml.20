Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801242;
	b=MS9pm7cmM39JXJehWcUPDBG4UApzuHlxnYSN0VhZ79sSZK05sHx12/ZQkeEuRwXZGrvA
	 A6W5cwl65NyvgWJBotdYETzqwrs6qZA1NvRFfNiCFxhZkNILyz7rvM+TSajOAJJeFL7aI
	 QcbWRfEVwuZ2gV5p8+CDZvuLHkImCGOAX9ujT6QEUah/s3eEG9oU9hbA6CEWNmxfwt3Kp
	 i14elRxMqg8RnyKI/8Bn7Z+RL2Q99w1Y389axHEY79yfj5Vw3dvVsbyv6yq2vVRgR7z6H
	 4ZWTG5inOtFKVE6BlWpPdSuU5V6Ms4AjFYX8CCsej5JVWS2jc6yTNDq1EUvoEInGt8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uExHSLuQ9d6rI6EL/H2E6oDUAXDM7PbH4tOezF5ioR8=;
	b=db5/bbNBhvjuuJ8PUsoLxghi/4LmHOkdU7zGnfUqyEUpF/lKXBRLAsF3oPO5yRd2pLIV
	 ybAxaqME/bDg/jlVMPqsREzMAGVzB9+Gaj0Af4LMGcpVpG88RO+lts1jXbKljYt7X0dXX
	 ful+PORfws4Dxj1TTcMq8Afd6X373XmXI1gmzT0sCvI4u6XGv2a8uwVPA+tJH9J/e67SO
	 1YT4zm5S+18RNyFloT9ij5RF3OsqZ2a53IafDNS5McPSMiP26hhISMDLBXQ8Fzd0icisk
	 xNPP6NVVdwb91sYMbDJ+ca9gPNjiCG1g2geancmuuQ8gAH/Spu5293lq1wkbS04WmkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crusoe.ai;
	spf=pass smtp.mailfrom=crusoe.ai;
	dkim=pass header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=KxpnxJ8y;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1051D606A33E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1051D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crusoe.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=crusoe.ai header.i=@crusoe.ai header.a=rsa-sha256 header.s=google header.b=KxpnxJ8y
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1ae18eb9b69so623682c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=crusoe.ai; s=google; t=1793801241; x=1794406041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uExHSLuQ9d6rI6EL/H2E6oDUAXDM7PbH4tOezF5ioR8=;
        b=KxpnxJ8yU4j+w0tCYaPMkKYHPE+x/yIH/dYe3awDb4v5buwh/zgPWcdcYwvIyjANT1
         Hy/cwWwgQdKO9DAUXtuzJr8WR1wLsRHMPkEfWIQbj+9F8FxkTDQVmn2SxkuSd5aE+On2
         qA+94KLNQaRSwnjn597gNfcJu8mq1mBhBE8usnmWcwSfHcKYFNsXupHX0FysVudYrzf7
         x7bg8OJn+utJKiMCei7RYJqVnoh6pBBH5kFJkPB28t1f3zUsZFOqkJfSHKXmGICwZS1w
         ox/C/cS/gXNWGTkYsO/wKZgRUEiPcDaMNS0ySpvVgQy7u93XUwDQb3GWd3Zx1HMwI8Fq
         //Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801241; x=1794406041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uExHSLuQ9d6rI6EL/H2E6oDUAXDM7PbH4tOezF5ioR8=;
        b=weZTavdTzPX55FvRWHAcpVfoBoPTHwOjvAUonvrUqb+GUXlUszi88Q0nVQbWRP0dOu
         VBTZcPXyUAiNJyZRwahfEJjo1A0IGxP2QGoopkmz63CtAmXPSQ1EvkgfDKNrXfUFjqxb
         MySXDH8Nc7+sP4AK5yYzfqWTcdn/V/XdbX3gsOliw0Yt/HVv7/UL1wJBcCtWvi6kWDyV
         yXKu2MuQvKRNM6D9K/wTMFaw5mVk66MQbsWcQ+BCDPgBp7yq31q8uj3igc1KzkX8KCWL
         USal4zrF37Olx1sjLPQdD9bdTdfZC9Jagfj92aN+ZoSkMJL0hTn/xYh6hR37pfit2QcH
         Vr1w==
X-Forwarded-Encrypted: i=1; AKwUvBxaHZxOpFsSka7ynrJq1CAePPhEuCNEmpRJUzrZUaPQCsqn3BeAYh/WFoxga9Hs5EpWNOsN657Pi8avfnc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TuKBZSU695FfDNm/8orMcOUlKKjjcCxW53dRrYFuSqHcuaWBy
	82RmYnHOkb2OQKo8o2Oic2v5dBEHi6C0FfBJkDIOUCR7a6+tk8p5D9mQX1L7dJnJ6JM=
X-Gm-Gg: AYBFou1Qn9OxNHImO2ie2g9TO8IpC3rVueDUs/mLovv/jdte+8u+pNjL35MEAv0Z3bX
	zAXLbUPec8ad3nwA5UJgDit2Db65zYGFKs/B0g9s4WeYZD7M5SFwqWnw5xlQ6jOIAqJtjE/oO4b
	rVBpTVwI4ZHnvv1sseujNIZQuNxL116BfUIT1UqRLVNYqEah388dHAZetzgM4CIUj/FmBmqnlAP
	7cxPsP+s6MUdV23rvASuhGAzwpO8tld9q4+SKdqEeZjq+wrxPGOAjulQHyU4g0P4d7LKS5mlpUT
	9kbIm8NCSaxf8yafw1HxfXHHi5cfjyP6s00hBF2sdu+u/vSWsTsNgsgeM7LThmT/mU96ixZamZI
	fnGpCcGY+SLfuqmt99h6h8UDVykM9K6TS86lG84wUjA1piWkbideVEo58Hr287AzuNLyG+Lpt3Q
	e37uzSNlZA1hCHvr3aYyY3A/crx8gXw75SDD7RZtNsfWux7dsX93ITkX+j151p/OlaFKx5p9dIn
	k99rT7OG/ujaDEzpbKdFfe7LNdWNezdXvZsbu3xaT6UoJojrsDzl1kjJRlv88VfYbLqxMtOo1ct
	2kAsB6V56pB1PEtPiNMJO/ltisnup/On5U6iIYve44vfG2JTFf8D5+oOi4pmctkIon9GmqQaYUM
	=
X-Received: by 2002:a05:7023:a5c:10b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1ac5e6f4f90mr21978048c88.30.1793801240830;
        Wed, 04 Nov 2026 06:07:20 -0800 (PST)
Received: from MBP-Saravanan-D.civet-hops.ts.net ([71.202.170.54])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c748eesm7938399c88.23.2026.11.04.06.07.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 06:07:20 -0800 (PST)
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
Subject: [PATCH v7 2/2] nvme-tcp: allow setting per-queue io_cpu through sysfs
Date: Wed,  4 Nov 2026 06:06:30 -0800
Message-ID: <8749376f81f1c6817d6074cb3925c17c0678b272.1793800758.git.saravanand@crusoe.ai>
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

nvme_tcp_set_queue_io_cpu() picks each queue's io_cpu at connect time
as the least loaded CPU in the queue's blk-mq map group, and all socket
work runs there for the connection's lifetime. This decision falls
short when the host partitions its CPUs after connect time. On a 384
cpu multi tenant host with 128 queue controllers, blk-mq folds three
CPUs into every map group, some groups straddle two tenants' cpusets,
and 9% of nvme_tcp_io_work executions ran outside the submitting VM's
cpuset, seen by the neighbor as steal time.

Expose the io_cpu in each I/O queue's directory

  /sys/class/nvme/nvmeX/queues/<qid>/io_cpu

so a control plane that owns CPU placement can set it directly instead
of relying on the driver's heuristic. The attribute accepts a decimal
cpu number, -1 or "unbound". A user assignment, unbound included, is
marked in the queue flags, persists across reconnects and is never
reselected by the driver. The read-only managed attribute reports 1
while io_cpu is driver managed and 0 once the user assigned it. The
accounting of nvme_tcp_cpu_queues applies regardless of who set the
io_cpu.

A queue's directory is added once the connect time selection has set its
io_cpu, so readers never see a placement that is about to change, and
removed when the queue is freed, before it is torn down, so a sysfs
store never runs on a freed queue. All io_cpu writes, from
sysfs and from the driver, serialize with the accounting under
nvme_tcp_cpu_queues_lock, while the I/O paths read io_cpu locklessly.
The queue stop now clears NVME_TCP_Q_IO_CPU_SET under that lock, since a
sysfs store may move io_cpu in between.

nvme_tcp_free_queue() now clears NVME_TCP_Q_IO_CPU_SET and drops its
count, because a queue can still be counted when it is freed. A sysfs
store may have run after the queue stop, or the connect may have
failed, and the setup error path frees such a queue without calling
nvme_tcp_stop_queue(), where the count is normally dropped.

Suggested-by: Sagi Grimberg <sagi@grimberg.me>
Link: https://lore.kernel.org/linux-nvme/13c160d0-0657-47ce-9a16-58d348267ab0@grimberg.me/
Assisted-by: Claude:claude-opus-5-5 [Claude Code]
Signed-off-by: Saravanan D <saravanand@crusoe.ai>
---
 Documentation/ABI/stable/sysfs-nvme |  31 ++++++
 drivers/nvme/host/tcp.c             | 167 ++++++++++++++++++++++++----
 2 files changed, 178 insertions(+), 20 deletions(-)

diff --git a/Documentation/ABI/stable/sysfs-nvme b/Documentation/ABI/stable/sysfs-nvme
index 9291595f8102..fcfd0426866c 100644
--- a/Documentation/ABI/stable/sysfs-nvme
+++ b/Documentation/ABI/stable/sysfs-nvme
@@ -503,3 +503,34 @@ Contact:	Hannes Reinecke <hare@suse.de>
 Description:
 		Shows the subsystem type. Possible values: "discovery",
 		"nvm", "reserved".
+
+What:		/sys/class/nvme/nvmeX/queues/<qid>/io_cpu
+What:		/sys/class/nvme/nvmeX/queues/<qid>/managed
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	Saravanan D <saravanand@crusoe.ai>
+Description:
+		Per I/O queue directories, populated by the transport
+		backing the controller. A directory appears once the
+		driver has selected the queue's CPU at connect time and
+		is removed when the queue is torn down, so the
+		directories follow the queue count and are absent while
+		the controller reconnects.
+		NVMe over TCP exposes:
+
+		io_cpu: (RW) The CPU that runs the socket work for I/O
+		queue <qid>, selected by the driver at connect time.
+		Writing a decimal online CPU number overrides the
+		selection, and writing -1 or "unbound" leaves the socket
+		work unbound. A written value persists across reconnects
+		for the life of the controller, also when its CPU goes
+		offline. Unbound socket work runs on the CPU that queued
+		it. When the nvme_tcp module is loaded with wq_unbound
+		set, the socket work runs on an unbound workqueue and
+		how closely it follows io_cpu depends on the affinity
+		scope of the nvme_tcp_wq workqueue. Reads return the
+		current CPU, or -1 when the queue is unbound.
+
+		managed: (RO) Shows who owns the CPU placement. 1 while
+		io_cpu is driver managed, 0 once the user assigned it,
+		for the life of the controller.
diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 7ecc6c007f8d..f1d29d9f75cc 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -117,6 +117,7 @@ enum nvme_tcp_queue_flags {
 	NVME_TCP_Q_LIVE		= 1,
 	NVME_TCP_Q_POLLING	= 2,
 	NVME_TCP_Q_IO_CPU_SET	= 3,
+	NVME_TCP_Q_IO_CPU_USER	= 4,
 };
 
 #define NVME_TCP_OPT_NR_QUEUES(opts) ((opts)->nr_io_queues + \
@@ -167,6 +168,7 @@ struct nvme_tcp_queue {
 	struct completion       tls_complete;
 	int                     tls_err;
 	struct page_frag_cache	pf_cache;
+	struct nvme_queue_info	*qinfo;
 
 	void (*state_change)(struct sock *);
 	void (*data_ready)(struct sock *);
@@ -256,6 +258,19 @@ static inline int nvme_tcp_queue_id(struct nvme_tcp_queue *queue)
 	return queue - queue->ctrl->queues;
 }
 
+/* the I/O paths read io_cpu locklessly, writers hold the accounting lock */
+static inline int nvme_tcp_queue_io_cpu(struct nvme_tcp_queue *queue)
+{
+	return READ_ONCE(queue->io_cpu);
+}
+
+static inline void nvme_tcp_queue_change_io_cpu(struct nvme_tcp_queue *queue,
+						int cpu)
+	__must_hold(&nvme_tcp_cpu_queues_lock)
+{
+	WRITE_ONCE(queue->io_cpu, cpu);
+}
+
 static inline bool nvme_tcp_recv_pdu_supported(enum nvme_tcp_pdu_type type)
 {
 	switch (type) {
@@ -453,7 +468,7 @@ static inline void nvme_tcp_queue_request(struct nvme_tcp_request *req,
 	 * lockdep reports circular locking via elevator_lock.  Defer TLS
 	 * sends to the io workqueue instead of inline from this path.
 	 */
-	if (queue->io_cpu == raw_smp_processor_id() &&
+	if (nvme_tcp_queue_io_cpu(queue) == raw_smp_processor_id() &&
 	    !nvme_tcp_queue_tls(queue) &&
 	    empty && mutex_trylock(&queue->send_mutex)) {
 		nvme_tcp_send_all(queue);
@@ -461,7 +476,8 @@ static inline void nvme_tcp_queue_request(struct nvme_tcp_request *req,
 	}
 
 	if (last && nvme_tcp_queue_has_pending(queue))
-		queue_work_on(queue->io_cpu, nvme_tcp_wq, &queue->io_work);
+		queue_work_on(nvme_tcp_queue_io_cpu(queue), nvme_tcp_wq,
+			      &queue->io_work);
 }
 
 static void nvme_tcp_process_req_list(struct nvme_tcp_queue *queue)
@@ -870,7 +886,8 @@ static int nvme_tcp_handle_r2t(struct nvme_tcp_queue *queue,
 	nvme_tcp_setup_h2c_data_pdu(req);
 
 	llist_add(&req->lentry, &queue->req_list);
-	queue_work_on(queue->io_cpu, nvme_tcp_wq, &queue->io_work);
+	queue_work_on(nvme_tcp_queue_io_cpu(queue), nvme_tcp_wq,
+		      &queue->io_work);
 
 	return 0;
 }
@@ -1157,7 +1174,8 @@ static void nvme_tcp_data_ready(struct sock *sk)
 	queue = sk->sk_user_data;
 	if (likely(queue && queue->rd_enabled) &&
 	    !test_bit(NVME_TCP_Q_POLLING, &queue->flags))
-		queue_work_on(queue->io_cpu, nvme_tcp_wq, &queue->io_work);
+		queue_work_on(nvme_tcp_queue_io_cpu(queue), nvme_tcp_wq,
+			      &queue->io_work);
 	read_unlock_bh(&sk->sk_callback_lock);
 }
 
@@ -1172,7 +1190,8 @@ static void nvme_tcp_write_space(struct sock *sk)
 		/* Ensure pending TLS partial records are retried */
 		if (nvme_tcp_queue_tls(queue))
 			queue->write_space(sk);
-		queue_work_on(queue->io_cpu, nvme_tcp_wq, &queue->io_work);
+		queue_work_on(nvme_tcp_queue_io_cpu(queue), nvme_tcp_wq,
+			      &queue->io_work);
 	}
 	read_unlock_bh(&sk->sk_callback_lock);
 }
@@ -1515,7 +1534,8 @@ static void nvme_tcp_io_work(struct work_struct *w)
 
 	} while (!time_after(jiffies, deadline)); /* quota is exhausted */
 
-	queue_work_on(queue->io_cpu, nvme_tcp_wq, &queue->io_work);
+	queue_work_on(nvme_tcp_queue_io_cpu(queue), nvme_tcp_wq,
+		      &queue->io_work);
 }
 
 static void nvme_tcp_free_async_req(struct nvme_tcp_ctrl *ctrl)
@@ -1549,9 +1569,22 @@ static void nvme_tcp_free_queue(struct nvme_ctrl *nctrl, int qid)
 	struct nvme_tcp_queue *queue = &ctrl->queues[qid];
 	unsigned int noio_flag;
 
-	if (!test_and_clear_bit(NVME_TCP_Q_ALLOCATED, &queue->flags))
+	if (!test_bit(NVME_TCP_Q_ALLOCATED, &queue->flags))
 		return;
 
+	/* no io_cpu store runs once the directory is removed */
+	if (queue->qinfo) {
+		nvme_remove_queue_info(queue->qinfo);
+		queue->qinfo = NULL;
+	}
+	clear_bit(NVME_TCP_Q_ALLOCATED, &queue->flags);
+
+	/* a failed connect or a store after the stop left it counted */
+	spin_lock(&nvme_tcp_cpu_queues_lock);
+	if (test_and_clear_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags))
+		nvme_tcp_cpu_queues[nvme_tcp_queue_io_cpu(queue)]--;
+	spin_unlock(&nvme_tcp_cpu_queues_lock);
+
 	page_frag_cache_drain(&queue->pf_cache);
 
 	/**
@@ -1883,8 +1916,18 @@ static void nvme_tcp_set_queue_io_cpu(struct nvme_tcp_queue *queue)
 	unsigned int *mq_map = NULL;
 	int cpu, min_queues = INT_MAX, io_cpu;
 
+	spin_lock(&nvme_tcp_cpu_queues_lock);
+	/* a user assigned io_cpu is kept across reconnects */
+	if (test_bit(NVME_TCP_Q_IO_CPU_USER, &queue->flags)) {
+		io_cpu = nvme_tcp_queue_io_cpu(queue);
+		if (io_cpu != WORK_CPU_UNBOUND &&
+		    !test_and_set_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags))
+			nvme_tcp_cpu_queues[io_cpu]++;
+		goto out_unlock;
+	}
+
 	if (wq_unbound)
-		goto out;
+		goto out_unlock;
 
 	if (nvme_tcp_default_queue(queue))
 		mq_map = set->map[HCTX_TYPE_DEFAULT].mq_map;
@@ -1894,10 +1937,9 @@ static void nvme_tcp_set_queue_io_cpu(struct nvme_tcp_queue *queue)
 		mq_map = set->map[HCTX_TYPE_POLL].mq_map;
 
 	if (WARN_ON(!mq_map))
-		goto out;
+		goto out_unlock;
 
 	/* Search for the least used cpu from the mq_map */
-	spin_lock(&nvme_tcp_cpu_queues_lock);
 	io_cpu = WORK_CPU_UNBOUND;
 	for_each_online_cpu(cpu) {
 		int num_queues = nvme_tcp_cpu_queues[cpu];
@@ -1910,14 +1952,14 @@ static void nvme_tcp_set_queue_io_cpu(struct nvme_tcp_queue *queue)
 		}
 	}
 	if (io_cpu != WORK_CPU_UNBOUND) {
-		queue->io_cpu = io_cpu;
+		nvme_tcp_queue_change_io_cpu(queue, io_cpu);
 		nvme_tcp_cpu_queues[io_cpu]++;
 		set_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags);
 	}
+out_unlock:
 	spin_unlock(&nvme_tcp_cpu_queues_lock);
-out:
 	dev_dbg(ctrl->ctrl.device, "queue %d: using cpu %d\n",
-		qid, queue->io_cpu);
+		qid, nvme_tcp_queue_io_cpu(queue));
 }
 
 static void nvme_tcp_tls_done(void *data, int status, key_serial_t pskid)
@@ -2029,6 +2071,84 @@ static void nvme_tcp_exit_queue(struct nvme_tcp_ctrl *ctrl, int qid)
 	mutex_destroy(&queue->pf_cache_lock);
 }
 
+static ssize_t io_cpu_show(struct kobject *kobj, struct kobj_attribute *attr,
+			   char *buf)
+{
+	struct nvme_tcp_queue *queue = nvme_queue_info_data(kobj);
+	int io_cpu = nvme_tcp_queue_io_cpu(queue);
+
+	return sysfs_emit(buf, "%d\n",
+			  io_cpu == WORK_CPU_UNBOUND ? -1 : io_cpu);
+}
+
+static ssize_t io_cpu_store(struct kobject *kobj, struct kobj_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct nvme_tcp_queue *queue = nvme_queue_info_data(kobj);
+	int cpu, old, ret;
+
+	if (sysfs_streq(buf, "unbound")) {
+		cpu = WORK_CPU_UNBOUND;
+	} else {
+		ret = kstrtoint(buf, 10, &cpu);
+		if (ret)
+			return ret;
+		if (cpu == -1)
+			cpu = WORK_CPU_UNBOUND;
+		else if ((unsigned int)cpu >= nr_cpu_ids || !cpu_online(cpu))
+			return -EINVAL;
+	}
+
+	spin_lock(&nvme_tcp_cpu_queues_lock);
+	old = nvme_tcp_queue_io_cpu(queue);
+	nvme_tcp_queue_change_io_cpu(queue, cpu);
+	set_bit(NVME_TCP_Q_IO_CPU_USER, &queue->flags);
+	if (test_and_clear_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags))
+		nvme_tcp_cpu_queues[old]--;
+	if (cpu != WORK_CPU_UNBOUND) {
+		nvme_tcp_cpu_queues[cpu]++;
+		set_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags);
+	}
+	spin_unlock(&nvme_tcp_cpu_queues_lock);
+
+	return count;
+}
+
+static ssize_t managed_show(struct kobject *kobj, struct kobj_attribute *attr,
+			    char *buf)
+{
+	struct nvme_tcp_queue *queue = nvme_queue_info_data(kobj);
+
+	return sysfs_emit(buf, "%d\n",
+			  !test_bit(NVME_TCP_Q_IO_CPU_USER, &queue->flags));
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
+static void nvme_tcp_add_queue_sysfs(struct nvme_tcp_queue *queue)
+{
+	struct nvme_ctrl *nctrl = &queue->ctrl->ctrl;
+	struct nvme_queue_info *qinfo;
+
+	qinfo = nvme_add_queue_info(nctrl, nvme_tcp_queue_id(queue), queue);
+	if (IS_ERR(qinfo)) {
+		dev_warn(nctrl->device, "queue %d: no sysfs directory: %ld\n",
+			 nvme_tcp_queue_id(queue), PTR_ERR(qinfo));
+		return;
+	}
+	queue->qinfo = qinfo;
+}
+
 static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 				key_serial_t pskid)
 {
@@ -2086,7 +2206,11 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl, int qid,
 
 	queue->sock->sk->sk_allocation = GFP_ATOMIC;
 	queue->sock->sk->sk_use_task_frag = false;
-	queue->io_cpu = WORK_CPU_UNBOUND;
+	/* no store races here, the lock is for the write helper */
+	spin_lock(&nvme_tcp_cpu_queues_lock);
+	if (!test_bit(NVME_TCP_Q_IO_CPU_USER, &queue->flags))
+		nvme_tcp_queue_change_io_cpu(queue, WORK_CPU_UNBOUND);
+	spin_unlock(&nvme_tcp_cpu_queues_lock);
 	queue->request = NULL;
 	queue->data_remaining = 0;
 	queue->ddgst_remaining = 0;
@@ -2193,11 +2317,10 @@ static void nvme_tcp_stop_queue_nowait(struct nvme_ctrl *nctrl, int qid)
 	if (!test_bit(NVME_TCP_Q_ALLOCATED, &queue->flags))
 		return;
 
-	if (test_and_clear_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags)) {
-		spin_lock(&nvme_tcp_cpu_queues_lock);
-		nvme_tcp_cpu_queues[queue->io_cpu]--;
-		spin_unlock(&nvme_tcp_cpu_queues_lock);
-	}
+	spin_lock(&nvme_tcp_cpu_queues_lock);
+	if (test_and_clear_bit(NVME_TCP_Q_IO_CPU_SET, &queue->flags))
+		nvme_tcp_cpu_queues[nvme_tcp_queue_io_cpu(queue)]--;
+	spin_unlock(&nvme_tcp_cpu_queues_lock);
 
 	mutex_lock(&queue->queue_lock);
 	if (test_and_clear_bit(NVME_TCP_Q_LIVE, &queue->flags))
@@ -2260,6 +2383,8 @@ static int nvme_tcp_start_queue(struct nvme_ctrl *nctrl, int idx)
 
 	if (idx) {
 		nvme_tcp_set_queue_io_cpu(queue);
+		/* expose io_cpu only once the driver has selected it */
+		nvme_tcp_add_queue_sysfs(queue);
 		ret = nvmf_connect_io_queue(nctrl, idx);
 	} else
 		ret = nvmf_connect_admin_queue(nctrl);
@@ -3056,7 +3181,8 @@ static void nvme_tcp_commit_rqs(struct blk_mq_hw_ctx *hctx)
 	struct nvme_tcp_queue *queue = hctx->driver_data;
 
 	if (!llist_empty(&queue->req_list))
-		queue_work_on(queue->io_cpu, nvme_tcp_wq, &queue->io_work);
+		queue_work_on(nvme_tcp_queue_io_cpu(queue), nvme_tcp_wq,
+			      &queue->io_work);
 }
 
 static blk_status_t nvme_tcp_queue_rq(struct blk_mq_hw_ctx *hctx,
@@ -3159,6 +3285,7 @@ static const struct nvme_ctrl_ops nvme_tcp_ctrl_ops = {
 	.name			= "tcp",
 	.module			= THIS_MODULE,
 	.flags			= NVME_F_FABRICS | NVME_F_BLOCKING,
+	.queue_attr_groups	= nvme_tcp_queue_groups,
 	.reg_read32		= nvmf_reg_read32,
 	.reg_read64		= nvmf_reg_read64,
 	.reg_write32		= nvmf_reg_write32,
-- 
2.56.0

