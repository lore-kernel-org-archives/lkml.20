Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100EB25A640
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329692; cv=none; b=KFLPoc4cNjX6sVHSspyCRkUeLlfQgIC8XV0bc4p9fgUs2QJchPJlepNLIo0Tg27lD16A+j11vgVbxFd1stRsDmnf1Ekn1pos299Q241ee0TsSqLkdIZciX1K1Dlf2VUY80XvauT6zqCubfU6X/IQ4+vZkzI2ZmNoSg7WIktx8tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329692; c=relaxed/simple;
	bh=qbGUo8QHrIq383qxzej13hB6uP/bk54T0HCxD9X9dJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jN7gQHYrxPEDH7NblQYLctsP/1BgQu6RzyW7pfVAkFBW0fMrk0muwwkcFMws5r3g4wyKqFAdfhpZGcMba1NUxd7df5ixwNWOvzRQbP6IuaSQg0ysOd9RH6zAacqVPIkHfqGKD4sGrhI5JMHWlgAACqZxo7PSJT0M5Alw4tYfALY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Za+Lv1l9; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Za+Lv1l9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=HKULrW6MBYNnvyuQr7iJHAnEwF/kgNiFWRtldSgfq/w=; b=Za+Lv1l9LRu01HAuh61J25DhnH
	D7X+zjKTXP3OBh7x76PMOkc0HDrQqAvYxPoezXQmWoTdP002xHSHwY1FG9uTMRKjfjLYwH5Beio6S
	JEASYF5LpR8oNrks2nXBM8U6IB4PBVG3SRsNi1YMG6jRfjLmnpVmodqdHXeiGP3OZQBAkuSnSiBu3
	NqL73Iokyk7w57Zv6rg2lNtEj5KLJVDvel+bR/DUCPG3UoK/eO3zNIW4Q5vs3O920DCZCiuzZpjhy
	mebfLfFuBkGNAFSDr6aqYuoWMdTItsF9BZg6T7QmoepZPMEhWsbLc5DXj/g6KLAuymiehiwdRhhed
	a5LEAQJQ==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xA2XB-0075Ad-00; Fri, 25 Sep 2026 11:48:00 +0200
Message-ID: <6926109d-7371-4098-8353-45361e306762@igalia.com>
Date: Fri, 25 Sep 2026 10:47:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/amd/display: fix vready offset assignment in
 dcn_optc_lock_unlock_state
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, aurabindo.pillai@amd.com,
 christian.koenig@amd.com, David.Francis@amd.com, harry.wentland@amd.com,
 simona@ffwll.ch, siqueira@igalia.com, sunpeng.li@amd.com
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20260924211410.867686-1-mwen@igalia.com>
 <20260924211410.867686-4-mwen@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260924211410.867686-4-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/09/2026 22:10, Melissa Wen wrote:
> vready_offset is captured by optc_state, but the trace point entry is
> wrongly assigned to vupdate_offset. Fix vready_offset tracepoint field
> in dcn_optc_lock_unloack_state to record optc_state->vready_offset.

unlock

> 
> Fixes: f1943a51f0f9 ("drm/amd/display: Add events log to trace OPTC lock and unlock")
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> index 887ebac8c97e..f5c2f589f691 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> @@ -701,7 +701,7 @@ TRACE_EVENT(dcn_optc_lock_unlock_state,
>   			   __entry->vstartup_start = optc_state->vstartup_start;
>   			   __entry->vupdate_offset = optc_state->vupdate_offset;
>   			   __entry->vupdate_width = optc_state->vupdate_width;
> -			   __entry->vready_offset = optc_state->vupdate_offset;
> +			   __entry->vready_offset = optc_state->vready_offset;
>   	    ),
>   	    TP_printk("%s: %s()+%d: optc_instance=%d opp_count=%d max_h_total=%d max_v_total=%d "
>   		      "min_h_blank=%d min_h_sync_width=%d min_v_sync_width=%d min_v_blank=%d "

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

