Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0F847DD77
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258563; cv=none; b=W6l13rDOHMQcYGCCKpSWlHMxX8hePScacEM7f4/fMbHLuY+2A5WXuAN3Fc/3hkPskt7Vq8ieMzEwtXmKYuo/UvXu4uT5C0hLB08adK7kK0+BhqG124jIVVPtUd2pzIo60/wE0ckGZ8jVOfuKZEhiA02wUXvg2AcPle+NBIUwrq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258563; c=relaxed/simple;
	bh=6VL+2jTpoIlB/ex9UG+2bXV0ukx5HvT53gO1KHXzF7s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZDGdj761FZhZi2DgISSZzrcxP7m2Jb1uy4cDLEj1C7G/+GBiKcTNKqiT8p+A3Wa/m8WgzwodST5vnzh0pyvz8C5TEHdJy6yJYti2Cpsmd8BzAVfSTAfr18XSXkgP8LD3AqjX5UgYT0uzuwvPuWDaBhX/7gMhI+qJJdBh1Aj3gkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9pvZ9mw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9pvZ9mw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788258561; x=1819794561;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=6VL+2jTpoIlB/ex9UG+2bXV0ukx5HvT53gO1KHXzF7s=;
  b=E9pvZ9mwi8ZrVkv5csb/Uk0ypU4IcpDvDZtfuF9bWpREAAxyFLTJbigI
   jQETGNFstCSadwBDcTagtXzD352o6PWWTAb5pvfGSYX0wXGoJpSvKEHJS
   KvAzdS8K+Fguki5Ybm8nImrkjaA9Xk/czx4EfMz1A/6bYAkMzszWgbEAZ
   DOV4406YLoiMexenyAE7hM/gPa8OunSsf69u01P5UWL+h/sMm7M6fY5YU
   lEnwQGxupC+UoeW4JOhjAvGbsB/y41oJHk7WCChLBuWsF58EWFFLmfKH9
   70vvdyoX0vM8Xe0n863dLTjALqAoBoCzWlSd1rfrkqgkYGNklZtHQCR7u
   w==;
X-CSE-ConnectionGUID: 8N+66AjuQRm0XIW28xQzQA==
X-CSE-MsgGUID: oXiodeT0QWe2RlOWR802uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88609366"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="88609366"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 03:29:20 -0700
X-CSE-ConnectionGUID: 6sWl4nocQYCB4W25KjLY1g==
X-CSE-MsgGUID: VR0nG1OeSIWlgl4powKc8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="272842924"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 03:29:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: David Laight <david.laight.linux@gmail.com>, Hrushiraj Gandhi
 <hrushirajg23@gmail.com>
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tursulin@ursulin.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gvt: use strscpy() instead of strcpy() in
 virt_vbt_generation()
In-Reply-To: <20260901101225.3aa0f0cf@pumpkin>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260901050241.359490-1-hrushirajg23@gmail.com>
 <20260901101225.3aa0f0cf@pumpkin>
Date: Tue, 01 Sep 2026 13:29:15 +0300
Message-ID: <198aae087325b563c87d6335ffe3b46bd5fb56ba@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 01 Sep 2026, David Laight <david.laight.linux@gmail.com> wrote:
> On Tue,  1 Sep 2026 10:32:41 +0530
> Hrushiraj Gandhi <hrushirajg23@gmail.com> wrote:
>
>> strcpy() has no bound on the destination buffer, so convert this to
>> the bounded, always-NUL-terminating strscpy() instead. The literal
>> "BIOS_DATA_BLOCK" (15 chars + NUL) fits the 16-byte signature field
>> exactly, so this is a no-op change in behaviour.
>> 
>> No functional change.
>> 
>> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
>> ---
>>  drivers/gpu/drm/i915/gvt/opregion.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/gvt/opregion.c b/drivers/gpu/drm/i915/gvt/opregion.c
>> index d6e76ba31d60..f2527e26cd1e 100644
>> --- a/drivers/gpu/drm/i915/gvt/opregion.c
>> +++ b/drivers/gpu/drm/i915/gvt/opregion.c
>> @@ -151,7 +151,8 @@ static void virt_vbt_generation(struct vbt *v)
>>  	v->header.vbt_size = sizeof(struct vbt);
>>  	v->header.bdb_offset = offsetof(struct vbt, bdb_header);
>>  
>> -	strcpy(&v->bdb_header.signature[0], "BIOS_DATA_BLOCK");
>> +	strscpy(v->bdb_header.signature, "BIOS_DATA_BLOCK",
>> +		sizeof(v->bdb_header.signature));
>
> Pointless and potentially wrong.
> Both normally reduce to the same memcpy() call.
> If the fixed string is too long strcpy() generates a compile error
> whereas strscpy() will silently truncate.

Moreover, there's no provision that the signature must be NUL
terminated. All consumers must treat it as a 16-byte block which may or
may not be NUL terminated. In fact, it is usually padded with space
rather than NUL terminated, and one could argue the NUL termination is
wrong here.


BR,
Jani.

>
> (The '&' and '[0]' might need removing.)
>
> David
>
>>  	v->bdb_header.version = 186; /* child_dev_size = 33 */
>>  	v->bdb_header.header_size = sizeof(v->bdb_header);
>>  
>> 
>

-- 
Jani Nikula, Intel
