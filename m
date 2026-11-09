Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242897;
	b=5emGS7peWgyUbAHj/z6Fs5BroQi+fzpzzzAkfwLUNV0ULlHGu9Ie6SHw5uaSM6FUc7fh
	 zVflPYjUPgfFkGzlayIjzSgWSfz2sJuEuV6I1/kP9bA9zNy14ipmZs1S6Q6eDaeT8JKda
	 NJdyGlVuuZlR3xaDgtPYUhrJmzP2GISRoNhwfqODEHCVmJ5ndWBxO9vfMuCpB/mocporR
	 1GkZ3Fw4E/sHcjHX7mQcJKfdQoyEuBNJTS9Th6tC4MITOCEtYFjG8dE1SdYKVdCeq6vW6
	 2sHpjzg2o8ssQKWa4Qke115W3fjiNP8HtMmVPTXzGRuA3nE6Fwavh70R8EFIbXABS8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242897;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Organization:
	 Content-Transfer-Encoding;
	bh=hHaS+ftN8yPzDFvIun/EZKVknOKh7/K5G40GhrJsRd8=;
	b=jwoPZ9uvQs90xOPnl7kLLKsl/2Fp4j1xA6cKAZBdgQjHhLvXuaREFSGWkzqVPlvB6eIN
	 NHoc/HdBIrDJ8Oz30iRdUU6KjqDIl7Cg+DlYghbyaoD9FicKXG1XKRHEsaBqoxFjFt+2N
	 uOy/lJUqvFJOvRRCImbMd9dbEq+k0y+EWZffFJOzroo6HGx+DQJTXdwRYIEZffsGqJqFj
	 WQp1IwkvHGH0awhyjaak2hhNfp88RPFwLCht4+QIH7ZUrXHH8NsFo6Fwvr0NxYrMxubRE
	 fQ8ZeGlKFQweRT34METcadef5JpLhCNtvqQe9K6yaYsy/pBun1FvZDrJTjoxUwgz8tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dhBhaHWG;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EBD606A31C;
	Mon,  9 Nov 2026 16:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26EBD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dhBhaHWG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794242897; x=1825778897;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tCG0G3JVI4tRqcPbvjLwK+Qe1NPh0Vqhwwedp+CSJiA=;
  b=dhBhaHWG72ZPQLiNcm/vQ28Awqke/DcO1EQUVK8OF0qHYULpw0vUMMYy
   NK59KbaJ8Rt2BKRTVSxeECT31EtfSrTi+Qb0tj93Jco3irfGmyDU7SbqY
   1C15VDUhKT+oH1ob5EgGJdQGVytmY9IE/ur6599NiBy6XGfmRO88gUG3U
   honKeQ6qVyZX6UHfVTyz+lr2tV34Pk4ZXIEoFJtdpNPEVL+dzkk7fXhcT
   FLU7s3yRQ+c4UNCprSRmowqc1R4gXESuFW9zm3HgWOXEY9p2XS5yxh7Sn
   FmJNfdSyIMr2+U11Ykiwf9qfNNLKaZz9pCfGoqb3rvOs23+xTPZqm7RVd
   w==;
X-CSE-ConnectionGUID: RRm/3NaaSSyZPirn4uhKSg==
X-CSE-MsgGUID: 00k515ZaTRqE7IEJ8fsg7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3010676"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3010676"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 08:48:16 -0800
X-CSE-ConnectionGUID: DjDpGG6OShSaS9F04spwkw==
X-CSE-MsgGUID: rO5iguyOTg+BaUmM3h/VgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8481199"
Received: from gklab-103a-129.igk.intel.com ([10.91.103.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 08:48:13 -0800
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
Subject: [PATCH v5 0/3] arm: dts: aspeed: Add Intel AVCRP and JNCRP BMC platforms
Date: Mon,  9 Nov 2026 18:41:47 +0100
Message-ID: <cover.1794242015.git.dawid.glazik@linux.intel.com>
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
BMC platforms. Both are x86 server platforms with Intel host processors,
managed by an ASPEED AST2600 BMC.

The first patch adds the board compatibles to the ASPEED binding. The
remaining two patches add the board DTS files and register them in the
ASPEED DTB build list.

Changes in v5:
  - Removed bootargs from the chosen node
  - Added a description of each platform to the commit messages
  - Capitalised the first word of the DTS subjects
  - Rebased onto the current aspeed/arm/dt

Dawid Glazik (3):
  dt-bindings: arm: aspeed: Add Intel AVCRP and JNCRP boards
  ARM: dts: aspeed: Add Intel AVCRP BMC
  ARM: dts: aspeed: Add Intel JNCRP BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   2 +
 arch/arm/boot/dts/aspeed/Makefile             |   2 +
 .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 321 ++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-intel-jncrp.dts     | 275 +++++++++++++++
 4 files changed, 600 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-jncrp.dts


base-commit: 6767ba3efdda2d27e5eab719db39a7ed98d28b35
-- 
2.43.0

