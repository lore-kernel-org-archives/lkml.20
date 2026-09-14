Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F122EEE99
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789356983; cv=pass; b=kMGr7p5sGIaPmVm4Wu7Y1USTgbJx/QxXKaCTmm2EojqYfN2LdfC4UxbT8BUtaaPeDzsgLo5USYZ2NR8hVtNqjEBEnytGPN/aASpXJbyQGPFUsmc18RsQmyUpuFmRpV0DQs7Z7M8O/CSU3QEQa2wUw1Oi87jLlaablkJ/fZg7ARE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789356983; c=relaxed/simple;
	bh=gXkumXOv+J9pFZtnlemnRqMwVeQ46Duo1CREN+qCDCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PN6N0orggtGqndUBIKCtOHHeMGBtt8OG2Jau+68EoLwqgKfV/2TKy2kyd0o0CCNqdshKyWrRTUuNnvfq5hk/D/i2ZEw5KikbnoeENsf/9mnhF14Hn5ydefEWYIWguGK2TVpWqL8WfsUflPk0O4VRRHkZRq3HsxdbJlje3IzTDIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=neuling.org; spf=pass smtp.mailfrom=gmail.com; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d249c4so1711718b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789356981; cv=none;
        d=google.com; s=arc-20260327;
        b=fGZhw5XgHh4ussxCYh3ML93UxxaECuL0Gz8WyggWlLEyq0hAXFUubCg3iAHJG9CxBk
         ajwznFEVgGozfipUijVFSQKpAyr5+8/vuig3gCnpVXvCZW6VrdwvvghY2CASG3Q2BLKb
         92PxG3ct/zGnnpwY+Otl16rUckbF/ORToOSYp+ukcD/0F9/1ExhBRai5UBIsN8HqaAD/
         ylGlJFH8kbdzzig47AYsoL52CCC34hL3O0VvdvGers8GtXs2xnoCSH18H8y3/v2ggjEq
         Xa9NEV5xLLsYhOXF4ZQj9dXbOcfzrHcHN8VjzXhl8+xWd7siEblKfAfAj1woSGSA2UB/
         H68w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=lrOlBTsBy6V2c/KtLotGt9eMOXZDQ5WGDkpgU93EhdM=;
        fh=a5z1MkHdf7TLratiy79JM6LlEvKkNIGgeGAznOYsv8c=;
        b=BJY5W8Q+NZHmjGhWTOQAYh2Tt1suMhxAxvV0isEa9A0KaDU9gLQ2D9XAVXL30dXaMx
         vRtrlSTrG9bs9uxJXxGxwwgoqKCp2rlvilzDUMgvI8zgsM1CvG3WcBxPE/jWUsRHciKm
         3K/EJlLpr3dX96bwUTK/IlJX2A9XIC9kOzVTWnFAo0Eac3M4h3/O4HgsROpsf6QE3Pti
         4hE1q8kAWPxIkosMkTqeLKBqzdsRfahlPLy5n6FEL2QPY5dtrkRQRzApRujiVDpqMsQD
         v1UY6PgPPxrCZL0D4Y4uBCiu0uwlilrQnDiG7MTNTu/yukZGdHpm2ixbNtEZ8wv/GOtU
         sTVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789356981; x=1789961781;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lrOlBTsBy6V2c/KtLotGt9eMOXZDQ5WGDkpgU93EhdM=;
        b=VIf8Ml3lQibYYo4B77HLlmA/XQ72YQJth9bGWgLL7qcDtegt4ISpa50LR5JxhkR++L
         t015xIneSw2tfkTom1cz5f4dnR0musnDz7RCMR4vS5Ow7Wm66EFFFhcln3j4bfpdelBR
         yxcOAAsowAQS2/GPOCTAGu5CQ5WIvzuMuoggqnICbkIYMHVYB6DtkH1IwIBGIxwL28sB
         ewBBVmRlEGbHDz49Kk2xIZEDye27Hv+rwX2yAekrl43F832As+Tr3sBm0HaxSgtGTZxn
         Lb73mM3H1nyWOWD04GAq79z8bXfdeOnVPf1XcPxhnET38x91uFIUndTLMWntWgVn6Q/2
         wk3g==
X-Forwarded-Encrypted: i=1; AKwUvBzNEznG4XiBxCou++/pPFyP/P0gnBS7x3TzZtQUA+2dFyW9R/gPilD0u9O8kc/9z+2aAgdoVZ7a4TRNo54=@vger.kernel.org
X-Gm-Message-State: AFuF++l9DignrXExxdNuuuaoZd5ARSk81TaNtHEk19GQLfMjobQYGn3+
	dp4pvnymmF/OgY7FOK8ZGfA3lw55un/ynWDtqr+4f9CCrJlbjP66QQ3xcEG2gEhf0SBPtGXI/tT
	IRNmVdRnpY/HGj7HmrFAegbpIjAZKAiM=
X-Gm-Gg: AYBFou1jZ6b4YnrJ+SEp9dYi0uTv9Ad/ISbPrymCoZxEMySlSy3k0B3sRtkVxQtWFHX
	mgtdmQ+G0TrC/ff0d6BWZt+6vIHxA83Gx+PpMvVfokBT5rLTlLftioCvsACDqaV6E8hwbAhw9UE
	aGcKZfVo29hgkQ6+FG8RPGKQ31XKw6M/Q01hbrcvJRwZFVU1BVUUn7vWmbb6qx7HFJCXKXGy4Yz
	mAB9yCM7ywFzkgc1YCgpjI6reZQCZhtGfvgYe6uS7F0YaPpmlspphHzur75zOw58rOZuF8BgX8D
	HO8vlxddl/mYYKOwv3nqzNRSUhrg245tbtmgOZ88IXIy5BoVZ+U9MSo=
X-Received: by 2002:a05:6a00:6017:b0:868:9662:5137 with SMTP id
 d2e1a72fcca58-86f8394024fmr1998067b3a.11.1789356981117; Sun, 13 Sep 2026
 20:36:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn>
In-Reply-To: <20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn>
From: Michael Neuling <mikey@neuling.org>
Date: Mon, 14 Sep 2026 13:36:08 +1000
X-Gm-Features: AcwNN1X9lJnTm0DPIb5MBEAosgvXhCjDs0HstYSNYdtIGTJiXdup_FJi7fswjtQ
Message-ID: <CAEjGV6zvz6h-2qWDFJ5kUr0y6CBFK6Rr4NCaJnDnNPN_mLymiw@mail.gmail.com>
Subject: Re: [PATCH] riscv: lib: Fix ZBB strnlen wrap-around regression on
 huge counts
To: shao.mingyin@zte.com.cn
Cc: pjw@kernel.org, jiangfeng@kylinos.cn, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zhang.yue5@zte.com.cn
Content-Type: text/plain; charset="UTF-8"

> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> commit 5d588c684833 ("riscv: lib: Fix ZBB strnlen reading past count
> boundary") computes the aligned scan boundary from the last valid byte
> (s + count - 1).  When count is huge (e.g. SIZE_MAX, which FORTIFY
> strcat/strlcat pass when the destination size is not known at compile
> time), s + count wraps around and the aligned boundary lands before s.
> The pre-loop guard "bgeu t0, t4, 2f" then always exits for aligned
> strings of 8 or more characters, and strnlen() returns 8 instead of
> the real length.
>
> This silently truncates strings built by fortified strcat: the dm
> sysfs name attribute shows "live-bas" instead of "live-base", the
> truncated name pollutes the udev database, and blivet/anaconda (as
> well as LVM/dm-crypt/multipath userspace) break on RISC-V systems.
>
> Detect the wrap-around and saturate the boundary to the top of the
> address space, making the scan equivalent to strlen().  Normal counts
> are unaffected.

Nice catch

> Fixes: 5d588c684833 ("riscv: lib: Fix ZBB strnlen reading past count boundary")

I believe this issue also affects original strnlen implementation, so
this should actually be:
  Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
The text in the commit needs to be fixed also.

> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Other than the above:
Acked-By: Michael Neuling <mikey@neuling.org>

> ---
>  arch/riscv/lib/strnlen.S | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
> index a8911605c248..2451289ed0f9 100644
> --- a/arch/riscv/lib/strnlen.S
> +++ b/arch/riscv/lib/strnlen.S
> @@ -87,9 +87,19 @@ strnlen_zbb:
>          * Aligned boundary.  Use the address of the last valid byte
>          * (s + count - 1) to avoid loading a word past the count
>          * boundary in the loop below.  count == 0 is handled above.
> +        *
> +        * Saturate the boundary when s + count wraps around (very large
> +        * counts, e.g. SIZE_MAX passed by FORTIFY strcat/strlcat with a
> +        * destination whose size is unknown at compile time).  Without
> +        * this, the wrapped boundary lands before s and the pre-loop
> +        * guard below always exits, returning a truncated length.
> +        * Saturating makes the scan equivalent to strlen().
>          */
>         add     t4, a0, a1
>         addi    t4, t4, -1
> +       bgeu    t4, a0, 1f
> +       li      t4, -1
> +1:
>         andi    t4, t4, -SZREG
>
>         /* Get the first word.  */
> --
> 2.27.0
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
