Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A438F3C3F4D;
	Mon, 31 Aug 2026 09:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167019; cv=none; b=kBTv7M1aoqpX8C6Oega8kRM/q0F2XDLpo/IVYgMWv90q84ysEn0r4iiI/XhbfOQvmqNXithrH2l7e1gHwt021SNwA71FihuLpOKmko42pj+U3vR7VVaqnXq2VZkvEqTWhKrZZGpEsv9sPVC7/h8fgMUTR0sYVZthjHKeIcs5HSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167019; c=relaxed/simple;
	bh=UWRyi8MBOvpZP5d5EPnNZVwGC1MopZkbgEBGc3X2MJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLuAAwlg4kM1H8luDOV1goYU/ZZJ+h+9yavL5MEjZE1r+hvgnDRXgf1417jTkPdxEFrH4o9X/ANYRzWZ15DQ71tQn3k10xFsBh2O6bgRUT4uYcg+4XrdYq+oNRwhd9kYh/vW1/9PS8/911JK9X5YmXYYLhscm/ckVO/UE66aoD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHWSX7fh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHWSX7fh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788167016; x=1819703016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UWRyi8MBOvpZP5d5EPnNZVwGC1MopZkbgEBGc3X2MJc=;
  b=WHWSX7fhXWHZTr3Bn/ilDthZ9sTW9FDLS7Ff3EMdKU72RDjrqKrCXjbo
   nILcJ6Xzz5CPyy28dSBpAk/BZp5X/wXKQibF7Xfr/x+whfgJxW/PMBM8R
   vYaEs3MHw/g9fyyE65ONV3g30KfKyo2Y4ZLHoP0KslH2cJYRb8RWhVNKo
   UvQ398Iji+efsGJq0t4HSNGDBtmAyI/WWE9wm+UDlaR1OYxs/LYdEsW3s
   MP4AsvSgBY/ocfskiTe7FGpIpOxjBKqz2EHzN0t5gTRNg9x0j87mnpb8r
   3P+lag6eswTHgUA1MsSiV4Si+5lU48GVe25gBPqvkjtTLPpxP6/9s9FLq
   w==;
X-CSE-ConnectionGUID: hHsL8+SdTzmof4yhOFVg/g==
X-CSE-MsgGUID: 0ywy2UamQGq+5LRBQCzO/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88445285"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88445285"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:03:36 -0700
X-CSE-ConnectionGUID: Vta1Axp7TBqI/7ITl7PqGw==
X-CSE-MsgGUID: xAsjCUWPSr2+7xVAahy0pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="268793399"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.87])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:03:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 32D2411F894;
	Mon, 31 Aug 2026 12:03:31 +0300 (EEST)
Date: Mon, 31 Aug 2026 12:03:31 +0300
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
Message-ID: <apVDY4tH-UC_0pml@kekkonen.localdomain>
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
> Observed behaviour (live, 2026-08-27)
> -------------------------------------
> Attempting to recover a wedged ISYS by PCI remove/rescan:
> 
>   echo 1 > /sys/bus/pci/devices/0000:00:05.0/remove
>   modprobe -r intel_ipu6_isys intel_ipu6    # ipu_bridge unloads too
>   echo 1 > /sys/bus/pci/rescan
>   modprobe intel_ipu6

I recall unbinding the ipu6 driver successfully in the past. Do you ensure
above all sub-device drivers have been unbound first? I guess the V4L2
framework nor the ipu6 driver necessarily ensure that right now.

In general, unloading and loading modules may work, and in this case there
are lifetime issues to be addressed (MC device, as well as V4L2 sub-device
nodes), too, but for testing purposes this should just work.

-- 
Regards,

Sakari Ailus
