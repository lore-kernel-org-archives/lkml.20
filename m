Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBBD25333F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787922456; cv=none; b=Iyc/os9FVqm8Sf4YD/ZFsdEYBBk5KsmkFR6b8NlTqaCyQ00vgwWITueGuTtidHT45PXd7ZwE2lugVmu3m5QsLRNirGxV3ISemIXXEcUZa9RBxyOImrbRMq1k8LxguFusS4lm7wERFqTShhUZjoQo3JU6dPK7dl6pEpJ+hijXbUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787922456; c=relaxed/simple;
	bh=0cnu+ZMfunp2hV8JKB6qWjNszdBZaWg/W2o4AeU1fl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lVi9cSaX1HBaE8M86XNilOhVacdCXonqoaR3tvmjksiymjnkWX5kPIuqdmUq6V+tmEOLIc1/gT2XYzEmf9b0zwy0ZO4PhZiWF9JzQ2d2NE1fsER2lQIhX8ebPVhTypRptRc5N0D2lxjSuWDYg1BghKl2+YJMy7RyuUd01lYoN1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Oq8lRnX2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Oq8lRnX2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso6339595e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787922450; x=1788527250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7aHFohDYwXcOP7zZuVMn7W5BMSpOSC48205QwYsUq4=;
        b=Oq8lRnX24xrol4kS48RpIUhXNtIZv0u/1CARCB/DMkEYS4krwevKzHu6guZTC0uDU8
         M6qXaWJexEAnFNT62OMI1386qqWEX/KPvOiF/S3mE9GF0nVa12ewe/owSdqtY7klQTvf
         TY+W/i1dt+enUV0jiisoItGLVI62o+JcsjW42uSgUlc3bBQTwIQ3y2fNef88mre+YvSU
         6u6Y0mC0xTxpCUuZjh0nH6c4vkgjirY8fG+BdY5hW3zHbbdYqe0hqhpDjCN3E8uo81u0
         Zd5+hRznnEAa4uY7YdVlCKdQzZU5CpD0BvE5FORqIlR3XJfGtcQ8T4Phx4k+iF6c6KiD
         EciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922450; x=1788527250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E7aHFohDYwXcOP7zZuVMn7W5BMSpOSC48205QwYsUq4=;
        b=qhaQXWVRb4GFqsrLWwiogfsVJdJ1aeToSFqc0Egd+eB/n9BXAgijVaocK8abxBgqdY
         Nv+uOtADRV9RJCoKwMr0nWLnxFjAzA+u7JAU4vxF8w9ufCOW/MS682IT1cwR1peb8koK
         8SYKVQz9OlYhUu74Sjm7GUNvwRW144BkxzwIz6osPp84uVKnH4ljgaj6JTbqNdKWA7ls
         4+wFubT4mG2lZSWoXiELqVTbdb5XvC+pjkCivE/xsVjMgwKX+pKl2rtwFmLkFujCR/14
         L9yKF5TtxrdPvk2dcA772qsDRYow/UqYPuGqqm3n8IzToyqOgRoDzK/JIjVjTnCjAQnn
         3OzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqgVBj3mySaspdK7fAo1YN9X4BStxnvlN748WPw3XDOlGdVKCnEjXWxtgM+fOSZXxq8hEGxaohil0frsO8=@vger.kernel.org
X-Gm-Message-State: AFuF++lSHo6T6wfGVmj7fb0MSy8tN/XFO5WAAKChJcUJpzGXdlbN16SP
	+saF7+AnasmLIII3wRtqH9+aUAEdDdnrPKl97K4/wKbiPyF2x2WSwanIt2P/ZOLdyXA=
X-Gm-Gg: AR+sD12/K5jAJfMwLfrXnyhl4HieIsnDGl/6MAkXtrzaA6R96Ep6zmv9/0vzyJCuUEK
	944T8vfHkcRVLltEpKatoeNwTJjifTzHYDhWZvb26S1ZusIFUB4UUHb68RISy7MOVVEPQtwLmqV
	2uPRandC3ApuwJcbyOH9IgK7M/P5mGy05gEpHy8K7Avc51WhXXiQWArUkh5izDTgR2HSb4tYTqr
	f53e6EUl+IBoYWRVjI3QMVo8NjD8j923OZlPiQaK6ndzQAMm5T56izR1am6wXb6LFUZuoxa9CUl
	79aj+nhNMDPKjEI0grXog1GkHKbrXp42nfXDlc9husCc4RSBeeTjcLZhtjdcN4xQNRpmgnHNMmu
	v3vN68Uwdd4me+IrvKBfRAzd1XyHCulc31k0GH2ujtQa+8ThpQtekKqOraS1GV9Tt74Tk+P5Mty
	RdOocu9H2Kggbt0vxFQP3HIj8mmb709wIZ8KFPEnGe8nc28a/HbBzqXWbikUYuZdvb3Hy83L0jn
	byLKYWLHKT8NNTOmH56L8kTRQ==
X-Received: by 2002:a05:600c:8885:b0:49b:909e:922e with SMTP id 5b1f17b1804b1-49b91c4884amr87957605e9.10.1787922450172;
        Fri, 28 Aug 2026 06:07:30 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c80asm56272005e9.9.2026.08.28.06.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:07:29 -0700 (PDT)
Message-ID: <524b5817-c097-47cb-b301-4a9c0f1d2947@suse.com>
Date: Fri, 28 Aug 2026 15:07:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/9] arm64: Allocate .text and .init.text together
To: Ard Biesheuvel <ardb+git@google.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20260822135323.795946-11-ardb+git@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260822135323.795946-11-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/22/26 3:53 PM, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The arm64 module loader has to deal with a couple of corner cases that
> may occur when .init.text is placed out of direct branch range of .text:
> 
> - ordinary direct branches from .init.text into .text may require the
>   use of a PLT entry (i.e., a trampoline aka veneer), which means not
>   only that additional PLT entries need to be allocated for
>   cross-section calls, but also that .init.text needs its own PLT
>   reservation, as the one in .text will be out of range as well;
> 
> - dynamic patching of the ftrace handler into .init.text code needs its
>   own dedicated trampoline as the one in .text may be too far away.
> 
> - recent compilers may omit BTI veneers for static functions that never
>   have their address taken, and so additional veneers will need to be
>   added to .text in case cross-section direct branches from .init.text 
>   require a PLT entry (and therefore a landing pad at the target end).
> 
> This is unfortunate, because it is actually somewhat unusual for .text
> and .init.text to be so far away from each other: only when allocating
> either of them (but not both) exhausts the 'near' (PLT-less) module
> region, the other will be allocated from the spillover region, which is
> not in direct branching range, and therefore requires PLT entries for
> cross-section calls.
> 
> This series addresses this wart by allocating both of them as a single
> chunk, and freeing the .init.text part along with the other init
> sections at the appropriate time. This ensures that the two regions will
> never require veneers for cross-section calls, allowing the arm64 module
> loader to be simplified.

It looks like this should also be useful for ppc64, which currently
merges .init.text and .text because keeping them separate would require
stubs between the two, and consequently .init.text is never released in
modules on this architecture.

-- 
Thanks,
Petr
