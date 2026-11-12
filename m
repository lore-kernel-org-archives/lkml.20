Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444067;
	b=2USTRAxFHK6B00ZLrtfXSYGEPaTA38RNECpS88caY12oR+sYaUR0v3wU3Q0gb+jjnyyw
	 KOO4W6EsgXSISAQ1hbIGZWcYvlmpJpVdmxaNkjK5n3RqwTqkXuHTT6KoVixec7NUWrqvN
	 tLxru/E5d76WCmzlijOf1ecMlXMQRdovMcjfS5GLacx7Hz08yCcRZrPp6DBtXDT7n1zph
	 Poun+xqXRQFyjwx5MAKUwgIYm0t4kmIJX8w5dpAPva+YbcVfjQpdrpKkmwoG3Y3lFKMR/
	 8k0ZRzoVBhitmWlM8PPqOwZpOmkrfdIjOAHDES5+mxXYCWHwE6sF8AdxOc1Xrcq2bAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444067;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=soXPHNrlC+K9hzcz2ros2E9+STw8+JlZAj9YF0ZQeRM=;
	b=FGXPe4ka+pn0wAFT5eS61RW7dQGpFnSLq2goM3GnQLG8SZGGA+mo+Go62qH6DqdN3tqX
	 Ua7/QmZLfrJ5MNOVrGvYtwEu+Cq830UHnq5d7UfAOwjAGEUu79nsGu1dY8W4Pk8G78P4o
	 oUnGHsvyVfkINlm3HMwfKilaspUNOBsICi34SA7594XvGkubGsRy8UNpUWMVUwo1C1tLX
	 deBg24u9ffHPNsldui08+IiGMwUwCvLhVgnQbITQIn0cX6sBr/HmCTrBjz1YggtJuEYlA
	 rsavJG1u5J8XcWteRQ9F79ttxjWJHALbiT9xHoYIlBiRYWsI1/AxbpPNALkUdO8vjUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cABKmf5F;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBB2606A327;
	Thu, 12 Nov 2026 00:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EBB2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cABKmf5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794444066; x=1825980066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4uJfis9jIEhjxc17iF7LaSJGR1dtbAC0EB7+KB9AUhk=;
  b=cABKmf5Fff2s7JnNZLHLeyxxYsgezgtGkMa54A4FRd1hta48+5BZOtCu
   IKFFeqx2WbzTUQnsagsuAbHEuj3PXBj1xe4esjGrmnTiyaZcA+xKUlRpW
   dTY4ys5ZHFPrEGaNcz3zwBnwFRo7clV0xC9mTICEP3FN36hu2bFidIFPd
   kFULfqAoTxipUu6AQM052Iykw9CF3xG/RiAGEjUZ6KQJNkg8U3GbSYy/0
   Yflv1FAAO7uaVTGWOUfX53604vJDWETyTPXZUZsUkaM8E2ZjmfGrtaFKp
   QqK1vDLBnvjeT4JG1LvhH5rcxt1u8Sqt9yloZlIdTbZnky07vqCQbKN5o
   Q==;
X-CSE-ConnectionGUID: d//0UKBHTbKm3N9HQR1vfA==
X-CSE-MsgGUID: 1UMyx/2zRm6OwlWHH8LkFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3115403"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3115403"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 16:41:06 -0800
X-CSE-ConnectionGUID: Ur78ar/STFG8P5N+655ZiA==
X-CSE-MsgGUID: wu/saDbJQCmymWk1qTGM/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8489130"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Nov 2026 16:41:02 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRIs7-0000000106l-0m9c;
	Thu, 12 Nov 2026 00:40:59 +0000
Date: Thu, 12 Nov 2026 08:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] phy: qcom: qusb2: Add charger detection support
Message-ID: <202611120841.GECRO9c3-lkp@intel.com>
References: <20261111-shikra-qusb2-charger-det-v1-2-5a9d919c66b5@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-shikra-qusb2-charger-det-v1-2-5a9d919c66b5@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Kurapati/dt-bindings-phy-qcom-qusb2-Add-support-for-remote-endpoints/20261111-230126
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261111-shikra-qusb2-charger-det-v1-2-5a9d919c66b5%40oss.qualcomm.com
patch subject: [PATCH 2/2] phy: qcom: qusb2: Add charger detection support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261112/202611120841.GECRO9c3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120841.GECRO9c3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611120841.GECRO9c3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'is_phy_enabled' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'vbus_active' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'id_state' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'usb_psy' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'port_det_w' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'port_state' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'dcd_timeout' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'dcp_charger' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'connector_role_sw' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'controller_role_sw' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'current_role' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'role_lock' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'is_phy_enabled' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'vbus_active' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'id_state' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'usb_psy' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'port_det_w' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'port_state' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'dcd_timeout' not described in 'qusb2_phy'
>> Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'dcp_charger' not described in 'qusb2_phy'
   Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'connector_role_sw' not described in 'qusb2_phy'
   Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'controller_role_sw' not described in 'qusb2_phy'
   Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'current_role' not described in 'qusb2_phy'
   Warning: drivers/phy/qualcomm/phy-qcom-qusb2.c:552 struct member 'role_lock' not described in 'qusb2_phy'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
