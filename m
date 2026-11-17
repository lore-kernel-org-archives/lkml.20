Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873834;
	b=qYWmPYfQxfE4f5fGS07crSyTn1+5U1H5NE3y6H1KqpPmHPV93/NAb7mSXCwXyg6BH7Nt
	 kEIvYx2tWWyLbNz+zPqL5NXdF/i8us2Q7gcbwqt45KfPmsAuFQZxSsH9LtVs8/InuLD/x
	 1ASpIP7t+XejOVpSzwwUjnSe8s5VhSVgZK+7VVOV9C/n+NtH0dntmsb7Nxygj/BS8yM7l
	 ii8293Xyu9768yobDJiEvcNoVHWimSl+OwjNUyU6gZqwfe7jcUZ8NE2if8ePZs190t0Se
	 mIOWI6RO/YozX3xo8DC3DRChg98iCAY4e5Qgobk+GkoYQ97NOjh+o1L8DGMQXQWHEjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SvJ49BQDsT4BUOiui0pHG00KCPFsMBlGlawc8+RP7J4=;
	b=NXQxAbJpnDFA7QLTg7b+Vw5o7exoKwugbS4tIYA9J+nMst6H2XhtepxAzGAMj10o6SRa
	 UK22EGo+Lp2tIeMpMwTdzPrq287xoNeBvhhoRLUCOtfOXveKFDL/cLZc9A6NhdxUgDtkr
	 AnW9RtCwzEA6scdxvDn3CZczmWO22/EQIHGN2L+zjWOOwmeZU5LlhpAUTScG5xVVENiUQ
	 Vh+ESR2/xPE+VqkjDsofazOuKV5Dsj2IHFc06Pie7UOuxhdrPJJwYBK8LA7p9DpRSHSjl
	 vdevRCkLkylugc5IRV1+cFE5c3bh4NneUoc7QYbrGnr3QFmJc1VgQJXc78tmCIHpRzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=DHd2Jjnq;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A52606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00A52606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=DHd2Jjnq
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so11217568eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1794873833; x=1795478633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SvJ49BQDsT4BUOiui0pHG00KCPFsMBlGlawc8+RP7J4=;
        b=DHd2JjnqXApBpJzo0ZveQjqnxo3+KhrdRZ7s7mb+OJblNYf2HS+HRlTwdy5gmoylGO
         d1W13tUjVMfHUWSdUIu0O/xifTorRMlIFeq3DOOIqEJn/laXkgXOaS9SMbCG8OgOPnCV
         PShQjufniQZbbUAWaEYhMtU7FiZf10PeJutOIqg2PfNn9+nyH69JvpNw2e4b2yaOvBuw
         /1XZLSBKvuMjUlsQt0dXAf1xM9tQcc5LpoFiRDKEa8+Q1blu8a3o1wDwMMkCQS+x2ej7
         UtsN5ECHTxpQUKOZ5kXTrM+X1in+OR4QKEGXZXaKVKmLH4AsIxCW1Bjv59AK1GwChzQ3
         SocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873833; x=1795478633;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvJ49BQDsT4BUOiui0pHG00KCPFsMBlGlawc8+RP7J4=;
        b=DzP1QTkl0b4JWImHz/NslJWnS/FZyB8ILFd3a/fNP31dqWDGh80P53YtnPxYTdoNi8
         8QC3Y16s8D7iJqUk/eytZxdsDAjgj+VTUtnVWlHf+3vzPAVFsj9VeayNsWkPVcvkY14y
         cNYyIbpBU1F+9j3COSqpZRIlKD1sF4mZR20npeDyEc/A83yseg89x3bQdtF08os45UOv
         iLfM4Ip2qLU8Jh3uLLIV98WkIVoUeXXTNt96u4JCMKbhXgSlyRk+M9UEmPbCa/PG626A
         vUk/q1/8VV0+zIHM3rPLk4JeApPZSAbeKwBXOVIz2dM6caLJUkqO1lHVu9V/hVIeUS/O
         uBNQ==
X-Forwarded-Encrypted: i=1; AL+hErH9SFm+3zyyyuoJ+nE+5PiIhWOB8OZKd4IB9ObvKryFeC5x6ZdP/PQqUbHBTP/0rHtoOv3NU7hayLyr158=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aAUF/tJbJvfZqdCXquqvusB2XviBgpwZbBaUZIykaP+RpnRzi
	e9kf+HvNgIY4JqHduhmdOt+0l7f14+lZUN5tL5v5ZHRLE7w2sUN7IVPUoMhnDBToTPE=
X-Gm-Gg: AZFdTZdSxqppm23h+P6NfD/aBDQ/L9n5KlvzAjj/rOEKXqiI98YwuCdqDoXZS6WJIJO
	reCarvDDrIWb/PtN5LGPD48elnKGtyiXxN5Nmox/NwR0+9W9z9iqQRQskn/3y0iTKy+dGcCWSEx
	tXwC5fSvlL1fnNa8RSxoqc1mPUfgfsJOyMOfvl9dorzcHuR7RzJybgFjapkAn8YugPLgDN4ni6h
	Ae8o7x8Y9gL1fNAKfpFRZI1yZnQR8fly1Nm3FDdivqZHBGqAymUwCaKP7gBAuGn4HVXxCBK6TVE
	ISlLWev5/K9wrJzYUPFKK817hat7v0UpUYkC6mA0v3KDrDfRFsTqNNQ1/2DTsrw11NJtQnBJYhp
	MAWHNfiAKAN5GUbMLqoNeGrRtsak0UDgqXNpjZANyNaVYMe5YDCSy2wGuQzKgXAosR5jHVE5yU8
	F61mdvw3ogHJMphIklvvGH42GrAkfqJ97lRZJOk0YtHrFmN/5y1AKZmIXyLS9k6CvBCVeg6krfg
	6vQC0ru2km+okOZMpMLFUzSnbFokqNuruagvCxlWmirD0XpRUO0Yt7/KCvp5l2h6W+Y9oxasyjN
	AmVHnQpqR8JjMnVrt7xjnNB9KkOv/Q+snSyUA6kF94Z53ocWzw==
X-Received: by 2002:a05:693c:414c:10b0:369:9062:c392 with SMTP id 5a478bee46e88-379680cf511mr13649785eec.37.1794873832487;
        Mon, 16 Nov 2026 16:03:52 -0800 (PST)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm68688756eec.21.2026.11.16.16.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:03:51 -0800 (PST)
Date: Mon, 16 Nov 2026 16:03:48 -0800
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Dmitry Bogdanov <d.bogdanov@yadro.com>
Cc: Mohamed Khalfella <linux-nvme-bounces@lists.infradead.org>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	Daniel Wagner <dwagner@suse.de>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v7 03/17] nvmet: Implement CCR nvme command
Message-ID: <20261117000348.GD1670230-mkhalfella@purestorage.com>
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
 <20261114030454.2836543-4-mkhalfella@purestorage.com>
 <20261116084540.GA3655@yadro.com>
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
In-Reply-To: <20261116084540.GA3655@yadro.com>

On Mon 2026-11-16 11:45:40 +0300, Dmitry Bogdanov wrote:
> On Fri, Nov 13, 2026 at 07:04:17PM -0800, Mohamed Khalfella wrote:
> > 
> > Defined by TP8028 Rapid Path Failure Recovery, CCR (Cross-Controller
> > Reset) command is an nvme command issued to source controller by
> > initiator to reset impacted controller. Implement CCR command for linux
> > nvme target.
> > 
> > Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
> > ---
> >  drivers/nvme/target/admin-cmd.c | 76 ++++++++++++++++++++++++++++++
> >  drivers/nvme/target/core.c      | 83 +++++++++++++++++++++++++++++++++
> >  drivers/nvme/target/nvmet.h     | 13 ++++++
> >  include/linux/nvme.h            | 23 +++++++++
> >  4 files changed, 195 insertions(+)
> > 
> > diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
> > index 5710ae53eb83..3df9db454db9 100644
> > --- a/drivers/nvme/target/admin-cmd.c
> > +++ b/drivers/nvme/target/admin-cmd.c
> > @@ -378,6 +378,7 @@ static void nvmet_get_cmd_effects_admin(struct nvmet_ctrl *ctrl,
> >         log->acs[nvme_admin_get_features] =
> >         log->acs[nvme_admin_async_event] =
> >         log->acs[nvme_admin_keep_alive] =
> > +       log->acs[nvme_admin_cross_ctrl_reset] =
> >                 cpu_to_le32(NVME_CMD_EFFECTS_CSUPP);
> >  }
> > 
> > @@ -1629,6 +1630,78 @@ void nvmet_execute_keep_alive(struct nvmet_req *req)
> >         nvmet_req_complete(req, status);
> >  }
> > 
> > +void nvmet_execute_cross_ctrl_reset(struct nvmet_req *req)
> > +{
> > +       struct nvmet_ctrl *ictrl, *sctrl = req->sq->ctrl;
> > +       struct nvme_command *cmd = req->cmd;
> > +       struct nvmet_ccr *ccr, *new_ccr;
> > +       int ccr_active, ccr_total;
> > +       u16 cntlid, status = NVME_SC_SUCCESS;
> > +
> > +       if (!nvmet_check_transfer_len(req, 0))
> > +               return;
> > +
> > +       cntlid = le16_to_cpu(cmd->ccr.icid);
> > +       if (sctrl->cntlid == cntlid) {
> > +               req->error_loc =
> > +                       offsetof(struct nvme_cross_ctrl_reset_cmd, icid);
> > +               status = NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
> > +               goto out;
> > +       }
> 
> cntlid has to be validated against the configured range of the controller
> ids (subsys->cntlid_min <= cntlid <= subsys->cntlid_max).
> That will allow CCR to work correctly on a distributed target.
> 

Thanks for the review. nvmet_ctrl_find_get_ccr() below will verify
ictrl->dntlid == cntlid before proceeding with the reset. Is this not
enough?

Adding this check here means if either cntlid_min or cntlid_max change
after ictrl has been created, CCR will fail saying the controller was not
found. Why do we want to CCR to fail in this case when ictrl might
actually be there?

> > +
> > +       /* Find and get impacted controller */
> > +       ictrl = nvmet_ctrl_find_get_ccr(sctrl->subsys, sctrl->hostnqn,
> > +                                       cmd->ccr.ciu, cntlid,
> > +                                       le64_to_cpu(cmd->ccr.cirn));
> > +       if (!ictrl) {
> > +               /* Immediate Reset Successful */
> > +               nvmet_set_result(req, 1);
> > +               status = NVME_SC_SUCCESS;
> > +               goto out;
> > +       }
> > +
