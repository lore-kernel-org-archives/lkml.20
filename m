Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502638;
	b=QGcWHf+Zr7ndMrHi213uaiH4Wd6VKoGbVm3tTHwZ44BLp6059syV3wM1QXVuN2XwDzZ8
	 km8jlSdSybykD9fmE+M6y+uzsrkXyE900A6odkCO6Mfs2ZU8HaNVD5hx0R/T5VT0MhcVw
	 qa9fC11RdlHArpa2A6UCTY7ixRBCkx18Uj35vKaL2YSW3BA7MXB461mQuPj2b7lJHPyRy
	 J83a23uk2CjrqZkY/NL6GJFmlK6Mg5fad8eXevKba5luKH+01IsiXZGyYKvPDd8ltU42O
	 NAi1i0oy/uY1wvudiQlTnZeyqeDVav6YlJ+wZuaSMxE+lsB9eUbHpNVjQnqqSIw39jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=T2uaYBqUftcRpD2L16JDkdO6wqmonuMoZFfOWWQv7Gg=;
	b=ztTYoz7h7K7p9gimh/ntFMzOfL3qv60NZYveTCN/4DL5MNemj/b/RberZM8bU1+l73hY
	 BFJkcq/BbRBEOC1St3NL4pbp9JcGgHmW8zmoyIc0sVu4rTLG+B6odsPcAf+gf5nOKtwtV
	 +qbh/E+bKVYvFbqufMmhBIv5fcyzaWYh8AhQC6V1rDVl3a/M3P37MQtxECZS5i0g6t+eL
	 3fM9GJ4cGo5139kfxIMlyLOuP2BFwwdXvoOJvp7X2ZdE5mSj07kP/N0IlgN8eCqJRaSnc
	 VrVQ5nRmFkbQ4yJwkv+bmeO6+AwMg7Sv37lBBSUCd90X0bzm7h1QqlaU3JmuPZOPXbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TUnDbbJ6;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5345C606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5345C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TUnDbbJ6
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so8081295e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792502637; x=1793107437; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T2uaYBqUftcRpD2L16JDkdO6wqmonuMoZFfOWWQv7Gg=;
        b=TUnDbbJ6pu9r+QN0gnuvY663hk4hHY1RCA0GjoO0As/x+/jReLTgoosYhEFRmvbuXD
         Z1v81IluqYPJElSH8ZndEpfUjKZCAouMKjQSVHdbkG8Y/CQQ+9nvFs3P4an/XEwcTGvw
         qaJ4J9pJsiRD+lta+FH+4wZTFrpXpW6neGfqi06aJcBw2dHjdnN3GdX/86+t5puH2yQD
         TX9uX8X30tRzlS3ibC0wc86fm9SuGmbHKvHQOYmeMb7y8ctBpA7wjUAmWZgUhdMRjv1T
         +yg6+zhbeOv/Z9dP3EHqBRLwoU49JaqaKm+F5TlgieBy2hhIHOp/fgqvVkVEKgM8gXMY
         Gt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502637; x=1793107437;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T2uaYBqUftcRpD2L16JDkdO6wqmonuMoZFfOWWQv7Gg=;
        b=qZKHajjlgW0nY/kxSZPd3hJm936W/Kdl2kfdAa8LvvI1R8MIVh9P1QJIJzwpxNaosL
         KgpliQSgmQR7WicitC1w/V3z85XeCEewbVC7wKKTvdXdFUmr5R/q3KYqwOzmrCmBhfac
         fG0QND4TPILH2KLkH8wBYgUuenSei/V4O2m93NLsrOwT9cluZyew8VrQSrTCOo9YV4a7
         hDkGGdKvFr2JYF8eZEghh5nmC8iUXaLrjPF4JLOwT0/Y5m7t6NyX6JxhxpeUd1gOj1L+
         ZLXV5yxqQ7uerrmGUCkJhF/rr6Cu3cKLTmulJZKdyfOe7OtAmG0oSxGJ9omFe2G7H4mr
         Fb9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxPd4IjdDJDI1Ffj4ErO06aS7PsL/RnLzxG0BA7gIft+68LU5DZ2obkbcFsQmwl8a063ZN0NQAbRvCxG18=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCzA8L+4tw4aob/RkIuL9TYW1bEK77jCn9Z/2OYbJCuuPYIegh
	ctPt/r2H4jiacr1qJSrvrLzGvgAFY3q2tQ5GfkTLiSnLEj9XF71raps/rSOD1TKawf4=
X-Gm-Gg: AYBFou0sQW0igtNUtHprGwIRaW3AyVC7pMszuuqqu9NhPp/4sNdhv9tRHvxwI/s1kls
	8QPnMyJn/ldQs/JslpqPAbSHT0OCURVUigGOCFNOHAEJ7SN7HCaCygCprfPsaWaIA+fYpca1hEu
	38ynLdWgC9k9GK81I10B1ES5l3hyySgVSSz5+NLnQgV/vB6+WqcMo56VXGIglGes8VGvwYf2/Rp
	8P8wTv/nZ1d5s4j1UN3jo3+APOoOybfRyiZjagRoxmXMduIHuV9hmWzytP14AcdjDQPgPmLpmt6
	WvlfNeMSNiRRhcb28ezpoOa/kqWMwvvIg/3j2pKZ/vw1AfG9FfUTzj/YzrOMd1yf17cGBmwU+Du
	J5WzL6dFanWTNy+9EUl/s9oODpYq6crgQuSJZhqrodS4flqZhYhTCBHfJq+JGV76TeSXbDVdRTS
	8xCYplLXIZghOClVzLL1de62o0HQhdwfQAQ3IRQrmuHT/WLt+KlIYV3LDUxCVWTU0epQskPksiI
	9hwhdMK+urRUpQ=
X-Received: by 2002:a05:600c:638e:b0:4a1:a7f8:c124 with SMTP id 5b1f17b1804b1-4a1f4d7afcdmr43701515e9.7.1792502636695;
        Tue, 20 Oct 2026 06:23:56 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2ce2b8bsm74994275e9.15.2026.10.20.06.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:23:56 -0700 (PDT)
Message-ID: <69dcbd3f-25bd-465e-a173-2729095f2dda@linaro.org>
Date: Tue, 20 Oct 2026 14:23:54 +0100
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
Subject: Re: [PATCH 17/25] perf cs-etm: Allow history collection for samples
 with zero IP
To: Leo Yan <leo.yan@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
 <20260915-arm_cs_support_aux_sample-v1-17-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-17-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:49, Leo Yan wrote:
> Perf clears the IP of a user-only PMU sample when its interrupt skids
> into the kernel. The timestamp and TID remain valid, but the zero-IP
> check prevents --itrace=L from attaching decoded branch history.
> 
> Remove the IP check and keep matching samples to trace by time and
> thread.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 00407a80933e1c0b76260aed5894dece50b9aecd..baa962085dba5226d9729a0ee8039374d5fcb1a0 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -3097,6 +3097,8 @@ static int cs_etm__br_stack_init(struct cs_etm_auxtrace *etm,
>   /*
>    * Add decoded branch history to an existing sample. The sample keeps its own
>    * ip, callchain and event identity; only an absent branch stack is filled in.
> + * A user-only PMU sample can have a zero IP when the interrupt skids into
> + * the kernel; its thread and trace window still identify valid history.
>    */
>   static int cs_etm__process_sample(struct cs_etm_auxtrace *etm,
>   				  struct perf_session *session,
> @@ -3107,7 +3109,7 @@ static int cs_etm__process_sample(struct cs_etm_auxtrace *etm,
>   	int err;
>   
>   	if (!etm->synth_opts.add_last_branch || sample->branch_stack ||
> -	    !sample->ip || !sample->time || sample->time == (u64)-1)
> +	    !sample->time || sample->time == (u64)-1)
>   		return 0;
>   
>   	/* Adding branch history to existing samples supports the host only */
> 

Looks like we can fix this up in Amir's patch that introduced it when I 
post it as part of the JIT stuff. Then this commit can be dropped.

