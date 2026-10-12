Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3923F3283
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791836795; cv=none; b=k9MHjx4c5msm0ErY+KH3Ru62Y5/Si6rS/af7pLuND2FcQ5qJxDjCJIvCcS+78vDThejlhlT2MXQ3t/pzJtIX3a6TyfyFOOmwEl6QgoDeqDTCETNUWEclvdMxx5520FzVIP12bWVdDc/dqoIJl60rK9wTGjZG2hPdVeRj9sTXQNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791836795; c=relaxed/simple;
	bh=TmbCJD6b1HS0t5QfHnVQZEbNYoXTp7LevXITI0I7LAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5RAJPlxzbKpuKEIwCXYooLhzOJLrz42jaqum+gwY9+qsiJbQiAszMNzzK+VySnAczEsDJFKx00OkZvKevaEJwfwwcbm8CEoLQlIu3O8x62ud3Dr0C1+HxBNPmW8S8MWy1hvCsj1mH7eTpzS5nKFqff8LOJsIjocjnnlmc7V+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=oao5b89w; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="oao5b89w"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91b64fb6010so31298126d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791836793; x=1792441593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wNQIu44JCi003fPRYl0iEpsbAlOqdcmn83C76AdGLFg=;
        b=oao5b89w2RCEsW6LCXIRoF5jEv7/FZ6Gj9tO4Wnib/shZ52Z27HcUDvMo34tuan8m/
         50rJX79HMvVWjepZqPMMkMJPj8HhmGsg/BQuzK1N2unKLDb5CLFU8yoKl9Pe9eyWvqbN
         GCnjjZbApjtvOwLuk0rx6mRmL+KPSGGzqxZsrfanDCM6TemxC5dU4uIjo4UVHibBSHqt
         v9VaFSzK+sz8L6baH5sPVA5/P1C0EeYL41AeanYJb+bOZIHmampn6BQEhbwwpci8+qcl
         L3hp8Wj1FZ6XVaTiVpBwr46MA7//FisNxPcSU3fj/ceJfnDAvQNVXCDkWLwRX+ADL0O4
         usNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791836793; x=1792441593;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNQIu44JCi003fPRYl0iEpsbAlOqdcmn83C76AdGLFg=;
        b=poYtvspTnFyfp/vZSXfpXvxM5CUZW8GuBxyckuXNcOvclPkDEdswGdEOsZ0PqXXDoq
         Rqi/JBNHO3C75RrbMvzugyRHY/NykZIyGuRhnwX6DinB/eRXzV3hQkk536IQyFbrnqWD
         sBl1lKItiz3ClLxGsm5Km8NPoc88pG54ZsImUmx5g2YonW6F83GBW1HV3cWwLZ2c3JLG
         tw68b72D4hsNFZltxWVzOZZNpw/IhLC3FLVRp/Ix3cVMMYkMDDdaY5wEwKLQfTzuieAs
         T+c/lxSWGMaaUuHBq5CcZnA6aJZsuuObvoOiU2wl708ZeCmZbuMTkO4KMoqAxh5M0PCH
         OLOg==
X-Forwarded-Encrypted: i=1; AKwUvBwdyiXR5NeMjOdxbObqFfhU4HFDly+s1n2AKBgvajtuLtGfm8ewZyODU/fFdjZICfLSMw+UyJu3dvgMPrI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkQ5/+pzuofsi2MRz0wXki3wJdTeBbTTc+c1yhzN9V3KcHNwnd
	h4pJBaq1sly3TfB/Nntm2LxUi1adbhx3NgUAQXTu8BGRmNi1TtVLMdS7cxMVD/RGWA==
X-Gm-Gg: AYBFou0PTVeA+A6aCZfPHi6/mLt7H/U/dXhfd1/qLeCxPNJLV6b926LfJGisF1NY+QF
	Vl8tE+IeiJWitX/smw5llbzmihLj7o+7MtHjrAw8EI4zalobWpTtu/3lJPUCccb4xR4PxyB/yz5
	3kAeGM9WlY8B4zMdfI5dO680nZ6cQF3H0h+7A5GM9xdbrtbbV77m7zRveT6U1H4sNUhmPpaSm9z
	G9C2TVPow/lXY5tyz2XniBcQwvH2GcqHMOF3iYKewrSHtCn6QJKrnEjJAAYSr3WswW92s7G+RO4
	4cF3oNSEgOrBdeTZlte00TRYC1KOl2JOydFCCL1yZocU2fJ8e4zUQvlkZLsUW2pdaESEDfQqCQq
	UPZAXeQTcwDGCE8+IOyChAW+QpvfCp6cdoZYjmh/gncJSVvDQwPwxsVPSw45eZM0s09jm+0ou4l
	L/05mfpgWHLhUALG9SrrVpepOEqWkjtaQ8c+F8XUwPrdHDundpCK+i2CC4PxnLkDkRXsda36I8E
	bXGyYub6A==
X-Received: by 2002:a05:622a:148c:b0:535:8d35:6355 with SMTP id d75a77b69052e-535a6073d08mr165366511cf.5.1791836792690;
        Mon, 12 Oct 2026 13:26:32 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b76b030sm87256001cf.17.2026.10.12.13.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 13:26:31 -0700 (PDT)
Date: Mon, 12 Oct 2026 16:26:28 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	=?iso-8859-1?Q?=D6mer?= Mete Kaya <omermetekaya0@gmail.com>,
	oneukum@suse.com, netdev@vger.kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	syzbot+04cd90bb99c6ef81a65d@syzkaller.appspotmail.com
Subject: Re: [PATCH net v6] usbnet: fix smp_processor_id() use in preemptible
 context
Message-ID: <8545800a-a37f-482a-9b06-cbdd70312b7a@rowland.harvard.edu>
References: <20261004215937.302247-1-omermetekaya0@gmail.com>
 <20261007200049.079aeb75@kernel.org>
 <7c4a2f1c-f16d-479b-a11f-cef962d5e2c7@rowland.harvard.edu>
 <20261008094338.301a75fa@kernel.org>
 <06a81ea1-b17d-40bd-82d9-922de946b86f@rowland.harvard.edu>
 <2026100910-petition-embattled-94cb@gregkh>
 <20261012194902.aEq58Q6b@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012194902.aEq58Q6b@linutronix.de>

On Mon, Oct 12, 2026 at 09:49:02PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-10-09 13:31:17 [+0200], Greg Kroah-Hartman wrote:
> > > As far as I am aware, there aren't really any guarantees on the 
> > > context of a USB URB-completion callback.  The kerneldoc for struct urb 
> > > in include/linux/usb.h says "The completion callback is made 
> > > in_interrupt()", but that is most definitely out of date.
> > 
> > I don't think so, I think some platforms still have those callbacks in
> > irq context, unless we changed to threaded irq handlers everywhere?  I
> > could have missed that, but we should still write the callbacks to
> > assume that and then we should be fine even if we aren't in irq context,
> > right?
> 
> The HCD invokes the completion callback usually in IRQ context. I think
> the VHCI is an exception here.
> For the forced-threaded mode we disable BH before the IRQ handler is
> invoked. I think even dummy_hcd invokes them from the timer if my memory
> is right.
> 
> > > Drivers shouldn't rely on any particular context guarantees.  Not even 
> > > whether local irqs are enabled/disabled.
> > 
> > Agreed.
> 
> I would suggest to make VHCI invoke the completion callback with BH
> disabled. usbnet's tx_complete() does also defer_bh() which schedules a
> BH worker via queue_work(). While this works without disabling BH it
> leads to waking ksoftirqd and an additional context switch which we
> could avoid by dealing with it directly.

Today you fix VHCI, tomorrow some other virtual HCD will cause problems.

Should we document any requirements that all HCDs will have to follow 
and that all completion handlers can rely on?

Alan Stern
