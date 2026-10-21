Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792611104;
	b=fHxImS75H+8CyBTd+7bcOGYzPJs4cb13UybwU+kll0DYEyeBj0TtRQ0FA2ELcmtO99kH
	 kPkanHCcLRZgYMqsCh8bjzoAZfo0nuYHPCXNKnnpIp3vOed8hzverfo5YToS0PXOgmxbh
	 yqV0qWsS8KVyZ2Fsu+mqi6ZP5xs7EKhlYgkDNxKagCRA2whRmWTLAdq2PFNjG4LWpJvJ/
	 gOzeFt0t0kvomC3/xCZ6/RxfeHOQSfiacovFKaoGJA10L9RLwUZ3RD8ZacfV3K1yW1MkQ
	 rRLGe9udfJoyuSXnBf25kOxjhHxHDrFwgc6hJBgnLHH+kBVlydY/LAndpgpqHvRV3xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611104;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=OPQGYY3ssesZJ1NL5DDQJezKH+tWGJ2i+1Yzkdudp0c=;
	b=RgJGUbXh6FgNexXsYRhjGTVdVpcNRCJJUaIwxV1+QiC90prZRjUyO6OjWOqJ+/kcBUV2
	 VgXVuxRLzW3qZ0BtFtAZ+49YFJ1DHdzjXw9zEytmGN8jgXJd6WgXMW1X540hMQ+rKxMwl
	 2QKODvP6WuxK03jly4zxXRxlkKEujwtFOlcBsHluQBck/K+4qXORQ8mn/rcBSuqj6jlj5
	 bJk+9p3Ab9Z5Tn3mhP8JXAkUWo6bHRO2iWNxCAZKhUMTpxlz+x3YO6NtqAzepgBDvGwxX
	 XPU0YvYnU4xcD1OPMZ8QYlHqQo1QNDihqU9UfruHCLGUNT+/56bA6nq6LixVq1E+qOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="hVo/hID+";
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69640606A31D;
	Wed, 21 Oct 2026 19:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69640606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hVo/hID+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792611103; x=1824147103;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RE/DoN/sfPcw1uq93Op79DBYUxbTWL4Fw9BZEGZudRo=;
  b=hVo/hID+XiKRTw2Ghmb7oHigA8OdQrst6RewVzyOYyv1wbrPMSPLfQvo
   1TlWadtpnxniq2wGDJSheKYmysm9kVq04dUQFuh1m8ok2Cy6u/zRZDU04
   Se4BW/tPMDBAEgs4PCEdpDKfWChFxLxAKCZzBrKNqKrISX/8kA4Y0Irc/
   q5EtqZD2DbVy9zs71MX2EqzNZqgbxk8hUW1ZwPPBUJiBI+SOoydg5Keg9
   +YFGK34bN3/huRVMHxW9QNgXepCwR9jeGc3HfrQ8YphHYmSScVW85fYSm
   NNAua9JnwelBE4xLY/BRcZfLpxA9KbAMvoFutcnwX8JHA/iZT0ZVdM7vy
   w==;
X-CSE-ConnectionGUID: 9+S5rHQnSVqIppFx1WevtA==
X-CSE-MsgGUID: 7R3r2/xEQ4uN/Sk6ygEHXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1382515"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1382515"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:31:43 -0700
X-CSE-ConnectionGUID: BesEOpeUThK9bOpqFYKyFw==
X-CSE-MsgGUID: sYgWBGvISyecZovlhkvEuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3170391"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:31:41 -0700
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
	maciej.lawniczak@intel.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
Date: Wed, 21 Oct 2026 22:26:40 +0200
Message-ID: <21929084fec468382460c52bf26d3b380393f732.1792613583.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792613583.git.dawid.glazik@linux.intel.com>
References: <cover.1792613583.git.dawid.glazik@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

Add compatible strings for the Intel AVCRP and JNCRP BMC boards.

Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v2:
 - Squash the separate AVCRP and JNCRP commits from v1 into a single
   commit, since the changes are small and closely related
 - Fix compatible string ordering so the new entries stay in
   alphabetical order within the enum
---
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 8ec7a3e74a21..60e8e73da3f5 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -107,6 +107,8 @@ properties:
               - ibm,sbp1-bmc
               - ibm,system1-bmc
               - ibm,tacoma-bmc
+              - intel,avcrp-bmc
+              - intel,jncrp-bmc
               - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
-- 
2.43.0

