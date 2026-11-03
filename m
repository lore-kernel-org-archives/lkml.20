Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735997;
	b=UcZG7/dy4Un0grEKe7gXwDluR9ZJXxDS4S/AvhCYgHdJiyqrVQJj5G4B7yUwQROunUSx
	 DvDFWsfIGZ/HEf1Vo064Uhw1PCcS7ZETkHMCTjUrQVvkJC4Td19PfY7APpdDp5k3z5aDN
	 xsJzY1qCfLiVUXnJdaBcoP8Q9Dg+o07pF0WD2mL3fQLlG/pFuA3stxZkZrbSr96PdjWL5
	 F7txFwv+72yXySL7KewOt4ca3Wlz59k0nNOcUhCOOYYw6Ya0G82Z+nvBnUe7KQktC01HO
	 Y/b+4bCA9OBmj7XH3zIIGyZZejo7hJhWYSnVihVcwdJJKO5S1TqCPMKmEakXc3McD2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=R+3LXC/kAAN0pkfEywpZQiY0T08sQdAAVwXMi0BkDg0=;
	b=vNLUJhYwwLyHvXGVak8NZdTgjEsZb9rWwREjIdeE0lRqM170UKQ/CQ6/0Uz6N2XvQgzc
	 p8s0bv05rtOqBe6aBPgSLyw/w7hn76j1VJTkZNJkdjl6Hj/2vw+L3klrtGvNuqq2AK0uQ
	 geQfps98YqDbljn7wIDzgOpZdU+zuEEXwu5ApHUInQJojfMIGeZoYfBc5QIucNwgNq/aO
	 a8Eow42QiUzCVVGQn0NiI/c+VQDXg4UzdcBtw4e+V8Y6JXw1/Uiii344alHCiKR9kv01D
	 cRWXzmZkKTGITd44q0VoqJ8aUztedw06a2vWDkkzbiwLKkcorLDpDm9ciFoIrhTT5MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Jx5kpYvN;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AC1606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66AC1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Jx5kpYvN
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-48e9476e26aso15143fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793735995; x=1794340795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+3LXC/kAAN0pkfEywpZQiY0T08sQdAAVwXMi0BkDg0=;
        b=Jx5kpYvNQcMkzpsz080KE306rMjkAMpxZ7+h2eMjsqtiAW/E3i7azcvs8Hlm8W9ya+
         Fppc/e+1jKb89uhDEkdegLVOqUmzbvZi/8g0ZMswzjC60Vne9T9Bh1FfoFftZ5J3FLol
         vzFdFx55C1YadoMwcGZz28sSXBxty4irnTQszyRqvDSHiLMTCi+yWPdPwLmlpNJHTraU
         2H2AwRtMlwoSNYE8XEpM6+AWiPgjcgZ+ymfjskMymIQELzCowJl2Y0ppnKH92UXWrNx4
         pOEbzdxHqI5IgQR22L1jCtAOCKVpZGN8XfJ3JEDT5mLwytyHECWQCROqtl4aPe8r/H03
         nqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735995; x=1794340795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+3LXC/kAAN0pkfEywpZQiY0T08sQdAAVwXMi0BkDg0=;
        b=usLndaEC6z19yH/qxvrZCBDqtAvEEqKMsDayGYkUitBcr47ptpZZLMfPdr+hh2Jl2c
         8J3iJhur+DhbNa7YDZFLIzRpOOgNnUEe9dcL8U+nvJT7gxAhUc0ATWsk3B7SWmaxyIId
         +jfCR2hqas+wMTYbIrTXCqumHYA2w9pbFkjr/dPyt/TgpRO/RkPTv1K3x9SGerk7ey2J
         iqrCsKYZj+ftSbZCQA2z5GXjYEDPwaOJ5voT3rjIzzUJgef49GT9h8HEfK59P/IribSQ
         qskGPqFg7qJvQ67/yM91MSJfePzwNjvq7zMbJ2DiUrzCnsckQF5EJtFXaQZ/rXzRzbko
         pzgQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/Lg7hI3Ip58Yc8i4s0Bg2sywenqnwc2Gr2siKX/F08EImSac5faLKd90ZlOUaZ1x0kijL8mHwCnI2Ars=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yq5C6987zyxF7lN2o5OJ6kaFGeNB+AAvwXG38rlm4Ezc1UJ4Z
	9KqLYfjGylaLyw3/bw46qpdkr2tyjXl7x0X/ifHY/vyStUDOCdaAC3hLy8KXUsjSSvY=
X-Gm-Gg: AYBFou0EjwAomCQSov6CbL4GRaFCp2CwHXHWtZSaUYgWnABojy9Xu2uD8HQ7Ep6Pp3n
	cGjTrisMMltst+MpeikkAx8JHoobkK2nqD0KWBTBf5ExMuB8H2hmokrxJV3I13A3a92kerHRG/f
	JQz6weZZG3Anb3jdIxrggG4BIL3R80Y+Qz98btw2wA5RCgwHDTu83MhCvHbxn1+8m7csiqHPYgM
	MUZsQzKzJ5lsFTHFgHEYJgmxVofyh4rdk2IyeAlyx6cBVDP2sNwvgok0GTWkt4AUqunQXPDCfKt
	5q2vRXC/JgxY1C2n/UDR0uu4dAzjYJid7f9DaYfjhKCVb8eUnqkw1yuViS6j9LAzAFrEu5x21BB
	PvZFlL6uVzyRdBN6XMevQ2PM3r3F2K+mTf5z6D8U2+5Xt+v7uqk1Ov1qCylxCaO4CuSPvwWCz9z
	BU1wCLjJmicpNyR/4m7ebp1bxIrTohDoI04va8AGc99i9bK3gZidvkxhJ0VYcdad2eCZff65K1h
	hHGzQ8HFCmJxHsWWE4j4yJV3ER6kNNumcQJX6LTZC4win6YotxP48vM3cE1Y2VXtYIC48CcoExV
	AT6pZHecnqj15u3VFaiSysru4c9QG+zSFXzovCQkk0G4jh3tfClPs/A5DTYUXngvhAcWfHJoPSo
	Jt5wWcQJi
X-Received: by 2002:a05:6870:d208:b0:475:a112:126e with SMTP id 586e51a60fabf-4a90767d20emr9273826fac.27.1793735995301;
        Tue, 03 Nov 2026 11:59:55 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a95d970b9bsm5262679fac.8.2026.11.03.11.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 11:59:53 -0800 (PST)
Message-ID: <09701274-ad31-456a-9f62-9d0a3889957a@kernel.dk>
Date: Tue, 3 Nov 2026 12:59:50 -0700
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
Subject: Re: [PATCH] nvme: reject completions for requests that are not in
 flight
To: Mauricio Faria de Oliveira <mfo@igalia.com>,
 Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chao Shi <coshi036@gmail.com>, kernel-dev@igalia.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261103-nvme-double-cmpl-uaf-blk-mq-v1-1-b10fea474423@igalia.com>
 <auo5a1kRTSWsAYtF@kbusch-mbp> <352cfcec6865cbf636a22442511f16b1@igalia.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <352cfcec6865cbf636a22442511f16b1@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 12:54 PM, Mauricio Faria de Oliveira wrote:
> On 2026-11-03 16:43, Keith Busch wrote:
>> On Tue, Nov 03, 2026 at 04:18:25PM -0300, Mauricio Faria de Oliveira wrote:
>>> diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
>>> index 2d8f681079e85601a92624d196e77f1ba3ace34a..3ba0666da7be6a3de2e5f0fd50155af115b4e1f6 100644
>>> --- a/drivers/nvme/host/nvme.h
>>> +++ b/drivers/nvme/host/nvme.h
>>> @@ -708,6 +708,11 @@ static inline struct request *nvme_find_rq(struct blk_mq_tags *tags,
>>>  			tag, genctr, nvme_genctr_mask(nvme_req(rq)->genctr));
>>>  		return NULL;
>>>  	}
>>> +	if (unlikely(blk_mq_rq_state(rq) != MQ_RQ_IN_FLIGHT)) {
>>> +		dev_err(nvme_req(rq)->ctrl->device,
>>> +			"completion for request %#x not in flight\n", tag);
>>> +		return NULL;
>>> +	}
>>>  	return rq;
>>>  }
>>
>> Is there something special about the NVMe protocol that makes this
>> problem unique to it? If not, why doesn't this check go into the generic
>> block layer instead?
> 
> Thanks for taking a look.
> 
> I noticed you asked the latter question in the previous
> submission/review (Link: trailers), and addressed it in the commit
> message; pasting it here for reference:
> 
> In Chao Shi's patch, there's been feedback/question of whether this
> should
> be done in blk-mq, as this is not specific to nvme. I'd say no, at
> first:
> - Some blk-mq calls for completion have no return value (e.g.,
> completion
>   on other CPUs), which suggests maybe an API change and updates to many
>   callers, all for an edge case.
> - An alternative available currently might be blk_mq_ops.complete(), but
>   that is handled in the driver anyway, with risk of hitting an error in
>   blk-mq (like this) as the code changes, and seems semantically wrong,
>   i.e., completing a request that should not have been completed.
> - Keeping in mind a small fix for stable, for now, should this be
> merged.
> - But happy to take suggestions if blk-mq is indeed the way to go.
> 
> For the former question, I'd imagine other block drivers might be
> subject to a similar issue, under incorrect completions, and can take a
> look at this later. I'd appreciate feedback on the points above before
> trying to address it generically in the block layer, if at all possible.

This is either a protocol problem, in which case the driver should
handle it. Or it's not a problem at all in the first place, and
this is some kind of misguided defensive programming. In which case
the patch should go away.

If this is possible because of a poor API in the kernel, then we
fix the poor API. We don't add silly work-arounds.

-- 
Jens Axboe

