Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98243483BF1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548295; cv=none; b=R31T86Vvum9sqS/zPnrsDhFp/6klGumQ1+Y474ntCSNI/vNFONm36y8VzIvLS5WxyuT7oiCpkusg8VPzW7L2vk5Q3wIPCGuzJS6/5krEFwaX0rZauDb6KpQFrcY/6GPZgsbWR2tEtk//FubCgsCvEAq+JhuIarxWx0JyjHYlYkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548295; c=relaxed/simple;
	bh=RHcfOSplw7MFwFqPnZKYqlO3BbT03sGWz1lyygxJi4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jX++n6WHKqfG73akigzzIccCDT/mi/gW5vzVCGcn3vf95ukevrp23+Y7AR5OSLNUPqsSv7LXlAx5XySMA/rLcdRRLz+t9weckUrNg8PYtElwqIDxE1a+HQanJGoc5RlI0z4iZoR66eo/hRWwDpFiWlIQ22pK8b7BcC2aZ080BIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBGqtHEs; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBGqtHEs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789548293; x=1821084293;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RHcfOSplw7MFwFqPnZKYqlO3BbT03sGWz1lyygxJi4A=;
  b=dBGqtHEsqrpvwvVptFPM6BMngwhAJHUMbu7CJmyI34AeTrYfK0jWU1s0
   u3fojHet+VSrCc9ZxXlWvcXaiIMK7GJmH26PDpxRXBGVhLc4dxDHDknZl
   /gY22/M86ZPnIyVPZc7yS+SJTidUcveXOhqHMYzvHW9M1EEeEZmx4zaTm
   VjD6mqSOadNviQ7/PRj9aMjwReqoj9OVi8rub3VoXcTJRMT6Muur20TWM
   hGKZAItI4x5wFFy6SUMU//J7VsrILCYlwkteneaYfacId2M7WN6jtI6ta
   NOMNiIVElm3POfoWcxivOL/pBPehvgphk7PEXmZ0RlD6JD3ChRG8WZO4q
   g==;
X-CSE-ConnectionGUID: tREjUx+ET+yvBBu5E6Ntsg==
X-CSE-MsgGUID: JVYg7wrtQEqGamIiZ5jwtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="430820"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="430820"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:44:52 -0700
X-CSE-ConnectionGUID: /RT++njXQJm5PeudXcxOOw==
X-CSE-MsgGUID: rANCW8OlSmGw8J1L6i4XqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1500360"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.244.168]) ([10.245.244.168])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:44:50 -0700
Message-ID: <da707cc7-abba-4bf5-802f-3cb8f021eaa6@intel.com>
Date: Wed, 16 Sep 2026 09:44:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: change TTM maintainers to Natalie and Arun
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 christian.koenig@amd.com, ray.huang@amd.com, nat@pixelcluster.dev,
 arunpravin.paneerselvam@amd.com, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260915154804.605772-1-christian.koenig@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260915154804.605772-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/09/2026 16:48, Christian König wrote:
> The blunt reality is that I don't have time to look into patches or bugs
> any more as it would be necessary. The same counts for Ray.
> 
> Natalie has been working on the dmem cgroup patches for TTM and agreed
> to take over looking more into TTM.
> 
> Arun is working in my team and already maintaining AMDs VRAM backend for
> TTM and the underlying buddy allocator.
> 
> Add Thomas as reviewer as well, better to have more eyes on that
> component.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Acked-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   MAINTAINERS | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b5a4e4b35cf..b6e58a138501 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9140,10 +9140,11 @@ F:	drivers/gpu/drm/drm_privacy_screen*
>   F:	include/drm/drm_privacy_screen*
>   
>   DRM TTM SUBSYSTEM
> -M:	Christian Koenig <christian.koenig@amd.com>
> -M:	Huang Rui <ray.huang@amd.com>
> +M:	Natalie Vock <nat@pixelcluster.dev>
> +M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
>   R:	Matthew Auld <matthew.auld@intel.com>
>   R:	Matthew Brost <matthew.brost@intel.com>
> +R:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

