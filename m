Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5EC360EC5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790288235; cv=none; b=PFfZ7tT8jR3QljfbNIB9KfyWcNtftSwMXKi0gnEpBkdLMr7nIX6fRFqEv3YeES6OApFGrWIvN5uAM6vENGqT4TXLTaSqTBdE0gLb9rQnPOMwxQch91s7IeDriOgtzetbV5vx9GA0qkwlF4dQESXmX8ppRf6bvyHfp6I0FKxMHEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790288235; c=relaxed/simple;
	bh=TRJR6XqJP6QAN1zZ6HseKPeK0o4nvQ+luL/A1RBFnT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqEc2Lc7g6/lkldEuEys+iRkt6HF6R0wuj+pa0mjKjFtxkLZ3sKFGNvDpJq798L+215yHZNJFnAZfjwJQJ4YpDe5O+TEAXRWBYVpwENGgAD7BCvyWH5jFjlMAsAoABmiX9u/zy3P6IJGw3jcNS7o7QUQaHFJXgXgKINSQF2oOgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HXqO43Jb; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HXqO43Jb"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d3b445a84fso9455ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790288233; x=1790893033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uqzE5vmE1byFjXgkPhNtZNO/Sq4sFQiPnHElKpk/U7c=;
        b=HXqO43Jby3invfQ3IO2XFZ1dW8IbOkWs2jK2NYCLzs4sdOsVoY6ntPJdp6AJA1EzUu
         xU4WLQ2PsZ9eg70iyRoXp8212FxRyuQjlhpl/vT3RRpsPDtUoRA2zlfzzqldcwpI2EZT
         eDKppCSTL4K1jf8gTdjBDlJ8fecgmbrT4slhdB+1WdxHDLHD2E/ZqhoEXSi0Sg/3oySh
         SRzYrvbUoQpboGcBEHAqpycsHJv0sxVBKo+U4Kw6/ntzU12+yp67XFhDg7Ot23cHwI7S
         uJqfFoAWn15r9U1tXNGTAho3zKnnA/gOl4TMbTf+u/9n4oEzY6GwFGqymIGCzC948jZm
         zqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790288233; x=1790893033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqzE5vmE1byFjXgkPhNtZNO/Sq4sFQiPnHElKpk/U7c=;
        b=XA8sX5CdtSdq9lcAWthLE03vmBsUx/Qm/a9O5IYQi1IPOGXIG3YOiOjch+a/bksVwh
         wA7JbZfngJbI55TFRLDFmTVIsC7mmjnwi2Q68OHd7DJ95EBwq97B4NARzYoYN4eh7m45
         8U8ZxVqrRvlVWqbFf+ASvamn84Z9OtrDptiXuuWheQY4cQ6/EJDdA/Fc8hBZkUmaE2UV
         ENKKu3lRNMi6DtRUDhQ95YWPQK07/K0CttL9fW/RBGv4qIEvQdsPIPaVvvtI7Nns9JN1
         YK9wnJGmeG1IdYsu5k7LNOqBV93W2H6kfD0vVyuTDUF3XwfPCdb/wbH6FdWH5NZ/Fsny
         JVmg==
X-Gm-Message-State: AFuF++kLDD8CbK4nJ15Cs3C1AbtKxX9BqMo5TXY1YTXC7EA53DY3QCWb
	LFIRvX4lYK8QnfofCUzKpLBXjlEGo9NV5A8mwQJCt7Y2BiDBlo73qtswpv/KmcygZw==
X-Gm-Gg: AYBFou0FqN/wCHau2JWMaE7xJDbdcyBdObzhBnpt+3CLXRS4qPrYm/FnOtaOzbLX9cg
	+yW61yERSIuJ8lkKx7vBB6H5uW5UlC5oSzc3mVyuZsUySjmRS3SJ5SYBLwbFnm3ha2y+CI2TLT/
	LCa6Mbolp+qOyi8mL0HBj2oIFlbeadTawlxSvy97dfRX/JOgOv71eVxT+oGXeeQA5PWsQqWgL2Y
	QzukuawKl3PYda2IHrLMiuUAK0pmTzk9dqR43Ijs+GUYUBKN1pfHHZnq3XdG4JUvwOtaGdCYdTs
	Zq8f1vC8qHrpYV+/MV8JAlzVI+sSptdML0BthPh6sglKHWm61tYqr3bIzCXB1AZCFHvGqGUF/oM
	yoZp/oZvCzrTbD/H4TypN21k9R6N+bRayRTV4KStzUJK6yUPCmf11DyZYXQF435ym2L/KSxqV46
	oiL8BfA8nvGXcqmzHwPsVCPiks/aAsGGuzcxIoGwg5tQ0UdiCiUj7so7twTMpSejyjMzVPz2nBV
	vK/HVW5Q1uhPgaKTc7k1YmKFE5z9jeBpZJB2rSzzxHTbbXJxvvvY737mru7mFDkAPtZ4qY1vDzI
	wPWiXYYo4/Ipsh2kE6BbXeNUB1o2V/XgwZwcYHuUk++oFu1D69iuHDGao3o=
X-Received: by 2002:a17:903:1ac4:b0:2c7:f688:f22f with SMTP id d9443c01a7336-2df940ec029mr446725ad.13.1790288232484;
        Thu, 24 Sep 2026 15:17:12 -0700 (PDT)
Received: from google.com (99.95.125.34.bc.googleusercontent.com. [34.125.95.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8ce3f12sm239223a91.2.2026.09.24.15.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:17:11 -0700 (PDT)
Date: Thu, 24 Sep 2026 22:17:06 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Christian Brauner <brauner@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Todd Kjos <tkjos@android.com>,
	"Tiffany Y. Yang" <ynaffit@google.com>
Subject: Re: [PATCH] binder: Use %p for pointer formatting
Message-ID: <arWhYvDBYgLwaY9w@google.com>
References: <20260918103008.IkhCxRgs@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918103008.IkhCxRgs@linutronix.de>

On Fri, Sep 18, 2026 at 12:30:08PM +0200, Sebastian Andrzej Siewior wrote:
> Commit 8ca86f1639ec5 ("binder: replace "%p" with "%pK"") introduced the
> %pK modifier in order not to leak kernel pointer.
> Since commit ad67b74d2469d ("printk: hash addresses printed with %p")
> pointers are hashed by default and the behaviour can be controller by
> `hash_pointers' boot argument.
> Commit 57483a362741e ("binder: Create safe versions of binder log
> files") introduced a hashed version while preserving the other interface
> where pointers are returned. This interface is for debugging of memory
> leaks. Ideally it would provide just one interface without leaking
> pointers.

These binder_log files is a different thing. These are userspace
pointers.

> 
> The policy on %p is to not introduce new ones. Rather then removing the
> pointer output make it use %p.

IIUC, the policy is to use %pK for seq_printf() files exposed to users.
This is the relevant section from printk-formats.rst:

 | If (and only if) you are printing addresses as a content of a virtual file in
 | e.g. procfs or sysfs (using e.g. seq_printf(), not printk()) read by a
 | userspace process, use the %pK modifier described below instead of %p or %px.

Has this changed?

> 
> Cc: Tiffany Y. Yang <ynaffit@google.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/android/binder.c | 4 ++--

This file is now deleted anyway.


Cheers,
--
Carlos Llamas
