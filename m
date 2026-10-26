Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015038;
	b=p4TM65M/xXXr4uqelcyiXglndrj7IjbcelcmHGI8cL5KwTXEXl0PEcMZ1W1+4Usce26r
	 x8UjkN9Ws0SWStGPQjQrTyRZWRIXMPt3Th2g3XxcGwLhbGlzt8G9fbEvlKyJaglaSNZYf
	 lUZmZKYgcbJUtjxym6eUg77tlqB8dy9RRVManAaKl7NSTfHWS+/GfJXf+abjql92OTbaZ
	 JC0AURcrP598ugHJRrqturNkYFPEBC5d+3753Dt8iyGp/eOd2KX2x3R5UayBtfjVaV2C2
	 24JMyIBKOBL+kMXGCe32asF0y+GxuFo3/IIxQC3/WQoVJ9IeVox7BqtPTDV9jU6GqQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015038;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uFtKzCeT2bVTLtaD9jARml6D6/kIz7lhfPHqwW2GK6s=;
	b=e2ypxynAMMN79D2N5XiTm9p9HQMm+vQsyPaPHs8A4SSNXpVqYTp8bC0wAA2Pfa7WFkKD
	 6wbifonnkxwdAh6npVDI+Bvy/7UaiDOxfwFgg+i6RiEGE1hcRvLG2JC1eVuCMiD5qJlCu
	 g1Q7VvPBLy8o80feN7zdvVrindgTQSbtdN4//IazR8SDI+k1+iSo9aZXn8sKPYuA6mC11
	 k1RcA77BuQsYIenua8OyZAo2iaQtYmP55ks3valoictFN5T3SH/JZqPJAPvAJ7/GCht1a
	 kMDQXT0fvMm88WZDbqkMSbpvYtSWJct+s+tqlLiauG8UjCsHtCk4O7w3pK6O/UDm/AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T7wk65f7;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FD8606A320;
	Mon, 26 Oct 2026 11:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43FD8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T7wk65f7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793015038; x=1824551038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YfdeoGrsN+l5K9lwjQegKiX7qvP3brOk6K7xFCMXpdg=;
  b=T7wk65f7gXv8TcRbkZsfi3N5q4YSfqYBYMJaa805F8RiuT1DmZdc2l02
   9AIWmfU2ZhfQSxcqExmt/yW+5XEHClL74m7wS8IADcwQhzCJiXqk0dac3
   +FAXFPSDhHUmnID1Q0iNoc6CzXMx4hA5KXbi9XPdVT+sWvS1cVJ9OYKja
   +rtDyvcU5YQyzyEA0MN4rqJEiIOuJvuu/Pib3d+AQ8kU7gQeRfLtvTZ1A
   0F8VQ2JLKYei+MUSczE41HxCCH4Ot8fQGIT8mNhBhbyItMRSsNtgNZo67
   ulDxs3aI2LbMSu2LZZ1L7h5LLJPzoAIMTq4UeM8ecIv6iA4tGuPY7blzv
   w==;
X-CSE-ConnectionGUID: XetdQWqRR8at7ZsgcFGH9g==
X-CSE-MsgGUID: wYECRADqRvGolZhPnDhKPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1689268"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1689268"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 04:43:51 -0700
X-CSE-ConnectionGUID: c8KG+NJ+RpmrJbxeeVNewA==
X-CSE-MsgGUID: GRv9rrRaT+GSGqYuwX57wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4148444"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.73])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 04:43:50 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 28433121CBF;
	Mon, 26 Oct 2026 13:43:52 +0200 (EET)
Date: Mon, 26 Oct 2026 13:43:52 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Simon Kruse <simon0x+git@proton.me>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov5693: Support control events
Message-ID: <at88-MnXMFopRLl-@kekkonen.localdomain>
References: <20261010142042.23253-1-simon0x+git@proton.me>
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
In-Reply-To: <20261010142042.23253-1-simon0x+git@proton.me>

Hi Simon,

On Sat, Oct 10, 2026 at 02:20:54PM +0000, Simon Kruse wrote:
> The sensor subdev exposes controls but does not implement the control
> event operations, so VIDIOC_SUBSCRIBE_EVENT fails and v4l2-compliance
> reports:
> 
>   fail: v4l2-test-controls.cpp(1128): subscribe event for control 'User Controls' failed
>   test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL
> 
> Add the standard control event subdev operations and set
> V4L2_SUBDEV_FL_HAS_EVENTS.
> 
> Signed-off-by: Simon Kruse <simon0x+git@proton.me>

Could you instead move the driver to use sub-device state? See an example
in commit e8a5b1df000e1a23c04dadbe99621441e0889f88 . You'll get control
events as a bonus. :-)

-- 
Regards,

Sakari Ailus
