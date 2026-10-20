Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493245;
	b=NtxKBT9B5svuWqQy8wR53xsrvu9GuMEx7Fq9S5hPcAYcOWA39jINquDLJAtj3GPnppa9
	 8c0MBZG+/e+VkhHvfgts+RDN1vLHiE2zgJFvwOpIqVxDmN4jXLNGs4c1ihPQIS8BfuRTL
	 v8uu0bcc81vFEFtMtP/2LKdijcw2tg68qhO7F7DtiFWdKEOgOMByYZmsNvdrqsMJp+OB7
	 ZAYojK8+HGuf9P8fwYNaEenGcpQrFXpictGw0oTIidybmuOfsf6ngmAHmJFQJmrd94DB3
	 bN6dc51uWrH8skmqizDBcsRlaUPpjalk7EFmdVmkYfduW4DnB+nXaUV/9m9ReAwSTfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493245;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=T6PCA4AXVWnGr3KDtpdwCDBebnMz6ofbTp9ca/ejWPE=;
	b=lll4zLgo6cSViBuF5CzheFs5FC7/e0Ucx4QSXB90X9vJNF7MLjQ6oYdPJyI1jH78o9mD
	 6U1PkrKdmZ6OjBLySg3eTGN4fRjSugkMFaKgT47K+Lp4b1ZxV3QHvxBZGWE1vWzTiT7Nk
	 8/WUnG8kyiYUOyM0G3yG5LiBjnOEOL/F27L9C/EOAitYGSyTW9V2T08b92MBzFWn380n/
	 2uq54MQXxmtIHX/q/JFPPRbawUQL72l2tVaoYEpuiW5k7X8YFJPND0Hs9LG5ALSEjxHFW
	 Jjzkq3c8EkzM33HOFxcAws6hCfz2M2xg6obBE0rr9lBhzTjnKCVMJoGSSQ6X5+Hw8QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F9E606A323;
	Tue, 20 Oct 2026 10:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89F9E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792493239; x=1824029239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gUEShXSjQiSvijsLSsznVTUFecw+QGpAx88VySy7BmU=;
  b=Q2H4wOkiYoFQgeJ76yKs6HDS0NpsSI6RBKupM4yZuySjh82jtzQPC+B2
   TFMrhulmTSYHqTdl6WM2/4xEX6AQ1q4ap8upfE+MXoDjkivnuxscexqU1
   w2rT61ef7GTt/55Yjc/S4Az6NhEPNikLR117SxjfkcuWJrFGw4RdFrCVF
   XizESiwf6ev6pndv6mo1D0nSHnXTgDEXEac9pSvJ4CKWRlZMkmwvtcma3
   htEW+BgUzCOKiq1QEkVpP8uaDkTLYQJ5jfm79FysQVlx8ba4fVz4gEfiA
   VRtaQ8o5HmHewKVs98OGpOVJcLoHHnI1Ppr1LxXYxlHhdyV48B8mMw6N7
   A==;
X-CSE-ConnectionGUID: 6vApGq+dTNGHraElU325AQ==
X-CSE-MsgGUID: xQ2i/eVRTtWtUpynPIwzGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1295641"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1295641"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 03:47:18 -0700
X-CSE-ConnectionGUID: C0jt5v0ORH2kuEBI/tA1uQ==
X-CSE-MsgGUID: pHHu8Q3ORiKNXvyiK3uGwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4539917"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.132])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 03:47:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 05DF011F7E8;
	Tue, 20 Oct 2026 13:47:12 +0300 (EEST)
Date: Tue, 20 Oct 2026 13:47:11 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Lachlan Michael <lachlan.michael@sony.com>
Cc: mchehab@kernel.org, hverkuil+cisco@kernel.org,
	laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, kieran.bingham@ideasonboard.com,
	jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com,
	Kengo.Hayasaka@sony.com, Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com,
	Yuji.John.Takahashi@sony.com, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 2/2] media: i2c: Add Sony IMX908 image sensor driver
Message-ID: <atdGr8S2sf1kZFUw@kekkonen.localdomain>
References: <20261019014720.2635-1-lachlan.michael@sony.com>
 <20261019014720.2635-3-lachlan.michael@sony.com>
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
In-Reply-To: <20261019014720.2635-3-lachlan.michael@sony.com>

Hi Michael,

Thanks for the update.

On Mon, Oct 19, 2026 at 10:47:20AM +0900, Lachlan Michael wrote:
> The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
> output interface. The driver supports RAW10 and RAW12 output formats,
> exposure and analogue gain controls, image flipping, blanking controls
> and test pattern generation.

The imx908 appears to be a Starvis 3 sensor. How close is it to the Starvis
2, for which Dave (Cc'd) is working on a driver (see
<URL:https://lore.kernel.org/linux-media/atdAsDGw_jvhaydM@kekkonen.localdomain/T/#m0c50ea017ef9ae0d3d76a36b840db9b6f7ac296c>)?
The register defines in the two drivers appear to be quite well aligned.

-- 
Kind regards,

Sakari Ailus
