Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594047;
	b=JQy5E4skLeNgVR1IT/XfpMuvRueLgSwGBnvuZ5YwoDQdtHeESaRL45eOyUaj3LTQ23ky
	 WW1cfG8VZxo9R37njeGmTmI5OdzLgOlK75d9nlNBz08i4va9DbenSPk3OCBiDuqQEwXAc
	 eWayLxX/pnxk7Ui8r4+Lw2Jltu+0Rd70FPruBpIOOcCIt+w6/mRUWrIaoFdbLKOTkremz
	 O7m7bHVnAy8k1Cyua80QGcYft4XdynxQgtd2/b4vsCW42jvHk6mOSNFvxTKUvhyipsRNS
	 terRccPr9YSjwTZKJcNEail7d7V07ZeY0tZltXIw68JpogiLIQWtKMlDSOnQUeKoGMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594047;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Organization;
	bh=+LkWPtSlVsuDvgUtPy5ilVpC1ecQBrXWwBbNCkxc178=;
	b=W6VIDYeg289tUxwUCC0aW3c7gZ6zdxruGMbJxmS5AZFJrGZco2kx2fo7kPwTNkzHFHrk
	 7XwprF0y1O6UNrsNfBfDznuWNxqAaqvuCf+8XBi3KD7/giF5ythv3VW7yB9Nok+Dsyk62
	 rUQUJPzakBveUOZ/qPem8+JKBze7OUuR2qphDmZoawFnw4jD9U5Q4IKoawKD/KSq6cW1F
	 N5ZZM2JKEV4fKAv4wtqOu7XFeKNih2M7SkMuTlXpD/fOu+pPidQqkplWXf0eQ8PKRuXV1
	 s0SJ7QelLNyviK3GkcpM2JYzEEVmQABVN5lBC/7uz7hWQ5XL7XtGHpZOMuM1/WsX7QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dbmHpImc;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970B0606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 970B0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dbmHpImc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792594047; x=1824130047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c9u14pveAe1ai3wSmSNW56xyOPkY5BLySyq0tgkrX/g=;
  b=dbmHpImczyfkfaF8e+3hu9HvDF0Ce+nPwKybXmQzf4FRSQiD/wmfyo87
   p+XuoXSAmpVTnnsgeB1OnWZ3w6vcCBb5+WnFbp3P5RNqRLbPPl6UsvxxJ
   XIzv5xoIEUXA6/lhTioX6Etcm74kUN7QOiD8X+l4+I1NGP19esh7W6NS5
   5t8XnK5y6T4bGyzw5CZMDnMFw6FuWhJuZXvP2yn4uTbCvt0BllcH5E8Ps
   KQuqGNC/ReU/nB18gbH0rYxibjxeOQqddgMz8c1wmig61dbVSOqQOHXAW
   +3Wd/MuHuV0T9VsIET/THCAlpzZNMXm93XhRO5VRVy3gDcWS2fJf02+0v
   A==;
X-CSE-ConnectionGUID: n4yYpq7UTRuZd0z9SN1H5A==
X-CSE-MsgGUID: EYvpAO/zRUiueewh9sA2rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1196183"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1196183"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 07:47:27 -0700
X-CSE-ConnectionGUID: s4GWtXIbT1SXLb5iuLRYhw==
X-CSE-MsgGUID: B7B90v7HTludCeaktyEe1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3165387"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 21 Oct 2026 07:47:24 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D36489B; Wed, 21 Oct 2026 16:47:23 +0200 (CEST)
Date: Wed, 21 Oct 2026 16:47:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [GIT PULL] auxdisplay for 7.4-1
Message-ID: <atjQe4XqMT-gGiOJ@black.igk.intel.com>
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
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

Hi Linus,

A tiny batch of auxdisplay changes, which resided in Linux next for more than
enough without any regression reports. Please, pull.

Thanks,

With Best Regards,
Andy Shevchenko

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-auxdisplay.git tags/auxdisplay-v7.4-1

for you to fetch changes up to f63dc0eea92d07c5bb799a406571b555cd2bbd97:

  docs: ABI: auxdisplay: use literal blocks for commands (2026-09-24 21:17:35 +0200)

----------------------------------------------------------------
auxdisplay for v7.4-1

* Fix ABI documentation formatting
* Miscellaneous cleanups

----------------------------------------------------------------
Li Jun (1):
      auxdisplay: arm-charlcd: Use DEFINE_SIMPLE_DEV_PM_OPS for power management

Peng Fan (1):
      auxdisplay: panel: use assign_bit() where applicable

Randy Dunlap (1):
      docs: ABI: auxdisplay: use literal blocks for commands

 Documentation/ABI/testing/sysfs-auxdisplay-linedisp | 9 ++++++---
 drivers/auxdisplay/arm-charlcd.c                    | 7 ++-----
 drivers/auxdisplay/panel.c                          | 5 +----
 3 files changed, 9 insertions(+), 12 deletions(-)

-- 
With Best Regards,
Andy Shevchenko


