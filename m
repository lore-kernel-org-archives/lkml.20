Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0871E4C9DFE
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791213046; cv=none; b=rjpUHhbn6vZexRj+nuSUMdCZSzTiwDqICD2MeJfocgwLfFkSJhUWRZjAgYCEs48Uv8hnUhxw9G+1spnbCj7k9srDMQIDap5jsP9r+AsQllhOA3ZbIrHy6X1JjRp5Lx9SvyzXXXZPgdQnF4NvBxagJzGM14Ke3NOOczy6U1NtYBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791213046; c=relaxed/simple;
	bh=lrbHPGC+akTZtrjc/CYjFuuHoj92ZG9E/o+gLsQZbWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcXoyod+v6pOtCuCaN41IvqGOW32dmLQU0PYt+L5EBVXLJu0Umv9ppn+MEYFc6aWlSMlMmVbnwo8ukK5FHzCleB9GNAPYF1NKgz7SHUlhkPKiUqncs7epSwSvQHUeMZFvscp8wmrBY8gGXr4gag05f9F2oJHTexxj4tNyOQR4XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=Pfv7yUJz; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="Pfv7yUJz"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49e0f8c0e59so1131681fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1791213043; x=1791817843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PiOcaLy6CqpFhrqHsztgzTReCiA1ACciOB0CR8yHXLM=;
        b=Pfv7yUJzpWPTo3JhDSkTL9XvoXWPmzkSXQL31ASAFZMwWT/oUqtXOHqKYNaiLuQa9N
         atF7Oi72RQ2NTOI0q5J6qUPtcLnxsEcyDNDxMG3jduirECIuK5BHC2lptd9ZJocD1iry
         Ss1//MW7T8+vf99yyAfMjotwpVVb46327lmc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791213043; x=1791817843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PiOcaLy6CqpFhrqHsztgzTReCiA1ACciOB0CR8yHXLM=;
        b=cVT94fnfvCnqX1Z2Xjsnytg+ehApCy+YFVdrCVV6amt08sUt0NzfsuWKx1VWJQZDjw
         c2rfOGg9//AotCg4iZBpDmEjv4/yLecu4i3D7Wm7TJtBDFkzAAipS9rk1QmSc+rCmcol
         2apmu334wQTH2915j7B4KIsnZtrH86u5uVNoyipte/0DuAkjoNeeuEC3MAhVxSNUkx3w
         PNc6z53kmX781R0jIvRqoKsYy75x6dedLV/y+25uO0Mv5xqx607uvIUAKw+iUFQE2Jfr
         /vgzxivA26RLyBE3eX9QHSyS1KzIeBcZgLi4myUtPhYTrnVnTvXh0sxMiIPXALR961Y/
         6BsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVGNc1zpRzntUYa/MZRhIBSDNg9Dn0yskVLx3nphQ+Y2TnhASyONAyXr2UFpd2FfCGYOMwsPtreRg+W98=@vger.kernel.org
X-Gm-Message-State: AFuF++kdnafwoGMuYmM6zTVHezdZIPwwoV8JMOtBVV+vCCxd7s1tbXjW
	GKi1RCL3/VTttjEJxZsVOkMMsU7NE0bcdFfX6MmtdqBEod3lUIElYDjtO2GmMB62AmnzfLyFCLD
	yBGfRVw==
X-Gm-Gg: AYBFou2DkUwidig8dsilJihxUtOgrHqo5ShXDdKJWEYoXymS1KpY4AfZ2fY3zklzNY8
	ymRiva5ju4SCD+fif5va95ebIGJCPBUpkuDbsw3q0vuu134ukIreMrTve0bQHQ9ZV3iEhb1E/vP
	KI5nAKcjo+6VafpdbMb+0CWRVxA8qKtGcLNRG+DEmCgmB5GUeCRGWW078J6uS00heM9KMLaVrN4
	exuMkHblf69VC8Ip/bHkc8XL/cgVKoYYm3lagun6C66e88Saje2AT6Y+sRllMA0LWuU49wVS+7/
	f5Tc9pEe+XaX1YqyksnqcnWvAfXFpNYyVQjZ0w5RvGTmMRXuTQiw5ZgjAM+nryOGQHHWAOl7Dct
	7EwNhXl1BAFgJgOJfyemoPrIpib0Xox0gjT8ymiOGl4k/H5PrkjpYlBvYUuVpGEQD42jWNfIK1f
	88KSiczugN4EAhdFoyuXfbqIMAzFoapXnS85tOfFo4KPNo/jRgumYT3xZU9ck7WrBFiKE=
X-Received: by 2002:a05:6870:7097:b0:494:b0db:4e0d with SMTP id 586e51a60fabf-49e1590d2bemr8833288fac.7.1791213042645;
        Mon, 05 Oct 2026 08:10:42 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-49e16a4ecacsm9463820fac.1.2026.10.05.08.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 08:10:42 -0700 (PDT)
Message-ID: <5c4e955c-b562-4f38-83d1-165a18ff0bf7@ieee.org>
Date: Mon, 5 Oct 2026 10:10:41 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] lib: parser: reject out-of-range values in
 match_number()
To: Shashank Mohan Jain <jain.sm@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Elder <elder@kernel.org>, David Gow <david@davidgow.net>,
 linux-kernel@vger.kernel.org
References: <20261005014423.78677-1-jain.sm@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261005014423.78677-1-jain.sm@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/4/26 8:44 PM, Shashank Mohan Jain wrote:
> match_int(), match_octal() and match_hex() store the result in an int
> and return -EINVAL or -ERANGE on failure.  match_number() checks the
> range by parsing into a long with simple_strtol() and comparing against
> INT_MIN/INT_MAX, a check added by commit 77dd3b0bd17a ("lib/parser.c:
> avoid overflow in match_number()").  That does not catch every
> out-of-range input:
> 
>   - simple_strtoull() saturates to ULLONG_MAX on overflow and
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
> These helpers parse mount options and similar user-supplied strings,
> so an out-of-range number is silently accepted as a different value
> instead of being rejected.
> 
> Use kstrtol(), as the comment above simple_strtol() recommends.  It
> returns -ERANGE for values that don't fit in a long, which on 32-bit
> is the whole int range check, and the INT_MIN/INT_MAX check covers
> 64-bit.  The substrings passed in come from match_one(), which ends a
> %d, %o or %x argument where simple_strtol()/simple_strtoul() stops,
> so kstrtol() sees the same characters and accepts the same values in
> the int range as before.
> 
> Fixes: 77dd3b0bd17a ("lib/parser.c: avoid overflow in match_number()")
> Suggested-by: Alex Elder <elder@kernel.org>
> Assisted-by: LLM
> Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
> ---
> These patches were prepared with Claude Code (Anthropic), model Claude Opus 5.5
> (claude-opus-5-5): the analysis, the Lean models used to find and check the bugs,
> the fix, the tests, and the check of the in-tree callers for v3.
> 
> Changes in v3:
> - Use kstrtol() as suggested by Alex Elder, instead of open-coding the
>    parse with _parse_integer(); the changelog says why it accepts the same
>    values for the callers. The existing "int ret" and "long val"
>    declarations are kept, so the diff only replaces the parse.
>    Patch 2/2 (the KUnit test) is unchanged.
> 
> v2: https://lore.kernel.org/r/20260926012718.15675-1-jain.sm@gmail.com
> v1: https://lore.kernel.org/r/20260925102334.49693-1-jain.sm@gmail.com
> 
>   lib/parser.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/parser.c b/lib/parser.c
> index 62da0ac..5e3abf0 100644
> --- a/lib/parser.c
> +++ b/lib/parser.c
> @@ -137,22 +137,19 @@ EXPORT_SYMBOL(match_token);
>    */
>   static int match_number(substring_t *s, int *result, int base)
>   {
> -	char *endp;
>   	char buf[NUMBER_BUF_LEN];
>   	int ret;
>   	long val;
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
> +	ret = kstrtol(buf, base, &val);
> +	if (ret)
> +		return ret;
> +	if (val < (long)INT_MIN || val > (long)INT_MAX)
> +		return -ERANGE;
> +	*result = (int) val;

For consistency, there should be no space between the right
parenthesis in the cast and val.  This could probably be
fixed by the maintainer if this gets accepted.

					-Alex

> +	return 0;
>   }
>   
>   /**

