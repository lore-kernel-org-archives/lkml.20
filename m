Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BB758039C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176960; cv=none; b=bmSEQbB5GwTJgvV8LkAApf6Q8xv/e04BxORcTr4gNkVKsYWoDIkRCw1VAoYLtGO68lB/jWo0VWt0ZXZIdbCNX6trRHXrL5b9Cok2pMJNmoEnZMFX4SP2M/BiOXXkKjxT9R+1HI3h8h/uQeDHdVKhEQPd8q66E8SKTaylbuFp+QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176960; c=relaxed/simple;
	bh=yY0kJfI01Rw2AfDbOCtrdQF+byY/coJMlcJ81UoBYXA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fv8SkuTm4gL1yn+nKoMLZTVh7s9V8wTw0K1hh8DqoZXoCVK86/37mesrqjiLB5UO6tDf5o3kGm+u7z5D6S8QyiZKVrPuAhC/gp6E+bZIqvNfwG5x1lA2pW0F5fRhwfn4HyzVTGZR00aVSBjsf0jn3AUlgiKVGYnaswuSWg7Zyd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMkC+Zmz; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMkC+Zmz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso13711645e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790176956; x=1790781756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2MN0kXIQBzh7Av0NtqnLLt7RvllEa0igVF7Jr0x+c5s=;
        b=jMkC+ZmzpnLFrJ7tGa1+2bNjFN/pgh8yQFcDCIAjn4i04yNu+prMvtqoF3277Wj+fQ
         CLgVqsHtlbcY8IOyhoQUyxCECf9eVWPz5xSiDEBYTXcY0gXewQNKpq9is0KY3S5DyVuc
         kAfCvTVeMomq5JTIhHMK9SBy7TJYOUpyWNkFvMcGZGjOefRv73EDwvrGuqKlnwrmLYFR
         d0UIJ8wUFp02HhTkfpGXxdsxSN7vrePPsax8Oa9gOt8WjdCr1W8kzk7u+Z3iPJ4Bpgph
         1i5LYPYNX9PlgGbuhjJa+hV2aMZwODZSmAcZQlFDQ/cPys3PpQtQeefNp6A7QZ7LckiZ
         wx7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176956; x=1790781756;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MN0kXIQBzh7Av0NtqnLLt7RvllEa0igVF7Jr0x+c5s=;
        b=yHZ23VS7dy9OHxt7RfUj5kSGRR/IkDH3Q8go9XW53EjG4STivy5jPwmPz/wmylh2PO
         FrTNjG01VWKrvElqetOKOAF0gnipcBm+qhO+VkZuc8G0EWmLOYM287QiqQQdAHhYgD8J
         bGdb8IjS+Si/WHWckaDEAGsERTcucE4RXFWYdi2ITKFcKoxAdlrRWKfeu4Gl2j+7oZNg
         EPXH5NKxTb2JfxD5w1YB4YvzxFoNKlPFcGzjpw1QMhOr6Exfg//fYaCXN2QpV/m0YrQU
         NMpw5ckr4pM2zPEUJYlJpA6LAq0sHhm/Oj1Iw5JgJbWloBsN1XDXyJV+XhOPHGQ1vcid
         DKtA==
X-Forwarded-Encrypted: i=1; AKwUvByTnfbPDlip/j33fBFyrkwUKVYk3uCevxjcWlujtYTlZ4nbhT5tTT/thjwFURSdZEAQwMLvM//F9fn5Do4=@vger.kernel.org
X-Gm-Message-State: AFuF++lJOQ8GYs/wB7os9qyLyKTEc0j/wutQ2rp+A5GYcOhQxgXGCKut
	S4LbDOeaIRiaLznsR5C/C30KVttoNidDLSfQ/obrCpPu034V9tRMlisu
X-Gm-Gg: AYBFou0fFA74PbwNhqos70Ky4PSdyuNFaeLGFkFP6ZVqUYq/gZGNHXVo/4p8P8mcwEQ
	CqbMm8gw5A1O0mI2EzcwlRCW7dLgKg0RFlxTfM7teIeC8xXT5aAK3Yd+S0CZXy83aLSQdxQIZtq
	5NYPlgAcvmMc/QVfI69hnyIREnF76tnoyaT+fZgZLkcoLWmngTejh5076BxpWmV/ddgh5Q2amAH
	H6Lxwco+Z1xlXptr83b4U6az9vGhFl8Nq4CiwERV0zGAo3OuqGoxg6NWm4eJnWd8mghUdo0EKDl
	UVYC1i4LY1fSCtK6+q9A+pVHMvLcop+QOnHT/NVVs1PXiXpgUu/cznsZpqJRr4nKJserKPUtFM3
	sa9RC8x7+1JXU053rno/O03QXwFnwwd8q5+btMnyFtYmZVEZlWWv8PFu6U3l2yA2Mu4ajGBN26t
	IbVl5Lf/Zo281OxLacYGq9/4GIIi5IavXBQucsrfDuNYBwb7nM1ppUCiLvhSdInQyQqcu+FheKi
	WRSayxiM6bEOt1ajGkaoEwPG2cNB9onBcw=
X-Received: by 2002:a05:600c:4e05:b0:49f:bd3c:bc16 with SMTP id 5b1f17b1804b1-49fdf1371f6mr41833485e9.17.1790176956473;
        Wed, 23 Sep 2026 08:22:36 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe14322c0sm72636225e9.5.2026.09.23.08.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:22:36 -0700 (PDT)
Date: Wed, 23 Sep 2026 16:22:34 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] x86/uaccess: Drop the address space qualifier
 from put_user()
Message-ID: <20260923162234.394061af@pumpkin>
In-Reply-To: <CANiDSCt9nOM8OWY21Q=ei5dmOK2O+DB1aYdd9NrbLt3e+pJPUg@mail.gmail.com>
References: <20260914-unqual-v2-0-60a1407a0cd4@chromium.org>
	<20260914-unqual-v2-2-60a1407a0cd4@chromium.org>
	<CANiDSCt9nOM8OWY21Q=ei5dmOK2O+DB1aYdd9NrbLt3e+pJPUg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Sep 2026 13:08:20 +0200
Ricardo Ribalda <ribalda@chromium.org> wrote:

> Friendly ping?
> 
> On Mon, 14 Sept 2026 at 15:53, Ricardo Ribalda <ribalda@chromium.org> wrote:
> >
> > __typeof__() preserves every qualifier, the address space included.
> >
> > When we do __typeof(*__user *int), we are declaring a __user integer,
> > which is pretty much meaningless. A value in a register or in the stack
> > does not live in the user address space.

Doesn't that mean it is a smatch bug - so should be fixed there.

Somewhere in the middle of this there ought to checks that the value
is the correct type (eg pointer v integer) and that, for put_user(),
the destination pointer isn't const.
Using:
	auto __x = 0 ? *ptr : x;
can be more succinct than other versions - might not help here.

David

> >
> > This annotation did not trigger any error until a recent version of
> > smatch[1] started caring. And as a result of that now we have tens of
> > warnings like:
> >
> >   drivers/media/usb/uvc/uvc_v4l2.c:1112:13: warning: incorrect type in argument 2 (different address spaces)
> >   drivers/media/usb/uvc/uvc_v4l2.c:1112:13:    expected void const *from
> >   drivers/media/usb/uvc/uvc_v4l2.c:1112:13:    got unsigned int __user *
> >
> > Instead of __typeof__() use TYPEOF_UNQUAL(). It maps to
> > __typeof_unqual__() in recent compilers, so the address space annotation
> > is gone.
> >
> > [1] https://github.com/error27/smatch/commit/e53027a4e816a772403baafa83c09e4a94c1cb8f
> >
> > Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Link: https://lore.kernel.org/r/20260825-unqual-v1-2-7024fb81b4f9@chromium.org
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  arch/x86/include/asm/uaccess.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
> > index 3a0dd3c2b233..4e576c0b9131 100644
> > --- a/arch/x86/include/asm/uaccess.h
> > +++ b/arch/x86/include/asm/uaccess.h
> > @@ -172,7 +172,7 @@ extern void __put_user_nocheck_8(void);
> >         int __ret_pu;                                                   \
> >         void __user *__ptr_pu;                                          \
> >         register __typeof__(*(ptr)) __val_pu asm("%"_ASM_AX);           \
> > -       __typeof__(*(ptr)) __x = (x); /* eval x once */                 \
> > +       TYPEOF_UNQUAL(*(ptr)) __x = (x); /* eval x once */              \
> >         __typeof__(ptr) __ptr = (ptr); /* eval ptr once */              \
> >         __chk_user_ptr(__ptr);                                          \
> >         __ptr_pu = __ptr;                                               \
> > @@ -231,7 +231,7 @@ extern void __put_user_nocheck_8(void);
> >
> >  #define __put_user_size(x, ptr, size, label)                           \
> >  do {                                                                   \
> > -       __typeof__(*(ptr)) __x = (x); /* eval x once */                 \
> > +       TYPEOF_UNQUAL(*(ptr)) __x = (x); /* eval x once */              \
> >         __typeof__(ptr) __ptr = (ptr); /* eval ptr once */              \
> >         __chk_user_ptr(__ptr);                                          \
> >         switch (size) {                                                 \
> >
> > --
> > 2.55.0.1007.g17ff1f9808-goog
> >  
> 
> 

