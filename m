Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577906;
	b=XDI0RMQQ7fhdRaFGn3OY1TlGdxESJViuitxaYPLkUJiEmz1WmuUBDzbUDHDp6GZ3ApPK
	 c+REQH2CvfL1D5lE7nFX7WUKXBQ8c1EcwoTBjvwIJXCK9EGPUG3L7ulX0IUW3M0chyJoi
	 Q/TaH8/LPhFRI6T31Fw3MQS0EgpTEu/Du/3nEiyC97wMM+HiJROVCjVMO+yEBlVJdv5UA
	 hQF3yvY0pmkzHW16EZiNo4MMR+z8FgQEq0k9UeXuPjkp3UvIMCtjUgRo8z0nRnirbEHgB
	 ihrJuAlJQO6lltNVSlp4T31QNxgQGCXACLwPfHgTbPOZn62uFJ7YXKepRIMGy619zjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577906;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nzwVW9fNWfGXZUemLc1dTW/hhZ3xpHtCMfznCyx8mPI=;
	b=mg4DnLNMwIUkDP1cE8di3BK0tYdnWn51CtedfkkbXL9xChiPKB1uxeREw0X0+2E1IB0n
	 id3Rx0HyoM9+0nFkTH/hGp/cn4zDwVn5sQgzEqwWZ7TdbXE4NhzI9PRu/6G8O6EO5OFFw
	 OV/5rmVapN6gIO7qcuUgEIXXF1pfVxz0Tl9PY1xI5oLMJMkC5/F8Sy+T53PsCeQXfKfYa
	 5el0gg+dY62wsgviXTWLBDgks/NEwsDxmeg6v8kDtGUDuicDg7mk4tWb2PeA7qZtcLu7x
	 ujJrSmewaaAd7PgWNjmq0pFfR1G6oikkmHSao0itKrXXxi+Mfzff52R7XzSgg2VIDuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PquMVjty;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ECIV4Jho;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44188606CA02
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44188606CA02
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PquMVjty;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ECIV4Jho
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794577905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nzwVW9fNWfGXZUemLc1dTW/hhZ3xpHtCMfznCyx8mPI=;
	b=PquMVjtyZGfGYCr47ArvAw10Sx6XB1xjzp0Gz0SxHI8qWIFs80PQfh1xTcp4QHWjyKVu2g
	ysiGasak4ZP6CZkD9riBMfdwJ6fkwRcbc/cmQa9nrDb/CSlWsAJ3FGmmrtlZkFxNO+vfCj
	vjUaX5eIoNlUZBmyfUDOniWrUznGHQE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-uyrw-WeyOm6qUgsILvm4rw-1; Fri, 13 Nov 2026 08:51:43 -0500
X-MC-Unique: uyrw-WeyOm6qUgsILvm4rw-1
X-Mimecast-MFC-AGG-ID: uyrw-WeyOm6qUgsILvm4rw_1794577903
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso5494475e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794577903; x=1795182703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nzwVW9fNWfGXZUemLc1dTW/hhZ3xpHtCMfznCyx8mPI=;
        b=ECIV4JhoLU17HxPiNt/9IPbToz1Q9M0ZMdWYEbZF9dgHjBSqYjxBItkMJAdLrPIE/w
         9BaD9t99NeGPTSEuqAjus0I82h25o5EZpJtv8S6OvmXtCHTII9YNlxhqt80ejg7M4lPi
         jZaF+6TL4ftJXcnFmrSq+VQarvnvLHKzO38cnffKeUram4D6URkhgK1jKnUwQTBTzSlU
         VeS7ckUEYdgPXhCeZImkQ00tqQl3oG5kq2SXvcapUP2MG3X/gBOHnnM5VZuw7aMAYeeq
         g3W+5Gi/OaaFPtqtZWWkPntCnpw7El38l8SDggJY8npS4m1ealjIDpCzWcOZ9aj0b6i+
         mx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577903; x=1795182703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nzwVW9fNWfGXZUemLc1dTW/hhZ3xpHtCMfznCyx8mPI=;
        b=IGDHFmFffqsVbX9ULnxWtxi78eO40h+6mElROiTPsbyBjGJ6aU4GkEqNGlndwzYqrx
         Bt0MOmD5NUvvege0Nn9wPoNH1rHnMryPc/qUYYWU2jrurb3PVIHuef/3rrWH34g9zBe1
         np6NrnmPVvy6BhSP1wmMbteSgSAW0rI2vNG/2r9uOpBaVYS6jyxr8megJf3l97WjpDF3
         hlInUfNR+rj36DPJgeeTn2ITsiqqXODcw4GTiia0lO4duvPE8xtoITq+1aLckRh6kpP8
         5LbmN+IfcI0qk2M7DtRipTCl+o4gSte0cRrerORpYeqgB9xH9g6yyFmxLijMlKQ2/U2+
         7tzg==
X-Forwarded-Encrypted: i=1; AL+hErHqEHxA6NGUs+nPWcz6mYxDcZ51HV/CD6/XP0EAp4XNYLtnK/kCGbAVJNOl3xriXsHXlTXUXY6StNvSAek=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Jd2J6zs6z7QZSmB2ZJRRDFNcUavcDJbO6tb6+6XcjneVMOpI1
	g6CssGUuZsuh0sFTBpncjeFiLpAWwJ8bQMvnwlxBZr8VtuAhU+M7U6SlYfyKfM5uNfz+qkF4Q0p
	WcJHpd0EZ4Qjt07Nsx+hALMdS8FPaEx1PfsiS9HrrBrPeBjmbr0ZM0rDWXtmnicIycA==
X-Gm-Gg: AYBFou2sGYdyq6CbuISQK3YUkXPtLjPle5w1JksJmM0DL2RoserRKSAtlNf9oBZGFEO
	ghwmNBCt7nfaqg5b4IAak/o3ZN1sS+wTXrjDJXGAlTrrTGQWGRcLxyq12LP8s2LUKV5cWrDNVih
	yYw2juLMt34ycz3NU0pZyfr6kLiQC2kzN6Oziq2ak6unopNjhxKo5IAZ77BT7DNOZdG1O+HWKH/
	crTa7vBTSL3fPplnNU0OLgmfPmfxhSOpReZim3Zi4dIqKcgqerGJYsJ4VVvVLZZX+ydr2IF+cpe
	fj6/QmXOrHN719Am5SlSCC1M4PrBjTJMlVJF06oh/ngm7B8t2MmTjI5D8VUn797/wbovxQsuBuQ
	c1itlNmoES6/D7Jh59uaY9V9D1fpbN+k58a02oKg3wg==
X-Received: by 2002:a05:600c:c16d:b0:4ba:495c:2f5d with SMTP id 5b1f17b1804b1-4bb55a3e3f0mr51424295e9.9.1794577902447;
        Fri, 13 Nov 2026 05:51:42 -0800 (PST)
X-Received: by 2002:a05:600c:c16d:b0:4ba:495c:2f5d with SMTP id 5b1f17b1804b1-4bb55a3e3f0mr51423795e9.9.1794577901867;
        Fri, 13 Nov 2026 05:51:41 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1511:2900:ff37:b35c:a97:952d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5667a8aesm42328895e9.1.2026.11.13.05.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:51:40 -0800 (PST)
Date: Fri, 13 Nov 2026 08:51:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhaoguohan@kylinos.cn
Cc: bp@alien8.de, dave.hansen@linux.intel.com, eperezma@redhat.com,
	hpa@zytor.com, jasowang@redhat.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mingo@redhat.com,
	netdev@vger.kernel.org, tglx@kernel.org,
	virtualization@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH RFC] vhost: set dirty log bits without pinning pages on
 x86
Message-ID: <20261113083351-mutt-send-email-mst@kernel.org>
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
> No access_ok() here. vhost checks the log range when it is set up and
> I couldn't find a way around that, but GUP used to reject kernel
> addresses by itself. user_access_begin() would keep the check (and the
> nospec barrier) local. Something like this, build-tested on x86_64 and
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


So, you were right, it's better to check access. But I don't like
paying nospec. Let's use the modern scoped accessors?
Like this maybe? Very lightly tested, no time today, sorry.
If you want to use it:

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>



diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index 3a0dd3c2b233e..0bffa43e02179 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -594,6 +594,28 @@ _label:									\
 	__ret;								\
 							})
 
+/* set_bit() on a byte of user memory; returns -EFAULT on fault. */
+#define set_bit_user(nr, addr)					\
+({									\
+	int __err = -EFAULT;						\
+	u8 __user *__p = (addr);					\
+	scoped_user_rw_access(__p, efault) {				\
+		__err = 0;						\
+		asm volatile("\n"					\
+			     "1: " LOCK_PREFIX "orb %[mask], %[ptr]\n"	\
+			     "2:\n"					\
+			     _ASM_EXTABLE_TYPE_REG(1b, 2b,			\
+						   EX_TYPE_EFAULT_REG,	\
+						   %[errout])		\
+			     : [errout] "+r" (__err),			\
+			       [ptr] "+m" (*__p)			\
+			     : [mask] "q" ((unsigned char)BIT(nr))	\
+			     : "memory", "cc");				\
+	}								\
+efault:									\
+	__err;								\
+})
+
 /*
  * We want the unsafe accessors to always be inlined and use
  * the error labels - thus the macro games.

