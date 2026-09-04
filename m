Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E1B2D0C62
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562876; cv=none; b=oIxcF102BdTW8WdKEIXs5ogfDDVvBG1570b6nrRvwsHD0xR43U/TT7fwzY829fHM8th6YNE1WxSa1kRC52z+Qkd/yKA28YY1BpB/r4jqMxvYY4gZI9QoZcqklHpZQfIiY+l7YX5qOWNXdXFiXt+jRFKkpdqaeg/cGBRSgVI9n6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562876; c=relaxed/simple;
	bh=HMEynMoBSSHgcFPFvGVxH0GP08GQhvLrBkqv+4vUEsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBe26xNaWdtkolkdORRfFho+UbFA3gomk+jgnlLdYeH6w/Z47Bvx+XUndvCLYwekQzYxWQQv8uwVIKSmhvyIQI0pxY0x4O5zfPS79u+f2fTcEDvhu4K0GAjjP1WnMQ47DuHXLQZhIDF6PyxNIunFAfJZOVssDnQ2s0WAb8q1fD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=FNxdK+iq; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="FNxdK+iq"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6acc74fef22so810491eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788562873; x=1789167673; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DWqZGlZlOXVkVFEw7jqJALzgTnRow1syDq0/rhbvtyU=;
        b=FNxdK+iq96BXlVEHC4g6e4zVIfAFCbAvLFRcT09c7tbMxJHYsbE2lPE6NvsFonjQjg
         KKXOk5EZOgewWkOnGcpip9VxHRlfcaH8nxWaP+e2RAItC/nXJR2/fM/g7SI53S9FZMkk
         X6cZV3B7/ii1H3Sjt+C+VNLmf1zAey4NzcIqggPt3mORALX6Men8fIyLalAGLVjDSlQY
         5ypjkEh0ROw+/0VmIvEpy65f1qucQ4XXXr9TBN9nqgzPAApnFLehG5zzCxlNenyJFWHb
         Uw28bSXtJk+qDPfeFrpT1v1fIUWMghuWJxF4fPsiho+HDd50fijeSh4Mg8rhYOXWr2NE
         avHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788562873; x=1789167673;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DWqZGlZlOXVkVFEw7jqJALzgTnRow1syDq0/rhbvtyU=;
        b=fumJkyeIOdRVOZpIYjb+kmF+nmMThRcYVV7dxyjhY4G2K5CUnyIJkwbmBAKbdoPNa8
         m0/heyCe0qJXAyGR2bSNmo0fBi9Djp1JJuT4QGltQK4U87FkW+oizMR6om+AsWItOh+1
         e8lMaXt7EU+XbbWYC5elxKI2x0L8bl1XPJxikE/rXy3vTehM1aeYrnVEBsliTLUDbOti
         EmX3pQEwAhCiASQrQ6hEgEbmOlcLJGXS87IO9rCbe6Y/D8rNYaQWta4+LK+usw37Mn9x
         BcRlyWDkLVwxpybEPSuU11N6/oeXcVogfqU2COilOHrJ3CyhnvDW+nOxW3D8pLC4pId+
         9dvA==
X-Forwarded-Encrypted: i=1; AKwUvBzQcVrtmjd6jArSl++4H6JmmXt4yrgwOaGQWJV6Mlv8W/Jj5g7ORoziWDaBqihQkQKxwGJp4npWHAie8QA=@vger.kernel.org
X-Gm-Message-State: AFuF++mPFCmALJRcd0+0GaX8Qf8s/m9vOuFCOP2Pv7dB0PyW5LOzUT1D
	N3DjgqDMu1RIp/3PKoe2xspTDsSnktlSoPJGt8hAFqqSmtKwTuW1rp/cqnIIUxea7a8=
X-Gm-Gg: AYBFou3YBDYL4DkjgW+3UBLnEtiVSsuptoqWT4LZepGvJ50Xq+PxDC5IJn2vyHKaeqS
	+v46zNjGUgqoBwUyDQg8O/rWnDHCq84JN21Bwg1RTfay2LJr/bmscZSDtQ+Ec5Brpdw0GScvruB
	eARyGinJeqzLxdrpqZrpFf6e5GSOL9rlknnEHhyh4lKyn+8WfNS2VL4ykb51Le3gPWgQF1SGKgc
	CnNS14huPKCcZfLKMfI1UOCEZp0tguEcPZp4gzH1tOvHw/fanJl3ZLkuFSc5w+f7+d07g7fns8p
	+dedyvYCgTBBUhuELVJfX4Ylyao3Qx2oXQpFEJDdeBmIngW/uIDZ5erBJZ+skqUb1yyfL5kDrSf
	qZA0k+JEOHU2Qacer3YJGZPetwMee4J9E1s23GfJJTD2bTeIug0EY5Wh91Rgw2N9Td6sUKcOpFB
	cKJNOTNKiJqzQS1XUl8VqePXs57tlRLtLnW0HjiZIe27SzOIW7rStHNJNMLL7oOTxm0Jg=
X-Received: by 2002:a05:6820:810a:b0:6b7:46e9:96ff with SMTP id 006d021491bc7-6b746e9a376mr4834977eaf.47.1788562872859;
        Fri, 04 Sep 2026 16:01:12 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([2607:fb90:9c20:7a99::791d])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm9376783eec.26.2026.09.04.16.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 16:01:11 -0700 (PDT)
Date: Fri, 4 Sep 2026 16:01:10 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Hannes Reinecke <hare@suse.de>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
	Sagi Grimberg <sagi@grimberg.me>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	Dhaval Giani <dgiani@purestorage.com>,
	Aaron Dailey <adailey@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 10/16] nvme-tcp: Use CCR to recover controller that
 hits an error
Message-ID: <20260904230110.GC5552-mkhalfella@purestorage.com>
References: <20260712022437.3743117-1-mkhalfella@purestorage.com>
 <20260712022437.3743117-11-mkhalfella@purestorage.com>
 <f27fdc8d-9aea-42d1-8f55-04d8355a50c4@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f27fdc8d-9aea-42d1-8f55-04d8355a50c4@suse.de>

On Mon 2026-07-13 09:17:33 +0200, Hannes Reinecke wrote:
> On 7/12/26 4:23 AM, Mohamed Khalfella wrote:
> > An alive nvme controller that hits an error now will move to FENCING
> > state instead of RESETTING state. ctrl->fencing_work attempts CCR to
> > terminate inflight IOs. Regardless of the success or failure of CCR
> > operation the controller is transitioned to RESETTING state to continue
> > error recovery process.
> > 
> > Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> > ---
> >   drivers/nvme/host/tcp.c | 30 +++++++++++++++++++++++++++++-
> >   1 file changed, 29 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> > index ba5c7b3e2a7c..a1711dd1d3c2 100644
> > --- a/drivers/nvme/host/tcp.c
> > +++ b/drivers/nvme/host/tcp.c
> > @@ -161,6 +161,7 @@ struct nvme_tcp_ctrl {
> >   	struct sockaddr_storage src_addr;
> >   	struct nvme_ctrl	ctrl;
> >   
> > +	struct work_struct	fencing_work;
> >   	struct work_struct	err_work;
> >   	struct delayed_work	connect_work;
> >   	struct nvme_tcp_request async_req;
> > @@ -605,6 +606,12 @@ static void nvme_tcp_init_recv_ctx(struct nvme_tcp_queue *queue)
> >   
> >   static void nvme_tcp_error_recovery(struct nvme_ctrl *ctrl)
> >   {
> > +	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCING)) {
> > +		dev_warn(ctrl->device, "starting controller fencing\n");
> > +		queue_work(nvme_wq, &to_tcp_ctrl(ctrl)->fencing_work);
> > +		return;
> > +	}
> > +
> >   	if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
> >   		return;
> >   
> > @@ -2494,12 +2501,29 @@ static void nvme_tcp_reconnect_ctrl_work(struct work_struct *work)
> >   	nvme_tcp_reconnect_or_remove(ctrl, ret);
> >   }
> >   
> > +static void nvme_tcp_fencing_work(struct work_struct *work)
> > +{
> > +	struct nvme_tcp_ctrl *tcp_ctrl = container_of(work,
> > +			struct nvme_tcp_ctrl, fencing_work);
> > +	struct nvme_ctrl *ctrl = &tcp_ctrl->ctrl;
> > +	unsigned long rem;
> > +
> > +	rem = nvme_fence_ctrl(ctrl);
> > +	if (rem)
> > +		dev_info(ctrl->device, "CCR failed, starting error recovery\n");
> > +
> > +	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
> 
> This needs to be before nvme_fence_ctrl(). Otherwise the state is 
> meaningless are we're moving to RESETTING directly afterwards.

The transition to FENCED signals that we are done with the fencing
process. Only then FENCED -> RESETTING can happen. Yes, we are switching
directly to RESETTING after that because we want to run error recovery
to teardown and bring the controller back.

The only reason FENCED exist is to prevent a controller in FENCING state
from being reset or deleted.
> 
> > +	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
> > +		queue_work(nvme_reset_wq, &tcp_ctrl->err_work);
> > +}
> > +
> >   static void nvme_tcp_error_recovery_work(struct work_struct *work)
> >   {
> >   	struct nvme_tcp_ctrl *tcp_ctrl = container_of(work,
> >   				struct nvme_tcp_ctrl, err_work);
> >   	struct nvme_ctrl *ctrl = &tcp_ctrl->ctrl;
> >   
> > +	flush_work(&to_tcp_ctrl(ctrl)->fencing_work);
> 
> Not so happy with this one here.
> _If_ fencing is still running we really should not be entering here.
> And If fencing is not running we won't need to call it.
> I'd prefer some sort of WARN_ON() here if fencing is still running.

fencing_work should not be running. It should be exiting after it queued
err_work. However, it does that asynchronously. It means it could still
be running. flush_work() just makes sure it is 100% done because we are
not expecting it in the middle doing any useful work at this time.

> 
> >   	if (nvme_tcp_key_revoke_needed(ctrl))
> >   		nvme_auth_revoke_tls_key(ctrl);
> >   	nvme_stop_keep_alive(ctrl);
> > @@ -2542,6 +2566,7 @@ static void nvme_reset_ctrl_work(struct work_struct *work)
> >   		container_of(work, struct nvme_ctrl, reset_work);
> >   	int ret;
> >   
> > +	flush_work(&to_tcp_ctrl(ctrl)->fencing_work);
> 
> Same here.

This is needed in case nvme_tcp_fencing_work() loses the race as. Now
reset_work needs to flush fencing_work because it took over instead of
err_work.

> 
> >   	if (nvme_tcp_key_revoke_needed(ctrl))
> >   		nvme_auth_revoke_tls_key(ctrl);
> >   	nvme_stop_ctrl(ctrl);
> > @@ -2667,13 +2692,15 @@ static enum blk_eh_timer_return nvme_tcp_timeout(struct request *rq)
> >   	struct nvme_tcp_cmd_pdu *pdu = nvme_tcp_req_cmd_pdu(req);
> >   	struct nvme_command *cmd = &pdu->cmd;
> >   	int qid = nvme_tcp_queue_id(req->queue);
> > +	enum nvme_ctrl_state state;
> >   
> >   	dev_warn(ctrl->device,
> >   		 "I/O tag %d (%04x) type %d opcode %#x (%s) QID %d timeout\n",
> >   		 rq->tag, nvme_cid(rq), pdu->hdr.type, cmd->common.opcode,
> >   		 nvme_fabrics_opcode_str(qid, cmd), qid);
> >   
> > -	if (nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE) {
> > +	state = nvme_ctrl_state(ctrl);
> > +	if (state != NVME_CTRL_LIVE && state != NVME_CTRL_FENCING) {
> >   		/*
> >   		 * If we are resetting, connecting or deleting we should
> >   		 * complete immediately because we may block controller
> > @@ -2928,6 +2955,7 @@ static struct nvme_tcp_ctrl *nvme_tcp_alloc_ctrl(struct device *dev,
> >   
> >   	INIT_DELAYED_WORK(&ctrl->connect_work,
> >   			nvme_tcp_reconnect_ctrl_work);
> > +	INIT_WORK(&ctrl->fencing_work, nvme_tcp_fencing_work);
> >   	INIT_WORK(&ctrl->err_work, nvme_tcp_error_recovery_work);
> >   	INIT_WORK(&ctrl->ctrl.reset_work, nvme_reset_ctrl_work);
> >   
> 
> Cheers,
> 
> Hannes
> -- 
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
> HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
