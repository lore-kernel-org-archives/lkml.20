Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267147;
	b=KOOc8gTegh0Fi/962CqcO0J1vLKuTJVwxkaxmwiDNSa94Yp0rG/SjDv9uXe6V+Yy1ucu
	 keBcZ6fzsazv5Bh6/k4+gWq6nrGr6lWhu5V5b2f7AlqAKxmrygk+9Q8yin15Ld2ALJgSc
	 aJ4OKW37Z7KRFxitMAvnbqRNRrJKqHDDwIbt/+qZpZwDiqYmZnPV9KPNDfqhGql0DekNW
	 z+9Jf17aVgJEVmVM9sFKl/ommN81po1Dh/JBIcWa9h3bQqoavFaB2PFJbm1zmPKGtuhsk
	 SaWr1niRfx24JJbepxBs4UeNPfoN3aT4fMQlO7P9VqB+RcSYoXg2mJRrVUT/TdOPWYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=JTQ24IxJ+09WN61gVfrvbCqS5+9oPwUXa80SwQihxYM=;
	b=fYLyvad43uzOcSy7asoO5ZYCGHmB+gY4J3xol5Z2/zkPYFwNXL+49zNoW3vjlc4WKi/9
	 ODIvD6rrIuY8BIR5XZNTzQTVZWQk1eF2/JN7jkiw/GnIF38cL3NpV0TmxpO7p3oUuG5y8
	 L0woqyDW/JPCgD3/Zf0DC9/9YDL1JSIIdNfeau2FH0z48+C20zbs80mdtC5wfGcuBl8ll
	 QCuajAD7pFiR1IpPM/+4A9dLE8xfuvXaRFRyq8eTg5KU6lynKN56wQjWuth5ZH1W7fBDd
	 7P85t03+MDhMNWi62rNgYhLCm+o3RzLsv6XgySFcVD65U9ZE0odvkg9w9DmV3mpmVPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OIqcu55N;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFE0606A324
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEFE0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OIqcu55N
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so12410655e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793267145; x=1793871945; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JTQ24IxJ+09WN61gVfrvbCqS5+9oPwUXa80SwQihxYM=;
        b=OIqcu55Nf5ordoX2N0IqiRQsiugAJs/oKo5BECsYFLe47oMFIff3jrsj4l/VUiIefW
         Kf0bF9j3ZZaJ87zoC5Zo1K0ZPguFjYhmwzquUC+784+lhc9oYNzAO80kNb724HC9/VHZ
         xSrFQjK9/Ov7eF7BoeKL+aHF9RPY8gGhFemB3ajeZJB3HwER2nn5t6QYKnJEeEXKkTPe
         qTkkIPezSmPTV93vrwzaMmuHEYP6vHffZkeZ7lp3n1rX8p1rx99ZWsws7jI1Qw79B1wC
         6IaFCKoWlKwFTOesM0Nnx4LsZ/2Gz3pu6jy0WNoYVgSuzHioQlDbHyUSje/hF/74hTI5
         XyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267145; x=1793871945;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JTQ24IxJ+09WN61gVfrvbCqS5+9oPwUXa80SwQihxYM=;
        b=0np8lDz9ZDT7x8rmicU2bexfB3BHyNMABGuyL3WBr6jwZsFw0JRm1KUQqSSflxEb3B
         Q5s7kmbaqgGhay65m277EIDFg+21OkYRr5ghQelOZTaFdfPHUoyDYJH+6nTc9n6CrIsf
         2muxcBOiwprec9sn1esP49+Izg0wo7bol257+ugWkL7XfZYsxuoOmBubtIWrTZjLjfN9
         JFYCXenFauR0mfVzoofdwNjUkPzVCtamJisS83P9nkHoUGmh5EH5zKzClER3nICexWzG
         xVoL0DVn85b6o0adb5JEsfEiGyww2KKpanL0wdBhwOXiWo1xGZH++5HtgjywOucGujq0
         5c+g==
X-Gm-Message-State: AFq9FYLEAJXSJ+BeGrptRPBaAV6FEIZXM0I8Sje5hM+YfvablNb+ePfb
	VjnaKZi5Mll+gLGZvjZqohAMtZ8VB7gnIbM9uBqIHabqD4hB7B/BhLy8WxXqJU3A
X-Gm-Gg: AYBFou0WFvE6EFo1KZF1ECJeaqWWeNo+tD0Sr31G+mmpUJ9MwyNMTyYI5kAKhmYl3r8
	+M5NosOvP1bqdlV5Tu2lCg6qEc9Oqjq+4bp3f2nYP/mMIguJI8oaPjnN+ALRNZrN4yzdmI9+vI3
	m8TBH4Ga+UyhjciaMMX3GKuWHM0/TgcXwtXEDzlxGTEPm0uK/MJMwyxoxb5m/JeYK8KIBlPJmAU
	AvdNmV2KuLLhY3gh2lFkkUeiMxPwV9JCbTBmsM/v1UAj3Xi/C0oSQXiTbFNAHXTsj6Ayg0ihoI9
	0/YCu/enNsR/vlpqh0uzbpsICft52FG5tyXVRSdQGrJFjSGytWF0+EGEKTdmI9kCTeRSoOjEfYa
	xdxKDFy0mwMX3sFHt7LPtagDngeEWmX+R/vNAqwEOeR+YBMx4b8aKbMpgKxrtkZtF+Lk43P6FFl
	ZRorMMbwdEZAcw/2y6Zy0DT3tNjLmU17qGm/iBWXmQw9YF3Y1RveCWI1S6p0UG5Gps1vbHqnLAV
	1gdToYGjKOzIjASwnZOaVEagyV1ovzmDaYkexkzmo8gmg5IaNZHYdvnlZgE1RFs01G9jAP9jhZD
	KuCiaHli5+xJ6nXbbK2d8cGzXDcfEwo0qwA3BK4iqgnURVkh+pDD//jqBv7pNCjcGg==
X-Received: by 2002:a05:600c:4f94:b0:4a3:5a42:b29c with SMTP id 5b1f17b1804b1-4a967202997mr116905795e9.26.1793267144972;
        Thu, 29 Oct 2026 02:45:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3c32sm34762080f8f.47.2026.10.29.02.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:45:44 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:45:43 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Manfred Spraul <manfred@colorfullife.com>,
 Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: [PATCH 05/44] ipc/msg: Fix saturation of percpu counts in
 msgctl_info()
Message-ID: <20261029094543.34076789@pumpkin>
In-Reply-To: <20261028210454.7ff0d43fd57f3546547e0416@linux-foundation.org>
References: <20251119224140.8616-1-david.laight.linux@gmail.com>
	<20251119224140.8616-6-david.laight.linux@gmail.com>
	<20261028181502.484379c56878a872899c0f94@linux-foundation.org>
	<20261028210454.7ff0d43fd57f3546547e0416@linux-foundation.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 28 Oct 2026 21:04:54 -0700
Andrew Morton <akpm@linux-foundation.org> wrote:

> On Wed, 28 Oct 2026 18:15:02 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> > > diff --git a/ipc/msg.c b/ipc/msg.c
> > > index ee6af4fe52bf..34e607add006 100644
> > > --- a/ipc/msg.c
> > > +++ b/ipc/msg.c
> > > @@ -501,11 +501,9 @@ static int msgctl_info(struct ipc_namespace *ns, int msqid,
> > >  	max_idx = ipc_get_maxidx(&msg_ids(ns));
> > >  	up_read(&msg_ids(ns).rwsem);
> > >  	if (cmd == MSG_INFO) {
> > > -		msginfo->msgmap = min_t(int,
> > > -				     percpu_counter_sum(&ns->percpu_msg_hdrs),
> > > +		msginfo->msgmap = min(percpu_counter_sum(&ns->percpu_msg_hdrs),
> > >  				     INT_MAX);
> > > -		msginfo->msgtql = min_t(int,
> > > -		                     percpu_counter_sum(&ns->percpu_msg_bytes),
> > > +		msginfo->msgtql = min(percpu_counter_sum(&ns->percpu_msg_bytes),
> > >  				     INT_MAX);
> > >  	} else {
> > >  		msginfo->msgmap = MSGMAP;  
> > 
> > Added, thanks.
> >   
> 
> LLM found another bug in there.  Please review:

Seems reasonable, if unlikely to ever happen.
Description is overlong ...

Might be worth doing a scan of all uses of percpu_counter_sum(),
I can imagine it is a common problem.

Oh and the code could use clamp(per_cpu_counter_sum(...), 0, INT_MAX);
which is exactly the same but maybe clearer?

> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: ipc/msg: clamp negative MSG_INFO usage counts
> Date: Thu, 29 Oct 2026 01:43:24 +0000
> 
> MSG_INFO can report negative message and byte counts during ordinary queue
> traffic.  For example, ipcs -q -u prints a negative header count and can
> convert a negative byte count into an enormous unsigned used-space value.
> 
> percpu_counter_sum() does not take an atomic snapshot of all CPUs.  While
> a third CPU sums the counters, it can read the sending CPU's local count
> before an enqueue and the receiving CPU's local count after the matching
> dequeue.  The sampled total is then negative, even if the queue was
> initially empty and is empty again.  The sum's lock serializes folding
> into the global count, but not ordinary local counter updates.  Queue
> locking does not serialize these updates with the statistics reader.
> 
> Use percpu_counter_sum_positive() for both usage counters before applying
> the upper clamp.  Keep the comparison in s64 so the result is not narrowed
> before saturation.
> 
> This bounds the reported usage without making the statistics an atomic
> snapshot.  Message delivery and queue-limit enforcement are unchanged.
> 
> This is a follow-up to David Laight's "ipc/msg: Fix saturation of percpu
> counts in msgctl_info()".
> 
> Validated with a source-extraction regression harness, including a forced
> three-CPU sampling trace and failing old-code controls.  No running-kernel
> reproduction or kernel build was performed.
> 
> Backporting: kernels such as v6.1 and v6.6 require matching min() operand
> types.  Use min_t(s64, ...) instead of min() on those kernels.  For trees
> still using min_t(int, ...), also retain the s64 upper clamp; the separate
> standalone variant includes both adjustments.
> 
> Fixes: 72d1e611082e ("ipc/msg: mitigate the lock contention with percpu counter")
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Laight <david.laight.linux@gmail.com>
> Cc: Davidlohr Bueso <dave@stgolabs.net>
> Cc: Manfred Spraul <manfred@colorfullife.com>
> Cc: <stable@vger.kernel.org>
> ---
> 
>  ipc/msg.c |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> --- a/ipc/msg.c~ipc-msg-clamp-negative-statistics
> +++ a/ipc/msg.c
> @@ -501,10 +501,12 @@ static int msgctl_info(struct ipc_namesp
>  	max_idx = ipc_get_maxidx(&msg_ids(ns));
>  	up_read(&msg_ids(ns).rwsem);
>  	if (cmd == MSG_INFO) {
> -		msginfo->msgmap = min(percpu_counter_sum(&ns->percpu_msg_hdrs),
> -				     INT_MAX);
> -		msginfo->msgtql = min(percpu_counter_sum(&ns->percpu_msg_bytes),
> -				     INT_MAX);
> +		msginfo->msgmap = min(
> +			percpu_counter_sum_positive(&ns->percpu_msg_hdrs),
> +			INT_MAX);
> +		msginfo->msgtql = min(
> +			percpu_counter_sum_positive(&ns->percpu_msg_bytes),
> +			INT_MAX);

checkpatch won't like those line breaks!

David

>  	} else {
>  		msginfo->msgmap = MSGMAP;
>  		msginfo->msgpool = MSGPOOL;
> _
> 

