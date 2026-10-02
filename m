Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707AA25F7B9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790976117; cv=none; b=ecvkGvMLHxd/beMVzUx3cfWO3fbh6LZnIjZzHETxd2Hsaxd+TytsNFhjZTqwVI4HRUAmmvMIOkxL4jgneYut52jIdxNe8C7Txzaf7ftg5FfFB7T3VUEXTIaFnPsuRX1tAuyEIAX34Wbn9KkZRoFedHb5tcEgY4V7pnOKhdnxp2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790976117; c=relaxed/simple;
	bh=WolZc9XX/g3UtX1esMu+0uMu0VR632GS6vqQwwCeHtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e4VOaO/fL4RwXYndpFhojUIFZ6AhKiXd3Ed/oag4tmIkdBEJwyF33q/tJ9u4g72xcjb57K7QeJEZc+gk0N+5TiAWP6QjKJMSYMoKF1EVn7XmaAmPsIU3eK4iUCAYiCtvFIug4VoRyplxfvvSAlJioLmn/8u9Q8MCDz4z3gbXPOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=UxzIEjVY; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="UxzIEjVY"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-81ae6aefdceso209522a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 14:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1790976113; x=1791580913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xprLbqKK5v9twPr4dogCqLvAMqNAMuK05AeuISXJliM=;
        b=UxzIEjVYzXFAbK68dJc0tV0E2+33djaRaiTLGt8aBy3sTWqXSMRAeqaJFp+nlPV+rV
         NGJil/p4fSfuqdKWldHX3JBWLNK/wx1/XI0bTSPDSc8w29XfzoVlM7RI6JFLlDn+312I
         WADZy/u3Rda3qzSFtCsXJ6XCcYsWXKRQX+HOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790976113; x=1791580913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xprLbqKK5v9twPr4dogCqLvAMqNAMuK05AeuISXJliM=;
        b=ZVwERJVX690nFm+u0wnpsNOuoV5tU53A1IWezdoYKswT/jPx3YWh89tBvtegh9gxnv
         QCpQsbeoA6O2+5eyHUkRXEUruetHpT+kh2rX+JEVusHHYE6JlGb2Y0Jo02YsrmkSfB/D
         g2XPXMriFsZU3jcCwyp7p1bDvl2JBOkP9jCFXMe7b6ogMZe5yzKZNvwVfTxLk1kLqfmx
         +wwcMc9CnHsaHcdg0YPezzK3tFHhH0R4SbR8lWWuDhqGs5lKL9/Znsy//g7S0xV8RPuX
         zHdRUGiivNPdFzHeztv+XNve8I0ZeKStZHHtXSE4sVzH7GRsgB5wEePktY0I7ADiYVky
         8OcA==
X-Forwarded-Encrypted: i=1; AKwUvBxvwSrWw+SyQRX5dh8ezfyiI+9J+SsKxdWk+M1HuJz9G0HSOiy3UTG9nVhsW/ddGn0aLVOJyLOjbfMuHV0=@vger.kernel.org
X-Gm-Message-State: AFuF++kjMm2g8iQFSNYSbspZecRF9ZTwWuiOI2HMQWi8qZNo3mNuVViZ
	BLYYIEfcWDObY8ZPhbOFLDFoOXtIHES1B4VjwkkXoJbGVDk5FZ9WdiUK6rKje24PDoYkI/GGmOR
	X6T1ZTA==
X-Gm-Gg: AYBFou0x+BhHXl5eC438A1BkuHb8yPX9885jKow39y1W15Zh4vUcoe8GRjcfRJWqYMz
	/OuUxtzhGR2AM2pr2sZH+lkwlLXrLGLTTCWOOMM0U9t9Tn9rEE79iHF43m8AjNADSaxAFjqhxaK
	TVRENyGyjfRmQtCj7CBu0RFcFeR6CoruV6ULAjn5isXVbOXLCdTve1aENC5FkgD/NlUlLzmSFoO
	DRE98gjKHgCm15NZKP4Y5SfLK00YZ6zz9UfXYsnJMgZrb3nZgokT3JmsGHUB+gd6VgyPZxvEVva
	8GT6gJRqyYR+1rzEbPfbyxsnUlRBQ0L64d5C/HSNB9MI+2x+TUzWCN4DjpWWmHKrTJxfNsCu8i7
	Yb/+/70UHx8wOzWrK9d/MJ1tRAQWjijOzwmss1QyuxqEFAEZc5SvuvTyscg060GhdXd4QqLncgh
	RbTW5eqO6CKOKAeds9LUXiUaocpre56HRWF/KinqncCTAPqaGcAVKHV5KGPd8H1prEVg==
X-Received: by 2002:a05:6830:6d43:b0:7fa:ac4f:793 with SMTP id 46e09a7af769-823fdf0b126mr678254a34.31.1790976113027;
        Fri, 02 Oct 2026 14:21:53 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-822792a1691sm3767733a34.6.2026.10.02.14.21.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 14:21:52 -0700 (PDT)
Message-ID: <0287908d-79a4-44b9-80c0-666b7ef6f639@ieee.org>
Date: Fri, 2 Oct 2026 16:21:51 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] lib: parser: reject out-of-range values in
 match_number()
To: shashank Jain <jain.sm@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Elder <elder@kernel.org>,
 David Gow <david@davidgow.net>, linux-kernel@vger.kernel.org
References: <20260926012718.15675-1-jain.sm@gmail.com>
 <00571efd-cc91-4ba7-a904-9ce183313f25@ieee.org>
 <CA+FWx=mP40LGSNxX=ivmam9d9i+JxtZBhuebGQHqyVK2Yeq4zg@mail.gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <CA+FWx=mP40LGSNxX=ivmam9d9i+JxtZBhuebGQHqyVK2Yeq4zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/1/26 8:34 PM, shashank Jain wrote:
> Hi Alex,
> 
> Thanks for looking at this.
> 
>> The result is still placed in memory referred to by an
>> integer pointer, right?  Not a long long?
> 
> Yes. The interface doesn't change: match_int(), match_octal() and
> match_hex() still return an int through an int *, and the accepted
> range is still INT_MIN..INT_MAX. The unsigned long long is only used
> while parsing, so that a value outside the int range can be detected
> and rejected with -ERANGE instead of being stored as a different int.
> By the time *result is written, the value is known to fit.

So your goal is simply to return an int as before, but make
the function robustly handle all possible inputs.  It should
return a valid value in *result when the input substring
contains a value INT_MIN..INT_MAX inclusive, and return an
error otherwise.

Note that the comment above simple_strtol() says:

   This function has caveats. Please use kstrtol instead.

I started reviewing what exactly kstrtol() would do, to
see if using that might be simpler.  It looks to me like
it does some of the same things you do.

I'm haven't run the unit test you provided, and I tried
working through what would happen with kstrtol(), but
gave up because it was taking too long.

Would this work instead?

static int match_number(substring_t *s, int *result, int base)
{
     char buf[NUMBER_BUF_LEN];
     long res;
     int res;

     if (match_strlcpy(buf, s, NUMBER_BUF_LEN) >= NUMBER_BUF_LEN)
         return -ERANGE;

     ret = kstrtol(buf, base, &res);
     if (ret)
         return ret;

     if (res < (long)INT_MIN || res > (long)INT_MAX)
         return -ERANGE;

     *result = (int)res;

     return 0;
}

					-Alex

> 
>> It might be better to define a new function that expects to
>> produce (up to) 64 bit result values (signed, or maybe not),
>> rather than changing this function.
> 
> For callers that need 64-bit values there is already match_u64()
> (match_u64int() with kstrtoull()), so I don't think a new function is
> needed. This patch is only about the int helpers accepting
> out-of-range input.
> 
>> Or... maybe there's a simpler way to catch a too-long
>> input string.
> 
> I looked at that, but the length of the string doesn't decide whether
> the value fits: "4294967295" is only 10 characters and doesn't fit in
> an int, while leading zeros make a long string that does
> ("00000000000000000001"). What is needed is the overflow indication,
> which simple_strtoull() drops (there is a FIXME at that spot in
> simple_strntoull()). _parse_integer() returns it, so the patch parses
> the same way simple_strtol() does, keeps that flag, and compares the
> magnitude with the int range.
> 
>> This matters because match_number() calls simple_strtol(),
>> which is implemented using simple_strtoul(), and that is
>> implemented using simple_strtoull().  So if a very long
>> numeric string is passed to match_number(), it will be
>> misinterpreted as something that overflows 32 bits,
>> which will end up having a misleading (but essentially
>> valid) int value.
>>
>> Is that correct?
> 
> Yes, that is the problem, in two forms:
> 
> - On 64-bit, a value of 2^64 or more saturates to ULLONG_MAX in
>    simple_strtoull(), and simple_strtol() turns that into -1L, which
>    passes the INT_MIN/INT_MAX check. Values from 2^64 - 2^31 to
>    2^64 - 1 wrap to small negative longs the same way. So match_int()
>    returns 0 with *result = -1 for "18446744073709551615" or
>    "99999999999999999999".
> 
> - On 32-bit, long is as wide as int, so the range check can never
>    fail: "4294967295" also gives -1, and "2147483648" gives INT_MIN.
> 
> In both cases the caller gets success and a different number from the
> one that was written, for example in a mount option. With the patch
> these return -ERANGE. Values that fit in an int are accepted exactly
> as before, with the same result and the same syntax.
> 
> Sorry the changelog made it sound as if the result were becoming
> 64-bit; only the intermediate magnitude is. I can reword that in a v3
> if it helps.
> 
> Thanks,
> Shashank
> 
> On Fri, Oct 2, 2026 at 3:07 AM Alex Elder <elder@ieee.org> wrote:
>>
>> On 9/25/26 8:27 PM, Shashank Mohan Jain wrote:
>>> match_int(), match_octal() and match_hex() store the result in an int
>>> and return -EINVAL or -ERANGE on failure.  match_number() checks the
>>> range by parsing into a long with simple_strtol() and comparing against
>>> INT_MIN/INT_MAX, a check added by commit 77dd3b0bd17a ("lib/parser.c:
>>> avoid overflow in match_number()").  That does not catch every
>>> out-of-range input:
>>
>> The result is still placed in memory referred to by an
>> integer pointer, right?  Not a long long?
>>
>> It might be better to define a new function that expects to
>> produce (up to) 64 bit result values (signed, or maybe not),
>> rather than changing this function.
>>
>> Or... maybe there's a simpler way to catch a too-long
>> input string.
>>>
>>>    - simple_strtoull() saturates to ULLONG_MAX on overflow and
>>
>> This matters because match_number() calls simple_strtol(),
>> which is implemented using simple_strtoul(), and that is
>> implemented using simple_strtoull().  So if a very long
>> numeric string is passed to match_number(), it will be
>> misinterpreted as something that overflows 32 bits,
>> which will end up having a misleading (but essentially
>> valid) int value.
>>
>> Is that correct?
>>
>> At this point I'm just trying to make sure I understand what
>> your intent is, because I'm unsure this is the right way to
>> achieve what you're after.
>>
>> I guess I'm stuck on match_number() expecting to produce
>> an int result, and your discussion talks a lot about 64-bit
>> values.
>>
>>                                          -Alex
>>
>>
>>>      simple_strtol() simply converts its result to long, so any value of
>>>      at least 2^64 - 2^31, and anything that overflows 64 bits, ends up
>>>      inside the int range.  On 64-bit, match_int() returns 0 and sets
>>>      the result to -1 for "18446744073709551615" or
>>>      "99999999999999999999", match_hex() does the same for
>>>      "ffffffffffffffff", and "-18446744073709551615" gives 1.
>>>
>>>    - On 32-bit, long has the same width as int, so the range check can
>>>      never fail: "2147483648" gives INT_MIN and "4294967295" gives -1.
>>>
>>> On 64-bit, values from INT_MAX + 1 up to 2^64 - 2^31 - 1 are already
>>> rejected, so for those this only makes 32-bit kernels behave like
>>> 64-bit ones.  Two callers store the result in a u32 and so accepted
>>> such values on 32-bit only: the legacy NFSv4 idmapper upcall
>>> (fs/nfs/nfs4idmap.c), which falls back to a numeric id when the lookup
>>> fails, and rd_pages= in drivers/target/target_core_rd.c, which also
>>> ignores match_int()'s return value.
>>>
>>> These helpers parse mount options and similar user-supplied strings,
>>> so an out-of-range number is silently accepted as a different value
>>> instead of being rejected.
>>>
>>> Parse the number the same way simple_strtol() does, using the same
>>> kstrtox helpers, but keep the unsigned magnitude and the overflow
>>> indication, and check the magnitude against the int range.  The
>>> accepted syntax, including what counts as "no number" (-EINVAL), is
>>> unchanged.  kstrtoint() is not used because it rejects trailing
>>> characters ("12abc" gives 12 today) and differs in the handling of a
>>> lone "-" or "0x".
>>>
>>> Fixes: 77dd3b0bd17a ("lib/parser.c: avoid overflow in match_number()")
>>> Assisted-by: LLM
>>> Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
>>> ---
>>> These patches were prepared with Claude Code (Anthropic), model Claude Opus 5.5
>>> (claude-opus-5-5): the analysis, the Lean models used to find and check the bugs,
>>> the fixes and the tests. I reviewed them and take responsibility for them. The
>>> trailer only says "Assisted-by: LLM", as Documentation/process/coding-assistants.rst
>>> requires since commit 816d9992d9ed ("coding-assistants: simplify attribution").
>>>
>>> Changes in v2:
>>> - Resent with my full name; no code changes.
>>>
>>> v1: https://lore.kernel.org/r/20260925102334.49693-1-jain.sm@gmail.com
>>>
>>>    lib/parser.c | 39 +++++++++++++++++++++++++++------------
>>>    1 file changed, 27 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/lib/parser.c b/lib/parser.c
>>> index 62da0ac0d438..30fdaefe4957 100644
>>> --- a/lib/parser.c
>>> +++ b/lib/parser.c
>>> @@ -11,6 +11,8 @@
>>>    #include <linux/slab.h>
>>>    #include <linux/string.h>
>>>
>>> +#include "kstrtox.h"
>>> +
>>>    /*
>>>     * max size needed by different bases to express U64
>>>     * HEX: "0xFFFFFFFFFFFFFFFF" --> 18
>>> @@ -137,22 +139,35 @@ EXPORT_SYMBOL(match_token);
>>>     */
>>>    static int match_number(substring_t *s, int *result, int base)
>>>    {
>>> -     char *endp;
>>>        char buf[NUMBER_BUF_LEN];
>>> -     int ret;
>>> -     long val;
>>> +     unsigned long long val;
>>> +     unsigned int radix = base;
>>> +     const char *cp = buf;
>>> +     bool negative;
>>> +     unsigned int rv;
>>>
>>>        if (match_strlcpy(buf, s, NUMBER_BUF_LEN) >= NUMBER_BUF_LEN)
>>>                return -ERANGE;
>>> -     ret = 0;
>>> -     val = simple_strtol(buf, &endp, base);
>>> -     if (endp == buf)
>>> -             ret = -EINVAL;
>>> -     else if (val < (long)INT_MIN || val > (long)INT_MAX)
>>> -             ret = -ERANGE;
>>> -     else
>>> -             *result = (int) val;
>>> -     return ret;
>>> +
>>> +     /*
>>> +      * Parse like simple_strtol() does, but keep the magnitude and the
>>> +      * overflow indication instead of truncating to a long, so that
>>> +      * values outside the range of an int can be rejected.
>>> +      */
>>> +     negative = *cp == '-';
>>> +     if (negative)
>>> +             cp++;
>>> +     cp = _parse_integer_fixup_radix(cp, &radix);
>>> +     rv = _parse_integer(cp, radix, &val);
>>> +     if (cp + (rv & ~KSTRTOX_OVERFLOW) == buf)
>>> +             return -EINVAL;
>>> +
>>> +     if (rv & KSTRTOX_OVERFLOW ||
>>> +         val > (negative ? (unsigned long long)INT_MAX + 1 : INT_MAX))
>>> +             return -ERANGE;
>>> +
>>> +     *result = negative ? -(long long)val : (long long)val;
>>> +     return 0;
>>>    }
>>>
>>>    /**
>>

