Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1CA4A3D55
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402072; cv=none; b=enwWUw3CRPAFVmaGKPChVbst+lMRAsvsbNXJf2WUM1+d2LPJhEJ9oFT33UQnISFzpnmfxtoLSVqhLM802gRRLoULDMSk9htvz5Eav/m6nkA9fxPTKvLHOkxCljfMs+XmnYQNGN8Ia8/P3R/5CRBUQETv8yOBJXJbkBU1Fm7wKnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402072; c=relaxed/simple;
	bh=luibakbmz1LG8fvOlXXumwXQ0o1zXo+G2jWoH1UwJqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KFIc4BC4izWSDDrcW8eKEvT7wIPD5UIvSXVHAx99WE4PeWtSM4oJnwMBw6lYgAakBwyfe1SOAtUUe0sSsrYQK87Pahr77Dk4NaphRWnk9O/NKzRFs8aDkqxFtqPQmlKD5/X/NAmhhXgmIEIsLi6bqXO203h9RgkQvjAS+EzFrKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j1cwu2jr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j1cwu2jr"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1d484b4a9so25347645e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792402069; x=1793006869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxfJ3O0iUQzgj7wjnC72GNZjbJ8Awx2pxmwrd9Dvb1I=;
        b=j1cwu2jr+Rzaaas8BvooMezrxIws9tE52OUAKn79wxcrAR8XV/qOhMylgwejI9oibs
         3c12oA1rA4GhbhNE4L7xMC6vfZOUOArZDWldig4Lpb+v/2BkgCQARe8zv3GVRyiOIExY
         Uno2qAs/yzfuB/Sdw67E9YlvXJ8j+mFD1DBv8QQ8XKGFhe7MqkMh6iWwN2KqaaDY8Np0
         q078/NqQKKXZr1OGLEqThehphibX1jkzjiZncLi//z/EXxkb3d/+4peGwTco02nIq4Di
         0aSzfZhlw5JSzDTb9dTniLCQYk3iWM/AebhxlxBYvAtHGkifroQGhIqt3YaKRTtHMoiJ
         P6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402069; x=1793006869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxfJ3O0iUQzgj7wjnC72GNZjbJ8Awx2pxmwrd9Dvb1I=;
        b=rFMBHh2obHvoOQcchY1GH6J/2QuRxZQh9IzFgGMRmM9DAPvfM+FVhYTPCSJWcJpUYp
         zEouagi5xUTEeYcJJAUNWMIUgEhl7btSivRma3k1076vPYZqpLHHr0NtjGDhFROxdU/u
         Uv3AQejFWFa/NKus+24OSyyb8SZN30i3fQ3oXeT+vvOm70GliJmyBnF14cUstJ0bFJFf
         Gz39XdHIwbj9BJXM5Labc483MTr8EKOk4xN/hL1LvfSAGNPkiIDG0YMf+KpnSyZau5Pk
         kyktqt/N3F0KWwpWehPzQx6n8xfKQCk97aknxcHBgqVUxPOwCWLAjHqzDLHnX7d0T4ss
         X8Ow==
X-Forwarded-Encrypted: i=1; AKwUvBxYxsglJOxCPFRbDP4yX+gaFcWiXR3O3kiScLBrelJnUT7Ehh+ookkKWGWWvHU7QGET35s4A876ulbpY0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMZchTH1AvijJAiOI6z5twaLmMDyDaatQTMdIubxDRigJ52fbh
	Ha/8zUOHT173ijkBmlHH74LY8VEMFnmCl9dKj4clr8IV3JggFf7yn+uvNrkteU+rH48=
X-Gm-Gg: AYBFou0xAgCnhNUcmWWKD7qulCNRecXdIIRpgOnR/WfqeqtmbxzzdWRWCUrlxsrEsXl
	ArQ8R6p6p1R7hYBsHjsXiIL8p45Fl6g9ppZ/maQfidgaqUJxfyJfjEEVZ4s0gYhxmmL4TFtw/rz
	ff8F3Ze981vqHfCZS+81x6t8W5slO2iwICu3c3k343twWDovkxZUXluos1eF4V9ggoYt3bZvwMI
	336N3MeLAfMRdC9IQi1s7vVneyRFPzniUTaSIDuQtbJW3FoOsjE9u5/OjeCghlqvBpu7UYPdOSI
	6U9/UAIxCeItIBrZyCRQSIsK7V/q9Kf+bYxNMian0EUHEnPwCL/Eg7XMLUUPPNcxD+TLMNND2Bm
	weCggikVK3R2gWuiJTtpCQ0mKSxDj7M4qTOCOBdK1Kenbikl2UvFJ0y/aPr0aG9srn4xMcqciGb
	edIQ9nBa+86rqee0K9+23ElWJ05q7nfUJnBdKMiUv4u0UJbOS8I7YZRCBvwLPapdkhq+wJ2Ym+f
	mc=
X-Received: by 2002:a05:600c:4455:b0:4a1:e225:b122 with SMTP id 5b1f17b1804b1-4a1e225b8d7mr85661165e9.14.1792402069375;
        Mon, 19 Oct 2026 02:27:49 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca26dc8sm188133145e9.3.2026.10.19.02.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:27:48 -0700 (PDT)
Message-ID: <5ce85fe5-f1ab-40ff-af26-7c315a0d47a3@linaro.org>
Date: Mon, 19 Oct 2026 10:27:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/25] coresight: perf: Validate context before resuming
 trace
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
 <20260915-arm_cs_support_aux_sample-v1-8-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-8-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> An AUX pause ends the current AUX output before trying to begin a new
> one. That new beginning can fail, leaving the CoreSight path published
> after the perf handle has become inactive. AUX resume may also overlap
> a normal stop which clears the per-CPU context.
> 
> Pass the per-CPU ETM context to etm_event_resume() and centralize both
> lifetime checks there. Use perf_get_aux() to confirm that the AUX output
> handle is active and path to confirm that the context is still live.
> Resume the source only when both checks succeed.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index c7454da5c881c4a8eea5cc77902c9113c297096e..e3c9d3cf84c502f357a430bc3bfa854a776618f1 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -517,11 +517,17 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   	goto out;
>   }
>   
> -static int etm_event_resume(struct coresight_path *path)
> +static int etm_event_resume(struct etm_ctxt *ctxt)
>   {
> +	struct perf_output_handle *handle = &ctxt->handle;
>   	struct coresight_device *source;
> +	struct coresight_path *path;
>   	int ret;
>   
> +	if (!perf_get_aux(handle))
> +		return 0;
> +
> +	path = etm_event_get_ctxt_path(ctxt);
>   	if (!path)
>   		return 0;
>   
> @@ -547,8 +553,7 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	u64 hw_id;
>   
>   	if (flags & PERF_EF_RESUME) {
> -		path = etm_event_get_ctxt_path(ctxt);
> -		if (etm_event_resume(path) < 0)
> +		if (etm_event_resume(ctxt) < 0)
>   			goto fail;
>   		return;
>   	}
> 

Reviewed-by: James Clark <james.clark@linaro.org>
