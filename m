Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794600930;
	b=AwCCbM2zjbnc1YdSG/9k6ZJjfesUljzwoG6mxEFGTNiuT5/LD1MNQU9A5+AloPf+sWrE
	 XemW15Pax12HvSVm+NSJNbF0vLYv2FwadndnG68Xfgk734GmCgRJQQKTJtDeQLjPwt2b7
	 CtgsmDoS4QR8KBh0cekqmelYiApIZW9R43bWfvpzzfCQXkXAcjgXKsDdvS3InBpu3SPIL
	 r/WdW0vWZEI0tmNjl9VsFPRcSZwSExYzVyVjdz8CJgbp5OFYSz9Y5QzunZEsyDbBm7feb
	 og55X5LcAKl2GJ6Sic/hNxlgsx2KZRMwB60QYP3f1HeEOVIsuFV/GJIyos2vrMwZ3eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794600930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=8H+CWUGQzI4Qy2wQthU4p5PCrPJHw0Bm8PIx68UYiVA=;
	b=KpLVa6B8488HuEo8HcRQ4vt3asSn5k2xFPKWBJpqhREx5bYXWaPZuMgyfSeZSBJo1JWU
	 elaDi548RV9uCwPa563nsDZwzUKBc9de63R5ocRDtgcDLOSX8KEfDb2sZSvA160+DQSXI
	 QxWpGb6dYs5cBxnQ+IOMUrIk2klTvC0zbqe5vMUgnaexm33Sz3xDir0D9p4fsc5jy1px3
	 wFXNnkQSrH8mLhg8qJxeN8E4aqyLxrXRTCm8e07m9Pfnr4oO6UJ9npdGXLUNUSEPbzS45
	 KSrQVBqVRxXbuVA5dIlowKa1oyU7JWEz7p+bfk40VSwWL+Ae9oTnKXBOQzbJnuOXdlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=kiUujirz;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC03606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC03606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=kiUujirz
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91ea0c05c92so27649276d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794600929; x=1795205729; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8H+CWUGQzI4Qy2wQthU4p5PCrPJHw0Bm8PIx68UYiVA=;
        b=kiUujirz20XpRSiYsymMzAFUM87+Kx+bTgzJiROSJSS0kLs0/aEad5APBagCWtpIum
         YPRiswGzoJhd+A08tPWUL0lzVf6QIOHZsuCL5JRig+ku2wdiiw/Q8gDbzxLdiRJ4dx4d
         rqx98Yn0yCAE0YOY2gkSlQBPYI6FM2UgjDzDc4q201hjMfh9/G4+2YFO9VFV97Fhdy/u
         F0pR0SmJ6pdp/VCRh67SUUa0C3K3uRWh7jBs7uPJez9fVM/4UdiMYZnaxQK/LHDTqiZL
         +392meILWIIFy+jfp5Asuo0aJyWdSKNJCKUQHWC5Irxj5kWDQ+jtusrFP43FMsjOvgXp
         weXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794600929; x=1795205729;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8H+CWUGQzI4Qy2wQthU4p5PCrPJHw0Bm8PIx68UYiVA=;
        b=RDmCINvqeBFpdCyavSXPyvwKTmbnE8vWhIWBZpdFtt6YCl8BBKQl/krArs6f9DS6Om
         XPkxlac6HVfwloQrfxcMKhh0Fng4ecPeFQ2T7VVwXNq/zAzQsYtRWXjynqcsoezPpCAu
         AQsB5IE9s3bXO4L9yb3i3btwNyf+dYCNOOiMwfdnYLOULUxewAZbMRx8JT4zLFG/fl+K
         Sw7ElyhFFrZp++V+Irnrn1NdJa2KupFcO8qVrjtXDfg7crPuqfvEW8xbdXSpH9ABKf2d
         X5obdHTyDHwY4GTD0IfrEfL6m/FOtIo3sEEhSwtb/rrVnkWQ2t68bmWBQUh5VaM5zGO9
         CjIA==
X-Forwarded-Encrypted: i=1; AL+hErHrxh7uJ5/iJmPFBvxc9TqcoguWIyKcsQlDBGRaqbiw8MkgBOTQbV8yk7YNXIJa4XXRvN1MObc2YD7tnS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z86ZBt+HC1mzT5ONxCgHrOZSkEkoIqid+h2O6IjxullKg6hMpXm
	bhF+fwNOa/diAlpcJ9XHf/5+a+Q7dR1bWNHpO4N0y0JSNkqT1JlxQFfnS8/dRcebsIE=
X-Gm-Gg: AYBFou01DarmVS5MLFweiZV4c8z4cIoiHEKSJcY2QmRvz2uQA+mVJRwONiegIaN3D/e
	cylGkTdM0UvC0GSrSdtIVgcAFQIzBbDjHHaf2ULQ6EySNTGnwt5yqKJzDkIEQJmNtlsVloY390C
	Iz2gUMyZRsPgM7H4d9/98b8pPUPAHEhDhmazSUeYSJVhiwkFmVjSk/S+r1f+yqrZvE6Vt5iykkJ
	77OrG7n9nE9syN2pZLCwzZzKHBfIv6PP91P3mF4D1ZQasE1gel8rjRbHo/M1nv4rYKMiDGHnBtP
	A7DIkEawsAwJofVVdIBab/K4dD+XEsEbYTGHT01nVDkREm33UPYfzIh5YPdxoWqLTSwI9i1zcHU
	8NmlkzX/Yh5XUAwqXVTvkK8IvT+AHGydpmsJwQDPq79HfqRonQwuVtUnWh6gwqgOlZ37T9TGffz
	jjUz7L5af9LS9krBsKQLY1aqOiKJJkWxLKAdJseyl0GkreiOn//JDf+1wyST3NLr8Xoth0Q+Nti
	7asGVEw12jd+PjOaQtJTnC3WtYuYgcbUIfa7DQYVM+gzGlOzsJXuzu212bsANlq5Aal8KKCjmPT
	PvwStCbpCVk8z04wIhJ44Pbgeqdnj4a7zXDnOw4TjHQY0B7+RK6c744y/ZICfHMMr4mliC6Nki2
	Jl9Ug9bhSOp8CBIGhzvgLB0oYQIDX
X-Received: by 2002:a05:6214:1d2a:b0:91f:17be:7c90 with SMTP id 6a1803df08f44-91f2424c199mr58365016d6.55.1794600928649;
        Fri, 13 Nov 2026 12:15:28 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23da6adfsm27424366d6.36.2026.11.13.12.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:15:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/hmm: reject shadow-stack mappings
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, jgg@ziepe.ca, 
 leon@kernel.org, akpm@linux-foundation.org, david@kernel.org, 
 kas@kernel.org, dave.hansen@linux.intel.com, bp@alien8.de, rppt@kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <avdrZ716BHN-JLc6@gremlin>
References: <20261113195536.2660763-1-gourry@gourry.net>
 <avdrZ716BHN-JLc6@gremlin>
Date: Fri, 13 Nov 2026 15:15:27 -0500
Message-Id: <179460092754.482102.6921125310815388864.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-13 19:57 +0000, Lorenzo Stoakes (ARM) wrote:
> On Fri, Nov 13, 2026 at 02:55:36PM -0500, Gregory Price (Meta) wrote:
> > HMM can grant ordinary device write access to a userspace shadow stack.
> > On x86, pte_write() is true for a shadow-stack PTE, so a populated page
> > can be returned with HMM_PFN_WRITE without taking a CPU write fault.
> >
> > Nouveau translates that flag into a writable GPU mapping.
> >
> > Reject shadow-stack VMAs in hmm_vma_walk_test(). Use the existing
> > unsupported-range handling: a requested fault returns -EFAULT, while a
> > snapshot records HMM_PFN_ERROR.
> >
> > Link: https://lore.kernel.org/linux-mm/20261111-mason-migrate-et-al-fixes-v1-10-3d2454362e8d@kernel.org/
> > Fixes: 54007f818206 ("mm: Introduce VM_SHADOW_STACK for shadow stack memory")
> > Cc: stable@vger.kernel.org
> > Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
> > Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> 
> Thanks for doing the HMM side of this, LGTM and:
> 

Fell out of my testing harness when reviewing yours :]

Stuff like this is becoming much lower effort than yesteryear.

> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

thanks!

-- 
~Gregory

