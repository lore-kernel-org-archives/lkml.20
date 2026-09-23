Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87DE3C0A13
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790201382; cv=none; b=XZMQRfnJ0/iuz0Kk3lw274dPtdTlxvcwEVM62Xy1wzTHmI1dFfzNH4tu76UDo67RadFGDRZA1BHWLpYNhqjgwfhLIz7cqGi5pW13IAVGOi6H66lJmG9NtJtcPL8gCX6oXK6cEPXCXYEWr5WlZsoVrFnndSRW+BhPo29UKoMmyA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790201382; c=relaxed/simple;
	bh=Fd7arL5gD//WV/QNV8gMH5UiaR36OMO6q0zoeLWvhC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nctB0vB+y/yf0avJcu+x4bErlpC2lE8T+V/hT7aBQIpE9zWqPem7SbqohKlYEQ3K6UWCHv/5vkwc7pdXhr2LOFzgHeVoCohtld2T0+sVDqrPBOKTcASTM33m6CT/z5cJ/faUdojRwdC12CoezfA2U6RW9hGe8R5b3M6Ewf04PCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kwc0Bod2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kwc0Bod2"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2db33db4de9so30915ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790201380; x=1790806180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+IZRsj3puzmZNAPUNV3XzHF/8z5xEyYXKGsh0zAy4Kg=;
        b=kwc0Bod2l+ycWttYn65uzEjhsswrRqp32NhtuxWGbRoTaZJMslzD+0TFiU+3w3JFtT
         OyswI5vvNtPoZ9EdW+IS2lEY1gyHchN7BK7vFnL5U04cP10I6JQzM36CR6zn13zmdeop
         XZMxMRHfBp4GJEJwZ8nop5UhwoUvLypam+l7omVTvpmqsPPmWc2HwWjZbEs5L/J+QWDS
         dXDmSs5SPlKZQ+sQNMRf20/064+7UmhatPRw09YKKZ7WVXkIT4C3VVWOra+JT5VTdH5i
         9y4P0e9NHvYW2XRBgfBCyQmSzSRpd9mQMaPiNaiugn9HPx/VvBwUKWXxE47iOehftRYU
         ZeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790201380; x=1790806180;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+IZRsj3puzmZNAPUNV3XzHF/8z5xEyYXKGsh0zAy4Kg=;
        b=F/xZQWeSmrn/1Jo/ikVJc6F6IYEPlnU7QsIKpsPkJAUR/OoEh3xw1AAT7VIc/dQOBq
         B6Rf0FR7TUDVTURRNyw8XzXGjS+skiDfQhjvoeqjLo4jsM/HGYqgbQxPWvHwVwnHTb3H
         Ijnvp0GqcWcNcTOkGi9Z9O0kFLh2j67lrnkBK+bycLVrLmk6Xzmkl3k8J6OFooT7wxTu
         WCmvqmMkGOi30RVZHMfDf7wBa96kWfmjh0wQ+mOvGMkocqGDY5tnxRVALiZfDOxBJ9ls
         5D31aIfqRRPYZj6umxIo17DxbvE+kY7s0rKUCpVNKlxVXrOBLSf1zyY+TSB+Ph7aYK3G
         0wvA==
X-Forwarded-Encrypted: i=1; AKwUvBzjDpT3N9Ds0n5IFkkKmoMZ+zgYKgtXN14MCRL+EqcolZJ+5Q70T0+m/CChmN/RNHSLL1lnUZn9KxsJEOs=@vger.kernel.org
X-Gm-Message-State: AFuF++lvR6dmec92esscaN8WSVMkSlcYy4GLlIYUTFjC/GabKJ/5+6H0
	0BBT9InQpMEvpx9VTnouT3SNRlKVK4T9IDt02MYloWm77H2w4JjUbwtkHhVl9xAWaA==
X-Gm-Gg: AYBFou2PLso/3zk0yzh0xa+Gl+P/SlKO3ilfNn7KG+d6vrLeqI4w3YFPRQOSU8i6TqO
	cQ3I69Y/zDgwfVJ7p23EdMSnYJRhEfx33hWFjhDRb5aqCSYD1EKMRxHqlz92kc/eWqyOMFDz41h
	RAlxcIqNf4rQwKnoNstvUrnPwYxtBwBn3I9AjjwL0x8viOaMtQRy2xiADirMIyxt/Slc4bbopBy
	R/h5+e2KMqou00eUroqKFznZGwi2v39emzXE8Z/If6ATZUBzmP1lGBnpFnlPxJ3uhkZvHKge7M4
	GBiAb88zJY3AN/moF0OePPiHYnGv2kkEkp15WpUHPA7SPPVpdNi3NdIAgPqGQP05W9CELBw3Wav
	BPxdnjUkdzkYIx0JiR+FxRdPfhUn5LLOWwv0lWQtQu/rV4QJG184Lffy/iSMTdn80h4zoYJchjQ
	zYfBz+0zkl2mwx4t+IqP1Pkx997eUsszKMFvoMcomheY1N/2mmeSYzLnGfmMrKtmZgaLcahenBC
	sBvLmpMk45KCsyojz0RKignSYqbKJAi8zXbaukKna7Zsb5fzr0RK8kbPT5mY1U1jhGwJEY8xK4U
	DVM+q66EHjQ7nAnropBGev/mN5A83Oe4sQ42aCr6S4ogT48=
X-Received: by 2002:a17:902:ef4c:b0:2df:42af:2f9f with SMTP id d9443c01a7336-2df7bb2f8femr2192835ad.1.1790201379697;
        Wed, 23 Sep 2026 15:09:39 -0700 (PDT)
Received: from google.com (99.95.125.34.bc.googleusercontent.com. [34.125.95.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5164c0sm17368465ad.6.2026.09.23.15.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:09:38 -0700 (PDT)
Date: Wed, 23 Sep 2026 22:09:34 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Hui Peng <benquike@gmail.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
	brauner@kernel.org, aliceryhl@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] binder: roll back frozen state and enqueue freeze work
 on BINDER_FREEZE error
Message-ID: <arROHg886j_usQk-@google.com>
References: <20260919213652.3317208-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919213652.3317208-1-benquike@gmail.com>

On Sat, Sep 19, 2026 at 09:36:52PM +0000, Hui Peng wrote:
> Fix two state rollback bugs when `BINDER_FREEZE` fails with `-EAGAIN`:
> 
> 1. In `binder_ioctl_freeze()`, `target_proc->is_frozen = true` is set
>    before waiting for pending transactions to drain. If
>    `wait_event_interruptible_timeout()` times out with `-EAGAIN`,
>    `binder_ioctl_freeze()` resets `target_proc->is_frozen = false` but
>    omits calling `binder_add_freeze_work(target_proc, false)`, leaving
>    any `BINDER_WORK_FROZEN_INFO` state queued during the freeze window
>    un-cleared.

This is incorrect. The current implementation doesn't add the work for
"proc->is_frozen = true" until _after_ the timeout has passed. So adding
another binder_add_freeze_work(target_proc, false) is incorrect.

> 2. In `binder_ioctl()` (`BINDER_FREEZE`), a single PID can own multiple
>    `binder_proc` instances (`target_procs[]`). If
>    `binder_ioctl_freeze()` succeeds on `target_procs[0]` (`is_frozen =
>    true`) and then fails with `-EAGAIN` on `target_procs[1]`, the loop
>    exits and returns `-EAGAIN` to userspace while leaving
>    `target_procs[0]` permanently frozen. Unfreeze any previously frozen
>    `target_procs[0..i-1]` when `binder_ioctl_freeze()` fails.

This is a real issue. However, I'm already fixing this and _other_
issues with this API here:

https://r.android.com/4254406

> 
> Fixes: 432ff1e91694 ("binder: BINDER_FREEZE ioctl")
> Fixes: d579b04a52a1 ("binder: frozen notification")
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
