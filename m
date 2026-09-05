Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269413955EC
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 02:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788574193; cv=none; b=PmvzAF8pOBQtDL4LUZrQTTMdsvRwpKcL7k7m0XPqYjeZemXD78CBCDO7flfPT3nyn8rY5NVRyq5X9mEDgsGep0FRlFcNC4rxXn+EqC6nBUk5W9pQZkpLQVItwP63YUYM+f9JB6kjLEvegCh6C9LaCYznvwpXzYyjCIDuiWhw0l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788574193; c=relaxed/simple;
	bh=ScWnSFQRNKN2e45qGGP3FFWHx2nYsVgIkw6iY7a5bP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DIJaHDicFA8XTV8KeRZFodMUxYGMGy0AQzfguz5cjsG5zKxAf8xaLEKVFTN0JGl7r9FRf7v1E0uKFjte6cUyaG7yY5C70HF6IJ557dlqy2m1d7PclbsgpIz3jow/+slWgEsSx2H/dul+Cn8+m6PqkwQXqhJKRVMzSJt+gPeIAj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=IxZ1fjZb; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="IxZ1fjZb"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d72ae08fa1so15806505ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 19:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1788574190; x=1789178990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zfGbJGceSpzokCooR7HP1FJE6PB+5/BbBJX/nX2Rzu4=;
        b=IxZ1fjZbijZKFz5LXFkNfWSzqnBiGc/fROBWKhZ8ztVxWc5Q6whra1zjEllXuY1uhO
         I3Ozr0IHeZK1hKUsDcoGRo+0b1Y9V5JDNrD668D9biBJgdiA0Na863GZP/m0nGxmcpkD
         aaSfL8+uHxE5mZHUytszeDwOW836XwPK1GpaQA7RUG5+xXYzWX8CHGE5aA8qgfKJrM8n
         ZbAvA+lWngDfcbBkFLE92VzrtYkuhzRGcJ9vH2OpqOu+Ph+Gh8xB6FYp6bZPhKWTJmyZ
         HX7dDrWCKc13ydqdFRp6Y2bc2zg5HJ2CiZzKGER3xQJd/EANYz8Fr/S5AzBZ5O9VxBTb
         FAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788574190; x=1789178990;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zfGbJGceSpzokCooR7HP1FJE6PB+5/BbBJX/nX2Rzu4=;
        b=okGDixs54xiaqhNCWbGoOlwQQcDZwz9v0wuyoolHYPYM8Oktr2j6RIYFlBPOVo7g38
         XfCqUQ/DFtc1GbRZa3Mq2+inVjyMHOHnnF/uatooDsqk7FLxgVPcP3GExi7lwyzkCR6Y
         PGZOEVYNUroBuJptQrNJE0JmPS3iRBqODzHN9HeioVRvif7bs4BBpKSf7pdB1uu5OVaf
         JBIRVyeRSc36tj2VclV1M3MGYFsIB9CqBxCsZEtx7bYhiMQ1ZQ3Bc/cmyhCkJdNrxSl5
         KBGWAlVzPq+cDl/dlhxt2gkkugwfn/EZ+JVkM9O1+OglBuD6uFGBUZ6cFs58yCMB5PfA
         ZMNg==
X-Forwarded-Encrypted: i=1; AKwUvBxb9iw+PMZyJQ28lB1hfATVMku3LiT5PTTmetUup1Xq/BlgAQ2KZRfjQHvUdVqFulFGxleng+IPR7iIr/A=@vger.kernel.org
X-Gm-Message-State: AFuF++l0sld7d/Lq2Sbm9XAtqmRkMEmbnyt51bMiOXvn8s3kHrO70nCj
	gDkBPHy6KsCgx8D/d/0Cuy/JRfSxC3i+hAKzghsjAsTlPsiq69cyky1InYNxSIC7lKc=
X-Gm-Gg: AYBFou2+JT/wdfSe6SmATv2/xZhW1/wLhEoTTEJa5iYDQt7o9SpG8adMD7B9H+Oy4rf
	3lHnYedx/UIm3flEo/IlUjsSgrR0VMPClAKqn3e+BP1J59+2HZjj1jeTZ9vSHBvFI6xCAUXAcOS
	ZbrfWVWQfBwo21wlxsa59M3yNE2I525h7FSneiyWXy4t68hGJK7o5LYRhayIZOE3MuvS0UgxSoU
	T8KIqEKFqKRrqyP1dlfQF4zsShpiz3jSL8/LvRyyYOkOdiG0YPeKwM2S1ujbhluo+ntWZ9xnKZi
	O4I8hEo6f8NxRK21kGW7HebK1FHt3ViWpuW0Eme78uaB7vz2XcwPx+fNs8KW5d26104qqsq4iId
	iKbmuaNx9asPHNAMJKdLPhWSiFwmI1QZiDCx5uOHjvRAvrJc8m+17RyZv+7OTfnP6vNL2BitTYt
	ELQyCL2lqIAOoslJ0kUOoRBtjImxHjtewpiLXV+6egMf+VHclqMXLhMhwzl78BEaz4ExQ=
X-Received: by 2002:a17:903:903:b0:2da:e967:794e with SMTP id d9443c01a7336-2db12657cacmr167916525ad.19.1788574190310;
        Fri, 04 Sep 2026 19:09:50 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([2607:fb90:9c20:7a99::791d])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm6351100eec.4.2026.09.04.19.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 19:09:49 -0700 (PDT)
Date: Fri, 4 Sep 2026 19:09:47 -0700
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
Message-ID: <20260905020947.GG5552-mkhalfella@purestorage.com>
References: <20260712022437.3743117-1-mkhalfella@purestorage.com>
 <20260712022437.3743117-11-mkhalfella@purestorage.com>
 <3bc07e43-750d-4e8d-a209-e1d45acbb230@grimberg.me>
 <20260904225236.GB5552-mkhalfella@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904225236.GB5552-mkhalfella@purestorage.com>

On Fri 2026-09-04 15:52:39 -0700, Mohamed Khalfella wrote:
> On Sun 2026-08-23 04:03:18 +0300, Sagi Grimberg wrote:
> > 
> > 
> > On 12/07/2026 5:23, Mohamed Khalfella wrote:
> > > An alive nvme controller that hits an error now will move to FENCING
> > > state instead of RESETTING state. ctrl->fencing_work attempts CCR to
> > > terminate inflight IOs. Regardless of the success or failure of CCR
> > > operation the controller is transitioned to RESETTING state to continue
> > > error recovery process.
> > >
> > > Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> > > ---
> > >   drivers/nvme/host/tcp.c | 30 +++++++++++++++++++++++++++++-
> > >   1 file changed, 29 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> > > index ba5c7b3e2a7c..a1711dd1d3c2 100644
> > > --- a/drivers/nvme/host/tcp.c
> > > +++ b/drivers/nvme/host/tcp.c
> > > @@ -161,6 +161,7 @@ struct nvme_tcp_ctrl {
> > >   	struct sockaddr_storage src_addr;
> > >   	struct nvme_ctrl	ctrl;
> > >   
> > > +	struct work_struct	fencing_work;
> > >   	struct work_struct	err_work;
> > >   	struct delayed_work	connect_work;
> > >   	struct nvme_tcp_request async_req;
> > > @@ -605,6 +606,12 @@ static void nvme_tcp_init_recv_ctx(struct nvme_tcp_queue *queue)
> > >   
> > >   static void nvme_tcp_error_recovery(struct nvme_ctrl *ctrl)
> > >   {
> > > +	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCING)) {
> > > +		dev_warn(ctrl->device, "starting controller fencing\n");
> > > +		queue_work(nvme_wq, &to_tcp_ctrl(ctrl)->fencing_work);
> > > +		return;
> > > +	}
> > > +
> > >   	if (!nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
> > >   		return;
> > >   
> > > @@ -2494,12 +2501,29 @@ static void nvme_tcp_reconnect_ctrl_work(struct work_struct *work)
> > >   	nvme_tcp_reconnect_or_remove(ctrl, ret);
> > >   }
> > >   
> > > +static void nvme_tcp_fencing_work(struct work_struct *work)
> > > +{
> > > +	struct nvme_tcp_ctrl *tcp_ctrl = container_of(work,
> > > +			struct nvme_tcp_ctrl, fencing_work);
> > > +	struct nvme_ctrl *ctrl = &tcp_ctrl->ctrl;
> > > +	unsigned long rem;
> > > +
> > > +	rem = nvme_fence_ctrl(ctrl);
> > > +	if (rem)
> > > +		dev_info(ctrl->device, "CCR failed, starting error recovery\n");
> > > +
> > > +	nvme_change_ctrl_state(ctrl, NVME_CTRL_FENCED);
> > > +	if (nvme_change_ctrl_state(ctrl, NVME_CTRL_RESETTING))
> > > +		queue_work(nvme_reset_wq, &tcp_ctrl->err_work);
> > > +}
> > > +
> > >   static void nvme_tcp_error_recovery_work(struct work_struct *work)
> > >   {
> > >   	struct nvme_tcp_ctrl *tcp_ctrl = container_of(work,
> > >   				struct nvme_tcp_ctrl, err_work);
> > >   	struct nvme_ctrl *ctrl = &tcp_ctrl->ctrl;
> > >   
> > > +	flush_work(&to_tcp_ctrl(ctrl)->fencing_work);
> > 
> > Agree we shouldn't be here with fencing work running.
> 
> Right, nvme_tcp_fencing_work() above queus tcp_ctrl->err_work. This
> flush makes aure that fencing is 100% done before we proceed with
> resetting.
> 
> > 
> > >   	if (nvme_tcp_key_revoke_needed(ctrl))
> > >   		nvme_auth_revoke_tls_key(ctrl);
> > >   	nvme_stop_keep_alive(ctrl);
> > > @@ -2542,6 +2566,7 @@ static void nvme_reset_ctrl_work(struct work_struct *work)
> > >   		container_of(work, struct nvme_ctrl, reset_work);
> > >   	int ret;
> > >   
> > > +	flush_work(&to_tcp_ctrl(ctrl)->fencing_work);
> > 
> > Isn't it being called in nvme_stop_ctrl? - perhaps it should be called 
> > in ->stop_ctrl() callback.
> > 
> > Other than that, this looks reasonable to me.
> 
> This flush_work() is needed in case nvme_tcp_fencing_work() loses the
> race of transitioning the controller from FENCED to RESETTING. The
> moment we move to FENCED anything can reset the controller. For example,
> userspace can do that. If we lose the race then tcp_ctrl->err_work will
> not be queued. That means reset work needs to flush fencing_work.

Now I am thinking about it again, what you suggested makes more sense
for both fencing and fenced work. Both should be flushed ->stop_ctrl().
I will do that.
