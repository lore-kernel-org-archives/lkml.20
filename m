Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2756D3DEFFC
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413998; cv=none; b=dNTj84jKg9j6mQZmxcjEchJGoMtHwgchH5t8GQEAyAunGNNfvwj3Or/MR+Ak8uVEOtAVcOwMP1Ht+GJ5q/ZyOLC+I9QRbW9NZE8OoQ1vbv3VW+h4GLuK2wnjltUhwXlKfm5dhVQk8bpRzOlX3gNxDxc2MQFtGv0QtgOfOETN9Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413998; c=relaxed/simple;
	bh=frC5S9v5QSZonWeKI4grV884xjjdJOy9f/1uWnDHZEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iBkyMj26acNIQIMzWD1BC7YNSW9/kTde5pz95qt+kLR1BxJVO90mdzOZyIA9CEi6rQv/90PDl1fgP7O+LhouNc7n+HP82OTwkkrKfxDZ3qjg29HmsxNqa20SaWzdWc3RMbdvXtk07NwTPjXqI+vLMycdQsRAdfNEEYQFxrIuKUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ULCMXX5X; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ULCMXX5X"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c40e30c26a4so421500366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792413995; x=1793018795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/g8SN2WKb9PmJxIeGRbGVw4NTAI8lYKDRiQUVJJ/IV0=;
        b=ULCMXX5XR/DnZS6ae++KGh2U0xzFEGoIuWQhPt2dJ7l/xdrH9V+95ULWI2rV7iVrNU
         /cLWeOqDWSRJyrTGMt/JrMP+CdZPlQ7njSZvUqR20VgDDouCdwmg/kbZCYMDl95cToZZ
         7ohRrvOmCmadR5/oMV3hl9Uh2paQ8SmejUHcCGuAwnX6U6QHWNrUogS8zuXlafW9aku7
         N//ClaCLurH9IZbr2B88fz7YqPAZxiaXNqrGhEedc51VsFbPMSTky1X5ZhT0LfUB8baj
         B7ZYqEHnTdoQPHvxm+i2nnPP5TpdxJjI6OGRwsPtNxysweOKmzpfh1YLWv3bhSm1Q1WB
         cZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413995; x=1793018795;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/g8SN2WKb9PmJxIeGRbGVw4NTAI8lYKDRiQUVJJ/IV0=;
        b=WjkAtP+//soQsectdmF1j0UnWo1U2EcfeisQ68WxRiOytSr9SdTgiyPSvYRpApyVZo
         N3NG8bc2g9nDCKcIGuRB6+yaD8nj6+WzXfDsaR+WfddziWkl9I6Ejok1S2NY7OM+dnjr
         YuLP0aMYqeVak13vRuqH7PpN9vu3eqvw/xQK6gT2eGCeCBKJgh7yu/4bIJvSHwBqXwzb
         pSIMZQeeGQMX+XfmygORqlm+qAh6kkP6sMZnI8zzg7rx/xRULy3lpQPeyw1G+nPtwm/B
         UcD3tTyqG8fpnVsfGgueDl+PXnQRS8UQ+RKFpnzib9wp2k8nj86Vmx2v5Hkni+oiybz/
         MZJg==
X-Forwarded-Encrypted: i=1; AKwUvBwI3ojOiGQdiipXpLkkPLTMMJjlqQng+goI3zrYsPKeyoU1acfGbbhk66Gg5EYGpAuI84rtTcrFsLS69nA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI42f/MYjORyDiR24qZJhQPOyodQnGBeEU1hCo5cPHBqJUwuILu
	KdY5+6im+arA+4QWrklbMNTCZ/f3aochh9jc8OQmhbHK9ZOwN9Vmq/nNXl1gqkphU7c=
X-Gm-Gg: AYBFou1iMZdKl0LUYgdUcVvqwHvwjtgd3LdmWcmnPq8A/Npe+2weU0Fu2yDTJsEZXI9
	gAPyUQc5bM7PO98R0oKUVfSMVKxVES80KaJSY7j9HQPqXtAlOEpqVqRZk2HwkI3DQsq93riJe7Y
	xfAzEUI+JmBke25XCy+BwTRUcZY5e1qIAfpV0RwRWnCEavMcrtoZaJR3Q5jWKK6v06SLvuIhGgX
	VJL2Q+Q3Tw69nJeHcznw7Q8WmwAp529dxIfNiwabG5mue/vmlYTU09MnynCb/pJd88fXSnH1SZH
	Mym6CRsIoUtBRHziCIIylhJPeh370HMT9B9TRVqnXtIrVXSI0XkxqbO/0sZ9KksoWl1R7GMJd0y
	Ik+03wexhFRN8/GRhvoiW3jkrEI5oUsYNbbIxviU7IGY5KGf9YjVaM5MaDKsim767El/DgCKXGm
	+9p9mpfadAO7VuXgNZou5LKl24dP31PJTu5C8BBaebrgsSwHIs/tJoC5l0ihzvrNroGnq4ukvRd
	Dw=
X-Received: by 2002:a17:907:930c:b0:c2d:c060:160 with SMTP id a640c23a62f3a-c40223d9d7dmr819450866b.25.1792413995187;
        Mon, 19 Oct 2026 05:46:35 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eae235sm373825266b.67.2026.10.19.05.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:46:34 -0700 (PDT)
Message-ID: <95c31a70-81d9-4e77-9e77-0397c5252fa1@linaro.org>
Date: Mon, 19 Oct 2026 13:46:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/25] coresight: perf: Look up the trace path in
 etm_event_pause()
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
 <20260915-arm_cs_support_aux_sample-v1-14-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-14-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:49, Leo Yan wrote:
> Have etm_event_pause() retrieve the active path from the event context
> instead of passing the path from etm_event_stop(). Move the stop path
> lookup after the pause dispatch so each operation resolves its own path.
> 
> This prepares etm_event_stop() to coordinate hardware access before
> looking up the active context.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index f66c99b26e1862ab04105704276c901b21728207..8f803914e9abfb18e080ff68371ad8b32042f180 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -694,10 +694,10 @@ static void etm_event_update_buffer(struct perf_event *event,
>   	perf_aux_output_end(handle, 0);
>   }
>   
> -static void etm_event_pause(struct coresight_path *path,
> -			    struct perf_event *event,
> +static void etm_event_pause(struct perf_event *event,
>   			    struct etm_ctxt *ctxt)
>   {
> +	struct coresight_path *path = etm_event_get_ctxt_path(ctxt);
>   	struct perf_output_handle *handle = &ctxt->handle;
>   	struct coresight_device *source, *sink;
>   	struct etm_event_data *event_data;
> @@ -735,7 +735,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	struct coresight_device *source, *sink;
>   	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
>   	struct perf_output_handle *handle = &ctxt->handle;
> -	struct coresight_path *path = etm_event_get_ctxt_path(ctxt);
> +	struct coresight_path *path;
>   	struct hw_perf_event *hwc = &event->hw;
>   	struct etm_event_data *event_data;
>   
> @@ -744,7 +744,9 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   		return;
>   
>   	if (mode & PERF_EF_PAUSE)
> -		return etm_event_pause(path, event, ctxt);
> +		return etm_event_pause(event, ctxt);
> +
> +	path = etm_event_get_ctxt_path(ctxt);
>   
>   	/*
>   	 * With no path enabled, there is no hardware to stop or trace data
> 

Reviewed-by: James Clark <james.clark@linaro.org>


