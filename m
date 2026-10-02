Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EC64E36F8;
	Fri,  2 Oct 2026 15:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955401; cv=none; b=p8mkoj4CDQO/fPdJne7J8Sk6yXmr9dqx0Ma6BbjpO+W0MeApVDSJ8c0rNZanAqEB6+q8A6L0A44GPia2UXt7BsZfx2rIyf2bCyGH5DhmE6OL6NMK/QNCF9hgqxInGbCXaCA7D5WX+MMqAX3YhlIeGLp/9bvAhihWUPqHOxTV/Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955401; c=relaxed/simple;
	bh=k7Lyc4eyl86PbGTSOmv7ydB0HYVEW7WA0vnMeArh/5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IprieisEIk1v633JUBGgGmHZixfBfks7ydr6IAHFsXptqlyxyvPkq+tkCmQvTxPpMnBlFxeYREPDv0oHE24isZ0ISacueorAreLK6BtMRLCNwbHrmIGVu6XdXNezaeSowZ7gFZ2PJVoPPzsrC4bvQUTqhdnmaQonCXFmIWeddgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXHK3xeG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXHK3xeG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790955400; x=1822491400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k7Lyc4eyl86PbGTSOmv7ydB0HYVEW7WA0vnMeArh/5E=;
  b=fXHK3xeG7XgCNAKcBO5yLe8OkntE6YqQFMYgOzip/SgRyguPmVJGcWku
   LmuyEfRjEg9mqgG9a/8CLcfbMbb/otVzt1O52yhYISKTFaiGxl/FO+PBr
   QCKZjcz0XHNt67skzeJLLIj6IS6JvlNneRYCGrhXoZXD6wS9c0soZ9uyp
   XXKg74HCCSMars9gGCYzvYatfpdMGQZFn8RnrKMPSaLQIJ27rddvaUdwM
   7215FZpIM3YCOwFiy6BzyvlsJkS/txiRXUCt0muoZtiUV3iYR2GyZ3NTN
   asEbxpKz47QURov+mqgMJrzk4oPrA36+Rtr+DjDK8H1VvXsNtaqNV1jCG
   g==;
X-CSE-ConnectionGUID: 1QRv6qn2RxuvKyvVn3REfQ==
X-CSE-MsgGUID: PxYcpYw2RQKHeRCgz6XWBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="117247715"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="117247715"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:36:39 -0700
X-CSE-ConnectionGUID: V22czOdbTVWeMqrDTzxWAA==
X-CSE-MsgGUID: 3X18j7onTsqwz70mkBfEfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279522397"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 08:36:36 -0700
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
Subject: [PATCH 2/4] dt-bindings: arm: aspeed: Add Intel JNCRP board
Date: Fri,  2 Oct 2026 18:32:43 +0200
Message-ID: <212171467173c9af64b3f8ecddca2a445b7e7148.1790344811.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790344811.git.dawid.glazik@linux.intel.com>
References: <cover.1790344811.git.dawid.glazik@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

Add a compatible string for Intel JNCRP BMC board.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 2c8180e49b2f..6f7d77efb30c 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -107,6 +107,7 @@ properties:
               - ibm,sbp1-bmc
               - ibm,system1-bmc
               - intel,avcrp-bmc
+              - intel,jncrp-bmc
               - ibm,tacoma-bmc
               - inventec,starscream-bmc
               - inventec,transformer-bmc
-- 
2.43.0

