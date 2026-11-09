Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224586;
	b=1P7IouJToH7OnlTvpejuGedrIZ9HKMOKrz8j2NLg4nB5m0gKPNq2dvYINcAlTP8Bu/1A
	 OkReVTCaJKRjQORBjO6c+mJn6E5kw5Ny4cBwVl6QAsmfZjo6pQ5clxMiV0TTsPmREYn5I
	 EjOfEAab4JdOAnn+fY35NiUnOF9B/LPV8iVCKxAF1ngP+axAGagAjpjVJg9L+R9PGS6QK
	 Y/DkcN5WQ5zy7RLVInMSUX1YjV7/FnyG1nUBDCqZOxIl172LwmWGJBIA/u648Vz5A6bfv
	 BL9xxEbN0CUJ3/cbKUJMiZ5PvFrcxkNAOL6VqHA0wZp+eadvQS0KXxOjAksPuz+vnyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224586;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KmBZRsciR8DPhlZqPxESh6IpeTD/hkndOkOwZa7ckLo=;
	b=o6jVtB7hLs5wVexXrqgUtl5uttzK31TJeS7NmuI2MnMIB9nGQWhP3r4OrABGNe6Z1omQ
	 CCj/dBRQMVWuB4nLmWBm4sGi0U57NawsLeRYNEyf8Y+jrBCq5+5hqwjM+mLa5UBBDjtD4
	 sC7t2xtP0xeJz5/1SLyS2iH41b4fcTb4VOlbZKd/BC2xmc3migNSlU71NzPYM6killT0x
	 y3MwOdHTBw6Dp/HrFGo8v9SbOnDzgmAgd1Mf/9jJNqFJiOQmVe9kCmdqALWZOCaknfOOS
	 qZjjBRr0Uj+8aMeWtiwLiaLDvjjJYksKwfilAilHjbnZj5PgM1XZQfdhIBxmei53k1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Aw01t8gt;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175C0606A325;
	Mon,  9 Nov 2026 11:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 175C0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Aw01t8gt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794224586; x=1825760586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cTGzfwzQVoiq9hsl0Sc5mq1pROanVaVZp3VqGiIUImQ=;
  b=Aw01t8gt292nCZN/SVzuUPO085ai0WerStmwRq4bwdS9RwgvQaKVGbUt
   hrGicbMj9cjkCISYIkq8pQgk5599MfOFjCT/FGlYgDdHZLl6MEzqGk3PZ
   aHV4ULCyTiizCo5sGrFnb3OeVQSWY94WsMAwIk8VOexyyu2UgAdQX+9nt
   10Zu09iWCLwV7JdMHZboAhJNxtV8BB77FkKxqA1ugI3LkGBjYUed+ILpN
   NS45FKMrPBtxWLurhbqGbCK8nq+10FeK0IUHZtI5oVpgzqKhkOvrwu4zl
   2g6vIiZGDaSdFg2EaN3bmHWLd+Eu8j5Q562bsgP9OQjC1tIe/E11mha0B
   Q==;
X-CSE-ConnectionGUID: 5OtIJPy4RsuPnvXNMsHN6A==
X-CSE-MsgGUID: wiSN13ArTMOXqZWawBAohQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2976523"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2976523"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 03:43:05 -0800
X-CSE-ConnectionGUID: mTkSe0LDRhu0+2X+gxR/XA==
X-CSE-MsgGUID: ZAnfzOVLSSWAbwl7ayJrgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7726200"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 03:43:03 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D2103121B96;
	Mon, 09 Nov 2026 13:43:00 +0200 (EET)
Date: Mon, 9 Nov 2026 13:43:00 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "D. Manresa" <dmanresa@gmail.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] media: ipu-bridge: don't reference the module
 image from software nodes
Message-ID: <avGxxCtAsVYKFxSq@kekkonen.localdomain>
References: <20261010155626.2766298-1-dmanresa@gmail.com>
 <20261010155626.2766298-2-dmanresa@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010155626.2766298-2-dmanresa@gmail.com>

Hi D.,

On Sat, Oct 10, 2026 at 05:56:25PM +0200, D. Manresa wrote:
> The software nodes the bridge registers are deliberately never
> unregistered, so that a later rebind can reuse them. Nothing reachable
> from them may therefore point into the module image, but two properties
> still do: the "link-frequencies" values point at cfg->link_freqs in
> ipu_supported_sensors[], and the "lens-focus" property name is a string
> literal.
> 
> Both dangle once the module is unloaded. Re-probing sensor drivers then
> read poisoned link frequencies from the surviving nodes and fail:
> 
>   ov5693: supported link freq 419200000 not found
> 
> Copy both into struct ipu_sensor, where the other property names and
> values already live.
> 
> Assisted-by: LLM
> Fixes: 803abec64ef9 ("media: ipu3-cio2: Add cio2-bridge to ipu3-cio2 driver")
> Fixes: 68b9bcc8a534 ("media: ipu3-cio2: Add support for instantiating i2c-clients for VCMs")
> Signed-off-by: D. Manresa <dmanresa@gmail.com>

Could we have a real name here, please?

-- 
Regards,

Sakari Ailus
