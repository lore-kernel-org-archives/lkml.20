Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5850D381B16
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788563094; cv=none; b=urLc2DH7gM14EToA4ePRKtLHJEkHhSJWK6dsxKe6wfEeNWwROAqeT5nY65Y7nDf/A1VBe0nRy0HYRBpRrNNcNYBYyx4umTzhKMAKnvbI+Ei1beFfkAy/Ns/T2PawAKibmt3NDIPJkCGNVdQ64MIetR54xfiNDbhU0p0SSeu5EvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788563094; c=relaxed/simple;
	bh=c3WOYvDgdYBUihkX3T3/lFWcGEcLCQGlbxFAK3B6UD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/0s/33R3BeTRg/KLfBmSUVqW5nef3nbTcSdLkhXBCZYLm/ARdI7FWgxvSJbOK9od/HUxyc8dRpsUBv5/3CxjJcHw/P4YPr5zHfJyKJZGnTLnJrPTnERWGaMOwRA8dVxZtg2dV9QuZFiJ0CMiOmRcI+B3mtm5F5LMNG6t/1fVzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=bF+CZyB1; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="bF+CZyB1"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d94c868ea5so15747165ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788563091; x=1789167891; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqfexXcPB0MjW1WCKBzg0IktuOs6wgXBjjXnxHW8muU=;
        b=bF+CZyB1Ee6uDdQuKG+sQyKA42RTGf15rggpIno/7MLXmQofi/5mXzNgdff1iUEM3D
         MLHx30vPZKCqiZDxj2L1vDYJWrljCb8G6pifcbca9D2vnONz1glDOLQexE4NoF+zREOr
         m4fIrCTVfkOZLQscNp5wB2CFQ9WoN4tTpzd56NVsgAAdpOXxLETbvLUtw+K1XKO1EdMg
         iwsnsbyYrX4hhptClEnDw3Lds81TseUzqoE1xoAml1sEMsdSNSSU6aVYjKsprTbYRyRU
         PXeweRZDq4p0wrQJoKrYcm98JbRLd3XijRrOqanv5gYI9BtWanfusyQIFe4OuDN8pJ5z
         7TjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788563091; x=1789167891;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GqfexXcPB0MjW1WCKBzg0IktuOs6wgXBjjXnxHW8muU=;
        b=S+7AjoCQz1Mq6na5xcQyT/499fk/KnLYQr7xJeeoAvTEPDC/R10lxu1Oz9ABEviXnO
         yUTbCOMSz4M6PRbVbmI/xdeAzGCK0Xz0nyQRy+ZzMdYMVMZVGLcc3E91niDnaSdnp/jq
         2rlQ/kOR8bSakOVJRMtyz7VxvaH8IEYTQbvAmR4fHqqh4D//p66RNwrt4MZGuuCAPZdt
         8McSqgY777xPZYY3RkVueOcZdPzHOZllfoQHuEpwKhPQYUTaOeHOEEs59yffMgpnFal5
         gcHS0/0WdXFlL029BGift7CdogjTeDLvjLlw8jjSWz9pEf//vdBv0prB+HyiV7Sg/KcS
         ID0Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9Dg+0Rea1fEeFcnSVIVBD7+C0ZYSqAgGX+O/8kN84cu+qx0UIeab2q8xZ+l7CnTzVxeYqiG10Eebs6Ts=@vger.kernel.org
X-Gm-Message-State: AFuF++nsmvIw1HDXvZczeVGXKRreEOqgIoFBRybBJ6PfeN9fnaM7NBzE
	PUaK+Nt0CPpiDjkqpU6Ty+NaYX3tLJRZWjDcu6gebuWG4N51C/cM/6GMSVQ0bHRR1Ck=
X-Gm-Gg: AYBFou3cd9+AIXggHTZUSXI4A/qJSNcvPVYXfREUl7+m098NcchmARlav/W9lgDFuXn
	gP8ScA+ITSXgUn3E/Zil1fbjFIuw3ThxPPeXoRtU8h9ibE0nRMDWtjYkGOcTd9U29In2zDqFBmN
	bEjvPpep/2Hq7M+2VGfbMpyOGiymTE2TJqrxfiNrU7vD/uExbJllKREEUmPRpVYqmQuNxvelP69
	Tdy3TRGKPBW4r8atqqELKI+LO/uKO/VSBa9hjOfJN5OhOTLO2ahYOpvY3QFBm7NH3AMuZn782zh
	D9s2WnOIX60bFmbGO5JPKSNYTf8N77OXWZ8hnmFAQV5ihq17z/aAE0j/p2TnO5bAyQcJHYaNTCl
	dHlQ5LT9OZ99GwiVg7aZIW+rLm22HCK+8Jtr01LI83CCxyTY7j/fIvzeiXB7R0QJs/cR2dHzz0E
	0hlGw96RcPjB2jFknrcy37yWIc+oEyWJsJG7e/lKWvSz5RS/2FEW0S50RCHg8wYyE/HWs=
X-Received: by 2002:a17:90b:3c42:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39b260d2977mr12813287a91.4.1788563091144;
        Fri, 04 Sep 2026 16:04:51 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([2607:fb90:9c20:7a99::791d])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm5699767eec.4.2026.09.04.16.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 16:04:50 -0700 (PDT)
Date: Fri, 4 Sep 2026 16:04:48 -0700
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
Subject: Re: [PATCH v5 08/16] nvme: Implement cross-controller reset recovery
Message-ID: <20260904230448.GD5552-mkhalfella@purestorage.com>
References: <20260712022437.3743117-1-mkhalfella@purestorage.com>
 <20260712022437.3743117-9-mkhalfella@purestorage.com>
 <30475d09-bba2-460b-bf05-869f355ef106@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <30475d09-bba2-460b-bf05-869f355ef106@suse.de>

On Mon 2026-07-13 09:04:14 +0200, Hannes Reinecke wrote:
> On 7/12/26 4:23 AM, Mohamed Khalfella wrote:
> > A host that has more than one path connecting to an nvme subsystem
> > typically has an nvme controller associated with every path. This is
> > mostly applicable to nvmeof. If one path goes down, inflight IOs on that
> > path should not be retried immediately on another path because this
> > could lead to data corruption as described in TP4129. TP8028 defines
> > cross-controller reset mechanism that can be used by host to terminate
> > IOs on the failed path using one of the remaining healthy paths. Only
> > after IOs are terminated, or long enough time passes as defined by
> > TP4129, inflight IOs should be retried on another path. Implement core
> > cross-controller reset shared logic to be used by the transports.
> > 
> > Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> > ---
> >   drivers/nvme/host/constants.c |   1 +
> >   drivers/nvme/host/core.c      | 152 ++++++++++++++++++++++++++++++++++
> >   drivers/nvme/host/nvme.h      |  10 +++
> >   3 files changed, 163 insertions(+)
> > 
> > diff --git a/drivers/nvme/host/constants.c b/drivers/nvme/host/constants.c
> > index dc90df9e13a2..f679efd5110e 100644
> > --- a/drivers/nvme/host/constants.c
> > +++ b/drivers/nvme/host/constants.c
> > @@ -46,6 +46,7 @@ static const char * const nvme_admin_ops[] = {
> >   	[nvme_admin_virtual_mgmt] = "Virtual Management",
> >   	[nvme_admin_nvme_mi_send] = "NVMe Send MI",
> >   	[nvme_admin_nvme_mi_recv] = "NVMe Receive MI",
> > +	[nvme_admin_cross_ctrl_reset] = "Cross Controller Reset",
> >   	[nvme_admin_dbbuf] = "Doorbell Buffer Config",
> >   	[nvme_admin_format_nvm] = "Format NVM",
> >   	[nvme_admin_security_send] = "Security Send",
> > diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> > index 1ef4dc38f755..a1deffc3cc00 100644
> > --- a/drivers/nvme/host/core.c
> > +++ b/drivers/nvme/host/core.c
> > @@ -571,6 +571,157 @@ void nvme_cancel_admin_tagset(struct nvme_ctrl *ctrl)
> >   }
> >   EXPORT_SYMBOL_GPL(nvme_cancel_admin_tagset);
> >   
> > +static struct nvme_ctrl *nvme_find_ctrl_ccr(struct nvme_ctrl *ictrl,
> > +					    u32 min_cntlid)
> > +{
> > +	struct nvme_subsystem *subsys = ictrl->subsys;
> > +	struct nvme_ctrl *ctrl, *sctrl = NULL;
> > +	unsigned long flags;
> > +	int ccr_used;
> > +
> > +	mutex_lock(&nvme_subsystems_lock);
> > +	list_for_each_entry(ctrl, &subsys->ctrls, subsys_entry) {
> > +		if (ctrl->cntlid < min_cntlid)
> > +			continue;
> > +
> > +		spin_lock_irqsave(&ctrl->lock, flags);
> > +		if (nvme_ctrl_state(ctrl) != NVME_CTRL_LIVE) {
> > +			spin_unlock_irqrestore(&ctrl->lock, flags);
> > +			continue;
> > +		}
> > +
> > +		ccr_used = atomic_inc_return(&ctrl->ccr_used);
> > +		if (ccr_used > ctrl->ccrl) {
> > +			atomic_dec(&ctrl->ccr_used);
> > +			spin_unlock_irqrestore(&ctrl->lock, flags);
> > +			continue;
> > +		}
> > +
> > +		/*
> > +		 * We got a good candidate source controller that is locked and
> > +		 * LIVE. However, no guarantee ctrl will not be deleted after
> > +		 * ctrl->lock is released. Get a ref of both ctrl and admin_q
> > +		 * so they do not disappear until we are done with them.
> > +		 */
> > +		WARN_ON_ONCE(!blk_get_queue(ctrl->admin_q));
> > +		nvme_get_ctrl(ctrl);
> > +		spin_unlock_irqrestore(&ctrl->lock, flags);
> > +		sctrl = ctrl;
> > +		break;
> > +	}
> > +	mutex_unlock(&nvme_subsystems_lock);
> > +	return sctrl;
> > +}
> > +
> > +static void nvme_put_ctrl_ccr(struct nvme_ctrl *sctrl)
> > +{
> > +	atomic_dec(&sctrl->ccr_used);
> > +	blk_put_queue(sctrl->admin_q);
> > +	nvme_put_ctrl(sctrl);
> > +}
> > +
> > +static int nvme_issue_wait_ccr(struct nvme_ctrl *sctrl, struct nvme_ctrl *ictrl,
> > +			       unsigned long deadline)
> > +{
> > +	struct nvme_ccr_entry ccr = { };
> > +	union nvme_result res = { 0 };
> > +	struct nvme_command c = { };
> > +	unsigned long flags, now, tmo = 0;
> > +	bool completed = false;
> > +	int ret = 0;
> > +	u32 result;
> > +
> > +	init_completion(&ccr.complete);
> > +	ccr.ictrl = ictrl;
> > +
> > +	spin_lock_irqsave(&sctrl->lock, flags);
> > +	list_add_tail(&ccr.list, &sctrl->ccr_list);
> > +	spin_unlock_irqrestore(&sctrl->lock, flags);
> > +
> > +	c.ccr.opcode = nvme_admin_cross_ctrl_reset;
> > +	c.ccr.ciu = ictrl->ciu;
> > +	c.ccr.icid = cpu_to_le16(ictrl->cntlid);
> > +	c.ccr.cirn = cpu_to_le64(ictrl->cirn);
> > +	ret = __nvme_submit_sync_cmd(sctrl->admin_q, &c, &res,
> > +				     NULL, 0, NVME_QID_ANY, 0);
> > +	if (ret) {
> > +		ret = -EIO;
> > +		goto out;
> > +	}
> > +
> > +	result = le32_to_cpu(res.u32);
> > +	if (result & 0x01) /* Immediate Reset Successful */
> > +		goto out;
> > +
> Do we care about any other values of 'result' ?

No we do not. It just makes the code easier to read IMO.

> 
> > +	now = jiffies;
> > +	if (time_before(now, deadline))
> > +		tmo = min_t(unsigned long,
> > +			    secs_to_jiffies(ictrl->kato), deadline - now);
> > +
> 
> Ideally we would check the request timeout for the CCR to not
> exceed 'deadline'.
> But as __nvme_submit_sync_cmd() doesn't allow to specify the timeout
> I guess it'll be good enough for now.
> (And if all goes to plan the CCR command should've been aborted in that
> case anyway).

Right, as a follow up work I would like to extend
__nvme_submit_sync_cmd() to take timeout, not in this patchset.

> 
> > +	if (!wait_for_completion_timeout(&ccr.complete, tmo)) {
> > +		ret = -ETIMEDOUT;
> > +		goto out;
> > +	}
> > +
> > +	completed = true;
> > +
> > +out:
> > +	spin_lock_irqsave(&sctrl->lock, flags);
> > +	list_del(&ccr.list);
> > +	spin_unlock_irqrestore(&sctrl->lock, flags);
> > +	if (completed) {
> > +		if (ccr.ccrs == NVME_CCR_STATUS_SUCCESS)
> > +			return 0;
> > +		return -EREMOTEIO;
> > +	}
> > +	return ret;
> > +}
> > +
> > +unsigned long nvme_fence_ctrl(struct nvme_ctrl *ictrl)
> > +{
> > +	unsigned long now, deadline, timeout;
> > +	struct nvme_ctrl *sctrl;
> > +	u32 min_cntlid = 0;
> > +	int ret;
> > +
> > +	timeout = nvme_fence_timeout_ms(ictrl);
> > +	dev_info(ictrl->device, "attempting CCR, timeout %lums\n", timeout);
> > +
> > +	now = jiffies;
> > +	deadline = jiffies + msecs_to_jiffies(timeout);
> > +	while (time_before(now, deadline)) {
> > +		sctrl = nvme_find_ctrl_ccr(ictrl, min_cntlid);
> > +		if (!sctrl) {
> > +			dev_dbg(ictrl->device,
> > +				"failed to find source controller\n");
> > +			return deadline - now;
> > +		}
> > +
> > +		ret = nvme_issue_wait_ccr(sctrl, ictrl, deadline);
> > +		if (!ret) {
> > +			dev_info(ictrl->device, "CCR succeeded using %s\n",
> > +				 dev_name(sctrl->device));
> > +			nvme_put_ctrl_ccr(sctrl);
> > +			return 0;
> > +		}
> > +
> > +		/*
> > +		 * CCR command or CCR operation failed on this path.
> > +		 * Try another path as long as we have time.
> > +		 */
> > +		dev_err(ictrl->device, "CCR failed using %s, ret = %d\n",
> > +			dev_name(sctrl->device), ret);
> > +		min_cntlid = sctrl->cntlid + 1;
> > +		nvme_put_ctrl_ccr(sctrl);
> > +		now = jiffies;
> > +	}
> > +
> > +	/* Fencing timed out call it done */
> > +	dev_info(ictrl->device, "fencing timeout\n");
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(nvme_fence_ctrl);
> > +
> >   bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
> >   		enum nvme_ctrl_state new_state)
> >   {
> > @@ -5205,6 +5356,7 @@ int nvme_init_ctrl(struct nvme_ctrl *ctrl, struct device *dev,
> >   
> >   	mutex_init(&ctrl->scan_lock);
> >   	INIT_LIST_HEAD(&ctrl->namespaces);
> > +	INIT_LIST_HEAD(&ctrl->ccr_list);
> >   	xa_init(&ctrl->cels);
> >   	ctrl->dev = dev;
> >   	ctrl->ops = ops;
> > diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
> > index e558a19781bd..90b989302e21 100644
> > --- a/drivers/nvme/host/nvme.h
> > +++ b/drivers/nvme/host/nvme.h
> > @@ -333,6 +333,13 @@ enum nvme_ctrl_flags {
> >   	NVME_CTRL_FROZEN		= 6,
> >   };
> >   
> > +struct nvme_ccr_entry {
> > +	struct list_head list;
> > +	struct completion complete;
> > +	struct nvme_ctrl *ictrl;
> > +	u8 ccrs;
> > +};
> > +
> >   struct nvme_ctrl {
> >   	bool comp_seen;
> >   	bool identified;
> > @@ -350,6 +357,7 @@ struct nvme_ctrl {
> >   	struct blk_mq_tag_set *tagset;
> >   	struct blk_mq_tag_set *admin_tagset;
> >   	struct list_head namespaces;
> > +	struct list_head ccr_list;
> >   	struct mutex namespaces_lock;
> >   	struct srcu_struct srcu;
> >   	struct device ctrl_device;
> > @@ -393,6 +401,7 @@ struct nvme_ctrl {
> >   	u16 sqsize;
> >   	u32 max_namespaces;
> >   	atomic_t abort_limit;
> > +	atomic_t ccr_used;
> >   	u8 ccrl;
> >   	u8 vwc;
> >   	u32 vs;
> > @@ -887,6 +896,7 @@ blk_status_t nvme_host_path_error(struct request *req);
> >   bool nvme_cancel_request(struct request *req, void *data);
> >   void nvme_cancel_tagset(struct nvme_ctrl *ctrl);
> >   void nvme_cancel_admin_tagset(struct nvme_ctrl *ctrl);
> > +unsigned long nvme_fence_ctrl(struct nvme_ctrl *ctrl);
> >   bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
> >   		enum nvme_ctrl_state new_state);
> >   int nvme_disable_ctrl(struct nvme_ctrl *ctrl, bool shutdown);
> 
> Otherwise looks good.
> 
> Cheers,
> 
> Hannes
> -- 
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
> HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
