Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91174E0210;
	Tue, 29 Sep 2026 14:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692829; cv=none; b=qWxCYDqLu5QFFQzI9aG1ZyB+hXCKXwVLD+wRNVFOFPK5GTvwwwIfsMbqpyPHqFhjIi9oTgvQ9DEMQUf081QmmXG2Gz61ogBgQBhwuc2N6WGtIuvY4mz8HVDH45vbN2wlMNZzTKsqwEysIxYOtce/ewYmGv8WSN2N84yi+RLuMj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692829; c=relaxed/simple;
	bh=bf+J4oky3bF94JcGs4eYrahBGZ1RmSsGSPGHqV+7oGQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RjUHRYllmwuMKPiHoFA98sR3lnvpUJ7pjaDDgfqNr5FK4Dvwhz5gwRc0lfMrTws32xonL9uR+qFtOMOMuNmS9ac34NfJEIY9P0sOLC2NzZD07PQsk9g5kVctK6RoXJmCkXQJqygw5oUMh0Ho1WeMuvQrhVtrE8UGqQjX7zzz4SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBcwj+r5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBcwj+r5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790692825; x=1822228825;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=bf+J4oky3bF94JcGs4eYrahBGZ1RmSsGSPGHqV+7oGQ=;
  b=lBcwj+r5yN4k6m8NCbxzdX/pL570VCJ+9BWpBr/mCj7+JrUOOTzNPQ/1
   MhUZpsJ6Li0o2+VKbM44ItdwcaKkXOBES0EmCPABleULB7ZuBOc1JzHzB
   zNwBrqFDbDFdBjo7sgQ+SIwkes/ty88WSxsEVaZKVfgKe5eHifhMFd97J
   Ru1ZoPh5+3TWbha/O0MqV0VD3lJXe1xaxIy/r/F4zJluZFCDrnEMVB0bd
   N7ORs8B9JjieeA9N78Mp28HiD7qXgsr/yGi3QjIqzHSM1YEbGLWtdLLam
   XiNNk5rJqqE23vk51DeaReHNglAIBr+uB8rtuLOBenFIQibrNNMVL5q8J
   w==;
X-CSE-ConnectionGUID: Pw7WcpmlSFiDShBwmcHC1g==
X-CSE-MsgGUID: EcmX76+wRn+E5q7czOf0IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90364793"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="90364793"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 07:40:23 -0700
X-CSE-ConnectionGUID: y411HtLjQQ6oWFENc8NpaQ==
X-CSE-MsgGUID: FALEyBJ+RCqBiW1PFlie9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="301663530"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.233])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 07:40:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, corbet@lwn.net, alexs@kernel.org
Cc: dzm91@hust.edu.cn, wy@wyuan.org, si.yanteng@linux.dev,
 srcres258@furdevs.cn, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chen-Yu Yeh <chenyou910331@gmail.com>,
 Vegard Nossum <vegard.nossum@oracle.com>
Subject: Re: [PATCH 4/4] docs/zh_TW: add missing :Original: fields
In-Reply-To: <20260929131020.266120-5-chenyou910331@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260929131020.266120-1-chenyou910331@gmail.com>
 <20260929131020.266120-5-chenyou910331@gmail.com>
Date: Tue, 29 Sep 2026 17:40:18 +0300
Message-ID: <c719c6756f345c6c39db483654578ef09de1948f@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 29 Sep 2026, Chen-Yu Yeh <chenyou910331@gmail.com> wrote:
> Every zh_TW translation names the English document it mirrors in an
> :Original: field, except these four.  Add one to each, in the plain path
> form that automarkup turns into a link.

I'm wondering, are these :Original: fields useful anymore since the
translations extension adds the button to switch between languages?

The pretty much hard-coded expectation is that the English version at
path/to/foo.rst is the original, and its translations are at
translations/xx_YY/path/to/foo.rst.

I.e. neither the HTML nor the RST benefit from it, and it's just
repetition.

BR,
Jani.

>
> dev-tools/sparse.rst still carries the old plain-text header rather than
> the disclaimer include, so its field goes at the top of the file.
>
> With this, the only .rst files without the field are index.rst,
> disclaimer-zh_TW.rst and glossary.rst, none of which translates an
> English document.
>
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  .../translations/zh_TW/admin-guide/clearing-warn-once.rst     | 2 ++
>  Documentation/translations/zh_TW/admin-guide/cpu-load.rst     | 2 ++
>  Documentation/translations/zh_TW/arch/index.rst               | 2 ++
>  Documentation/translations/zh_TW/dev-tools/sparse.rst         | 4 +++-
>  4 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_TW/admin-guide/clearing-warn-o=
nce.rst b/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.r=
st
> index 95614600604c..15d54440d224 100644
> --- a/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
> +++ b/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
> @@ -2,6 +2,8 @@
>=20=20
>  .. include:: ../disclaimer-zh_TW.rst
>=20=20
> +:Original: Documentation/admin-guide/clearing-warn-once.rst
> +
>  =E6=B8=85=E9=99=A4 WARN_ONCE
>  --------------
>=20=20
> diff --git a/Documentation/translations/zh_TW/admin-guide/cpu-load.rst b/=
Documentation/translations/zh_TW/admin-guide/cpu-load.rst
> index 20ec5bcd5f18..13f03195ac7e 100644
> --- a/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
> +++ b/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
> @@ -2,6 +2,8 @@
>=20=20
>  .. include:: ../disclaimer-zh_TW.rst
>=20=20
> +:Original: Documentation/admin-guide/cpu-load.rst
> +
>  =3D=3D=3D=3D=3D=3D=3D=3D
>  CPU =E8=B2=A0=E8=BC=89
>  =3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/translations/zh_TW/arch/index.rst b/Documentat=
ion/translations/zh_TW/arch/index.rst
> index 7c0490589465..724468687c20 100644
> --- a/Documentation/translations/zh_TW/arch/index.rst
> +++ b/Documentation/translations/zh_TW/arch/index.rst
> @@ -1,5 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0
>=20=20
> +:Original: Documentation/arch/index.rst
> +
>  =E8=99=95=E7=90=86=E5=99=A8=E9=AB=94=E7=B3=BB=E7=B5=90=E6=A7=8B
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20=20
> diff --git a/Documentation/translations/zh_TW/dev-tools/sparse.rst b/Docu=
mentation/translations/zh_TW/dev-tools/sparse.rst
> index 7a3487a7b2c7..7ca7fdf6e1e6 100644
> --- a/Documentation/translations/zh_TW/dev-tools/sparse.rst
> +++ b/Documentation/translations/zh_TW/dev-tools/sparse.rst
> @@ -1,4 +1,6 @@
> -=EF=BB=BFChinese translated version of Documentation/dev-tools/sparse.rst
> +=EF=BB=BF:Original: Documentation/dev-tools/sparse.rst
> +
> +Chinese translated version of Documentation/dev-tools/sparse.rst
>=20=20
>  If you have any comment or update to the content, please contact the
>  original document maintainer directly.  However, if you have a problem

--=20
Jani Nikula, Intel
