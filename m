Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1CF4BF94A;
	Fri,  2 Oct 2026 15:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955386; cv=none; b=bA8sTu1HXvFTHUQyO2VKTNc5dVNrC+zN9wcFUjhwEvAHYR0+AxFGiiJTUKIT4c5B04X9zVLHZVgyWlGdfiebyiFIO3ijuJJcsWJykdJIz16EqC0yla2aKSm6/EiPsVQ8TjhZElErwK/EP/WTawNiSnCtXPbfP4MdTwj57nZSiEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955386; c=relaxed/simple;
	bh=ID/HkmFMTgXfBvEK9zp6+sIFgeqPAHbQ5YXi9GUqiE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PdhgcA577+G6VEfFoJw1OAb5OZoltYDE/puB5H8Ron9jLwjHKUrRzjftxq7z7TdHZEHgZ20FXjFJtRQcOpdeO8k597IsZeaicbzC8Z4AP5EYNp+2DzKU2MzBkBa4GtTfnSRWJBv2oRZNbKX1gUaWAB2GoVM3TEKRlU56700yLKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfI1CieC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfI1CieC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790955385; x=1822491385;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ID/HkmFMTgXfBvEK9zp6+sIFgeqPAHbQ5YXi9GUqiE0=;
  b=PfI1CieCY4KYHBzSisdAV7S2tpEaC33RO7S61gx0QpNKuf+nT4+V+gJ2
   +mSbsfVci+fZw4apDm7Vx3X6Ip/ju49caM+aWFrTzPfCGYPL06kXcfAK6
   fJgvYwc/osgiM/pGXaOzaVjGvhT+Il6gf66PKke6yIwoA0eyUlEt8OQrX
   Im1evSTqGtXbXFC2UaWzaNI7+F/SBasnO4OJah5YKDm+JLtCXI/9IJ9Zm
   +ugAIrkZHoEBv31MZdKsT2sfzu8TNQQlxfJbMM/eljbFFHcTHAMxn1K6j
   KkXDivXVRswPzA/JloZiygD4sQqZFbomwUTWbjdFy47tw2zR2JPPsFtrV
   A==;
X-CSE-ConnectionGUID: 0HvSwHuISkaIw/WYEmq3Xw==
X-CSE-MsgGUID: F3l6931pRAy7KWh0f66vdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="117247681"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="117247681"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:36:25 -0700
X-CSE-ConnectionGUID: /exO7IEOQoiF36dXfvuycQ==
X-CSE-MsgGUID: Btu7op7IREy2zYlUhnhmAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279522351"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:36:22 -0700
From: Dawid Glazik <dawid.glazik@linux.intel.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	dawid.glazik@linux.intel.com,
	maciej.lawniczak@intel.com
Subject: [PATCH 0/4] arm: dts: aspeed: add Intel AVCRP and JNCRP BMC platforms
Date: Fri,  2 Oct 2026 18:32:41 +0200
Message-ID: <cover.1790344811.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

This series adds initial upstream support for the Intel AVCRP and JNCRP
BMC platforms based on the ASPEED AST2600.

The first two patches extend the ASPEED board binding to describe the new
Intel platform compatibles. The remaining patches add the corresponding
board DTS files and register them in the ASPEED DTB build list.

Dawid Glazik (4):
  dt-bindings: arm: aspeed: Add Intel AVCRP board
  dt-bindings: arm: aspeed: Add Intel JNCRP board
  ARM: dts: aspeed: add Intel AVCRP BMC
  ARM: dts: aspeed: add Intel JNCRP BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   2 +
 arch/arm/boot/dts/aspeed/Makefile             |   2 +
 .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 321 ++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-intel-jncrp.dts     | 257 ++++++++++++++
 4 files changed, 582 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
prerequisite-patch-id: 3af4bd880f896c97741b54ee18845b305a4bd061
prerequisite-patch-id: 23091b539ec7723a865d82da7703bf70c6ed0222
prerequisite-patch-id: ac42a7a373fdc407f6377d0b1c74d728af50ba42
-- 
2.43.0

