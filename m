Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792544682;
	b=xLjbwJuol3W+mvfm/O4AZRg25V7junS3IxOj5nu9sPVRMp2XNBJr9TzMel74AMxxW+QO
	 y1th4pbUUrpyWa177WAUW6rnuvjjwJ2gnGt79HcV7yWDrOvdTZY6r7pklGG64uOWJkWLV
	 /fOPKOtamfo2JkkK3W+qggYAgO0CCE2Os5PN5zSIxs9j/0ex9Fl6+UZOkbezCU7+he1Hz
	 52zAinj1WmMLCCE0A2A37d3TUfKQe41qglbWmKZ9TFhKzIu1d9PuVk0cfYcQV6rIUs6q5
	 C4AOHDRvJR2GHk2nVMZzWktH9gA2vKOcnR+l3KjTrfz6CmG+gQ+g1j/32Z0BnZYW8Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/PJGvGsvZzfQUIwK+EXgT6f9qDwJ50a0sNaG7aFniiQ=;
	b=gzrZ5UQxNt2g4ubryV9Pyq2sO90clQXtRNt8zOJT5jzgaR7dIiu7fo62Dhfe8nrC18Ba
	 RDEkio39ALSCu1+AARpwDvQYTQUttaQGhuGwMvuDT7uaHxuPZdG6YGMjO1VzADzbPAOYB
	 NzT3k2OmiONeN3sXDtGM+62Z2/ee9OrNkyq5i3Jw3TrWLdR9r8edD/RNUwe56zkIHWWNT
	 EbywCInq2Xkds8RJk8WgDr0CdLYpTscwV9CtQcvdbkLg/cqyijkZV8Uek8vu7iPMww4Al
	 Cwb+hNTasXdehYUeYdkkN7lU4SUshQe3dBCiQala136sc3IC4GxwlJnPTg8vrMEKemQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=dzCVfkyF;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FD3606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:04:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97FD3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=dzCVfkyF
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35b2c599f43so322915eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792544681; x=1793149481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/PJGvGsvZzfQUIwK+EXgT6f9qDwJ50a0sNaG7aFniiQ=;
        b=dzCVfkyFIUkdmqBO9mFo8MWWi0izqgLmA+yywjdNUlRDDeBfjD7BT7Ke/TwBRWBWcu
         129uMeiEd9cXMVLuKOq3k+qoXd1etG1O2OwnZjJod6HRPJrWUR5lEk62m/gqZYkvMzPX
         WY5zovbmrpqrDohp4ytEMoRCY8n5ork1F5jOsiIJ623oI70Cggp6FdiiKeGVwwDUxsxK
         CVdr46rbp9cGAEJQ/JXTTyiDNTH97bd+oG8BB2Un4KdkSPdqFYFca8BX2d1qH4aGJBAh
         m7pMw9sdSm+bS7M9DE1cyaWFxyL0XoK1d6LyrC8LQ/tx0oGgsOjs7SkPmKRAlTodilfP
         ZK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792544681; x=1793149481;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PJGvGsvZzfQUIwK+EXgT6f9qDwJ50a0sNaG7aFniiQ=;
        b=PEKk+xos6PohrexW8aNMoTu2yd9lIILcIOIDiLo1g2KoZePJp4G81moN6cOldi0/2j
         KOQ1whqUn3JuLhxW6UUpm6/ckEGI4Ng46+QOM2b332k4OW3A+YyLw27zF583NZ1xXxft
         7B5k7e8bjx0cE3wceXtbaH/u2+x/laAGsS91iK5QyCeBePBAW8sxMZAuKbQdNRruBRPm
         a5H3sTCNYyHw9nmGckoMB7bz/3e6oZS5ZiiTGIrunuVfvxzQLzyl7udR18GkBMZ5qCdR
         J5+71BlRIAqsraDmKwwN0URzGfhfw86yHc8zdrVXB4sFb8ripF2qSI98M+GHQE/sBspu
         b06Q==
X-Forwarded-Encrypted: i=1; AKwUvBwkuYghtDcbP+KrM4J2+cFCWrT0gp67irD0BS4F3DkrP0vdSlTrYvniNjIdIKdMtN+5DdVCVpTd6CSPy24=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjOtxSslohzrDyiya2qOcQ5KwYekhzOnibMoByfdPFhgGglv0d
	zAMYWt1N4FVqgKYYxqp2XNlOlhP7MXGVLRB47n6Myv2MCvgRwgBzzS6a9e8Ehgn2LCY=
X-Gm-Gg: AYBFou3YkzOu/dwgx49A2+ppoIJEu6viBw1YT+Dun2jQjlAOuZexaJGKafb4zvMVc++
	qKnNgIoMmLZftobqDBGd7q1mgcnOR2Nfj8kLtANee9M+6zZIsUQEe9lIZvkEEUQo1szRneaoKv0
	Xn18HRFQP4GI8qXG0jMBjv67V+va59grXMMoNbfOeW77pN5xgsSXM4P0WEMr+HfusJ0wBSXAVZa
	1Ohovk+jMCpV7ZLuRS5XkaV7WaJfUuq37Ap/E79FPeO+4kOj1w7VQnXZbzbyqbdRVv5cniDvSbM
	xKTYRisCaf6gC1rq1+pOl58W8rR/mupK9qjfxoZzdOBT7aPJTD/hqOPfsAjbdXB9s1fzrpyBW2K
	/CmW87YyR1f1HKjNmORaxTXNfSWEuZB6JGiPd7HkQDzn7BISOnj1sSxfpZs47aK0cadqQa1jyQv
	s8Mks1o5hLDCpOi7dHLDdu28B3SNsiLc3YHnCRWVf5v951sKsSy7Nf+RR0ULKd9L6DzT9k9AP3z
	xAn0aTKLn4vMA8mZRPcyz08yPZMpC/cyIfglYyV9ga8Hf47qya9wBfJlniyDlgmvHJnhwiuV3NZ
X-Received: by 2002:a05:7300:e9c5:20b0:35d:f7f4:bc1c with SMTP id 5a478bee46e88-3674d84d341mr1307105eec.6.1792544680127;
        Tue, 20 Oct 2026 18:04:40 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3674198fb21sm2176572eec.23.2026.10.20.18.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:04:39 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:04:38 -0700
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
Subject: Re: [PATCH v6 09/18] nvme: Implement cross-controller reset
 completion
Message-ID: <20261021010438.GR2931-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-10-mkhalfella@purestorage.com>
 <207f5a00-7fee-4ea5-b541-38424d4766bd@flourine.local>
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
In-Reply-To: <207f5a00-7fee-4ea5-b541-38424d4766bd@flourine.local>

On Tue 2026-10-20 11:18:04 +0200, Daniel Wagner wrote:
> On Sun, Sep 20, 2026 at 11:28:07AM -0700, Mohamed Khalfella wrote:
> >  static void nvme_fw_act_work(struct work_struct *work)
> >  {
> >  	struct nvme_ctrl *ctrl = container_of(work,
> > @@ -5099,6 +5142,9 @@ static bool nvme_handle_aen_notice(struct nvme_ctrl *ctrl, u32 result)
> >  	case NVME_AER_NOTICE_DISC_CHANGED:
> >  		ctrl->aen_result = result;
> >  		break;
> > +	case NVME_AER_NOTICE_CCR_COMPLETED:
> > +		queue_work(nvme_wq, &ctrl->ccr_work);
> 
> What happens to the waiters on sctrl->ccr_list when the source
> controller enters error recovery while a CCR is pending?

You already answered it below :)

> 
> As far as I can tell, ccr_work itself is fine. The reset path cancels
> it via nvme_stop_ctrl(), and in the error recovery path the Get Log
> Page just fails once the admin queue is torn down. But the target drops
> all CCRs issued by the old association when it frees the controller,
> so the CCR completed AEN for them will never arrive. Nothing on the
> host side walks ccr_list when the controller leaves LIVE, so
> nvme_issue_wait_ccr() sleeps until min(kato, deadline - now) runs out
> before nvme_fence_ctrl() tries the next source controller. In the
> worst case that eats the whole fencing window.

If the remaining of the fencing window (deadline - now) is less than
kato then I am fine with this scenario wasting this time anyway. If we
hit the deadline then we consider fencing done anyway. If it consumes
kato from the deadline then we retry another path.

> 
> Would it make sense to fail all pending entries (set ccrs to a failure
> status and complete them under ctrl->lock) when the source controller
> goes into error recovery, so the fencing code can move on to another
> path right away?

Failing pending CCR entries that we know we are not going to complete
will help in this case. The question is where to do that. A LIVE
controller might hit an error and transition to FENCING, or manually 
reset and move to RESETTING, or deleted and go to DELETING. Do we need
to consider all these places to fail the pending CCRs?


You might have also noticed that nvme_issue_wait_ccr() calling
__nvme_submit_sync_cmd() might consume the entire fencing window if the
CCR command gets held because the source controller hits an error. This
is another area be optimized. I am inclined to leave the code as it is
today. What is being described here is an optimization that can come
later on.
