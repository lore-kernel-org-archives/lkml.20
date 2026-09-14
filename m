Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6701035674E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372176; cv=none; b=tWofTtV+ydSMtpIgKuajz2a6t6EPe4qaKsc9vIGXC4kqSSMMsHYNaARrypc3fqtBihkfucBVRufIiEIZw+fMUaRuWrI8rCtPc9v/Y5aFnfkaTock1e7T2zNqXtQ1mhvoSxh4kc+l8XqGSVe7e052FVfdA3530nTz72urGSpjvfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372176; c=relaxed/simple;
	bh=qW+2LBga8R8R3gMYx5/pSbi57WwG5cCwTfoQeq83/wY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V7AV7qI7Ta4VDQHZtPBpFhkJEpU2mGB5IZ2Ebq5QUJxv0ejYkxnmFaB/FwVuVU8aavz7bl7s9+piVhd/xjFxp8SCbZVhFE29S1tSbe2khfmnAYjHK4qeNhR0wPVDjmPUJ9zXP1QFAzsyrlbgBZZCan7yc5EPxBpuiCWpwJMYsDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p8C/MVHZ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8C/MVHZ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso8545715e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789372172; x=1789976972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0SFFkTHAZrxKJhQbYm+mLNDx5PxDTI2Mi4G/IC70dA=;
        b=p8C/MVHZlTKPAmgPXfRpcARmTd9CJvmLwWHBtdScmCrFD9kdXaGDjGPXC53s6Fj2Kp
         ze23QrtxadNBWw6Es9lgPyE5jVut6VysRbBuawGCEyui5metYRj9XzAOZaXKDZjrYQl9
         zLAtejubpRu+bws1cB9TLAcQ4wYzQEHu45LHm74ZRK5PNlQOTsmUDdRn+A8XjxyNbI4K
         DF/WQ2IWV1qhj8RXXqGNtidC5RSZlCjGmSRIbd8V/BRhJ9/6t4KsuyKPqKwAG4za5ii5
         pOxURf780I5aaQYyoP+B4S5cqNHQtkxAFgO32Dv9oA4plYr53pQyfy3eN0qKTCP5lMZd
         nyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789372172; x=1789976972;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0SFFkTHAZrxKJhQbYm+mLNDx5PxDTI2Mi4G/IC70dA=;
        b=HsIIglyO0/Z8MG/C+27jIGYvl6qaR7qkMEBOXJkULFGYm9uEMqQ/Bl0IWTWgOJT/cY
         kCx//kGhXU5s7utgbX7jQliqrCdTbT0jSYiT9ZNRsX8pGm7EWfrMjHxHF32hNwsY4fpi
         lgn26Hr/Fy1pBGnwF++rI/XuOm5Ul/5enYT46GJEQKON2d65AaSslPksX/5BA9cY36Zz
         nXU6kW1Rl9OYHF0ajqh6IJAVtD3pLqU7zwjh3ijRygZh5a77Yck6SSniDSmbn9aDH7A1
         w1vxgbtJNaZpXemaSJYPIN7KZXwQvvVpnCJF5VNMxh5Q+2T4UyppmxZgD4T74V/njZmG
         fMeQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3zy5HpOL3DP+6VQ6RHfQkqfW62D+b2h79h/kpX3FJt0WcMAT4IHqFzyJbgC5rK5IpqwGgrotUIsVzcY0=@vger.kernel.org
X-Gm-Message-State: AFuF++lzu5iRZaDUHVRr6wQrTHVo1e3t3Aiz/+DNHuUBwW0CE7i2odBi
	1Nz9s5RLXeBn6Tmkwgc1hbboN1j3HXV8YOJ4yiVJe5aWKjadsqsBYpy/
X-Gm-Gg: AYBFou2OUrN5n5SHdhX8k6y6u4+t6euisF3TdjOwQp2xgG4lajYydsUaKWy57cop8Gv
	lT/9mI7wnahISfxtW9F7cm9ig4torijrpf+nVxLh2x6iNjDi3laBpj2WmRSSpyqyKWcxwJhWC2e
	zNbAlQpQFDaaa8lcbtmwD74XS8SR0L6pEKKscXV7BXXPaxun+Rj4u6bL8meZ5C4wJXTff/Cx9eI
	HXKRZ6BTGv74K8n7NOzRod2ecgKVVgvz8jK8V3EnKXsM5b+V9yvamXJmmuCEEgWabYo79rF5L/v
	Ysf5PaeAQkOv8z+K3frhN9waGjmQs5KbvbH0jt8YYfCuSMWBWo6Z3SOvkudS6Ri+uosVUSi6l+h
	Ar60Zu9UFT9lI8GNOYicwFrSUe01s70sp+6/uKiH8gKJNzGZTtNUPKrAMgM7mqlnVekjkE6Mt8p
	86h9hxUmU12NK6vxJETObcbtoDMeqqLTfTH/XZKv58Kj0V949AhWVPGwXFIMDBWGTMf1N8MfiK4
	qQM31OQ9Jdl3Uaa5S1ppkOCUr9ePaS0X54f
X-Received: by 2002:a05:600c:4693:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-49e7a66b714mr15344565e9.19.1789372172226;
        Mon, 14 Sep 2026 00:49:32 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6ca584f8sm194801515e9.6.2026.09.14.00.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:49:31 -0700 (PDT)
Date: Mon, 14 Sep 2026 08:49:30 +0100
From: David Laight <david.laight.linux@gmail.com>
To: <shao.mingyin@zte.com.cn>
Cc: <pjw@kernel.org>, <mikey@neuling.org>, <jiangfeng@kylinos.cn>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <zhang.yue5@zte.com.cn>
Subject: Re: [PATCH] riscv: lib: Fix ZBB strnlen wrap-around regression on
 huge counts
Message-ID: <20260914084930.739e3832@pumpkin>
In-Reply-To: <20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn>
References: <20260828145152578tXQPUG9lxxgbJjmfpuaQz@zte.com.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Aug 2026 14:51:52 +0800 (CST)
<shao.mingyin@zte.com.cn> wrote:

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
> 
> Fixes: 5d588c684833 ("riscv: lib: Fix ZBB strnlen reading past count boundary")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  arch/riscv/lib/strnlen.S | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
> index a8911605c248..2451289ed0f9 100644
> --- a/arch/riscv/lib/strnlen.S
> +++ b/arch/riscv/lib/strnlen.S
> @@ -87,9 +87,19 @@ strnlen_zbb:
>  	 * Aligned boundary.  Use the address of the last valid byte
>  	 * (s + count - 1) to avoid loading a word past the count
>  	 * boundary in the loop below.  count == 0 is handled above.
> +	 *
> +	 * Saturate the boundary when s + count wraps around (very large
> +	 * counts, e.g. SIZE_MAX passed by FORTIFY strcat/strlcat with a
> +	 * destination whose size is unknown at compile time).  Without
> +	 * this, the wrapped boundary lands before s and the pre-loop
> +	 * guard below always exits, returning a truncated length.
> +	 * Saturating makes the scan equivalent to strlen().
>  	 */
>  	add	t4, a0, a1
>  	addi	t4, t4, -1
> +	bgeu	t4, a0, 1f
> +	li	t4, -1
> +1:

Ugg....
That adds a taken branch to the normal path that is likely to get
mispredicted.
Might be better replaced with a cmp, dec, or sequence.

David 


>  	andi	t4, t4, -SZREG
> 
>  	/* Get the first word.  */

