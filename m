Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548835;
	b=cZ7kCjIv350cA3gzvQjMjqOTeBJ3gie4C16K9X2EN9N8Pc7Azue1v5dw3XzVJm0hEnPB
	 /giC5ZeP0F6PY3QVfvFAto3Kf7fgWK4lehTCaKizEiQFEsypfbnFNKSBWxgd1jwW5yHF4
	 fk8hYFqJbz+tBYfiwFwfmb/F4Hir/KHvkALdlycquC1RaKeNozFjiQoANOjxio/VKt0nQ
	 CpiY5s7t2JIaZSYgKaaN6mbfTzPq693pKFj4VDDGxnWxF03jHWKvs538E34JmREVDJqA9
	 lw3kr6ETppQu7y1ikyDXwka00tSD7reQ0UXNdWcQRSABMD/NnpwkuizU5TDVleioLfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548835;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zv2dwLznTDzlBwaiBmqu3E6e2BGNnEevgfuztfawCII=;
	b=jXxTQvrJgtNSMkMSn4hilfiqyLM5k2eu8l1krjiDvD0/0ZbtnNDWC52u+k6/AWR/Nhkg
	 oGiO2kdwIy1G8ot3ZOeKz/Es/OmqJAzR2j7c06hQxyZ8KJ/Au3Fx0Z7AErY30azgU8ZlQ
	 hizStora8x2/HJE93v4R28XP/pfhtr1JeaZSrC1jw5d2FB68gGGehv7qJ55xHK+4VmgR1
	 uM/JJvjPMyji/Pv4gkmbeyq+KWosU8NlsOW5pp+sT0CpX6Mf9Uv+uZRjH9nHF6fXwEvbQ
	 dNF/r0YvYELFIHUHCOhWIuOM1ZEzaB77fuNg+Epothgwutd+9IBRS21w+S76TnQNUCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g9DG8+fh;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JfUOyYiS;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B37B606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B37B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g9DG8+fh;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JfUOyYiS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794548833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zv2dwLznTDzlBwaiBmqu3E6e2BGNnEevgfuztfawCII=;
	b=g9DG8+fhQxS28Tg5VVPkhKPQ6yHZ5IFiA+e+nuQjLg9RutFW/4x01OTci1wnboGH6bWvCY
	hmSPs6jI2DFjAiM5O8Us3mkj4Tkg998fVz/u2MYSGTyDjOzbMu+GA76HbGlQLMm4DvnRvP
	98NiWBW5MrBouS6Jg3rr4f7eTdkZeyo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-UZo9OGoJOWSQPIopi6dT3w-1; Fri, 13 Nov 2026 00:47:11 -0500
X-MC-Unique: UZo9OGoJOWSQPIopi6dT3w-1
X-Mimecast-MFC-AGG-ID: UZo9OGoJOWSQPIopi6dT3w_1794548831
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a35e1d2dddso3971365e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794548831; x=1795153631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zv2dwLznTDzlBwaiBmqu3E6e2BGNnEevgfuztfawCII=;
        b=JfUOyYiSFNAkKuUFsUiQe1CGXr2c3K4vM4qqbt3dQPBnGSzzXLdUKrp1mpVAKildnV
         8O/Ra2Jx33hgzfmUqKnHfOYFnvvNFSKDPL1eN2EdXwphs694bU2gobCu+MT/X1wuOK09
         IUWwh8G3Si/Z3Sc46WLe1ESWY1Ol0jFT+B6cK2DfK1rXbJog+7bMCIx5dF1cXyKCrbT6
         wnpXj6Bm/SJzw9H75b1NS9IRpzgagvAaJDEcjWKFMzzowRsIVUrPVysVDhpMUsx/U76Z
         FQTRW8wI68uXooKcaTa2EKUyoyFuQe2WsgQeRr4kpui9C/F0ajXpU02M99fbsN6xn1zX
         d4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548831; x=1795153631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zv2dwLznTDzlBwaiBmqu3E6e2BGNnEevgfuztfawCII=;
        b=09k4k04nv1amF2rBT1lTYI99Ql4FXKvTy6DyBOVn1elx8zpMhY3RB2Wmu9Fk5b4KvN
         PUxxaDqyrP8bnbNUX3DyO6dv3kpwl3w9elyFKKCxH5+G14J14fXMf9YMhFAgCzW+NmnP
         4rev02Z+CvzoV7chj94vwzZd9umouCtc42Kih6BZdv91m3k/z3P5PgLSxR9Utt6FOyMJ
         yGMsJpSWj3yD3qqVJrC1UWYgW/hPcTWyC1NbHt/VVFI+Ojq6N/E4QvkqZT3P1oyOeF5Y
         fk73G+Jwfci5e6bOCmdj9KJYmSYnKLlSUTDAk1qd0lgjfAYSUGIXh3qdtTvDUo+MjM2+
         Cv8Q==
X-Forwarded-Encrypted: i=1; AL+hErFxrfH+l0Y1NlXWhMFXM8xvz5UB6n5K4Q2NLc1lxtzr2v+u0h/FUES3xQb6OwU9Bu9Kblo/lWHJ9leBcv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ujn2HoyNVVHmrvpDewXZk4e4yAuWYEqxtPaFur6fc2O0NxyOn
	2zff7Sp8tp5bS86gH/Xk1ROg4NNSyys+RW/xGxBsRssnRO0RS48kAFOZz1IBVIRcSLX+ijyXhUG
	64XycPPslgxX8XiX9su0hihYZE7qTNJmDecr6+PhoOq/rcfNxP9fP0jMVPuymWkJ8yA==
X-Gm-Gg: AYBFou1KSqxJYXA76H3cSkEt+0R7dbAnjsIODGAraMDBq6dxP6cACysI5UARleFin9M
	bgoAP6MU2db48K/IiIUGLqPDZIP4t5qIAEV1+eJrLI9xILo7XdENXb4r5quNM6RI/m6Iqz4C6FM
	MU11wRicNHQidWAwyBsTi/fSi2BPplQVrQFnQcLRme9h/ScY/gbEtMqGyFiGFfx4oMgZkxl+Isa
	C2q9zj/LLNZ3dAfHlNKZ0KzWUg8d/22Xoz4QS9cILasLfhiQA1Bs5n59/Qo3nCYk3u8ed4usYEd
	SYZfCZ2l75xv3KdIwBkGuER+zkkQF1b+YwtAkrJUOvbp5etHJznqCax68wB1PVQSj7Y6vRqXRDn
	RGi29mGvFwczMI0HgtF5+f4aQWfzrLs7R0QjI37uLrA==
X-Received: by 2002:a05:600c:4685:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4bb55a91e31mr25254835e9.32.1794548830563;
        Thu, 12 Nov 2026 21:47:10 -0800 (PST)
X-Received: by 2002:a05:600c:4685:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4bb55a91e31mr25254505e9.32.1794548829900;
        Thu, 12 Nov 2026 21:47:09 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1511:2900:ff37:b35c:a97:952d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm122130755e9.15.2026.11.12.21.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:47:09 -0800 (PST)
Date: Fri, 13 Nov 2026 00:47:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhaoguohan@kylinos.cn
Cc: bp@alien8.de, dave.hansen@linux.intel.com, eperezma@redhat.com,
	hpa@zytor.com, jasowang@redhat.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mingo@redhat.com,
	netdev@vger.kernel.org, tglx@kernel.org,
	virtualization@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH RFC] vhost: set dirty log bits without pinning pages on
 x86
Message-ID: <20261113004435-mutt-send-email-mst@kernel.org>
References: <af7f05bf637337d35fdd10f3e0dbb5e39d7780e7.1794480795.git.mst@redhat.com>
 <20261113012937.40818-1-zhaoguohan@kylinos.cn>
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
In-Reply-To: <20261113012937.40818-1-zhaoguohan@kylinos.cn>

On Fri, Nov 13, 2026 at 09:29:37AM +0800, zhaoguohan@kylinos.cn wrote:
> On Thu, Nov 12, 2026 at 05:53:47AM -0500, Michael S. Tsirkin wrote:
> > vhost had a TODO to replace page pinning with a version
> > of set_bit that works on userspace memory, since forever.
> >
> > It is really best to avoid GUP on fast path entirely.
> > Implement set_user_bit and use it in vhost, to do just that.
> [...]
> > lightly tested. pls test and resubmit with your tool.
> 
> Thanks, this is much simpler than my version. Two comments on
> set_bit_user() before I resubmit:
> 
> > +	int __err = 0;							\
> > +	__uaccess_begin();						\
> > +	asm volatile("\n"						\
> > +		     "1: " LOCK_PREFIX "orb %[mask], %[ptr]\n"		\
> > +		     "2:\n"						\
> > +		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_EFAULT_REG,	\
> > +					   %[errout])			\
> > +		     : [errout] "=r" (__err),				\
> > +		       [ptr] "+m" (*(u8 __user *)(addr))		\
> 
> errout is only written on the fixup path, so it needs "+r", as in
> __try_cmpxchg_user_asm(). With "=r" gcc drops the initialisation; here
> (gcc 13.3, x86_64_defconfig) it even shares a register with mask:
> 
>      1a3:	lock or %dl,(%rax)
>      1a9:	test   %edx,%edx
>      1ab:	jne    1bd <log_write+0x5d>
>      ...
>      1bd:	mov    $0xfffffff2,%eax
> 
> so every call returns -EFAULT, and log_write() stops after the first
> page.
> 
> > +	__uaccess_begin();						\
> 
> No access_ok() here. vhost checks the log range when it is set up

exactly

> and
> I couldn't find a way around that, but GUP used to reject kernel
> addresses by itself. user_access_begin() would keep the check (and the
> nospec barrier) local.

What we *definitely* don't want is nospec on fast path.

> Something like this, build-tested on x86_64 and
> i386 only:
> 
> diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
> --- a/arch/x86/include/asm/uaccess.h
> +++ b/arch/x86/include/asm/uaccess.h
> @@ -597,19 +597,23 @@ _label:									\
>  /* set_bit() on a byte of user memory; returns -EFAULT on fault. */
>  #define set_bit_user(nr, addr)					\
>  ({									\
> -	int __err = 0;							\
> -	__uaccess_begin();						\
> -	asm volatile("\n"						\
> -		     "1: " LOCK_PREFIX "orb %[mask], %[ptr]\n"		\
> -		     "2:\n"						\
> -		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_EFAULT_REG,	\
> -					   %[errout])			\
> -		     : [errout] "=r" (__err),				\
> -		       [ptr] "+m" (*(u8 __user *)(addr))		\
> -		     : [mask] "q" ((unsigned char)BIT(nr))		\
> -		     : "memory", "cc");				\
> -	__uaccess_end();						\
> -	__err ? -EFAULT : 0;						\
> +	u8 __user *__p = (addr);					\
> +	int __err = -EFAULT;						\
> +	if (user_access_begin(__p, sizeof(*__p))) {			\
> +		__err = 0;						\
> +		asm volatile("\n"					\
> +			     "1: " LOCK_PREFIX "orb %[mask], %[ptr]\n"	\
> +			     "2:\n"					\
> +			     _ASM_EXTABLE_TYPE_REG(1b, 2b,		\
> +						   EX_TYPE_EFAULT_REG,	\
> +						   %[errout])		\
> +			     : [errout] "+r" (__err),			\
> +			       [ptr] "+m" (*__p)			\
> +			     : [mask] "q" ((unsigned char)BIT(nr))	\
> +			     : "memory", "cc");			\
> +		user_access_end();					\
> +	}								\
> +	__err;								\
>  })
>  
>  /*
> 
> If this looks right, I'll fold it in, run my test in a VM and resubmit
> with the test as a second patch.
> 
> Thanks,
> Khan


Given the point is to optimize this code, let's optimize.
vhost pre-validates addresses so accesses are safe without
re-checking later.


-- 
MST

