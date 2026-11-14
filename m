Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625565;
	b=2xecZozMOiQhPs5ygxvTzFGLuRnO4KFZZN3sAmQnjC6v3m7B3ls+s7ocrU6wiJ6L6qLz
	 7W1d0xJD78aUo8hBdwT+U3vIV3PiOhYANK7uQODwa1VrZu0VQ7CG4CRWeGdp0/GisBuFE
	 colSTyrApsVO0RCpm/b/7FXPlkNUUjMKtATL2uBR89gOI94f4mHZInjx993VLAUjT3WWe
	 khxQmDQzuOCGcguKHOEhjfpRK8XGiqIEkhV48XNb2WfzjDwoMIXHTpZBZ1hbJk0Q9AaIq
	 ORztdAbj79oQYgYdS0NXtEPx9Q/q/Av06zGYU2FEqCCc/HAIvjkZXifIh8TVQ2sbkCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6Kt4gHC2HJ09c/nL6A82Y14Zxmi4ppAhLgPppqiWQz0=;
	b=VVkIumZXF5nT9P+g4qTlhdF9lHo0ucWiNevuBkhv+dvz6Er4iYqLe7eOr/WVBfiIpOiy
	 4ozq7TUEldopYbkBVaIha04QMaQOJ8yCxcJ8cJmRMmSsebKBMIy/C3BI6cI+UXg5G9n00
	 M8izpIWGISs37wfd9k3rKswvTCfUQCZ5K3TFSbwehghDHv3PfyvgsnpIwj3oMLy3GppUN
	 ulsBKOc6UFE9U/4lzXXXGYtyCUUP4FNizqyHVhHryqos8uJrzM0+vbige3MLUc7br64lT
	 A0J/KRtrtQ+qP4Pv2TkbNtFu/1TZJlytzAFdOKnqnUQxcvHsrlr5JZB6FWgV0Wf30GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=cr39dqdm;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51AF60A5BFD
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E51AF60A5BFD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=cr39dqdm
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b244fb7fffso1860800c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794625564; x=1795230364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Kt4gHC2HJ09c/nL6A82Y14Zxmi4ppAhLgPppqiWQz0=;
        b=cr39dqdmJKyYX3PaMji8XgGDFXZzhI3egi7nWZqcjaCGTxxnRQeFX4Nzq3fCXT4rRn
         oAaWr/16re5Lx+z6gzrgMoBh7nicJVFjfK7S62IxLk5V+RhVv4rI6KTdqFd1HnHf+4Im
         VDCUUBfNg0qyUvaovvkeg2xm5k/wsNjfZ/GfhViMKFMPRgF1v+IvNUrrn2qaOB5z+Nur
         BlEH7HsY02d99jHgy0M7aghD3kitNo92Z6FIr1TqYEtw6HwIZAOIxvGxa/gk0wwdsljF
         muZQkPJePKiWizyfQ5xkxjuJQ6xZFpk2kxJdQ/dfgfwmQSnofSvA9aNV5e84c7WZcioq
         s3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794625564; x=1795230364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Kt4gHC2HJ09c/nL6A82Y14Zxmi4ppAhLgPppqiWQz0=;
        b=BVCDkKkBilBf+mFnURZu82qp4ioLuWDerxbrS7mWtXamn0urXLp+34vEm+Ffg8ACic
         8JOe6M7A3nKwq53CuVxzmSp2OEbFCm0ffTa36E32u9IAcDWTXrsosZ3URs+pqMawYLUO
         yAB5da/sUtplZJ01z5kijAolbXL27TD9Oqf9CA6ko9qX1HeQSApKLLMb8q7p28bVVbno
         Q+GBV/5Ghz3r4Ug8S3852tbgcGTQFPd6RlZCvasUTVWM/qmrDnD7UF2FjOyjjmnXXArT
         4AG1ptNTXA5bOaP6X2xl6euuGdDOV/DJlB8JwT5oquNvgl9JIDgvmEzZifxJAGvridjT
         FaHA==
X-Forwarded-Encrypted: i=1; AL+hErHsVdumd/HPXnH/dA+B2sUFsV8W+59C/8OmaDsSe+4LPjNLzUnuGRjhtGg+760T1HHQKpS3jvpGf+yZJE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oGST87ppwIMbYJERYAykTLHIk7rongXP25mZLY3dgimKJBeb7
	EOrjNdqGWnx/mvtKnvxI/pstcWBuxWoYcZyzaJZxaGq7YzP+fr/bwB5tWEKzwC44dPs=
X-Gm-Gg: AYBFou3PDgzLv6n3B7919ske8INR8JtwEr+hSs9Lyxtwluf0sEa3QyvS/0w97sHKRyK
	jCyXzlWgEXP02CrKZQKDBhPiuBCjeOh7/zOj6HCFp6AQkEQccGxlrF34EExUraQeL+uw/zvSGOf
	zADTk7EsRTwEc022FAaA27S+WJDbUPeAxoCHGVC09UtA9qHPV2uJVqk6OLCq2iZ1EvTpo6d+nNf
	84ByWQW0S1RubWxCiumwjETpEkWkBh9npq9B6Bl11PxFvgEgmrks916fvxvVsxdstENM1dN6pvw
	rpEioHc717fVYf7b32bCvvaWS3FMW0Y7Df4Tv2bPS9HndTZGWts7o36iMWUD6+ljJO2X4jBeXFe
	fImN8WUIGsYWda2uSVFpEdGjCVGBvL3vZ/sp98qGi2lJ+0BGvNIjugO6G1KoAsBl28ueex4swV/
	Rt/jeLRhk4CNQm3xU4Aiej5rLOh8uXttD6fScXaNn691Dkx2QnGwEvUfTG3tInGqt4/umasrPXq
	7h54J55exQyhng9kee+bw06v3HQjpLQ4ugY0L5g5N4gqYvn8hSj3hCPPnZ6WDnrPCJmO4KSdC/2
	ztqtOpoL/4GYEdLebS6b88A/jgzft/aycxsmf+yl/5cdWEgdvbcn
X-Received: by 2002:a05:7022:f20f:b0:1b3:b53e:b4cd with SMTP id a92af1059eb24-1b5031003e7mr4831204c88.21.1794625563708;
        Fri, 13 Nov 2026 19:06:03 -0800 (PST)
Received: from apollo.purestorage.com ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316e008sm10829382c88.6.2026.11.13.19.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:06:03 -0800 (PST)
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
Subject: [PATCH v7 13/17] nvme-fc: perform error recovery directly from ioerr_work
Date: Fri, 13 Nov 2026 19:04:27 -0800
Message-ID: <20261114030454.2836543-14-mkhalfella@purestorage.com>
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

Now that nvme_fc_start_ioerr_recovery() moves the controller to
RESETTING before queueing ioerr_work, the nvme_reset_ctrl() call in
nvme_fc_error_recovery() fails with -EBUSY and no recovery runs.

Do the recovery in the work itself instead: stop the keep-alive and
the AEN submission, tear down the association so that any command a
core work item is waiting on is aborted at once, stop the controller,
move to CONNECTING and schedule a reconnect. If the CONNECTING
transition fails the controller is being deleted and the delete path
finishes the job. This is how rdma and tcp structure their error
recovery too.

The work is only ever queued right after a successful transition to
RESETTING, so when it runs it owns the controller: a reset or a
firmware activation holding RESETTING cannot be in progress at the
same time, and the work does not need to re-check the state.

Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
---
 drivers/nvme/host/fc.c | 57 ++++++++++++++++--------------------------
 1 file changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index c4603be38144..0ba621649afe 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -229,6 +229,8 @@ static struct device *fc_udev_device;
 static void nvme_fc_complete_rq(struct request *rq);
 static void nvme_fc_start_ioerr_recovery(struct nvme_fc_ctrl *ctrl,
 					 char *errmsg);
+static void __nvme_fc_abort_outstanding_ios(struct nvme_fc_ctrl *ctrl,
+					    bool start_queues);
 
 /* *********************** FC-NVME Port Management ************************ */
 
@@ -987,7 +989,8 @@ fc_dma_unmap_sg(struct device *dev, struct scatterlist *sg, int nents,
 static void nvme_fc_ctrl_put(struct nvme_fc_ctrl *);
 static int nvme_fc_ctrl_get(struct nvme_fc_ctrl *);
 
-static void nvme_fc_error_recovery(struct nvme_fc_ctrl *ctrl, char *errmsg);
+static void nvme_fc_delete_association(struct nvme_fc_ctrl *ctrl);
+static void nvme_fc_reconnect_or_delete(struct nvme_fc_ctrl *ctrl, int status);
 
 static void
 __nvme_fc_finish_ls_req(struct nvmefc_ls_req_op *lsop)
@@ -1880,7 +1883,23 @@ nvme_fc_ctrl_ioerr_work(struct work_struct *work)
 	struct nvme_fc_ctrl *ctrl =
 			container_of(work, struct nvme_fc_ctrl, ioerr_work);
 
-	nvme_fc_error_recovery(ctrl, "transport detected io error");
+	nvme_stop_keep_alive(&ctrl->ctrl);
+	flush_work(&ctrl->ctrl.async_event_work);
+
+	/* will block while waiting for io to terminate */
+	nvme_fc_delete_association(ctrl);
+	nvme_stop_ctrl(&ctrl->ctrl);
+
+	/* Do not reconnect if controller is being deleted */
+	if (!nvme_change_ctrl_state(&ctrl->ctrl, NVME_CTRL_CONNECTING))
+		return;
+
+	if (ctrl->rport->remoteport.port_state == FC_OBJSTATE_ONLINE) {
+		queue_delayed_work(nvme_wq, &ctrl->connect_work, 0);
+		return;
+	}
+
+	nvme_fc_reconnect_or_delete(ctrl, -ENOTCONN);
 }
 
 /*
@@ -2528,39 +2547,6 @@ __nvme_fc_abort_outstanding_ios(struct nvme_fc_ctrl *ctrl, bool start_queues)
 		nvme_unquiesce_admin_queue(&ctrl->ctrl);
 }
 
-static void
-nvme_fc_error_recovery(struct nvme_fc_ctrl *ctrl, char *errmsg)
-{
-	enum nvme_ctrl_state state = nvme_ctrl_state(&ctrl->ctrl);
-
-	/*
-	 * if an error (io timeout, etc) while (re)connecting, the remote
-	 * port requested terminating of the association (disconnect_ls)
-	 * or an error (timeout or abort) occurred on an io while creating
-	 * the controller.  Abort any ios on the association and let the
-	 * create_association error path resolve things.
-	 */
-	if (state == NVME_CTRL_CONNECTING) {
-		__nvme_fc_abort_outstanding_ios(ctrl, true);
-		dev_warn(ctrl->ctrl.device,
-			"NVME-FC{%d}: transport error during (re)connect\n",
-			ctrl->cnum);
-		return;
-	}
-
-	/* Otherwise, only proceed if in LIVE state - e.g. on first error */
-	if (state != NVME_CTRL_LIVE)
-		return;
-
-	dev_warn(ctrl->ctrl.device,
-		"NVME-FC{%d}: transport association event: %s\n",
-		ctrl->cnum, errmsg);
-	dev_warn(ctrl->ctrl.device,
-		"NVME-FC{%d}: resetting controller\n", ctrl->cnum);
-
-	nvme_reset_ctrl(&ctrl->ctrl);
-}
-
 static enum blk_eh_timer_return nvme_fc_timeout(struct request *rq)
 {
 	struct nvme_fc_fcp_op *op = blk_mq_rq_to_pdu(rq);
@@ -3399,7 +3385,6 @@ nvme_fc_reset_ctrl_work(struct work_struct *work)
 	}
 }
 
-
 static const struct nvme_ctrl_ops nvme_fc_ctrl_ops = {
 	.name			= "fc",
 	.module			= THIS_MODULE,
-- 
2.56.0

