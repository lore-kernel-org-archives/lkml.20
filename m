Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029561;
	b=4cZ42QsD3iWS/ptQoS3sajFmlf4/Hg0kHrxTfEHbMFtA6eSP04wj8JKPrmvIdhD6sO8s
	 DpQzqG7OD/o/PVJCbibQBv9pgesmPzCtXT/kA6LEptr5gSJQFGRB3HY5gUFTo9uAyA6aU
	 9gcmzkN4UUwBWF+8yFXIPO6EaGiDThJgZjKee20u+6quV/PVwzFhbB41hIT4ced3CGysV
	 U8GSKOESle/jNDidOe8Czq4b+pVq+jFQpJfsMFU2/+/fRlT23+DjVS1w7oGaiJTjPaEt9
	 2qggf9o+rFtC0hbeXMOVAOuDf+wXIyPv9E0Bg+JcSjaDtheHdoZHRYpP404zUcTXfHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029561;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Organization:
	 Content-Transfer-Encoding;
	bh=XPlIwY0S0sn4bBSh2Xil5xdrfx5N4jwTm973vijhd5g=;
	b=HHmTuopQTaEXN8gB52QEAx6vkwEH6pJkm98y79X7vWIWKBnNC+n3ZaTxYX9LHFaTor+7
	 oicjUrN2bgSONxntCubqpWIKANMj2o1aR1gIpEQpn30eT7zfRpRciJLHPZ3n9WLzN9Gut
	 2DJHUooy53ckcjNvMDaGATGFHj5azQw7GCcYRDZKVr99nGlVERHaGTY879JV3LXkochXY
	 i5iMsqMjqhRzUfmeKs6Vv9ZMRHqCTIaGiDDSVZsinDV+YkBVoau2ypSoeIZWqFpw5lST9
	 yPjiJqQmO/xOcF4jYN/2I1dmP0tE6OKaw0gE22KCj+kub99WhwrqRe3Y8/GPddsBWGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V28b+h7x;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41D3606A31A;
	Mon, 26 Oct 2026 15:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D41D3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V28b+h7x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793029561; x=1824565561;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gr6yVywM7WwdkGlnhrf4VhiYPUPRKPdnfkDFTc5rT8Q=;
  b=V28b+h7xZo4WzeWbr5cygBgLjVpXr18T4De1VL3gfDhG7rSQlDQxS7it
   AySfBV+Yxzeb6nxjfvOFgJwTMMSB+ab8IZtTudOAKVfPl77cwD70RWjhZ
   HnDXCseHPbDsv4oEGHww1UuoRxJczylgRzYK2adde+MQROi6MnJ9fATSm
   RE0WyE/6x/eKS2hjK/BB7nK1J2bZVjp7yiib/h4nObFK7sRvMtrWrk7Kf
   Ag4DVR13Mql8XO42HJJ7eQAFjDJDO5QG8fYxvABX6SCFuMNpEghmyq3cn
   Yn/m5/Nb6ngMO57fdmx4G645ewMTh3MfpZft1zEmHQTHOKbnEel1BFFOQ
   Q==;
X-CSE-ConnectionGUID: AdKkajqKQ/yKD4nNMQXBKw==
X-CSE-MsgGUID: q8wjWd7DQt6tMGqG59BGXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1730843"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1730843"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 08:46:00 -0700
X-CSE-ConnectionGUID: iG/+IbbbQmmQmtRlk3ZqgA==
X-CSE-MsgGUID: RX6t+cpLRXaHAx7WnzRzmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4369322"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 08:45:57 -0700
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
Subject: [PATCH v4 0/3] arm: dts: aspeed: add Intel AVCRP and JNCRP BMC platforms
Date: Mon, 26 Oct 2026 17:40:27 +0100
Message-ID: <cover.1792749922.git.dawid.glazik@linux.intel.com>
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

Changes in v4:
  - Rebased onto aspeed/arm/dt of bmc/linux.git. No other changes.

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


base-commit: 8db593481c8669eddb8b4e21ea44f3fa11d9f030
-- 
2.43.0

