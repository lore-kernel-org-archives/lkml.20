Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835EC51E436
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569042; cv=none; b=lLC3zBrJ10fRXLQIvsfx/ZHTjauZYDLB+uhEuHcNHt1PNj3ejNv5/ZFARLaM5HLvqaz+xY2OXtDI6x3QIXtu1cOtMqO1er113gB3kkZPGv3iCtoUnO73g9rbWSLBg9e4j89zUnDveYn+6g1PmDlrey5eBMhfQoG6BxFvQnuzRiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569042; c=relaxed/simple;
	bh=n50EDLBpp0PcLVpFQaOjQv7TAzbBAn/fBTN5CuZ51Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ph5aI0Ivojj6guIpgSxK6gO8m5gFxUb6HIF42LPNy3Plc0F/3hYQWDWJMpEn4bEna5VujYpNz0HPhrJOwi4fO2DYkjhGVpUsqWz4pQOEBmF1HZ3VteOWDlh73MV+zYDPjVoArMqnjsSMNVNcEIPnYFXhmc3cIwatPSrXogf+9dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=egE/5NQz; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="egE/5NQz"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso890119a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569040; x=1790173840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vAIxdcn+2euFFjhYmCcfT0OwZlA6a1v07ZRE8SeJ058=;
        b=egE/5NQz07o8f6MlS/eWFB13irJak2X01K20lnHxBmmobkH2i3Doz6rTLAsAHwNre0
         12VNT8cs2NCcv9rGWNhxnU9QuJFVfJc6mCtEwKzwRf69CWZvvzIQodSHv9I7OWlwcW2E
         PJ5OFvmHVcCtC/jpZDB3jRvtfS1CG63Ms6VdqWx/2ABi/+aPcOkxd9T2S4Z+RFr1gwrQ
         kGVpx+hAhTnmxXSN7Nls0p41n0MGFA6N4vhKaQJH2Spprl4zIjc0f9CPsiYg67AfAGfD
         LsZ7NJkHVMepyOVVjen2fTaa4//m9H27PVOjwDUIgAA3q/blKVskdc1JPM23ztBfaVfl
         YDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569040; x=1790173840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vAIxdcn+2euFFjhYmCcfT0OwZlA6a1v07ZRE8SeJ058=;
        b=YH8ERuNZv8EeNEaR5XiHgW8tyvDLLuj/Y/5tpzBJNYW7LpSr/mm+opMIchfNNtNHJE
         oCeEij1q6Qdl4hTwBoGTThaxp09v7m8LeqqzC5UNDbCpuNfs9tWlSW2qEzQEhIAT1dLY
         1IB/d/gidmSWQ+E8lolHdEz6VGPAuDDuS76tmJZ4liQrKnTsuaa9bxfLgooQWztLx0vT
         pmb2kh5PhmLeA/rY5KYRXJgAN7SxsWDFxJEKZhjmsmJGlNwc7TNLaIHnb+H4IqLkx29I
         t+A+M06lptgBuUB5qmM9KmaPGrfWvlJ0Q8IzFKzJgvPF7PVq7lXN6AWE9IGXvJA8l2sE
         8v2w==
X-Forwarded-Encrypted: i=1; AKwUvBz614b5g4yWAQpKjktkMwAUkL/tpN2IUMVLuX/r3jJrtrWswQ48I0EBv6BLKTcixWcVxuAIZ7PGcFWChU4=@vger.kernel.org
X-Gm-Message-State: AFuF++lfudJL3Kq5Qd4w9uFxJ8egruxuoIgmbtlXK+bs2RgtZTQBtbs4
	wHBeA+vH/NRuY9OLgn/VYVzU25eDFhnKEVDxRlJBIzSXEtvfX37ZNtn6
X-Gm-Gg: AYBFou2qDSvQob8WN4iIQ+f63/vTABPoUh94r6EWjWzc94L7+tXkxYOVBMQwPLXK/6d
	VlDfPsO2IychyXg/yKrvEnTrIKS9hPoItGvB6Pp1ouosbwl/h1J38+ET5YNfGYH9oPcIYhCMLCC
	5VuLGKLgqjZO6OEdeezvdhk/Fz/1JZ4ID6jpFua328RBR/dQ3YhcRETjxJNoyr/BDIHD9AM8MPl
	c6prLfF4zfVnMj9420S+DrIm/ID7bWsavwikmWUsCd9Zj7HwEhwCy6vCBBYbjntHy4JqqbZoWns
	a/VfLzktQUcfHAWglaj8reLChmKg7CUiMM9jMXOSGmocKiFa99lkYN3kZi5sHIPFg4Jjx/5rrus
	jfUT9hl6lxjGi61jNwGKmhFKfQNjXCoQTQj+YJC11GIldV58j9aLF9S/2LKHrBx6rDrENjpkj+K
	nG9S6iCCFrT+hyfwKwpx6dBLgcQYm2MSFwKn9fxq+81hdDnalX+PRuVt+4rSjStz8MihxD2vmIF
	Q==
X-Received: by 2002:a17:90a:1c97:b0:39e:1fb6:9659 with SMTP id 98e67ed59e1d1-39e1fb6994cmr4255054a91.22.1789569039499;
        Wed, 16 Sep 2026 07:30:39 -0700 (PDT)
Received: from localhost ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab51c2csm1747149a12.7.2026.09.16.07.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:30:38 -0700 (PDT)
Date: Wed, 16 Sep 2026 20:00:36 +0530
From: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
To: Anisa Su <anisa.su887@gmail.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>, Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>, benjamin.cheatham@amd.com,
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cxl/events: Return IRQ_NONE when no event is pending
Message-ID: <aqqoDPmG9lfDNAwc@acer-nitro-anv15-41>
References: <20260912093815.14455-1-shaikhkamal2012@gmail.com>
 <aqnlDSdofHDUNdiT@cxlqual>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aqnlDSdofHDUNdiT@cxlqual>

On Wed, Sep 16, 2026 at 09:38:37AM +0900, Anisa Su wrote:
> On Sat, Sep 12, 2026 at 03:08:15PM +0530, Shaikh Kamaluddin wrote:
> > CXL event interrupts may share an MSI/MSI-X vector with other event
> > logs or device features. Consequently, cxl_event_thread() is registered
> > with IRQF_SHARED and must determine whether the event-log facility
> > claimed the interrupt.
> > 
> > The handler masks the Device Event Status register to the event logs
> > supported by the driver. However, when no supported status bit is set,
> > it exits the processing loop and still returns IRQ_HANDLED. This
> > incorrectly reports that the interrupt was claimed and prevents the
> > generic spurious-interrupt detector from accounting it as unhandled.
> > 
> > Track whether the CXL event handler claimed the interrupt and return
> > IRQ_NONE when no supported event is detected. If no handler sharing the
> > vector claims a sustained interrupt storm, the generic spurious-
> > interrupt detector can eventually identify and disable the affected
> > IRQ.
> > 
> > Signed-off-by: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
> Reviewed-by: Anisa Su <anisa.su@samsung.com>
> > ---
> > Changes in V2:
> > - Emphasize that returning IRQ_NONE enables generic spurious-interrupt
> >   detection and drop the Fixes tag. (Jonathan Cameron)
> > - Check whether the event interrupt is already disabled by Anisa Su's
> >   patch; no code changes were needed. (Ben Cheatham)
> 
> One thing I want to correct: The change requested was to say a
> spurious IRQ will eventually be disabled in the commit message, not
> check whether the event interrupts is already disabled...
> See https://lore.kernel.org/linux-cxl/aqLZP3ORYzCLfSgR@acer-nitro-anv15-41/T/#m32c74ebf05eee9a3ee49c57dd24848db29919031
> I do see that it's been added to the commit message though, so no need
> to do anything.
>

Hi Anisa,

I got your point, yes commit message already covered this.

Thanks,
Shaikh 

> Thanks,
> Anisa
> > - Rebase onto v7.3-rc2; no code changes.
> > 
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
> > base-commit: df2908090cda368b01ff43709f51890076c56157
> > -- 
> > 2.43.0
> > 
