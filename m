Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398186;
	b=A4HJYYe21+9Zedu0GxBGO1jjVWgRnOM5VgcEo9PRI9XB+k4nlZTcArFw19EnZaiJijYf
	 yU8fJiMvlNAE4fU4KWF/0JhAUpNHeRzOBZdjQhxj9uazFbz6tKOcXBMKYL6vu048e6Z/y
	 r05c1pENmR/J6ItEm4kW412LzFFBx/oEtWD87jFehYMykatAvikrwM/e7xaTN7Td+UioR
	 2Bg/s2Ar/E2qm5CTPcZhLOefX9oyZLHg2Ds8GLo79fXwyldY/RJ/b938DlDEhsRCo0UZy
	 PFtng8wesLjTwgGkTtpjK6I8u2JRBeENBvgvwOROurgkti/wHZRdo9YXcH4wXNqfCnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398186;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=mB+4CSyHNjp+rbmjLUMlfuLrwoz33uSYabd9B9NkTj8=;
	b=Rzc+0x2fL5sH42fzmLyaIy97DTURRatxXEBeczNX7i4Ktf63qUpYiIA4vDXbouk1bDmT
	 Ep1R7zYoXZAa//xDtze1Iithw6CM6grSnNcmR8nwXOzzGTR5V8l2LEkKY2OfBUncCcYfz
	 hQFd1YizM8pqqqrqQ2d6iWBaaujgiawU+sfL6N7Q8oOV6ajiCR2tLCVYnov03v+IktWtd
	 As0Ozvfz4OYozQyS2kaYyG3A0AcSX//Cb58oN5kzUQImgUfmf0mT1ricReXHfFi3Ls42Q
	 inGMG3j3+lnTkjTaLKpzOr+SwnisL+2h9mVnPk0PTy6Nr07ZHep5elnf2M6YZiMxqBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hKr57dyx;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90D2606A327;
	Wed, 11 Nov 2026 11:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D90D2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hKr57dyx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794398186; x=1825934186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WAI3fHizBxLRZPCvINv8vAUYHRI9fsCvBuX37VaFgF0=;
  b=hKr57dyxwhZgdRG1O6ZyJZDymgGGaGRIdueJD7C5KTNUUOAvVBLH+F4T
   hq07zJkkSuvBmUlDo1vboMXaww/xX2MmOpJy3IAKsWFJMStZniGwRZ6LD
   q9MYrMUN+IaFZ+7D8RUTDkTgmLBNON8q3zBzLwKIwKVY7dfgdI7gztGOt
   1th6oNay1f7eufvTZNnoS6HMTkR2l9voJrlpQHHgnxghtsFQL6ZsXyAVw
   myO7XzwaTPSMC/zsR5aKR1G7R7dNiaobeh1hPWcq1qKkE6sDzqKYR8zde
   eUmGW+nTgYmOlEnIfVBdWSLhjpgK8801Hwo/Jp3X22UkMjrzn/NPGM8X2
   Q==;
X-CSE-ConnectionGUID: MAdaNEupT3C+SUUd6Fv7gQ==
X-CSE-MsgGUID: ztxtEiR9RDOyEKzRpY5JeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3087801"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3087801"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 03:56:14 -0800
X-CSE-ConnectionGUID: LFoS2Vv7TMKMkADgfwpXQg==
X-CSE-MsgGUID: Y5hzoYFrT1q+uD/P/lQnXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8579510"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Nov 2026 03:56:11 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR6vw-00000000yof-1HmD;
	Wed, 11 Nov 2026 11:56:08 +0000
Date: Wed, 11 Nov 2026 19:55:39 +0800
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
Message-ID: <202611111900.i6qY7F4C-lkp@intel.com>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261111/202611111900.i6qY7F4C-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611111900.i6qY7F4C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611111900.i6qY7F4C-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: drivers/net/mdio/mdio-cavium.ko: symbol '__delay' undefined!
ERROR: modpost: drivers/media/i2c/tc358746.ko: symbol 'devm_of_clk_add_hw_provider' undefined!
ERROR: modpost: drivers/media/i2c/tc358746.ko: symbol 'devm_clk_hw_register' undefined!
ERROR: modpost: drivers/media/i2c/tc358746.ko: symbol 'of_clk_hw_simple_get' undefined!
>> ERROR: modpost: drivers/media/platform/qcom/jpeg/qcom-jenc.ko: symbol 'clk_set_rate_range' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
