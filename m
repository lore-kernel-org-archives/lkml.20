Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1804D3BD22F;
	Tue,  6 Oct 2026 07:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272190; cv=none; b=Ggnb0jo1W4Be8dEG0mdD72ZS3KdriL/PQ6x/vYraCJX7remiWNqFhCNWHm6TY1kzqeVmAwMalaI1UB536I/z4oY1yP+DijHdnybpJ2E9TMpVliz3skxUcyzjUfpyfAKEH4r/DOUQ9EtgafNCb6NA2+MVYh1AJoY6hEIshb+272Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272190; c=relaxed/simple;
	bh=yeWaKhrm+WR9bLBovNZ3j0cg/B3ktN5heCYTCG/FzqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yw8TJ07TvRa2BxlJ2GbG2yATnqpeGnn7CPUvrOQl66HiaTQsaJT7Z0jBdfxI5CQzhSN8WCzRbNpTBGNWbFtvVyeewrg7kcj9sT3AQLNIsI3TPiV/A+a0M82FiomyXQzPEN02MadQOxJXI1k6aQ5TT0yiCxbz8XQ1l9Z0L5+I2Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IrBTefDs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IrBTefDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791272186; x=1822808186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yeWaKhrm+WR9bLBovNZ3j0cg/B3ktN5heCYTCG/FzqU=;
  b=IrBTefDsyd76w6JZGswrHSc2LISTKP6Dn2jfcPKWzPa/hKPQoFzd8cm5
   Ji9NdyM8s1YwLsxrOHPDBCY5EpfGVljFvfWuTk9WD0IqVEc+3w653Znxh
   KpP8r0MBg4TNhl8JfzfKVTIf5fmMq4F+SuVAg3NQSk0Uk+3+qHyNaryOX
   GVuE2f6q1vfw9QYnUwB3n8dJ8wQRhpY0psvCk6xWYhZghXkQAGZavIr3l
   kU+CABV54fB9CtnySJxifXPBU+TfrqJe9yNUJOdG80EUQ2eBcigjBJ/8f
   WmaKttD2fWEXOtx6gTtflTvlkRlqaI6AUOZpFJIdfv0sTYuA5jJXKyXRL
   g==;
X-CSE-ConnectionGUID: GGl7k1lMTKWp+f50kLTs/A==
X-CSE-MsgGUID: Lm6SlYnNQkWdiAZmaG5vug==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="8866"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="8866"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 00:36:23 -0700
X-CSE-ConnectionGUID: fvjocqIcQz2EJtYqpGak0w==
X-CSE-MsgGUID: nRfyIxf3T8C0XksoKhGq4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="1105882"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.66])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 00:36:19 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5D586121BCD;
	Tue, 06 Oct 2026 10:36:20 +0300 (EEST)
Date: Tue, 6 Oct 2026 10:36:20 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mirela Rabulea <mirela.rabulea@nxp.com>
Cc: Rishikesh Donadkar <r-donadkar@ti.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, mripard@kernel.org,
	jai.luthra@linux.dev, jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com, laurent.pinchart@ideasonboard.com
Subject: Re: [RFC PATCH 6/8] media: i2c: ov2312: add Omnivison OV2312 driver
Message-ID: <asSk9KW-lzuiUJa3@kekkonen.localdomain>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-7-r-donadkar@ti.com>
 <e469d168-39f9-448c-a7ab-5d02b79d8cb8@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e469d168-39f9-448c-a7ab-5d02b79d8cb8@nxp.com>

Hi Mirela,

On Fri, Oct 02, 2026 at 07:16:11PM +0300, Mirela Rabulea wrote:
> Laurent, Hans, Sakari,
> 
> did you encounter similar situations? Any comments or proposals? The concern
> here, to summarize, is: v4l2 control cannot be committed to sensor registers
> right away (even when streaming) and we are also unsure when the right
> moment to perform the register access may come.

In practice there's little the kernel overall can do about this: the timing
of everything is handled by the userspace. Drivers that aren't directly in
control of the data path don't even have frame timing information and even
if we did pass that to drivers, I²C writes always have some uncertainty
(system scheduling, I²C access failures etc.), so one needs to be prepared
to failing to do the writes in time, which would further complicate the
UAPI.

Do you have libcamera in userspace or something else?

-- 
Kind regards,

Sakari Ailus
