Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A174A3905E3
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234375; cv=none; b=TFm4f0m+28/RV6Y+ukLH1cq54xWtAXGtlkMN9h24BKSP4ygzNYUJzTvHq8b0G9/sF0QFc1oiDrseQ0wdpibuNmAnzvjjfvnrpnsuW1meHnXZVXqAO2JtXd0uoN21Nk/36YoQOQTn3v4+oTEMrzAGSqbEErCFlhyXrGeKiLeU6HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234375; c=relaxed/simple;
	bh=446Ipwf87TsFSy7IXoMB/p1qBMbO9KZb0MU0f8j6sDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tP26/5RwBwJmVeR2RhCZIyXWBohCTG/pQC5g0boCCK2wdP4Lkig9ErdFOSQ7W1WsAEUkQZRyKnurjrzqIyYfR9Zr8V1Y4XDlIY2n95cK5U9Aqiel+qtNWb3rw8ICTJWHbmniWh4aVKrHWL7gMC5d5+7eUHOEwaRy/D6AdoKtQUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SRMTvyWy; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SRMTvyWy"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34f01so1043252a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790234373; x=1790839173; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xkM0YegMLjtxLCx2J8zlo1pNEp/XjEQu6zvYI3W5I8=;
        b=SRMTvyWy7YtO1nQAH3UNDo1R2XBvvAaJYGTbN7dF770VovKr8N6RbisLtsakB7IjyM
         0ZEHUieNk4xBgp9v1saOmHc1fSDtAs2maxkPPZuC8Mmm3W6x4poCsE2GChqlq5bKxihG
         U+fAEGx+Rmm/rDhsWruc9wWUkg2sU88wi6wG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234373; x=1790839173;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4xkM0YegMLjtxLCx2J8zlo1pNEp/XjEQu6zvYI3W5I8=;
        b=JzMj4PHyEsaGedNuy9BCXUND/Yimr51xkWJCmyVKOQy/VZ1qjdRYt0hOIpU7BCw05l
         XE4nchuDGVjIWDKEhzKpO5treMPVKRdOfp5Tyuv7YXCTpFzpUSZlteihTIpV2wvCVwFA
         5L5GEbd2vghlo89d3yTAg1BQWtXewt+I1uozJddJDeOts7Vh5hvscpJ4B9IjXhADytFV
         JVrU7R8F5kKGQuLDvu1hEvyiAQnB+rVocCasfwb/fCUsYWUuoF5+7DU1FeVgMjbmhAl6
         nYEYvoqTxexskSV9rAhM29v0XeIm1476oWGsKPBfeB1r9JeA1LDw9Tv6WbyIGyqH3fJ0
         pmdw==
X-Forwarded-Encrypted: i=1; AKwUvBylERY51DuyIrNdeJLV3fPmUqhVpvrMurNwdLlR/UU4FlCjFUMqhhpvvIdqDVVtztmapER+vxNpH2obX0U=@vger.kernel.org
X-Gm-Message-State: AFuF++mDpiE51NWmTkZHC7EBrQKGEQqbdB37PL84kBLdUWHyiiB7/eJn
	dtl7dZz4wHkQCjeF4xohAjsb2um3o2TNYbHGZMCP3AULT6c+NqSEts58udnqlblXvSyohTAaY53
	u1h0=
X-Gm-Gg: AYBFou1I31f48zp3J72CAisYJzSYlYza556wI99mdhLj8B8UbsXNQcfMO7NktjKDhPc
	6hSItxEsKX10+6HVNs5Xc7kt/u0NI53MatN3t3FsrtzIRZPJrHSe654hNo5KaQpltUOjQiyHNsh
	gEdYNvN/RiAs5lDkNE/Z/Wq2pNmD2hXJUdHU1Q+/8vwboqzcyN341AsCdTJ9QYVpYqGb/ImMzvW
	7bgyAWaTB1n08zUm1kiaQ2YV3Od4T3qYcpNIjIsyrHFDlIQTbngfeIibvLIMdw9tGer5ZJLw4C3
	sxu6FVKbccCQhh2v13meLmvCLhEiy7/EWIhbUPhenyoLvRhfRIXPDWtxdled7RWPleOgwYg1VAj
	/rGBGoSb2Q2/367ztPMkuE3kJTyOpCny6UaE1IM5BTg6zRQV3CREQBt/xUPb0iixTRj2ZPleomP
	FeJhQ2/zUe9HBg31UpjT8267nbKnszaG7ejFwn4h6MiQ1vKyLy+F0m7PBOl9es8tbiy8+gyyOAr
	f2xJLw9uBs76BV5Y5X1vYa3CUiXaFKnqkeshg==
X-Received: by 2002:a17:90b:2586:b0:39e:6c69:9b9a with SMTP id 98e67ed59e1d1-3a0992907f3mr1367873a91.63.1790234372913;
        Thu, 24 Sep 2026 00:19:32 -0700 (PDT)
Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com. [74.125.229.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a60c674sm21870255ad.81.2026.09.24.00.19.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 00:19:31 -0700 (PDT)
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd05d97cso2538298c88.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:19:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxRTS+jB4WZT/zeN1TkRwZxhGLchLljIRKzhykKQHu9hz7INq/JPJO0otS239JxV39QcuJTGwvh57Inz7k=@vger.kernel.org
X-Received: by 2002:a05:701b:42d2:10b0:144:ee9d:eb1e with SMTP id
 a92af1059eb24-14503fefb78mr1363373c88.32.1790234370314; Thu, 24 Sep 2026
 00:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-unqual-v2-0-60a1407a0cd4@chromium.org>
 <20260914-unqual-v2-2-60a1407a0cd4@chromium.org> <CANiDSCt9nOM8OWY21Q=ei5dmOK2O+DB1aYdd9NrbLt3e+pJPUg@mail.gmail.com>
 <20260923162234.394061af@pumpkin>
In-Reply-To: <20260923162234.394061af@pumpkin>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 24 Sep 2026 09:19:16 +0200
X-Gmail-Original-Message-ID: <CANiDSCvqC_Kn20zOA+dQBmppi4KAO5g_4a_s-opkDa+CT=0YWQ@mail.gmail.com>
X-Gm-Features: AclHuK_SrtWB6lKxAhVFq8ggHS9u7GJrFjbjjhd0mGu4HfjYL_fmoNQVtNq9Hqc
Message-ID: <CANiDSCvqC_Kn20zOA+dQBmppi4KAO5g_4a_s-opkDa+CT=0YWQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/uaccess: Drop the address space qualifier from put_user()
To: David Laight <david.laight.linux@gmail.com>
Cc: x86@kernel.org, Thomas Gleixner <tglx@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi David

On Wed, 23 Sept 2026 at 17:22, David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 23 Sep 2026 13:08:20 +0200
> Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> > Friendly ping?
> >
> > On Mon, 14 Sept 2026 at 15:53, Ricardo Ribalda <ribalda@chromium.org> wrote:
> > >
> > > __typeof__() preserves every qualifier, the address space included.
> > >
> > > When we do __typeof(*__user *int), we are declaring a __user integer,
> > > which is pretty much meaningless. A value in a register or in the stack
> > > does not live in the user address space.
>
> Doesn't that mean it is a smatch bug - so should be fixed there.

I don't think it is a Smatch bug: __typeof__() preserves all
qualifiers including address spaces. Smatch is just enforcing that
more strictly now.

I'd prefer that developers explicitly say when they are crossing the
address space boundaries, and TYPEOF_UNQUAL() seems to be the right
macro, which also Dan recommended.

>
> Somewhere in the middle of this there ought to checks that the value
> is the correct type (eg pointer v integer) and that, for put_user(),
> the destination pointer isn't const.
> Using:
>         auto __x = 0 ? *ptr : x;
> can be more succinct than other versions - might not help here.
>
> David
>
> > >
> > > This annotation did not trigger any error until a recent version of
> > > smatch[1] started caring. And as a result of that now we have tens of
> > > warnings like:
> > >
> > >   drivers/media/usb/uvc/uvc_v4l2.c:1112:13: warning: incorrect type in argument 2 (different address spaces)
> > >   drivers/media/usb/uvc/uvc_v4l2.c:1112:13:    expected void const *from
> > >   drivers/media/usb/uvc/uvc_v4l2.c:1112:13:    got unsigned int __user *
> > >
> > > Instead of __typeof__() use TYPEOF_UNQUAL(). It maps to
> > > __typeof_unqual__() in recent compilers, so the address space annotation
> > > is gone.
> > >
> > > [1] https://github.com/error27/smatch/commit/e53027a4e816a772403baafa83c09e4a94c1cb8f
> > >
> > > Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > Link: https://lore.kernel.org/r/20260825-unqual-v1-2-7024fb81b4f9@chromium.org
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  arch/x86/include/asm/uaccess.h | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
> > > index 3a0dd3c2b233..4e576c0b9131 100644
> > > --- a/arch/x86/include/asm/uaccess.h
> > > +++ b/arch/x86/include/asm/uaccess.h
> > > @@ -172,7 +172,7 @@ extern void __put_user_nocheck_8(void);
> > >         int __ret_pu;                                                   \
> > >         void __user *__ptr_pu;                                          \
> > >         register __typeof__(*(ptr)) __val_pu asm("%"_ASM_AX);           \
> > > -       __typeof__(*(ptr)) __x = (x); /* eval x once */                 \
> > > +       TYPEOF_UNQUAL(*(ptr)) __x = (x); /* eval x once */              \
> > >         __typeof__(ptr) __ptr = (ptr); /* eval ptr once */              \
> > >         __chk_user_ptr(__ptr);                                          \
> > >         __ptr_pu = __ptr;                                               \
> > > @@ -231,7 +231,7 @@ extern void __put_user_nocheck_8(void);
> > >
> > >  #define __put_user_size(x, ptr, size, label)                           \
> > >  do {                                                                   \
> > > -       __typeof__(*(ptr)) __x = (x); /* eval x once */                 \
> > > +       TYPEOF_UNQUAL(*(ptr)) __x = (x); /* eval x once */              \
> > >         __typeof__(ptr) __ptr = (ptr); /* eval ptr once */              \
> > >         __chk_user_ptr(__ptr);                                          \
> > >         switch (size) {                                                 \
> > >
> > > --
> > > 2.55.0.1007.g17ff1f9808-goog
> > >
> >
> >
>


-- 
Ricardo Ribalda
