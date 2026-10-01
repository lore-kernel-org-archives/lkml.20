Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794BB3CB907;
	Thu,  1 Oct 2026 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790853360; cv=none; b=FsSqMDXN8/ulyXZaPqnq/G/+38o6l69wtiWlFU+SBHpUBONCXSX2Ak8qcKE9kEw4vvT2IRHdD2N2jAZ9RVBKhnAqAhsCLfiX4jRUAqdJi2ILtFKYcYdcqSZcdVlcWVE6YvbRar2FPJastfg73WbfPFVe5ySfm/Ajc+naPhLueYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790853360; c=relaxed/simple;
	bh=jOJZ0P93xMp0t2GKwCYo6KG+MJBe/0K+g0bOhuv0c1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuBbt8aE5Bnt2FlhWI/oZCgIQj+bEEhuUl0kbg4c9btfOhLiZ+1wo/5jN04HyF9nUTyrWQVTH/A4Na0eWmywXRexEga5RNcAcIxXeLWHzK7ViS/kf5cwk6eFmxfkjDByCmEjRdILEjfb++sLIm2FCbOigBeJSKUyQ8ZyNbgStHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OT6cuEbs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OT6cuEbs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E151F000FF;
	Thu,  1 Oct 2026 11:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790853359;
	bh=8+mMEw8xzjGpP1iBjW8pnSqmA16raOzA3e2BJpOALxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OT6cuEbswuqduGHmAcVVc46vn5JvF1++5pG6RqZRhgKTpsNh6ADmm7Be9jzQWnhtz
	 /ItUwE8yCsyeBEkZy6RkW30yPzQbO86K6G9Dk/MkPEKnOuvHyCDXLByt8OpwIDNVnU
	 djgbRrbI2FC20Pm/JlZlpSYr8Heqiyx/MRLYxMnU=
Date: Thu, 1 Oct 2026 13:15:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: make rtl8723_dequeue_writeport()
 return bool
Message-ID: <2026100140-osmosis-easel-30bd@gregkh>
References: <20260926105827.3760-1-dennylin0707@gmail.com>
 <2026100145-unbitten-playmaker-8ac5@gregkh>
 <CAGEkeHd__+Vc9cUuYwUWcnjtBEGU-Lt58TpEnHf_dQGQpUErdw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGEkeHd__+Vc9cUuYwUWcnjtBEGU-Lt58TpEnHf_dQGQpUErdw@mail.gmail.com>

On Thu, Oct 01, 2026 at 02:42:47AM -0700, Hungyu Lin wrote:
> > Please change the variable that is assigned to the output of this
> > function as well.
> 
> I changed queue_empty, which receives the return value of
> rtl8723_dequeue_writeport(), from u8 to bool later in the patch:
> 
> > -       u8 queue_empty, queue_pending;
> > +       bool queue_empty;
> > +       u8 queue_pending;
> 
> Were you referring to a different variable?

Ah, missed that, can you please resend?

thanks.

greg k-h
