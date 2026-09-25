Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACF3479886
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330743; cv=none; b=CQyLebae79r/z5LegKMkQvtjJAu9P0YOTlqJ10c0kWOqnHD0r9fpux18b0ao8i3zbb4lH4nASWSG6xLxBP+pj0pWmNaqzp7zz3i/3xIVzfIcwljSlUPE+ZbXX2MzZzVa2GLw41mWhpywpiERKd/Dg15mj84jeXG6JTBD36WZnFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330743; c=relaxed/simple;
	bh=kHiFnIShVA5kgaDpjdYsraZHo/iluVkAxGrZZSK0TRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpVF33phMH21FNqfBmYyC9p9i9TWp0aNSEMVtWFMs9cbK/WxC/1iDVKyjkDB8smROGuMBQ7dvRxNrNDEW4FOA0JVLQS6+Q5XCxybgfcNklXQvhbnYW5b6A7SXSFcmF0TeiK196NojXDRLCGfbGo1KGhmOpRXXFRwnvYlfLVCyG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=oSxOyZVA; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="oSxOyZVA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=+IHZSw9GJGB4eonCXrhw37O9NY3F+yFCYGgrvXozfn0=; b=oSxOyZVAfzfCvVHrO96XNALA3I
	IQmJ5DPlNDl5i1Hg8AO/fggbE38K+a5bAxmXB9m7l8CFneL13xsZLLnswFnYbjO405d27PTzdwFQE
	fy1nGXS9a78PjrlcscVyVibt9pKVFrEysZiHF9X6K/gI/PuKw2ClCORrt5Ox0sb6ktocrNL58sj/m
	SxBrMhnreAnaVbpmGSE0ZLSqx0Zfj+2WJAMDfj/vWE6Z/ST5NyChhH5Uhn42g5XkbnpixjBZCJ45+
	ZR6Fd9v/8OLS6YmFo51R6BdgzVslrNUmxx7c6uUEnqZbCP7hqeHHhBKRv7yf0sp1blQ5RQPGCIdWv
	UcI7FWpg==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xA2oB-0075ei-Ut; Fri, 25 Sep 2026 12:05:35 +0200
Message-ID: <90abbe7f-9f58-4fd6-9aae-13acb26b171b@igalia.com>
Date: Fri, 25 Sep 2026 11:05:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/amd/display: remove redundant cast on
 amdgpu_dc_reg_template printk
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, aurabindo.pillai@amd.com,
 christian.koenig@amd.com, David.Francis@amd.com, harry.wentland@amd.com,
 simona@ffwll.ch, siqueira@igalia.com, sunpeng.li@amd.com
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20260924211410.867686-1-mwen@igalia.com>
 <20260924211410.867686-7-mwen@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20260924211410.867686-7-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 24/09/2026 22:10, Melissa Wen wrote:
> Commit 0cf5eb76e2b4 ("drm/amd/display: Add tracing to dc") prints and
> casts uint32_t fields in amdgpu_dc_reg_template to unsigned long
> unnecessarily. Just print those fields with %08x and remove the
> redundant cast.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> index 26c85d95bcc0..7de4fe355c5d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> @@ -57,9 +57,8 @@ DECLARE_EVENT_CLASS(amdgpu_dc_reg_template,
>   				   *count = *count + 1;
>   		    ),
>   
> -		    TP_printk("reg=0x%08lx, value=0x%08lx",
> -			      (unsigned long)__entry->reg,
> -			      (unsigned long)__entry->value)
> +		    TP_printk("reg=0x%08x, value=0x%08x",
> +			      __entry->reg, __entry->value)
>   );
>   
>   DEFINE_EVENT(amdgpu_dc_reg_template, amdgpu_dc_rreg,

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

