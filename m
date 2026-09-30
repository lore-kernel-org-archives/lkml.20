Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6482E1F0E;
	Wed, 30 Sep 2026 11:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769553; cv=none; b=ABswKrG+PqnAXWmanNH4SrnOZwmhZUf0qyH+YjFkr4B7RnaHrMyP4HAJgrz2+0lv+6R9NNVIXC2Np349dqBGrtFaCBsiF8nHgen1MSCd0PJL1Wp0gZuemZJBdF81jWorHGvT3LIAEJIpgnUl7GTfBkWEyBFkVrH6zi6GogvVXAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769553; c=relaxed/simple;
	bh=BOHgcZ4PSyIZcrNqgud/9Z0G8mIte3cRGS8ieMS63pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPY27yVi3/q0f8eqKANN+l90xKn/DIb8BG4H/wZxdaGgv7HBULLKCAKuPtU1xaIsFDFth8qlokGvagxneEneeX92wI4sY1SzQZCd3hSs9MHq06gpsbTlH1y1NlvwUt6Bti85meglcGlswPIRy8VppgsWogfq1zdbpEXYJUtlP7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVbBqckD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVbBqckD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790769551; x=1822305551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BOHgcZ4PSyIZcrNqgud/9Z0G8mIte3cRGS8ieMS63pk=;
  b=XVbBqckDocQUMQUrZ40M/+ImhJ7ohJ6rKvGZTB37yqWRxHdS135RQKkV
   Sw6J4+PeTk3wAwF5drpcS2wfqBRbfWlDa7PxTYTeTWhaX1Ztv0gWs8xxd
   PPeajyKNbavENkA9qxOXMMMruHqf2f5UW2zn8S7BvOj6ZxusJ8Kv3k71g
   E8+7YFj8Cdfighzl6zko+1bNBoqW0QeQInhbA/O+KbXu3ToxYrvshbmb0
   fn5fu+9ZRjEO9EMufjddylvLkmAVLFqo0WXoHkDIwTC67xF+NkVuL2StP
   pehGNW2c+alSihJ+k87Z3iw7IUR5yeQ62nt2r+vCGhi6wgRA+s/jwGOdB
   g==;
X-CSE-ConnectionGUID: Qj43hrHaRuKvRdv8XLC5bg==
X-CSE-MsgGUID: lGdMKaFzT5ecZEdJ/fMJOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="113291031"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="113291031"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 04:59:11 -0700
X-CSE-ConnectionGUID: aoImiJTmRUiPU2R/ridMsg==
X-CSE-MsgGUID: QhCwNY+aThap12M7J9SGvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="273474335"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.109])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 04:59:09 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2E91511F925;
	Wed, 30 Sep 2026 14:59:12 +0300 (EEST)
Date: Wed, 30 Sep 2026 14:59:12 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Mauro Marinoni <Mauro.Marinoni@santannapisa.it>
Cc: "miguel.vadillo@intel.com" <miguel.vadillo@intel.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: cvs: Register subdev nodes upon binding
 remote sensor
Message-ID: <arz5kIUTJ4YPuFm3@kekkonen.localdomain>
References: <AM0PR03MB4113B0FE1173B693F4598C7A918B2@AM0PR03MB4113.eurprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR03MB4113B0FE1173B693F4598C7A918B2@AM0PR03MB4113.eurprd03.prod.outlook.com>

Hi Mauro,

On Wed, Sep 30, 2026 at 11:28:08AM +0000, Mauro Marinoni wrote:
> The Intel CVS driver acts as an intermediate CSI-2 bridge between
> the host receiver (e.g. IPU7 ISYS) and the downstream camera sensor.
> When the host driver initializes, its async notifier completes upon
> binding the CVS bridge and registers its initial subdev nodes.
> 
> However, when the CVS bridge subsequently binds the downstream sensor
> via its own async notifier callback (cvs_csi_notify_bound), it creates
> the media pad link but omits calling v4l2_device_register_subdev_nodes().
> As a consequence, downstream sensors declaring the flag
> V4L2_SUBDEV_FL_HAS_DEVNODE (such as ov02c10) never have their
> /dev/v4l-subdev* character device created, preventing userspace
> frameworks like libcamera from opening the sensor.
> 
> Call v4l2_device_register_subdev_nodes() in cvs_csi_notify_bound() once
> the media pad link is established to expose newly bound subdevices.
> 
> Signed-off-by: Mauro Nino Marinoni <mauro.marinoni@santannapisa.it>

Please post patches against the media committers tree next branch or
linux-next master. This issue has been fixed by commit
7456b40bc992a3fc34b587545716729923d507b9 .

-- 
Regards,

Sakari Ailus
