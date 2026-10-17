Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C02339375;
	Sat, 17 Oct 2026 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792247080; cv=none; b=gUPO59XFK+X7f8ww4Kex08y4dzW20A1eEktnTxoIi9fyf3lYqwJc34O4sC7/NdOTpPyUu34R24q4CpHKDa4JDS+zqBXEGCjPaA2+K9K2UO0SUhLIWexESYWXW7B/UwXRF6lbMhffhoKZNotxSPIEVH53NXxDI/VKm+ZYhnMn7BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792247080; c=relaxed/simple;
	bh=QbHfjeIGKiQU338q0g8Oeylgixw3zvUk+tNkDLgIDxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4ZXxQkuP7/AQgq4na55NN9Eu17uWrL9Ji4I9hNvbdJPLnq3QYM6UHkqiNnbciCLfb6W7bTrNJoLiZwuDyNdIabNB4Zz1s+7E9n6+IaQU7dAwo7v5hJCxY0/ELD7gByzAGmJyBDKgEm/e/1biQy7xcCa65nO/isoGg6y4qkXqfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBypj0yt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBypj0yt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792247076; x=1823783076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QbHfjeIGKiQU338q0g8Oeylgixw3zvUk+tNkDLgIDxc=;
  b=PBypj0ytAtNAjVA9N8o/LsU6cOO+Qhn0BkeSlSKyXSpHAVbAudfGDTRO
   lzcrHc8XcgUmdmPTz5oInXDguHsrZIoZw1cLx/ykoE2sEGgI8YQ0puxE3
   x4XVRxZILOhPNuJviWNyiFGRLpRPB7COs+8d2YTPCWboc1nql76tr0bhC
   sw2DU5hPgtQMbUxEJUyddcLk9CVAUethOZnlLmXDEQLChuOhQWG7J0EZM
   doxA8bjbUMGp6fSeKtc5BWgpFauiH6toHLj2y+SPYNsBtLa1m6MTtnH3k
   WpKSOw+AWD7Px6xCgLC6vJAgwxP0PRUYVtXnTWDzWHO7LWeOozgRpaj0d
   Q==;
X-CSE-ConnectionGUID: PhsSHfN0Ssy5NZdDvUPf6w==
X-CSE-MsgGUID: zL851pA2QbiEgl4eCdv4wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="906138"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="906138"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 07:24:35 -0700
X-CSE-ConnectionGUID: HOZEW8DFQk2gJA2zyd7wTA==
X-CSE-MsgGUID: haglIp14ROaLRtm+xsBwMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="3935055"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 17 Oct 2026 07:24:31 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xI5Km-00000000JPy-32zq;
	Sat, 17 Oct 2026 14:24:28 +0000
Date: Sat, 17 Oct 2026 22:23:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	kernel@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: Use DP AltMode defines
Message-ID: <202610172234.PyocmhiR-lkp@intel.com>
References: <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>

Hi Sebastian,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0fcb05b72344f40806cbe810de8872f1698bf053]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Reichel/dt-bindings-connector-Add-DP-AltMode-VDO-definitions/20261014-233149
base:   0fcb05b72344f40806cbe810de8872f1698bf053
patch link:    https://lore.kernel.org/r/20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3%40collabora.com
patch subject: [PATCH 3/4] arm64: dts: mediatek: Use DP AltMode defines
config: arm64-randconfig-1001-20261017 (https://download.01.org/0day-ci/archive/20261017/202610172234.PyocmhiR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610172234.PyocmhiR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610172234.PyocmhiR-lkp@intel.com/

All errors (new ones prefixed by >>):

   Lexical error: arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi:600.25-45 Unexpected 'USB_DISPLAYPORT_SVID'
>> FATAL ERROR: Syntax error parsing input tree
--
   Lexical error: arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi:530.24-44 Unexpected 'USB_DISPLAYPORT_SVID'
>> FATAL ERROR: Syntax error parsing input tree

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
