Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AAF2264A9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157380; cv=none; b=Hyu0TYpIc3lyGfHCo8e98w+mg+Cx0xb/nswBqeJGASV9BOxNPkl/gFsKGHcLIhqGgkXuZqs2nApRw7F+R0ULCcC2COH9gm///Msnc35NYoINd0/t/XyPMNvEj4d0tHLivHVf3Hp9U/nYxvdH1YdR9qsX+/qBaW46wWNpzoev67A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157380; c=relaxed/simple;
	bh=YBJCnJ8rsdKqrUNhHjjL6sBtv233CpMKpsd1Gw/TmLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Na/VTJRJxrVvaLU/XrcEz2YWoNYNyshESh79Vya0XCY8XtawITCHRaslQQtf46DGVMXDYJeDbW4T/h2DziO6QYB5Co0oV3gdBip2WVsgxtbXPmulmr+/Ya2sbuKPqx/BQrazle4e3QBF8H1G69n7MdDyKwbRoRsMiVnPkIkY7E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZpU/OEyL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZpU/OEyL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1674671f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792157377; x=1792762177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8jpDLmMBbHfkeVF10s2tGINPrgBL1dTjWhJOL3aqJTw=;
        b=ZpU/OEyLXA+Mq7KbIo199qfX5BpcXlLuOPVbM/KdkSf4q9Vj0sIt7l0tzl/IIZAWT2
         Qp0ncOfC8Ban/DUJzDJ81C/UFjZryqF+NXb5oPVSC9URR6w+JxCnrgNcu81jVqyvSWzX
         ogzCDVrnbVOixRbZF9950FqGuy6WHAtXxJQopx2JjA1E12inU71N1T1PitZIeHKfeOOw
         XZWKSEcpmjAX7E/CzFOQ5EtVQ6oy0i8s391QuKZeT2t2la1WoyUNqlv6LSQRQ2UO3LJF
         DJ8sE9SibYexUF+opKbsxkwykQfboZnU46jcbR4P1npGa9Ww6vUGemzkGP8aiHzN2t1X
         Yo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157377; x=1792762177;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jpDLmMBbHfkeVF10s2tGINPrgBL1dTjWhJOL3aqJTw=;
        b=MahBS6sotyN8iwzYG4EF99XbXDU3XLEn3/w1/0KQwmbf21aCil/1ZwOyH73M2Kn07V
         NOoGkXjKHieOWfvRy+ngIrxSXOc3O97OEUSaJM+UmPsnN7dqnVc1N2+pPcN9r0ngksRD
         IAMtgvsW8Gpq8BVViGG1Vm/QCs4CRXtMTT66nKKixtNfb3tQ3Npp77uhWc0G+xIhR82D
         +SSBgqzvexDYs/OPh2wewVdqniKV3mBHtg+kJGreAVFsOnglZLZ9BztnGLBAfm1zRkMe
         kEtUV/zcI2RaYjLw0/M9Hzzos2SvxS0s08UDVbrKF2EZLtrg6cJTCTg1sU+T/1PxhG+E
         +EJA==
X-Forwarded-Encrypted: i=1; AKwUvByYy1yicAEDBSwxzm/cJHbpASBLXJxxAh9L12EyTWuy9AeFPEjwahD8rxcuhr2C/VSlnU79GYIb2btkU4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtUaTklz0jDBgnrvqnKeuVjVluBcKN+EVn2o5TzZlizWKe4sWz
	qg6rLwgdiS2C4XE9emqPnPX4OJcpsHilfcm7REZhg/noIBS8tsoiPzvX09PmwBpgRuk=
X-Gm-Gg: AYBFou2M+oa80C2aJN11J6N/u1Pc/VXfdz/+JmZRIIrrKvvlHdNesAebivtqFMFxDOo
	5IEcS28LvnIr3nWVaEsS8Pu1Xz94Yz22OMAncs/+eTIzwC9EJfCKDhAFy04dvd3Vdm5jAk4MSmL
	bMIAI1XE0FZfY+jeYQrUTQgYJu2sYSyYTfPHXPPUt4IGw2CajDwq6h6R/lQf9NEsK+wguyS5Hhz
	4UKZ+JRIS1JpKLd0PDKKeKXRxyepE2zQKX22SmlZ7pDCRdClVef/jmYGmAE8ZHnkQfVtUV/GSyu
	Io+pNLOwP8kal4PWsgOQOsRaDwpOKnGHWwn6eKSACeqTJB9OXWRudzqKNZYxcAC0uVd/8Gb3bZ9
	GVo9HRHvWhg958u778O8xRAQOVh5pjg/XhRS+heMjw5mK4btTFcf6JrScw+10twpDA306dnz2yO
	086kluS2Aelhy+a96xQpRXp6XB65FzLsk7/bIqS8h1RQCN4aYv4DBm6QvRDKoITaE0GQ5p3p7MU
	Ng=
X-Received: by 2002:a05:6000:26c7:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-48df851f00dmr9820547f8f.24.1792157377206;
        Fri, 16 Oct 2026 06:29:37 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4dddsm5173034f8f.22.2026.10.16.06.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:29:36 -0700 (PDT)
Message-ID: <f1a7dac8-5a01-4fc2-bf81-b7609e332e9d@linaro.org>
Date: Fri, 16 Oct 2026 14:29:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/25] perf/core: Prevent AUX sampling from racing with
 pause/resume
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
 <20260915-arm_cs_support_aux_sample-v1-2-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-2-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> AUX snapshot sampling and AUX pause/resume can both run from NMI
> context. Each path currently guards only against its own recursion.
> An NMI can therefore enter one path while the other is changing the
> AUX hardware or buffer state, allowing snapshot_aux() and the PMU
> pause/resume callbacks to overlap.
> 
> Use aux_in_sampling and aux_in_pause_resume as a shared exclusion
> scheme. If sampling nests inside pause/resume, emit the regular sample
> without an AUX payload. If pause/resume nests inside AUX sampling, drop
> the AUX action, matching the existing behavior for recursive
> pause/resume.
> 
> This prevents overlapping PMU operations without waiting in NMI
> context.
> 
> Assisted-by: Codex:gpt-6

Does this need a fixes tag? Seems like using these two things at the 
same time could have gotten you into a state where tracing was enabled 
but aux_paused=1 etc.

> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   kernel/events/core.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 17355e4b8b7c6c106117153c9eb8509e6f9a41e3..a524eb381d4b5731650ec0105d9794b8c89fba4d 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -7990,10 +7990,12 @@ static unsigned long perf_prepare_sample_aux(struct perf_event *event,
>   		goto out;
>   
>   	/*
> -	 * If this is an NMI hit inside sampling code, don't take
> -	 * the sample. See also perf_aux_sample_output().
> +	 * If this is an NMI hit inside AUX sampling or pause/resume, don't
> +	 * include AUX data in the sample. See also perf_aux_sample_output()
> +	 * and perf_event_aux_pause().
>   	 */
> -	if (READ_ONCE(rb->aux_in_sampling)) {
> +	if (READ_ONCE(rb->aux_in_sampling) ||
> +	    READ_ONCE(rb->aux_in_pause_resume)) {

I suppose this means that sampling could be quite unpredictable for 
users if sometimes samples are dropped while pausing is happening. You 
might expect to receive a non empty sample even if its triggered while a 
pause is happening? But preventing concurrent use of the two features 
would be difficult and restrictive.

>   		data->aux_size = 0;
>   	} else {
>   		size = min_t(size_t, size, perf_aux_size(rb));
> @@ -8869,10 +8871,13 @@ static void perf_event_aux_pause(struct perf_event *event, bool pause)
>   
>   	scoped_guard (irqsave) {
>   		/*
> -		 * Guard against self-recursion here. Another event could trip
> -		 * this same from NMI context.
> +		 * Guard against self-recursion and AUX sampling. Another event
> +		 * could trigger either path from NMI context, in which case the
> +		 * AUX action is dropped instead of waiting for the preempted
> +		 * context.
>   		 */
> -		if (READ_ONCE(rb->aux_in_pause_resume))
> +		if (READ_ONCE(rb->aux_in_pause_resume) ||
> +		    READ_ONCE(rb->aux_in_sampling))
>   			break;
>   
>   		WRITE_ONCE(rb->aux_in_pause_resume, 1);
> 

