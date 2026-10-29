Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259124;
	b=xRhInLnLCUKqcXoKU5hIXdKkP1w/b14q0pSOmPI7TqvXTFAj8Zmbzlqs3brD1bdgbtIU
	 hC2vP1bc4TpW3vQvDpkWVTD1cKwFFSyoDOdFrqOxqdhlXC/rhgaDUzATzKQ0cba8PyAgl
	 I+9tIKkp6nBLcuiQ4mAuFvvvhpAd9T32a1h+mWkqYCZh+Pu0/LK5ke4MyF4qEn5aaBEw2
	 Q82EZvAPWXq/QJAfFxBldsQZJP4/Fu5VFglJMmMTSetk2twusJiFTnnTroJLyx/ZMg20S
	 pTBuI8F+ITJe8M2cP0kwYIE/5VLjRIAC1Mxu2x6cJTmu1hNimhFVhKuR3VPAfmFmmPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259124;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:In-Reply-To:References:Subject:
	 From:Cc:To:Date:Message-ID:User-Agent;
	bh=kI9itzE3pzd8o1Sk2Y/PJevHoWAc66tjRfw0+KdhkEo=;
	b=LN4z4JNuhL86ZRD3V8TH26u1obuxbwxhWJeU3+aAz3uZgcQnKB6groTX9XHMpY5IqNjq
	 o9WjVUrYzPI2UX1dGFROpUuk2N9xn9akI0rzMOUQinOnUWSQNsInjE4ur031s0wkLcuHv
	 eP7YD9X/NuB8DTOTLL7VEWgmQHT0IS7y8GUmChAAGWvrSHHXyvTrsNg88uu2SsAg5n0bv
	 5aISUmiDE/eVF2WfSYYA1Atgp/zSp30V1refqx6B8Vmbucx17nGKABSkPvReTQdMihpBM
	 Q1vwsF211zdng+zBXAfltFQCBqLYJIVj92QbhRF1xhcFHPF9SqsVf7YnVuBdTxZATsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fqQPfeyM;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DBF606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05DBF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fqQPfeyM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793259125; x=1824795125;
  h=mime-version:content-transfer-encoding:in-reply-to:
   references:subject:from:cc:to:date:message-id;
  bh=kI9itzE3pzd8o1Sk2Y/PJevHoWAc66tjRfw0+KdhkEo=;
  b=fqQPfeyMtpQM4SRVFD0k8++yi14rmHqTmxO28vPLusD8sNcjLxHfB0BE
   tOCCD/Et/PPE0aL9vcjA4+3+IZxqUgorFRrHtyFVP83HSlJkcJCpgkx9p
   UzQXFBTC0z72iHlofrgFzcDL2j+eWTCFP5cXtdS8kfyOaY9MKVP8nX2/M
   OnuAY5yUQl8kBct27v5XlqeE/RX9S8flNPfMkqPDukeq+/ehx3KGljSm5
   1g5QO/xpaocJorvhDofTJLcUAbzRc1T2VM/fsVmKmhKRwUt954Zr+kJWk
   GrSCgPLbGTGdPxB5Xy/6PoSkwL/QAx7I47HL8e4Mcd6wBgKd4INL2Cgtg
   A==;
X-CSE-ConnectionGUID: 2s70+bHyRUapvRPe8KnSzg==
X-CSE-MsgGUID: 31ZTtRUXSfqk4c95ZzJHPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2020475"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2020475"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 00:31:57 -0700
X-CSE-ConnectionGUID: RfMURdUHR061njZ7FUhxzQ==
X-CSE-MsgGUID: /5SfG0usTFeRrj1io4nbJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5401957"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.62])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 00:31:54 -0700
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <auHeqGZ-hm2lS7Nk@zenone.zhora.eu>
References: <20261027072832.726435-1-yaolu@kylinos.cn> <auHeqGZ-hm2lS7Nk@zenone.zhora.eu>
Subject: Re: [PATCH] drm/i915/gem: Reset err for each fence entry
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, tursulin@ursulin.net, simona@ffwll.ch, chris@chris-wilson.co.uk, lionel.g.landwerlin@intel.com, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
To: Andi Shyti <andi.shyti@kernel.org>, yaolu@kylinos.cn
Date: Thu, 29 Oct 2026 09:31:50 +0200
Message-ID: <179325911095.16507.8295053984620715316@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620

Quoting Andi Shyti (2026-10-28 13:39:14)
> Hi Lu,
>=20
> On Tue, Oct 27, 2026 at 03:28:32PM +0800, yaolu@kylinos.cn wrote:
> > From: Lu Yao <yaolu@kylinos.cn>
> >=20
> > If dma_fence_chain_find_seqno() failed once, 'err' will store val in
> > the following loop. May causing returns '-EINVAL' even though that
> > entry never called dma_fence_chain_find_seqno() at all.
> >=20
> > Fixes: 13149e8bafc4 ("drm/i915: add syncobj timeline support")
> > Signed-off-by: Lu Yao <yaolu@kylinos.cn>
>=20
> pushed to drm-intel-gt-next.

This was pushed without any R-b, DIM should have given you a warning
when applying the patch.

I've reverted it for now, please use DIM and check the warnings before
merging stuff.

Regards, Joonas

>=20
> Thanks,
> Andi
