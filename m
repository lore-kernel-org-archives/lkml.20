Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165D73B6BE3
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789666595; cv=none; b=ayQpozvPHHiLzu9Qom5dWjWgX8Swc5HhfqbU4+Ip2577MK0JmVSwidW+COKTn4+I8m+V6g8vWyfiE5B1NHmziVfg5+j/4tTlvNV/5P6PpdvG28DBrrI9at9ixvm/cpAYH9wqEzFnrPzdhUuRO3UNceKVzJOCXfA8cB2VIwdkzeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789666595; c=relaxed/simple;
	bh=brPvAVuoXkLTRqscCDH//orHps/ShgXHlWwJteljMYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=suOgnghbOQrV0SmijUWbm808v/ez+XxGmnuCHKUN5ZLpyPMEN8fS1wEXetLHuC1+HRVQ867nQlj43tJGfwPFDuO9jF4rpkD2sc2PmQUJQntVywyJRtTZdfdWGRRvQZtqBcG0Yrb1XZ7XME1Hv+05XVlvKRM3X+A/vksUzEBu7ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TsY8C4qA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HYAUu3Lh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TsY8C4qA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HYAUu3Lh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789666592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wrWvLH4IjkM2V8/F9alR2F7Hm+iUEvocnVY+jEcEev8=;
	b=TsY8C4qAO6wVVYk97I5Cnq8R6tdTdRH8UH9ZbhgIcoGC3Ir8Hbwzq3PcOfZBudeAIghXM2
	T0IyPUTAv+n0ZVwGgGwlRqngpYvM7dRJMPu+08ClqzgcxmYph779IsEXU9YJYfwpEh5L7w
	2vpGLFihORDHAtzrpPexJU9/WEYfIiI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-wVMcqGMnMN22NpACLh1Dug-1; Thu, 17 Sep 2026 13:36:30 -0400
X-MC-Unique: wVMcqGMnMN22NpACLh1Dug-1
X-Mimecast-MFC-AGG-ID: wVMcqGMnMN22NpACLh1Dug_1789666590
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91219341db7so20738946d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789666589; x=1790271389; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wrWvLH4IjkM2V8/F9alR2F7Hm+iUEvocnVY+jEcEev8=;
        b=HYAUu3LhE/TK+jpKsUy4TouVEP/FXytn6GBM8t+ZzK4LwAW7Hh5aCcVn/bDkQZ69bX
         R+JMQVYfzppR+RoK89A9zpkfrptEIuGvVALVfYVvKkixMncoWfoxVH2nsrxGcH/j0Bap
         LJOXKy8Tih+xnvwp3YthE/deH8ukyy/vdrszDa0lV6C6RAKJ/PBu5F+nPHkTtbWJ3Ogw
         wVbbuXci8vL4bEOyBH68mFVIvzBTJFoZCcExRu2pFq4O7OwKpc3EJtvcT+DuK9hLGU6I
         XpjfBTmBirCYekFh/dkLZPaKIo5ibtVknGH4JTua086EfCQgJiivv6GaMAg/hoG2iQ2I
         e/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789666589; x=1790271389;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wrWvLH4IjkM2V8/F9alR2F7Hm+iUEvocnVY+jEcEev8=;
        b=HhOVuNnHcjWDy0JXAhNoPvSDSmW+4BhndN2EgAQNBEdzRrRzQplcKV6Ruy+Z3kY5gh
         zJUHEc16uFCRvikNUhsjAm2RFO6NZ/I/gF8+BZkXe5yqYIMTfZOCPZPRakDEFWdL0lrS
         dTQ11Cgr0KUb3kqzRtMVkYk+51m7d7q22xrFg45IArgooKMTHNjXHtm5oIyVoObSg9IC
         i6IRaIxJYF/dWS4mobHLnB6s1RuJKcldpmUW8X/Y20hvJGCAcsz6QU2gXS0HXmEL7rZv
         BpeMe2L4vYUrBcHqSbUkaEIOdPC2okyKKdkqBtIB0gERhp9NvWsSb2LpHx4udiBX/SYy
         6Q0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzYLiikJm/oaxt5q+mFXxnf61NZMylyad7GvEInhHr9V1J2EmmhDxUaWIXgsmEGmJzKwROinz0Xu5EYbcs=@vger.kernel.org
X-Gm-Message-State: AFuF++kmW6pN+PP0L9/cFkYo9mq6jNA+AXCbBQoYdd/stnFHXrAZfD2k
	zwB96hIfmvH/ELOp/J0UPxfK9sc9aHtUNSn9A1sZtFZ7O+/pGNsnKTgY2sqDdFjeD5CWv9EXIn2
	DGnKUVnOoCOlDiKcTBu8N70XB1cMpJpb7s46k/kdR/4fmc6SzHnKJQasNawRn1AuiMQ==
X-Gm-Gg: AYBFou19Jj34/dVINoMBkIDaa/s2pDOAIWCAUKB6LSRsuRCEcu9Y9jwiGSGG3zluJq0
	BLaYDBf9y50FeEaoXVQJHuKZqqDBMd+Zqz35Q2zvq2syn7PtmkJg11++Qeplnrr+C+lataQqt1d
	LMtYcbyE6d3qJO+4VAZ0qcSIPKdxzEwiD+Hw/i+FbFV8NNAuuqfQFqsQ/WVFCKjVByKVXyl74Z7
	SHudKccrJnijO4jt2Ruqv3pLUqWwDXw8XY0lrTG9PFzEp79NiuwxmWn+xZgyzF1s6CZVMni8RVR
	XjfYAWnaNKzv+ZkevYhzHXDOSv1Bxmx165I8f0DFVG68qUZAkHj0fRHz2rh2vhJPO5DISxyBtk6
	B5KM75y8zKEPHE5D/q9RhynmxPMnC7YegOI4=
X-Received: by 2002:a05:6214:5903:b0:90e:8be9:c384 with SMTP id 6a1803df08f44-9123d7b301dmr154578896d6.27.1789666589626;
        Thu, 17 Sep 2026 10:36:29 -0700 (PDT)
X-Received: by 2002:a05:6214:5903:b0:90e:8be9:c384 with SMTP id 6a1803df08f44-9123d7b301dmr154578186d6.27.1789666589171;
        Thu, 17 Sep 2026 10:36:29 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252c5bef1sm2950686d6.9.2026.09.17.10.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:36:28 -0700 (PDT)
Date: Thu, 17 Sep 2026 13:36:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: disable unused clocks registered after boot
Message-ID: <aqwlG3Rx3MScxNXx@redhat.com>
References: <20260917144011.3014860-1-alexandre.belloni@bootlin.com>
 <aqwO5sAN9qbvK8LF@redhat.com>
 <2026091717233613a5b6a3@mail.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026091717233613a5b6a3@mail.local>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Alexandre,

On Thu, Sep 17, 2026 at 07:23:36PM +0200, Alexandre Belloni wrote:
> On 17/09/2026 12:01:42-0400, Brian Masney wrote:
> > On Thu, Sep 17, 2026 at 04:40:10PM +0200, alexandre.belloni@bootlin.com wrote:
> > > From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > 
> > > clk_disable_unused() only runs once as a late_initcall, so clocks
> > > registered afterwards by loading a module are never checked and may be left
> > > running needlessly.
> > > 
> > > So record when clk_disable_unused has run and afterwards, schedule a
> > > delayed work to run the scan when new clocks are registered.
> > > 
> > > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > 
> > We're actually in the process of redoing the way clk_disable_unused is
> > handled. I posted a series to add sync_state support to the clk
> > framework:
> > 
> > https://lore.kernel.org/linux-clk/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/
> > 
> > Will you be at Linux Plumbers in Prague in 2.5 weeks? If so, come to
> > this talk where we will talk about the clk subsystem.
> > 
> >     Evolving support for sync_state to subsystems beyond genpd 
> >     https://lpc.events/event/20/contributions/2504/
> > 
> 
> I will be at plumbers and I'll try to attend, thanks!
> 
> For reference, this is the reason for the patch:
> https://lore.kernel.org/all/2ce03d3b4cd9cce8e32fe1fe1ffbea5760bf9ef3.camel@siemens.com/

Can you try running with my sync_state patch set before LPC and see if
it works as expected for you? Be sure to leave clk_ignore_unused off the
kernel command line.

https://lore.kernel.org/linux-clk/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/

Brian

