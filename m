Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793434919;
	b=wkmoQ1ktsaC/jEbVy3fAtjUfL7iwwwXUVrDH9p/7ueTs3L9HYh9XHhuk3N1EMcH7enUC
	 z7uA34kUfH6k4exM8EC9Td4z35cNeIVFyMyEhavN9u2gMbuGNghuGqE4aUvOUftCDzRHi
	 xZ4RcN4APRkEU+FcVtGnAm7QV4JGUkIRjxoArDS5wl7ycq4SSa1dl9IiFmidyS30kBELW
	 12ItrNlIU/CRcOat4cKgjEuDd9MGykRJd4HCA87h6PnUnERYC5+VQo5qjwDWmzhnUAKmO
	 eFdHi0xHtMtSNIqWQS6zZ9DiY/5K11YQy4iVJy7QffIvs8ajhfmBH8N6/kv7k/tTxlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793434919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=K2Ycxsi7bQUBl6s3XkEfGjThxfYRK7mN668VlKr8sgY=;
	b=XN5W30BDpHxWkOix1KQ4oFNcIESu5/zDjgHumABQiVfA4Fd3ogYKDtBsyVsIspTystKd
	 PL/1OfXKLc2ojQcE7M+eSV2RWb+b9vsbc7Nm/9Ig0Ukh0Bdj9XI2SJp+mphtlu2bYKiB5
	 L45IgQE5KFzcShxZP8Dq1EaWIwvXXoRliYOwXjvW72QP0jyh1mclml8Z94LRdJKm2Q5Q8
	 IVs5Ol6Q16VhtGYe2neDQS2HtPQ64J2wHwY+4ddpSv9OP6Y6CjIJOdZxTD4QS7NJCOgvg
	 TJs5avqfcnJj2m0xeVbLBWGn3DoVPhg5GexCzcyCZoI0Yy8jLSZvADW/R6jT4Yu4bBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=ROQRJZbY;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3410606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3410606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=ROQRJZbY
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso1891130eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 01:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793434918; x=1794039718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K2Ycxsi7bQUBl6s3XkEfGjThxfYRK7mN668VlKr8sgY=;
        b=ROQRJZbYGt2u3KAYqgPJI3tChy8CLZD+lJcXpe119KzsAraDa6aQQgJ1ygbjYC7oiY
         XcZCJGeTL9XEUGG8OqJuhBJlujxR9/swQfQIVdOU/aOz8zQLG/z6wHg7f9jx5F3I9sQ8
         7ToXZCjKIyNF53sg5VZcRqYlFrDXHu+1/9fkqdLe1zoX9C30tpIhZGUqWGssXthjZS1+
         f0IoalU7D61IDueVPTBaDduzoKdo1+5rN9gGiR3rvOk/VSZq4LaZW1JRhLngKrb0yS/h
         mhIS4wn9pqE96Bz9UtEPG2m+cQHNJgaa1nl2JopviFtJTLR75BreGyBLHWKfqBG3kdRs
         oJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793434918; x=1794039718;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2Ycxsi7bQUBl6s3XkEfGjThxfYRK7mN668VlKr8sgY=;
        b=y54ztjaVTzMYFihXrOO16/mk5RmUp/0K7lsV6FHRtCKnc7icoteaTBnEEWePJPRZg1
         T4lrX++U3jjm7Sg7rSA9IiAUMMl9j6MoLMQrAYgXpVXl2mqF/1NHUGvujARWtBg4xdn4
         2u3udxvXwP5xXlbMH+vHaqT1HOZkGEhPeHTz3/tHSzK01aZl2NZQPfqBaSwOIP6sUiRw
         hm9BH9YfmQ+akMMfMRGx8zv0zZmqTF9NCZt2rB3kiV6syrJ0I158RmwWmghqzRpEhwAU
         dAJnJGNr6u/lFWQJXZxmNqWMS9M0GaLBXN3zXfTMIIp2Qn+Z14koIaOhzD7Oamp/S51T
         +MxQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7L+NQdTxhcsxPd+Ab/WXcdLLRHRz4/1UsP++6zcmdQQjbxW8ajx2vJo9NEvP/0lbvs7Ym9i2Y5GLUdPg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIR9kupnTvShg/NOgGQrq/C4KxO6aWzFaxOf99FuRwKYM7zV9Pr
	ex22mmUbB5eU7R2eMa6sJkPOvex26M4BppS1f1zIm4jNO2wue0dbYHOP1XIhNM2QtvGUkqKn6S0
	izV4/
X-Gm-Gg: AYBFou0rchU0AKAsOvBPfwzKfwBmCnIQeT2Iu0BgieXpZHd6UNoXXQKJUz2XlQ2Pn6x
	50pbEWbUxSwpf4jGSEHpjPnFNJ5CuW4DR9eyKcvFvYbd8HD74HLVR8kzY0cKokiCbHSu3IUZIYS
	KnpSdUT3fG0JexwFCz9VydYxYT2MGOoeMIdcqbxtGUt96I3pZmhT4kIfnK4peDAe6H6nGdY9Za0
	S6kAIx+ds8bSWhQdkV35lRqo8mdkCsGNYO5aHKWpDzVq/oAT6Vb962/Olce975n+v5Cfe78EoB5
	b2bZBUmW2FQV3V1b6GmGmBciVWMHmTHoc1UT16s6hIdVsNQPIkuzB6AwJKjRoVKA1McnzetDscD
	/zEqj3azYvG7db+99sxqIlmYC+v1SOLMjtHlPveGQuvmefNcpEIDbWyqTsV22QayOnQ6vq/RiHE
	5e9iYDMtdHJwqvZUUNqlnr5Z9IbhAMAkVzDvr+cnngYHqV82r55vsZGJ3eOyddO3FsWm7Q6LacZ
	KCMopz3MpXzLnGX2kAvQp1kQVZNgsMO3GYfvaBv4taDBrgjIrMUrSOd7/oPhqSPaJJGiLWJUBm1
	TIzsu1+1VHIzG9dOPmLLm3VQvnlfVAMSuTI=
X-Received: by 2002:a05:7300:e9d3:20b0:369:fe81:a575 with SMTP id 5a478bee46e88-36a4243ab94mr8009376eec.35.1793434917521;
        Sat, 31 Oct 2026 01:21:57 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([2607:fb92:580:a705::6b74])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-36a42902649sm16685719eec.11.2026.10.31.01.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:21:56 -0700 (PDT)
Date: Sat, 31 Oct 2026 01:21:55 -0700
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
Subject: Re: [PATCH v6 08/18] nvme: Implement cross-controller reset recovery
Message-ID: <20261031082155.GC34016-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-9-mkhalfella@purestorage.com>
 <6e0b4de0-b030-47cc-84ce-3f021a5c75b0@flourine.local>
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
In-Reply-To: <6e0b4de0-b030-47cc-84ce-3f021a5c75b0@flourine.local>

On Tue 2026-10-20 10:55:10 +0200, Daniel Wagner wrote:
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
> > +	now = jiffies;
> > +	if (time_before(now, deadline))
> > +		tmo = min_t(unsigned long,
> > +			    secs_to_jiffies(ictrl->kato), deadline - now);
> > +
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
> 
> 
> This part could be made a bit simpler and there is no need for the local
> completed variable:
> 
> [...]
>         if (!wait_for_completion_timeout(&ccr.complete, tmo))
>                 ret = -ETIMEDOUT;
> 
> out:
>         spin_lock_irqsave(&sctrl->lock, flags);
>         list_del(&ccr.list);
>         spin_unlock_irqrestore(&sctrl->lock, flags);
> 
>         if (ret || !completion_done(&ccr.complete))
>                 return ret;
>         if (ccr.ccrs == NVME_CCR_STATUS_SUCCESS)
>                 return 0;
>         return -EREMOTEIO;
> }

 701
 702         if (!wait_for_completion_timeout(&ccr.complete, tmo))
 703                 ret = -ETIMEDOUT;
 704
 705 out:
 706         spin_lock_irqsave(&sctrl->lock, flags);
 707         list_del(&ccr.list);
 708         spin_unlock_irqrestore(&sctrl->lock, flags);
 709
 710         if (ret || !completion_done(&ccr.complete))
 711                 return ret;
 712         if (ccr.ccrs == NVME_CCR_STATUS_SUCCESS)
 713                 return 0;
 714         return -EREMOTEIO;
 715 }

Actually, this code has a bug. It does not correctly handle the case
when CCR operation completes with an error. I added line numbers to show
that.

- line 701: AEN, omplete(ccr.complete), x->done++, x->done = 1
- line 702: wait_for_completion_timeout(), x->done--, x->done = 0
- line 710: ret == 0, x->done == 0, completion_done() returns false.
- line 711: return 0;

The problem is that wait_for_completion_timeout() consumes the
completion. This causes completion_done() to return false leading us to
believe CCR operation has not completed.
