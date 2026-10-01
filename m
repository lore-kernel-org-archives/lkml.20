Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A29C4446F4
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837960; cv=none; b=uA/Tyf23Cncji53kl6fqGYrRT8J9YxWeWt+HOmIhuZflKW5xOpvR0wcMC8QdQnrupmwNGNTh+bnyoS1R3SeAuQsGw0fuVnnjQSwLiPbnP49MrLBilUDbPZV5v73kXflu1LVi8df4w/wFaIE/+K3qmurEkBe3022AQV2ebtPiJWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837960; c=relaxed/simple;
	bh=MlqSoNppFofm5K6lcFO8XbHtS/mZw5yI/f5GxlGke6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vht2zf8FaSIAYXIpHDtl5mgJ0cimXCDWqwy9PNzF+YV/cfZYsn1dZJfES0Yo+P2naUV4ySrw63uuJkUueb0y9q+HrWAM/bJ49VW/zELwSfRMeqciqpmsnN6PNiXcxyoscioL20B1QM45q6Q1LJORDbxeFWEo69d7x1F4j3lhj0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OoRGWBhy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WWr0vf91; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OoRGWBhy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WWr0vf91"
Date: Thu, 1 Oct 2026 08:59:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1790837956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fUyh1DfYY+jvmXJVXp5a28kDFLvoPH14RgZTqwOCNV0=;
	b=OoRGWBhyX2oQiH3ZVIqTGOHfmYhVA0Ga3u9ce0P/u8wIny6a6xc5QZIVKOBPGLk3GXN4L0
	bfYySnzO36LPRxK+TfwX934JX9dqjqESReBi2PySFonN5f1gLLonba4LNzjDjRND+ZAirj
	xzWakGYiCJ74UxIomwZGwN1aOp7AEQPLM5dlWdoAPIwFMJo6mcThmrVb45C1LJugKJYosR
	dFgRB5MFI8AKTpoz25mF/VQI0BtzAKakrTFQGG4ORePrsWwC0BI6ivmErf7XfAbMYnISjX
	ApzetNbp/IKIu5rqHRf6HxB7d5bMdYZ8tpH/Puccy9QA/LiR/F+/N5LK4MBEtA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1790837956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fUyh1DfYY+jvmXJVXp5a28kDFLvoPH14RgZTqwOCNV0=;
	b=WWr0vf915XYq9OzchE/jWbmAsPB4JdaNq4s/bq78CHUCw5NeyhrwXxFIKe1ltBsQgtZ7LR
	su3zKfKq56gfomBg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, David Laight <david.laight.linux@gmail.com>, 
	linux-kernel@vger.kernel.org, Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: Re: [PATCH v6 1/5] vdso/math64: Use OPTIMIZER_HIDE_VAR() in
 __iter_div_u64_rem()
Message-ID: <20261001085757-c7946025-7009-4052-b14a-2a386e76e757@linutronix.de>
References: <20260930154500.722828-1-zhanxusheng@xiaomi.com>
 <20260930154500.722828-2-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930154500.722828-2-zhanxusheng@xiaomi.com>

On Wed, Sep 30, 2026 at 11:44:56PM +0800, Zhan Xusheng wrote:
(...)

> Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> ---
>  include/vdso/math64.h | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/include/vdso/math64.h b/include/vdso/math64.h
> index 22ae212f8b28..c628d6cf447c 100644
> --- a/include/vdso/math64.h
> +++ b/include/vdso/math64.h
> @@ -2,15 +2,16 @@
>  #ifndef __VDSO_MATH64_H
>  #define __VDSO_MATH64_H
>  
> -static __always_inline u32
> -__iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
> +static __always_inline u32 __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
>  {
>  	u32 ret = 0;
>  
>  	while (dividend >= divisor) {
> -		/* The following asm() prevents the compiler from
> -		   optimising this loop into a modulo operation.  */
> -		asm("" : "+rm"(dividend));
> +		/*
> +		 * Prevent the compiler from optimising this loop into a
> +		 * modulo operation.
> +		 */
> +		OPTIMIZER_HIDE_VAR(dividend);

This still requires '#include <linux/compiler.h>'.
See https://lore.kernel.org/lkml/202609300626.zwNjKaO6-lkp@intel.com/


>  
>  		dividend -= divisor;
>  		ret++;
> -- 
> 2.43.0
> 
