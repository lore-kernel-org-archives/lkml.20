Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777149;
	b=h9a5mkBzawtM9Lk89BkrcFaHJSQhwbh2JfFZbASpKuyeltnhzqfgcgIhmL58wdwz+qvT
	 SParKUPv5mfnM5PPl1goIploZX+zt9FAyQ9pYcXcfaHeEEHFedoLEaTVEWSneIocW2sfM
	 gSc3bnKkyndOrT0B4TgBmAKItkyhOD/mJZaB2kHnQdladXlAW8Kf+WkOLc1Pi0mqb3XPX
	 1VlrzxrS60VtBaOjTjmqnb3qabFDadVtAmOIoqxnpEmBjjHXKYD2M3mnZK3mkrKlUpxW0
	 bCmP6kc+G2hpR7m0WrJmUPx25uzazwR6eD1p0Zc31hXChmYeg/7dr0bDoXWNCl2VfhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HGf7LW+11fFCmkfZDnBYSiu7NHiZ1J+7B7vrKk2MO+o=;
	b=x3rT3sbWcNoRVuc+ERDT7Rg6KynQRUTShtvna6WcfMlrYuCtjhNIHIpJq4zNBb+z8W6U
	 B22WclhaWsfJmxfVh4X5Eq3/51VsaIhBp1/BSIZPRTWdd793gJ6H+eJYtxUY1VeuXkF8V
	 M+0oWTSYYTy9rjzjbFwXdTuDB98iVvRoyXN+J5Oqwsrl/IJ6JY4nPWpqxSXsugrnMry2C
	 FLRAlg9Mec3Yf986MDi5RTDddID+1mO1MMHh2d8VW+zuz1iU2sekzGcsxy8Dy6D8IR/pT
	 BQh/fFbwZ3X+hSr06/KpW0Av2VSXdRVCRTz7GiLWDHpWfwSKC190iLL392+sRwfVCvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osandov.com;
	spf=none smtp.mailfrom=osandov.com;
	dkim=pass header.d=osandov-com.20260707.gappssmtp.com header.i=@osandov-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VRgHZidZ;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDA7606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FDA7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=osandov-com.20260707.gappssmtp.com header.i=@osandov-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VRgHZidZ
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac6008c914so59674a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20260707.gappssmtp.com; s=20260707; t=1793777148; x=1794381948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGf7LW+11fFCmkfZDnBYSiu7NHiZ1J+7B7vrKk2MO+o=;
        b=VRgHZidZURljCrK0HH3V2vKy9f31BQ0iYTP43G6ikNvBR4QjOxKvexYUY5uUu+JitD
         T9TOLxU3AuwSiEfvs+OeG0AzPdwnVqjedfkdmdtpWZVvyj1FCA9sCGyKG3IfgqeMduF7
         tADytHQvwR9g70pEF30quutiy5cwA5plryhJHjdgJ/FA7lKi9UOpU0Hi2aHxpB9zmmLz
         p7lB/1HmvqOF5+WzgD1Xyuwg3Sd7aC8aoth5hS9HATjN45F4AIk9OThyjOW0PZmMn8Gb
         PyeFm2ozp72iY7GtQJs9SMMvKa8+VY3YqslwzoN50PyVfinzUal3mgUUKUFwvo9oFTcD
         Kj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777148; x=1794381948;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGf7LW+11fFCmkfZDnBYSiu7NHiZ1J+7B7vrKk2MO+o=;
        b=RGHF/5vS3H+cXgAj1wVBZoHurdKiKZ9r8pk+DwUiPXL0oMCqatqS+HTbg9F7Zs7IrI
         jTNuRS44Ia0bZAWRzxxFqFTRoPYOZM2EVgLzi+SpguVXOn2yav+ymtYgUNNZqm+GDSd5
         UgHFQs5lpAJ7fy0glbjxymSdFkhWq9RIVzS+gVaju+Yu8eWXBS2roywMza7GAhRLLmPd
         2dGiUP3CiBRVofioIkzOrt/8NOXH3xD0O89nLjCjkT7g/wBbBJdymm4hergHz0jsDpzG
         RlkvqeOMNvlz4JdT3EMh51BL5CwXXU9maxE2YtqFt+pmYH0Domw6uIR6VNHyZ9PlCpOF
         YthA==
X-Forwarded-Encrypted: i=1; AKwUvBzrkqAgPsB/8kqZ7K1mpU66rh81HxUb+E/gMzCO98+foHwyzLRRrMBrg5p88nBmIy5hWc1BH4AxP8f83Dw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NwtbaqjXGSlZGW0Nznf5wqZU0Ir4iAKxHOvJu2TSuIrTwGt3h
	kuio8blR+t9xn0vB/A+C04eTTTJ79NGBRO/UFdzNzR2WVe6KKNLrrNgSC7PHKSSe/M4=
X-Gm-Gg: AYBFou17rP6astJ258VqpUUDA786smVDt/JsJlEf/Z3ohrAN5OAAWeCUfWD9+YNVqNH
	bk80UiKBrN0qL/y3RyQuzt+4gVIp6nLHwq+JUJ2C0Y2LX4+GusGVFAPsPtHl5KVkWBh3iMszBuk
	VraGJ2aqwxEvdNWxfRwg6shyx+7rrrBMIKmgsEfJmlR9mxmoAbW7388G6Kw+7bvluKAb4rVFBuz
	GIHmMlvty1uqgCieBw5hXBoO9nn3vgkFDnGUtWjFgdpIG2piBhPvMHNe6c+BQcGVlCAHOKFsYTc
	dTfOB3w5gOlcBqG1LYb5M+4z6IOfsgEpjGH8TNckynbscfek/SjlkiXknwmI3mHWy7yChhZeLIT
	imcfrQYglUeQbmkyhJk/DG85sRfjoSGv73nAcWICfsgUzFO3zQ3fXpgqJfz7pCXow1raE5bIsO6
	Ndi4aEySaQYoVoOuxoSght2OtJIS08gtPKy68uI668BU0mLT4hx/laI6KL2xgS3uhHO1ZVEHh7B
	/n9PdMDYMdTBt2UIoEwAkv2qRpdw1gRkjm+CpBOqAqIaO1gtnsqdcsWrDfzI9Eb+OowjJQLLbEy
	O6n3OzwAchbTYyLBhsuP5yBc42m3UWN6/G5xtgbT0ph7GRrB57QQe8KJIhXRFr6xv4GS787I7oV
	2rxz3WnbWtuVQnPETq0mr1QvXGfOxMie9miOjhkuqfPG/kWkSxUtSxTnH
X-Received: by 2002:a17:90b:4488:b0:3b0:9a3e:bf8b with SMTP id 98e67ed59e1d1-3b09a3ec031mr1494219a91.6.1793777147801;
        Tue, 03 Nov 2026 23:25:47 -0800 (PST)
Received: from os-N5J97HY9XQ.tail2dda0.ts.net (c-67-185-21-237.hsd1.wa.comcast.net. [67.185.21.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09311866fsm2861006a91.17.2026.11.03.23.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:25:47 -0800 (PST)
Date: Tue, 3 Nov 2026 23:25:46 -0800
From: Omar Sandoval <osandov@osandov.com>
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] proc/kcore: Allow disabling /proc/kcore at boot
Message-ID: <aurd-kCBE7ebENUl@os-N5J97HY9XQ.tail2dda0.ts.net>
References: <auAmuqZyUodq3iqk@chrisdown.name>
 <auKKisespDm1xLLg@os-N5J97HY9XQ>
 <auOEhTNaKzu8dgEy@chrisdown.name>
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
In-Reply-To: <auOEhTNaKzu8dgEy@chrisdown.name>

On Fri, Oct 30, 2026 at 01:38:13AM +0800, Chris Down wrote:
> Hi Omar,
> 
> Thanks for taking a look!
> 
> Omar Sandoval writes:
> > The code looks correct, but is there a reason that /proc/kcore
> > (CAP_SYS_RAWIO) is any more concerning than other ways to read kernel
> > memory (e.g., CAP_BPF + CAP_PERFMON)?
> 
> Not in terms of what it can read, indeed. I would say the distinction is
> more about who needs each capability and what we can remove.
> 
> Abstractly speaking CAP_SYS_RAWIO may be needed for hardware access without
> necessarily wanting to grant general RAM access. STRICT_DEVMEM already makes
> that possible for /dev/mem, but /proc/kcore gives the same capability to do
> general purpose RAM reading anyway.
> 
> In our case in particular, a process with CAP_SYS_RAWIO doesn't necessarily
> have CAP_BPF and CAP_PERFMON, so keeping BPF available doesn't make removing
> kcore redundant.  On the hosts in question, BPF tracing and BPF LSM are part
> of the monitoring and sandboxing we rely on, so we can't remove it from the
> kernel entirely, but we nevertheless keep CAP_BPF and CAP_PERFMON away from
> guest facing processes. Nothing on those host uses /proc/kcore, so we remove
> it as one more gap to close.
> 
> For that reason those hosts already run with CONFIG_PROC_KCORE=n, while
> other hosts keep kcore to aid debugging, since they have a different threat
> model.  This patch, then, lets us preserve those choices while using the
> same kernel image.
> 
> In retrospect I should have explained that better in the commit message :-)
> I can update it for v2. Does that make more sense? Let me know if I can
> clarify further.
> 
> Thanks!

Yeah, with a bit more justification in the commit message I'm fine with
this.

Thanks,
Omar
