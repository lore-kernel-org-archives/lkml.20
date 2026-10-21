Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792611102;
	b=FzQAt5iCfNkepwdDY2moI+e1Hm8lI/kMuqiFAMwxr+F226Qd4mavr2w88G6rshaWmjoi
	 TQy3ZArptMdOmE5d8YA0zUGDXxVN6ln8qDXQD+KjbQHut0RJucp5LhzUj8plPrbArl2m/
	 mWQ1XAx3AhtqjpAQQRmFmpg3J/ra/ADiscYyU46JIC0cjojYZ1HVHCzJef4xj4zsFa68q
	 m6C1R4Ysv8yeFRSCGVopSkrr/eknOLfbcsEu3/fYu4xQi2lnMdIm4ivmx/Qh/6xA/D6hS
	 LM/jGobCE1fso46vfoeK5MG2EOOSDb2OZUItENVFMRKyZ0diQY+RIwe3OaTWCqewSdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611102;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Organization:
	 Content-Transfer-Encoding;
	bh=3dwvi8Bpy2jkTM5NMOT9ZeaArUVyCEJHSfhITQg8gn4=;
	b=sj4yD6uQD1bW9v03Opyx3Pbk55mghoFpLpIC9Jn5UiEIWBh11nKar2aQSX71acOY+6T/
	 4YpaTdxr45YG7LYm/Rk9324a/WN0c7ttJWgkPRxOZjRU6HAL8G+270G8zR5aYED1JitBT
	 mgNmWz1tvvW4nCD1rLhQGe3uhOji7VOdDGe3GZpMh7ofr+6YnCFY3ZxGOcrRGx+DEcSUS
	 OkvLh8ZVjitsq6vB/uIxmtQtZSNEO9kWiAeD6PVshWX7HLd8S1r8mckUOo2KmPRqIjWpl
	 atigP1MIuKqgsibpejmWxf91EpBMAMVW0DSa+SlUayxE7CBfkL/Q5tgBpdA5tcjw+zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UAOaPcP9;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8848606A319;
	Wed, 21 Oct 2026 19:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8848606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UAOaPcP9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792611102; x=1824147102;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=THW4sdUtHqOvMX2OSOZLFucPcnAbZSf+yoP9iqHJj0o=;
  b=UAOaPcP929jm4FMA7riUf7QsW8mA9lSfilQ+kQAq4wObaniwCQAzq5M+
   BvltSC7Vbm5QlYjcVJZp5u8Lkbz25aaRtJow7VeU2kCFO4Ot2AxFFxPr6
   H8qxk+DdWzlepbMAGDVExwHdYViGnHhXX+iTJv9AuNQYfBskmz88HuBme
   Js6fA2ehL6GKITeVzB0ms1CUzJBSvpDLoEyE5tznCR8vzZO1xTEOTO6bZ
   prW+G2DsJY9b8dCtUuPOD7mBbGsJUaIZ/6O1IfBsi2gi9VhfJ5puVgjbO
   W7vd8iyIUqQO+4RuJZBlbKXiLP57CKMfA4Q8zqgveNXGDhSyVsJNmbrCF
   A==;
X-CSE-ConnectionGUID: 0c7l5wpGTT6DIRPt8I2V1A==
X-CSE-MsgGUID: MqElsY4cQvCk2pf/nvILJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1382505"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1382505"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:31:40 -0700
X-CSE-ConnectionGUID: cu1H3ycBS+WuGh32R4bVOA==
X-CSE-MsgGUID: LKEf30hhR3KrVvjqgvin0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3170385"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:31:37 -0700
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
Subject: [PATCH v3 0/3] arm: dts: aspeed: add Intel AVCRP and JNCRP BMC platforms
Date: Wed, 21 Oct 2026 22:26:39 +0200
Message-ID: <cover.1792613583.git.dawid.glazik@linux.intel.com>
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
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit

This series adds initial upstream support for the Intel AVCRP and JNCRP
BMC platforms based on the ASPEED AST2600.

The first patch adds the board compatibles to the ASPEED binding. The
remaining two patches add the board DTS files and register them in the
ASPEED DTB build list.

Dawid Glazik (3):
  dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
  ARM: dts: aspeed: add Intel AVCRP BMC
  ARM: dts: aspeed: add Intel JNCRP BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   2 +
 arch/arm/boot/dts/aspeed/Makefile             |   2 +
 .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 322 ++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-intel-jncrp.dts     | 276 +++++++++++++++
 4 files changed, 602 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
prerequisite-patch-id: 3af4bd880f896c97741b54ee18845b305a4bd061
prerequisite-patch-id: 23091b539ec7723a865d82da7703bf70c6ed0222
prerequisite-patch-id: ac42a7a373fdc407f6377d0b1c74d728af50ba42
-- 
2.43.0

