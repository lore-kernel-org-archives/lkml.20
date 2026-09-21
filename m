Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5703B493D5D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992363; cv=none; b=L5/KRd3Arzp4EeDW1UMreIvaNCrqxYxXVCQpimuFqNVEf385GOD93/zu4/+ISl/xMN4I9MfK9BFb+MY0tUo7q5zguvbNxLb+s0zamzHfC5YBQzWKjkNOnLgiF+POCbWcG64XxtJlB06Cir6rpMvxoU+8zSTqNWayaUdTPb2fitY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992363; c=relaxed/simple;
	bh=O9I35faObi0LwJh6VqhUiFz7Qd2hXMLjzi2BJWPyarQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CHAqhNtJaIfiiAuBpGuj+TnQVcy5OjWVbKQa49Wj2YUOpLpYtTfhRk5qW56ZA9WsuPs1ndZA90yDjfJYkTya+Wc7nQKy6AMQc9PdAfoUZnUs4mIfSZABnkZ1BA82ADCQJpUBABuxOlAfBYg6KfQhQ8xon5DxueS4K+5RVRohW5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hFNC+AUi; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hFNC+AUi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789992361; x=1821528361;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=O9I35faObi0LwJh6VqhUiFz7Qd2hXMLjzi2BJWPyarQ=;
  b=hFNC+AUiNoSS6HmFV6c2s6LSdx1P6XYotsVHD2s+LUgnkdqubKsZVCyL
   zR6cnOhA2QE92BKBMMrUYQSqAuFvNrapMX+U0tFyfdKvlNgEWTuTqurJQ
   W/TVIQCc60DME1GtvjW8cuUwP7UurZafuoGNuKQaCKVWfDq6bjhMtvkjz
   yYUdBzgXvyejiLQVxFREBgd6wAtxVy8SJh2Ngd+sm/4ovMbRx3RqLhmGq
   FlFuC42KBGRiALYbK93pDW3coBXR8pHuq1xhxJJIcHKkmKGtKTyWcXA0F
   xOjLH5pjejs0oJdiCVbN5sltxKjXtE1a75JN2T7yb01iqrgMylxUgNpI3
   A==;
X-CSE-ConnectionGUID: YFF9dQ4KQQKqQoqd1jd+PQ==
X-CSE-MsgGUID: I7iFQFh7SeCQAfOgFFFUlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="90519078"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="90519078"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 05:06:00 -0700
X-CSE-ConnectionGUID: 7sb0Y0uUQ9Cl3af9e8EaQw==
X-CSE-MsgGUID: 7zieuhx0QFuzuIZVjsKFoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="3656413"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.180])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 05:05:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Zhenyu
 Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>, "open
 list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, "open list:INTEL DRM DISPLAY FOR XE AND
 I915 DRIVERS" <intel-xe@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: Re: [PATCH] drm/i915: use string choice helpers
In-Reply-To: <b5576d0e503315036500145888d712e75df42f7e@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260918042325.17700-1-lalitshankarch@gmail.com>
 <b5576d0e503315036500145888d712e75df42f7e@intel.com>
Date: Mon, 21 Sep 2026 15:05:55 +0300
Message-ID: <f752369b705a2fecd04c84e8f8917a85f952a09f@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 18 Sep 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Fri, 18 Sep 2026, Lalit Shankar Chowdhury <lalitshankarch@gmail.com> wrote:
>> Prefer the str_high_low() and str_read_write() helper functions
>> over ternary operators with hardcoded strings.
>>
>> No functional changes.
>>
>> Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

And pushed to drm-intel-next, thanks for the patch.

BR,
Jani.


-- 
Jani Nikula, Intel
