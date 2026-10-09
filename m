Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A6949A3BE
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536997; cv=none; b=SG3IWz/Cfg3079ip2tlWGkri5aPdZA8uwaEi4Xv78RUbZ1o2eFuxos+aRyc1HybUsllEQveGAZ8yQqfKgBSk2HUbmFUK0PahidFy3GQ3wx2fCP+g9DdA75qHCwGIOVjriDJhdDYcfCEg4ExTzFdKx792AocqCFNYvcvZ8rWVyK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536997; c=relaxed/simple;
	bh=cB08DrKfnhr8nUV/zbaASjyuSsJDvjbc5ojn6q9zItY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TgBzhw/zan9RiPdCbOtQh0fTFeVvcX/psicsIQlskbNHIpZFXwUWVR0WeGr4RKNbwkwX68Jpxnnb5aTLW2Gfgii4kNjL3r/+wPfbsPIw9p/JeApVfIwhPU/SRtJKagfU/WWqeqwz/oL77OBMhWiSiyWt1RwI7PiAsyr55AkpiBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C6YHPOSy; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C6YHPOSy"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso2509643f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791536994; x=1792141794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hjjt+5c5DdZVts//sptIbu9PvjR5EqO62EChRfFRIRI=;
        b=C6YHPOSyTGsAN+QZmJic8d4U2rZYggLIiLge4NbkjydX7/kV2kHvkp32j2W3EBvT0r
         nbVYRtDmbZpDCCsO0cnAIJTGiBWpP5LxxoEGChwoLah/Mvrb8l5qDNB434yI4vguAq3X
         YVAxhvJs0w85EgLNyXLKGwweRDi9qNfNfBb+1Tdbm96VyHG8a1GR8Bf8SMaBUv5r9Tai
         2tautA4Tq7Zzds4+I1hAQonL0sAgDodlJhAcwFBYFHAiMMBv1HDitG+HUBDwtxnhlkR5
         gRR7zd5eoRj8LPWm/6kBls4qsxB0D/BZrDnoj5L2XhApeg3f88BALrnpd/TLuDDOA11F
         wGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791536994; x=1792141794;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjjt+5c5DdZVts//sptIbu9PvjR5EqO62EChRfFRIRI=;
        b=1Vb9aFqAzcwzin/Y18fJbgCXZDDHmjCykr0I++ooefVaOgGF4/KJLKxQcWCmimdZ0e
         v5T9H8AQIH49SP6TGA1+EyWV8md/Hmw9k7cfKTWTAoMrWgQF5ORgLikbPbwmq10MY3sq
         Tclxli4ubDNj0b/HeGOZKijsHCitslBTkx1RstLiU+I9QSuTuU+Nhlmn/6OJIj1rJ9EX
         DCH/h7ZoVWwmFcvwNFDLnwMs7xqq4T0wlkdS+LHnwhUQ4Wh0uzNUPYnuljKaAyBLikJP
         el6M13fHmJGUAoohHVPgyFUK8vomQN4E7B3Bs8oenX+3coJ5HnK81DEMKej9rQTj2t+b
         oT5w==
X-Forwarded-Encrypted: i=1; AKwUvBwzU+9aSw6+z2OINx+ejUNXxGoZ/z1tzGAT61tNRvw22dlNjPmxrfMW1LVklR7XTzLAoKrTAgny3R7wWyk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJx5spQqJkXo3NLwdKUx/aurHVge0V0qEiPGQQicFzsNpt2zhyX
	yZrwlgjg6ydjVjOCt+6X1ExsRjgz8oB6GIYHPcA0SJWcz1HFnwBRN9HhO59X4qZJcIU=
X-Gm-Gg: AYBFou3CASEnSJxYPmmQx4fFSIiFtuTRQAMsqhPS1z85PaMqp3ICQVPyBVVyJBf9Pi1
	xZvg7DXmJzqgGDstFlkWX4pvNOm+9uy7EK/YGFOceELGwVPLesOSxnNVqtphkzB+mpsbHgMTRJ4
	8N9XxEb5RcbbrMLu/vq+/wGcAnO4pEk6RqsOgrY4zrS84lrooQR9sIDEBhJaP4YkbQ+4Sam6Ryg
	9t6DqWADMQNnzCVBPsQ5XzRxnZW1P1uBSLDRnCw+PrqB/doEmP97OL1yKFYJv+KFSvFijtKnfmb
	Fn7iTQ+Fl+TTbJ98ITmK5YdKim8R0hRY/LCUT+vb10lMbFt8757l5dOBGoaZ39bgA6lXe4bghH0
	QlVxtrLyCklFZhT6CBxpVWRzhDiirNvKXCLoJ8EpHCYZ7Xh7WrXn4auC9imMToeZqYX2XRTbtgM
	3K1tP/FaFVR3XHl05WgZCoMErqkwdkHLoWF8HJ15IntwY+lvaEGPk414+em5sOYtw1K8aaZzEw4
	2w=
X-Received: by 2002:a5d:5cc2:0:b0:488:8212:5d73 with SMTP id ffacd0b85a97d-48dbacda836mr2080643f8f.31.1791536993946;
        Fri, 09 Oct 2026 02:09:53 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e2d8fsm2938651f8f.19.2026.10.09.02.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 02:09:53 -0700 (PDT)
Message-ID: <b174823d-2e5e-422d-a958-ee11c5bfc1a9@linaro.org>
Date: Fri, 9 Oct 2026 10:09:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: James Clark <james.clark@linaro.org>
Subject: Re: [PATCH v2 07/14] perf arm-spe: Use generic snapshot search
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, John Garry <john.g.garry@oracle.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org,
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-doc@vger.kernel.org
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
 <20260821-james-cs-unformatted-per-thread-fix-v2-7-00c4fd0701b4@linaro.org>
 <20260827161619.GN8904@e132581.arm.com>
Content-Language: en-US
In-Reply-To: <20260827161619.GN8904@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/08/2026 17:16, Leo Yan wrote:
> On Fri, Aug 21, 2026 at 10:49:05AM +0100, James Clark wrote:
> 
> [...]
> 
>> SPE also had a special fixup case for head pointers greater than the
>> buffer length, which is not needed because the SPE driver always wraps
>> them, and __auxtrace_mmap__read() handles that anyway. It also didn't
>> have the special case for old > head for when the wrap heuristic fails
>> but the pointers showed a wrap had happened.
> 
> Here mentioned the "special fixup case" is:
> 
>    if (head >= buffer_size)
>        return true
> 
> If the hardware pointer is exactly the end of buffer, it is a strong
> indication for wrapping. So it might be worth adding an explicit
> "head == buffer_size" check in the common code.
> 
> That said, if always checking the final 512 bytes, this case is very
> likely to be detected anyway, so I am not concerned about dropping the
> check.
> 

I can't visualise why head == buffer_size indicates wrapping any more 
than head equaling any other index in the buffer. The heuristic seems to 
be impossible to make perfect, so I'm inclined to leave it as is.

Couldn't you also say "head > buffer - 512" indicates a wrap? But that 
could also just be the first time around with no wrap if there is no 
data after that point. Same way that head == buffer_size could also not 
be a wrap on the first iteration. But then you end up saving the whole 
buffer anyway when *old is still 0 or any of it isn't padding, so it 
doesn't make a difference.

Really we should move to the duplicate detection algorithm like IntelPT, 
or update the driver to use a monotonic head if we think it won't break 
anything. It's so much more usable.

>> The other feature lost is that this search only looked from head to the
>> end of the buffer, rather than always at the last 512 bytes. This was
>> flawed because once head is close to the end, it's likely it could
>> contain zero padding from actual SPE data and a wrap would be missed.
> 
>> It's better to err on the side of caution and mark as a wrap, rather
>> than trying to optimize by limiting the search from head onwards.
> 
> Wouldn't this be a trade-off between missing a wrap and reporting a
> false positive wrap?

Yep, and false positives are basically harmless with this algorithm. It 
doesn't do anything do remove duplicate data, so you might as well mark 
it as wrapped as early as possible and save it all anyway.

> 
> Ignoring head makes the search overlap valid trace data when head is
> close to the end of the buffer but has not wrapped yet
> (e.g. mm->len - head < 512). That data can then be mistaken as evidence
> of a wrap.
> 
> For a false positive wrap, [head..mm->len] contains zero data. This
> should be fine, as zero data are treated as PAD packets and discarded
> during decoding.
> 
> I'd suggest adding this info into the commit log, in case later we need
> to understand these weird cases. With that:

The summaries are pretty good, will add to the commit message.

> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

