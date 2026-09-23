Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A5B3AAF7E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161725; cv=none; b=d1t+d+KvrGZp/aAKeFfQ8MTqQ8uCfjDVwTTyJQ3QwGI93HzFUXDuvOV582nyGIMuRB3nFRxK/SsfrjfvbDSkEU5hsaIsREaZOm7CQDOK3ppaVrHj2laQDJBPnDkV6P82RZed+w5fJf0ejGH7CsJP0sT7zj9bZjp1S0znbrBNdk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161725; c=relaxed/simple;
	bh=96a5dHe2DqaL/Q6R+1kPKlsv4UCcGijsVhPaAoEwX9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6OlOQk6bO4WC7Zesy9ngS9ZP0jy0Ucy2QC2FqdJAv/mDCRq0G8DFSCAJR0YdlxsVSTdoJU48XQKXgxaHOluX1RFC+N6qmMgBXNHYB3FZyD0yC97DvFe+nxVDEeeqiYMLpcXW26dT1dPti27it7vbJeCWt0pGS2ogcMOpn0Hhg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=j2VIDKwk; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j2VIDKwk"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so4702985ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790161722; x=1790766522; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3oWHhrRM+xcZF4BueV8BA1ed5/0JCg429twJruMbSk=;
        b=j2VIDKwkYmY8NaIuk5AOEuBQM/lvrRXV5EaxOjyHTUBSQ+0R9Rrz0yWZKrbSeHAL+a
         uSDhyj/tZBFpKKKgmUN+aCQL/HFV0PuN3XQp6cKq1oD17LLf7VfF86sK+npXSbojaUzS
         gjHH1DDOSiyMLiioBDTJz1D3UYNCSTMT0Hi5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161722; x=1790766522;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W3oWHhrRM+xcZF4BueV8BA1ed5/0JCg429twJruMbSk=;
        b=B7Hdobs1QqUsugwhGhGv4rkz2aHMGqzMZ2J2DLt8CWMrGmogveV+uA8t89/7L64ilv
         RM6rmJIcuDfCmjTRFu0S8snwavPVh4WbIn3XVDa/wrR0VcGmtIGYghN4Qa/1VCwzf/cV
         Fbg2vytdZDw9eRQuiXEw0BF/+ftII/ylBeQD9k0UuoQF8DwxLyV24zaJRbGbH5MdfQ7b
         LGCwzj/WEOU6azFgRELkSqjYsOCaUwLgfV2JvAPUhGvlBZws4xnRUVHXmhYtLxMa5b+M
         a6Qx03py1ZYP/H3woe6DEv43VjByfk2OUiVaI/wIWIS41cLam2lxzORkw9vA4iq7UGgn
         2hGA==
X-Forwarded-Encrypted: i=1; AKwUvBxqfWye5CWx7jIHQarfWFDqMiNUXr2bVcM2g0smhIVrySzAMijP7Y9nKvpCNOXNv8Br99ZZiBeW2Id2bro=@vger.kernel.org
X-Gm-Message-State: AFuF++lNnvCdR2D9o9WClw2WWH41UEstFMq0zo2QoPakSMclL2rbJC3i
	UTfo1YFwDE0XEZv6eIuGzGkXMpvx2/lLfdY4RETo8Q6toCMX9btSi6ncX6x+8QXd/wtcwj8oGUd
	4mHhFfTgX
X-Gm-Gg: AYBFou0tlMO1OgLfdFp1a1D0qO8BmUgGd0cMK8F6glTLTsk/Cw4MR3VgjSocNWCmo/O
	C1J87+R4I4aCedDwx5C9qtPK/8bBMj4T3Vx49A5ADkF7WNYWgSUfnVf4rNUjzJPFv/HgHmS2jDm
	4ENZ8vONHQU4qJ+8KwTDt91CqVVQGZf/kxlGLvWKGOANMWKxp9rPh5aR+PBsc62bA/rmOYVHoAc
	1ImoBjB1JS1RzQBpp5+D3hlz5LnJAbkJjY39qXtf2A0+3ZYf4zZ4eiZteTeNCZXuZke5VuNvdvQ
	Iwav8Al0nXgNsdMHdcLgu9FY2YG0XQ8uP6A4yfmgvx8K69ZRmir9Pc2poljav1W6r/cNv8UUlcU
	slVY4d0E9mivDbj159nSDKGBfZV7wqQsrMTrr3K5uzRdEQ8a1mV4YwY7iUgkc7t3zB5lFpxVsh5
	yIu+QhJ+ZSPWTqppRudx6KDEiVMXltDcywHWCDu/vz95uHZPAxAMru6Xqbgt2cUZEISFy1/dBGx
	GNAAMgTcUiWge4W+DFv3uG5O33FMdJIgqZGDw==
X-Received: by 2002:a17:903:8c3:b0:2dd:c0ff:e72a with SMTP id d9443c01a7336-2df69de4d9dmr19077825ad.60.1790161717084;
        Wed, 23 Sep 2026 04:08:37 -0700 (PDT)
Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com. [74.125.229.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f0a56sm8671315ad.66.2026.09.23.04.08.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:08:36 -0700 (PDT)
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1438f55921fso294577c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:08:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwniPxSHr+mxQODFZy0r6MVGvpvY9l1Y93042gOP5BbwDHLRkCq8lRL/jz8bm7KRh0vyPpjbkKwpeoaSrE=@vger.kernel.org
X-Received: by 2002:a05:701b:4187:10b0:144:ff51:2d5f with SMTP id
 a92af1059eb24-144ff512f97mr665860c88.33.1790161714561; Wed, 23 Sep 2026
 04:08:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-unqual-v2-0-60a1407a0cd4@chromium.org> <20260914-unqual-v2-2-60a1407a0cd4@chromium.org>
In-Reply-To: <20260914-unqual-v2-2-60a1407a0cd4@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 23 Sep 2026 13:08:20 +0200
X-Gmail-Original-Message-ID: <CANiDSCt9nOM8OWY21Q=ei5dmOK2O+DB1aYdd9NrbLt3e+pJPUg@mail.gmail.com>
X-Gm-Features: AclHuK_RnU5b4dqulXVKirakPcp4SQB9vdbI8FI1iyNP7e-WyrnIz9gVwDwnjNc
Message-ID: <CANiDSCt9nOM8OWY21Q=ei5dmOK2O+DB1aYdd9NrbLt3e+pJPUg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86/uaccess: Drop the address space qualifier from put_user()
To: x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Friendly ping?

On Mon, 14 Sept 2026 at 15:53, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> __typeof__() preserves every qualifier, the address space included.
>
> When we do __typeof(*__user *int), we are declaring a __user integer,
> which is pretty much meaningless. A value in a register or in the stack
> does not live in the user address space.
>
> This annotation did not trigger any error until a recent version of
> smatch[1] started caring. And as a result of that now we have tens of
> warnings like:
>
>   drivers/media/usb/uvc/uvc_v4l2.c:1112:13: warning: incorrect type in argument 2 (different address spaces)
>   drivers/media/usb/uvc/uvc_v4l2.c:1112:13:    expected void const *from
>   drivers/media/usb/uvc/uvc_v4l2.c:1112:13:    got unsigned int __user *
>
> Instead of __typeof__() use TYPEOF_UNQUAL(). It maps to
> __typeof_unqual__() in recent compilers, so the address space annotation
> is gone.
>
> [1] https://github.com/error27/smatch/commit/e53027a4e816a772403baafa83c09e4a94c1cb8f
>
> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Link: https://lore.kernel.org/r/20260825-unqual-v1-2-7024fb81b4f9@chromium.org
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  arch/x86/include/asm/uaccess.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
> index 3a0dd3c2b233..4e576c0b9131 100644
> --- a/arch/x86/include/asm/uaccess.h
> +++ b/arch/x86/include/asm/uaccess.h
> @@ -172,7 +172,7 @@ extern void __put_user_nocheck_8(void);
>         int __ret_pu;                                                   \
>         void __user *__ptr_pu;                                          \
>         register __typeof__(*(ptr)) __val_pu asm("%"_ASM_AX);           \
> -       __typeof__(*(ptr)) __x = (x); /* eval x once */                 \
> +       TYPEOF_UNQUAL(*(ptr)) __x = (x); /* eval x once */              \
>         __typeof__(ptr) __ptr = (ptr); /* eval ptr once */              \
>         __chk_user_ptr(__ptr);                                          \
>         __ptr_pu = __ptr;                                               \
> @@ -231,7 +231,7 @@ extern void __put_user_nocheck_8(void);
>
>  #define __put_user_size(x, ptr, size, label)                           \
>  do {                                                                   \
> -       __typeof__(*(ptr)) __x = (x); /* eval x once */                 \
> +       TYPEOF_UNQUAL(*(ptr)) __x = (x); /* eval x once */              \
>         __typeof__(ptr) __ptr = (ptr); /* eval ptr once */              \
>         __chk_user_ptr(__ptr);                                          \
>         switch (size) {                                                 \
>
> --
> 2.55.0.1007.g17ff1f9808-goog
>


-- 
Ricardo Ribalda
