Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894663B058F;
	Fri,  9 Oct 2026 07:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530161; cv=none; b=tmZBIBtzq8OGdFDeDmdy9f0s5CPolDQ3nXJ0vGr0D7W9dzszDDZmRqi/j4QTq73dKA1GAI2kPKAY7Pb1OpwJk15E+wbYnSCc/Ul/8skQXrm5vTMHdepokZ5adcXFVZev2sa/oz1YjCtUDhC7lJ+kQRXkNgvv9g4s0z6faLaZqtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530161; c=relaxed/simple;
	bh=frDbYnuN5wzbU8V6z78m0FPDsCjoDX8J54ZVqLmRxnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0tby644D918nEGaXgi8hsHEsfnHwjCgJS7UPwZ9cvETjBIy4uFlH3KbOC5P16yEaE+VD7dECZf5iW3mQm37u3VBkrID1jk4TdflvYjFu96Cx5Afjgd72+Mxm3O+MUGKj+XmjTW33frugJf4uDA0DCzXu9GNTHKQNZAm27xkvkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L8ZrUF77; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L8ZrUF77"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791530160; x=1823066160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=frDbYnuN5wzbU8V6z78m0FPDsCjoDX8J54ZVqLmRxnk=;
  b=L8ZrUF77eW7dkvN501Rt3vlzApqcHLIp7PJF5nq6kOD5BgBqB01Y6nvQ
   +VB/4b5paMN/XY1HLxxL33khc/ub2M/e+qUlpE4YZXGK6mDiwoKM45fa/
   2uMgMty+jYI/MiDWqiONi7buwHky5PQM62TdOslduYy4DkVc0fNKsPmoV
   nP1MAEsIduoost4kIjERfAPGAA92ohzJeRZD6XlKrg6W0v52y3ZnXVafO
   5WbQer9SlqxbxO9NLjQnkMAsAujsqoIW055S4lE7Co3EJSkQP60ad7S1G
   MBZSN1Tx149cllmetX2xnrX7NCKvQZzAxR2FiUVO14s5l/r1yHy8VMYlx
   g==;
X-CSE-ConnectionGUID: Z6rdaxOSRJ2VYOyU5LGnLA==
X-CSE-MsgGUID: L8ukCZ6kTMuWvnm/Lxn6jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="336912"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="336912"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 00:15:04 -0700
X-CSE-ConnectionGUID: VN43JGbVTcOAqCtNrQ9MCA==
X-CSE-MsgGUID: 1xM6lJ34QAyWrhgL7Nfo+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="703258"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Oct 2026 00:14:45 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF4oT-000000005S4-0uxX;
	Fri, 09 Oct 2026 07:14:41 +0000
Date: Fri, 9 Oct 2026 15:14:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bod@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Keke Li <keke.li@amlogic.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
	Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
	Robert Foss <rfoss@kernel.org>,
	Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 21/74] media: qcom: camss: vfe: Represent vfe wm inside
 of a struct
Message-ID: <202610091546.gjktxCLS-lkp@intel.com>
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-21-ed985aefd611@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-21-ed985aefd611@kernel.org>

Hi Bryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8d3ae59288f1e7d58d76558a6ee96d533bc5019f]

url:    https://github.com/intel-lab-lkp/linux/commits/Bryan-O-Donoghue/media-qcom-camss-vfe-Rename-gen3-back-to-vfe780/20261005-191331
base:   8d3ae59288f1e7d58d76558a6ee96d533bc5019f
patch link:    https://lore.kernel.org/r/20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-21-ed985aefd611%40kernel.org
patch subject: [PATCH 21/74] media: qcom: camss: vfe: Represent vfe wm inside of a struct
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261009/202610091546.gjktxCLS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091546.gjktxCLS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091546.gjktxCLS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/qcom/camss/camss-vfe-17x.c: In function 'vfe_get_output':
   drivers/media/platform/qcom/camss/camss-vfe-17x.c:395:16: error: assignment to 'struct vfe_output *' from incompatible pointer type 'struct vfe_output (*)[1]' [-Wincompatible-pointer-types]
     395 |         output = &line->output;
         |                ^
>> drivers/media/platform/qcom/camss/camss-vfe-17x.c:408:15: error: 'struct vfe_output' has no member named 'wm_idx'
     408 |         output->wm_idx[0] = wm_idx;
         |               ^~
   drivers/media/platform/qcom/camss/camss-vfe-17x.c:417:35: error: 'struct vfe_output' has no member named 'wm_idx'
     417 |         vfe_release_wm(vfe, output->wm_idx[0]);
         |                                   ^~


vim +408 drivers/media/platform/qcom/camss/camss-vfe-17x.c

7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  385  
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  386  static int vfe_get_output(struct vfe_line *line)
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  387  {
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  388  	struct vfe_device *vfe = to_vfe(line);
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  389  	struct vfe_output *output;
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  390  	unsigned long flags;
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  391  	int wm_idx;
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  392  
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  393  	spin_lock_irqsave(&vfe->output_lock, flags);
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  394  
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  395  	output = &line->output;
8ce158c1be981b drivers/media/platform/qcom/camss/camss-vfe-170.c Milen Mitkov 2022-12-09  396  	if (output->state > VFE_OUTPUT_RESERVED) {
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  397  		dev_err(vfe->camss->dev, "Output is running\n");
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  398  		goto error;
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  399  	}
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  400  
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  401  	output->wm_num = 1;
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  402  
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  403  	wm_idx = vfe_reserve_wm(vfe, line->id);
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  404  	if (wm_idx < 0) {
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  405  		dev_err(vfe->camss->dev, "Can not reserve wm\n");
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  406  		goto error_get_wm;
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  407  	}
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16 @408  	output->wm_idx[0] = wm_idx;
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  409  
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  410  	output->drop_update_idx = 0;
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  411  
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  412  	spin_unlock_irqrestore(&vfe->output_lock, flags);
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  413  
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  414  	return 0;
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  415  
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  416  error_get_wm:
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  417  	vfe_release_wm(vfe, output->wm_idx[0]);
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  418  	output->state = VFE_OUTPUT_OFF;
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  419  error:
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  420  	spin_unlock_irqrestore(&vfe->output_lock, flags);
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  421  
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  422  	return -EINVAL;
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  423  }
7319cdf189bb64 drivers/media/platform/qcom/camss/camss-vfe-170.c Robert Foss  2021-03-16  424  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
