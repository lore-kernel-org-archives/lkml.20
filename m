Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7988E3BD62F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787948378; cv=pass; b=W6ydSWw0DiiTqVdzTK9gIgHuuSA/XS2NGCqQxGFDR49GsUKjqui3W/QXDigc2RMlV11dwnvhRjGHYs5T2x/uAroZCR+dCDQbudLZtr0Cku2632YXBzIyW0R92j1uUJfVwbRu4jkFlbj/qIvleuercYsJlFUhUAM6c8UpUg4Zk0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787948378; c=relaxed/simple;
	bh=8opc2QShzrVS0PXZRlPRkpu6htUMy/gJ4UTVKwzCsDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nkgr9SOErkd9xooKzWqiktEUhK9ewh2ss9UZ/OXyGSY6owFbIsQZymKIG3AfHToIBFvmuPFsNiqD0ccdxTSsnI5kmZNYgLNXkQZdxpVj60n8y4Eq1bjP6fIdgb4TlAOypPFMhTHH5DKnX4D51G7+yff64q3Qi6GClVsTiam7mNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lgUGGTCh; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lgUGGTCh"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482e257a23aso799633f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787948376; cv=none;
        d=google.com; s=arc-20260327;
        b=qvxbMsVR/adHc+932QSDYcRikfQmC0SRVNM98z7/KJuLUrMFXxuUeCYRzSaxlY2A5F
         psMknjSacKJ4MR73TqpBa4CR47kfj9k7uQHp/aO6j2UkjjuPIw6UQot7tHV/0t4VUTC1
         OduJyIFhwihhN16JziH8Fl2/pk7lQM0nwc1k90oLdlL8IdD6gczGWN6XbJxlMAQfqXZt
         ix0sT1MfU0CRGpKhDTQkgzun9YTJJ86GwxBikS/UFSx4jiV2uIvNLLQc7TMVLdeDxgPW
         lU88HGJbfVRjlNOSYld6HTIBEDsRgPDWi3F7r0pQcsaacvwAvYM6ZjZkydORRsoonUnt
         exHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AqevhQmDUlAlxZrxi7igRupcRfpHxunuXttW6NuOQbw=;
        fh=LrFAuXe1BFn9j16ptAjAU6tf9FDpUfVCFSzYcvclq5Y=;
        b=o1NVoy6YHwJc5kyrdb+zJO23Pehj+mQbiM6mFPfFsz57RFOpgSXMQA8Gc0j+Uj5S3c
         95gkO5xX8kSHJAWPqHXsoRwCGFk9KF8aLAlBZE7uzUkxOa0B4vxVFZ6DBvY3/m8TJFjM
         Pe0dLBPxEBxKt7q+YO4VBVGdWPxOPtHr5HWcn1nRGxfZEf9pobY4RzF60I9uRvxfZJMk
         rixrFjxMi4jmzr00ozl7+A2ooUz+kqzgOnzNNzuEOsBRFor6HOW11/fZ1bD12R01FHet
         47uBQNb4+TN1cGK/j/LRaeuDo2yT8jJPimFfkNGeUiAqh5KiIR2XXckv2B/WqplOhogH
         +Ztw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787948376; x=1788553176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqevhQmDUlAlxZrxi7igRupcRfpHxunuXttW6NuOQbw=;
        b=lgUGGTChiYAKV1Hu2sS9UYv62XnyrUlY5GiQWeJ/JGKRWsqxCzq+ULNRfARxwpS5UB
         o6SNSOnUkX2RMqsATgLJvE9+G0CDcl/jiSbpDeQLKsFNi97huhXdK3OUnGykdXshYMTs
         ne8aphzFwyDtlDLq5B6Sfr/Bhjfr9V4oSI1YGkw4mHZXWx8qmSGNw4kkHvGAd/wMz1Qz
         kAzoe4N5dWgn2EQ+yciij5dmmCMWfuO1klhbFZ1NZMR7HGy2jYzSU1/lfEakOri9vVU/
         3wIYFIanI3seNxdorAGSIjcd3TI6aXdBlkaSQwrasggIyaF5klWUh742Jwp78lM+Foe9
         JnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787948376; x=1788553176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqevhQmDUlAlxZrxi7igRupcRfpHxunuXttW6NuOQbw=;
        b=WzxFgj+EjAj3IMPHjeuqD9jhhZ8WXns5flvebGXWLRmz0LVaJmUm/EBm3gnrrO7fqd
         pG4y8yqCg42FcZCjjTqTkr2VyACT2RUXcdJAf8aZam3kNqhLBrjUE7BShbhylI84HMFX
         WQ0aPC2CBng6yteVTi0WhCGXrYMTz66zaCmBK+40U1Nnh51Be3rDvPVzsY5GdpRKJNjc
         mAwVlD3ckZzp4BjdyqVnr/v601ADtLGppZBXZYwPPNGJbYg9KDJehCdDeZ4432cERAx/
         InNHSA+MX0U+0sTZvdkeMCAz/07Vnxy8RrOItnv/a+neLlYVG2MOLyKUOxfmwV7XUjXj
         PrjQ==
X-Forwarded-Encrypted: i=1; AKwUvByGqmM81aknwQWWuSHVLj+1HKEUdV0c84+edAR1iFYXb1bF4o8wVOQHl871eJh1LX5zgBy0TkqirsdD9wA=@vger.kernel.org
X-Gm-Message-State: AFuF++mGOsF1UYZMMlVax0TTWBHKWKN5GWoRjdEbkAW2K8ypteuaR/d+
	3mB4Yi+fAC0PK9gOjtH40QQ5ZP4lwemkX223y4iSzQDWVaCT560H2V++chd++w5xuQvjvFmHTRk
	IOUwZHBcNzgDdj/25xGAeIKX/q+QMLoDHTjxaEwj/
X-Gm-Gg: AYBFou0PwJire/7bffBK2iPFEAm2iuSYEV/YZxMFKgbFqszzDC+Mb1SbDvqURYG29W5
	iFRjKGnY9eEw7l+3g1392R78MAg8JbHVUhaH+OaELbKJxTEx0eYCF29Kj1BsU7RsbHz5/4cOJZ2
	e9Tg98VyjhgkT1Jmo67uiDbtAsML3a492YaZBwrg0il7jHOSMPYnm0F2dN9fHFi0CZnGmKE9y7h
	80m4kIU61qYdwVwecqtt0IWz3OBs+eXWOVmQro2qY/401jlGuPZfddb7f3yLSzFNRYjvo8CMVWs
	5wB9mpbJmgL3JcVt5okx4FGVJB5V/gOG0SUR9WCIVTxzF99YmR2ojOtammXY3L4p5FSWsvlB/8d
	PjuP0jDkANLx5nQiNCDPaHaSFzl1AH8t3WjvgjIB+n+1XpDugj7JYlj+zcw==
X-Received: by 2002:adf:e191:0:b0:482:e6b5:61c with SMTP id
 ffacd0b85a97d-482f7983567mr15853702f8f.8.1787948375179; Fri, 28 Aug 2026
 13:19:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <20260827194508.446733-1-linux@yoavmoshe.com>
 <CAKwvOdkSZBbq=e916=efx8G-CTzZ5b31AhyUytO6eJjjkEdMow@mail.gmail.com> <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
In-Reply-To: <CABCJKuc0cWWdkA7zrCcuze4AE-qTSETuUi-eRewPnn_ivHEADQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 28 Aug 2026 13:19:23 -0700
X-Gm-Features: AcwNN1V_2kf8BqMVIZlH3wMy_YFAxnJPsfByyKc8QzliKU08PTCWPTO7ull2SPI
Message-ID: <CAKwvOdnA7Ej_uppSL7U2xwxyUQoDMvO+RArj4HCUSOziH0rCqA@mail.gmail.com>
Subject: Re: [PATCH v4] ARM: imx: Fix suspend/resume crash with Clang CFI
To: Sami Tolvanen <samitolvanen@google.com>
Cc: "Yo'av Moshe" <linux@yoavmoshe.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 11:45=E2=80=AFAM Sami Tolvanen <samitolvanen@google=
.com> wrote:
>
> On Fri, Aug 28, 2026 at 11:29=E2=80=AFAM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Thu, Aug 27, 2026 at 12:46=E2=80=AFPM Yo'av Moshe <linux@yoavmoshe.c=
om> wrote:
> > >
> > > Note: linux/uaccess.h is included before linux/cfi.h because
> > > cfi_get_func_hash() uses get_kernel_nofault() and cfi.h does not
> > > include uaccess.h itself.
> >
> > Ah, no, we (you) should fix that. include/linux/cfi.h should IWYU.
>
> Nathan fixed this here:
>
> https://lore.kernel.org/lkml/20260604-tracing-fix-cfi-h-build-error-v1-1-=
b27015390901@kernel.org/

Ah! Then this series should probably be rebased or include that patch.

>
> > > -ENTRY(imx6_suspend)
> > > +#ifdef CONFIG_CFI
> > > +       /*
> > > +        * Pad the location counter so that the type hash emitted by
> > > +        * SYM_TYPED_FUNC_START() below ends on an 8-byte boundary:
> > > +        * fncpy() requires the function entry to be 8-byte aligned.
> > > +        */
> > > +       .align  3
> > > +       .4byte  0
> >
> > I still don't like these assembler directives inline like this; this
> > feels like we should have perhaps a new macro in
> > include/linux/cfi_types.h. Thoughts, Sami?
> >
> > One that garuntees the 8B alignment of the symbol for w/e that
> > function patching routine requires?
>
> Sounds like arm should override SYM_TYPED_FUNC_START to add whatever
> alignment is needed?

The 8B alignment seems to be a requirement of fncopy() for 32b ARM.
But functions in ARM can have 4B or even 2B alignment w/ Thumb, I
think.

Doing such an override would add unnecessary padding for each use of
SYM_TYPED_FUNC_START where probably none of them have this fncopy()
constraint.

```
    #ifdef CONFIG_CFI

    #define SYM_TYPED_START_ALIGNED(name, linkage, align)        \
        linkage(name) ASM_NL                    \
        .balign align ASM_NL                    \
        .fill (align) - 4, 1, 0 ASM_NL                \
        __CFI_TYPE(name) ASM_NL                    \
        name:

    #else /* CONFIG_CFI */

    #define SYM_TYPED_START_ALIGNED(name, linkage, align)        \
        SYM_START(name, linkage, .balign align)

    #endif /* CONFIG_CFI */
    #define SYM_TYPED_FUNC_START_ALIGNED(name, align)        \
        SYM_TYPED_START_ALIGNED(name, SYM_L_GLOBAL, align)
```
then this driver could do
```
// fncopy needs 8B alignment; see arch/arm/include/asm/fncpy.h.
SYM_TYPED_FUNC_START_ALIGNED(imx6_suspend, 8)
```
--=20
Thanks,
~Nick Desaulniers
