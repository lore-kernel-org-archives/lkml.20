Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792941429;
	b=j1nE2qnYvKUGMb3u+eTTGtL8v2SIv5yH/EyqJaXLDXZcC35+xLkTFDRZa8jrCjRwXt6E
	 cXM0xd/fp/cbyWs6UUAnklyJHwiEeklw+ss/Ms8ghXyzzRhItSd0gQ59/DZlMosMaK1Zw
	 ybZWYg4qzJwZtRmxe9++F+pmtID+gbjBZVqj3z72L95cEm+WwjQdv9VAdqlKshcUJUUyq
	 QAk5leRoA7jqRKOJoJ1Qy72+flb8ly6bIzVDvLHx78v0oel00kTlp0J8zCYRpe73ClcvY
	 c+BbK/Jkja91voONYMkH0H7O0b0EFzTvLYMgewZVKNvxiKkGKrhG1vtx4Gz6SeVKmvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792941429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xuT4b3Ogd1sn4kTuluW41732TPOf5pb8loXXUU48qds=;
	b=niiAWzMFeEixWRUA6mixKPXeSLDtDFNrbAgqbKlV/MsDbTGZBRFNvi9Ic2lckp8Uvguo
	 ViC0puy/4Emh/RhZLS0lR5kO1xPciTIztQWjAXUo+zhXy6rwIAfU0Mh+fBYE1nRvu8fZR
	 A0JO/U/tYgzXleiyBokZVWfc+xaGD1hp66WK5YhUBj7QK6K426c8a1SPYUZXVAG3Zq2JV
	 eUcqR+4vRDhimYWpQWUShB2Y639JbjsaOzv4syJcFV6z1k78jAsJHJ4T65SRv4RdQutIj
	 iiu9x8PcBHFnD6YNHddqCQ+OLEREeAnIEu7qCkg2pzijRxkOCkuCNKNQY+gHinIWDLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=bkhX3K5F;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4E3606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C4E3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=bkhX3K5F
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-917c04630c2so25267396d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792941423; x=1793546223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xuT4b3Ogd1sn4kTuluW41732TPOf5pb8loXXUU48qds=;
        b=bkhX3K5FjsQrft3v3hXQxqYDsSuQznzyGasYeLiPw0fXaiqj12taMq35qXL7NI3cSN
         hlUm/LZwUyjwX15zW7w1wiPTx/xepHFLqWLtyfKSkFVURXGjuSKFvD+X3/PFa2jDRbDt
         50mBJi6EsGzn1/LladRetekFy9+VqpXAkcM5Qq9jHW/fPD3Q4BP0Gadx/TUvpolO+nKC
         UDAF1qWTxf2i0dAymEkgXv1NCb7sboO4Te4RaWSatHa68p4ishuL2T4OlCQ/1554Tm8P
         zGaFI1XMkYnTGilMixj1aDMxKxUv09uJwzo3/gL3OgH+ZHMU6x5NffvYICXeok2Bqyc3
         vY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792941423; x=1793546223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xuT4b3Ogd1sn4kTuluW41732TPOf5pb8loXXUU48qds=;
        b=nOG517UyVcL67t62MYh/4eQYFfccCGeV0KXHgBHgcVAL6fflzpKQh2roz7xmNLQPMs
         LVGw+ZYjTqN+OylDAgICrBYVcWE70yIOXqdyU+IJxoJjpPEywpS3366KLpOwjRVRGg12
         CLqjR8rieiKmz0uFPSXReK0hkyPTPJMHM6WiQQU+oGlGGmKI/eWXh6tVMUren29pko6j
         S4bY0LQe9s7AkdofXki0Y2BqRrqgrYpFQqMhrI+2iZTwrp3cFLduue/qAZovJR7lOw0d
         Lc9djXlzd807T0bpirxLsMz0uDaWBX0bOKreQTkN/oo5h/wKWJcnI5pxtLlJY4Z3aMLJ
         u8Bw==
X-Forwarded-Encrypted: i=1; AKwUvBzAJASP5TSstlapJKcsff7FUsPsUqzy5JS31q+w4CeEyG8zPTdTilkIlU3PMyF6ssyQs60TZWy3KvLdMfo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQrcozKJRckrqWEe1hye4+RwgOHowxwRre7uQxsXA+K3LI8S2a
	P7NT0RrGreZhuz5H36AgDTNtOlrAqON5ptgw9MoDouIdzsxfJyqxUPDc2AbO9+ztQ6Ebn/PIm0T
	LVkEffg==
X-Gm-Gg: AYBFou0+fzci1WkNGDDtE/2FaiVKXkPHLC2Riqs8nLSS0X/Oi0GunaKcFIxiRAfD5B0
	h4TYYc3cI8BVbQWkFlRuqvf1X9kNNfd574N/8QdcfG9JJogKWuoC4wgOi7r7yIlbQ0iSG6T9Ahr
	WuNPy8Cp5RBifAg+XriKbz3qwN/EGB8bhFicxAa0uyG9PshNlkt2GoN3dp/E1m58CTNByxqaBaZ
	PuyYEgegkkSDD/W0xSK0865iwUl0qFxHIsqg/7EmMtiIKe5XTGZx4B3QB2aKB9IU9qtX9eR42NZ
	Dw8ou2fclkZ3r2dWwRyUno+DPXxjBk6azrdHT8/rHyEfoom0F872pnmiOX60edLDgmsyiBDeyKp
	YkfUYz8lwlwu88sUtwKNuNTZfGMEvzGc98HL59Sj810/WMAVQa4znU8mi70jVjxaaIsfP1N9sie
	1GXPSAzqngb1mFaBZnzd5WAuwsqWHwdxebGHkJI66KNFDPJitk/nH3Dpzg3BQfbhJN6KNDuPXVy
	ZC/nXgL4oNUbiE2aH2jlqH4rE5jXoIGoo4dNoB4/H6NQMl1zAsaFncq
X-Received: by 2002:a05:620a:40d5:b0:93e:fd69:9a93 with SMTP id af79cd13be357-940ef8d837emr663389785a.31.1792941423007;
        Sun, 25 Oct 2026 08:17:03 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47cd9dcesm47203106d6.42.2026.10.25.08.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:17:02 -0700 (PDT)
Date: Sun, 25 Oct 2026 11:16:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: IgorpetinDev <igorpetindev@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>, Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+a5b220cacb0618384d5a@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usb: core: hcd: flush giveback work on stop
Message-ID: <76dfb124-d488-45b1-9525-5369026b529f@rowland.harvard.edu>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
 <20261024155614.2732-1-igorpetindev@gmail.com>
 <20261025000643.425c57ca.michal.pecio@gmail.com>
 <CAG21Q83f_Oj5+-OPjFdxzmLWnFkjfYhY9ordyO0zoGtxkWEW3w@mail.gmail.com>
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
In-Reply-To: <CAG21Q83f_Oj5+-OPjFdxzmLWnFkjfYhY9ordyO0zoGtxkWEW3w@mail.gmail.com>

On Sun, Oct 25, 2026 at 10:54:57AM +0300, IgorpetinDev wrote:
> Regarding cancel_work_sync() vs. flush_work() and usb_remove_hcd() vs.
> usb_stop_hcd(): these changes were specifically suggested by Alan Stern
> during the review of v1 and v2, which is why v3 was shaped this way and
> subsequently received his reviewed-by tag.
> 
> I'll defer to Alan and Greg on how they wish to proceed and which
> approach they prefer to take.

I don't much care whether the new calls go in usb_remove_hcd() or 
usb_stop_hcd().  I suppose usb_remove_hcd() would make more sense, since 
no URBs can be sent to the HCD until it is added.

As for cancel_work_sync() vs. flush_work(), it doesn't really matter.  
The situation we're in is that there are no more entries remaining in 
the workqueue and no more will be added, but the final one may still be 
executing.  In this setting, cancel_work_sync() and flush_work() do the 
same thing.  However, the name "flush_work" does a better job of 
expressing what we want to accomplish: wait for the final work item to 
finish, not try to cancel it.

> > > @@ -2787,6 +2789,13 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
> > >       /* In case the HCD restarted the timer, stop it again. */
> > >       clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
> > >       timer_delete_sync(&hcd->rh_timer);
> > > +
> > > +     /*
> > > +      * Even though all URBs have been given back,
> >
> > but does anyone actually believe this here?
> >
> > Hundreds of drivers written over three decades, often
> > without linux-usb review. I don't trust them at all.

If it's not true, there's likely to be trouble when the completion 
handler is called.  We could forcibly remove any remaining URBs from the 
lists before flushing the work item and just leak them (with a warning 
of some sort -- ideally, one that prints out the names of the completion 
handler routines for the leaked URBs, if at all possible).

Alan Stern
