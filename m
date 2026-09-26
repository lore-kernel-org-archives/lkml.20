Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F7728DB55;
	Sat, 26 Sep 2026 14:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790433029; cv=none; b=YF09dhfpPv9gy8eRAZgkzqmzuMkkhqaz+KNiabRtOWs/B9ZrTEPhI5YK9qk8tFfYFnMgWPpqKgng0lk4+vQRk1xlatnjNKdljZfSYJ/Mp92e3268Wsy7EvgEiz3BDcBKazcbLk1zVz+Mlb8llNIlhrczN+D7zVY03PZHDriY3ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790433029; c=relaxed/simple;
	bh=5OUwhCAJxeTYtuOFGq+98In/t3e8+SuwLlaouQgWS/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXZ9rTfZk5jWbrlvpONIab2lZDEbrlHr3g2Fdu+NOsT6DQ/ipIlgaIXhmAlVnrzp1uTL50M+tyXW4+tINRYwKXndwTghO5mNpvvrPcAm/7gnfB6AO4cNDGEXffZ1OxSypBpdI5/VekxZ3VhXqdtOBnFOUtDR28AtyUUjcwjijWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVz4BVtj; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVz4BVtj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790433027; x=1821969027;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5OUwhCAJxeTYtuOFGq+98In/t3e8+SuwLlaouQgWS/Q=;
  b=mVz4BVtj5NmR/3s0jV3nJeuizK5hXec+SK0AJX1XSX3UOL935oqqf475
   pWR2g3RqDWyJvZpubYnZ3+WAlTp1fxLHVm19NN4jMQQYSMlbnzF6Lq2TI
   SvKk3cEyt3MukSCUYugpdxPkWY6FEwAxrT0oRTjH7gC8PT1tbI8sEicU0
   3MDO5VbMy+JG0Nkd21qSEXzLUp/rNuMJyNdl4+q0Xbyd61N/cGnuO+psI
   U448WyLJ75LTlHwXiOSG0njwgeazX8J4mqf+JbPzHu7N5tnWkOtlODaDM
   zX0wpuQdivha4e9PVzy44OpVky0m6qfmQl9FH5PTIazCRMxo+IWAd5lC0
   w==;
X-CSE-ConnectionGUID: mq1XwV/GRGCwvrnjXcqApQ==
X-CSE-MsgGUID: WrKfTY8CRzmDADWoAtzblw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="101367853"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="101367853"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 07:30:26 -0700
X-CSE-ConnectionGUID: 2Bdoerq7Q5+MUd/FkX7RlQ==
X-CSE-MsgGUID: J0/rUETGSXCDE/l23z38sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="312515518"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.219])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 07:30:21 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C1E13121BAA;
	Sat, 26 Sep 2026 17:30:22 +0300 (EEST)
Date: Sat, 26 Sep 2026 17:30:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, mripard@kernel.org,
	jai.luthra@linux.dev, jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com, mirela.rabulea@nxp.com,
	laurent.pinchart@ideasonboard.com
Subject: Re: [RFC PATCH 2/8] media: v4l: Add 10-bit RGBIr formats
Message-ID: <arfW_sncBRNsyP4L@kekkonen.localdomain>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-3-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925133001.2780868-3-r-donadkar@ti.com>

Hi Rishikesh,

On Fri, Sep 25, 2026 at 06:59:55PM +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> Some camera sensors now use an expanded CFA pattern to capture near-IR
> light along with the visible spectrum (R,G,B). This allows capturing
> light in both low-light and day-light scenarios using the same sensor.
> 
> Instead of having a 2x2 repetition of B,G,R like in older bayer formats,
> here we have a 4x4 repetition of B,G,R,Ir where the number of G pixels
> are the same, but half the B and R pixels are replaced with Ir. Thus
> instead of having 4 total phases, we now have 8 total phases or
> re-arrangements of this pattern.
> 
> Co-developed-by: Rahul T R <r-ravikumar@ti.com>
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

I think we need to use the common raw mbus and pixel formats for the
patterns that have IR pixels. See
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>.

That's mostly pending on userspace support now.

Can the sensor output Bayer pattern as well?

-- 
Regards,

Sakari Ailus
