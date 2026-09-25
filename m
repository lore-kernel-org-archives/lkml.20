Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F943D7D6C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329547; cv=none; b=KPwnfukw6/BIs60lyoZ7HwnTwlt4gO+9iekHlCcIz30o+EAgOe4SYDHEQUY4AyDNtDmG7FkyuPgLcSLRFYJLy+1L+xNuYwUrnLIbfTHzDdUmdqLxAxk+KsMrOizaxlnGtg3PCiot+u/r1DgLwYxiJGkCS6RL+pjgBwqyB2oh2SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329547; c=relaxed/simple;
	bh=sWFTAeR0Yj3aujNrBaJvwjwrtIKhphyd6s8fACyMbTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YRjitYCFo9ge+sJjeTBn6lZQHg36CnfNCSQ7R0xyxG8RMpErTPlKfvv1jNF/2OTJOuIvsRlyO4aBd8Z3Q2trI2COxVSALEJGlD1takHsELmEhaeSFq5Jyg5k09fbU5RNPxvGLMiBCo+5EJF3gDpwbEf4T2OX3t+DG+eQHrygCtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=labMJmPE; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="labMJmPE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=CFfVx5+oFFnU1AL0DobMmqx7JLTRcaMuiNwwn3CLh9Q=; b=labMJmPEQorWLCGpc/0RBibfof
	16GsxBdFlTB+ix7mpbZ0Ga1Dha5rMhfCmxAE0dlCSwMxknIYFi0L7SR1qtnrlFdPBkh+P7OGPpVF1
	HX/5SZ4K2LVZd0giHCU7v98032/QLCzQ5CECsm0oNmc4WPtUngn3WgCQdFbdU/cmb8BvmGNZMVlmY
	/8RqPoEuRt5SB2I3qjzLd4XD+Pqxq750RzGiKeVm2JjQuPrOwwCGjnNqHrb5qog9JR0OHqhdVbIFz
	MLWYujfjgxlOTUYsPs+SMD8mH8dPPt2VDs/5Th68Drq57Y4TVYkogplbKvJdHfD9pgAhUXwvUBh0L
	sJZx0v7w==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xA2Us-00757b-90; Fri, 25 Sep 2026 11:45:38 +0200
Message-ID: <4e7f1494-722b-4a09-9b8a-b26e879be2fa@igalia.com>
Date: Fri, 25 Sep 2026 10:45:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/amd/display: remove duplicated
 prev_p_state_change_support assignment
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, aurabindo.pillai@amd.com,
 christian.koenig@amd.com, David.Francis@amd.com, harry.wentland@amd.com,
 simona@ffwll.ch, siqueira@igalia.com, sunpeng.li@amd.com
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20260924211410.867686-1-mwen@igalia.com>
 <20260924211410.867686-3-mwen@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260924211410.867686-3-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 24/09/2026 22:10, Melissa Wen wrote:
> The prev_p_state_change_support trace entry is assigned and printed
> twice, remove the unnecessary duplicates.
> 
> Fixes: 13b5ca42ca9c ("drm/amd/display: Add tracepoint for capturing clocks state")
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> index cc70aeb75798..887ebac8c97e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> @@ -523,7 +523,6 @@ TRACE_EVENT(amdgpu_dm_dc_clocks_state,
>   			   __entry->p_state_change_support = clk->p_state_change_support;
>   			   __entry->prev_p_state_change_support = clk->prev_p_state_change_support;
>   			   __entry->pwr_state = clk->pwr_state;
> -			   __entry->prev_p_state_change_support = clk->prev_p_state_change_support;
>   			   __entry->dtm_level = clk->dtm_level;
>   			   __entry->max_supported_dppclk_khz = clk->max_supported_dppclk_khz;
>   			   __entry->max_supported_dispclk_khz = clk->max_supported_dispclk_khz;
> @@ -533,8 +532,8 @@ TRACE_EVENT(amdgpu_dm_dc_clocks_state,
>   	    TP_printk("dispclk_khz=%d dppclk_khz=%d disp_dpp_voltage_level_khz=%d dcfclk_khz=%d socclk_khz=%d "
>   		      "dcfclk_deep_sleep_khz=%d fclk_khz=%d phyclk_khz=%d "
>   		      "dramclk_khz=%d p_state_change_support=%d "
> -		      "prev_p_state_change_support=%d pwr_state=%d prev_p_state_change_support=%d "
> -		      "dtm_level=%d max_supported_dppclk_khz=%d max_supported_dispclk_khz=%d "
> +		      "prev_p_state_change_support=%d pwr_state=%d dtm_level=%d "
> +		      "max_supported_dppclk_khz=%d max_supported_dispclk_khz=%d "
>   		      "bw_dppclk_khz=%d bw_dispclk_khz=%d ",
>   		      __entry->dispclk_khz,
>   		      __entry->dppclk_khz,
> @@ -548,7 +547,6 @@ TRACE_EVENT(amdgpu_dm_dc_clocks_state,
>   		      __entry->p_state_change_support,
>   		      __entry->prev_p_state_change_support,
>   		      __entry->pwr_state,
> -		      __entry->prev_p_state_change_support,
>   		      __entry->dtm_level,
>   		      __entry->max_supported_dppclk_khz,
>   		      __entry->max_supported_dispclk_khz,

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

