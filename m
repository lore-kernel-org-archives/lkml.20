Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794550188;
	b=bBTjAo3S2CQnZbRRCUK1F8ICYOidB6Z3Faeziv+2vIh5D5rNcTsQhLD0s16WpLZnwaXv
	 3zRB+dfDnh5ya4lCIVbIxh/ampXxM2T7/+9l/KGfZDbYswocNs/Y3JTRbqC48cNu+Xbji
	 F/AYwCrCXydWgVNhPAk0eyk/PGaWvhwj4TgZbjt0L7SFT2hYhw3UPq9fNL+JPdLQ1KCtC
	 1EFgjQ+eIC9F78WkP5+/VnZz1RC5CrgNX4bwJbM7Qz2qFTFR6eBe3fdmsBTBJ2QfklJwM
	 NrfV2+8wGtkjnsXxSF5xqc1in8fMArSA5rZGfZeMfrVG5Q8ier7OAYPiOHURXbLIPXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550188;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1e0yVbVyaUWx+6t8WP8UY8dzBsxW0lJwI5VYRi8sJrc=;
	b=aUiy/p4TTpM9uHjkN+IMp8+kNKu1WrgyrrwdZ4sg3KW4LdsstWTIk7446D37ajaBl8V+
	 30eeDxMuAmA8Jm7J6Ss/dcXIFsI0jRHMoZzdKf/tAh1QXbuZjDpHvXdFGDS6srqAltLy0
	 7z2XFBykw1l50N+wjEoTL8a5h8FsdNYkSNoBtdponP7gjO47HNAgdQoYEP9koEsyJBJNA
	 fgVf3ViJmoEwLUtXnRq7mUCEeCGbQI+4wSGSThVF1BZkBkVH0YQVYzz0Pamx4aGD8NhtI
	 DYOejXgLI5vecRE1mZWhjYmGaj0CcGaiYILhz813vPc2tExd75CB4wz66PLqX+AO9mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ROqGFvX0;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QZrJ0Y9R;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B698A606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B698A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ROqGFvX0;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=QZrJ0Y9R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794550186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1e0yVbVyaUWx+6t8WP8UY8dzBsxW0lJwI5VYRi8sJrc=;
	b=ROqGFvX0jM4PXrIdC04TTYHXi09p1TKHOPZhS2h5e5qaPZyL7QKwWWpx83Hu0VDyoFd958
	VDMbBN0jW5aTqLuYo6QoWbEacmtUiufbo0QwL4Rv3UPPcl+Ytk+duvH9VQGWSXksj8XM+f
	Au33r+PY9mNiohTkXQJ9XJP52AEy6WY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-e8JpCL2eP7yzPffE6y33pw-1; Fri, 13 Nov 2026 01:09:44 -0500
X-MC-Unique: e8JpCL2eP7yzPffE6y33pw-1
X-Mimecast-MFC-AGG-ID: e8JpCL2eP7yzPffE6y33pw_1794550183
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ba078f26f4so3009565e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794550183; x=1795154983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1e0yVbVyaUWx+6t8WP8UY8dzBsxW0lJwI5VYRi8sJrc=;
        b=QZrJ0Y9RetdIoOJ8yW1TBkc5+0hTcH78/8G7ezdpjeHcSjyxNhFPYvXyilUneGDW9G
         9Ot/o8Ml9sIxs0X9zn6AW9SFvuJlZCYXW62sfWOWQwzmZbeFIWt/n+SRKkwrGsTCHzwD
         QCyWDx+cpfe0oPfpwzs6C0ALCeevMoZ7ZJjYcx4plNYuVEtGKoebf7p79SNCB3o1QjWB
         3xGkL5eAYgao/pHIGieIgkfft9imoxtDcYr77mIaOIOar6os6ztL0SkNATxdVRqhizao
         M9lMxeZRvuWpnbz3S7IpqUS95MtX3hy53Sq/nWnIUFWeJsKjSURj19HwS84mTjzGscjO
         kXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794550183; x=1795154983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1e0yVbVyaUWx+6t8WP8UY8dzBsxW0lJwI5VYRi8sJrc=;
        b=vXfXguzF2b+os3wzfSx5vzFUdXSne2PplAfjy9xtdMW61/Ple4oo0BUmPkgJ0LW6Ch
         XsbGZ8u+NHGiGsW1mwMur6+jqLPu9tsRFX2x5wXXYWq9HniYPAH3j4+P1OADOf2CgqzA
         6duPHJ+1qh12Uf1c5pe+a3CeJznefNX0pRImCgaJewQdPc98yE8xIFDI0PBqXNuVknCP
         ugL17FzKClIt0dkwzXBtsDozjZgNenmBPvaKbro7HU8va0LSYrB+O2rXZu26jxKjFtjL
         hyrfpQNQLE7LmH4a3AlmpbvYgCff1y+NC38pzNGIq+5GmW41VcxuHhP20gGqzMyB7dUD
         lxfg==
X-Forwarded-Encrypted: i=1; AL+hErFPh9aqnY+ADKKqkKzvhM+QGbaIUqw5AjSKfSQWAucex705tjjpDCllx3J5Or2Kwk7ICmYUg1aOUPdipKM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XFCAjhzOTcyZsSQ4Ii94QtXfM16AaThS55CdWde0zEFKm+yIe
	NR9y8w0G/FAubDa50Jhp27J5FStx19ESMpUHqjsiEiDBBlxx2Uqdgcrac9OcxoLsR6cAgyoXMbe
	6xyUEb/kvmSwWwA2VKl3+HzW3LmiumD/AgKBQOyrcBT90D6j7zBIPV/rRvvZuMnTtug==
X-Gm-Gg: AYBFou1doRwrVAhQkwF6M0CWZvNttbwEiuhZDR3T1JNFs60O1EjC7HuKQ5Sk39LOHBa
	R9FhF4m84q20Z3CEsVayW4X6YG5zFNdwmhVu1/4pju5RM6gkGEzS4nB37JmfcNrR6UH0RyBx3ws
	lDaZ3vyyjQSXFKmjiYzHGkGonZ3j6ncuIBUfx+QHFGQQohU+djkDTGa6APF7MX68GNq5I/pFimx
	lb1KIPdVyjZJSdYSuOjlolVyXlmsLR3i8ktD2knfqMP2Y4CJ7UjI0QO+nBuG3KcBLGCADGn8GbY
	d2EW/FmJ24369l8sP9EVLsYYOzyJBmf9yKMM1z0Ku70ifpsGgvco4JsuewKiHtKlqlEX72/IphI
	pvEKp7CPZ7+Rzq/AlOH6A3qf37FAIK30LkCe9Q7LIHg==
X-Received: by 2002:a05:600c:620f:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4bb55a3e3abmr26930915e9.6.1794550183277;
        Thu, 12 Nov 2026 22:09:43 -0800 (PST)
X-Received: by 2002:a05:600c:620f:b0:4a1:80d8:aed5 with SMTP id 5b1f17b1804b1-4bb55a3e3abmr26930375e9.6.1794550182655;
        Thu, 12 Nov 2026 22:09:42 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1511:2900:ff37:b35c:a97:952d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af1c5fsm33039755e9.12.2026.11.12.22.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:09:41 -0800 (PST)
Date: Fri, 13 Nov 2026 01:09:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhaoguohan@kylinos.cn
Cc: bp@alien8.de, dave.hansen@linux.intel.com, eperezma@redhat.com,
	hpa@zytor.com, jasowang@redhat.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mingo@redhat.com,
	netdev@vger.kernel.org, tglx@kernel.org,
	virtualization@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH RFC] vhost: set dirty log bits without pinning pages on
 x86
Message-ID: <20261113010007-mutt-send-email-mst@kernel.org>
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

ah, subtle

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
> addresses by itself.

just a side effect of the api, unintentional.

> user_access_begin() would keep the check (and the
> nospec barrier) local.

To expand on why is that not needed, but feel free to dispute
- addresses all pre-validated
- there is no possible gadget here, it's a write, writes are not
  speculated
- lock prefix so no speculation anyway

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

