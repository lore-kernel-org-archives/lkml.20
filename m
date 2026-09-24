Received: from mail-wr2-f32.google.com (mail-wr2-f32.google.com [74.125.225.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1DC279329
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790237448; cv=none; b=meYMo10SIYusu4N1WNjWke1yWlD74KCkwWFFwNd4Y4aHEga5oXEo0POhvWpR5vrg5pUeGnGpsvidsBXNRLpdBmu5VrpkT6aL8204ES+aClGU4YQ8TQqsJwrv7U+GXLt2lR0K9QFttwpYpzDZWYM+SOCEL/uxFzpCFRWpFuui7lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790237448; c=relaxed/simple;
	bh=1sYGNP9F77lssouZt/LAMY2DL27+FiDVLYPRFec36ao=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y6r915+PRimmo6eXG+1SOVd9hebAwvZS+ziFIbGLEIm2gEhD/7v5DFzsYg7g7IAA9+uCYV2YJJwM+Ufc9WQEShqzURQtvJPo24UJakJEvBzF4Yw8KW4Gw4sOwXxrrIXWYYOJ7v2Qxmc5wzJqd2kJFUNRL1qkZY0PZie/uBepK0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n9wNdbrz; arc=none smtp.client-ip=74.125.225.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n9wNdbrz"
Received: by mail-wr2-f32.google.com with SMTP id ffacd0b85a97d-482f6350f91so1102772f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790237441; x=1790842241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xOitTOxkjr0KxAAwQfYSKSbkg3IwDke7kzxN5nsLJi4=;
        b=n9wNdbrzR0RGUsr3sn2pTIFMGnSLSA36I9j0RWFYNOt84r/savTQjAn5fmoe0+58V/
         mqW9UgUzip53s4Z2QqG9vm1pkzJNG+kIakz6Nvm1UStZ4Zo/fOUCWp5wajOukqy8eLoM
         +X8PFd7eg3yCPl0qJqSnw7I/NjtfdRIQfnKBNdxzT06R0Za3vdrm8HH+PHxzxTyAvtmI
         pd0UsHE4j9ntku+BrkRY3eC1MlR8fMD21R2htZiZfS/uEEfvqe5AQ1GRCME3NDpazU4Z
         InUAhkDFC4fqPyUxizEkUpvOQoy9gcrLDUcCfEbX//qXBOs+GkQqj0u0H36W2j8ELeGR
         1ZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790237441; x=1790842241;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOitTOxkjr0KxAAwQfYSKSbkg3IwDke7kzxN5nsLJi4=;
        b=20ze33z6nmvZWFDuJpe3vQrf35XN36t2fk7GctbX6o4SYCZDOvDQ43zijfp/fNJkGw
         M2gNR7iQ3K3rCcQtgV6q28WZoR+cKtP/qM3rUTICy+jwBiz18fLrb0ZhNQH62vwL5q1a
         SKk+PzRLG3IoKVaPtkEOdgO8W9Sl9kQVab4kAjEVudorTWiPEUg8V6jG1yBkIAZrnNDJ
         4SDcWHbjtnZPPphxrW5OCW5T1mutiYA4Olm8JUVjxIROIVKgCIcfoyq9+PDLCR7GiydU
         bsHdLEGZoh4PhiURydCZYvUQGVNONFz0itF8Bnxt2QuDaNvtT7DcZNQptNmNZX8tlYil
         ybeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVheLG45IBupeKTLdygU+uAw5e/6sYsc00XtVQoPVGfr6ax2x1pGRdh/0VcdmkkKBHgIFDlyzX/qU+Jt0=@vger.kernel.org
X-Gm-Message-State: AFuF++kBvWs/By7M75CEjYsE48mAxHRTglcxY0gDq0QsQypYlu3HNB0t
	iJ/VQcjHNwlFC+shmJ55WFrclxWnNVJGxk4HyvhOfgE4EPhRIvwi4TmD
X-Gm-Gg: AYBFou2mi1DdVdzqBqKBHkfh7YQibjVhuKDV6N0Zl/vxvdQplwqER305pJE5xpjWWVz
	+9KkXdWTQmPKqry8xgeCGqTBfCgpGchOXo/BBvtY51t0CJamkbSNC88rBRQFoSlv4Hc9H0Xg0IW
	TSvDsZhr1f5pNbwYeXtaXcDAa+EGjjEbkWknhQD8acVPkIcP/AB9r0v3d8XJSKXViDmRLbZT5LO
	LPXcmmrCPh/k3KoAqS2WUsSeauGuNMkqYQ9X1HtanslDRtFhUppxTSMxgKh0p79Xcx1ww2d75Ky
	XSwG6JZTjuriZUwZw5s1Ig70kayWxHZxypc9UzmDBW2XsohcYopDN5gv+E4t83Miz2MvdVLslBl
	lhzIkZFrGFTuTfRDaupaEaEUUHjZx4CcUwK5DHLL69uvNoBMqDbr2WCflhg/1sLhUiTxN1PwwrP
	jl5UBMswzyYP9ZPUpcAnDGNLkk8NmeAhCC+6fsk+zW2lW/hsaCK4DvKIGNXAunOjOLH34QOTXa+
	WX5AuvFChGBvviLOCQ3Jn0iTCOHQoT0Lys=
X-Received: by 2002:a05:600c:6098:b0:49e:7cc2:e6c2 with SMTP id 5b1f17b1804b1-49fe66fd482mr30657885e9.27.1790237441192;
        Thu, 24 Sep 2026 01:10:41 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5bb9891sm43633305e9.6.2026.09.24.01.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:10:40 -0700 (PDT)
Date: Thu, 24 Sep 2026 09:10:39 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] x86/uaccess: Drop the address space qualifier
 from put_user()
Message-ID: <20260924091039.1c4aab7d@pumpkin>
In-Reply-To: <CANiDSCvqC_Kn20zOA+dQBmppi4KAO5g_4a_s-opkDa+CT=0YWQ@mail.gmail.com>
References: <20260914-unqual-v2-0-60a1407a0cd4@chromium.org>
	<20260914-unqual-v2-2-60a1407a0cd4@chromium.org>
	<CANiDSCt9nOM8OWY21Q=ei5dmOK2O+DB1aYdd9NrbLt3e+pJPUg@mail.gmail.com>
	<20260923162234.394061af@pumpkin>
	<CANiDSCvqC_Kn20zOA+dQBmppi4KAO5g_4a_s-opkDa+CT=0YWQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Sep 2026 09:19:16 +0200
Ricardo Ribalda <ribalda@chromium.org> wrote:

> Hi David
> 
> On Wed, 23 Sept 2026 at 17:22, David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Wed, 23 Sep 2026 13:08:20 +0200
> > Ricardo Ribalda <ribalda@chromium.org> wrote:
> >  
> > > Friendly ping?
> > >
> > > On Mon, 14 Sept 2026 at 15:53, Ricardo Ribalda <ribalda@chromium.org> wrote:  
> > > >
> > > > __typeof__() preserves every qualifier, the address space included.
> > > >
> > > > When we do __typeof(*__user *int), we are declaring a __user integer,
> > > > which is pretty much meaningless. A value in a register or in the stack
> > > > does not live in the user address space.  
> >
> > Doesn't that mean it is a smatch bug - so should be fixed there.  
> 
> I don't think it is a Smatch bug: __typeof__() preserves all
> qualifiers including address spaces. Smatch is just enforcing that
> more strictly now.
> 
> I'd prefer that developers explicitly say when they are crossing the
> address space boundaries, and TYPEOF_UNQUAL() seems to be the right
> macro, which also Dan recommended.

It depends where you are removing it.
TYPEOF_UNQUAL() also removes const - which you don't want to remove.
It is also entirely horrid on older versions of gcc.

David

> 
> >
> > Somewhere in the middle of this there ought to checks that the value
> > is the correct type (eg pointer v integer) and that, for put_user(),
> > the destination pointer isn't const.
> > Using:
> >         auto __x = 0 ? *ptr : x;
> > can be more succinct than other versions - might not help here.
> >
> > David
> >  
> > > >
> > > > This annotation did not trigger any error until a recent version of
> > > > smatch[1] started caring. And as a result of that now we have tens of
> > > > warnings like:
> > > >
> > > >   drivers/media/usb/uvc/uvc_v4l2.c:1112:13: warning: incorrect type in argument 2 (different address spaces)
> > > >   drivers/media/usb/uvc/uvc_v4l2.c:1112:13:    expected void const *from
> > > >   drivers/media/usb/uvc/uvc_v4l2.c:1112:13:    got unsigned int __user *
> > > >
> > > > Instead of __typeof__() use TYPEOF_UNQUAL(). It maps to
> > > > __typeof_unqual__() in recent compilers, so the address space annotation
> > > > is gone.
> > > >
> > > > [1] https://github.com/error27/smatch/commit/e53027a4e816a772403baafa83c09e4a94c1cb8f
> > > >
> > > > Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > Link: https://lore.kernel.org/r/20260825-unqual-v1-2-7024fb81b4f9@chromium.org
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > ---
> > > >  arch/x86/include/asm/uaccess.h | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
> > > > index 3a0dd3c2b233..4e576c0b9131 100644
> > > > --- a/arch/x86/include/asm/uaccess.h
> > > > +++ b/arch/x86/include/asm/uaccess.h
> > > > @@ -172,7 +172,7 @@ extern void __put_user_nocheck_8(void);
> > > >         int __ret_pu;                                                   \
> > > >         void __user *__ptr_pu;                                          \
> > > >         register __typeof__(*(ptr)) __val_pu asm("%"_ASM_AX);           \
> > > > -       __typeof__(*(ptr)) __x = (x); /* eval x once */                 \
> > > > +       TYPEOF_UNQUAL(*(ptr)) __x = (x); /* eval x once */              \
> > > >         __typeof__(ptr) __ptr = (ptr); /* eval ptr once */              \
> > > >         __chk_user_ptr(__ptr);                                          \
> > > >         __ptr_pu = __ptr;                                               \
> > > > @@ -231,7 +231,7 @@ extern void __put_user_nocheck_8(void);
> > > >
> > > >  #define __put_user_size(x, ptr, size, label)                           \
> > > >  do {                                                                   \
> > > > -       __typeof__(*(ptr)) __x = (x); /* eval x once */                 \
> > > > +       TYPEOF_UNQUAL(*(ptr)) __x = (x); /* eval x once */              \
> > > >         __typeof__(ptr) __ptr = (ptr); /* eval ptr once */              \
> > > >         __chk_user_ptr(__ptr);                                          \
> > > >         switch (size) {                                                 \
> > > >
> > > > --
> > > > 2.55.0.1007.g17ff1f9808-goog
> > > >  
> > >
> > >  
> >  
> 
> 

