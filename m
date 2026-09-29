Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD9650EC0F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677656; cv=none; b=RNCPN+BmFQEKeTHcmdsN2a67ZjrD3txSSWfjTYk5Xhq3XO9ZlvcJsq0YMtK90AKHTmGhgqV1/WW+P3HLp2qhM+vuESYKdnb1IgNKbpghVs2nd4vdk95J5mAn8yNItJeGKdnhC6cCAO7kLsFTu82u7rlcXFYcT+9tHqlWCVrTt0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677656; c=relaxed/simple;
	bh=oQucex6RZMs50tBRvSFd4gxrcOSnqTOU+r9tuuJZYTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKG+NcqynZ3829g4yt047OxqA+buG00hjE5kfCSSsSB8AzMyvKm92OKkBbwJZNE9n9yY1jLtXVEzGc1B90j5Ncz/elZ9Lpfr4jQBJcLaiLgiDsl2h0b2smyr2tNDMLsEvpKG2hNeNCxRwJiuatjTU4Uhquer6cRbhs0loD3C18U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RBR4fXSG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RBR4fXSG"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a0061bf0d3so33575e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790677651; x=1791282451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f5Y1Bj47kFdGtgtMUGRUSsPhxIRB2mIpZUPvY4e79ZM=;
        b=RBR4fXSGaVY8aXl3WvdLyjrCE+NU93bkFIRarGoOCEsJ3oDUaWxvv8lD/Oaos30v6R
         cOVjoTrYu1x/+eqMii1oZlXfgWcmvz9M6N4IzU0U74oxRZpHB+PwY1s4vMXkg8zuluY3
         7urf5oj4szap2KOso/2K5L9yyleoQ1AG68J+SuNb8hyQX0FG5wgKXh1PKHkEVowEqzhS
         P1QJjm8A4OtYW4MSWSngGgdVIzep11HO6cfJuk4AFxdryyRptk6KAPrZQxdCrPMSulqn
         o6gctvaux52mCtX5lvBw95LHRj9LbnPZcS4Uy/6+sZrhYd6zxPecWK4HGYiTwp4mAQyh
         gx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677651; x=1791282451;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5Y1Bj47kFdGtgtMUGRUSsPhxIRB2mIpZUPvY4e79ZM=;
        b=FiHsbFpRa9PVhz9ucM5dxOsoYS1qUtB8Qa/mqCYk7WPEPKm3jBs3MgFnxH/YvBaGsv
         x98CYEzf0ayzpbRbVvB6V41YmlxWMHg24gGhqSiZ1rL+LOlvJvqdjcr4nfmGWS0O52yw
         EiNpr21BZVALZWDJMyWTWssI4ue2eS20KOZizbijJkn/hswBn3j1ajQJR9NZz7WqqCLS
         Mh9YWKvSX06UDGq38/H7QssC1xUEZ8uD4W8vodC/NB2LCDswn+EyOhcKEONIxLqGUQDD
         2Q8oiOyJWGMhV3QNEAnqQsC/LtiXnD9tG3MTxt1/WrVz0gZEnU7HkBrTP97DNvBlPjBW
         K2rw==
X-Forwarded-Encrypted: i=1; AKwUvBw6zS2q1B30Vb3cdvWXbhgakQ821xs8eA6Q3wf25Pu9EA7egta6ND/VT9juHHC/ZUNaiCVU98y7n+q018I=@vger.kernel.org
X-Gm-Message-State: AFuF++lPI4UKBl7twRBNzI88wc/7ZT35ccxIUEOSL6fezTnZwd9XUO2u
	eoJ4LINWyDX5akhUPP8r09/qtS7BSppmKIhWYlH3TP1qfgLo+38zvetlbyd0tqVujQ==
X-Gm-Gg: AYBFou0ccWqHM3HBMnXk9eO3VxiURXYXnVliSQHIJqlBwhP0TQdOHTdp5JaMU4Bbnmw
	LE/TwpM6i3uwNeCID2ibJDPjmaV30tKsDChsOjwGOBhYiU107/jw7zm1KAfFknO2nfr24bJYhq0
	K1BjLMarEeBLgKRnODgYIOVky+N/i/CB6WKp34p8fbgcxxVWdKoO5eJ24400Bv2PAWkiEdCsseW
	T9JWzzJWbU3g5T7ZEpPJVYmg79IC6MiNb0aU3Av71Ra6mE2Qyydrf50qyADLpwUEAvumoSCwj8t
	CFV8y5DnR0+HxG0FbeBvnDMsixGw3lLf+paz+99keLNG77RpRDreHeiVGc4CMExCqpeMnrNIE1X
	wGTHoTIp/m3yfOnLsfIrlTXkdhCCpA69L1ko0yLIEx/ZpEGzcMVJGYeOUVFI5Dym1oa+EcnWvZn
	tU0nurzFTm9NMbMSLIuZouSJGixRckAeThujvY6Qe77fHWMlUYxLGUXYtLVTKV65D79sayKepY9
	PwDY1T/6GFR7ylyC1Hahg0sIMivu5A6T21eSRod
X-Received: by 2002:a7b:c7d0:0:b0:49f:e312:54ea with SMTP id 5b1f17b1804b1-4a00f46d761mr379975e9.12.1790677650115;
        Tue, 29 Sep 2026 03:27:30 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00c10c656sm103565205e9.2.2026.09.29.03.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:27:29 -0700 (PDT)
Date: Tue, 29 Sep 2026 10:27:19 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, akpm@linux-foundation.org,
	urezki@gmail.com, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	kees@kernel.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, gustavoars@kernel.org,
	bigeasy@linutronix.de, clrkwllms@kernel.org
Subject: Re: [RFC PATCH 12/15] sched/task_stack: Introduce
 ARCH_HAS_VARIABLE_STACK_SIZE
Message-ID: <aruShxHCUWEHr4i1@google.com>
References: <20260928174122.3380703-1-smostafa@google.com>
 <20260928174122.3380703-13-smostafa@google.com>
 <5c6edcfe-8332-4db6-b0fa-ca5d137a2075@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c6edcfe-8332-4db6-b0fa-ca5d137a2075@infradead.org>

On Mon, Sep 28, 2026 at 01:37:37PM -0700, Randy Dunlap wrote:
> 
> 
> On 9/28/26 10:41 AM, Mostafa Saleh wrote:
> > When CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE is enabled, the kernel stack
> > may not be fully populated with the THREAD_SIZE virtual area.
> > 
> > Teach task_stack_size() to return the size of the vm area and not a
> > fixed size.
> > 
> > This propagates to end_of_stack() which makes functions like
> > stack_not_used() and set_task_stack_end_magic() to use the lowest
> > valid stack address instead of THREAD_SIZE which would cause data
> > aborts.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/Kconfig                     | 10 ++++++++++
> >  include/linux/sched/task_stack.h |  5 +++++
> >  2 files changed, 15 insertions(+)
> > 
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index 45c657772362..d6fa2ccb0599 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -431,6 +431,16 @@ config HAVE_ASM_MODVERSIONS
> >  	  <asm/asm-prototypes.h> to support the module versioning for symbols
> >  	  exported from assembly code.
> >  
> > +config ARCH_HAS_VARIABLE_STACK_SIZE
> > +	bool
> > +	depends on VMAP_STACK
> > +	depends on !STACK_GROWSUP
> > +	depends on THREAD_INFO_IN_TASK
> > +	help
> > +	  An arch should select this if it supports dynamically configuring the
> > +	  kernel stack size.
> > +	  For example the kernel stack size can be from the command line.
> 
> 	                                    can be set from the command line.
> ?
> 

I will fix it in v2.

Thanks,
Mostafa

> > +
> >  config HAVE_REGS_AND_STACK_ACCESS_API
> >  	bool
> >  	help
> > diff --git a/include/linux/sched/task_stack.h b/include/linux/sched/task_stack.h
> > index 4a808f9c4631..07d73adaecd1 100644
> > --- a/include/linux/sched/task_stack.h
> > +++ b/include/linux/sched/task_stack.h
> > @@ -10,6 +10,7 @@
> >  #include <linux/magic.h>
> >  #include <linux/refcount.h>
> >  #include <linux/kasan.h>
> > +#include <linux/vmalloc.h>
> >  
> >  #ifdef CONFIG_THREAD_INFO_IN_TASK
> >  
> > @@ -96,6 +97,10 @@ static inline unsigned long *end_of_stack(const struct task_struct *p)
> >   */
> >  static __always_inline unsigned long task_stack_size(const struct task_struct *task)
> >  {
> > +#ifdef CONFIG_ARCH_HAS_VARIABLE_STACK_SIZE
> > +	if (task->stack_vm_area)
> > +		return task->stack_vm_area->nr_pages * PAGE_SIZE;
> > +#endif
> >  	return THREAD_SIZE;
> >  }
> >  
> 
> -- 
> ~Randy
> 
