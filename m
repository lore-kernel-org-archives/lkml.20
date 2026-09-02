Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D402B3246E8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788319535; cv=none; b=cF0HTHymEjO4Cs7hx2WAwujptJspIPiU5WMRimn5ixDP9GtzQ/Uk5EUlFBkt8LiZNsKurXswu5CvPSlsVZOyAp/cyKI759rd9rulfa7dy7rv+EitkTBx0aFpS2zirqMhjN+vKc0PWIai8e2OdYrKSiKIpBAhyPFRNP6k2N3KRDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788319535; c=relaxed/simple;
	bh=kkj1SfAuKbnUxsBGDMnYN1uaJ75fNUtFYXF6EgPIdEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UwnorRXc71QBSxLtn/SoV2bkEWeflma1rGHAuC2E93sWpmIHnRwE5Ies4N2bytpYpMdA7Ra3VOn5AjKW8MqMkJR+mxWxaOeG4zNO5gsN2gJ8PrUxS9uUh8VnnLtiWZIVct5HECOn3MzBT8cvhG3LNjywsFEbFRbsaWA9SUbCaDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEXjC8Q5; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEXjC8Q5"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-398b3d66515so715594a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788319533; x=1788924333; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VD6v8s0YmmBGH+g/L9ADsNVfDz8b1jCa2DNP/I6lmU4=;
        b=dEXjC8Q5rbxnyrNdCoTWmzQAOCVqAqD9ymwSv+UY7eobXbEXvg+YmsKWC0/mVIb2Jo
         u7TLJGzdpAgyw5ZskMxNBd/A2ME0IEFj00KAY8HbpVJ7r4BTnmYHDcIPAAtYuVZ4lKuJ
         P4yjW9PI0t4Kd8uKQYruPghngfiRD2pjl4ciVTP7tsvGsJu1fLMQvmJFe4Dz2UOP9x9m
         kXQt3ajzjRHzSwcXb7hPPCB9+FeQ9H/fU+10vJNXYxjjbl3Y6VSL6UVaa9emhmbJEATH
         BYpOSzv+8/3MhDP9PfOez21Ocm1Gh3QnaWaTcKBfapCiRAOvwTsURpS5XLg6idHGzoTH
         HYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788319533; x=1788924333;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VD6v8s0YmmBGH+g/L9ADsNVfDz8b1jCa2DNP/I6lmU4=;
        b=RWZ+0v9L/cGDbpHtcU5ovEknobej9hOd+TY6e3c9RtUjEJGK5VRpxFBb3OctUva1B+
         T0eWqNXdXVcAbeuSgMmrr+ATORpQ4avhHS7+H3Czci46s6cVIRCy2gT4vre1yjzgp17k
         omgFzqVT+0W9eINbCyyc8uiDdcEaj2FLVnKv0AAWdyaRT0za8esDh9wKcYyhjcW4lILl
         mV3Hr/izp0L9D4m8zNuI+r+IdP89MFLYLe1oRwdCsjyuZIW14SmedKAcwlv5FoNedz0X
         Y48bK5M0MrDna22118ZEAQQH7EQPQVsb3yppK/3F1ZTyYr28k7oxnGn98LrxgFk/sVf+
         nPig==
X-Forwarded-Encrypted: i=1; AKwUvBwqmr2T4Hpwm0KlgmKZUlD7jDZBNwHfJF1enRJgmZCHFdvIe+SzjM53ltK8kDe9p426zy0xd+aQ5X8Bf+c=@vger.kernel.org
X-Gm-Message-State: AFuF++nlnca09SeTW7m0mLRwfY679D/X9jSuMoEda7lFAoh+B+LCIa+s
	oRLMVp14mO86aiO+fjnX43Uc6UUeQxfuNIvCk5jCpH1U0a3a6WcD22x9X2xktQ==
X-Gm-Gg: AYBFou2E+Y6N9ELQMu9OgtI03d1+v1ujWQPOKj1McmXBD0oJ/nOaeUqlCEu5IWvKmNY
	yTUAe8bH65cCocVuAJYWmmo+ig6Qt73xlVOa7GkuYcPQgJyViUwA14mC0lsC1LvOKgudJ0IIqF8
	LQew0zu3MtZXtV9EdV/Lg8OwtJiuIfDOUcY2V1cgHJkChkASde/D3oJfWxMCFhhmW2QRadpKIfm
	+9hKeu/3vt8PzYGxINmBg7EGviMMQYPs/HsK1MHPkly2t/cWf0PgCylJZwDssNwKKLZes9IDq5/
	3fQ9zv8y8M3suUsMPbEMCKg6JQydbW96E7+V5cO/NrwF60N5pzJWa/6UHFt7Z6FsCP619biH6uf
	cqoRBsEteVzn5ukj3H4Kf23q0O1b6ODE1+C7Tm7whe8ilNlSZ/hw5VANQ6snyXuY/s4N3j/Onwn
	fo9WqYa4vnyI+p2GHwmWe+yVewJgyrnNiSJVYwvAanAoVLHqUW2ts3233apl7mAmTPjgPt4skY0
	qKpZcQ=
X-Received: by 2002:a17:90b:520f:b0:398:9c00:29e9 with SMTP id 98e67ed59e1d1-39aee1b72e5mr2712074a91.17.1788319533019;
        Tue, 01 Sep 2026 20:25:33 -0700 (PDT)
Received: from [10.189.137.81] ([43.224.245.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d4637a3sm8664198a91.5.2026.09.01.20.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 20:25:32 -0700 (PDT)
Message-ID: <f18beeb4-f3df-41eb-9990-5be295a2729b@gmail.com>
Date: Wed, 2 Sep 2026 11:25:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] Use BTF to trim return values
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, dolinux.peng@gmai.com,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 pengdonglin <pengdonglin@xiaomi.com>
References: <20260901134604.4052265-1-dolinux.peng@gmail.com>
 <20260901135715.4812fde9@gandalf.local.home>
Content-Language: en-US
From: Peng Donglin <dolinux.peng@gmail.com>
In-Reply-To: <20260901135715.4812fde9@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/26 01:57, Steven Rostedt wrote:
> On Tue,  1 Sep 2026 21:46:01 +0800
> Donglin Peng <dolinux.peng@gmail.com> wrote:
> 
>> From: pengdonglin <pengdonglin@xiaomi.com>
>>
>> The funcgraph-retval option currently records one machine-word return
>> value without considering the function's declared return type. As a
>> result, void-returning functions can produce meaningless output, and
>> return values narrower than a general-purpose register can include
>> undefined high bits.
>>
>> This series uses kernel BTF to identify the return type of traced
>> functions and to improve funcgraph-retval output:
>>
>>    - Do not print a return value for functions with a void return type.
>>    - Trim integer, enum, struct, and union values to the available return
>>      value width when the BTF type provides suitable size information.
>>    - Format integer, enum, and boolean values according to their BTF
>>      encoding.
>>    - Mark values as "(trunc)" when the return type is wider than the
>>      value captured by the function graph tracer.
> 
> Hmm, I really don't like the "(trunc)" If it's the real return type, then
> it should just print what the real size is. No need to state it was truncated.

Thanks, I agree. We can remove the "(trunc)" suffix and print the actual 
type information instead, for example:

     ret=0x5[struct:0x10]

This would indicate that the return type is a struct with a size of 0x10 
bytes.

Would this be acceptable?

> 
> -- Steve
> 
>>
>> Here is an output comparison:
>>
>> Before:
>>   # perf ftrace -G vfs_read --graph-opts retval
>>   ...
>>   1)               |   touch_atime() {
>>   1)               |     atime_needs_update() {
>>   1)   0.069 us    |       make_vfsuid(); /* ret=0x0 */
>>   1)   0.067 us    |       make_vfsgid(); /* ret=0x0 */
>>   1)               |       current_time() {
>>   1)   0.197 us    |         ktime_get_coarse_real_ts64_mg(); /* ret=0x187f886aec3ed6f5 */
>>   1)   0.352 us    |       } /* current_time ret=0x69380753 */
>>   1)   0.792 us    |     } /* atime_needs_update ret=0x0 */
>>   1)   0.937 us    |   } /* touch_atime ret=0x0 */
>>
>> After:
>>   # perf ftrace -G vfs_read --graph-opts retval
>>   ...
>>   2)               |   touch_atime() {
>>   2)               |     atime_needs_update() {
>>   2)   0.070 us    |       make_vfsuid(); /* ret=0x0 */
>>   2)   0.070 us    |       make_vfsgid(); /* ret=0x0 */
>>   2)               |       current_time() {
>>   2)   0.162 us    |         ktime_get_coarse_real_ts64_mg();
>>   2)   0.312 us    |       } /* current_time ret=0x69380649(trunc) */
>>   2)   0.753 us    |     } /* atime_needs_update ret=false */
>>   2)   0.899 us    |   } /* touch_atime */

