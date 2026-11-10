Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303508;
	b=NFN0Go2wuAbVW4EAPvUvGO8F7LuspT52fCrY0mWFFCQ1/4oMnCsbx9tRWhfh5z+vC+sz
	 hg6dxL+mRa5c1Tn6YnUlH6j/LRAIQW7sxqKx4TMR/wqvF6iylzoVsH3dBgJB6RHRUgB+J
	 b0fDDQNBnk9o6Ds3rXzuoNk93C/i9Fy7BdU60j39Nra8cNdTHxODiw2oE9YAcSuJJIHM7
	 tFDgyVlcjQWqxUfJf+4GNRBT1B8MXo/aDcrLd03DC7NXo7pyL0nWyDkyNkxzjaQ8GgJJL
	 H+1ceeUsnvYX/2VXKA+Ka2M+LaaUzji6nBofO6Wp227cKysSpiEolJDwW1xOXaZty6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303508;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=soIcd3rUx4/jiC2klzoUd5iGOQj53t5mg7c5bMYOoZM=;
	b=bGcq2+2BxRqkeR2++X3Yj9k6aUErz4taYKPDyx5Z8ZC9k/4eLsvRWrmmn/LfW0o8JvO7
	 4vSMeOawaUeg+KUqEjWL0FtjLcZLrzcV64aqOuOZkW/YOFDoPO3UidKS7MmGOXpUkfyV3
	 jBhTg8+eFi6hzKk7mGJC2bt3XfWjPcOG7C+2cDnc6PBfJkE4YHj1Bodjn3Azh8xYL1Y75
	 verFrLP/p7FabsTxDB27nTJzCYFTBHaRhLMePatSy/n3GIL2DAj+gE0KjJeWTLrupbz5O
	 Z/rN3lBLS/Y/Fmx178mGMTFnch1Qu+00xsBZZZPHv6s54zcfGlH18dvqhny+xq4muEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jl5PVfdP;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F67C606A99A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F67C606A99A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jl5PVfdP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794303507; x=1825839507;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fYEHP3H6dl2AlwUfY3uxUWjcJf4gmcOuQGAvPXqF/Qc=;
  b=jl5PVfdP+69yEi5NIUv2U+IFza+COIU5X5Rsi2NCGnExIVGYriY5dCng
   yStOAX8ajVscIMiooCZXO6ZYqplxTZV5Smbu59qjFtIEKDYBTc3fG/M2O
   l6BBy2zmpq/iAiRNdm+7c+8ntjhTYmiXYg/oJbsKPt09KKawKyvV2eDBH
   UPDjhZY7ZYzgaN5we7wBhsSLJPqdoFG+8eVZyqjHt8bZKImRq6QvED07g
   8th0ww94woNrgJKJi33oMMv5P5ZclPb0uhN4SgkX+OtKKSBTS9dRzEQlv
   RXbei8Ls2POiX3wirHO0iD1Sj+j18+OkZs2juTCvK0C5d9dQ4gSSEVz4y
   g==;
X-CSE-ConnectionGUID: R0KriWDJSlCD4xts9kGvLg==
X-CSE-MsgGUID: 0/FOjK5jTMGk0JF7yLT7cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2961811"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2961811"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 01:38:25 -0800
X-CSE-ConnectionGUID: 623ppO9uQQKjqqr/inrOiw==
X-CSE-MsgGUID: 93y9gQlYTXSvS2uYCouirA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7975223"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2026 01:38:24 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 1E1E499; Tue, 10 Nov 2026 10:38:22 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/4] regmap: a small set of cleanups
Date: Tue, 10 Nov 2026 10:36:58 +0100
Message-ID: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a mini-series of a small set of ad-hoc cleanups.
Read individual patches to get the idea.

Andy Shevchenko (4):
  regmap: Switch to use kmemdup_array()
  regmap: Drop never used devm_regmap_*_free() APIs
  regmap: Defer assignments to the later in some cases
  regmap: Drop duplicate ret assignment

 drivers/base/regmap/regmap.c | 62 +++++++++---------------------------
 include/linux/regmap.h       |  3 --
 2 files changed, 15 insertions(+), 50 deletions(-)

-- 
2.50.1

