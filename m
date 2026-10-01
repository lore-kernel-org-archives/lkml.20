Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A0D374A0E;
	Thu,  1 Oct 2026 14:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863230; cv=none; b=BCLiGwFbEWEEDbmgusdKcD0rILG3+VfMU5yv+v4UjHKRi0Q+1G1VBMczAiK02p/Mmn4Dtyz7cGtMskdz4kJJaCEWQDMRMtKr/5fg1xAdHJLDD0QGHBy15PCKwqeCuQuQZJLl1ivKvIli5QEhQqQrmoHMpWnGIoAizEndWS3/dHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863230; c=relaxed/simple;
	bh=AcGFaAWMJog91BkmxiEKa9EgggF0tj82X5+IprY3G/c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TyqW3TzzsxtlwTO8u+UuIruqOoqlT2k4SUXI93cn1nerVqjuunQ3M32RjRj5fKRY5mgJOhu3BNWhefPiMXbPsQ2aTi9FJsrvpvoSvqCffDky05g5w6u25C4z0q5icJbCVsNpWarx8ZbHup6zdOiMBUX24CM8PNluCqrDBRdUTh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sp6736PK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sp6736PK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790863229; x=1822399229;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=AcGFaAWMJog91BkmxiEKa9EgggF0tj82X5+IprY3G/c=;
  b=Sp6736PKtxl3aiuSzSene9Ugt30SYKmt6Uq361v6KI0yWbQdhSTd52fq
   2nUatgi6Taq4Ru3Co8liXGKMsEO169rC20S5I+yQmdHewV5uDYxJRn4ca
   BFavdq+5pbxXl3PddqW4SmmLYlpUSBK9s5K/SxtEUINEIHLY5JvEeHv5b
   tyBwpL5ALWoYgO4R2tufAhzad2YVaxMllPjyU09kS4eMjiRogYx0zxq9w
   buusG4KzGSRjGB3C3lD7eBdgdTMmAfTnD5rdAwZzW29q3je8/ZlCFKP21
   ONWNf0EIegYQwOlB9OaCF0YnaZzreVSuDTwtRjsfXoXNeB11XyMVa90vh
   A==;
X-CSE-ConnectionGUID: 8+MqRzbgR+uE+WkYR2zDoA==
X-CSE-MsgGUID: q2SemrfZTjOtw4RcNZfk3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90834350"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="90834350"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 07:00:28 -0700
X-CSE-ConnectionGUID: ZdwFH+w8S4mkkxYd3KUrXA==
X-CSE-MsgGUID: Xgw++lmJRXKuWjmUgI0Bxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="303936278"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.111])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 07:00:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn, wy@wyuan.org,
 si.yanteng@linux.dev, srcres258@furdevs.cn, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH 4/4] docs/zh_TW: add missing :Original: fields
In-Reply-To: <CAKspUhKCpXGKb7zpz9MbtpixVMUWKXMJtK-z6CcrezGA6e+ETA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260929131020.266120-1-chenyou910331@gmail.com>
 <20260929131020.266120-5-chenyou910331@gmail.com>
 <c719c6756f345c6c39db483654578ef09de1948f@intel.com>
 <CAKspUhKCpXGKb7zpz9MbtpixVMUWKXMJtK-z6CcrezGA6e+ETA@mail.gmail.com>
Date: Thu, 01 Oct 2026 17:00:23 +0300
Message-ID: <22fdd310dfb0946bbe58ed71308e58d936cbed53@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, 30 Sep 2026, =E8=91=89=E5=AE=B8=E4=BD=91 <chenyou910331@gmail.com> =
wrote:
> You are right, and I should have seen it -- the rest of this series is
> built on that same expectation. checktransupdate.py also finds the
> original purely from the path, which is why 1/4-3/4 move the files
> rather than fix their :Original: fields. By the same token, at their old
> paths the language switcher cannot pair them with their originals
> either, which is a better argument for the moves than the one I gave.

Oh, by the way, I do think the series as a whole is worthwhile cleanup,
and having the :Original: fields is the current practice. Removing them
should be a separate change.

BR,
Jani.

--=20
Jani Nikula, Intel
