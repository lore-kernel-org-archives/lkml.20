Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E417472075
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929036; cv=none; b=qkLNKw+zrxLO3xngufWgDv2jkZjUtARjz+5X9sMOUBJm7tBJwtEYuABvwDMt2lW5wJdP/xXxObUY6wA6Ug6kD2hfjI9Ooft2TlbjO7ZmVxDb3VA47tSVdh/BoqeffPD9qaG57z7JCbqlol+LsZ8BC0oCVu+cHi/uJDk/nBfBsxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929036; c=relaxed/simple;
	bh=HFUI+vwDH7eJ577FDlmpoi8q2nXZKzYpl023jQ7aoks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FMilpNnHl/ltFSF76T6EPrd8OTo8UOKorujS652+MO9mu3AzgfPYkUiRliDAY5vZ6njAQj6SnJinjhocpud0J8ZkCAK3tBJ4RVXtkibIXpMNip3mKrhpqqSagKZE3yr29KTmKJDtlcqkh2YfruhycDdnoM9YOw8tbv2tAhZYUmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=EKwAw2mi; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="EKwAw2mi"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so1598518a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789929031; x=1790533831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEWXTR1kghd8H69+9xfipKsLZLRrTMB1ZhrH2/JIMpI=;
        b=EKwAw2miYi5aZdvNMg1NX4/mBbGqr5Vm7oR5BA6qt+PcIQeyRx3lHbXmZDcazFyqn/
         47nlXQLsTTmhulq5ZNv5ShcLzi4h5wTTZ9hfBaeickJwFPNsy/5cUpdTYOlsZEXTZfqu
         srAtdd9Ojwm3AEG01QrFFcWyGpgrHeUAtj1Sm7FKHlSoxDnx/Kqib5qUu5gIqOQyHoZj
         J/z36b/VSy6h3nUGCqGi9ewmvEipHTMDvpXVTUr4Uou0jiMQ51gSxpfx5zwG17afPrIx
         +bphu66WwueaqBgGifzdg/hzB01xGh5zI/V41Vx4S/173OolRSwBbMY8ZeIJEnUYQehc
         IX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929031; x=1790533831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UEWXTR1kghd8H69+9xfipKsLZLRrTMB1ZhrH2/JIMpI=;
        b=GHVWakc1jQfYOVFRPcYhXUmfyJLN/SDJmw46SL6Kb9Ac9OCHSVY3uo5LJO6fMSowIn
         Ms62Udn2B8H3QDWPPPceBLh+gGYBeQ6SSA5gpn9G2hXqXSi/j6pj5A64g/PlYHtvYOc/
         t/lm57m6NCHzvkOMaz/aenff6wlQiAH5DUYqiOzbgCT/PG0z4C8OYjQYLH8hQLPwm0D/
         HpTQKeLHKt2/nGWZpjZIm9c5b7ZSpzcNGPXcFf3UJTEK1wlxUj5qcJPwsiQ684s4pNTk
         Wfq0X5f4CfbnXMPKXkLu1rglbSXIHytQwZZbMfTvgTeoLveowVxffiF/1Z/H//OE1K48
         t3QA==
X-Forwarded-Encrypted: i=1; AKwUvByveV6ZrWxSE4Ndnq6gLrIv/qsGJE23hiUHmuuWj5x26vVG2ZPws52+Sv+MuixAjEO1Ye3ttK6QPm36zgU=@vger.kernel.org
X-Gm-Message-State: AFuF++mHPqpfXVsC1kZJqEt5Zu009bpe17EvU+6IBDk3U29vMaLNtDhh
	1RSQSwHVUfadLviRzdix38j58QUCcLYKK1aqAMH7mQps8c0UhttPcpJ4fDbMz2mU5x8=
X-Gm-Gg: AYBFou20CUiSUmgO65yAtlChgsznamML1NClV+u1TLdFVPJqnyYCyjeRCAK7G4tJAMf
	Kr/SCUazQEER7wjldQAZKwLIlP63vGW9qSRNfv9SqhrBT6YJv6QRt6bdsqu9SV11liPGaBOqHP8
	TcrC7vE+5qeMiDSghkjocUpjPAL2RhfT69jUyTAtj+A3cpbMDrOF2Lgf6eQSC73Pi2uoAPKZN0a
	JUm1VbMEp5sYpwU41U9FFjMcP7ur3oe14kvJ6KyFwQ/hVzbNDxUx2ep1RSX1wpovP9yE2GE49Hn
	TP16zMdbtrPh8pMA37ZhzojyxC15TJsuyOWV6tnhA+oW6fOOgJM4jpo9GDQPdDTmajBoF8saKv9
	lAbMH2toQWGlp56jRB5+4wod0dE9ECjySlcOuBaPQ9cSk+RamOpZddio8asQgNk4C1cOugkDuIM
	etShAeKkBchgp7O8nXnrcTIc4KP2IVRAM9cO+ED+Id3sixpuwK/B7wBJ3yEsP+dG8mMz0=
X-Received: by 2002:a17:90b:37cb:b0:39e:6c69:f46f with SMTP id 98e67ed59e1d1-39e6c69f52fmr8051148a91.46.1789929031381;
        Sun, 20 Sep 2026 11:30:31 -0700 (PDT)
Received: from ceto ([2607:fb90:9c20:5ac0::1d8c])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-144da432647sm20924589c88.5.2026.09.20.11.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:30:30 -0700 (PDT)
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
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 10/18] nvme-tcp: Use CCR to recover controller that hits an error
Date: Sun, 20 Sep 2026 11:28:08 -0700
Message-ID: <20260920182936.2317916-11-mkhalfella@purestorage.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260920182936.2317916-1-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An alive nvme controller that hits an error now will move to FENCING
state instead of RESETTING state. ctrl->fencing_work attempts CCR to
terminate inflight IOs. Regardless of the success or failure of CCR
operation the controller is transitioned to RESETTING state to continue
error recovery process.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
---
 drivers/nvme/host/tcp.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 921934028e0b..febbe8954473 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -167,6 +167,7 @@ struct nvme_tcp_ctrl {
 	struct sockaddr_storage src_addr;
 	struct nvme_ctrl	ctrl;
 
+	struct work_struct	fencing_work;
 	struct work_struct	err_work;
 	struct delayed_work	connect_work;
 	struct nvme_tcp_request async_req;
@@ -616,6 +617,12 @@ static void nvme_tcp_init_recv_ctx(struct nvme_tcp_queue *queue)
 
 static void nvme_tcp_error_recovery(struct nvme_ctrl *ctrl)
 {
+	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCING)) {
+		dev_warn(ctrl->device, "starting controller fencing\n");
+		queue_work(nvme_wq, &to_tcp_ctrl(ctrl)->fencing_work);
+		return;
+	}
+
 	if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
 		return;
 
@@ -2558,6 +2565,22 @@ static void nvme_tcp_reconnect_ctrl_work(struct work_struct *work)
 	nvme_tcp_reconnect_or_remove(ctrl, ret);
 }
 
+static void nvme_tcp_fencing_work(struct work_struct *work)
+{
+	struct nvme_tcp_ctrl *tcp_ctrl = container_of(work,
+			struct nvme_tcp_ctrl, fencing_work);
+	struct nvme_ctrl *ctrl = &tcp_ctrl->ctrl;
+	unsigned long rem;
+
+	rem = nvme_fence_ctrl(ctrl);
+	if (rem)
+		dev_info(ctrl->device, "CCR failed, starting error recovery\n");
+
+	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
+	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
+		queue_work(nvme_reset_wq, &tcp_ctrl->err_work);
+}
+
 static void nvme_tcp_error_recovery_work(struct work_struct *work)
 {
 	struct nvme_tcp_ctrl *tcp_ctrl = container_of(work,
@@ -2633,6 +2656,7 @@ static void nvme_reset_ctrl_work(struct work_struct *work)
 
 static void nvme_tcp_stop_ctrl(struct nvme_ctrl *ctrl)
 {
+	flush_work(&to_tcp_ctrl(ctrl)->fencing_work);
 	flush_work(&to_tcp_ctrl(ctrl)->err_work);
 	cancel_delayed_work_sync(&to_tcp_ctrl(ctrl)->connect_work);
 }
@@ -2731,13 +2755,15 @@ static enum blk_eh_timer_return nvme_tcp_timeout(struct request *rq)
 	struct nvme_tcp_cmd_pdu *pdu = nvme_tcp_req_cmd_pdu(req);
 	struct nvme_command *cmd = &pdu->cmd;
 	int qid = nvme_tcp_queue_id(req->queue);
+	enum nvme_ctrl_state state;
 
 	dev_warn(ctrl->device,
 		 "I/O tag %d (%04x) type %d opcode %#x (%s) QID %d timeout\n",
 		 rq->tag, nvme_cid(rq), pdu->hdr.type, cmd->common.opcode,
 		 nvme_fabrics_opcode_str(qid, cmd), qid);
 
-	if (nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE) {
+	state = nvme_ctrl_state(ctrl);
+	if (state != NVME_CTRL_LIVE && state != NVME_CTRL_FENCING) {
 		/*
 		 * If we are resetting, connecting or deleting we should
 		 * complete immediately because we may block controller
@@ -2996,6 +3022,7 @@ static struct nvme_tcp_ctrl *nvme_tcp_alloc_ctrl(struct device *dev,
 
 	INIT_DELAYED_WORK(&ctrl->connect_work,
 			nvme_tcp_reconnect_ctrl_work);
+	INIT_WORK(&ctrl->fencing_work, nvme_tcp_fencing_work);
 	INIT_WORK(&ctrl->err_work, nvme_tcp_error_recovery_work);
 	INIT_WORK(&ctrl->ctrl.reset_work, nvme_reset_ctrl_work);
 
-- 
2.55.0

