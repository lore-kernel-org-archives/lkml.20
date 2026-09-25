Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B74748640A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329540; cv=none; b=Y3kLPmU3kdJ/orjaj+R9fIj5Ca8QIfr3U1TYrlJXS3KAWHHfZKgW9lwXwD4d9iMnhsL4+ldOUESFNTFUOqJfcEipM2PocJyxlCZ5ISv7fcsd9dbODqSVnvQXzUnzEdbu1DOlqIAGiavzfAyHCZeLR+jEe7i8YmHoT97+7f1kaS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329540; c=relaxed/simple;
	bh=hVLNA8llyUn7Lq9zEZMrLdBjjuDOXvUThATt634uEHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bvgZCDUL3a7hlvev5Q07FBl/OptXFHr5wnMaz8W1KDPTaanCuO1mWh1QI9cBmL/8b0lOJS73HQSC3UFvqMMZ3ZEXh/x/dH91snvlAiZBZ8Mn9IrhOsycD2WG+ASPAS99ZDEkw8UxVdU2TGv+Gy6/iX1uShUJxv5P66vnXIIIRFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=qv31wrhi; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="qv31wrhi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=EbKmQmawPcLMgSKHp45FiPglETAC7VTaq1PXQmNkJEY=; b=qv31wrhiEqpDx9nkhKl0+jAhYy
	fpXevY49UoUNJk8YlVXJYlDX+Y40bP6T2KhhY1HOsY8WnF2W2DcHtnBmr9ReEA21gpmhjhpt2flde
	/h1/+FRlbpbJuTMJ3/9yH8HDAc46Pql/vDL3Haf49Ga2pc+qUeDrWGghy9E9vaD4IAUdQ3x9zNYEH
	BEwQIedbhypYtD18Plw2zG/LGsPf8michkHHaIt/4dSBk351NQjp6liwBqnmgI0ITXSlCbhjF621Q
	45QlZSAEYtjmOdKimq8ZVR9eRY50VkmVT5Tp8D67/QPeWE4bxmtu7Qei480urF9Hg+ruP9QTfulJz
	D15wrsnQ==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xA2Ui-007575-Qe; Fri, 25 Sep 2026 11:45:28 +0200
Message-ID: <3f2c2f1b-e6ea-4ef0-a405-a840fdca6ce5@igalia.com>
Date: Fri, 25 Sep 2026 10:45:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/amd/display: assign missing trace entry in
 amdgpu_dm_dc_clocks_state
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, aurabindo.pillai@amd.com,
 christian.koenig@amd.com, David.Francis@amd.com, harry.wentland@amd.com,
 simona@ffwll.ch, siqueira@igalia.com, sunpeng.li@amd.com
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20260924211410.867686-1-mwen@igalia.com>
 <20260924211410.867686-2-mwen@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260924211410.867686-2-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 24/09/2026 22:10, Melissa Wen wrote:
> disp_dpp_voltage_level_khz is declared and printed, but never assigned.
> So when using clock tracepoint the value of this clock is just garbage.
> Assign clk->disp_dpp_voltage_level_khz since this is stored in dc_clocks
> as other entries.
> 
> Fixes: 13b5ca42ca9c ("drm/amd/display: Add tracepoint for capturing clocks state")
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> index f33a2c1e0da5..cc70aeb75798 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> @@ -513,6 +513,7 @@ TRACE_EVENT(amdgpu_dm_dc_clocks_state,
>   	    TP_fast_assign(
>   			   __entry->dispclk_khz = clk->dispclk_khz;
>   			   __entry->dppclk_khz = clk->dppclk_khz;
> +			   __entry->disp_dpp_voltage_level_khz = clk->disp_dpp_voltage_level_khz;
>   			   __entry->dcfclk_khz = clk->dcfclk_khz;
>   			   __entry->socclk_khz = clk->socclk_khz;
>   			   __entry->dcfclk_deep_sleep_khz = clk->dcfclk_deep_sleep_khz;

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

