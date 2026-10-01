Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF784B7A21
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790862601; cv=none; b=utn5ItOHgDTGpA/71iEaVkIucA35j0jBzR4Fb7DIJ3yCjBKS50ZEeU5a/RHJC97ZGTQpo4AEcgbwE57KiM3AmvMDUkDZ7UDIYrlzd5CbuqC5JZPrsYfsrhAH9sL1i1YVXd+OjQS0IjtGoB2Lg3Xai+wSkT8XifVuw4ZcvUHuwX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790862601; c=relaxed/simple;
	bh=rZtlDwhko5broPuTQRUomxt+kCO9PaXGWs1q1878AFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuoJyQZJJnr0bX9Aji9AIc1vDL/HNdhDPbgvL0QwUKSO20Y35jwi9WU28JfEJOZOtVtTtOg7z9bG0oWK18N3k0DbjZ3dALB/32iHCXV9B+habk1tdZxr71wNm4+wObXf0ERt6XRNznWJmAXupvyKCol5zJMUFmqvuzEpQjG3w48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DwWuCnme; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hFFmJ0gb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DwWuCnme";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hFFmJ0gb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790862596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gK6srUdUcH5LY8A6vI2W+4Q7jKIowtaiZ4fg9Nv2bCc=;
	b=DwWuCnme/fAhfMYkjqrrguYBQ7fzlxAmQpILxUC4XPEO+och3ayhIj3iVzHrko81CDJFaq
	F5uLrUNa7WFyg/jPIPYpG6CX2rv52qcarE7TT9he0EUbi6GurDbvisuGtGHlEu+d+BLDJW
	3EZhO9PeSAFgpkY5oyvzdDfOHX6gmzo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-b57VLkpJMiugebH6eTHm1Q-1; Thu, 01 Oct 2026 09:49:53 -0400
X-MC-Unique: b57VLkpJMiugebH6eTHm1Q-1
X-Mimecast-MFC-AGG-ID: b57VLkpJMiugebH6eTHm1Q_1790862593
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48b01a74792so1375043f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790862592; x=1791467392; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gK6srUdUcH5LY8A6vI2W+4Q7jKIowtaiZ4fg9Nv2bCc=;
        b=hFFmJ0gbCZ2i8x3kFidEJosIcDV/hT/UNlDHPELPRlVUFuImIeao7KBI36OVC7YSwK
         xq9ZDTZ+zR3EdEmIiHnU13ozWUaGRO6eTt7+6W0//STy/eMI+iiwSSUj7M5q4qFG3s9c
         ls/zmQwcJNbgEIV0mTqinkjqhUwSgvQlgO166B3oAILNbTpgoigrvPRQ9gUKEu6XQpc/
         nNYvkVwgidBcwOIHodVjd2xtvjHoB5o/RvsmZ0o4jpVfRhJA5MAHtK49tB/ekyk6jYTB
         zUSyf9lDDI0ySBw6cPvey5A/e+rR+3aA1UGzL89ZUDYbMbhhg5B1jHMETTcJL6anqDSH
         A0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862592; x=1791467392;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gK6srUdUcH5LY8A6vI2W+4Q7jKIowtaiZ4fg9Nv2bCc=;
        b=ir6pFMRZjFrzbRg/xUpJXmfXVgRLOaWt+jfeKHBCt+mo7oRg/Qf/D0v1V1HGEiladt
         HhNRJ2W3I9Kc0GHoP8nDqfO/yr+4BLf7xFUivYhEpom/y1EMiqGdYBcw2ng6h//LAwCV
         1t63DkgEB4dqO9JkCS5n5Zg5Wx5ULlvdX2v/63DMxW+A+BJqlseQ12W78VvXdUfnk6lD
         ESYh1ziNO1uW0nIiDtXwP39JZQXfRUqFjexfTDGezTVrcDeCv4mHknjWrVl7otH8Db0o
         W6WtEdr/cczhh54EI0kvEprvuRi19AMYfpSjLNhuFhc7HjurE9FJzvIkcX+0FcharQx2
         tDhA==
X-Forwarded-Encrypted: i=1; AKwUvBxHkfBLPMef6Z/E393JcCc6SocNe4JJDINmnQPXqV80fc1J/eDPWiY2HqGweWFwCK3wWTmQhZTM9v+KCjE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+dTbrI1IFmHQatfmEHxPTEDBaNYhYp6itzLDG7+0oLQP3DY/B
	Q+Mb3iTXsRte9Qm3XGq6BaeMwtVYwx0xcMsXSt1af5JG5zwbIOJi9GNOOLZawViqBmVeBC1hiqO
	2S7pysMXXFIARBXVyx/Cw6huPfIZXngojpmnXd9/yn+KDRLUPcvhGW54+qZcFxCx3dg==
X-Gm-Gg: AYBFou1c0B4Ex4M4DTVjnvSaxcQGUOzcWZpfnJm1yfV0WY47gK+kLox3LnOW7p7vEsq
	a1tUjJpMtaY576xFLYT0Vlv99Q+xsrDzgNui89omln0zacJf/ZvIkcreCrbqXdSLSk3dtQb7I4Y
	OiAtSxJdmgEMeSmQZcit66dHalhI6iT5p0mvmb/iPnL0EPUae+fScN/34yUuEeuf9THbL8bDrSx
	iRcJVCq5/EOZ7i2bRakZ0ZTu1orQ/75u6FRy1so9zKU+WSv1+1stbZW0YywrJGEzVM2YrHFUUoB
	QIVM5wN8E1Pjp73sd2JZDq27G9HKj5bQ19BUtuNNqEbrE3DzrkeJX+r728WeAgeQOoMNnwl6EsB
	zTjUVdQFl7MhHjzT1KA0epEX4V/5C
X-Received: by 2002:a05:6000:1a8a:b0:48b:10c8:2181 with SMTP id ffacd0b85a97d-48b10c8229fmr1532378f8f.27.1790862592634;
        Thu, 01 Oct 2026 06:49:52 -0700 (PDT)
X-Received: by 2002:a05:6000:1a8a:b0:48b:10c8:2181 with SMTP id ffacd0b85a97d-48b10c8229fmr1532334f8f.27.1790862592197;
        Thu, 01 Oct 2026 06:49:52 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.14.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0690c47dsm6381511f8f.15.2026.10.01.06.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:49:51 -0700 (PDT)
Date: Thu, 1 Oct 2026 15:49:49 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: "Ionut Nechita (Wind River)" <ionut.nechita@windriver.com>,
	mingo@redhat.com, peterz@infradead.org, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	arighi@nvidia.com, linux-kernel@vger.kernel.org,
	dhaufe@simplextrading.com, create0818@163.com,
	frn1furkan10@gmail.com
Subject: Re: [PATCH v2] sched/deadline: Make dl-server nohz full aware
Message-ID: <ar5k_SmqKTmYKJvh@jlelli-thinkpadt14gen4.remote.csb>
References: <20260513-upstream-fix-dlserver-nohzfull-b4-v2-1-d3e9cbe5c845@redhat.com>
 <20260924170402.521623-1-ionut.nechita@windriver.com>
 <araOR8aTAU_R5lwQ@jlelli-thinkpadt14gen4.remote.csb>
 <ar5YqUCMbhZyjvtn@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ar5YqUCMbhZyjvtn@localhost.localdomain>

On 01/10/26 14:57, Frederic Weisbecker wrote:
> Le Fri, Sep 25, 2026 at 05:07:51PM +0200, Juri Lelli a écrit :
> > Hi Ionut,
> > 
> > On 24/09/26 20:02, Ionut Nechita (Wind River) wrote:
> > > Hi Juri,
> > > 
> > > I have been chasing timer noise on isolated nohz_full cores for an RT
> > > product and ended up on this patch. It does restore the CFS bandwidth
> > > guarantee, but on the isolated core itself it trades the dl-server's
> > > timers for a full CONFIG_HZ tick, which for us is the more expensive of
> > > the two.
> > > 
> > > Below are measurements from two machines, a variant that keeps the core
> > > tickless, and a hazard in the dl_servers_stop_all() call sites that an
> > > equivalent change of mine ran into. The variant is not a replacement for
> > > your patch as it stands, since it does not address the housekeeping
> > > wakeups you are fixing, so this is more a "can we get both?" than a
> > > counter-proposal.
> > 
> > Thanks for the detailed analysis!
> > 
> > I believe my v2 was never picked up, so I'm happy for you to send a v3
> > modified with your approach. Keeping the tick stopped during the
> > server's throttled window sounds reasonable to me. Having a proper
> > single patch will make it easier to evaluate. Please do include the
> > ext_server handling as well so we have the complete picture.
> > 
> > ...
> > 
> > > A separate observation
> > > ======================
> > > 
> > > Independently of either patch, the CFS wakeup pattern changed between
> > > v6.12 and v6.18. With the same workload, v6.12 serves the periodic CFS
> > > task every ~50ms (199 wakeups in 10s), while both v6.18 variants on that
> > > machine serve it once per server period (10 wakeups in 10s, ~1s worst
> > > case). The bandwidth is the same, but it arrives in one burst per period
> > > instead of being spread out. For an isolated core running a periodic
> > > housekeeping task next to an RT application, that is a user-visible
> > > change. Is the deferred activation expected to behave this way, or is it
> > > worth looking at separately?
> > 
> > I think what you see is the deferred server model at work. The server
> > now defers activation until zero-laxity. The dl-server is primarily a
> > safety net to prevent complete CFS starvation under RT, not a latency
> > guarantee, so the bandwidth being correct (5%) is what matters and how
> > it's distributed within the period is a secondary concern. That said, if
> > I understand your example correctly, that periodic housekeeping CFS task
> > you have on the same isolated core of the RT application is relying on
> > dl-server to be able to run? It doesn't seem a safe approach to me, the
> > RT application should better ensure to sleep at times leaving space for
> > CFS housekeeping task to execute w/o activating the dl-server?
> 
> I'm not sure I understand everything in this matter but in general
> sched bandwidth is incompatible with nohz_full. It's about a single task
> running so there shouldn't need to limit access to the CPU. And therefore
> there should be no dl_server running there, right?

But dl-server gets activated in case a fair task gets enqueued on a cpu
in nohz_full mode currently running a FIFO task (so that that fair task
will get a chance to run in case the FIFO task won't sleep).

