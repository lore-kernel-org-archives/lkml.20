Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B1B402BA1
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330120; cv=none; b=uSiwz2rM3irnv5aZd95Sj4NRXiJKIX/j+uyMCylkV6CIq93d8VzkvhzX8DJ4QYIhsPRBV6o8byu9MtftwWmTgRxfcG38U9l/CN59EyphEXVhJWutpg/rt/rCm6TpL/DS3SYVwZ9zbD88BjYd6duk80F9ig85ovGbOaQAWH2+83A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330120; c=relaxed/simple;
	bh=nCxXL1O0eRXw7mUBMUNvuD5EmL4JO2PTHnpEl/3MCK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KIa564F93loq0OBqFFx+/i3NaDM7eGQQkos7Ha84O3mlv8MbIeebKG3t+mzoQcMyJv9pCr3kqls0zaRYYvQTmmpnYoFTYisht2YXZE5c0mXS8zOqlkN4lLWhSRSHr3niKfmpSgyHZq+pkqpusG6dRk4tMBgtK6hGkc4whuqNH5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=b0/dk8RZ; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="b0/dk8RZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=aDnXyV5jsiW+S1mwGyTnCiVEvipY2nLJlRPvqHr2POU=; b=b0/dk8RZA7q//JwlY3uEmzLrfm
	apK/zlTJIz33JR1Zi4jlwLQ13H89vI8X9yO7hKjeOjTnKLmLBK6gUgFt05ABI7BKXXXeykspXD5j2
	sLzbfdwk0ekjGaMXwq7WSN/CTKtKJ2hD1lh3/u2DxHL2UQlnbrjuEVnxgEhzwf2NlrzogQM5UlKLi
	RLrgELVm23eYOr0Ez+xmMNiGnWLFSw5Y7M9ZHKBHG6+OTWpOJDSkNzrvxBqiTzsTLg34XuZH2PCsl
	8Vdn9E7Pmw+X+LBdDQbe0NqZUdYaqJB6+7PXoK40aW0F7mOUtZDY/SkEHNTFq+v2MmE+hCWEKFfKH
	eEigby7Q==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xA2e6-0075RN-ER; Fri, 25 Sep 2026 11:55:10 +0200
Message-ID: <1accce61-be0a-4fbe-90e0-9503853d80d5@igalia.com>
Date: Fri, 25 Sep 2026 10:55:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/amd/display: declare
 amdgpu_dm_atomic_state_template as an event class
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, aurabindo.pillai@amd.com,
 christian.koenig@amd.com, David.Francis@amd.com, harry.wentland@amd.com,
 simona@ffwll.ch, siqueira@igalia.com, sunpeng.li@amd.com
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20260924211410.867686-1-mwen@igalia.com>
 <20260924211410.867686-5-mwen@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260924211410.867686-5-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 24/09/2026 22:10, Melissa Wen wrote:
> Don't create an amdgpu_dm_atomic_state_template event since this is just
> a template. Declare the template as an event class that will be used by
> actual event tracers.
> 
> Fixes: e8a982355f96 ("drm/amd/display: Add tracepoint for amdgpu_dm")
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 56 +++++++++----------
>   1 file changed, 26 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> index f5c2f589f691..c59ba41a9721 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> @@ -314,36 +314,32 @@ DEFINE_EVENT(amdgpu_dm_plane_state_template, amdgpu_dm_atomic_update_cursor,
>   	     TP_PROTO(const struct drm_plane_state *state),
>   	     TP_ARGS(state));
>   
> -TRACE_EVENT(amdgpu_dm_atomic_state_template,
> -	    TP_PROTO(const struct drm_atomic_commit *state),
> -	    TP_ARGS(state),
> -
> -	    TP_STRUCT__entry(
> -			     __field(const struct drm_atomic_commit *, state)
> -			     __field(bool, allow_modeset)
> -			     __field(bool, legacy_cursor_update)
> -			     __field(bool, async_update)
> -			     __field(bool, duplicated)
> -			     __field(int, num_connector)
> -			     __field(int, num_private_objs)
> -	    ),
> -
> -	    TP_fast_assign(
> -			   __entry->state = state;
> -			   __entry->allow_modeset = state->allow_modeset;
> -			   __entry->legacy_cursor_update = state->legacy_cursor_update;
> -			   __entry->async_update = state->async_update;
> -			   __entry->duplicated = state->duplicated;
> -			   __entry->num_connector = state->num_connector;
> -			   __entry->num_private_objs = state->num_private_objs;
> -	    ),
> -
> -	    TP_printk("state=%p allow_modeset=%d legacy_cursor_update=%d "
> -		      "async_update=%d duplicated=%d num_connector=%d "
> -		      "num_private_objs=%d",
> -		      __entry->state, __entry->allow_modeset, __entry->legacy_cursor_update,
> -		      __entry->async_update, __entry->duplicated, __entry->num_connector,
> -		      __entry->num_private_objs)
> +DECLARE_EVENT_CLASS(amdgpu_dm_atomic_state_template,
> +		    TP_PROTO(const struct drm_atomic_commit *state),
> +		    TP_ARGS(state),
> +		    TP_STRUCT__entry(__field(const struct drm_atomic_commit *, state)
> +				     __field(bool, allow_modeset)
> +				     __field(bool, legacy_cursor_update)
> +				     __field(bool, async_update)
> +				     __field(bool, duplicated)
> +				     __field(int, num_connector)
> +				     __field(int, num_private_objs)
> +		    ),
> +		    TP_fast_assign(__entry->state = state;
> +				   __entry->allow_modeset = state->allow_modeset;
> +				   __entry->legacy_cursor_update = state->legacy_cursor_update;
> +				   __entry->async_update = state->async_update;
> +				   __entry->duplicated = state->duplicated;
> +				   __entry->num_connector = state->num_connector;
> +				   __entry->num_private_objs = state->num_private_objs;
> +		    ),
> +		    TP_printk("state=%p allow_modeset=%d legacy_cursor_update=%d "
> +			      "async_update=%d duplicated=%d num_connector=%d "
> +			      "num_private_objs=%d",
> +			      __entry->state, __entry->allow_modeset,
> +			      __entry->legacy_cursor_update, __entry->async_update,
> +			      __entry->duplicated, __entry->num_connector,
> +			      __entry->num_private_objs)
>   );
>   
>   DEFINE_EVENT(amdgpu_dm_atomic_state_template, amdgpu_dm_atomic_commit_tail_begin,

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

P.S. A side question - are %p useful in these tracepoints? I imagine one 
has to know the object lifetimes really well, or make sure state init 
and free are also traced to make sense of what is what.

