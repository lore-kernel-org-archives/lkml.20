Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63AB4AAC63;
	Mon, 12 Oct 2026 16:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791823417; cv=none; b=aWWqZaQRTEg4zYIfXPwRgkBnY93dSFssY6t3QYt0yerIt1Y7VmIymju32PrasRvsSoxW6t44zaNd4Zr9s278GKQVe+kN7g/H35e3pNXEsQ+vd8xeox0f2GgTtjkyL0u5R6Korblre9C4OOr/on6f6YdIkr0VlX3ggk/FvuzT7tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791823417; c=relaxed/simple;
	bh=cv0YOCl67A2bSUYRl7ofUt87v7F05LKG20xnzj4vBDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NYeqKUmCl/yyuyMTAxVYZt8S5EmYUoB/g0125uMeWdNFQH5xFutIf1VgetngAU9VlR3TlGEesCR+6jDyDIk8cmuwVjcYlWtF4PT1mKfjRUtu1GhtI5k1IqlStCXkOkGGmHTBfQKVMCxYj5LhBrAGVY2TkEPEWh/IfN3/G0ypH1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etABn+zr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etABn+zr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791823416; x=1823359416;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cv0YOCl67A2bSUYRl7ofUt87v7F05LKG20xnzj4vBDQ=;
  b=etABn+zreZG82UHdUj8viJwI/aaDxUxVPVJd+dLJ/Fr8E+g4OJwgSD5h
   TmhICwW/DQCRrSplgmrYJ5jcJHj1gJ+9N65bzndrGS1NhAlHndYC5UQLl
   3IalA/cPhpxum/xUwz4NNzUStVDGhlBZBaYOrWVOGBaLduqslZvvkv0x3
   Lq/VmhPZKx+NhCjyOEBszRchxW4vVe19+Q+afDuOzriYE8L0rkSH+pn1w
   2KaaBp3uCDSdqz1s6HHuFxIxqmk2sbq79MaOne/1nB6/jV5U5qdM8xi5D
   Bqr26L0bvEYqLaaxFXZOF4TFF8YEqSbeypdl2UqN+FBDLIUN0UI2MF4uv
   g==;
X-CSE-ConnectionGUID: 2plwdumoSlqA00nrGps2Ag==
X-CSE-MsgGUID: ydvbwMavQqyFiPotLK6xyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="410051"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="410051"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 09:43:35 -0700
X-CSE-ConnectionGUID: xpmaf2bASx++l5FWpus8sw==
X-CSE-MsgGUID: r/lN0FUZQY2Znx5r3hSaZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1004908"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 09:43:33 -0700
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
Subject: [PATCH v2 0/3] arm: dts: aspeed: add Intel AVCRP and JNCRP BMC platforms
Date: Mon, 12 Oct 2026 19:39:04 +0200
Message-ID: <cover.1791825961.git.dawid.glazik@linux.intel.com>
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

Dawid Glazik (3):
  dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
  ARM: dts: aspeed: add Intel AVCRP BMC
  ARM: dts: aspeed: add Intel JNCRP BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   2 +
 arch/arm/boot/dts/aspeed/Makefile             |   2 +
 .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 315 ++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-intel-jncrp.dts     | 258 ++++++++++++++
 4 files changed, 577 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
prerequisite-patch-id: 3af4bd880f896c97741b54ee18845b305a4bd061
prerequisite-patch-id: 23091b539ec7723a865d82da7703bf70c6ed0222
prerequisite-patch-id: ac42a7a373fdc407f6377d0b1c74d728af50ba42
-- 
2.43.0

