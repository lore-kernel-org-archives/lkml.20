Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C0C3624A6;
	Fri, 28 Aug 2026 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931205; cv=none; b=mI4qinXlREPovPeU+CUAaaGlbGBsR8twMEl6Ao6HgNSZ4Z2eh674acalxFMEkOoG00U4whS/yhu/vHKHj9lqLkBdDWX0EyCwkc0/2ysIfJw00FFGPyfthU2HeT9LeHBItVmc0jnow1sMOiv3rI6uqW0hfcQXEQThnovCRfynBFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931205; c=relaxed/simple;
	bh=6NgWIdUO7TW3wg+kWl/uGH3i1MSkY43XB+jQEjYmcXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnNPhykibHegTx3MhzDtPFaPHC/QwaCmTyPfyxIUTaqe+hZuiYBH05X1yfuLNIsFDqdQUaC1rOObQXha+XMM7yZAHyXK5YodUnR0AW065Dx94VBES8S1kiVnbhsHdrOZQ2ZAGT5NvrpeFCqUT9At8tA+Ej2pAALrmyWd7UE3J40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lby5WCvw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lby5WCvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787931203; x=1819467203;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6NgWIdUO7TW3wg+kWl/uGH3i1MSkY43XB+jQEjYmcXI=;
  b=lby5WCvwk7vc4MOnp/1SEj/5/M6+yUlUXMMua4ZRplOR+soO/yGJAzVP
   5atw8+Jz49n1ZxoXK9KsfAxEymLo/3MvxHCqbMvXaa+o1NbPaAGTQCdkI
   kol4XV3Pw81OF/xBQc3vy2DRhYYARPSRoqpk9KWYq23S7dkydu/okcRlL
   8KUC2Sj3jmYIbaay6XBLnMspGXGf5oGdVJH10pf8Ir0utxoQtf/5PdNlg
   SFa8rzTz+QnVTDuOTFZgt+o2hDOhtiLlUxljWxmh4TZPwwNqCI7aq4cgJ
   k5DHmEfm/yyNoWdng5tN7uuIMDj0QQFzpjdNBrpKXVqIeq6pVTKHZXwzh
   A==;
X-CSE-ConnectionGUID: xd7+xI+vQIacsD2MOEeZlA==
X-CSE-MsgGUID: olQrol/OQDuO7oaQnivhHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88204870"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="88204870"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 08:33:22 -0700
X-CSE-ConnectionGUID: M51a4/SSTsGBzWtmb2uw7Q==
X-CSE-MsgGUID: 8PgAiSjzTVWvL6igTkc2Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="293000837"
Received: from slindbla-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.176])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 08:33:20 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 689B9121BDC;
	Fri, 28 Aug 2026 18:33:16 +0300 (EEST)
Date: Fri, 28 Aug 2026 18:33:16 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "D. Manresa" <dmanresa@gmail.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: ipu-bridge: software nodes are never unregistered; PCI
 remove/rescan of IPU6 fails with -EEXIST and leaves dangling properties
Message-ID: <apGqPKMIk5kgqfMj@kekkonen.localdomain>
References: <20260827232636.93145-1-dmanresa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827232636.93145-1-dmanresa@gmail.com>

Hi D.,

On Fri, Aug 28, 2026 at 01:26:36AM +0200, D. Manresa wrote:
> Hi,
> 
> ipu-bridge registers software nodes at probe time but has no teardown
> path at all: nothing unregisters them when the IPU device goes away.
> After a PCI remove/rescan of the IPU6, re-probe fails with -EEXIST,
> the orphaned nodes stay in /sys/kernel/software_nodes/, and once the
> module has been unloaded their properties reference freed module
> memory, so sensor drivers that re-probe read garbage. There is no
> userspace interface to remove software nodes; only a reboot recovers.
> 
> Hardware / kernel
> -----------------
> - Microsoft Surface Pro 7+, IPU6 Tiger Lake (PCI 8086:9a19, 0000:00:05.0)
> - sensors OV5693 (INT33BE), OV8865 (INT347A, dw9719 VCM), OV7251
>   (INT347E)
> - linux-surface 6.19.8-surface-3 (base v6.19.8). The linux-surface
>   patchset only adds entries to ipu_supported_sensors[]; the
>   registration/teardown paths discussed here are unmodified mainline.
>   Line references are against mainline v6.19.

The regulator string length has been increased to 6 since and I believe
with <20260729-sp7plus-int3472-v2-1-cdfaf97ac3ad@berg.pm> (on LMML) the
camera might work streaming-wise at least. There might be Bayer order
issues though, there was another patchset
(<20260729-sp7plus-ov-flips-v2-0-91884b81a8f5@berg.pm>) addressing those.

-- 
Regards,

Sakari Ailus
