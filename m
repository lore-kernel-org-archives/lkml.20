Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23133499F3B
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551863; cv=none; b=i3c9oh8+sfR2GBuj2Trj9kMYs65vAwXZL0cPcH/WNeJX5JLITn3ib3lxoiEWOjOkNO8Xz4Eodr5HVqeIa2FFxzUmZDAmt+YVrFZq+7mGril4w5V00Xh2e+qdsqB0qKL7yxJ1arLfA7s8yhSRbb0EOAQe1i/NBu/pGKRGHwf4aJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551863; c=relaxed/simple;
	bh=JqTORXeSNrJrC5U7anYxzVHfkMstWz5PcasAb0t9hog=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iDC/8nVsziu+wxvQUi+xrfijaWFpJyEq4Y0XTSxs5t2MHmjSIgLxspnJjgEBeZjFWZjEHB7Q6elAPrljKut+JbBaHqkOisT5Z52FUTyaviSGSqYuqsbA7o0R0tiFNUO7SWDXA0e4TLHkU143/KE7mAvIzQandVJfjv9ngGfsBBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJXtds8H; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJXtds8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789551858; x=1821087858;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=JqTORXeSNrJrC5U7anYxzVHfkMstWz5PcasAb0t9hog=;
  b=dJXtds8HAukJ2w2+2OiFbAV3AxCEGz4ZhQmoqTQHdfhrFTuWlqajkITi
   f50WIWujGLRubAyuJgcEg/W0N/0I36ipOZP2jSbaCHdDDyBY/0RIGWrE5
   9rhUI2+gaqPmyeuzRjqDxzEOyAkXPHBNK22PHBTU+SLs2ZQKqwcUYvyvD
   9OAxH+ZPTNV5ysc9Fc9x6F4Oqz1BNfk4M5xqb8R/vR+0cY3tD7FaoFLx8
   mvI8ZYaJzHR0ihuzQZaYOYhBSXscfDlXMR9M4gh6e89CTNhm92Q14IfyJ
   HBpVDPEAb1REtTdgyXs1G4ajVUonjONbk3BdX/A1fGs/izg34BUywRd5r
   A==;
X-CSE-ConnectionGUID: aoJDtGGoRVyPhS1hVLy0HQ==
X-CSE-MsgGUID: i/PfntEgTby2hHGfjC5jtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89680305"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89680305"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 02:44:13 -0700
X-CSE-ConnectionGUID: b6vXZgZNSn2g3CSM2QYyNg==
X-CSE-MsgGUID: /Z8oqPpXRxK1A2FNvWE57w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="303169290"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.154]) ([10.245.244.154])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 02:44:10 -0700
Message-ID: <a3c94fcf0029e7f257a0219532d906643846ffd1.camel@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: change TTM maintainers to Natalie and Arun
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	christian.koenig@amd.com, ray.huang@amd.com, nat@pixelcluster.dev, 
	arunpravin.paneerselvam@amd.com, matthew.auld@intel.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 16 Sep 2026 11:44:07 +0200
In-Reply-To: <20260915154804.605772-1-christian.koenig@amd.com>
References: <20260915154804.605772-1-christian.koenig@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-09-15 at 17:48 +0200, Christian K=C3=B6nig wrote:
> The blunt reality is that I don't have time to look into patches or
> bugs
> any more as it would be necessary. The same counts for Ray.
>=20
> Natalie has been working on the dmem cgroup patches for TTM and
> agreed
> to take over looking more into TTM.
>=20
> Arun is working in my team and already maintaining AMDs VRAM backend
> for
> TTM and the underlying buddy allocator.
>=20
> Add Thomas as reviewer as well, better to have more eyes on that
> component.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0MAINTAINERS | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b5a4e4b35cf..b6e58a138501 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9140,10 +9140,11 @@ F:	drivers/gpu/drm/drm_privacy_screen*
> =C2=A0F:	include/drm/drm_privacy_screen*
> =C2=A0
> =C2=A0DRM TTM SUBSYSTEM
> -M:	Christian Koenig <christian.koenig@amd.com>
> -M:	Huang Rui <ray.huang@amd.com>
> +M:	Natalie Vock <nat@pixelcluster.dev>
> +M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
> =C2=A0R:	Matthew Auld <matthew.auld@intel.com>
> =C2=A0R:	Matthew Brost <matthew.brost@intel.com>
> +R:	Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> =C2=A0L:	dri-devel@lists.freedesktop.org
> =C2=A0S:	Maintained
> =C2=A0T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

Acked-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

@Natalie, @Arun Do you have a presence on dri-devel IRC? If so, Nicks?

Also what is your stance on merging pages to TTM?=20
1) Requiring an explicit maintainer ack, or
2) an R-B from one of the reviewers/maintainers and no concerns raised
within reasonable time?
3) drm-misc as default merge repo?

Thanks,
Thomas
