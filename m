Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556562;
	b=pzwJ3pJDE5Sjuiie8Tgn9g7bmd3bYU7X+UWcS9wY7O9NVFUW111a6Yn/t0hHqZswTKGU
	 wM8vthN/M9bE2SpNDOr33TsUmONIMidnd02rz0olh4EEYuhMbYyCrY2qAT7Pua66jQTLs
	 6Ha5dFCZ2g7zbzlSQQeUDrCn5CO7Q3cL4INFMU6B5qC2EfHOL26vRwDw8a+Gam4rZk+YI
	 tT7ZaPhE91kauxo4ctEQdGpIz4XPuvCz/8kr9D5d5KJMYOWnFXRzOoBf4xvcdlDA014BK
	 KixFZfivOqyX6Q49hZ86oPzDv3TBr3W8sIaVMuOdEIp2KY//U+agogZZ1wywx0dIy7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556562;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GWbv2zOjst8UuJUp6rbLSm5WhxmtLC3h40+pmJtk3HI=;
	b=1/93CAqZNytqUjhu5CrnqU4qEx6rLHYqacX+dwyKVA1jrXg3yquXm7JgP5HSXlOBXamK
	 nEwtwgU+N/ZjA6DgVc5CNBLKMnnbuErPck8uhF5aX6x5ZFfBPR93XBtOM8ceTMmeU5Czy
	 guJj0V4HE2Gj9aLiBoUZNi4jGQTMj3K/5LXyxoWu8XVz2PC3EcYsI18xvmcjoU8J17b3E
	 cGzSOf7390TZOj0Jvn3L1R2V+tJL/WkOMsYBYn8/USWAO/9nBl3wzlDrk+ENfK+vBsyUi
	 AM7YWujqndTMW94GwVpAZGwm2taJhsLgNDVtYVB9QWRTLv4CBCvmCtYowI+AkZwb2Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iU5DehxI;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF176606A321;
	Fri, 13 Nov 2026 07:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF176606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iU5DehxI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794556562; x=1826092562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jJ2Evzjt1CZyPWlt6ObTJyIbQEvJB1r0meSB6NP0dnI=;
  b=iU5DehxINB+8FBA6xk1LN/AcMaf/Q8WnxZrKqHxdiaTCVkDGiNidn8Ix
   40lNo2nbVcfShqoFovZ2/4gterQ4pVxY9pujqq0yMe+xCSrDhTX2EclNN
   F6tRoWd7W5aOuP7vXVuHLMhL9J9j/dhdXm/+cKD9je5ljW6E5zTkpGMIf
   NZ6ob8B/IuMbzCsGX3yAG+Omck9LQix6GOkiB4QQlV9FDB7KtOo0Idxqc
   sqK37esQV7+i4FBO732/VcuH/6ypMqERBx5vFu1dfygWBP4avL8E3A43P
   NBMz/MnfSj7u9d55UKWeAK+7KwMODV5UQwNaDKuaY6ls3gjOswoThfJVz
   g==;
X-CSE-ConnectionGUID: mVCy0Y4RRZ+poorhzElhWw==
X-CSE-MsgGUID: x6FnhS7QSCyDrnYPSZCxHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3364749"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3364749"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 23:56:02 -0800
X-CSE-ConnectionGUID: i/pBdK8/S6+x+hH2uxQsHQ==
X-CSE-MsgGUID: t3+T64SGRnuDMU4FtSPCkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9027631"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 12 Nov 2026 23:56:00 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id EFE0299; Fri, 13 Nov 2026 08:55:58 +0100 (CET)
Date: Fri, 13 Nov 2026 08:55:58 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Sven Neuhaus <sven-kernel@sven.de>
Cc: linux-usb@vger.kernel.org, westeri@kernel.org, andreas.noever@gmail.com,
	YehezkelShB@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] thunderbolt: Fix lost ring interrupts and an XDomain
 use-after-free
Message-ID: <20261113075558.GO259790@black.igk.intel.com>
References: <1794520303-5758-1-git-send-email-sven-kernel@sven.de>
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
In-Reply-To: <1794520303-5758-1-git-send-email-sven-kernel@sven.de>

Hi,

On Thu, Nov 12, 2026 at 10:51:41PM +0100, Sven Neuhaus wrote:
> Hi folks,
> 
> here are two independent fixes found while running an out-of-tree 
> USB4 service driver between two hosts with AMD Strix Halo USB4 host 
> routers (1022:158d, 1022:158e). The driver exchanges XDomain requests 
> and responses in both directions and moves data over its own rings.

We generally do not care about out-of-tree drivers. If you can reproduce
the same issues with in-tree drivers then sure.
