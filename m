Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D1E392820
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788562362; cv=none; b=fvG5SJdkTr6KQ2ZwX8Y5ENXZTJVatUUp7zHvi6GeKL1+xe2rKzEKJjD3XVGcec0AG/FQiZm8+BBL3iP3OaKWUQjcJPcQ5L1r/r6wmF3d1PILe6daV3CTVZ6+FT0fqaXC+h1QUb3xJ9mumVDSXs0PveVoTWF7rGKwDPuvx0G2nfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788562362; c=relaxed/simple;
	bh=F9YyMrK/ieXXHAG3Dn29zLg5oec8wSTghFcQMhOJVD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJLlIhYm0z4BDpU+9+NlUyWRZJW6IGE1QX9dkJvZ6+AXCD/HRKSSBo/RMq2VpDKH7u9ua/7ynPZX3fEu1FWCSZZ/cCwFPiR+KBvaTOQdDojN5LnX/14crgy2dmxrUXwV6OtD+ZHdhF+Kv/UKegyb6UsyS5eMDSkyX0ZQJ3vivus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=T4wGSfX9; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="T4wGSfX9"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so1086540a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788562359; x=1789167159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9yzepECPMNjg/OdUAVeUwMwVkBXuiCtJbev3HxuW5js=;
        b=T4wGSfX9xjsb7/Jq32zf65BfNMh1nyWPegavGT+iN2FAGdKwIK/xIOK/s2dgxql/lh
         mfxCeSK4+pFU1vgi5pvMrxMWDH/4EI2EkUw4Sp+Rwph0uLQms9XPEiPyF5C11DEHrb+h
         z/sdUARWbXKIXrl/CqmLjor4XlWnYX2wij6Lc9V0kDDD256Er0bl2ev4RD/ZEDddaoq/
         XEczSVQG/fRZRgbe4lrjTuAs7dsAHFyLGwF0VECm2k367qQdOK+PEZy9n+3sCDkMDoyT
         KKBkRsiJiCfEkhgtzMvIbA/sQWKnvr9iBHGaPPEq2UPwg8bgGxEJhSuhSALp9D2mfTn3
         /foQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788562359; x=1789167159;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9yzepECPMNjg/OdUAVeUwMwVkBXuiCtJbev3HxuW5js=;
        b=isD2QYWCmx7zDO6ZP/CimW0w9XTReEt7k9lJ5aFwVkEOVeAD5mfo0C38xiBU7zC2qd
         fXDYdZQrwkGdEO/7kfL0BY8AE+oy3IdPULxvQy3OsCM5WDNNKJ8qCWPHuxLqtFRR1SMj
         emDesUQa1CKsvE2y/+FFhKqR+5pKonlz/dKlw1nud7VUni0R4IyFWu4DO2Z7CVaHLFkA
         BCucSLKHXG9pK9J8gWLKL7bIf5YqCYuTTzkl1xETzbhEhm5M258cu0eE13ZJ5L4MpDNh
         vV8PQT9z0dkuEVzxgGZ91+HhnMGb32o8ys8ADVVJhiE49xyBkET7Yfwja8HDm+gATGEj
         5qGg==
X-Forwarded-Encrypted: i=1; AKwUvBziRmYgSR0WZcozcPLz2xyHqGHA063ls8/ZnOaTB8kLuNpT0sKSWAuPXKHwgrmlc6M7dros932hnV7S/Gg=@vger.kernel.org
X-Gm-Message-State: AFuF++kEDq4DAsnPnTKkpXQ10jyK0+wqefOMX8cWH+1U53riLTHiO/kr
	PRvYKfmtwwqH6Skd7gLZVuxc1GB4iY2enpme7Yre1T1VI8pvjf6RqhWSvCGKOjtE1Do=
X-Gm-Gg: AYBFou2fQzvwogvU3LPZ3M1JeTbYO7QB6m5Z+xcDvh+3Sxf8AmpWyf9KC7vMl9rSJrU
	mzWLzFmnSB004iReUMuOzY/G+uRyHzBwmR0h1LX7M+b6DwFeDHqMsf+pFUIB+lClh3vwZr2bMjV
	u0vNeMF3z8snq3+m/swFYdvNIk4y+bneT0Q6RsY8Y5EYTKdnBqhdqrPFDPvlXhPIV/9fHZAeBju
	TWG6cnOVLYS9JX/8GXkeix4/Wz5zYZyINDI4tST9m1dnkz/fFkA/RUEoJv2AJEVONgtS1+Ur0nd
	dTpYt/L/l7q/dHR5gLl6jnCkP/CGYr7ABhiieU0cW35+4rUegGZrZtAFGiQi6lhG92O7UoIXK5L
	w5A2MYyBQ1DWyATD763hXaYNFhcpk0VsQXCXIedOm2VfH86FGCAjSWMx4v0wMizYSgKD/Y+9iIk
	HY+LiQSYzN8TIzL+mONGr3ZimQVaGsBDKR0GPIt6N6E6Cm2JJQBgltw0442eWvPHsHnf8=
X-Received: by 2002:a05:6a20:7f8c:b0:3bf:6d96:ac40 with SMTP id adf61e73a8af0-3da39e44fdemr12661784637.12.1788562358777;
        Fri, 04 Sep 2026 15:52:38 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([2607:fb90:9c20:7a99::791d])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm14641633eec.15.2026.09.04.15.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:52:38 -0700 (PDT)
Date: Fri, 4 Sep 2026 15:52:36 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>,
	James Smart <jsmart833426@gmail.com>,
	Hannes Reinecke <hare@suse.de>,
	Randy Jennings <randyj@purestorage.com>,
	Dhaval Giani <dgiani@purestorage.com>,
	Aaron Dailey <adailey@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 10/16] nvme-tcp: Use CCR to recover controller that
 hits an error
Message-ID: <20260904225236.GB5552-mkhalfella@purestorage.com>
References: <20260712022437.3743117-1-mkhalfella@purestorage.com>
 <20260712022437.3743117-11-mkhalfella@purestorage.com>
 <3bc07e43-750d-4e8d-a209-e1d45acbb230@grimberg.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bc07e43-750d-4e8d-a209-e1d45acbb230@grimberg.me>

On Sun 2026-08-23 04:03:18 +0300, Sagi Grimberg wrote:
> 
> 
> On 12/07/2026 5:23, Mohamed Khalfella wrote:
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
> Agree we shouldn't be here with fencing work running.

Right, nvme_tcp_fencing_work() above queus tcp_ctrl->err_work. This
flush makes aure that fencing is 100% done before we proceed with
resetting.

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
> Isn't it being called in nvme_stop_ctrl? - perhaps it should be called 
> in ->stop_ctrl() callback.
> 
> Other than that, this looks reasonable to me.

This flush_work() is needed in case nvme_tcp_fencing_work() loses the
race of transitioning the controller from FENCED to RESETTING. The
moment we move to FENCED anything can reset the controller. For example,
userspace can do that. If we lose the race then tcp_ctrl->err_work will
not be queued. That means reset work needs to flush fencing_work.
