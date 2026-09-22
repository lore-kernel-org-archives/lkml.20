Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB1F53D0C0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078295; cv=none; b=IGU7BY+I8rlqS288CGF5eEt2bDe4wq1+IHLpqbxDy5+4deDTlutmP8G4xjbql+sKMlx/N5zR8W1VTchaAETCgr2OHfECpbt9B2WxczruAGDa8gBnGr3yFvnfPOWwCSFXjilczl5Wyrk5u7HLWPhG2FfPn0r6qilzsWzQhjlCgdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078295; c=relaxed/simple;
	bh=RAkfzGCXN6pWO0EfBm6z3Wn5nFucYngHlXoDrgBix/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y8Vf+ftGGDLGFV1MCHrFrzXA+Q3x7+nFY+kBUZVz/BaZjzANpoTbyL58FN2THWcxDFhEk+UT4j2oOHgjvrzafbKWSnPFldPQYLdmpFtr1SprlZdatCVplQh4/vDxwuVjh/3r+qI0VyMUpVvGRnV6ofujktgQwLXuQUFy6J8AV5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltPWyzLc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltPWyzLc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so22283445e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790078291; x=1790683091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOtgqwncF6XihHwgRKkqX9nGF5AEwjzyzvACEifWDFw=;
        b=ltPWyzLcKM5IYwsV2Pu4KUQxBCUNCbcPHZ8xzUnikvQdW9gLP7YpXQ1QUbXsihjcap
         HqlDT0r8t/wTx557An42D5ESKntxQLdJ1IhKxYL8EXYbJrSfhFPqT5Dh8aDHZrlc54mL
         hoNxneUxcpPZXSKDG0gH8tx1SKcShTJeSf9AMV86tV1I9PCdsjQCb590If3iVhE27l8X
         MBekM+/w895fjstqD+E/MAD1jUF08h10briVWXxPtz30gLOdjg8WM2tgavIeHiUj7guF
         rYVwbL7J8VRdM/Bo6RpLDUjnMNKC3c9zMI05pybKopy9mlTXZK34qViRUHQxvUgltYZw
         O5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078291; x=1790683091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WOtgqwncF6XihHwgRKkqX9nGF5AEwjzyzvACEifWDFw=;
        b=0i3QS9WK/an+ZW81/bReUplJT07qlDYrn1Le8zVtVG6rSNkc9kpmmOTGYiCmYVMToE
         vWRe9Bpx9PXeghPpcAhdpvnDeaYKyVZbnvLXfkY3sWx9XuQDQdq+CbcGrgsX5ntMTZ+s
         UW7/TUQkmq2YAn4TuU3MlYsqmjSKMlK45Y5Zq0hVQCAZA0DW/zct3wNBVL2c5cOCHuVj
         zvRgk6szvDU6mFGz963NyQA729NL+AS/61SIz/risbHReRDPKX6Omrfgzxxw5EfhJrGA
         iQR/kdIlNKqZ8QM2z51+xbs5o6sM9qQjTAa3VWf+kjJLG4q3ZN35fKqjwBUBB1d9sJov
         3/pg==
X-Forwarded-Encrypted: i=1; AKwUvBwFKofdhqfoiKYMu8qvNxZXYqDIlxmo6EZ64riQGE6J9IO4CwrjDGrN9AVSH/ahscac8SlHv21X3SAmZV4=@vger.kernel.org
X-Gm-Message-State: AFuF++k0tz4pzkNADZFeg7jTBRLiyawPzJH/OpSfBkxT8ETi9ukC7Vz5
	6z9ZKCsRPnRQ3DvKIdsKGTDoRdmNGEH9gvggJv9m4i9epQ+TLOzUo0lw7M2ZCA==
X-Gm-Gg: AYBFou2bDYjgsmHohRRq/KWrOFwRkdgsuv4l/fcJqalrmOOxXjizsrYsDKRP2SDXH9I
	q7ZzNDPO+sHvuyuoCrUiYsBQ+scywQaheX/Zqv1uW3af5+vJSVDBqmwRFaIu47iU5cOZci+VixF
	N4DxltorZPU271YJAJvVc7Lu8OTCBlNklilkRF2v3H+ilmmDiIMrqj7rh6YA2nC8rwMnDqonOb4
	MDwuEQ0c3VCt9PG7T9aH872VxhQPbOaZaJN5uo5kgYy5Xuvt5DI6UXePQSQkaoudszrElSujimn
	LYDCScRnEH3Qh1hE3tj+DgTaKcp+wXpb/7cl95hB1A9it5rWWZBbs8RJbxGVneHE3BRHKE1yWwi
	GyTz2Lz1uXjDr3FdYZOTQc8IS/l6cPH279YjUY9cS2ulshP7HPcHAs+Df5uo1qYGBwLL/C7U4Gs
	JML5VWurFC8yFxCDbAtkiCFTQv69yA5RAkRmcHKC/vSBkMWczKtmfHxoJGfGDaUGlIIYHR/zSHn
	Y1BW0dQIE9AcDpAMnLAnDnA7o5x4jDQt/9bOEm49PpaGlF93SajyLG7cNOkycj7GFhS1fjp0GrZ
	SSXpt5AtIJmW2w3r4Aocn6XF1frkEN6PvURXMr+8njIa+x9y
X-Received: by 2002:a05:600c:8b8b:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-49fc584fd80mr175912595e9.27.1790078291186;
        Tue, 22 Sep 2026 04:58:11 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdad3669fsm52023855e9.8.2026.09.22.04.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:58:10 -0700 (PDT)
Message-ID: <d6d9cb28-50f1-474c-ba11-d634fcaad394@gmail.com>
Date: Tue, 22 Sep 2026 12:58:07 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: initialize task context before running the BPF
 loop
To: Yao Kai <yaokai34@huawei.com>, axboe@kernel.dk
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 liuyongqiang13@huawei.com
References: <20260922065443.359417-1-yaokai34@huawei.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20260922065443.359417-1-yaokai34@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/22/26 07:54, Yao Kai wrote:
...> ---
>   io_uring/loop.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/io_uring/loop.c b/io_uring/loop.c
> index bbbb6ef14e6a..c923cae6dfc7 100644
> --- a/io_uring/loop.c
> +++ b/io_uring/loop.c
> @@ -2,6 +2,7 @@
>   #include "io_uring.h"
>   #include "wait.h"
>   #include "loop.h"
> +#include "tctx.h"
>   
>   static inline int io_loop_nr_cqes(const struct io_ring_ctx *ctx,
>   				  const struct iou_loop_params *lp)
> @@ -84,6 +85,10 @@ int io_run_loop(struct io_ring_ctx *ctx)
>   	if (!io_allowed_run_tw(ctx))
>   		return -EEXIST;
>   
> +	ret = io_uring_add_tctx_node(ctx);
> +	if (unlikely(ret))
> +		return ret;
> +

Looks good in general, but can you move it a couple of lines
up before io_allowed_run_tw()? Thanks

>   	mutex_lock(&ctx->uring_lock);
>   	ret = __io_run_loop(ctx);
>   	mutex_unlock(&ctx->uring_lock);

-- 
Pavel Begunkov

