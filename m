Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668735;
	b=xDmokhZqSlsT4L1jjelruZT+YSVo2k1WmW0nzCJp3T3hbLe281+2HscAfJ7rWeHly1Hu
	 T7JsAQg3Of5rZCEcoDEEfnbtfITApEmlOXoUiHH3/aiBP92RAYWm1pSaodsTlTJwaFkr8
	 fbwf8n25qO9rN6mO7j8qNhk+JiMtYlW4WdiPkEvHmuP0xVusYCISWxGC/Rp+Dh8WV6PZs
	 EEr9xEXZln5l5Vkaxy+hT6vm6TnkNjmGrG+DxaKGf4EMBZGLEHYjv7DHa0hijZ0drd5bS
	 CYgBaQ7sEGWwitnPjCRUTjKp7ov55gTLyuLiCuS/9Y4pCBlwFXccJjh7lIU5uQTHBXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iHU0/54xdec8W74xwY6SvsKG+KurNlwiejIZ7W19vFs=;
	b=Q1+vT6Af9JMu/dPwlu47ghlMvQVcp2Wr6R5V7XrYyK3iUBwDoB7/z/UjJ0PzaXowlEMo
	 6yuiyZJwjCGfOW6YszkmXCHxjKoUCrrmeIkcrj99h/J+W4IWgyTOO49RXMkO+9e+pQpUE
	 ZFxqDIcYjP8aBeT8xB9/YwMd2uTE3f3ZdX720pBAoPlC14q4oXyj1KGkz7uKVjVpuWrZq
	 e1D33tPFl4kcBrZKHRjQpF7G39SmOsgsk08xcvVFM4OLi3QE8IDRHYDFPKik4CBDf7ExU
	 R8yNRfo0z9rwpf5yFLO1JK70rIlEnOON6LPMu2vb3ZJNtKA3vQnt1DyEChaCRYxp93w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Su6cG0ed;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82FA606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D82FA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Su6cG0ed
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35b2c599f43so6292469eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793668734; x=1794273534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iHU0/54xdec8W74xwY6SvsKG+KurNlwiejIZ7W19vFs=;
        b=Su6cG0edPxJ8+Aww8arDPk+QyIJHJr6CfOx47CExuaBGyWFosE8z6Xx+NdRnwVcstN
         l2v8oWxBEcS2BJVEWZPKQyw8aGDMPpi/mZABJXWi4mmjXmAPXc7NyRGi9yc3LX4pAyEb
         YUU3umrKLgc4ITtNM54PLeGd6oJT8RK8+pGUR6PADS8uOsBSp4n6aGVRUET61mDAR1E7
         zZMry6XbO/Ri0bXI4wmp0Tigsm4j7JvX/q37zD07UhucPE3kQIF1xgwzIMBDQayk9VwA
         Gf9AsbKG+AiwvRqwfxoaxWTf1X8bz1jGqHV3DgwBSkHFgZrr5YOxF03TaIfqJTbc6Vqo
         QiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668734; x=1794273534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHU0/54xdec8W74xwY6SvsKG+KurNlwiejIZ7W19vFs=;
        b=OfdQiazfzvBrjtmne2qB0ZtbeWujmLr18ugGmrIeI5b8bJNyWhLziJLIxxJCEHPmPv
         p/wmboawgjWUleqovtQOycefQIzMtRsPPK6oEy22Ss921Qf7nfs1BULC/2hunISEmfqC
         87/1yXJcKNVJknP65x2k6lEX8bafVJ2uddKIFGQOffTbWBLvkwbGcjN4Wf9Vw3bPnZc2
         Bv3ARq9GXbcJ18wc1zMbDrnXPNtgBWWPkchE/T21BUk6kHZTNMsmPfRkgoF6f/1XWnYc
         TXnnt1CtePbgrCL6v4NlcGRR56uUWEym0ZyN5aB313y8J5ePRsNJbOTW71mTqQb3KwPv
         3gGg==
X-Forwarded-Encrypted: i=1; AKwUvBxC47KaW5r47ZjDuUGeEEEC1TrpLHg3B+pnA4QCeZiTW29psEeqQ3mPkWezEITH6BKPklyu9OKhiKnkrHo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xiLEj0kg05YAWX9baJRwIF3wcNbVxvYgNfLY/fo2DpfsHKWFn
	I0tgemqBiJ5R8rog4SzCi8HIPPHCRFwAcfwXcwA3IOSb7z82gL5Z1aQn1qTxg5414Ds=
X-Gm-Gg: AYBFou2sGCdyyn//AD/ts63sTAvFJyMupV8r5VqlW099VHyNzwCSJd+C53AAVQvcji+
	SRxUs6eSxt0Aj5TC10tI2smSiJu36NypB6APixf1HaYc4buF7J2mSWNI85sho3Ls6IVLqIeFthQ
	xeEwvfOb1WF1mq7bzkaNc0icao0W6tlaq5UNjk/jkWAhFHYnWm8V2r9iMQLFCOXwlcS38Irey+p
	mPzMgDBM+SdW2E0Ge2C5ZkE3pWzLwew5gPO1ApuCoHMFkWYqIhnntQmcLYaOFy20+B3eMrNcg1a
	KSCo7KDbbHxINfoYpJKpikvSTZbX+EXk2lZyaGL/50AWTVokwKx5R/e0PP+wnjGsforIwwSaQ/G
	AG4E9bCmBw3obJbtR1pYYaWSbhEDpWjQOLTyJvQgzTjUyvmsIPZcifUbkLbznoC6JDyRyEKjL7r
	RH7QwK+/TqPsS/Dqx9Cd26R6vIN9xl5nQfiG/AxzvC8XUeKFYVTgUaWaL5/bFS2bDDvTpR20kAx
	FmYrhml7bP4FdUlMQNCshMWlkTpF2Q3x8cEA8LrKcSsEl68lCKoiyJ/n7SMSvZNaQvIg+jsPZhC
	LOeDzCSaX342kxSiVTFpi0wCm8IW0OJAPpME0Oc8puMzp872
X-Received: by 2002:a05:693c:638e:20b0:369:f18f:34ab with SMTP id 5a478bee46e88-36a4235f6bamr18069443eec.11.1793668733484;
        Mon, 02 Nov 2026 17:18:53 -0800 (PST)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-36b13bd87b2sm1348645eec.28.2026.11.02.17.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:18:53 -0800 (PST)
Date: Mon, 2 Nov 2026 17:18:51 -0800
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 15/18] nvme-fc: Hold inflight requests while in
 FENCING state
Message-ID: <20261103011851.GK122209-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-16-mkhalfella@purestorage.com>
 <d9563967-9ddb-4cd7-9149-d1f37522e1fa@flourine.local>
 <20261021212357.GZ2931-mkhalfella@purestorage.com>
 <45d52d19-dbfc-49b9-a445-a8fb9e69abef@flourine.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45d52d19-dbfc-49b9-a445-a8fb9e69abef@flourine.local>

On Fri 2026-10-30 11:29:12 +0100, Daniel Wagner wrote:
> On Wed, Oct 21, 2026 at 02:23:57PM -0700, Mohamed Khalfella wrote:
> > Adding new FCPOP_STATE_HELD will result in a more invasive change and it
> > will result in nvme-fc no using nvme_cancel_tagset(). My intent with
> > this change is to bring nvme-fc closer to other transport and only
> > cancel inflight requests. synchronize_rcu() is a simpler in this case.
> 
> I am totally against introducing yet another synchronization method. Fix
> it properly.

Here is a diff that applies on top of the patches in order to remove
synchronize_rcu() and add FCPOP_STATE_HELD as you suggested. I will try
to run more testing on this change to see if it holds up. While I do
that please take a look and let me know what do you think.

diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index 2bb6cdfbb718..6c260f6b47b2 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -83,6 +83,7 @@ enum nvme_fcpop_state {
 	FCPOP_STATE_ACTIVE	= 2,
 	FCPOP_STATE_ABORTED	= 3,
 	FCPOP_STATE_COMPLETE	= 4,
+	FCPOP_STATE_HELD	= 5,
 };
 
 struct nvme_fc_fcp_op {
@@ -2086,9 +2087,6 @@ nvme_fc_fcpio_done(struct nvmefc_fcp_req *req)
 	 * association to be terminated.
 	 */
 
-	/* Pairs with synchronize_rcu() in __nvme_fc_teardown_association() */
-	rcu_read_lock();
-
 	opstate = atomic_xchg(&op->state, FCPOP_STATE_COMPLETE);
 
 	fc_dma_sync_single_for_cpu(ctrl->lport->dev, op->fcp_req.rspdma,
@@ -2201,12 +2199,18 @@ nvme_fc_fcpio_done(struct nvmefc_fcp_req *req)
 
 	/*
 	 * If we are going to terminate associations and the controller is
-	 * LIVE or FENCING, then do not complete this request now. Let error
-	 * recovery cancel this request when it is safe to do so.
+	 * LIVE or FENCING, then do not complete this request now. Move the
+	 * op to HELD and let nvme_fc_cancel_held_requests() cancel it when
+	 * it is safe to do so. HELD is only reachable from COMPLETE through
+	 * this cmpxchg: if the cancellation has already walked the tagset it
+	 * moved the op out of COMPLETE, the cmpxchg fails and the request is
+	 * completed here instead. Either way exactly one path completes it.
 	 */
 	state = nvme_ctrl_state(&ctrl->ctrl);
 	if (terminate_assoc &&
-	    (state == NVME_CTRL_LIVE || state == NVME_CTRL_FENCING))
+	    (state == NVME_CTRL_LIVE || state == NVME_CTRL_FENCING) &&
+	    atomic_cmpxchg(&op->state, FCPOP_STATE_COMPLETE,
+			   FCPOP_STATE_HELD) == FCPOP_STATE_COMPLETE)
 		goto check_op_term;
 
 	if (!nvme_try_complete_req(rq, status, result))
@@ -2218,8 +2222,6 @@ nvme_fc_fcpio_done(struct nvmefc_fcp_req *req)
 check_error:
 	if (terminate_assoc)
 		nvme_fc_start_ioerr_recovery(ctrl, "io error");
-
-	rcu_read_unlock();
 }
 
 static int
@@ -3364,13 +3366,6 @@ __nvme_fc_teardown_association(struct nvme_fc_ctrl *ctrl)
 	clear_bit(FCCTRL_TERMIO, &ctrl->flags);
 	spin_unlock_irq(&ctrl->lock);
 
-	/*
-	 * Wait for a started nvme_fc_fcpio_done() to complete before we
-	 * proceed with cancelling inflight requests. This guarantees a
-	 * request is completed by one of the two codepaths, not both.
-	 */
-	synchronize_rcu();
-
 	nvme_fc_term_aen_ops(ctrl);
 
 	/*
@@ -3405,18 +3400,51 @@ __nvme_fc_teardown_association(struct nvme_fc_ctrl *ctrl)
 	nvme_fc_ctlr_inactive_on_rport(ctrl);
 }
 
-/* Complete the requests held in __nvme_fc_teardown_association() */
+static bool
+nvme_fc_cancel_held_request(struct request *req, void *data)
+{
+	struct nvme_fc_fcp_op *op = blk_mq_rq_to_pdu(req);
+	struct nvme_ctrl *ctrl = data;
+
+	/*
+	 * A single cmpxchg decides who completes this request. If the op is
+	 * HELD, nvme_fc_fcpio_done() is done with it and we cancel it. If it
+	 * is still COMPLETE, nvme_fc_fcpio_done() has not decided yet: move
+	 * it to IDLE so its own cmpxchg to HELD fails and it completes the
+	 * request itself (nvme_fc_complete_rq() sets IDLE anyway). Doing this
+	 * as read-then-cmpxchg would let the op become HELD in between and
+	 * leave it with no one to complete it.
+	 */
+	if (atomic_cmpxchg(&op->state, FCPOP_STATE_COMPLETE,
+			   FCPOP_STATE_IDLE) == FCPOP_STATE_HELD)
+		nvme_cancel_request(req, ctrl);
+
+	return true;
+}
+
 static void
-nvme_fc_flush_held_requests(struct nvme_fc_ctrl *ctrl)
+nvme_fc_cancel_held_requests(struct nvme_ctrl *ctrl, struct blk_mq_tag_set *set)
 {
-	nvme_cancel_tagset(&ctrl->ctrl);
-	nvme_cancel_admin_tagset(&ctrl->ctrl);
+	if (set) {
+		blk_mq_tagset_busy_iter(set, nvme_fc_cancel_held_request, ctrl);
+		blk_mq_tagset_wait_completed_request(set);
+	}
+}
+
+/* Complete the requests nvme_fc_fcpio_done() held during the fence */
+static void
+nvme_fc_flush_held_requests(struct nvme_fc_ctrl *fc_ctrl)
+{
+	struct nvme_ctrl *ctrl = &fc_ctrl->ctrl;
+
+	nvme_fc_cancel_held_requests(ctrl, ctrl->tagset);
+	nvme_fc_cancel_held_requests(ctrl, ctrl->admin_tagset);
 
 	/* re-enable the admin_q so anything new can fast fail */
-	nvme_unquiesce_admin_queue(&ctrl->ctrl);
+	nvme_unquiesce_admin_queue(ctrl);
 
 	/* resume the io queues so that things will fast fail */
-	nvme_unquiesce_io_queues(&ctrl->ctrl);
+	nvme_unquiesce_io_queues(ctrl);
 }
 
 /*

