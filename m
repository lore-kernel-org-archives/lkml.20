Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C42D2D0629;
	Mon, 31 Aug 2026 08:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788163374; cv=none; b=e/EQTS8gesEjd2eLNug/TTOZm4Wpi86nimxdSdyKjU9ztr1fNI0lzXXxKzZx4XkYbdk4DBHjCgyqrUeTz3PtdjqUYcHNqAy+2poXyFUwiJZUOarTlU2BU6w2y1BiK+hZ51x8bS7i6ykK5ehPZqlhEMKGPJBHumSmRKuruvVWqTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788163374; c=relaxed/simple;
	bh=ThNjseMe9lv1Y0BFPvM1quupMSyAbrI9tCTKBf0q1cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVENJAQ2mSOJMJ5x8Z97E/3Cq1q+XSyxB1fTJCduJ8F650WTjUWN/NZ2B8dqc+mHbgt200D0Dp23NDYDTgkKFVcFoMalho2iea4Mp15ZRGhEZmt1atx1JFt4g1PjHzEokhzR9pYWZKkydtdibzZ7QLOZi8RmBkzeKNgI7VYNJQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJq0VbH/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJq0VbH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788163372; x=1819699372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ThNjseMe9lv1Y0BFPvM1quupMSyAbrI9tCTKBf0q1cM=;
  b=jJq0VbH/uESGuOfI1cEdoptwO4LJac6uXH73K16uYYwqwNOZ9CwBP94H
   eVCsXG4SVP30VGGvbgKQdAPZSunl9VL8LAfl2lm+i2sSzQsigepu/SnBm
   HJKnTPm1ThTW/GEdfacHVY49GRbdjrPzsq9aFkf6dKuY/iJumz/hWzeI3
   8GYy8FIk3d8PHRo53kDq+gprdoAnerVjkV+v54lQ4or+m1/Tec7CtP8GT
   7iwIl+9cTEePN15UmIGKcM0gBdXU6w9PpIg8ZT+lBiZSG+zGh03VSLnQs
   rNsbZ+1NxkxwlCb713cstmJFuI/YcA21H6O2MBBd/pB9dO8NiX2mGCmmX
   A==;
X-CSE-ConnectionGUID: lawEfFXbRMKVUF6fiJffiQ==
X-CSE-MsgGUID: D7J7DF+KTWGWneclsFzmzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88416603"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88416603"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 01:02:51 -0700
X-CSE-ConnectionGUID: 2LuPwHNnSg+HJqlvOkVgIg==
X-CSE-MsgGUID: 22YGIUXhQzaKBYsH4d1iwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="266923768"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.60])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 01:02:50 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1397E11F7F5;
	Mon, 31 Aug 2026 11:02:48 +0300 (EEST)
Date: Mon, 31 Aug 2026 11:02:47 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: johannes.goede@oss.qualcomm.com
Cc: "D. Manresa" <dmanresa@gmail.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: ipu-bridge: software nodes are never unregistered; PCI
 remove/rescan of IPU6 fails with -EEXIST and leaves dangling properties
Message-ID: <apU1JxHwqGsQOIlQ@kekkonen.localdomain>
References: <20260827232636.93145-1-dmanresa@gmail.com>
 <apGqPKMIk5kgqfMj@kekkonen.localdomain>
 <20260828205424.154443-1-dmanresa@gmail.com>
 <096b57f0-90be-406d-bcbb-74d19dee91a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <096b57f0-90be-406d-bcbb-74d19dee91a5@oss.qualcomm.com>

Hi Hans, D.,

On Sun, Aug 30, 2026 at 02:40:52PM +0200, johannes.goede@oss.qualcomm.com wrote:
> Hi,
> 
> On 28-Aug-26 22:54, D. Manresa wrote:
> > Hi Sakari,
> > 
> > On Fri, Aug 28, 2026 at 06:33:16PM +0300, Sakari Ailus wrote:
> >> The regulator string length has been increased to 6 since and I believe
> >> with <20260729-sp7plus-int3472-v2-1-cdfaf97ac3ad@berg.pm> (on LMML) the
> >> camera might work streaming-wise at least. There might be Bayer order
> >> issues though, there was another patchset
> >> (<20260729-sp7plus-ov-flips-v2-0-91884b81a8f5@berg.pm>) addressing those.
> > 
> > Thanks for the pointers -- good to know about the string length fix, and
> > we are aware of Jakob's two series: we have adopted his POWER1 approach
> > in our local tree and have offered him Tested-by on this hardware to
> > help both series move.
> > 
> > This report is orthogonal to the sensor bring-up, though: all three
> > sensors here are fully powered and streaming (the cameras work
> > end-to-end, hardware ISP included). The issue is that ipu-bridge has no
> > teardown -- after any unbind of the IPU PCI device its software nodes
> > stay registered, so a rescan can never re-probe (-EEXIST), and once the
> > module is gone the node properties dangle into freed module memory. It
> > reproduces on any ipu-bridge machine regardless of sensor state.
> > 
> > Would a fix be welcome, and if so, which direction do you prefer:
> > a real teardown on unbind (unregister the node groups, clear the
> > secondary fwnodes, drop the deliberate struct leak), or making
> > ipu_bridge_init() idempotent so a rebind reuses the already-registered
> > nodes? Happy to write and test either on this hardware.
> 
> Not Sakari, but IIRC the goal has always been for the nodes to
> stick around (be leaked) since other drivers may still reference
> them when the module goes away and then a rebind should use
> the already-registered nodes,
> 
> Which is why all of the swnodes are dynamically allocated and e.g.
> strings a strdup-ed and things are never freed. If there are pointers
> in the swnodes to things which go away on module unload then that is
> a bug which should fixed.

Indeed. Software nodes do support refcounting so in principle it should be
possible to remove the software nodes, given no driver is holding a
reference to them.

Software nodes, like OF and ACPI nodes, can reference other nodes and this
is the case with the graph data structure. As the remote-endpoint
properties refer to the other nodes, there should be a circular dependency
there, and current framework implementation really doesn't allow removing
the other node, whether or not a reference to the remote node is actually
acquired right now.

-- 
Kind regards,

Sakari Ailus
