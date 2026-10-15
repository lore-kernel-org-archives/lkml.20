Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A6B3B9D8B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792045938; cv=none; b=dTdtnp4y16YI/b5w3tLodGYF5eBHzdfZOowo7Ok0A1fX9f6t6ZgPtVyJkpXgrd39vPyTkbD+h5Ukd41oq1zkKckS9tuLfwtQYN0BzYDC0EKuHiX1Nnnlmzkqes495qlZauVM63ee/sAdWpgaxix46puM8Nz9pg2Gk0w+YwyM/qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792045938; c=relaxed/simple;
	bh=qgNKuCufbexUiNnMd4UFYSMvMNsgy3mLjgSJhp++3Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKyH+78miQ+yXXbNV9039HRdhDm8vMY8Vnp/J4WkHm7Ms0U0f1mEWHJqfYOPos2XcsWISP8Dx+g7Zs6cdaRvTW2b6sjXI+KXwwk32sEcgyZ5s4jRPqks4F1Z047is9xFYm6p0mLXnDuYA/FFd4qjBWZtpsXwHzlL06lvKH31Vps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmsc5zwN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmsc5zwN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a02718da81so38909625e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792045935; x=1792650735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lh/7skka0uDM8NGSUjtaIa1b4/VuTZ55Mdun5RSEQww=;
        b=hmsc5zwNm+F6qlb/FIJYcvob4ZFS7eSMHOTTJz1GMVPmY3ypiENxn9P/sD4bJvWMId
         lhywFXHEe1cS1nUPG2JTSTP3dYjdi4YtZuRedodSE5OyDYCqrhY7izYP2XqmpxCApExM
         3dFaajpI8ZlQmwDNUAe164apIn45eiIdolZGr/QT8Sk51TbQnSD5miAtzehWrMXjoGVI
         MVaK5o02sgOFQErSoJ/+8QAkPyOPX/y0z3LXaReLXxEwI0OWfvDPK3XRGFXeX1MW6SfI
         WgeVID5uDg5ET/+A1NpiuJmhU9WUgYU5v8PIcO3Kofsldy1eVid53Ln0Ww7xCtsN9ej7
         HZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792045935; x=1792650735;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lh/7skka0uDM8NGSUjtaIa1b4/VuTZ55Mdun5RSEQww=;
        b=JQr4TUWKUMPieUgTImCNn1U85OkXxaXHJ8SI9LiUR7x9H4rEUQiGLCkp9mj/Xbx2+P
         O3LOjsju0WEzU6+jobGe44xCD3+Y/Su+io0x2MdG2kmBta2otm+o+Zn171jNJs5w2Mxk
         8hWNYvNcoryeyj+RBWYMY1zd4oujvY+HWv6IoX9OFT70CwiRQkdrNj+d3xsN4pWcbjbS
         s7MS6i9asbMJ0psKGps2zuHsdJkLs/DQFVaSc8bmQvcs9Q87QyzhTnpAoOfBjJXbiQbS
         UMerftyJ2CeQR5SaEzEsI65NAr+91zrm6qqFwNE0PlyMwBVbYeAvvCcNbXe4ANFO2bou
         wNDQ==
X-Forwarded-Encrypted: i=1; AKwUvBytvwfp/W1mtJUhNvszcbO8v0ju21pHpLEERFoDgBmsj4OMdsEoDJ/dCbkG8iOFzrNNwz1PKvIkAoXR2ls=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZkMGxmYdQCJDhEqkJbza5wea7uRr1sbClNHtaCqwfP4w6NHBI
	PsvzbN6zRex0dQEFU6aQ32d21iGt0oi4LwYtBnAmUEP7t2cJyXLZO65e
X-Gm-Gg: AYBFou0+qv2KxbnSIWT1xaYEiIE+bvPFudu7D8XF3EEoT5fTQ+ORhV6pZ6NTwoXD52k
	I7tZptKYqyNUTnYk3A5QoI78l+f1DVdkc1vCRxr6iB5ZUibIcrdPj5mRr/XPeoirkck4Nj/zbhv
	fbCGyU2Zqd1Phc+m1I5TAcOw5BtPY4mrZX22ofv1NLH7OPjHvhfaqj5sdc5ZCinpthy/GTk8Td6
	vA9bggWLZhUzLLKboC4BlOCQh5UsKCD1ZqL2si6zwqmXyxd3HWo7WIvyhjuukdEDsSGaUKzhziG
	P6+2nSjwBXg2CY2gxdW3sIpc7CB0dDfaPz5XGX+7NYx8CFMZuZcC4lxTDwym3HdUJkAIrraw4vB
	D5fc11KEePZIeO6Wl1ycnvOiZn98k9oodiFH2Pae0h9cel+/z9ta6+1taCYu2+WekeL3kJPk8Q8
	AAuY6eGqRaQ63lI1S2wMWLhzlHE8u2LaDwrJ2pouiKuUpsYZeNOxS7lHoVUBR2j+/hPImK5hG/K
	GkbQ2CVSGhcdyFUThfVG7XWqK1lbjk0lBMwHg7E8moqlqVdve3AA96DuNCJVaRqvF8owu9ah1X4
	mJ7LF6k/j3iBK3utAeT8WDJS8gE0/9AO/zmzSpQP5DBcbnHpMpstHj41Tk5VCZw7zlfyYC+3ngU
	=
X-Received: by 2002:a05:600c:3146:b0:49d:1fd8:b874 with SMTP id 5b1f17b1804b1-4a18e4af3a8mr376432265e9.19.1792045935458;
        Wed, 14 Oct 2026 23:32:15 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-aeb3-cd01-f139-812c-65df-b930.310.pool.telefonica.de. [2a02:3100:aeb3:cd01:f139:812c:65df:b930])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm62999745e9.10.2026.10.14.23.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:32:14 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:32:12 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Clark Williams <clrkwllms@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alexander Potapenko <glider@google.com>, 
	Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Bradley Morgan <brads@mainlining.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: Re: [PATCH v6] softirq: Preserve interrupt context during IRQ exit
Message-ID: <atByy9l7zW4TKtrK@gmail.com>
References: <20261011060742.30584-1-kmehltretter@gmail.com>
 <20261014120524.5e6e6efe@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014120524.5e6e6efe@gandalf.local.home>

On Wed, Oct 14, 2026 at 12:05:24PM +0100, Steven Rostedt wrote:
> LGTM.
> 
> So this handles the transition between hard irq and softirq?
> 
> I wish there was a way to get preempt count updated earlier on entering a
> hard irq so I can get rid of the transition bit in the trace recursion. As
> there's still places that can trigger a trace in the hard irq before
> preempt count is updated.
> 

Yes, this handles the hardirq-to-softirq transition on IRQ exit.

I am looking into whether the preempt count can be updated before any
traceable code can run, as a potential follow-up RFC.

If that works, it may allow the transition bit to be removed from trace
recursion.

Thanks,
Karl
