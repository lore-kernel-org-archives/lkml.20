Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E18489FA8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890675; cv=none; b=qFBT3m84FxYRKWAsBp1gFXjk+FqWykIpPaDaf734w4nT7pwLSHJAxVDR/ELl3trFhM15nsYki0Nxvz0i6XBjzIR41V0LdrkZeBNQpJk0iONKS6fnvuod4DAxkvpeCwYR5n7B3+U6bUslwApzCEzUa0X43mycxQmWaAA1nn5cC+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890675; c=relaxed/simple;
	bh=yvzWMsMklAp/OWaKLimlWzJld187lIFAuskij28HEYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mM8FRi9YRZQsjr/0GwFwq904RL7inb0K3QRAm7DYEHbSZq6M5RsOlTg7wd5xPfgxk5Oxd9r/p9aUYKWCBjKaJGhBPlfVsuJAti49rHhImu4+LwplONk6gWmOzXaOJU2Dbpf7jW9eTjNwNKtI1VNujua/hTLxUzi0ZRbEnjNQk18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=PpNueckQ; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="PpNueckQ"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-917a6dccc60so13352366d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1790890668; x=1791495468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlLcWdHEzMsy9s2aqbdhrXsMNshvSxKEd5JIDmPGMaQ=;
        b=PpNueckQQfG8vFTmA8IBNyXxvI+U0ZHooUMOx0uSYqK70NvkoiBk88tpGS2pVK7yPh
         LpKMWrBYTeOy1+ILI9mHMsT5SrvYe889LcZTnwFd2tm9mUBXCTlH2+KaxxYX6KPeHS6l
         Fsx9SCIMbOdAvtXd7j3c+rKuOBVPlyic8FCLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790890668; x=1791495468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlLcWdHEzMsy9s2aqbdhrXsMNshvSxKEd5JIDmPGMaQ=;
        b=MJXtx0RqjKnPT24Ua5N9nvppsHLiAnJZ0UDECRr98TO6BsM1ujnKWkWMjZlh32HpKt
         LuJmP5v2pKWBKMBkQxyQcQMlqGEswE88R0VuoAlbJGCNJ3akjMgUeE7ueOrLlMyra668
         et9PmkCqx3gVSi3+vh+7S8yXWpDyDEHvCfYx/Gh9tJadMuuXV52tO+7y7AMEvxkZvpHH
         BNBIVY1XXSTLRS+FMXk9x9Erbq9sCk4d63n752AgqqV0LIUe8TMRHnv0iqZ59cJvQhZl
         AFuaRRsSq3lFJ6cChaaiUGzAI06GnKcKUbQnhLJwJC1UNfjw2ArrnWMd1OL3SphViZYr
         c0vQ==
X-Forwarded-Encrypted: i=1; AKwUvBxE3nq8BazhMEYwhw15HlmVGw56empvTCFJDD8WB8Q6Gw9yqhMROZaN2dXpi+YrKoMkgbhw7uOq5dfSiC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF/feZ1ES16NXjpVmzslSnsiriA340mO3t9i2kGbpFD10PhKEX
	3tAJW+vnmVe5sA3pzON16YGa0lukA0ccT0T0RirPEjNPAd0XVMCPwSmNmSpyH3BWyWqOeqWALAy
	A5KnsYw==
X-Gm-Gg: AYBFou1Qc97hiOqB/MAGi16RemEtGLWoSXJIw4p1/bt6vJX0aACDdQ+JRZvDzvRfcaN
	rnzfJ2c8RvJu/IZ7ljo/5zYF4fB/LxE6VY5e7RY1Xd+HDwP0bFd17BcSkfJZN4gc905uj6vs+e9
	IJRrVDw6Ok99ixpmnfdE8IImVOWZaTW/fIEk79h2iScFY4lqE2UrVi5s9R6Wfz92hlQ9JLqGvko
	wTHXGQkYhzjzbbO+g7gI+bbyZ71xSO97zsvy1VDJ2i33L9Tog7u0idLU9YEQJEbx0qpevbb1jd4
	vYshd242VpOW//o+zUy+vstQ42lwDPIO2h3HK3R4SDcIdOQQR7kW0GV/QfK2AHZOwaBV4W7xVvq
	qp8GAQ1g3njY7nrnfGx3GtJR35Fvrzw6lEMYyKyQDP5H3P62hkSbzlhZC3PTPERs/X0q70VVxAf
	YdMI4nASufdXOKBqwctBB4tbo2CsJMO++AyZUAc+T4eRwSBn+zGZzYm3qQhMa4euyfgQ==
X-Received: by 2002:ad4:576e:0:b0:917:ba3a:c6fc with SMTP id 6a1803df08f44-917ba3acd45mr44463406d6.1.1790890667926;
        Thu, 01 Oct 2026 14:37:47 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-917e0b682dfsm3961646d6.19.2026.10.01.14.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 14:37:47 -0700 (PDT)
Message-ID: <00571efd-cc91-4ba7-a904-9ce183313f25@ieee.org>
Date: Thu, 1 Oct 2026 16:37:46 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] lib: parser: reject out-of-range values in
 match_number()
To: Shashank Mohan Jain <jain.sm@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Elder <elder@kernel.org>, David Gow <david@davidgow.net>,
 linux-kernel@vger.kernel.org
References: <20260926012718.15675-1-jain.sm@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260926012718.15675-1-jain.sm@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 8:27 PM, Shashank Mohan Jain wrote:
> match_int(), match_octal() and match_hex() store the result in an int
> and return -EINVAL or -ERANGE on failure.  match_number() checks the
> range by parsing into a long with simple_strtol() and comparing against
> INT_MIN/INT_MAX, a check added by commit 77dd3b0bd17a ("lib/parser.c:
> avoid overflow in match_number()").  That does not catch every
> out-of-range input:

The result is still placed in memory referred to by an
integer pointer, right?  Not a long long?

It might be better to define a new function that expects to
produce (up to) 64 bit result values (signed, or maybe not),
rather than changing this function.

Or... maybe there's a simpler way to catch a too-long
input string.
> 
>   - simple_strtoull() saturates to ULLONG_MAX on overflow and

This matters because match_number() calls simple_strtol(),
which is implemented using simple_strtoul(), and that is
implemented using simple_strtoull().  So if a very long
numeric string is passed to match_number(), it will be
misinterpreted as something that overflows 32 bits,
which will end up having a misleading (but essentially
valid) int value.

Is that correct?

At this point I'm just trying to make sure I understand what
your intent is, because I'm unsure this is the right way to
achieve what you're after.

I guess I'm stuck on match_number() expecting to produce
an int result, and your discussion talks a lot about 64-bit
values.

					-Alex


>     simple_strtol() simply converts its result to long, so any value of
>     at least 2^64 - 2^31, and anything that overflows 64 bits, ends up
>     inside the int range.  On 64-bit, match_int() returns 0 and sets
>     the result to -1 for "18446744073709551615" or
>     "99999999999999999999", match_hex() does the same for
>     "ffffffffffffffff", and "-18446744073709551615" gives 1.
> 
>   - On 32-bit, long has the same width as int, so the range check can
>     never fail: "2147483648" gives INT_MIN and "4294967295" gives -1.
> 
> On 64-bit, values from INT_MAX + 1 up to 2^64 - 2^31 - 1 are already
> rejected, so for those this only makes 32-bit kernels behave like
> 64-bit ones.  Two callers store the result in a u32 and so accepted
> such values on 32-bit only: the legacy NFSv4 idmapper upcall
> (fs/nfs/nfs4idmap.c), which falls back to a numeric id when the lookup
> fails, and rd_pages= in drivers/target/target_core_rd.c, which also
> ignores match_int()'s return value.
> 
> These helpers parse mount options and similar user-supplied strings,
> so an out-of-range number is silently accepted as a different value
> instead of being rejected.
> 
> Parse the number the same way simple_strtol() does, using the same
> kstrtox helpers, but keep the unsigned magnitude and the overflow
> indication, and check the magnitude against the int range.  The
> accepted syntax, including what counts as "no number" (-EINVAL), is
> unchanged.  kstrtoint() is not used because it rejects trailing
> characters ("12abc" gives 12 today) and differs in the handling of a
> lone "-" or "0x".
> 
> Fixes: 77dd3b0bd17a ("lib/parser.c: avoid overflow in match_number()")
> Assisted-by: LLM
> Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
> ---
> These patches were prepared with Claude Code (Anthropic), model Claude Opus 5.5
> (claude-opus-5-5): the analysis, the Lean models used to find and check the bugs,
> the fixes and the tests. I reviewed them and take responsibility for them. The
> trailer only says "Assisted-by: LLM", as Documentation/process/coding-assistants.rst
> requires since commit 816d9992d9ed ("coding-assistants: simplify attribution").
> 
> Changes in v2:
> - Resent with my full name; no code changes.
> 
> v1: https://lore.kernel.org/r/20260925102334.49693-1-jain.sm@gmail.com
> 
>   lib/parser.c | 39 +++++++++++++++++++++++++++------------
>   1 file changed, 27 insertions(+), 12 deletions(-)
> 
> diff --git a/lib/parser.c b/lib/parser.c
> index 62da0ac0d438..30fdaefe4957 100644
> --- a/lib/parser.c
> +++ b/lib/parser.c
> @@ -11,6 +11,8 @@
>   #include <linux/slab.h>
>   #include <linux/string.h>
>   
> +#include "kstrtox.h"
> +
>   /*
>    * max size needed by different bases to express U64
>    * HEX: "0xFFFFFFFFFFFFFFFF" --> 18
> @@ -137,22 +139,35 @@ EXPORT_SYMBOL(match_token);
>    */
>   static int match_number(substring_t *s, int *result, int base)
>   {
> -	char *endp;
>   	char buf[NUMBER_BUF_LEN];
> -	int ret;
> -	long val;
> +	unsigned long long val;
> +	unsigned int radix = base;
> +	const char *cp = buf;
> +	bool negative;
> +	unsigned int rv;
>   
>   	if (match_strlcpy(buf, s, NUMBER_BUF_LEN) >= NUMBER_BUF_LEN)
>   		return -ERANGE;
> -	ret = 0;
> -	val = simple_strtol(buf, &endp, base);
> -	if (endp == buf)
> -		ret = -EINVAL;
> -	else if (val < (long)INT_MIN || val > (long)INT_MAX)
> -		ret = -ERANGE;
> -	else
> -		*result = (int) val;
> -	return ret;
> +
> +	/*
> +	 * Parse like simple_strtol() does, but keep the magnitude and the
> +	 * overflow indication instead of truncating to a long, so that
> +	 * values outside the range of an int can be rejected.
> +	 */
> +	negative = *cp == '-';
> +	if (negative)
> +		cp++;
> +	cp = _parse_integer_fixup_radix(cp, &radix);
> +	rv = _parse_integer(cp, radix, &val);
> +	if (cp + (rv & ~KSTRTOX_OVERFLOW) == buf)
> +		return -EINVAL;
> +
> +	if (rv & KSTRTOX_OVERFLOW ||
> +	    val > (negative ? (unsigned long long)INT_MAX + 1 : INT_MAX))
> +		return -ERANGE;
> +
> +	*result = negative ? -(long long)val : (long long)val;
> +	return 0;
>   }
>   
>   /**

