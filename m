Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624522;
	b=hjmyXU1JPEKtHSWaxYIr8boCVXSTY0pKIplZT2tUqnfoRTS+rwNmAZXk3Jyv25Dcvul8
	 9Cz79zTJfPkAicdAB8TdSXBvLN55Pc7EcwzclGVZ51wCrnauv+U7yrvo37CtjvHit/2w/
	 MT05fUhr8waKhvTanTitNXVPOtr8WPLma21gA0yKOGSDdEzd70NlWddYbZ6ERWuOR6dZ3
	 bXgwKlOIuzAq/t2xcmxJlh6a9Ues5FSB+1InKKSWsZUnSjS1KFmKge6clH9y+tdbYoFKn
	 U2CF3pYZbuhTj22vUpWH09lS0jZoTVOKY7wl1zCewIa6h9whIBWHrnII8w/9eoAdh/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624522;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=leq0DqS95SZbhvs0zPGL1F/cnThHuoW+KqjrbgyEk+8=;
	b=UYrINW30ghMuptnYOOR/oOb2W+yVAF8dRCxH/u1t2Sc49JYA6i2zY4KxhjXOBQigdrg1
	 0Z7JmsUt/TaUYGcqFUzvfOOkD5MVXjLVUdhoT/1gDatwlBhjuYzdpaKbRMOdFP2Ltb9Fv
	 rxtUSpDELtW9Uqs9Iuw4HbOQERUynZWfIT49hKa7f9Wg5Wljeg+/LMOeHmqaXj6Ja0chd
	 chRny0TozqZyswk181p4HkiO8/6bgVi7Qcax4oPOl6RtImuorvNwxQsJRTTub8EPJkm5I
	 stU1Az2pl54jBBaO2GQe8BF3LctHmNI4x/6ZdIQhqS1b9iakefnFAioKRfzAm29wZoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=inxstQ9z;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5038B60A2607;
	Mon,  2 Nov 2026 13:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5038B60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=inxstQ9z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793624521; x=1825160521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=drxTo++OZkH7kBDSpfcynKa97bsiB9evM2el8QcMEC0=;
  b=inxstQ9zkCPbKo0XIQD8fAz6Nf5J1OBtT0ABo9NTTra6B6CVOD5iLbQm
   vJOemDAhe/7+V5yZxwnhlpV+x5i/+ZVF47CQMlZFvb/A4YwFiXStGoUgd
   CpdTxqSJzjC0fXWikU3oMAjfd9tEan5cAihFQFTTO3gYKZ6UcIsRtkJUx
   vNLhJIP7HXeWWlJwOsxCY8ywSGEWhH9TkTNnYcHVFef0+y5PdGMVWqNeW
   GCyajC5aTI4N0ivHYc04ZO8L6/Gub0JLkLKGyFAIohnoZ9B3R4wxIM2J+
   t3Vl8SP/CVaNmGR2AFra+jTiSzAfHGu3B/30ncqh7gl23fn6sjwpt4/HV
   g==;
X-CSE-ConnectionGUID: CAD3kndnRr2sQRePeaitig==
X-CSE-MsgGUID: /VdsOSavT2CRh9rJp7+Uqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2191421"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2191421"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 05:01:49 -0800
X-CSE-ConnectionGUID: 7v3+O6SmRse+47iagkBWOA==
X-CSE-MsgGUID: FVk/xTTMQl2oCXXGju5lfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6449554"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 02 Nov 2026 05:01:46 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 236A699; Mon, 02 Nov 2026 14:01:45 +0100 (CET)
Date: Mon, 2 Nov 2026 14:01:45 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: diego.sure@gmail.com
Cc: Imre Deak <imre.deak@intel.com>, dri-devel@lists.freedesktop.org,
	Uma Shankar <uma.shankar@intel.com>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Mika Westerberg <westeri@kernel.org>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] drm/dp_tunnel: Allow BWA when the DP IN adapter does
 not advertise it
Message-ID: <20261102130145.GU158991@black.igk.intel.com>
References: <20261031-dp-tunnel-bwa-flag-v1-1-f94ed3179349@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261031-dp-tunnel-bwa-flag-v1-1-f94ed3179349@gmail.com>

Hi,

On Sat, Oct 31, 2026 at 01:18:18AM +0100, Diego Noguês via B4 Relay wrote:
> From: Diego Noguês <diego.sure@gmail.com>
> 
> On an Alder Lake host (i7-1265U) with a Thunderbolt 4 dock (Dell WD22TB4,
> Goshen Ridge) driving two 4K@60 monitors through two DP tunnels, the
> monitor whose tunnel is created second is limited to 4K@30. Which monitor
> is affected depends only on the order in which they are powered on.
> 
> The thunderbolt driver enables the BW allocation mode (BWA) on both DP IN
> adapters: it sets the CM BWA support (DP_USB4_DRIVER_BW_CAPABILITY), a
> group ID and the estimated BW. The DP IN adapter, however, never sets
> DP_IN_BW_ALLOCATION_MODE_SUPPORT in DP_TUNNELING_CAPABILITIES (0xe000d
> reads 0x01), so tunnel_regs_are_valid() rejects the tunnel with:

Alder Lake firmware really does not support this and by forcing it to be
enabled you may end up in untested code paths and interesting behavior :)
BWA was only officially supported starting from Meteor Lake.
