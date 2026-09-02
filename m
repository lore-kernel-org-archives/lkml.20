Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A3014A4CC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788313804; cv=none; b=B3f0GNqGBZTct1iUQTzF21pLXtj6Yh84vi7qfeTTFS24cLOnrF9xfJX4QFU7fLmKqIAs0oIZ8OI+dkpypH9gBqlrdRcZUTKDT/93Vyz58Gi0YWeHS8ugWgBb7FAL/j5cYaK1uKO+c6Qg2WSoAf+3a5dP5CGAdzo8nrBop3LW5W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788313804; c=relaxed/simple;
	bh=YnJqo6tr9iMLVf51GkvRn+Utexlsmfqdo9WwAOckub4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hy+kZR9QfU0AjT82wG5lpo1iAxGvg/ko/FiSDvDq/ZHFPAJ4/NdIaQTgYtWiVkAzPibRAwGZzzlI56Ey+LZsrHiERBzulUqYU9hYVG4Agla6tXbi8LrGqqKIGy23vUEYrCVILZa2uUGyYi1fK0EdKaZW8RUU3E+tdUOpm7bIvrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=goR1AICS; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="goR1AICS"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-90c522298d2so5895926d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788313796; x=1788918596; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PJNOkrjAPDzGzabPglL1tb9qnH461gZVQU7shHOjP04=;
        b=goR1AICStb9dzkOBM+LICNShaidLSJNOI8e3dcg4RvfG59IEuBo9jI3GOxg4GCt+BV
         RTrdzmhGcTjLLC1gf6Ww0UkuVDslYjMvA2kFbBeqs0s2f/sOS8dyt5dUWTLt4QQtxYK/
         Xqhatr5fPIzQcM9X3TuXHviSpb/xw77Q/t+mQaZ07cqQLtxj0LXaX5AYz6vnilYRz2/p
         WbIs2og23SWhit5a+Ir8nVTgjhdmNlABgWNJkVRu2L1Ms/UT2Xv/SYPKcy/vTig4OEZn
         8fOQUPEo2ly+8tOTRURUaHyciKOouplVdExTzyWEjtpF5IOW0Gsli4To6ObDGMrYStDk
         ZFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788313796; x=1788918596;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PJNOkrjAPDzGzabPglL1tb9qnH461gZVQU7shHOjP04=;
        b=kIUERaxg9xjzK/2ILeWRjYiuYqDUVO79f2z8sCRB0Tl+rJRNRVY5BXFsEMbsh+hXgL
         Vw9EbMs+RrtNJx813tfYS5ppFy52NcUdEBj8l0K2K/STw0coXaxNxVsWQOU+2Vlg2xYL
         xEucVvlKvgBFvKGqpFknw3QEBfH+mMqEVaUWHHnem6ZgoCZeRN0nGhUWWjg9RCiZ0DRr
         Q9ryNqnGQnmWkTbmTzjaRNbFgcAY+0RP8IWnCpi5n5UbXq7XAH/sX5gqv97/oh8fizXb
         RKWzMD4kPcFkSdTKgV0AhOENHJzjmnj76Rteahs+Z/cpdjqpIhEqHy1CuvsiAEvgjlWa
         YMIg==
X-Forwarded-Encrypted: i=1; AHgh+RrrFX8P53dCejVPhduCJXzZ5LhozK3uctPwrTLX62JonlFqoyOKxcAUkmO+E/+eEHV4jS2eGEJeKr6sPdY=@vger.kernel.org
X-Gm-Message-State: AFuF++nqErpOUCdjPbp/oXW6xJBxxq7Uzn6MhlF2FBwC6rc88iyvfQVG
	hoC+vx4QpIze8j5QPJugkzImQB6a9MHgRQQJs5+FR0yhWkfwUPQDEYiLM2Ap8ETHJQk8OsT/Rlz
	wjPoBNg==
X-Gm-Gg: AYBFou3WxVJWOkuEwlUs6HCo7qdWgcq/CW+hkKqhqyyxN7754MzEkJUos2uYuz7e3XE
	hJ78TBHw+eL/K/yiRpA3q78ngfl//XcFb60u2vfwLSi9hQ9hqh5hbaS4bzvjMizKFBtjx2oux7Q
	fn+SpiCka8H+phP6OPS4XQSwdqcNuRgpCJyi/84GnWu5ECgupRtZd8DWmNgRxZEezmFUehsJn/i
	Gc2yG+MxXm2mHD3fyENmoNv4txf9PGqzTO/Lvco7lhKhYb2NsW1f49HS0R3RdTgCwOC/Gmwu2oV
	OnB7Glx6jzP1uWHlCVJoS98TEiS301XICrhKg6zcJ3cvTyuMAHFolEoBEvoISWtNqXro4OMt0Cs
	mKC/N36NMy6Of3paBvLcXo32M/4JtEOBPAyc7Ms2Y4YUKT8LnkSnFvVWmXSucW2Ci+uWKEMJXzm
	sPNhW8Sc4Xt1kjK/WoX6C4G1J1KzeJbxdXoICw7q9N0iXTO04nm3ViwozGkfAIMA==
X-Received: by 2002:a05:6214:2b9a:b0:90e:95d0:927a with SMTP id 6a1803df08f44-90e9f20ad67mr27141236d6.6.1788313795865;
        Tue, 01 Sep 2026 18:49:55 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee24af5sm7401166d6.12.2026.09.01.18.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:49:55 -0700 (PDT)
Date: Tue, 1 Sep 2026 21:49:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rafael Alejandro =?iso-8859-1?Q?D=EDaz?= Cruz <rafad900@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: Re: [PATCH usb-next v2] USB: gadgetfs: Fix use-after-free in
 gadgetfs_kill_sb
Message-ID: <dbd20921-088c-43a6-bb91-0b7064f87a59@rowland.harvard.edu>
References: <20260829011901.325379-1-rafad900@gmail.com>
 <991f3432-02af-47e7-b470-b21d36d09ac5@rowland.harvard.edu>
 <CALp66yH0C0WAgUDkXArbLHgwSdrJ0hfQP2id2xhztg-d=qK1Jw@mail.gmail.com>
 <23099c10-19ea-4626-b1a0-74a64fcb0dda@rowland.harvard.edu>
 <CALp66yGtNY1e3DFdRxMjf1YDnCLrsH_bg4gpyu-A1K0mRgOt2Q@mail.gmail.com>
 <211b5666-1777-45b6-b1dd-9e85276900b1@rowland.harvard.edu>
 <CALp66yFMQ+GTh=3iXWWMTcvDwc8e5tR0EpnmBDt=24E9Koo-wg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALp66yFMQ+GTh=3iXWWMTcvDwc8e5tR0EpnmBDt=24E9Koo-wg@mail.gmail.com>

On Tue, Sep 01, 2026 at 04:12:17PM -0700, Rafael Alejandro Díaz Cruz wrote:
> I kept going at it and finally realized what was going on.
> 
> I added some logging statements as you suggested and
> found that my 'how this bug is caused' is correct. It does
> come from calling get_dev() after the error
> paths, and the simple solution was to move get_dev()
> right after the set_gadget_data().
> 
> As for 'why' the bug is happening, it basically comes from
> the reproducer using failslab to force kmalloc() to fail inside
> of usb_ep_alloc_request(). This will cause the following
> error path to be taken:
> 
> dev->req = usb_ep_alloc_request (gadget->ep0, GFP_KERNEL);
> if (!dev->req)         // This is true on failslab
>      goto enomem;
> 
> This will then skip get_dev() and go directly to
> gadgetfs_unbind() -> put_dev()
> creating the unbalanced refcount.

Well, yes, it was pretty clear that either the usb_ep_alloc_request() 
call or the activate_ep_files() call had to be failing, given that the 
unbalanced refcount came from gadgetfs_bind()'s error path.  The only 
questions were which one, and how.  With the reproducer introducing 
random memory allocation failures, either one of those calls could go 
wrong.

> It was tricky to understand given that it was failing only
> on the N-th failslab attempt. Luckily gdb could do all the
> things I needed.
> 
> I'm also happy to share that even Claude was not able to
> figure this out and could only confirm this was the cause
> after I pointed it out.
> 
> I'm certain of what I found and will proceed to create the
> next patch with an updated message.
> 
> Please let me know if there is anything else I should add.
> I'll wait for your response before sending it out.

No, this seems good.  Make sure that your patch description is both 
precise and concise, and that it doesn't presume the reader is already 
familiar with the details of your testing.

In fact, since you're fixing two distinct (albeit similar) bugs, you 
might want to split this up into two separate patches.

Alan Stern
