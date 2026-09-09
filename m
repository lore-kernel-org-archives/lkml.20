Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD1F58039D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 16:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970398; cv=none; b=kLzA83ysRwje606tkhSo1O9BS9Bh2QwEu2ZbuP7wUFsU4wO0e1edaTozH88Mz73GvYY0HXnSZvoWIchdnYVLkViilqIlZ+Z1G4Mf0bxg7dB+ptUf1IDii+zzFaQYRq6GwsnfjmUQQEfo+Uu0JYVRtNq/FydRq4XUwgwaKMEL/b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970398; c=relaxed/simple;
	bh=1ESqAkkqAjSoZqYEovQ0IBOnOQAPI47Oq76P9Cmeu5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GwlQolP/hrbo5PLEUg2KvXVXfmNfe4mkBd+3ckGnqZlVHESe2U331xgNANrhqg2LpYLK6FNjTlUsVYHyzBPafwrqjjMlwZDSG/suYi9MOnGNdM0NPrGhkhUti6Fx83mEv2iFH0/hvb+hrOsTqtNj3chn8dQ7t+AGUSZAMZ5wNMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkQfVJtB; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkQfVJtB"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8623e5d435cso629634b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 09:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788970396; x=1789575196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jk2c5dJslDfaOEX76fe66jdOW7TGIr7zCPO0fmbHT9k=;
        b=jkQfVJtBFj0b13NOtdTYtiWEgpZo3uB9ggySOiNKhJJml/fN2YIMwdU7cKV7dZ12D4
         ca0GyLYGSsmiqgNEJZVVyp1EQdyCjWvT8v0QEKmHnPdtaMqXhfBk1YIib+3SKT1iNJCB
         TbkXuCID4/6/KfgwsZ78UlUsXQYh+AvKhbinyHgQyaiEcPPHVMitGkUGkfbWK7VcfJdL
         i/TIFeI37V1J6eEzREtHess0kRzV17z9qjBl8k5VOnB3EasPgWPZhhZ4UR8K4Zeoj+jW
         W8U45vnCsoGbBQ3KYyjR1V3y79EqesvivrW81OE3uwcpZgMPmip977Jf4QUREOR5KaHZ
         wVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788970396; x=1789575196;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jk2c5dJslDfaOEX76fe66jdOW7TGIr7zCPO0fmbHT9k=;
        b=PZlNGNFLC8OYIHeP+gBq5ZQ7XyRUoHIY1mRPu40T0Oh5yxVhplYhyJhQn+XznduLKq
         8co+Ki8VH7qHUmfrCsJhu+ZdB1uViLVoLz5KRLtVsgrdpbjkZyK8D3UPZqIIOr3hmizs
         2fBwIc8YXFuVZ6ZxkPhoQUd7L9C6Iul4v89n3s+d1KQVml5OoxTF9wFVuX/F0z8TPlND
         usBwjrwkpuc/KIyS2ALAAEW4vJJZTDiemWysNx4rX08LHw00QOGOZSuyNQ7asPFGhXZ1
         e3ucpY8zn1mIkIVIiLC+CNgaDsE6H3ZAtJQWOmJWHGeLEgejC3u7b0XRJ+sTWsf1HyCp
         AiwQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6dwNLK/3pSC7z3yW7/3S2KCB5+J91QtVfH0AnyklPWYvlWqt/M42WGXnLZm+lrQ09ckTzPtxn0ihUjw8=@vger.kernel.org
X-Gm-Message-State: AFuF++licwQ4nsebcd7JDpnqJDeYZTbh3MVrQ1dr+1n1h8godJ1iNbqI
	7ZH4Pf3a63Kgm+LhmxPKLETc7cCRe29yfKNcGfCRHn4b2/P+TRNTEcrc
X-Gm-Gg: AYBFou2Mffcj6KyWwUGWWsURrcZQ7fPzxBvOTDtGfpO/RGHTMUkH7IiQIL+MvyMcCya
	MdhdGHLe/E7u+wX3pA6PYYeR/tyG8c/jN1T9YA1PVcAiiuuj+EocJU+HMFTK5xdNaf5xgMd3Gy0
	Uoh4IjZ+mjYUN4GXXOkpKMgcXpFFZk2MhCe8WQsFmuJCwFvsDRJ6C+EHIE0gg31DEns5zKcj+lj
	i7e9NbHaNUxJTmPykaVHMTlSXzz8+iXj3R8kWCxpvdg0vGPU457FO0Gu+dFR6+4kf1iBbYuS+BQ
	2w+GzQiSLBtmgsZHsHTTcSTZHk6a54RfYuFwbBSF1MTPQc/UwqphTx6dCf6Gs2lZPpnAn/iBR0c
	R95GWPWoj3UXguUyD/Bl+hznvrvl9Dxj0983fvn8X+bx04w2D+ubZgNre1XFycqlF9V3yBIvDCq
	cmIL04MUL5USfFTwZzmGbRtlLkxEGYbOfmHv3LKVflhEWkzEj23eGm30rI/9GFTig5WwyEj6I8Q
	A==
X-Received: by 2002:a05:6a00:3c91:b0:84f:6f7e:493 with SMTP id d2e1a72fcca58-869b09837c1mr46365b3a.3.1788970395785;
        Wed, 09 Sep 2026 09:13:15 -0700 (PDT)
Received: from localhost ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-868e3aaab85sm1054060b3a.22.2026.09.09.09.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:13:15 -0700 (PDT)
Date: Wed, 9 Sep 2026 21:43:13 +0530
From: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>, Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cxl/events: Return IRQ_NONE when no event is pending
Message-ID: <aqGFmaOMKMdInTWN@acer-nitro-anv15-41>
References: <20260906155705.13252-1-shaikhkamal2012@gmail.com>
 <20260907194824.615e47ff@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260907194824.615e47ff@jic23-huawei>

On Mon, Sep 07, 2026 at 07:48:24PM +0100, Jonathan Cameron wrote:
> On Sun,  6 Sep 2026 21:27:05 +0530
> Shaikh Kamaluddin <shaikhkamal2012@gmail.com> wrote:
> 
> > CXL event interrupts may share an MSI/MSI-X vector with other event
> > logs or device features. Consequently, cxl_event_thread() is registered
> > with IRQF_SHARED and must determine whether an interrupt belongs to the
> > event-log facility.
> > 
> > The handler masks the Device Event Status register to the event logs
> > supported by the driver. However, when no supported status bit is set,
> > it exits the processing loop and still returns IRQ_HANDLED.
> > 
> > Track whether at least one supported event status bit was observed.
> > Return IRQ_NONE when there was no event to service, while continuing to
> > return IRQ_HANDLED after processing one or more event logs.
> 
> What is the practical result of this change?  
> I think it will only affect the spurious interrupt detection so
> to me it looks like a cleanup rather than a fix.  Is there
> any path by which we actually lose interrupts as a result of this?
>
Hi Jonathan,
No interrupts are lost. I agree that it only affects spurious
interrupt detection.

When note_interrupt() receives IRQ_WAKE_THREAD, it sets
SPURIOUS_DEFERRED and checks on the next interrupt whether
desc->threads_handled changed. Currently, cxl_event_thread() returns
IRQ_HANDLED even for zero event status, incrementing that counter and
making an unrelated interrupt appear handled.

Returning IRQ_NONE for zero status leaves the counter unchanged. Another
handler sharing the vector can still claim the interrupt; otherwise,
note_interrupt() can account it as unhandled. Normal CXL event handling
is unchanged, so I agree this should be presented as a cleanup without a Fixes tag.

> > 
> > Fixes: a49aa8141b65 ("cxl/mem: Wire up event interrupts")
> > 
> 
> No blank lines in tag blocks.  There are a number of tools that rely
> on there not being any and as such there are also scripts that run
> on various upstream trees that will send us annoying emails if this
> blank line is still here!  I'm not sure why this mistake in patch
> formatting is so common as there are plenty of docs without the
> blank lines!
>

Sorry It was my mistake

> > Signed-off-by: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
> 
> A suggestion for an alternative implementation below.
> 
> > ---
> >  drivers/cxl/pci.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
> > index c7c91e8dc51d..8b560cae91f2 100644
> > --- a/drivers/cxl/pci.c
> > +++ b/drivers/cxl/pci.c
> > @@ -515,6 +515,7 @@ static irqreturn_t cxl_event_thread(int irq, void *id)
> >  	struct cxl_dev_id *dev_id = id;
> >  	struct cxl_dev_state *cxlds = dev_id->cxlds;
> >  	struct cxl_memdev_state *mds = to_cxl_memdev_state(cxlds);
> > +	bool handled = false;
> >  	u32 status;
> >  
> >  	do {
> > @@ -527,11 +528,13 @@ static irqreturn_t cxl_event_thread(int irq, void *id)
> >  		status &= CXLDEV_EVENT_STATUS_ALL;
> >  		if (!status)
> 
> 			return IRQ_NONE;
> 
> And don't need the other changes.
> 
> >  			break;
> > +
> > +		handled = true;
> >  		cxl_mem_get_event_records(mds, status);
> >  		cond_resched();
> >  	} while (status);
> >  
> > -	return IRQ_HANDLED;
> > +	return handled ? IRQ_HANDLED : IRQ_NONE;
> >  }
> >  
> >  static int cxl_event_req_irq(struct cxl_dev_state *cxlds, u8 setting)
> > 
> > base-commit: 7098e9cd98a05c0c5de2fae0c2465f9d966fdd07
> > prerequisite-patch-id: 92e40cd60a697020faac475dcc77ba63b33434ea
> > prerequisite-patch-id: 10027ad5d9aed85806047f807b3a76273b6c4a77
> 
