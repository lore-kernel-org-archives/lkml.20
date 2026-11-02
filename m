Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793599493;
	b=S5LXfDp6f5PmSbv6nrqGYJ0GrKVsGPIXRdgjWCyBngonPJZTKvYqakvctwrVXrIYuWuI
	 v7SRNuaBQO1s3GKZv802oH5bW5a9p4U1LdiddqLf+Ubjt5OSiKF/qRJiUgsZULcG7H4F9
	 BYGEv6I6QyeOE3DsdPC/GN9ep5aPrQwm+ShGPrHUFuMYigPRalIdGqJINqjbA/nQmpwrP
	 YsFFPy+w41hp6/GV1L1ld0/axO5AIzTMkx8T+gYAkmbgGgg+3JptpNWUdxLG00pMKcmgO
	 BE2IpzuDgpr3u5L+9X3+Sc7S1lI1hHaoVVBdZIqMTpFEKK2WgXyyrmF0IuVGIoh36bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793599493;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Pcu0fOugEVEJYxmLVKNwYdbOhsSBAITbM3us78huKvg=;
	b=RwYy9qkgs1NnN80eTICWw3DEst8dg/jx0tuU89Fc2VDnYv+tNoDG2XAssbo95BxqxRqR
	 CsBVmm6FJURvJmWlKxYJJjd+rKjG+cLQR8sii6EUhtyVUg4sCFaa4BuztgTUJ8GQzcCZb
	 QlPCgDI1h/6yzZ/ksXOatCBgkuqLKMT/czV2FEEMU3YP10rU/jm2NreWQYym4rfO/ecjR
	 DunKzt/nqfixcqE7SggWkPdnb0CEf2u3m0ZvRpmRpWN9MxBMM3iPBc4EOKLfk6srjPVKR
	 +GwyIbK/HxBKzBKd0B1T2cHZNxU7xkTOwodhzniWmalqtgjCvbKLO6LPPn9xT6bJuLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mC8vQkRC;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD4E606A324;
	Mon,  2 Nov 2026 06:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FD4E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mC8vQkRC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793599493; x=1825135493;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hqBlYVKsduveytLoJmjJM9q8SBuWPdh51LsRmore8WQ=;
  b=mC8vQkRC1Nx4H7aKy949OusiuG3K9GDx6hz1eqlJO80GZrQm6CL3HMrs
   Wgzr689MxCHkX3TF1bbDRct/4yAG/URqaskYVGtU78CrUejotZt6kjcua
   jphFVxkFR81duDc51eY/BZIC9LCXB7aK5DYYRLtEXUtCT2h0wAchDqKR9
   0L4uxbTi2rFewKj4yWrbv8DN38Mr/Gnu/lu9uluQVrzBNEpSgoZX63TaE
   3BcVOYBLdtJWqSM2uBgQTcloAmJD5uDqlO+iJiGsUVyBBMkRcG1vmgJ/x
   iR3L8y0gzMDdwy/C48rE1ye6X2igieTaaU9cXWqBuB8AhubO4U2w9KZeW
   A==;
X-CSE-ConnectionGUID: gqV6zTT/RD2lp0/3S0TLAA==
X-CSE-MsgGUID: D/2zE264RUyv5rbTcxxExg==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2293051"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2293051"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 22:04:52 -0800
X-CSE-ConnectionGUID: 7HNz6urQQTOysoGJqeQ/tA==
X-CSE-MsgGUID: M69xS9GqSfukUEgfjwUk6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6339490"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 22:04:48 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com,
	david.lin@intel.com
Subject: [PATCH 0/2] soundwire: Fix bandwidth leak in multi-link aggregation failure
Date: Mon,  2 Nov 2026 14:04:35 +0800
Message-ID: <20261102060437.824814-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The existing code only copies the params from the first link to the
bus params, but it doesn't copy the bandwidth from the other links.
This can lead to a bandwidth leak when multi-link aggregation fails.
Fix this by saving a snapshot of each bus's parameters before making
any modifications.

Bard Liao (1):
  soundwire: move lane bandwidth into bus params

David Lin (1):
  soundwire: stream: Fix bandwidth leak in multi-link aggregation
    failure

 drivers/soundwire/bus.h                       |  3 +++
 .../soundwire/generic_bandwidth_allocation.c  |  8 +++----
 drivers/soundwire/stream.c                    | 21 +++++++++++++------
 include/linux/soundwire/sdw.h                 |  4 ++--
 4 files changed, 24 insertions(+), 12 deletions(-)

-- 
2.43.0

