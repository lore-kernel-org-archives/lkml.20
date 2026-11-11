Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387769;
	b=kOstfmY8WwuSMMbepfVEf1063mEJq1TpeIF9X/gcVlGKhgu55mcU6FnRH5jO4NIcmVGJ
	 h1MQ2+ERlnyrUtgGaQuwkzV8dGcDQaYNlPMAjPfyxUpGzjvXu0uPfM/T6hAOpQpMHmuE0
	 ytU83lz0Dy9n4TRUg1fbkxfMe37SqXapWIZh2dUg8wdMoZ9q/wSNYYSVDkTUkVsRaotFh
	 hix8MaXuS5FzVkmlQ0Rju8zo0nVkMGwDiiMPZsPBwNgiXLZhgAK8JMCh5EBTDX6nOlXQr
	 qbINzNmNd6lgVA12PPVtLV4qBPCwOaAIYVJXaBwzHrSOy+4/oq+uHYKhv7tFEQW7ziQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387769;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=fA0CrudIldGAzEYeXgkIOktTWC5p5IzNgPAGdyz8uqE=;
	b=KIVVve7rdMzD2WDZgzwOLJ7vkqQu6pHf64U2Vqtxcfm/957BBAFTX3LpNKT7o9YbPDS7
	 bvly63FfC4sRWejv0m5Gy293Isrk4K5AgPMD5iKbEZtSeQTLU8Ks75hWMpNrj7ao4RPP3
	 Rc5tJ/wrofmkkBvegKERxoTudLobdAkoQuQjyQ/atFHtjj4PvYYxkxsU/2B6MDJefsKYu
	 cAp68upKgS3HiLOCl9EW0TC7LRGWV7Ez2O8tRJYwT1eoWDd35h56q1YlgvBia1sTg9enu
	 nIhGl4XKLb5kDDLErbYOF8wtV5NR7J5QjvVt5Y7zY4ldVdFDcVVk+SuAp99NHNz7keQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PvFaa5eU;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCAB60A2605;
	Wed, 11 Nov 2026 09:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FCAB60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PvFaa5eU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794387768; x=1825923768;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3yCEwnrLArTIVhD80GIZMfz7K0Gfo68QlqftQ+sAMg8=;
  b=PvFaa5eUm5atwy+2qJOWZUawvIjoAcetmtwQOt+c0cvw+Q36MsxiW4gK
   KTYtRsA7iYVukwJHPjZB9uEAOCDTJMsQZEumRbN3CPc60+DOesGdoiQWQ
   2R/Io2zqqiyuRRyv9QTsvD+C1Vsg1ToE0p6NFnZTNnFO9ZKCih87SNDNs
   3WW+2//suM1iYmWmNRPN9VTxjS9tBsqecIBSSkpzqyhszq3tHpU3NmLTm
   HOA94zu5ArD5PU6KRrvT3D+43KGoJjVP2LMmCeIeegZv2W3AePoE56RyS
   S2eZRs5mSDmqCcU7AIUhaW1kbB2cVoxXh/bn8WF2py528/OFKm7NpVXOM
   w==;
X-CSE-ConnectionGUID: MXM7BfnST+WQ2OJLQ2U3hA==
X-CSE-MsgGUID: 6zjnxaHFQvu2aJjji0sfDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3177276"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3177276"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 01:02:48 -0800
X-CSE-ConnectionGUID: d/JJk4NqTd+7gjSsn8XKIg==
X-CSE-MsgGUID: TttB2Ms8RhSu9+OEWm9a8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8793019"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2026 01:02:44 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR4E6-00000000yVN-0J9N;
	Wed, 11 Nov 2026 09:02:42 +0000
Date: Wed, 11 Nov 2026 17:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
	linux-media@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, bod@kernel.org, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org,
	loic.poulain@linaro.org, dmitry.baryshkov@oss.qualcomm.com,
	gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 4/8] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <202611111649.n31NJmoJ-lkp@intel.com>
References: <20261110163909.78085-5-atanas.filipov@oss.qualcomm.com>
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
In-Reply-To: <20261110163909.78085-5-atanas.filipov@oss.qualcomm.com>

Hi Atanas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 630059a5a632377b9b7b487baccde92b7ae1dd47]

url:    https://github.com/intel-lab-lkp/linux/commits/Atanas-Filipov/dt-bindings-media-qcom-Add-JPEG-encoder-binding/20261110-183902
base:   630059a5a632377b9b7b487baccde92b7ae1dd47
patch link:    https://lore.kernel.org/r/20261110163909.78085-5-atanas.filipov%40oss.qualcomm.com
patch subject: [PATCH v8 4/8] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261111/202611111649.n31NJmoJ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611111649.n31NJmoJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611111649.n31NJmoJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
   tc358746.c:(.text+0x1d24): undefined reference to `devm_clk_hw_register'
   sh4-linux-ld: tc358746.c:(.text+0x1d30): undefined reference to `devm_of_clk_add_hw_provider'
   sh4-linux-ld: tc358746.c:(.text+0x1d34): undefined reference to `of_clk_hw_simple_get'
   sh4-linux-ld: drivers/media/platform/qcom/jpeg/qcom_jenc_dev.o: in function `qcom_jpeg_pm_suspend':
>> qcom_jenc_dev.c:(.text+0x74): undefined reference to `clk_set_rate_range'
   sh4-linux-ld: drivers/media/platform/qcom/jpeg/qcom_jenc_dev.o: in function `qcom_jpeg_pm_resume':
   qcom_jenc_dev.c:(.text+0x2e4): undefined reference to `clk_set_rate_range'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
