Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE5E3C1963
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591485; cv=none; b=bqdI9sNP2jG4BxC2NbNr4hgxwKoup3UqnNrGdZd1P2DV0mYLkaV/ui7Qq5P8+muFPXqF51HKsNRI2XC/Et6GmJ/nsG7SEN6+92Dkh+elr8XXn3geWnzrUDadSXcFIAsplM7kVnmiHg6KF7cLKjWpXy+GiIcfVKDsbo1rQdbYYQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591485; c=relaxed/simple;
	bh=ZcL7dYl+t7tDUahafwYFHtczoNBxBHDjjQvSaDt7MN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4J3hH0NEQuUpolQJLpw+P5clX0737Lk5YtYlGlxVzvRWMCJ2YWDmCHE8lxwIQW69PuOaU3hO5J0XMHicdSp4ENWrXN1JKbhEduX1cq5VwemK20UnEIBVdmFsknfOB4F51FitMOL/ke6Z5C68mSOAh+NZJFcqTbwhrZXGgXoNWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B98DsrMB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LLfHoAqM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B98DsrMB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LLfHoAqM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790591482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ncJygWXyDwSDtfOrrDTJhD8n3lBQBywOBBfJbF/rpYs=;
	b=B98DsrMBjnf5iDw9nSChF6bK6zL1oKdVmXnT/jmeZJly01byA3P5GZHgXulJ3uc8YKVoq1
	VVwNkz1ZlJFXqosJFDdbDZaCYpGuoUta+6SvhLR8gT8GTOxpSZPCf7pN2eILiElu20m3cq
	XBPodlhYzWz/ASqfq1G4MowXHFtpnzg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-GpNYnxyWNeCegcaD6B-IHw-1; Mon, 28 Sep 2026 06:31:20 -0400
X-MC-Unique: GpNYnxyWNeCegcaD6B-IHw-1
X-Mimecast-MFC-AGG-ID: GpNYnxyWNeCegcaD6B-IHw_1790591479
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e745d5dabso28714585e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790591479; x=1791196279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ncJygWXyDwSDtfOrrDTJhD8n3lBQBywOBBfJbF/rpYs=;
        b=LLfHoAqMX1aMROUtL7jkYlwegXn6NLXlwBpFOXDCTW7ZREhmIOhxtopDrJNxvH1jMr
         57hgESpRVS2aMMkqYtnXfI9aItZn4+WXxI8Z2G4BS0dz48bidd56trrg41UfYQnE9Tci
         IJIoHS3oxPSiTcfdTsg14HRyhT26x1Tux9t+fiIJMH1x+Vw8AmlVtDwm37MDstfAQx5o
         3nz0lmJScXPLi7g0HI9AcX4hcWuzHVxVNGNg2tu1msfp4Z6owAa2sX767r8O81TQQJ5B
         aN++X9pVsZxNBVNCZjwoRVdu9d8wSZXhHTd/YXQTIvlX3d6o2qIehIHlxSFFQ+EsjrnP
         tghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591479; x=1791196279;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ncJygWXyDwSDtfOrrDTJhD8n3lBQBywOBBfJbF/rpYs=;
        b=UIwkPowSxSTLSSXq+Pgc/lQZDv7yUqgm+8UbwMI2agbK5tz7s3rGIehMtC+3s94U9f
         s4A99+1cWjB106QPJ1uBuaDKMLbcT5UEdZVGUEW8X7ylm9DVWBD7rypTD4GSGHsDGG3E
         AjCET+yVqjDSWJILsZhsgyUSzVU14CRJmBcBm+T8S+L7nde80APi4RpzdJPfd+QTYkB/
         hcc6kHKuvC4V2rbT4ifzSqtUcV0uXwlhfuJVyE5mOI8nPFzgVaimiU/zyW2Bi/GZUtmw
         Lgcf45D/vg9r2bjcCBVeVOTdPIy5xIcfalRVA0JdS2WEk1DJppLJtLny4x1ivkTiCGxp
         /LJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJze+8SOuR81jbfkadICo6FNPNh1/uMpVWGkAprev7/nW+3vnMt1jWcB7fo99yFReXhTPV5/ewOiC1nGE=@vger.kernel.org
X-Gm-Message-State: AFuF++mM6khfvz5oG82Pi6guPWUXYXejV8DNT2XsNW74tDRXV9zetNac
	ub8QobaDP/k905RZjEGaLGhn+FxY+T/90ZPRjAnr9B+TjV7Adlx6HdDef4Q81mzwkIxDcDNAEXD
	KvdvuFQSDIImXZRQjwCmdFQa5TKynnp6SZB7QOkwxGDUBMVv4KLYSZpjCBAZVxlvPZA==
X-Gm-Gg: AYBFou324/V/y5IVqkPHi0+1q6or+93wtgH/3OmBMJpJsAMGE9ZBSnxoRs2BWFLcgnE
	EWOTRqeWBYi7uazT8qeaegip4NUhRQGStmKoqULrfXp5VNcwDt9VsXzaQl6pZhF8HnJNBPFO5Fi
	hHl4rkh1T/LY/oF79ewYzCqMWFy623AOgG3myjF2OsrQqKQ2yPtJFF795MKnybTIXNibgdWW839
	ktvf/uPG3mNq8tg/jmGpWLA2auCHJMr4nVbRm49yAtqInNAhpDfbE1eZ1+zdV7f3CwQogubO+LI
	zK/F60WYV/Y6rT7phRnRm8ePcWedPv8sByVHSHAOqKbYrvb5R9MSxb4peQj3uyMfNA9VPb3CU4e
	VZ1Hm
X-Received: by 2002:a05:600c:a10d:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-49fe8bf91bbmr166404235e9.4.1790591479263;
        Mon, 28 Sep 2026 03:31:19 -0700 (PDT)
X-Received: by 2002:a05:600c:a10d:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-49fe8bf91bbmr166403775e9.4.1790591478661;
        Mon, 28 Sep 2026 03:31:18 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.134.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ed6esm29113119f8f.29.2026.09.28.03.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:31:18 -0700 (PDT)
Date: Mon, 28 Sep 2026 12:31:05 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Asias He <asias@redhat.com>, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 3/5] vsock: Enforce no-transport invariant for
 TCP_LISTEN sockets
Message-ID: <arpBYXWb9pohx-8v@sgarzare-redhat>
References: <20260915-vsock-connect-reset-closing-v2-0-a1d9abb472f7@rbox.co>
 <20260915-vsock-connect-reset-closing-v2-3-a1d9abb472f7@rbox.co>
 <aqp7CV9DnfsG1GJc@sgarzare-redhat>
 <0bc40e5c-8790-4a36-84bc-80e0bfe6b504@rbox.co>
 <arT3jXoS7OaU6Tsc@sgarzare-redhat>
 <6c1516ca-4699-4d9b-af6e-c7762759d495@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c1516ca-4699-4d9b-af6e-c7762759d495@rbox.co>

On Thu, Sep 24, 2026 at 11:26:47PM +0200, Michal Luczaj wrote:
> On 9/24/26 12:17, Stefano Garzarella wrote:
> > On Tue, Sep 22, 2026 at 03:18:13PM +0200, Michal Luczaj wrote:
> >> ...
> >> I've addressed all your other comments for v2 and went through Ashiko's
> >> reports (side effects of lockless peer_shutdown write, imperfect
> >> no-transport TCP_LISTENER enforcement). I've decided to try the
> >> eager-unassign approach. I think/hope this way we sidestep the lockless
> >> writes and enforce the invariant without breaking the API, while fixing the
> >> bugs.
> >>
> >> This should probably be RFC, but I'm posting as v3[1] so netdev's LLM can
> >> have a go (too). Hope I'm not breaking any workflow. Let me know what you
> >> think.
> > 
> > I think you can add RFC also on a v3 patch, just to make it clear you 
> > are not sure it's ready to be merged.
> > 
> > That said, thanks for that :-) I'll take a look today or next week 
> > because I'm off tomorrow.
> > 
> > I'm just worried it's becoming too big for net. Anyway, I'll comment 
> > there.
> 
> Yeah, I get it. Would you rather have a single net.git patch[1] for the
> original report + keep all the rest for net-next, or do the whole series as
> is, but slowly at net-next?

I'd go with the first option. Let's try to get the fix into net first, 
and then move the rest to net-next at a reasonable pace. WDYT?

> 
> [1]: Basically
> https://lore.kernel.org/netdev/20260915-vsock-connect-reset-closing-v2-4-a1d9abb472f7@rbox.co/
> + your comments addressed + addressing one of Sashiko's comments, and
> ignoring the transport-reset-surprise one
> 

Yeah, that!

Thanks,
Stefano

