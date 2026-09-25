Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E420B3CCFB0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323145; cv=none; b=Lg6yL/h7pzSz4XPvk6uFxGMTQg15w7HbW6FcIIlpFThPXmIBRT2QnStC8voy5EWfLGCZYtSt31rv5d1PY2Sjjt+NUNmJe3DMZH+yvjjppg82bxmvkg7yuq352J8VswUm3WsJuVmWPzyH2Qt9a6BjGt7vRNWpH5xrihtqAM+fu0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323145; c=relaxed/simple;
	bh=MlW05TwI4SqgdJ5BZRjqyRAcje1LCZ+sRXArB1QF+W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fT9kMV6cs+9YO1ofWKItyAImMcW9M7hmT/k1azYklWql8AYA+3+qpU0TAAYu3AtXl2E0Mj+pCmOTebZPRdycMU4HXxdttYWj1epU/4v/8Y6M4GTNEsFHD36RK3k4sARsAjrENpWV9h8mDRuqDCf0NHK9JaKM1TVhfv71izTRQto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2qTAGuXV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Y8Ha30ZW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2qTAGuXV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Y8Ha30ZW"
Date: Fri, 25 Sep 2026 09:59:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790323142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vAS7AYIlQel69BaRWz0kXYRDeu+UaeYt8hSzm7AKaTc=;
	b=2qTAGuXVCBSC/Pd0G2jkmaPbjjDH5jARuDPnkP730wiH/MHCyJrw91vijNYs6dIWnsswzf
	L2XuR3xQWHyrVfC5XKETlfEQ9B5arXeDlhJp1qRdTpfV0bRdcJ3UsJ9t8+aIGXtGyUm5KH
	7j5RJKDnaBP/1vOm/G0AvINfMptP+saflrRqHk1I8gx3vHD8SjF4pkuann8ZiZfYRxjVLL
	9qyYERVPds4mU4kVmZicZJbXIYhU8PHOsJHLkJ2HLwC188jAiachcgnTLE6ZMMa1PhBxir
	SR+03I+qVlZhefcFKzEYHRHIqZb61G70dA7hOaZ4iKUK0eea5vALCxC8Vncp+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790323142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vAS7AYIlQel69BaRWz0kXYRDeu+UaeYt8hSzm7AKaTc=;
	b=Y8Ha30ZWE8A8QfP5ZNVvLUHT6NYeLrZVNvlZZ/q7dhI1y0OmK5767DNwkXupT/KFIKWAw3
	IpAIelfGI4n262Ag==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Carlos Llamas <cmllamas@google.com>
Cc: linux-kernel@vger.kernel.org,
	Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Todd Kjos <tkjos@android.com>,
	"Tiffany Y. Yang" <ynaffit@google.com>
Subject: Re: [PATCH] binder: Use %p for pointer formatting
Message-ID: <20260925075901.OqQNDQhN@linutronix.de>
References: <20260918103008.IkhCxRgs@linutronix.de>
 <arWhYvDBYgLwaY9w@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <arWhYvDBYgLwaY9w@google.com>

On 2026-09-24 22:17:06 [+0000], Carlos Llamas wrote:
> On Fri, Sep 18, 2026 at 12:30:08PM +0200, Sebastian Andrzej Siewior wrote:
> > Commit 8ca86f1639ec5 ("binder: replace "%p" with "%pK"") introduced the
> > %pK modifier in order not to leak kernel pointer.
> > Since commit ad67b74d2469d ("printk: hash addresses printed with %p")
> > pointers are hashed by default and the behaviour can be controller by
> > `hash_pointers' boot argument.
> > Commit 57483a362741e ("binder: Create safe versions of binder log
> > files") introduced a hashed version while preserving the other interface
> > where pointers are returned. This interface is for debugging of memory
> > leaks. Ideally it would provide just one interface without leaking
> > pointers.
> 
> These binder_log files is a different thing. These are userspace
> pointers.

It looks like the reveal points, I wasn't aware that those are userspace
pointers.

> > The policy on %p is to not introduce new ones. Rather then removing the
> > pointer output make it use %p.
> 
> IIUC, the policy is to use %pK for seq_printf() files exposed to users.
> This is the relevant section from printk-formats.rst:
> 
>  | If (and only if) you are printing addresses as a content of a virtual file in
>  | e.g. procfs or sysfs (using e.g. seq_printf(), not printk()) read by a
>  | userspace process, use the %pK modifier described below instead of %p or %px.
> 
> Has this changed?

I am working on getting rid of %pK.

> > 
> > Cc: Tiffany Y. Yang <ynaffit@google.com>
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > ---
> >  drivers/android/binder.c | 4 ++--
> 
> This file is now deleted anyway.

And with it the %pK usage?

> 
> Cheers,

Sebastian
