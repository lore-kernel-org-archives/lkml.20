Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731512;
	b=iSSFUg0VFPSWMdzU3QtQSTfBGisZ16nBo3yeZps1mzgqZLyav68jPio42q0Tn5a8CRD1
	 rPK5DfQxUb9wjHbOKL7ZxlTpcEHFu7Pxk+b6qHHjFftTJ2YYO6986lB4HozU1U0aM+GnF
	 nlIdG5CJAsOz6waBexv//khrgyFAdEC320oxyrDmCurs8GwG0AKiJ2FTeH87fNM37wgN3
	 jj4z6QIslBgfcYCqb0O/GmX0AjH7yWRZpqxvCRAlYSoSVTlIuJvL5ydwGYQnqT+ykjFUy
	 48briLuiZnlrWnLtI7i1NQw+TGPEzSNdCVODN60eTmly00MaZXfeXJi8tmLHXndKNUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0CbKdMAQ3nfycPreHgu2fI9LHIGPNt84yRSgRWibZ00=;
	b=PwVftG/v+nT+cZJwSCbUnrHLQmjLbUCVXvEtYagl5hu4N2hA1YMwxFtqGFB/Q8+MPl6l
	 2RtUCaAc5/7NTxRIt2SLQFWWCDz0XQwdn6iA17kHEwM0W1BiW0vYm1pvnz1vNEonGDIWX
	 +aG3WimICfiqRPKOlUzBLd4+xFipS3EGvAqayTQgPwE6R0NzLaFrrH7RRwTtjVqIFiTZp
	 J2Vrh9yKewyEUAbGNLXWcCGoTrIuoyRFlYe+eAcss4MTW1gr2V5VZckzAHeFGX4gOxGn0
	 B3W5l1IFJY4zO2ELtzzT7OtznWBttmgJe1DgBPXsJrx9N5zcty2Jm9NAc2cJwJS4mFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=KjZNCeeq;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E114C606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E114C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=KjZNCeeq
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15943c9c005so3983341c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793731511; x=1794336311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0CbKdMAQ3nfycPreHgu2fI9LHIGPNt84yRSgRWibZ00=;
        b=KjZNCeeqDju0LEV1HL4/KW13BYXmu4bjkH+mcaUpCucUt70BL1bBF1rOUyIWp7KI1v
         g7S27R+w1pcAtAl39DH963UdxDnwGRuP1Nu9svNJzLYq9KmTMkUKtJg9x5w+jH8RSDY/
         QK+GWoPndJnFcBudEIBTPettiqaTNmR6/2V1AnX4/xVdsmOtug3meXuLMs+gNnSmQuPe
         F3uhjLDodHbrRwXceO/vhE21pgr2F71EVHJuyTYCnJghFRVOsFWr5ZDgYqcz2hPxcTYw
         kvSLCL+Ae56cMp2am+a0spTkhUmYPJ1RGuDBPRm5+Ot8gA5sMPSHnhMpvEWQbWvDPAOv
         mCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731511; x=1794336311;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0CbKdMAQ3nfycPreHgu2fI9LHIGPNt84yRSgRWibZ00=;
        b=C1RNpTfB+m0whl2qIOG0cgxymcqmJT2OkByBlL0Xmt9mhsYDJy2l+lb8XeXAdtUlOa
         /M5/t0Lzqlmpmje+L6QkNVnE5vW/2lcnBq6iPxKQYa4T+3lXvTiyVW3caGskATd+UnTW
         1u0IRlXzU/qCNJ+L2MGeZAytFYuYS/IKQlsSlI/Eamt5/dGccnAwk/1mnimbgcl5DkSP
         AQkN1bUwMj3NeYNQgmYFAymB6mfHvm1ET7iyzjakmCk0VbjFvGHUL/a/J6WCBDW+Vkkr
         beMfNPFp40zozqSMrLp+PO7B8l6ZUSYvyICkL23MhY6V1d6HDtZawmH24BfWuZ4HMQ+F
         YPvw==
X-Forwarded-Encrypted: i=1; AKwUvBwtj95D9AjCkosVDSx9X1BZvwUFTQhX+7zwZy01HzJeWdCBukVeo16u/i1Kq8rDVOT+jWM+OHg7Ng2I76w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HY1idbS4T1P68owq4jJXXHQltyQ04m29O0/5mr6tLw3667Pkt
	ECwKt4tctkfw/443XhVMlNsSMpgM3os/mwXlzjfC+j0jag4gvtkBAgGsSYMEc4GDi8A=
X-Gm-Gg: AYBFou2NnNmOWajuyJntifa+wNADKX2O87lHHgu29EbImLcZ8KonLmGamk/DrPbHAvn
	eAh0P5KMo2VX4YxipJaFhd1ZImbuNVcR/hJnLX7++3hGY5GrnKKcgHhuuNDxpZDHWGNwEDtwxT/
	aNMBQ7Hd+E6zx7Rx7nV/KVcDiJtaspAXNFSxOO4zYqHiIf5cu1bQQ8a7i8UbcVd1iVy6jGfXLB6
	9jN2YhXYemX81I4KD/SjDkiFRsh7oRiGFZKb6XrrzF2AtfA0hvVarClHXIT9dMyvuxAUkWCupZ3
	ef4h5XNBR8S2PDr7aTlzn0zblc62fXcfcsxqh7wo7g28geVjb+MSrSp5qCljd5aP2vvtRkuxT1S
	qUHe8gzhdvOkUUgGqm57rDvYCJzHSOPabq7tKeOEwzO++zJw5EKl9ZmhdDXuj0mXeyNqQmG0YOp
	NMXebZ0G1vCqWMzAbPA/fyjqxtAacFo2cLQ6/wQatSyvfhjeVQR8Dz9xR1mFXsQF4kYtwaUBvZz
	o5tX5D+Yqs9ua2d6Sn9Kt3VvfuzDj3Ssd0Jyq7SfcHiXYJq+bRr9ycT5odId8565ExynYAgaHt7
	jStrSs4+QUyKnbfTZBvpNaJ3EY/IpXRUyQclRaGaHNP6OV6E
X-Received: by 2002:a05:7022:e807:b0:1b2:4188:840b with SMTP id a92af1059eb24-1b2418884a4mr3350184c88.25.1793731510547;
        Tue, 03 Nov 2026 10:45:10 -0800 (PST)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm748585c88.22.2026.11.03.10.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:45:09 -0800 (PST)
Date: Tue, 3 Nov 2026 10:45:07 -0800
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
Message-ID: <20261103184507.GA5019-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-16-mkhalfella@purestorage.com>
 <d9563967-9ddb-4cd7-9149-d1f37522e1fa@flourine.local>
 <20261021212357.GZ2931-mkhalfella@purestorage.com>
 <45d52d19-dbfc-49b9-a445-a8fb9e69abef@flourine.local>
 <20261103011851.GK122209-mkhalfella@purestorage.com>
 <80b5302d-1bcb-45d3-b926-0874470ee183@flourine.local>
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
In-Reply-To: <80b5302d-1bcb-45d3-b926-0874470ee183@flourine.local>

On Tue 2026-11-03 11:51:28 +0100, Daniel Wagner wrote:
> On Mon, Nov 02, 2026 at 05:18:51PM -0800, Mohamed Khalfella wrote:
> > -/* Complete the requests held in __nvme_fc_teardown_association() */
> > +static bool
> > +nvme_fc_cancel_held_request(struct request *req, void *data)
> > +{
> > +	struct nvme_fc_fcp_op *op = blk_mq_rq_to_pdu(req);
> > +	struct nvme_ctrl *ctrl = data;
> > +
> > +	/*
> > +	 * A single cmpxchg decides who completes this request. If the op is
> > +	 * HELD, nvme_fc_fcpio_done() is done with it and we cancel it. If it
> > +	 * is still COMPLETE, nvme_fc_fcpio_done() has not decided yet: move
> > +	 * it to IDLE so its own cmpxchg to HELD fails and it completes the
> > +	 * request itself (nvme_fc_complete_rq() sets IDLE anyway). Doing this
> > +	 * as read-then-cmpxchg would let the op become HELD in between and
> > +	 * leave it with no one to complete it.
> > +	 */
> > +	if (atomic_cmpxchg(&op->state, FCPOP_STATE_COMPLETE,
> > +			   FCPOP_STATE_IDLE) == FCPOP_STATE_HELD)
> > +		nvme_cancel_request(req, ctrl);
> > +
> > +	return true;
> > +}
> > +
> >  static void
> > -nvme_fc_flush_held_requests(struct nvme_fc_ctrl *ctrl)
> > +nvme_fc_cancel_held_requests(struct nvme_ctrl *ctrl, struct blk_mq_tag_set *set)
> >  {
> > -	nvme_cancel_tagset(&ctrl->ctrl);
> > -	nvme_cancel_admin_tagset(&ctrl->ctrl);
> > +	if (set) {
> 
> Do we call flush when we don't have a set?

Yes, that is possible in case the controller fail first connect attempt
before the IO tagset is created. Commit ee38469f8849 ("nvme-fc: Do not
cancel requests in io target before it is initialized") added similar
check to __nvme_fc_abort_outstanding_ios() to close this gap.

> 
> nitpick: use the early return pattern if needed.

Done.

> 
> > +		blk_mq_tagset_busy_iter(set, nvme_fc_cancel_held_request, ctrl);
> > +		blk_mq_tagset_wait_completed_request(set);
> > +	}
> > +}
> > +
> > +/* Complete the requests nvme_fc_fcpio_done() held during the fence */
> > +static void
> > +nvme_fc_flush_held_requests(struct nvme_fc_ctrl *fc_ctrl)
> > +{
> > +	struct nvme_ctrl *ctrl = &fc_ctrl->ctrl;
> > +
> > +	nvme_fc_cancel_held_requests(ctrl, ctrl->tagset);
> > +	nvme_fc_cancel_held_requests(ctrl, ctrl->admin_tagset);
> >  
> >  	/* re-enable the admin_q so anything new can fast fail */
> > -	nvme_unquiesce_admin_queue(&ctrl->ctrl);
> > +	nvme_unquiesce_admin_queue(ctrl);
> >  
> >  	/* resume the io queues so that things will fast fail */
> > -	nvme_unquiesce_io_queues(&ctrl->ctrl);
> > +	nvme_unquiesce_io_queues(ctrl);
> >  }
> >  
> >  /*
> 
> Yes, I'd prefer this over the introduction of RCU in this code path.
> 

Okay. I spent a lot of time thinking about these two atomic_cmpxchg() to
make sure they cover all scenarios. That is holding all requests to be
held and at the same time not leave a request in a held state and not
get to complete it. Let me know if you think I missed a scenario.
