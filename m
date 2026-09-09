Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4DE31E844
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979363; cv=none; b=GywL6CebH1s6EaK0SKitn3LADUlMwjMEwKwz1fPQxC0KzLvr1G3Eg33niy/nfrePqyzzY74mgHisPRUUUbhmYPSxUVKDk1e048kh5tqteBeEievv1Lpl+TWUVR/V1+0Sv2KIY+82MzlEI3D4HNaCvlpzLMlcGmg07qPJS1fCvdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979363; c=relaxed/simple;
	bh=vuLcYylBXQjzcKMp/9RObgtHTXPI0DKqJpS8GBmQyYE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APy7SWBD4+FU54Fm320VtZAbhTZPBEjw6e1o2ANgvFZ2x0ldp/6u5sGt+wF72K7nWlzS//L0jSCEDyq4sbsSeTDlYOdIviFmRiRqgeQhaOvcGce6H+a7AbkZQY2JO80UG+9EqjnFJ/ti/q0HXBgUMxkD6+A/iRaWyB1uizT2cok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsvQLtRC; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsvQLtRC"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381b831d535so9676829a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788979361; x=1789584161; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RKaRPlxnQUpRkMBZ6v/teYErD/NvsPxd2NIVxqjWpVg=;
        b=OsvQLtRCNsX6uyMoU3tPk50Nop3yQiCpbc/mEh0JY0YKZjSSi7XYURpNsQGpzDTNr0
         J7u9uh3oAwXY5QFOchqqmP0qXIyIbIbohclQil5fso7Ndge65c3ddgzaApjWkmxgKSCm
         8rP1Hr1fRrrpZ3xPMHEC6CBjizRsbwUhFLYuZRDzdtA9cxheD+/+w+8xZwH94bRqvcWo
         RmEYAkJ/h8j+Lvgd1TpaTg5SafGmnEnSpCok09g/K/2QFExJuP/p9PerWcONnopFYrlX
         DV7T6pR2HW0w/tHKb2njUp9yE2AENfY2BfUa3PTDA1mvhh+0d5RBG3vSOs/cAHE3ZnE8
         1wpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979361; x=1789584161;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKaRPlxnQUpRkMBZ6v/teYErD/NvsPxd2NIVxqjWpVg=;
        b=SVZzLJnumxYHem+hV+kPJWUwSZkS3iYZD35w2J8CrEiqrviEw2M+pwoT7emq3yfBsI
         HpAYLoeVTmOgPmQ77kcb+p0LGVOVQNA9NZeSne33qq3gOwieTIUdPOnqrqz5qP7iEt57
         du5k1JTYEhLC7/BIPBKZeGzxYGpQRA78IS+t5gqW4657UG7ApbnZMBj/3pj68b2dw9f5
         xXFS4VTmkDngAd6mNQf1k8AARIQLxxzfmQVMexk9InmoUco75Eohjp3wMar/NiBBRJG1
         7HQfhzFk4m//0bbvRd5zdGpnW+PZc+uFi11b+ljSIbGGNboJ7HuXbTlSiOvNm1quIpDF
         QR7w==
X-Forwarded-Encrypted: i=1; AKwUvBwM2Q5iKAS72vX3RbA3l/rvNgjsG4/emITbn50LhFpWW+OBljy5pFmyVI9BfYh9XsnLdVta4ygqTayQPHc=@vger.kernel.org
X-Gm-Message-State: AFuF++kAUMlaq8gC/Q+hgKgPU05YdMrvRZAzvyNu0x2/FeHGVFT2g30S
	wKOj6m2UNwocUPKJ7i6fa0NyDssx7z1L27zZnMRJibWEUDhZ6wZnMQ7F
X-Gm-Gg: AYBFou3/24Ey8k7hzTGAzL7haPoOhswcmF1AhbLplnOi76ZwiW57sPIwq8zrAOpkpQn
	B3GkMnzWu9zL1Z8rsglc+mox2dzWu9i8jJUDXNgKRW2FxxT1jS0D7E438SoTEJRm2wwlWhXJzHT
	SmebcCRumMqBW5eISYLInOtp68DR8YcKNnaplHD5WMIEcHw3q9ULsBztWiPPUovW6BWo2c6zR+Q
	6QXQ+N6kD0OCm9z3C8wKZolh21Y5cMaGZbODdXMGo5ZcvrWza9uqZ6njKWnC7oaRJBkmIqt+TQT
	g8VwC8OoBdju+ZHdMtdU7eq7jtB80QaCvXzqbSAdKbIgJuCfJPFLYWud3a8zMmqWS4q9CwOYrrR
	lyc6Fc7JGtQ1LD3PYe/kE4pFpXyQ77l7YJml14hiNmAC7Z2+6PJzn26Oa0t7heWtHCMYofOM34i
	heQbSoD6xuz/4N1ylP2AdQ3FH2YfxLUaiZ6z153f0sdmY6jvTyF1cySYir1OomnzgUQXnAFD9Ji
	NKvWPQFSGxMazZDOtqKR1s51lo=
X-Received: by 2002:a17:90b:3803:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39b25eef036mr51408433a91.0.1788979360843;
        Wed, 09 Sep 2026 11:42:40 -0700 (PDT)
Received: from cxlqual ([220.120.90.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d77608fb4sm723890a91.15.2026.09.09.11.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:42:40 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
Date: Thu, 10 Sep 2026 03:43:57 +0900
To: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
Cc: Anisa Su <anisa.su887@gmail.com>, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>, Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cxl/events: Return IRQ_NONE when no event is pending
Message-ID: <aqGo7Rtb00mgS1lH@cxlqual>
References: <20260906155705.13252-1-shaikhkamal2012@gmail.com>
 <aqBSUSJWVA8JfCvX@4470NRD-ASU.ssi.samsung.com>
 <aqGPliCzr8lS64K7@acer-nitro-anv15-41>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqGPliCzr8lS64K7@acer-nitro-anv15-41>

On Wed, Sep 09, 2026 at 10:25:50PM +0530, Shaikh Kamaluddin wrote:
> On Tue, Sep 08, 2026 at 11:22:09AM -0700, Anisa Su wrote:
> > On Sun, Sep 06, 2026 at 09:27:05PM +0530, Shaikh Kamaluddin wrote:
> > > CXL event interrupts may share an MSI/MSI-X vector with other event
> > > logs or device features. Consequently, cxl_event_thread() is registered
> > > with IRQF_SHARED and must determine whether an interrupt belongs to the
> > > event-log facility.
> > > 
> > > The handler masks the Device Event Status register to the event logs
> > > supported by the driver. However, when no supported status bit is set,
> > > it exits the processing loop and still returns IRQ_HANDLED.
> > > 
> > > Track whether at least one supported event status bit was observed.
> > > Return IRQ_NONE when there was no event to service, while continuing to
> > > return IRQ_HANDLED after processing one or more event logs.
> > > 
> > > Fixes: a49aa8141b65 ("cxl/mem: Wire up event interrupts")
> > > 
> > > Signed-off-by: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
> > Hello,
> > 
> > This looks similar to a patch I sent last week:
> > [PATCH v2 4/4] cxl/events: Return IRQ_NONE when no events were processed
> > https://lore.kernel.org/linux-cxl/8e22c1c2-8098-492a-8162-3dd27507c853@amd.com/T/#ma4cf2b2dddaeebc06cb73f81647817bdbb51963c
> > 
> > It was dropped because I received the feedback that in general, the driver does
> > not need to handle device-side errors/spec-violating behaviors. I believe it
> > would apply here as well. But if I misunderstood the intent of this patch,
> > let me know.
> >
> 
> Hi Anisa,
> 
> Thanks for pointing this out. I came across your v2 patch 4 only after I
> had sent my patch.
> 
> Your patch 4 is based on the preceding robustness changes in the series.
> By that point, cxl_event_thread() has been changed from the original
> do-while loop to a while (mask) loop, and
> cxl_mem_get_event_records() reports both an error return and the set of
> drained logs. The handler also uses the drained and stuck masks to
> control further retries.
> 
> My patch leaves the existing event-record retrieval and do-while loop
> unchanged. It only tracks whether a supported event-status bit was
> observed and uses that information to select IRQ_HANDLED or IRQ_NONE.
> It therefore does not change the handling of mailbox errors, undrained
> logs, or retry behavior.
> 
> The handled tracking in both cases addresses the same zero-status
> shared-vector case. My motivation was its effect on generic IRQ
> spurious-interrupt detection. Jonathan agreed that this is a cleanup
> rather than an interrupt-loss fix, so the Fixes tag should be dropped.
> 
> Since your patch was posted first, would you like to repost the IRQ
> return change as a standalone cleanup? If so, I am happy to step back.
> If you no longer plan to pursue it, I can continue with a v2
> incorporating the review feedback.
> 
> Please let me know which you prefer.
> 
Hello Shaikh,

Thank you for your clarification. Please feel free to continue with v2.
Can you add me to the CC list for v2? I am working on some prepatory
patches for DCD an there would be a minor conflict with this patch,
so I will need to rebase on your changes.

Also Ben Cheatham gave the feedback to mention that "MSI will eventually
be disabled" as a consequence of this patch in the commit message on my patch,
which I think may be valuable here as well:
https://lore.kernel.org/linux-cxl/20260901002912.958-1-anisa.su@samsung.com/T/#m866a4fdb159553039d8d47b6ee7f2312caa9ed73

Thanks,
Anisa

> Thanks,
> Shaikh
> 
> 
> 
> 
> > Thanks,
> > Anisa
> > > ---
> > >  drivers/cxl/pci.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
> > > index c7c91e8dc51d..8b560cae91f2 100644
> > > --- a/drivers/cxl/pci.c
> > > +++ b/drivers/cxl/pci.c
> > > @@ -515,6 +515,7 @@ static irqreturn_t cxl_event_thread(int irq, void *id)
> > >  	struct cxl_dev_id *dev_id = id;
> > >  	struct cxl_dev_state *cxlds = dev_id->cxlds;
> > >  	struct cxl_memdev_state *mds = to_cxl_memdev_state(cxlds);
> > > +	bool handled = false;
> > >  	u32 status;
> > >  
> > >  	do {
> > > @@ -527,11 +528,13 @@ static irqreturn_t cxl_event_thread(int irq, void *id)
> > >  		status &= CXLDEV_EVENT_STATUS_ALL;
> > >  		if (!status)
> > >  			break;
> > > +
> > > +		handled = true;
> > >  		cxl_mem_get_event_records(mds, status);
> > >  		cond_resched();
> > >  	} while (status);
> > >  
> > > -	return IRQ_HANDLED;
> > > +	return handled ? IRQ_HANDLED : IRQ_NONE;
> > >  }
> > >  
> > >  static int cxl_event_req_irq(struct cxl_dev_state *cxlds, u8 setting)
> > > 
> > > base-commit: 7098e9cd98a05c0c5de2fae0c2465f9d966fdd07
> > > prerequisite-patch-id: 92e40cd60a697020faac475dcc77ba63b33434ea
> > > prerequisite-patch-id: 10027ad5d9aed85806047f807b3a76273b6c4a77
> > > -- 
> > > 2.43.0
> > > 
