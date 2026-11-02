Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616768;
	b=bO/0MxVd8km2psfvZFbAZJo5u7sdxPnGX7Qgp8EqJ9/W3RFUMpUYeOJtmwuJjLCyvnK7
	 jLfTbwj8gad9iANuEEroJZU9N7ij9OEkSfKlRt6zYeYtPXxkUBWMG5mSNrj7FkbKqIcFJ
	 qxia8cGboaUik/zRFyZ1iIcEoIB3JwalRNWUJEszteVUGCDjL6Ck/XUqhyWz4HBWLFH0Y
	 aQr7xBH4XyabzgM/3a1d9Ipkv60fDQ8A6A7zc/5bp+mI0k4uKp1cVXAj0NFxyre8Afw9K
	 dVNRHxAH01KKh09gdADDofMIhCEUlguDpRTVe0pMt+G32QK7zh0BOQiWqnTvAVQUQ5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aCuf2/0TwlruUJtCBmDukdp2i6RsScdYK46g4uR5+0k=;
	b=qw4dTLO6ZgZw8dN22BouCa/3nREAqMKJ52CGuzaavn+RZDERLahxcNXaxGwk28B3PSK0
	 AesGoOX7S/sZCffbBTkGIFbJKbTo9gQ/WH4w1M2nGiOd0HJw72vaoRWsYEwPHzyFT4rAS
	 Il87DIBKpuWY+pah4a18BGlUJZzlsKsQzBxsmTGxS2yR82+CPvH8c1ho2QotdNLZ9q2wB
	 Ccexq6qO+9BONfaN26qaFkuBqogvmIrpWFy6rd03TBYsxZom3XSrFpPmX5s0LBGwb9y4V
	 /YouLzppXa1/eiOM5MRxT4HvcY+3XnbN7e6wR9FI++opPh4M2MAKhVeOnSJIGlJxbgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ahKvGQaL;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB928606A33C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB928606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ahKvGQaL
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so21270425e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793616766; x=1794221566; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCuf2/0TwlruUJtCBmDukdp2i6RsScdYK46g4uR5+0k=;
        b=ahKvGQaLhep8VQSyrCBqupdIr4zq4e+un2GbyZ4qyD2MJmMeM8b0ULI40LG05a1nPp
         a83IHDs9C5WuYLafz70HqiFP5VZYaEmtUCXuyNmhIwumBDCtjvisnlgwYwrY1KW+Ew7F
         GQTkCPM00Y54VRg8/mwK1r/wacU1cf91cpqOqFy3gKfL2oZBWBYfNr9m4KOP1TM9upTD
         gI4PfE8Pv1XAtQRz72KQNxJWIlAtyxszvpwuSBsQVT69Btp4ESpLj0rCsutZO/xrhqRJ
         mt8Vkjq80CaM20po7sHpU1XCPqhIv2EkTItHqOvAYjdg+4UXQJ/yaZN+mTIqEa2d/4g6
         yRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616766; x=1794221566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCuf2/0TwlruUJtCBmDukdp2i6RsScdYK46g4uR5+0k=;
        b=WwOuxM7tdepFFWHRiANRhBS6Lfe7/I73xgTUyIsZ9QiQTYLBwM8PVX8ncMZyr2BTvl
         4a+2XICfXi1nNqHeFxvWn2OWYNt0wHxmUh+zaBt6SzZv04t0MfDTw8cP3MUrXJSzWauN
         vHUzktlQUbBMhxqeaByqUz37iAWWhLovLHW4ruh69caf8JqsnccI8ayd+b6Mwsm7dtLP
         gijqCo8px3QKoM+EY0+Yv1loZPUJ/Q4Cci1PnRegNEHzv+pdBVUDaSvjAf4D/cPAFvh7
         0ZmPfE02+rdo4nqAZEUlYv7ex0NRkEZE5NB3FjFdyAhoSdbCvld++I9RV1qLuZeuIB/w
         wuKw==
X-Forwarded-Encrypted: i=1; AKwUvBzmh2u8Amxb/bn8d/TbDaHNuEQsJXp0m97+TQ+ADujRC0uZIS1kSC1Dk2yzgHPwPjf0sHkTX8Lr6836u6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKa26LZ1KZvQqCnrdCtQocTMDu0DfX0kfvG/YtQt7S2O8BZsqYS
	1FhIc/IwYreZ23AfYvRBV2Rj1NSPMxbvaC/gCtXjdHEXgVg3ZiqxFopGCIfxmlBhqV8=
X-Gm-Gg: AYBFou2Zk6k0+32wiEmbb0rmqNhUa5tkOlmMsECkRVnu93iYpkOnVKMn6J96NOZ0m8D
	6A9uPGr0uDaW7XQ6oejzZmBIoEEvU1ysxcu5WJigdf4htLrF3+xtWSNAcluPFeg57tFiHeo4ork
	8Kjj9V6/wdlOsacswZk6MzkCSI948ZyvlGF969hCe6WZI6xPIBC21VTwzAHJWXfhhbIxgqoHQdT
	WStfZdiHtZrJjiEO3vISeOBVMZ3+pelMWmCGzm/7rvEXpKF83uL87Q0g88XZRKKkkX6xZO9E3EB
	xnZhf7spmRqFR8G+YsX8ddHARyhikmq09l3VaZkVEYY5xa+eSHssiOvcUZAxUoqapG2t7IDbI2h
	yjEbATpNOg+kzMfciUNTFBGS7+Z4TmIRr6Q5YQEuX+/Cz/LkMEk6YAliKv+1MVUOcqdZJrKvmsD
	Rl/pil05lZ/C8DupOkdsNnmzLzquUsejVggSeKe8QGalMrJg9HiHQrMbLkf3J9gOsbXKvhgzV0L
	w4o7YKVY8t7858omlB6c2DEKxaHlqcYVKPwFan23LAol1wC8qbkd5hg+I0iTn5AOXeuKaBD7uOx
	AS/a1otr7TGVpOELHfUCA30R6E2AgDISuHEJby2Anu7bUWvhIWCAwA==
X-Received: by 2002:a05:600c:a103:b0:4ae:63e9:36a9 with SMTP id 5b1f17b1804b1-4ae63e93a86mr89899655e9.14.1793616766051;
        Mon, 02 Nov 2026 02:52:46 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm309082755e9.12.2026.11.02.02.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:52:45 -0800 (PST)
Message-ID: <71e154fe-0810-4292-a955-f0cbab2b7e96@linaro.org>
Date: Mon, 2 Nov 2026 10:52:44 +0000
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
Subject: Re: [PATCH][next] perf cs-etm: Fix spelling mistake "should't" ->
 "shouldn't"
To: Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 John Garry <john.garry@linux.dev>, Will Deacon <will@kernel.org>,
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org
References: <20261028183137.537812-1-colin.i.king@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261028183137.537812-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/10/2026 18:31, Colin Ian King wrote:
> There is a spelling mistake in a pr_err error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   tools/perf/util/cs-etm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index bdcf94813129..65bce2450549 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -434,7 +434,7 @@ static int cs_etm__map_unformatted_trace_ids(struct cs_etm_auxtrace *etm)
>   			continue;
>   
>   		if (!intlist__empty(etmq->traceid_list)) {
> -			pr_err("CS_ETM: Unformatted queue should't have trace ID\n");
> +			pr_err("CS_ETM: Unformatted queue shouldn't have trace ID\n");
>   			return -EINVAL;
>   		}
>   

Reviewed-by: James Clark <james.clark@linaro.org>

