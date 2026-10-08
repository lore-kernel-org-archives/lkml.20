Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1469735F199
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 18:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791482620; cv=none; b=CAXz8ZUqOPLoXZFp9KdnFmzeLkJpKR2v68OE0JDUvczL3pL8WR7izfvuG/+cEcGMvS1xZDlIQZdEwBM6lVmoSPSxTLY7FlMyk3zVbbsdOctMSj5z/1AT9zSkFdnIzRILLJKvY/GVlauJ1WqLrPiTFtfYC3T1zOD/3U/Akej3y8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791482620; c=relaxed/simple;
	bh=RZt9QAQENB7zZUZpYhZ2vcQnqjSDXFidqXnP7OXSTr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8BTePfFzdVUVylbuk5ABUhGPtmgGwbDi8lp4oTFP8jQ6gU8gJbHDe6YihgfI1qc622K03PhZXmQE6DBeN4hn2g+/TjijhOV4iTVRC88iFmbHF0RB33PnlW2cHjXBhtk/rfKg2/QHXIJ9h2tHPXCSnl+95aT8JJ6efr70QK2KGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rfua3F+Q; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rfua3F+Q"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-533778ab0bdso34921341cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791482618; x=1792087418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K4Aor886ezFBw+XHcIPSZWt3mTP6dg1JDi34/oYIQ1M=;
        b=rfua3F+QaCeTUKlJ1/30Y5D0U/CUTEKWNdKp+8zsgZK6Sj7DZo6gRq+g3itBkmxQQg
         RcdsKLJJF4dRPXHIDbKYlGGolmLwcPvQWCK3FiX4/WdEADvrN4C92Pr2gdzHtufdKMDI
         qA0a04cRv2rU1utpbmq6mmsC8drnt7UBuM/1cLMIxcXdJrCzR3L5N560tTeKI5tycrMe
         zMSR2FPCt/tCzk9psFhyO4/5oDiSYWQpjeAUh+tlADz6CCGU7Ksw52OY8S6P/dP27tR0
         fVzwKFXsXOxL3Z6D7DmrsQ7ap7E1/jHoc4Qkro00RSddd2GWRIq2H7Dn4rsmPBI/+WBf
         ASpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791482618; x=1792087418;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K4Aor886ezFBw+XHcIPSZWt3mTP6dg1JDi34/oYIQ1M=;
        b=me1C33Kqek/PWo+6aBABynBciaireSw3U8qxgEON5zfq24LU9lNs2hYR0KQ8po+mm7
         5xLJHvcVZWIJA972MD5MVOEai+RZp1BGDaJS/+vSiDizL4/SVJFB5kbdwTEGJbCtRG/S
         7U1q1csqKUVwOVJXl1cxi+pRW+XPl4M7qovwE3yw2pFeAyEWiTmDvf9kIkaIrxCm9suR
         KJVMoQU0HOtoJgR/auuflIjq7JJcc1ZZVAQbY50bv932ZgBsXLAYz/utE4jsTTPH3lUd
         t4en632V/SfDO/VHhROejvnKRbg11PGMcon+eYzt9JombRfafaYrWGcu4/oydOqiah4h
         85LQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTtjwUm+N1o5eQQQARyIAIHkSPXORyK9HZHscmnyO1l5y0jbV2iuVcDnAoj1zzONlag56AkX8uAQ4zrkw=@vger.kernel.org
X-Gm-Message-State: AFuF++lQtnFGmHoht+TNpsFZ+Ed4D/fs+EbWmYKA+1kL9XliqKjTuFFy
	OaCF6wT9uy1juunzzWUlCSoG9SNAfoYZ69Ss3ezrVGxcngXVM5a7zXK6eHC8YFcLkQ==
X-Gm-Gg: AYBFou1JLV9Mz6qUXD3i6DbdJzLkPv4ZuNmdtZnDJsadBRy+vpbVWOJNEBWvXvJ5XxM
	uc4Wx9RbVUBMk45n6smsR+dd1+lIS6Cr8kOUJsxAprIsI0VIxJcSrV6tizpCTYkKlxrD8a9OvVB
	WCUICSuDiEz20aqyn6IsZPJOGn9i15NdnruQ/wx8ERnH8dcfwWkv7UQl+EbVfHrfsOzI99JgEkr
	4XX8fklxxc1D11mm3NQOTXmVwR1Mt3wiNYpsqrUihQEICicaY+6zrLAQuPYU+ZIo7saKSwU1/6B
	gFilyIhQWVh2MRIpObz6UZ6ejjaM7aKDGG+dfDp7JvWnys+cjn2xmS2gNR7Jw94FeLxxrMviLx/
	pDVPzunMO83L+x421WOcuvz7Wl92GgE84/uf9G7CqFnAcrye3bR70J0P+AcZQPwNgIj66EwLlW+
	phqVfPnw/H9Vk0NnKVcLTHB/FrotI0xLvcKFc2ROuTqP7y9JWIr7gotkApbplrcvs+evfFJy+4a
	wF/43bHs8axgNclQvUdgw/dRltIpZWAOgQ6QFsGRQ==
X-Received: by 2002:ac8:5e12:0:b0:535:163d:ad2c with SMTP id d75a77b69052e-5357515d0b7mr111442881cf.5.1791482617847;
        Thu, 08 Oct 2026 11:03:37 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b5199d84csm2476586d6.5.2026.10.08.11.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 11:03:37 -0700 (PDT)
Date: Thu, 8 Oct 2026 14:03:34 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jakub Kicinski <kuba@kernel.org>
Cc: =?iso-8859-1?Q?=D6mer?= Mete Kaya <omermetekaya0@gmail.com>,
	oneukum@suse.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com,
	syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Subject: Re: [PATCH net v6] usbnet: fix smp_processor_id() use in preemptible
 context
Message-ID: <06a81ea1-b17d-40bd-82d9-922de946b86f@rowland.harvard.edu>
References: <20261004215937.302247-1-omermetekaya0@gmail.com>
 <20261007200049.079aeb75@kernel.org>
 <7c4a2f1c-f16d-479b-a11f-cef962d5e2c7@rowland.harvard.edu>
 <20261008094338.301a75fa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008094338.301a75fa@kernel.org>

On Thu, Oct 08, 2026 at 09:43:38AM -0700, Jakub Kicinski wrote:
> On Thu, 8 Oct 2026 10:16:02 -0400 Alan Stern wrote:
> > > This looks odd, how did we miss this for 8 years.
> > > 
> > > Greg is probably busy, but would be good to get a confirmation
> > > from either him or some other USB expert that the callbacks
> > > can indeed be called in process context.  
> > 
> > They can be called in BH context with interrupts enabled.  Is that close 
> > enough?
> 
> BH should be fine on !RT. The patch, AFAIU, is because vhci calls
> the completion callbacks in pure, unadulterated process context.
> I'm trying to figure out how urgent the fix is, basically.
> If it's a vhci bug then the usbnet fix is at most an RT problem.
> Also if vhci is doing something wrong we don't want a truckload
> of slop patches sent our way to fix 300 drivers :S

As far as I am aware, there aren't really any guarantees on the 
context of a USB URB-completion callback.  The kerneldoc for struct urb 
in include/linux/usb.h says "The completion callback is made 
in_interrupt()", but that is most definitely out of date.

Drivers shouldn't rely on any particular context guarantees.  Not even 
whether local irqs are enabled/disabled.

Alan Stern
