Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FC93D9DB1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331793; cv=none; b=ef+bBaR9dtj7VNR6x3YqeKHsygsPh2cVTQgiuovMGJ1/T+yH2K8UpRvSFWmXRZQWDq8tq4eKUZV41w3giYMQTNegT3xudsQKKIhCm8ri1FsHEEYNyqDQA44btbZ0vOsR7GiRghbd8XeJU4bQVchRTKBjg03DSm8J935nSYsM6QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331793; c=relaxed/simple;
	bh=Kyixzri5Gm/qQFkSLePEDjM8v7uskAr1l2LUKLYMDUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZ+MCS0NkEEXTSD2Atkx3wwvYdeBtpm2hm/csFCBZNfxlEUoW22f4nCjFW/JThQsZ8Vd1itahXnfJt0SBUWYdrrCanNMXPIgF2J2rEee2MU4P81nWUw9iMlEsadaycGez8myHFontsttnc46odwsGN5BrYMmxZcAGO3dRQmnF58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=mdyNfE6M; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="mdyNfE6M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=bROpSOOrf9zmK3zbUGISWrTidMlRNy186ZZ7M09II4g=; b=mdyNfE6Mz27wro5CXxCQDRRVW7
	u7aYvnYixFBnUVN0RGLuKdqKPWaH0P4irjDNxcPdrrTgaeuezLQ+rAbqENT5AMMjWKUF5SvGgh2v/
	MC7epgFlZhpfpE8kRBh9bfuTrlxFFtS0lOVBd1UE/oW6fLqTFj/WrmwbW8UKKrZF2y4gfbD4feqFg
	PLSgC8W5qcAy3TxZXAwmu0LS2axwrdcqhc2AYqQtlrwZbKMeRtad2017+SrCcXJH7WGiugABwp36O
	55yscdjcSWIUYkixq79+khpmN6TrKjH9i/BDDSvzlZ/6xrTYIwCEPZZckzk0THo1zyciYS51oPdhY
	YlIUgkfg==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xA356-00764O-Dp; Fri, 25 Sep 2026 12:23:04 +0200
Message-ID: <f21d5d36-9ced-4e03-a9a7-752d1f4cb9d9@igalia.com>
Date: Fri, 25 Sep 2026 11:23:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/amd/display: copy function name into
 dcn_optc_lock_unlock_state trace event
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, aurabindo.pillai@amd.com,
 christian.koenig@amd.com, David.Francis@amd.com, harry.wentland@amd.com,
 simona@ffwll.ch, siqueira@igalia.com, sunpeng.li@amd.com
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20260924211410.867686-1-mwen@igalia.com>
 <20260924211410.867686-9-mwen@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260924211410.867686-9-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 24/09/2026 22:10, Melissa Wen wrote:
> Userspace trace tools that use libtraceevent to read binary buffer only
> see a kernel address when printing const char *. Use string macros in
> dcn_optc_lock_unlock_state to copy the function name into the trace
> event.
> 
> Fixes: f1943a51f0f9 ("drm/amd/display: Add events log to trace OPTC lock and unlock")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> index b2f38654e489..7f05f73e5b33 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> @@ -660,7 +660,7 @@ TRACE_EVENT(dcn_optc_lock_unlock_state,
>   	    TP_ARGS(optc_state, instance, lock, function, line),
>   
>   	    TP_STRUCT__entry(
> -			     __field(const char *, function)
> +			     __string(function, function)
>   			     __field(int, instance)
>   			     __field(bool, lock)
>   			     __field(int, line)
> @@ -678,7 +678,7 @@ TRACE_EVENT(dcn_optc_lock_unlock_state,
>   			     __field(int, vready_offset)
>   	    ),
>   	    TP_fast_assign(
> -			   __entry->function = function;
> +			   __assign_str(function);
>   			   __entry->instance = instance;
>   			   __entry->lock = lock;
>   			   __entry->line = line;
> @@ -700,7 +700,7 @@ TRACE_EVENT(dcn_optc_lock_unlock_state,
>   		      "min_v_blank_interlace=%d vstartup_start=%d vupdate_offset=%d vupdate_width=%d "
>   		      "vready_offset=%d",
>   		      __entry->lock ? "Lock" : "Unlock",
> -		      __entry->function,
> +		      __get_str(function),
>   		      __entry->line,
>   		      __entry->instance,
>   		      __entry->opp_count,

Hmm this one does have the macro->function->macro->function trick unlike 
the previous patch so unless I am wrong function name and line number 
are always the same? Ie. it could be converted to two separate 
tracepoints and would just lose the (questionable) line number.

Regards,

Tvrtko

