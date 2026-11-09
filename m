Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224915;
	b=aFPLnKsOfVNnXM7NKNTxB5t4d2AN24VWdmDCZQva0TjeZ4l8L+U1qePCLN6cm1hEjxry
	 QZ7qLYpUdHHVEAjHE8fD1Uto+WpUj+wSYEP7cMMvomcZV3Ztiw+IyosTOpzCgKbZGFkdn
	 zrJtxh6jfLUvgMQ1gs2fAPTZV5ueZknVw9QDZ31XNveTHB0ILq8kfRcnRDRaYaua8rcfw
	 oKqrMPqDebHdT229Ac50ltKC5Rnt3pYj5m29d4pwNNWz/0y+XNXylET4mVcxPJIkI3NmK
	 TJVvuvMGAXpyMvKkQwTA9T42/0OLH3Sb78TeDrLfLONpz9/gsH6l5dBzpDIlwRin3oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TPfBvZrjONjB9W4HpOM7QG77dFyuYdOPlOcbjIM8DkE=;
	b=ibPlCwL5H4PsZfOmljUmbdabxy0fMXlDwXM+XR7e+8R1Wa5Fr+vffLk8bpUSKrOVY0ZE
	 Qw/9+oqUa8mQCheTkmBrHmAj9WMLE1uLX/o7kLrFV3DxRAEHKJNXaXz0vB3nucdHQtu0Q
	 4ixBc1aFVQ7Iy+o125KQDXkrN/7lIOBFOD1BHOV616YYhlcDKwDO2ek+NDXL28464ABFj
	 gAMUPdIzPOb5PQlzKjt6xtfSs9Y2/UPK0ESYaLWW9x/Fq9zPo10MVEHJkB8OlCYOKQaf3
	 L8Gq8tJX95ScipG0BC9NVI5HiV5nFbOcTweLawR2UPky6nKHMJfJ3tdttxsFDn2sJGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zAdiA/ux";
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAC6606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CAC6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zAdiA/ux
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c49b431f022so123037066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794224914; x=1794829714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TPfBvZrjONjB9W4HpOM7QG77dFyuYdOPlOcbjIM8DkE=;
        b=zAdiA/uxB4dheiXEwywJQCvR2sligV+ahXZgwyNBpeaSoXjVe9zkGP4IwJZDKYx0fx
         i8laVUyaLSi3GweZ32XP2dNQ/Rx8rwPKNa7xxiy13q7uAspoq8A6yDSv1mRWXMZcOjJr
         IJPdGnEcbnIDJ2soEG674wWysl+IaXfomHX/EtygTEeTevHHK4vxCT94HqmtIXby390P
         tShamPIwKSwAXylWJ4s6cMv2UFoJX3RW/beHl9BFfDdDyG9KIguimq1B7yVGrJhWHAVI
         LZBOojR4dgnYx0MC/jQ0KLCKJ7IXpMTXT9Qgqpu2F0ThvWCMSToRMjzG62xdFo9Je+wa
         9d9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794224914; x=1794829714;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TPfBvZrjONjB9W4HpOM7QG77dFyuYdOPlOcbjIM8DkE=;
        b=a0/9UXVXhRIzSHbbQUMWrjd1fOXkvieSqQEWBfxosi3wf6qREaeFd7Bw1WIxD22Jm/
         Jis8dNi2Bib5AXYJYXrdKm9ZWAD/ytjV4CotagzpseXS4H+wXKNvxt7HrxiCb2Uq21HQ
         OZTZXju7c3i6/zxW/9yw6/5ZOq9C4ShTAAgS/8WhW7X6F0L0m72mtvWyRscHVGoqilp4
         ok9QrW9IB/6cati6bRAqOAu3bCYIauZUdWMlQUgqksXpL7BUiauLhh0iCEOFadqq2bqd
         F38DIEbYzRn41AgWFQblo483ugdjwh/aru0Sh+GEHKZJLXQKaXNE1gNPKIfeGSqrR6SZ
         9aaw==
X-Forwarded-Encrypted: i=1; AL+hErGrDWhqiwTfiTpr6VQ5mOAXOdVK0WE63W61SDZVzD76A1tEXuvZtSU5p61KwS29LzfP4+5QWalb1ycEDzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xRw4P+n6geKP1730/Aq6uMYiDW6VcEC+SbRSRN6p7roIstMYq
	i5SV2GJp9wfKFvxgDPOXnODOPwDpCj2K4q/9OTvwfsuJNxhrR6ld/Vfe
X-Gm-Gg: AYBFou0JuEJMtT4+aiKNyV2IIGrAJ+uQBWDM9pltxSQPYixfhqQVHr4LWzMrSlb0Qa7
	IOSQZs1ySL87RX6qzcbRbyfN6OR8dGaWJ3CJjzqPmaO0k42Mn0oPQcwasADszPYbN4M36ocf78C
	RTO41xyZqL4EiYHbxgATkHYxdc6GJIZgBQPtkUB9wAauQ5yrQ9T+JKs79zA12q9OqqUDJSGcCmK
	U48ah+tkINeRxzt6hjP9Vvgqw0MkSI1HXhLPxDiIVD8itMZJfwdFagityFJwFDK2qiaD4Q0+j5X
	A7dTaChOXSN70Yw5Pcg+B8Ebhurx5bJLgAsikuP1RZmre1kjzEF67/viC/0V4jDc1Ampkt+gkt6
	VGao6gmfYH4TvsVIwMHXrJZXEWyY1GnaVDBUS5/VcRCRIIOxJII6GNyDlJ3uEIf7ZYcRUM0N6jy
	KggVdjwk8AWt3FqK6a0a4Jtqn8HsrrTf2YxvAA+TsrRaPDnCwkBv6U3xv7Wv2XVMZRquNqM9h4G
	IWuG+hVYxJQMxLB5Ri8tp4eTNkwH5QtgfoxIbaJl8rNGjvbKl5l9F6OwLgw5zO9e/cr
X-Received: by 2002:a17:907:849:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c4d6d4a2bbcmr263270966b.11.1794224913500;
        Mon, 09 Nov 2026 03:48:33 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4ae2f7sm155608066b.51.2026.11.09.03.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:48:33 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Mon, 9 Nov 2026 12:48:31 +0100
To: Harry Yoo <harry@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Zhan Xusheng <zhanxusheng1024@gmail.com>, vbabka@kernel.org,
	paulmck@kernel.org, qiang.zhang@linux.dev,
	akpm@linux-foundation.org, hao.li@linux.dev, cl@gentwo.org,
	rientjes@google.com, roman.gushchin@linux.dev, linux-mm@kvack.org,
	rcu@vger.kernel.org, linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: Re: [PATCH 2/2] mm/slab: don't queue the page cache work under
 krcp->lock
Message-ID: <avGzD8CAgg9Hif__@milan>
References: <20261028134647.3176080-1-zhanxusheng1024@gmail.com>
 <20261028134647.3176080-2-zhanxusheng1024@gmail.com>
 <au2fUYzBLv3uvj_2@milan>
 <au3ELzm_s9vhs7UO@thinkstation>
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
In-Reply-To: <au3ELzm_s9vhs7UO@thinkstation>

On Fri, Nov 06, 2026 at 12:21:28PM +0000, Harry Yoo wrote:
> On Fri, Nov 06, 2026 at 10:35:13AM +0100, Uladzislau Rezki wrote:
> > On Wed, Oct 28, 2026 at 09:46:47PM +0800, Zhan Xusheng wrote:
> > > From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> > > 
> > > run_page_cache_worker() runs under krcp->lock, from kvfree_call_rcu()
> > > callers that may hold more, such as set_cpus_allowed_force() under
> > > pi_lock, so it kicks the refill work from an hrtimer.  Under memory
> > > pressure it instead queues the work with a delay of
> > > rcutree.rcu_delay_page_cache_fill_msec, which may be 0, and a zero delay
> > > queues it at once, taking pool->lock under krcp->lock.
> > > 
> > > With the delay set to 0, calling kvfree_rcu() on vmalloc memory under
> > > pi_lock after a drop_caches makes lockdep report:
> > > 
> > >   Chain exists of:
> > >     &pool->lock --> &p->pi_lock --> krc.lock
> > > 
> > > Use the hrtimer when the delay is 0.
> > > 
> > > Fixes: d0bfa8b3c411 ("kvfree_rcu: Release a page cache under memory pressure")
> > > Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> > > ---
> > >  mm/slab_common.c | 8 +++++++-
> > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/mm/slab_common.c b/mm/slab_common.c
> > > index 3729aa7a6156..ef5ff0a20249 100644
> > > --- a/mm/slab_common.c
> > > +++ b/mm/slab_common.c
> > > @@ -1987,7 +1987,13 @@ run_page_cache_worker(struct kfree_rcu_cpu *krcp)
> > >  
> > >  	if (rcu_scheduler_active == RCU_SCHEDULER_RUNNING &&
> > >  			!atomic_xchg(&krcp->work_in_progress, 1)) {
> > > -		if (atomic_read(&krcp->backoff_page_cache_fill)) {
> > > +		/*
> > > +		 * A zero delay would queue the work right here, under
> > > +		 * krcp->lock and possibly the caller's pi_lock, so let the
> > > +		 * hrtimer do it.
> > > +		 */
> > > +		if (atomic_read(&krcp->backoff_page_cache_fill) &&
> > > +		    rcu_delay_page_cache_fill_msec) {
> > >  			queue_delayed_work(rcu_reclaim_wq,
> > >  				&krcp->page_cache_work,
> > >  					msecs_to_jiffies(rcu_delay_page_cache_fill_msec));
> > > -- 
> > > 2.43.0
> > > 
> > > 
> > Can we just clamp this to 1 - 100 seconds interval?
> 
> You mean clamp to [1:100,000] milliseconds interval?
> 
Yes. It is now in milliseconds.

So starting with 1 - means that it can be configured at least from 1 msec
whereas 0 is forbidden. Also we can drop the extra "if condition" proposed
in the patch as it never can be zero.

--
Uladzislau Rezki
