Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8703655C3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481458; cv=none; b=NGbmVayyD5a2gy5rGkbwmTjowzfNOkQyx/p16Sru13ZKxNfeygc9gcER/EgUglnfZhBOgDEPplRQAMRBTjuduI0YB0qZm67NZREEz0X38dAtKI1bqiTWXmqMy9f+bJ1gsyK58Ykjl2DzBtQ8TuGeTnL+JPCHqoW0cjqGw5j4Rec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481458; c=relaxed/simple;
	bh=Oxxao6blWXExFijm5Fok3ZVkCi9b1qDzUnzbmJN9OrY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FS0U0FOgF8WEmNQ0/t7V0LqfGpa7M6xqjgL3Noi0/1dT49AW2POHgagaXIcoZnMmi6gigvVNaL7geKnukdWcFS5LyP1CS8whSAbRKviFD9Bl0rfThRav2qYT0JM0kePNKkNSa6/LsdK3KusnMm1CD8SFMKfIRbYVsinf0ag8oZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pyzat2xq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pyzat2xq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789481456; x=1821017456;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Oxxao6blWXExFijm5Fok3ZVkCi9b1qDzUnzbmJN9OrY=;
  b=Pyzat2xqxenEOPdcBxn4kz5P6X98/50e9LjjxDhW2u6VpzTa9vahhg93
   hfniIvGnrO2dS2dPUo4lE0LiQ9hWOqXSSnuLG8gvyIW4lj6Q8dQINItA6
   MSmOed1qb0mfmvGdgQRlE4QNqVXTF30ikVm+gjuCFuckxgD4BHz8dn3su
   th+UR7CmXc6mCfNz/7jXG/SoGxOaekIuolKV3a6AeDM/b7L59YRtre55C
   xvX8VYeXliAkLo6an6vehevGp0Y/SpEX3+/g8rBN1b69pSm+wdo1xp4qI
   6NIkbDaScS20XGpCmy3XXncO0DXWVY3AGmNDw523S6xtdwxHk9DET1nwv
   Q==;
X-CSE-ConnectionGUID: 0Jn1YuUHSkqyMwsel4gt4g==
X-CSE-MsgGUID: t5BczzGmQvCweQVyt2r21Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77404367"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77404367"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 07:10:55 -0700
X-CSE-ConnectionGUID: YLPfbuBUTtOAfdrt260klg==
X-CSE-MsgGUID: QkvsK42dSOCYYZM+mWL9+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271206121"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.243])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 07:10:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "open
 list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, "open list:INTEL DRM DISPLAY FOR XE AND
 I915 DRIVERS" <intel-xe@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: Re: [PATCH] drm/i915/fb: replace kmalloc_array with kmalloc_objs
In-Reply-To: <20260910155846.79513-1-lalitshankarch@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260910155846.79513-1-lalitshankarch@gmail.com>
Date: Tue, 15 Sep 2026 17:10:50 +0300
Message-ID: <c45b9b5e99c763e37aafdf0c8d794e2499543ceb@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 10 Sep 2026, Lalit Shankar Chowdhury <lalitshankarch@gmail.com> wrote:
> Replace the remaining kmalloc_array instance with kmalloc_objs.
>
> Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>

Thanks, pushed to drm-intel-next.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/display/intel_fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
> index 1c0859d5f829..c3e4c3f6d8cf 100644
> --- a/drivers/gpu/drm/i915/display/intel_fb.c
> +++ b/drivers/gpu/drm/i915/display/intel_fb.c
> @@ -596,7 +596,7 @@ u64 *intel_fb_plane_get_modifiers(struct intel_display *display,
>  			count++;
>  	}
>  
> -	list = kmalloc_array(count, sizeof(*list), GFP_KERNEL);
> +	list = kmalloc_objs(*list, count);
>  	if (drm_WARN_ON(display->drm, !list))
>  		return NULL;

-- 
Jani Nikula, Intel
