Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF44350AC0C;
	Mon,  7 Sep 2026 15:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795600; cv=none; b=l6qNWfGGCYLj3KCj2Ynb/geBI8r9TMYpo9KOBdlsMeWihUQ+HZEPbiSAVVVJxd7IYXvfdC/YZMBDvtsLEjv/Ub63UhNShc0zH0pUa8t/+MCy8+uyeWWjoIbdXZPNchBNn8tzXKGudSb/V5j2S53IOOoD1GWBQjO5E3xpYfKNJyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795600; c=relaxed/simple;
	bh=IPBkhQVHqxj0IfXD4Tzxx9fiJ4xFnHA/DZoHDEQrQYU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=livCQAhaiUPFH1M/FhKxaI7HvXheYQKkq6AxWmpLWuxipfrrm30wB5yaHzIGnMJelYCgksUiVOhLxq2LiYmYcUgiivGyLEbmkZgN+/lrr7w4rNCww8swnRy2s0U5KAy7SCntdyiGXf+y68Yw2pAdb3aHlAnwv9d4JbwfEl9RYvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1cXh30Y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1cXh30Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788795598; x=1820331598;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=IPBkhQVHqxj0IfXD4Tzxx9fiJ4xFnHA/DZoHDEQrQYU=;
  b=h1cXh30Ysxe/xPQs4fbRdv8IDmLJDCmlOKA+I9t9F9gqt4/eZp4H4UC9
   845UIZMoZOpMCw+ouAHGRmYaW6Hbs0GJizBi7cFqtDC2fQJOzb2BdvkQu
   Lxdg0HoqIqgf4RbVZuGGecycdidqSZw5WoTeqsnz2cHwR/T5niOsswmOr
   gxoNEk3kngzPkINE9XN9uuspZjDusPhghWfL7/sm5BmZgwyMlVvpRXKNH
   JOtwiU2DCA38IFmjmLVG7KqFk8oMjHH8zVwg9P0sYPq1G4hE/3gaVbYsH
   SCiCswg2TBsXULhK3zT7SkhtLzyZDCcCxiS4ge9Egar0dJsxy9SxJ2kIV
   A==;
X-CSE-ConnectionGUID: Gnei4LQ7Sguh60PK1LXjEQ==
X-CSE-MsgGUID: AiRkgqPyROukMaoOk2gp+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="99858672"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="99858672"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 08:39:57 -0700
X-CSE-ConnectionGUID: JAB5ITPsSXSuPV3/WL147A==
X-CSE-MsgGUID: iQtiMoMfQ8eKammQ1m0YiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="276018594"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 08:39:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Albert Esteve <aesteve@redhat.com>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Maxime Ripard
 <mripard@kernel.org>, Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH 3/3] drm/amd/display: drop INLINE_IFN_KUNIT
In-Reply-To: <20260907-visibility-unification-v1-3-6a962e5b3351@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260907-visibility-unification-v1-0-6a962e5b3351@redhat.com>
 <20260907-visibility-unification-v1-3-6a962e5b3351@redhat.com>
Date: Mon, 07 Sep 2026 18:39:50 +0300
Message-ID: <6f3ee86ab60ed16348dc0ac252ba27596829dc19@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 07 Sep 2026, Albert Esteve <aesteve@redhat.com> wrote:
> This helper was originally static inline. INLINE_IFN_KUNIT only added
> inline for KUnit builds, which dropped that hint from production.
>
> There is no equivalent in kunit/visibility.h, and tests do not need
> one: they call the exported symbol from another translation unit.
> Use an unconditional inline with VISIBLE_IF_KUNIT instead so
> production stays static inline.

FWIW, using inline in a .c file is pointless in most cases, and the
compiler usually does the right thing. It might inline at a better
granularity than the manual one. (You could see what difference having
the inline makes, if any.)

BR,
Jani.


>
> kernel-doc already strips inline, so the dedicated xform can go too.
>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c | 2 +-
>  drivers/gpu/drm/amd/display/dc/dm_helpers.h             | 7 -------
>  tools/lib/python/kdoc/xforms_lists.py                   | 1 -
>  3 files changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> index e3f4ee6e8380..eea7e7dcfa30 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
> @@ -173,7 +173,7 @@ void amdgpu_dm_init_color_mod(void)
>  }
>  EXPORT_SYMBOL_IF_KUNIT(amdgpu_dm_init_color_mod);
>  
> -VISIBLE_IF_KUNIT INLINE_IFN_KUNIT
> +VISIBLE_IF_KUNIT inline
>  struct fixed31_32 amdgpu_dm_fixpt_from_s3132(__u64 x)
>  {
>  	struct fixed31_32 val;
> diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> index 6d7cdab1006f..cabcbc2599e6 100644
> --- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> +++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> @@ -194,13 +194,6 @@ void dm_helpers_mccs_vcp_set(
>  		struct dc_link *link,
>  		struct dc_sink *sink);
>  
> -#if IS_ENABLED(CONFIG_DRM_AMD_DC_KUNIT_TEST)
> -#define INLINE_IFN_KUNIT inline
> -
> -#else
> -#define INLINE_IFN_KUNIT
> -#endif
> -
>  bool dm_helpers_submit_i2c_over_aux(
>  	struct ddc_service *ddc,
>  	uint32_t address,
> diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
> index b49b81da74d9..cab4a49e4fc4 100644
> --- a/tools/lib/python/kdoc/xforms_lists.py
> +++ b/tools/lib/python/kdoc/xforms_lists.py
> @@ -105,7 +105,6 @@ class CTransforms:
>          (CMatch("__attribute_const__"), ""),
>          (CMatch("__attribute__"), ""),
>          (CMatch("VISIBLE_IF_KUNIT"), ""),
> -        (CMatch("INLINE_IFN_KUNIT"), ""),
>  
>          #
>          # HACK: this is similar to process_export() hack. It is meant to

-- 
Jani Nikula, Intel
