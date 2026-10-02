Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AAC299943;
	Fri,  2 Oct 2026 07:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925295; cv=none; b=To6VmYvcOfdBoH2pLqnjndNGxYj1wTWQvAu29qfbpJvWpzPjrpWytEfT5RI8iB1dr8epFwUnoLjA6Ci4S4EU3uIUP8CvigsOP08ctb+UepzxRMrAJ1uJe5SSR4uA7DkhzcMeUxbCG256zUgCk7i9nMGKnhfO3KpLoLScvXhgWgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925295; c=relaxed/simple;
	bh=kADFZVHcGsVMssp/5GR/ZGeLfZVGUksbdgP3u7jjIcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cx+bWKSzx6VV0hI1qcinXmwXsn/wz/NdXB7iRFm04zdOQR1GOBaaMPjG7fE3Cnxx44Wil5REmZVNEo3n8jEGd3FBaIMjh+DCOJZyouFZvXTaI+jMkGcpaAfXHsBy/oR4G1wimFYgJkw8SZD1mjBA7UMJ7S8U6LDflf7lyivolwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLc0KELS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLc0KELS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790925294; x=1822461294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kADFZVHcGsVMssp/5GR/ZGeLfZVGUksbdgP3u7jjIcQ=;
  b=FLc0KELSf85Ysld4iyB/clKZA2IeuwjgmkPgTE542U8/jnnPmlgxBDAl
   buq1IZNp2s5wYeBXlJzbdFx7qV4CiFYvjulx7c3ZmQUwJffjfIGU08Drv
   Av6ch2pMTI3Fd1irr3ZdstYfvaoyMxR6vlHpvPE2NJ5uB4A3+5cyUAVI3
   BfzvkYAKxaNGeqv4qyTnlYAOFDT1yfFedhn5fGYIzhw33hRPIwojRWz98
   HjyLxb8qDrLcQiBkmSfKNz5L/lnGmawh01Gzngrce8jGxRusOY3vUd7an
   R/Tu5YVLbTGJQOholUzD3lTlJs6gEK25+jHyrBx10B6lLfJ735eIRka4d
   Q==;
X-CSE-ConnectionGUID: YNL7uRY3TX+x3m477eQQcQ==
X-CSE-MsgGUID: G7dZ/z0CSxO2zSlLW/04Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="79248475"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="79248475"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:13:10 -0700
X-CSE-ConnectionGUID: vuzVD8mZQkGJ8aQr9Yasbw==
X-CSE-MsgGUID: iT49og5jTfSvvrCnVbpxhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="284255412"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.205])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 00:13:08 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9CB0311F817;
	Fri, 02 Oct 2026 10:13:04 +0300 (EEST)
Date: Fri, 2 Oct 2026 10:13:04 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/5] media: v4l2-subdev: Add new ioctl for connection
 status
Message-ID: <ar9ZgBPEGxzNTSzU@kekkonen.localdomain>
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
 <20261001-v4l2-sensor-detect-v1-2-a45993be17b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-v4l2-sensor-detect-v1-2-a45993be17b8@kernel.org>

Hi Mattijs,

On Thu, Oct 01, 2026 at 02:55:20PM +0200, Mattijs Korpershoek wrote:
> The V4L2 framework has historically assumed that every component of the
> camera pipeline is always present. This is a reasonable assumption for
> integrated cameras in laptops or phones. However, in automotive systems,
> cameras (e.g. rear-view or surround-view) can be damaged or
> disconnected.
> 
> When a camera gets disconnected, userspace cannot detect this and thus
> cannot react (for example, by disabling streaming on a faulty camera).
> 
> Add a new v4l2-subdev ioctl (VIDIOC_SUBDEV_G_CONNECTION_STATUS) that
> drivers can implement to report their connection status.
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>

Have you considered using V4L2 controls for this?

-- 
Regards,

Sakari Ailus
