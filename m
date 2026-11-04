Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786420;
	b=oncb6P0MGls64wrAAdix0NXFrkGsHHwkuTKKonSGnKiwP+CgNu5C2Ywpbe01zCMGrlvI
	 csYpNWcg/FQ8os00jQ0Zo0ZXLD7xFBZsNj0bef9O4Aze3jGuLwPCguXjPtR8OZ1K/1RKd
	 kycJpf8KKWTpaKu7A9dFsE6nBD6rMalkJxJDVt9xF3NmZVIjcHhWPv2DdUyVG8roxrMas
	 UWl4pflhYN3tleF8j+Dd9lPKNWITfYcjQC/VDs0coIhZ/PlXPFhyk4WE2o1mqvTOh63o5
	 LChyts8VuvlkSVfw3qo++t1y5N0Y9qQ2TDvo0mG7D/I/HFuYhIph3B6qnW/2Jp4JCag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ouw4R6dZBkKkbWnVqlyAlihku2AypLtquktGWyU9qgM=;
	b=ksXswhd+Y6VdYa6Nlyggl8ZyRUdshj/Xx6/D/R9CuzyV0VcXMVL44R1atkO/vcR6xyQy
	 Cn/PJlNUwzu8IkF1MKOd4514+mr5gxy/tJGbwBAIp/pnqFasf++SWUQfdTgyMXNt/cwlX
	 WpYLI8FItWeMjJ7XAJfdCtHB7Vsa9g96CIMZmUNnVIyXPEPrmZ4S0QgqvNdwMPPwuxDX8
	 vGillKlnHPS32ouTPhpaBLb21v2yWBRmDQgwIbRLHtDYQ4J1yySK5EvcUlQv/kxkzRkLm
	 cNDogD7xjI+/YKh2BcJ9FUUmlfABnfrOuUxLRR6FP986nEkkrfZ2xZDVXcNqNiKGg9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="QBN/AIF+";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43AE606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E43AE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QBN/AIF+
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df54150dfso298825f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793786418; x=1794391218; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ouw4R6dZBkKkbWnVqlyAlihku2AypLtquktGWyU9qgM=;
        b=QBN/AIF+R3WdyZnxFG35XH0XNbW0L9ZjpVOOclvTOVQNERVzfFYB5tEumKOppRLJ+y
         NDgZjGPnl6RJryMJJwSfJHiK7IQ0BDOqL/ISZfXyG5A8B8bxWM9Ym1zAS5hOgbaSnG+0
         Kh5EekhYIEQ6+r+O59+1h4hfbtLD40VlbUrDfOHmp4jMkzhciKxCGYXgxVsmRDguWAnf
         7QxOm5Z1GSmUPkTMhCsiUyTCSoKntBcvwz+2GWWo2GQc0Z0DKbpbuVFCtfFOoO8CK4Yh
         gu++O+vPw5cqlnDSNvrqNzIcsa8QntOmbGQjQZfqSWzHO9anXkaWGKIi3+VJMKH+Y4h3
         mn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793786418; x=1794391218;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ouw4R6dZBkKkbWnVqlyAlihku2AypLtquktGWyU9qgM=;
        b=C7lkOh7CPqf94pHerRZELtxgMsH4wslZVPFYtY7Mw+vPuQtWR50F9txaDhuOpjKAka
         SYNwgQtSKD/CI+rqf2gM69EBqvtuk6EHhm0dEqjJ4xYVjxkYdWkERfT6kQJG0VZU7ORl
         aNP+pdllV0uGgsW1YkaSg524q6jDoh3rFcQrLSU6+2kO+fwCWCmD89Tzy9fvu9HGe4zN
         yA79kb9vMWxYf2KzjB+OEVOoS6Eu54ehDzTvy0Bcg3UTCarbePmYP2M64+TUNea6wTvi
         jOWXH6iVNq4Xu/McVeMqRziFirp/FguVTd7y/SZlCaqgkE2xj+9kOFyyJa8Bb0EtyYCc
         SdCw==
X-Forwarded-Encrypted: i=1; AKwUvBwKKZNkyueQueA5QrPKR7dGdw5sUnnQ4xtV/3U2hNgIcXgoquTssc5fKYRWq0pjWrZUNxN2xC+edNMBrY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WVbSB+x3Js1jRlz8lMSj4PCVyO6iJ6gMMzONP/mgY1YvjcUZ+
	OSzUyYDDh7cjeQaJo49nyJJ/JMi9XRUBEvbDT6rzP1nS3fPeRgh6yh4BqBJWGaciWVo=
X-Gm-Gg: AYBFou0/uKMvaqLi/G8zLgiATI8+ty6UhcDWipNdI5l4HdQJSItDOblSNu38sHKh2jI
	9aBzBM9K2sj4MfW6MGXYCqYpeNZzvzHHE5LumvBGBT7ea7eKG8LDHTNiiMnVI04VY6IseMw1cdN
	CT35YezNAWkBjZnbrJuOtrIvMI1muJbwvt5PMb428A9qSCjagQwrE/dGolspYLD7VTFs2LqfIx5
	iPAErbMaN94u6pQYQ10nU6vuzwOWTJnBiuXhS2cacuQzSdGyb7PiGcYcMWafTQp/Ah4i8/qIgQI
	Z3n/zKEGWcnZnC/4WETc4HumFWK88YGnDAe1jwt3GtcLzI8uT9wh+5KRZeK+T4Q5qrueBMlUN5W
	lPs8bfQ+al8EOC97PHgGDzH41gr0m35zDdFUswHkck0MV++7Z1BQR0lh+6DA7SIe15pq7txYToQ
	KqwJ/T/M9huRS6t464gHmvwt9oClyHjwuWoj0lX28KnO9kBmRi/QOlQDKPqs+l4pDrubtZWX0OZ
	eJdm2DsAIySNMx1Et2bPnwaBEI50oyjMePL7AlQz4RAh+dTUotWpjS4GL8S45zuQ1pbWNub1J5j
	6Vz1nM40Mw1O9tAhnvgvi6WGp/ySmLJJexXsW8SiXm4MMp9QbnM//A==
X-Received: by 2002:a05:600c:6215:b0:4aa:1527:659 with SMTP id 5b1f17b1804b1-4ac17a366c0mr369114715e9.17.1793786417915;
        Wed, 04 Nov 2026 02:00:17 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43a48adb7sm44505345e9.1.2026.11.04.02.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 02:00:16 -0800 (PST)
Message-ID: <c1e052c6-531b-4c1e-b671-b5a214ae24c4@linaro.org>
Date: Wed, 4 Nov 2026 10:00:15 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf intel-bts: Free the old snapshot reference array
 after growing it
To: lirongqing <lirongqing@baidu.com>
References: <20261104022042.1894-1-lirongqing@baidu.com>
Content-Language: en-US
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261104022042.1894-1-lirongqing@baidu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/11/2026 02:20, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
> 
> The snapshot reference array grows when a mapping index exceeds its
> capacity. Its old entries are copied into a new allocation, but the old
> array is abandoned when snapshot_refs is replaced.
> 
> Release the old array after copying it so expanding past sixteen
> mappings does not leak it.
> 
> Fixes: d0170af7004d ("perf tools: Add Intel BTS support")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
>   tools/perf/arch/x86/util/intel-bts.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/perf/arch/x86/util/intel-bts.c b/tools/perf/arch/x86/util/intel-bts.c
> index d44d568..9403681 100644
> --- a/tools/perf/arch/x86/util/intel-bts.c
> +++ b/tools/perf/arch/x86/util/intel-bts.c
> @@ -299,6 +299,7 @@ static int intel_bts_alloc_snapshot_refs(struct intel_bts_recording *btsr,
>   
>   	memcpy(refs, btsr->snapshot_refs, cnt * sz);
>   
> +	free(btsr->snapshot_refs);
>   	btsr->snapshot_refs = refs;
>   	btsr->snapshot_ref_cnt = new_cnt;
>   

I made the same fix here [1] as well as turning BTS snapshots into the 
generic one. But that doesn't have a fixes tag, so maybe this patch is 
still useful.

Reviewed-by: James Clark <james.clark@linaro.org>

[1]: 
https://lore.kernel.org/all/20261102-james-cs-unformatted-per-thread-fix-v3-10-dbcb0c281b9b@linaro.org/
