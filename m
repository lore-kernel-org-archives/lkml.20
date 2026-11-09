Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242902;
	b=hBtkmfgjeY0xx4kJkMQqYJTUa3EYCqmDRVjNn6m7x7zzTNSXveJa0ct64SLBazbPvIW1
	 5shUBa4Px86OmqhyqWeqGSAdo99PxrV7OdBirXIiGOxQaXMizF4YF/2lHwU2zJasaAk60
	 pCWtX//XkXODhe7MywZojeGtdP3lOsIdxEHksI/NK7u726XdYeZY0Ox43K82Ju3sd8rJF
	 NqI9dfjcfgz8DOcojJboh9yDMl72d9EKg2ZdCRSjYg580wJwDLrNQ5oIjsap2CrcKzwAJ
	 6Taljxu0Nry2fU7PH0rcSP/lgKyO6A0y0+rTuxE6v512sFHWKGMF/a8wGxxuYk2RXtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242902;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=dtCQxHf6DUwyC+J6cCfISGldHvJA6vcL3U1YvK4OhBI=;
	b=U2BBS7pEcfoQH7MF4tdheq6mBiCBibMtemfrd1uaJjBxpQnMMHv7Ayp5HR/AKrF/SBca
	 3taWNNSqNlF4yE65YlVmQwyn2gPMiR8KBHzzkSiRQwUG+57PJuZ1aVKaAmApZ6QmPJftp
	 Fi3cICpBzQgHMkwr0lR2M4Tu/Za212h2dJkWEm7ca6/eOM+sxJ03Sh01dpNRyWBc2nwzS
	 HjjaGnhXX+KF8aR9jkDPeg0sa/aM2o0ldP4NIGHvy/HuEhpM0R3NqRY3NKVKWeuSEx67/
	 jh5E1tv2UR0eLJXIvXM5/5/dbPBooUdqNq4oKeDvor84FgLQdImE7akRux8HPo1q0CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="I/KAmxy+";
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AF8606EE93;
	Mon,  9 Nov 2026 16:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77AF8606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I/KAmxy+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794242902; x=1825778902;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mG2F3kXHoPkrkgh7TuAzTTLOIw3kPA3YYlH38YhZ6zA=;
  b=I/KAmxy+7kNpBaVCDME0irNgPbfRT81Bs7UGORQz0kuIo/F9qo6gzON7
   JMmksSNV5sfwSk0ssVahPl5C99eIPWBYaXZVyKEE30Dh1F0kMpGbJXeWB
   8P/QHmuS1spU+f8S/3KMvco9H2h3uJE8XsrxRNOvInE89VwrtYqY5bpTW
   En7p1jq3eaBD1GMd55UaD9UhPqEiIcgAR3G7SM+CGUSczqD7PEf4+EYQ0
   J1zgrkVnssLqgWn+1JxIxuRDAZlycd1gXGB/2KZ53KRq0OFD9SV2bZSm0
   p2ZTyg03mCBeSaie9hAE4PnSJ18hfmyLhHNzwHRNKoR9/YP7l+Vx1iR5n
   w==;
X-CSE-ConnectionGUID: FOlSKpswQ7alQUqHSzsewg==
X-CSE-MsgGUID: 9gC1BXxET4KWBMaI/mEH3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3010699"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3010699"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 08:48:22 -0800
X-CSE-ConnectionGUID: ZL6YsHvVT4ur8NDCENsfVA==
X-CSE-MsgGUID: Fk+TW1seTaGjdtpoXYvheg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8481233"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 08:48:19 -0800
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
Subject: [PATCH v5 1/3] dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
Date: Mon,  9 Nov 2026 18:41:48 +0100
Message-ID: <0fda64f661da98e069da9e0bdaf947f0f4d5430c.1794242015.git.dawid.glazik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794242015.git.dawid.glazik@linux.intel.com>
References: <cover.1794242015.git.dawid.glazik@linux.intel.com>
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
v5:
 - Rebased onto the current aspeed/arm/dt, no other changes
v4:
 - Rebased onto aspeed/arm/dt of bmc/linux.git, no other changes
v2:
 - Squash the separate AVCRP and JNCRP commits from v1 into a single
   commit, since the changes are small and closely related
 - Fix compatible string ordering so the new entries stay in
   alphabetical order within the enum
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b7e70868ebd8..61616a9754a4 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -110,6 +110,8 @@ properties:
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

