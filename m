Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540588;
	b=Sc5T/aOo3vha6EX9DLVogM3RZE+0Gn3uJ2zMUw8Pj7y6K2m6ZLW5ZiF3GOAVgmaBd4XP
	 hwjxNz57RJU0Ogw3FrKSti7sE2N1xyweMjQMPqzIPE1llrCSR2JrvBbdzV/pzhsGmtdsD
	 cSX2BoS8bdnlP1ehxUOH3ku7F0fFiIG+/zPBPUBGk44NOeNiGXhW4nJuJzWITGaIEEYXk
	 l/lS7c0jgSSFO4BhxLF3vsoKJggi2Msrzor+H2nncQ4fSkGhMNzyL6ALDhxXeaJ1lMYHZ
	 JIcafnQmIheJoroRRNlp8099KotedwomORmY4XFhGKuo2y85vO1rEubyNI04TkE4A2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dsYw/Tubb2vrl5Whids6Qo0hzPpgh0vmBncw/dPN57E=;
	b=JPhjEvu5z716LrdxXZZnRn4yCumykxiuLfpauR/xczLjEJNwlvlkpFLeouiLeTnN26nq
	 /DWaGvz2dYsfYyVa+grtlHoCH3rLI8+SSmCJKDSqbtxkT6Yqjcnfz5UWyd7cPpMj5PXRp
	 5cNBzNERchLJto66LIj4QupfqS26Hfi48VnxherjOD2k9bNeMauhJ1Gk9rBz0xDPxVveg
	 y+sVf9IrxLZDutxDeyOwii9OZ39Oem5CD99qQDausk5SG+T7jsdR2YdZlmUpAt/2zBaKJ
	 BkHbOkqXz3YlgcFYzjwb/9P3uXKbwVtBDb2LYSwCkgEzdcvu+8CRA4PYzt2BRebka5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=PXFifscb;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8277B606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8277B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=PXFifscb
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36661f953e4so241882eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792540587; x=1793145387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dsYw/Tubb2vrl5Whids6Qo0hzPpgh0vmBncw/dPN57E=;
        b=PXFifscbQw2mVG4eYiXKhVUPOkKGjveiemNUHMNMPkVRqRZ9CXNNeCM3eGyrQQaNMk
         Hh4sO+3mxLebYIQtOeC/G11+vop/EAt9ara8qHyhUhCeD0SypJzOSkp5qXczZcIL+FIZ
         wN4lLtWFsOfldVHa1x/96ujgqAT4eJ+JFCP71+0hv72dM+3kZt5V3s8sLXjjn5SlrFoa
         M6VBjcb4nvju8ItEKqEET3yE2YG1bc6ciaJh70ucRJo46URgOL0zqOZ7p71lH62+Hpam
         BdnFAvoHC2J3EnJOzBu9G4AipeCAk6zKwy6BLEc6jD6hvoyvHkqbyXbb0nzVx0XNlcbY
         OZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540587; x=1793145387;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsYw/Tubb2vrl5Whids6Qo0hzPpgh0vmBncw/dPN57E=;
        b=w1NAfcClxEHMWOHnaB4WMZ5q9LggoW+LadPLojvIdBmAVcqy1AtcSVmjZsk6UMfNlH
         kDaggyzmnynhV3Il0mQlEzFN3k4nul5RnxhyCW65ZdwHroXGFmvItLKJDJkFS1u50ToN
         zTkjcIvYZkdJCSWtAhvJg8TwjpqVLv0tZW8rkdNnmHHgM8v3ArSdTu+zwRwh3jIEmejm
         +163eds5EtcMIjPMvUWvgtJCwW4jneJsgP1VNPkwwhzI9n4zv4rF7fDD31FPhPJ8jcgu
         OqY+XMDGaaNLHlvjhGKr8Tk5XQVfF71J4eH0VGHEIQFtCxoN8IBC8JIk9RuPmfN9p7eP
         nnjQ==
X-Forwarded-Encrypted: i=1; AKwUvBzc3HxUlcGGO5MXgMXxFxz1hyzo8T/0lUp2NGYlRe3WNlXwvbKfnDXwL5wCChBd/t7taJ7HAbr4YJz+jKM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF+giZTKqOREchrOplfhZjrYJH6ZNRAvIyNpiyvV68+mgGb6Ya
	jPcdl88s700jR9yk/0ddiGcNYY+3bjqRS7nCr1Bke40X0m8Hwm/9L2S+RIBATcpb88Y=
X-Gm-Gg: AYBFou3J/6a7rrnsRXZfb0g4Z5aPgjkljPQTpZzL0c1OdSYWHgLs7eXQ0kkQhyk7Ryd
	J/DuUglVGxm5xvBKSqhlKRMSIhSkBJpJFfis337xjEHHUq+PSj13g7Dic7UPfj8wTBOQMLIfMWE
	zq6+8pekqL0odPQahR2WePhArYDm8Rs4isb2WywX7uGE0G6rN7LPQmW/neTXVa3jt5qZeBoIKy/
	7d9/GblHoKDwQ7Ug4D05P3/n5HdJZRBzc8W1U6ja7EX6VJB0Io9K6Gd58ebYJBvghJip/+1EQ01
	HN1cgBtjEZKgeJt2oB1FCb3U/271ibY2BJmDZrd49m4bdjvztSpNUbV3vnnZh9fSgDt6iDTeUVp
	HNHy6R5HoLt7ZUH92og8A1G2E6GrsXGltXCpuoCkDZIHjb0b330unWR0zvOPjoPNnYR2NSCjf02
	bcX3mgGeXwxEMxLJL71JmoIy5Ap/GZhQI+ecs4IPdQTwi27PZ3+t+jy0wkqFK+zIJkzjUBTl07u
	wbajMzVp6PHXsOlkGQ=
X-Received: by 2002:a05:693c:620c:b0:35b:fe88:d053 with SMTP id 5a478bee46e88-3674e04d982mr1120371eec.23.1792540586218;
        Tue, 20 Oct 2026 16:56:26 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-367405ee5eesm1775987eec.8.2026.10.20.16.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:56:25 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:56:24 -0700
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
Message-ID: <20261020235624.GQ2931-mkhalfella@purestorage.com>
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

You are right, this is deleting "completed" local variable at the
expense of checking the ccr.complete again. I find the current code
easier to read and reason about. I prefer to keep it as it is.
