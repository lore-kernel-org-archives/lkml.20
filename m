Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792617841;
	b=s6iR8jKzAIRlpDkOukznVYibFUzJ52tw9ICkjnvY1G3ilV6q4eIK4amEau2BUCurtQlE
	 j18vBEJiT23nxB33UYqr9Ey8mPMjeOM8chIuN07g7FCsKnkxzcpHfjSsmVYfEpIU5Ges7
	 XLowyl5uzChCy03KD9tjy7vfBVRcTRuGRU/aMthCom8t3PWoFlzHB0UOFfJO0HGrr8Z3J
	 Kyi+T/O5GQhnYKH9lFkbG6UJjUHG/LBZmVXgEYG9r/QSwVXAyKrJ0taseaJLMfsEIg5YZ
	 WmMQpjbf9qJS8aCnYoPFYo9ZiPT1rkLdkxT+sKIgna5CEZ+7l8E5WfEpY8DH3Cvv1bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792617841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AmBBAIm3prH8kTpiX53UrfBCPaNJtwirI+Fnb++A7x4=;
	b=HuoVDF4eeCp8KNAKirEnyssPU4D3CYaVeHn/T0a9XDVK5DRg37udR45Uwb+bKOhtq8fH
	 xkfZclLgrJhVigv0LZ9XYN5BeGpC6I9blZLmaXKjTGlNAf20FeCOAkVHJyYkE+bmMswz3
	 X9BpLwB8gJORI021VD9/I/d/BtTPddQoNNzs1Mk+QgGNxqjEiZ9F+LzV9c5cnZSEwqqjw
	 HwJzWjVkoHPZKO3BDWejWpvBr1N2LSnutIBmnZwyWVIDht9E4zcoqTqhiItdxCUrNwxuU
	 rS+6cu9iaJNfX33S3dkRV2fI0/5E66jLMANP/lTjHWb2ACWfRsoay6Za0ar0ZbQSwPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=eMwcj+QR;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35D5606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B35D5606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=eMwcj+QR
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1341610eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792617840; x=1793222640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AmBBAIm3prH8kTpiX53UrfBCPaNJtwirI+Fnb++A7x4=;
        b=eMwcj+QR5Y9YLYIMQWCqY46k5GLGNfbRnUvF6LndBn9rrU6Jqgs3nOeunfriDiq8Pc
         DoYHh6/+86dEFEWde0W/l0s6x/bTshLg/e2CaH551GSA7O75qCX0f/aepU5Sdcsso5Ez
         PJzZv0r5FOqL6yg8dZCLheCNrP28Obl1lVWlwywFXRcCaDnNjbQmvVvqATS1/OUwyK5k
         iCkQOk/P8opxI7HDlhcx6BouvQWs0AEl7B4RYzGKjz8In+zALcHbj+L6hufx5iDnv94Q
         krjVcYfF8EpC5iAJQ0EJ1DgXucWeHHU/LtLM+hD4EIqB62mZP9eX1ZO2Ty36IuWUNnNY
         l1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792617840; x=1793222640;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AmBBAIm3prH8kTpiX53UrfBCPaNJtwirI+Fnb++A7x4=;
        b=zy3tqhARjZaPavqOFi76maq9rhaAwQZEztGHxMdWzM3kcTybsoPoDx3ASzlFX+B/V6
         3Xojqw/x3TbZgXZJfxphI8SJEA16Op88aE669h7Ed4yUP+6b8P++hRovmy7my5z0zyUp
         2nGKP8tzk2SM31O9LhG5hAFiyIu+b+u1lUofBkwHK/1l4ascwgXTMUvHg/tTnW3E4mmj
         IsqZYreRxY7SEz9Pm8jqUVsUVVam2mvUg1EVNwvLRxmzYKGigg5Ep6eRvopaROTVSvO6
         N30330jRXTYYiEzgzAUHCPt9sFCdRtUJTbgGN/KHK5IvMPd3VbdZSFeJEflPINWRJ9/m
         uhDg==
X-Forwarded-Encrypted: i=1; AKwUvByBZGIBmp4vixMmiOM9ZJ0JtHhU4TT983fLDDEwOqj1eaF9XrJEHB81SBKoeLkaGHcs6qRd5J1euyWTLK0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0r6bhWWL821YpZwcjb32BibwnzD8czP1gb1vQ4kP8/8OYEmuC
	1b/7JMmRE+Mnl+DXDzW03PMe74GUUzaUzhwJ+aiIE/Di71/zoSpsX5uZLogOroSB6DM=
X-Gm-Gg: AYBFou0i3HUx1fZu4FG0sv0HT+hE3T+6v6p8cMhvnIVKoJpzFtyLdlOM1EWyHHGE781
	mryZF4qlCf8w8+osxf6G4AqPe5Ob6e4iftR5czbPnjUdykO6UHpzfWjnfdOpRDGr0MoHmxwejpU
	1btdLYREcu94oJNwaXlJUi3rsSZl2/7u+TkGhv7a8mAY2zR9sBKUwQOmcHlW+d9AGsdl9oXmhWL
	tF2YYz6o+FA65rjwcf++SP+yeyURwRb5x6NZp8HGyMM1RAIGuvt8DOCjLzEgBVr4dfypfw0Zx2H
	+zVIq++A4ZX1/o+v5qORKM4nT5jgjjTkJ4SSkFQ+X1MGQL7v0oNkFj1h2LUWK3v3frrc+nqYko/
	ZtoLSikFUm1yLPYk/eA1AATo6C0CwQVWjS2SYXK9pT3lSvhCFPCrSzlYjEgJLNmYeULjv+k5xBA
	OIgZIOD1v9mQ58XMNv26eKLiATZzA7xaI7bHqETzy8DFWB2Y53ARNnKuKVxgVYpfrK8RvWMT0rO
	qH72nbN/LIJK3dQf5Mj5Cvqy2Pb7mvtFPbsLpZFQ6Ydnr+Uw2cW6xu7YKCu9bLLQXKRggmIfhc+
	04Lzd147JEOOOPJDkTn4wA==
X-Received: by 2002:a05:7022:5f04:b0:166:4b44:66e9 with SMTP id a92af1059eb24-190a87a48d6mr3690427c88.32.1792617839532;
        Wed, 21 Oct 2026 14:23:59 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1903e02901fsm9050248c88.22.2026.10.21.14.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:23:58 -0700 (PDT)
Date: Wed, 21 Oct 2026 14:23:57 -0700
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
Message-ID: <20261021212357.GZ2931-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-16-mkhalfella@purestorage.com>
 <d9563967-9ddb-4cd7-9149-d1f37522e1fa@flourine.local>
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
In-Reply-To: <d9563967-9ddb-4cd7-9149-d1f37522e1fa@flourine.local>

On Tue 2026-10-20 14:21:59 +0200, Daniel Wagner wrote:
> On Sun, Sep 20, 2026 at 11:28:13AM -0700, Mohamed Khalfella wrote:
> >  static void
> > -nvme_fc_delete_association(struct nvme_fc_ctrl *ctrl)
> > +__nvme_fc_teardown_association(struct nvme_fc_ctrl *ctrl)
> >  {
> >  	struct nvmefc_ls_rcv_op *disls = NULL;
> >  	unsigned long flags;
> >  
> > -	if (!test_and_clear_bit(ASSOC_ACTIVE, &ctrl->flags))
> > -		return;
> > -
> >  	spin_lock_irqsave(&ctrl->lock, flags);
> >  	set_bit(FCCTRL_TERMIO, &ctrl->flags);
> > -	ctrl->iocnt = 0;
> > +	atomic_set(&ctrl->iocnt, 0);
> >  	spin_unlock_irqrestore(&ctrl->lock, flags);
> >  
> >  	__nvme_fc_abort_outstanding_ios(ctrl, false);
> > @@ -3287,11 +3328,18 @@ nvme_fc_delete_association(struct nvme_fc_ctrl *ctrl)
> >  	nvme_fc_abort_aen_ops(ctrl);
> >  
> >  	/* wait for all io that had to be aborted */
> > +	wait_event(ctrl->ioabort_wait, atomic_read(&ctrl->iocnt) == 0);
> >  	spin_lock_irq(&ctrl->lock);
> > -	wait_event_lock_irq(ctrl->ioabort_wait, ctrl->iocnt == 0, ctrl->lock);
> >  	clear_bit(FCCTRL_TERMIO, &ctrl->flags);
> >  	spin_unlock_irq(&ctrl->lock);
> >  
> > +	/*
> > +	 * Wait for a started nvme_fc_fcpio_done() to complete before we
> > +	 * proceed with cancelling inflight requests. This guarantees a
> > +	 * request is completed by one of the two codepaths, not both.
> > +	 */
> > +	synchronize_rcu();
> > +
> 
> The synchronize_rcu() protects against nvme_cancel_tagset() racing with
> an fcpio_done() for an op that completed normally and therefore wasn't
> counted in iocnt. Wouldn't it be clearer to make the hold explicit in
> op->state (e.g. FCPOP_STATE_HELD) and only complete held ops in
> nvme_fc_flush_held_requests(), instead of using RCU as a barrier for
> running callbacks?

Adding new FCPOP_STATE_HELD will result in a more invasive change and it
will result in nvme-fc no using nvme_cancel_tagset(). My intent with
this change is to bring nvme-fc closer to other transport and only
cancel inflight requests. synchronize_rcu() is a simpler in this case.
