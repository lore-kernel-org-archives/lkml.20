Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180070;
	b=MsBuaVrjxX7zp1Tcahxd12A3otAfd8iscOksfaESZii1TFaLPpAwbedDeToumErHrJTj
	 iAXcWf5uA3q2FRNO/VbHp7DtdTObjcjh2HPQkl98h+ffauPo7Wqzt/vJwThzX5DKQpUbe
	 VPUVhcfudpvnyIk88rN+Qtg6E4cU5V+yrIbRLPSaBv9OZmWTTzW8pE9aDbjJjfHcyJ3S1
	 nwNhEVhGBOu0dk38xd2sRgmNeLxuuIgnDNgRLyjj/BENdR8inBZ3LSI06ukRZ47TV/bil
	 m4EwXUs8TB4pSpVuo+0bvrHAbIykpX+QCrpQtMxdDktus53DNxpMsoYUILirQ8fq0lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=npanRg0QZLRyOg4NvL8u4eE0WVQ+s/uGa11R06EyJJw=;
	b=ool4JCYBImugDyhnS1C4o7y5dHIne9W189jfuSvWRuDFAeX+0N84xAkPwFBg48mbtlnp
	 GV1vg3At48wZ8ESFyJp10BC+HnvgXnqS48DFsNbrXUbnsYhJJr+HKEYfSfi0+VSvf5iJP
	 XqJsNSrGILO/JaD9C+RETeu/JSP6qZh4oyPHjqyR3RlrBzZGN2F5K/sjgu4UuGnn9pjc7
	 oWdhaMKIh1MQ6P6uZjDsOW3i270SWH7O93JisS1o+fMb9SB/iLMGW/u7DYeCAJoutse3I
	 XafBolo0TMYjufI72GlVUFPlVp5x5tQjT4/KVldZM47tkGtICpzfLAh5v1SvtGdKKkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eWC3HaLC;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77952606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77952606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eWC3HaLC
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so473595f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793180069; x=1793784869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=npanRg0QZLRyOg4NvL8u4eE0WVQ+s/uGa11R06EyJJw=;
        b=eWC3HaLCAgyUvdATmG9+qWEOV/AXT9tAWV8J2eIpXYG3GID6i/nmQ6/cw8IcIDfDik
         7aNG83/Zm+FokfAbKjLzNSc1FXI8ueGIuCfQ9NXkBlMcIFRmn9brL75o56O64Y4KH6m+
         1+WTtZMAp5dFhIDNiu/ZHmOL6YDDPC/o2y1jFoXGkfbhZYUrL9I13EGpYsjg2GnHIdYI
         V/HYIszWagB/jmpYijacA3Bz5zcoMlWVuLZ8rxahee23weSJeHm4Jn3ItsYWQlMFBu72
         Ym1ZzfssseeDMHeHSMLGKk0u+P14I2xoe9/8EzNTyHS0o9a4pVwjakIRuWSkzxO54Mid
         iUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180069; x=1793784869;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npanRg0QZLRyOg4NvL8u4eE0WVQ+s/uGa11R06EyJJw=;
        b=HvzhRUGYWwVPE46FvThrSEOjO398iOT8/bYnmWyFo/RqVwgjhadZ90zALbBXC3GOqu
         yU6DAztuUcWxx0gaoH6XFSn0PBJGfGMoTPYOc3ttyYIPvt9HcAH6pJqo1mNZWH/45DM/
         0Qe2iPQkmUH/0gEt/v4h+aksTySzf2DtBjkLCDKAD5WaCJ0s6V/N2+o/XMV6bxDrLTwJ
         b21R6CnAhrwbswYcUBKVSoenioOxeDd72mVFym51aiOea/w+VC25UE4UyaEez+jijC2v
         0zcsoyzye/Q+8n0M00eHhbSgu+DcF+3U95sGdGDI6c7lF63jMGAgs60HOn4V4vPNPiwJ
         YsgQ==
X-Forwarded-Encrypted: i=1; AKwUvByJRrBpubXs+7rIwqd2LWbH7x3aS/fdKiKpzO0OUChqiZjFdgxPMKseDBItqfQA3z3ON1pPn4SqGREqw54=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG3avyBL0KdTjtdulm6vYc2wnqros94QPpDIqF1GgkSwOq4OPu
	PtP6QLBPnuuqfaxqNODRqxRv2lgLiRkQ+ftFpg6XZ5jDNRRtmUdoOQxydwSPdJbxRVY=
X-Gm-Gg: AYBFou3S+LR72TlTDKHVdZmHQ2R9W1GLUSInFFvyffbxBV6H5RCLHe88j9o/o/UOqJT
	iOiPPz76a6qXcFeAJsLm9GkakauT9k1Exg6MpSyx19SUHhdB5oLLqDCpWfomeMKhMWI/YxKmfbp
	C4WzUdPI4wzUmDBVM6vwDt/hiPS/h1tRSOlnM1pHvYiERXmJH/LgvBAgEFvDi804ou+gxJnvAM4
	sAEb8XOshAbMRZIuD7wUuNFfX8xnriitHNVkaJxionvJMWwZsiKwbOaGqslhSaiDS6LrG9KuKYa
	4qpbQAGpzaJRO/pxGRQpcOLnldULsFXRIa4ydxQNmKckyJ92ZZZjTqN/bLrsF4F3AMsRYTSxOaX
	kQm84JaZxCPmmXHPiNY8RLgjIECgYeKzmKB+ACvNCtzU/NQJrq8p+QNFEgfxtV0ARUfaOKjCGu7
	kGVn/89gRvaCiA65CpYsQaUVGrdqiCj/cIjcUimn33lUA3KnbQCqj4nOPb4n9ARoARgn8MWXPzF
	uLGrG/5kTqUq6mujBvrAYj0n26HpfX1vTQgrMAOAU9LMbe8RTXkuwNZ8yJ8N/pJSNTIe1BbfeeE
	3W94I+yvv1/euzv08hb1USeBnOjto/cL7w==
X-Received: by 2002:a05:6000:4919:b0:48e:127a:c914 with SMTP id ffacd0b85a97d-48e55a36c3fmr11539376f8f.5.1793180068877;
        Wed, 28 Oct 2026 02:34:28 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7c3sm29091965f8f.51.2026.10.28.02.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:34:28 -0700 (PDT)
Message-ID: <418cf6b3-a56d-45e2-b2f6-0c8496e93ea9@linaro.org>
Date: Wed, 28 Oct 2026 09:34:27 +0000
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
Subject: Re: [PATCH v1 2/4] perf off-cpu: Write the sample ID for
 PERF_SAMPLE_ID
To: Ian Rogers <irogers@google.com>
References: <20261027170415.2815859-1-irogers@google.com>
 <20261027170415.2815859-2-irogers@google.com>
Content-Language: en-US
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ankur Arora <ankur.a.arora@oracle.com>, Howard Chu <howardchu95@gmail.com>,
 Thomas Falcon <thomas.falcon@intel.com>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261027170415.2815859-2-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/10/2026 17:04, Ian Rogers wrote:
> OFFCPU_SAMPLE_TYPES allows PERF_SAMPLE_ID, and the sample ID is
> computed, but off_cpu_write() only wrote it for PERF_SAMPLE_IDENTIFIER.
> When PERF_SAMPLE_ID was set the synthesized samples were one u64 short,
> so the remaining fields were misparsed. Write the ID after the time as
> the sample format requires.
> 
> Fixes: edc41a1099c2 ("perf record: Enable off-cpu analysis with BPF")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   tools/perf/util/bpf_off_cpu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tools/perf/util/bpf_off_cpu.c b/tools/perf/util/bpf_off_cpu.c
> index ff8935688b43..16948761cc45 100644
> --- a/tools/perf/util/bpf_off_cpu.c
> +++ b/tools/perf/util/bpf_off_cpu.c
> @@ -373,6 +373,8 @@ int off_cpu_write(struct perf_session *session)
>   			data.array[n++] = 0;
>   		if (sample_type & PERF_SAMPLE_TIME)
>   			data.array[n++] = tstamp;
> +		if (sample_type & PERF_SAMPLE_ID)
> +			data.array[n++] = sid;
>   		if (sample_type & PERF_SAMPLE_CPU)
>   			data.array[n++] = 0;
>   		if (sample_type & PERF_SAMPLE_PERIOD)

Reviewed-by: James Clark <james.clark@linaro.org>

