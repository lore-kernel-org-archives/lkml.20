Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479566;
	b=hGtB4c3oktBnf8EbMmjsEZAYLP0Le8hMjtxp+idPArlZa9/Koqj4ncJ6dW7CtDh5k6w4
	 f+IsLqEXvkZdvZ845hxuQMfYvIYJAbzSWKtLHJesyeuumHio+/QkYG5aUkQRk3qS0SKn4
	 pGPha0eEejNbSTQ7SD4wdqXnmqGQ7zGqUT6LnuhMV9RsvT1qMgyM3SNBdpwn1SPZnpIw/
	 0rk/HulzVbjm6L5QCblbU24sVxxeF2QQz67op6/NlyeLuzRhLqeA5Uqv5PK0bqLsLUtT5
	 Z4oKZWKcZuq5SCm3c98kGyTzfYMe15PGVnYi7LJYC/yVD/DytmoQdn5wCmNydEdsgkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479566;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UL9CkfGicYHskzbB7QLYGJW2B+YLZ3fPF5rU/gdSK84=;
	b=5NXmblvHsHU8uguQe4vmrpLX/WZmngJskiFvBGAG1MnyW/81Rr+ipNJtU47pou7wsozg
	 XUvIq1PmXZxwuVs4bInLHOLJPm3Y1xzBqsfUJ9Ny4TKRDibINtaEjBQnlerxcjL8TWVVi
	 XeonkYOpUZeP2dfc6v1S4cHUQUeO3G7NQifcz51bMvGiylqW34hB/0/qjOnwudgBDb91Q
	 3Cm8duEX63+X0WplzVwWbpiNcmxZ6ku8MLQjQiieAWVDUuIU86e2GLmlvI5PBp8s8en5a
	 GDErYKyxAOlSdlI1wRmIl39uY/dJju2qk7aGygLKm7einkQjTC6G3zXisEGm7/Nsnpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H6GoxvVS;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kPOjEmLx;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EA2606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99EA2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H6GoxvVS;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kPOjEmLx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794479564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UL9CkfGicYHskzbB7QLYGJW2B+YLZ3fPF5rU/gdSK84=;
	b=H6GoxvVS4F51pSPvZvl/jhI8miBhe1vCkCm7gmzetQTXKX8y4MuXw3ACFtsxIOwRZayF0P
	xBm56W6vnCAQ04TPVVv6qqUr7W/WrtqVLH3mguUEyGGnW56ARwhpzMAkaB+IyHSoMznP6T
	zEDURlVu5lhmtu3DllMF3S5RoboPbSo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-EjCxPfKSMfKwyVcIhhqIfQ-1; Thu, 12 Nov 2026 05:32:43 -0500
X-MC-Unique: EjCxPfKSMfKwyVcIhhqIfQ-1
X-Mimecast-MFC-AGG-ID: EjCxPfKSMfKwyVcIhhqIfQ_1794479562
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-492e3189fc9so2916670f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794479562; x=1795084362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UL9CkfGicYHskzbB7QLYGJW2B+YLZ3fPF5rU/gdSK84=;
        b=kPOjEmLxu7gi1CdtO0vcG03qXrRfY2c3j4RfSnB3JcoexUEtKw6J/cjWCsKeek+/pj
         9FAUM5+s+khOQf2DfEPj2jWuf/AZ/Kx8fp2BYUITwTTKoF7eVsgjwYWVtNy7EU3fN9hg
         1uMPIfwiNvHYrV4P9ijjxgTqU+kjvRfEhlPOdb/j3sSUg6Dk0sGLKsaezUlUKCMldtvs
         Ozl+6fFKZA7upZ+XQOK4R59KSOuF7oNEwVLFPH3GQ83Grf3fRUPWzdemsTvTBPpQiwjb
         MjcyMo3oyLUebQrWht++6K1Ypqik1PWFh2yHGU6fHC5xUtl/r0GIRfyE7wZ+bEpufXjK
         GU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794479562; x=1795084362;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UL9CkfGicYHskzbB7QLYGJW2B+YLZ3fPF5rU/gdSK84=;
        b=2oRMMQ7kNZlaeObd+bQM14HDDMjBZxTbOKCfQRKsw7jfxBE1aKvI8I65J+kyX32BiQ
         Xr2l9jtKmx3oHWHLSmF2jN0OSCqqDG0GrVjInihEkr7tTvu867ZbNWiwfXpgvlsfZpVh
         iAgyenDIKSXeAYMOxxGoxHzGtJ98mIobQZhovBHBnwTdtYIcRoIjn3Q1buk/wAG/5u60
         Ap9y6bPH3VoXu5Xa+QaxI8rBV9AUCcFK96WC3J8sXdZNhHkeZ6v5XBfKqfhFhM7IRWfM
         D03n1TXBCezYq45I7/RI9nCPMd8UKil/4dOTb1odNx6ulDbSnmiBK4fIRwfOka1+brI1
         jO3A==
X-Forwarded-Encrypted: i=1; AL+hErEKLdPQHWJ0MOs/bVwknds9HL43F3GD0nbjhs66ow5hnhFjbpHd/ciX2aN+T0vlcFkX88xVD5BsJ2YoH2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Eoz30B9lUUKl3VKukwD8q9J3uw87Npd4mME/jSLtN35EyGKMJ
	p3Uo57hUO4+j6eN4HOWNz/vMayje+tyvJSxEV0otIl1QNMl/bFnEfHGcvYWmZ28il9FVBoF7+cz
	mGWorDXQMdPBIZ6FXC9Q2xtDEyLNROuZ2uG8hI16guNIVaSwJr10PuXs0/TjlFupwScDqT1WAvQ
	==
X-Gm-Gg: AYBFou3vt54wlUX+pIfGeAAyoD9kAey3TJ4HtjH+4j9yZNuqq6Nuqjbpov9WAQYPCsd
	d0G7HderqaLML+Cr6FErkGvFTpf92VJoytIFIGgQNGGqHJkdWwP2KBLXlbKY4wizKmtayD1eAg4
	WX2bNA0rVT/yRWcAL5mSz4Jj9cGTBCr7H1xhGRqwRaXV5YkZcTf0t0YzorcxX2BacFu1k1cwHVB
	AcNYn9xyeR6GHVjUY9/zGKeAvohXHucJawiXDl3nB7nBBtgHxFCZBAOlgUrAh/iVzmi8Iu/9fci
	YHzJ29wF4J+Qe28e10SS9AZOFLlkhPzqMFFfesuKQ4Htgnq5UK/8Vh5q0OToFDuPFvJXnPmj304
	/RZNUsyr4CzQs63jbxRtsaV0/fFmTUdCL4orVTGeu0w==
X-Received: by 2002:a05:6000:1861:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-499c68d2bf7mr10244188f8f.18.1794479561873;
        Thu, 12 Nov 2026 02:32:41 -0800 (PST)
X-Received: by 2002:a05:6000:1861:b0:48b:1296:52ec with SMTP id ffacd0b85a97d-499c68d2bf7mr10244096f8f.18.1794479561175;
        Thu, 12 Nov 2026 02:32:41 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1511:2900:ff37:b35c:a97:952d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bd6esm16325613f8f.28.2026.11.12.02.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:32:40 -0800 (PST)
Date: Thu, 12 Nov 2026 05:32:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhaoguohan@kylinos.cn
Cc: jasowangio@gmail.com, eperezma@redhat.com, xuanzhuo@linux.alibaba.com,
	kvm@vger.kernel.org, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] vhost: set dirty log bits without pinning pages on
 x86
Message-ID: <20261112051259-mutt-send-email-mst@kernel.org>
References: <20261112085631.128819-1-zhaoguohan@kylinos.cn>
 <20261112085631.128819-2-zhaoguohan@kylinos.cn>
 <20261112045853-mutt-send-email-mst@kernel.org>
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
In-Reply-To: <20261112045853-mutt-send-email-mst@kernel.org>

On Thu, Nov 12, 2026 at 05:10:10AM -0500, Michael S. Tsirkin wrote:
> On Thu, Nov 12, 2026 at 04:56:30PM +0800, zhaoguohan@kylinos.cn wrote:
> > From: Khan Zhao <zhaoguohan@kylinos.cn>
> > 
> > set_bit_to_user() pins the log page with pin_user_pages_fast(), maps it
> > with kmap_atomic(), sets one bit and then unpins the page and marks it
> > dirty. This runs for every bit set in the dirty log, e.g. on each used
> > ring update while logging is enabled for live migration.
> > 
> > log_write() always passes a byte address and a bit number in [0, 7], so
> > the update can be done as a byte-sized cmpxchg on the user address. On
> > x86, try that first using unsafe_try_cmpxchg_user() inside a
> > user_access_begin()/user_access_end() section with page faults disabled.
> > If the access faults (page not present, read-only or needing COW), or
> > the cmpxchg loses to concurrent updates of the same byte four times in
> > a row, fall back to the existing pin/kmap/set_bit path, which can fault
> > the page in.
> > 
> > unsafe_try_cmpxchg_user() is only implemented on x86, so other
> > architectures keep using the existing path.
> > 
> > On an x86_64 KVM guest (i7-12800HX host), a synthetic used-ring
> > workload with logging enabled went from 243.60 to 171.11 ns per
> > descriptor, averaged over five alternating runs. This is the
> > end-to-end cost per descriptor, not live migration performance.
> > 
> > Signed-off-by: Khan Zhao <zhaoguohan@kylinos.cn>
> > ---
> >  drivers/vhost/vhost.c | 50 ++++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 45 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> > index e29f154706da..9c3045504709 100644
> > --- a/drivers/vhost/vhost.c
> > +++ b/drivers/vhost/vhost.c
> > @@ -2527,11 +2527,7 @@ long vhost_dev_ioctl(struct vhost_dev *d, unsigned int ioctl, void __user *argp)
> >  }
> >  EXPORT_SYMBOL_GPL(vhost_dev_ioctl);
> >  
> > -/* TODO: This is really inefficient.  We need something like get_user()
> > - * (instruction directly accesses the data, with an exception table entry
> > - * returning -EFAULT). See Documentation/arch/x86/exception-tables.rst.
> > - */
> > -static int set_bit_to_user(int nr, void __user *addr)
> > +static int set_bit_to_user_slow(int nr, void __user *addr)
> >  {
> >  	unsigned long log = (unsigned long)addr;
> >  	struct page *page;
> > @@ -2550,6 +2546,50 @@ static int set_bit_to_user(int nr, void __user *addr)
> >  	return 0;
> >  }
> >  
> > +#ifdef CONFIG_X86
> 
> Wait this is x86 specific anyway? So let's just implement it
> properly, why do we need all these hacks?
> 
> I run a quick test on this in a VM, feel free to reuse:
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 

sorry fat fingers. wrong file. this one seems to work.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index 3a0dd3c2b233e..ba1e7c3f83c8e 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -594,6 +594,24 @@ _label:									\
 	__ret;								\
 							})
 
+/* set_bit() on a byte of user memory; returns -EFAULT on fault. */
+#define set_bit_user(nr, addr)					\
+({									\
+	int __err = 0;							\
+	__uaccess_begin();						\
+	asm volatile("\n"						\
+		     "1: " LOCK_PREFIX "orb %[mask], %[ptr]\n"		\
+		     "2:\n"						\
+		     _ASM_EXTABLE_TYPE_REG(1b, 2b, EX_TYPE_EFAULT_REG,	\
+					   %[errout])			\
+		     : [errout] "=r" (__err),				\
+		       [ptr] "+m" (*(u8 __user *)(addr))		\
+		     : [mask] "q" ((unsigned char)BIT(nr))		\
+		     : "memory", "cc");				\
+	__uaccess_end();						\
+	__err ? -EFAULT : 0;						\
+})
+
 /*
  * We want the unsafe accessors to always be inlined and use
  * the error labels - thus the macro games.

