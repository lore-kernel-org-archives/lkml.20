Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B9844F563
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 18:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089375; cv=none; b=WWHb5i67UEv6Zse6wHHjNCdfwmY9/F8OyuukkwI6oDZK2QiPFasntEReFlWaoW69cS3ZOmehAykIorPcegglxRkUMIt9EZqxAybanNF9BoHAlIcP6jPwbA1ZClUqL4Iizp3r6v6JTUZ1XN9LxHAbpEna3X0sZGsAdFJiWO8J9Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089375; c=relaxed/simple;
	bh=TLr1LucY4VL4yVUlVTB823ltLyltwTY+iKWipUNEIeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqTc5q1MCaWlxv70nJlHpHtPKibtHoBuofvVsDARRHIt3qFLgOGosaEZKIqnz+gIhMEbSpe+q/v2nRyoYB7aCHBAvCTxWtLtmkTFB9XBsL/tLpF1gB3IunWiptECGrf39/mal/H/HK9sIJ31nY/nGU2utSb1o1AeDvcFs7w6SnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qYPQjXOH; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qYPQjXOH"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5351e6a2230so50591121cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792089360; x=1792694160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gGaEJMGgzicXp76y7CRrNxXTeHLUaqluIVRvG1wuFn8=;
        b=qYPQjXOHuQB2vs2NHK4FzYC1bR9UJWakETapKJVVZTfWqLNj+2se28Xl6ZfvK6+3ik
         MN6cJOzaFA4SRGAcbgOXL8CivmqCkk4C0oeINrNAUlXL82sLF0dYdvgx6dD0FW6+WYIe
         n9E4Bo7CS2EhBtRdcBPCPiu8pwtoL168ofHstZDftYvARmK7crKH7C+AhXqd6z6n/Xd/
         dVj5E776XWZX59sGqjqkNxxNrFfaMI4GCxQ4E/3OsGsZXNpVhnVD1rv4Rjz+2/JLhTZ9
         hn5FuElae3cTBETRxwalr6FNHWoYDx1EWF6Jm5umevwGTyYykjwm+PEiNhHEIFb5jaSX
         ZCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792089360; x=1792694160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGaEJMGgzicXp76y7CRrNxXTeHLUaqluIVRvG1wuFn8=;
        b=M360QlHlxAhi76FmjdqTyPlfUiC8YR6rMEeWHnhhd6Rj2Or7qmhplhcw5P0aH5SlIh
         Gkbj8texUrHsL+JcTiRPVTvmM8fquo53TMeFTx23YOAMQYBA6eXhdSmoZRXWGHBkyEc3
         f/MVHZDAu3yt5/FyuZmuVRuLQ05YdxsqO9YBUbQmaqZhyCZQSU62+yaMoOYE/D7mNDuP
         lpL4E8FteO5ICJNC97TfI004AAIW8Mf+5YgRz+uyU5purz/uG/ZPB0/kOTmZuYITgfmP
         8u7wxvdB7DkS+qdTtbmvI70uvTr4pAyGISzae95stlFC0qvzUx+grc2zujq9DmF0/Spx
         0sGA==
X-Forwarded-Encrypted: i=1; AKwUvBwHvS7hrfWlmr5OE+fudb76tGnrJfiGMEZJ46m+pk9oTgfSeLHIo/M9dQKZraINRijp60kDQaTbDPX1vBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWNp/7MBAYnduxkXMsdSVDME/4CUyC/+A8dsx7PxS86W7NwShU
	bNZZL0ExSYx41G0j+NQPzZwoZ0tzUlLI9BS9dSQfBdzoL3xkoEtH/oQDwG+/vUKtwA==
X-Gm-Gg: AYBFou3oJ9qTbvCVWZllxciWCoFuwqcbNGI/AF78eorBUNoVzetJSisEC65w71XgRJK
	6cWa8eh9i7NMBRaOyg7FX7jMYEGpHFP9hvIyXRzVQGt1J6gg+7OUY38qxROOEvuxTkLp/crmryz
	rz11qj1knXXI3776f+MN9VVUZkXN+O9poqDZAZ63+59DLDHQ7g8zDitwwvHilmWJ/OJyojeL+iC
	MDwUDrcT7ddcilFFkPGAAjZVoMzdsFSv43oqtFIpF5Nyp2s6zLWKC3fSHpWvPU+vL+IT8k662fm
	noRFD08eO+XjyhsDosqeu+HZo5NSe/np/VcTvxWZf/qi44NFFaD9WfMpvqqIyGBurwxivKCbXZ6
	kE2pY+4EkPs2QVwMp/zfSN2QlEsWDTb8tjAA7m+q4hQ/ibDhNMv/kP254u8v0dRWRIOj4Ymzx44
	VfMQKeYGF63VDoXt4HqGgwbjDsV+RYabAQ49Q9Jd/4xdwu6gUgzlrz8iNKuqVqAGnFpuCPK4VGr
	88SIdLtNNhkQWLwaCTSH4AcPXbbAgvlzIQealk+Ow==
X-Received: by 2002:a05:622a:90b:b0:535:85be:da8b with SMTP id d75a77b69052e-5359fe01121mr316645821cf.61.1792089360229;
        Thu, 15 Oct 2026 11:36:00 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a9bbad2sm192231cf.18.2026.10.15.11.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:35:59 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:35:56 -0400
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
Subject: Re: [PATCH] USB: Documentation: Update description of completion
 callback context
Message-ID: <7494e770-518f-4866-87e2-5a525af3b82e@rowland.harvard.edu>
References: <2026100910-petition-embattled-94cb@gregkh>
 <20261012194902.aEq58Q6b@linutronix.de>
 <8545800a-a37f-482a-9b06-cbdd70312b7a@rowland.harvard.edu>
 <20261012212527.5sFqlGYu@linutronix.de>
 <41af30de-4725-4913-9ad8-54d1dea2d4b8@rowland.harvard.edu>
 <20261014191141.GxlJhR1e@linutronix.de>
 <89da3b1f-60e5-4f18-9592-3d6d7175c437@rowland.harvard.edu>
 <20261014220403.R38Gf0pW@linutronix.de>
 <de582feb-a0aa-4fc8-9818-890014de32a9@rowland.harvard.edu>
 <20261015182643.MIjjSTAr@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015182643.MIjjSTAr@linutronix.de>

On Thu, Oct 15, 2026 at 08:26:43PM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-10-15 12:00:46 [-0400], Alan Stern wrote:
> > The existing kerneldoc documentation for URB completion callbacks is
> > incorrect about the context in which the callbacks occur; it is not
> > always in_interrupt.  State explicitly that a callback may occur in
> > any context with no guarantees, and likewise for the status of
> > CPU-local interrupts.
> > 
> > Documentation update only; no code changes.
> > 
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> 
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> usb_hcd_giveback_urb() kernel doc says: 
> 
> |  * Context: atomic. The completion callback is invoked either in a work queue
> |  * (BH) context or in the caller's context, depending on whether the HCD_BH
> |  * flag is set in the @hcd structure, except that URBs submitted to the
> |  * root hub always complete in BH context.
> 
> Do you think this deserves an update?

I think that's okay as is.  It describes the current implementation 
pretty well, even though it doesn't mention the lack of guarantees.  If 
you feel it should be changed, let me know.

Alan Stern
