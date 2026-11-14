Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667855;
	b=Rd/fpXzCMofdoWljLukMkDBq156f2lfHu/tyuVbX+x7NxC9CdsgFtTWL+ePehTKcn5pH
	 iwRYqFZ4KZq+Tm9Te/2z8yJdhMP1xEKDbGZozddivVZgGn2td07QJ91YwIqdK9lieWCBM
	 ndjc0pKYIkC59lv5uqkFp1i8ZRsSfYjgv2/Zx9uWqW9SZHw94oHaN4BQwaARqe7mgeqIp
	 MVlBFglGJ9VEnJF2vQlQjei/3Sfp6SXszVh4OsFWMELwAT+Lgd2ao02pl5ylTe8+sX41F
	 L3FEpYcBFfWzSBvaVsEt+z8qFcTPiV9rzCKDetWBz9b7uu2BcBoRe7UPPt5hQFi+O4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667855;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=IWB0UASjsW7G8RxuPodnDnfnf95ZQ/rwz8c9sMUFiBk=;
	b=OmeMRSwNw+NhCQx0MIzFCunxONaqLbQzKlrtrLXJby9VRck1kKLG8WRCtwDy9mqBv9Hb
	 WFwljyDj1SCuhhS5K0tNkvDtvAiFsPS4oEk016mf1bhftVVUGq/tae5XPNgv4gWSRXmtI
	 y82g+kJKXyIpgRoDycEYaoREpg7TkSUJ2fXMAuWOTeaEbEJAZy5fKOQJmHB3sAX07kEGS
	 T3l8X9xGhbmG/xxHDQYacxcYZnNdvGU+GpB09e+WggeFambwzGFXeBNJgUGJOCQfWUKPp
	 Fdy8/tqd1pt+mkHviJk0Mdm9gcCHBscTzVx8lF4i1kZmlmNFuGZht+aDh1WBdaZsSDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E4qdlJT4;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9489F606A327;
	Sat, 14 Nov 2026 14:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9489F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E4qdlJT4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794667855; x=1826203855;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xfSb5R7QVeGowcxt6acIHVsFPIN1UpvT8ACebsp3uZs=;
  b=E4qdlJT4UzjHtJQjflayjr+ildmt6kSXIpoRdU0TISCmsI1Iy/yiSO/f
   DNGIilGhwwFwy+bYXA813eQ9CtJCu+9+DklZ680+5nfEJbb7ZOz/iD0Js
   3o+S+DgaRPH71JYKIoYZP2la9khtO386NKjakOU8+IhyLidh7K73953Qo
   N/yX1l7w35VmPrsnP1mQbRJk2/2R2JcK3rbK1cdXnMD0xBc9/pDXM3GDZ
   CGbp9PoOVFL+1vbcB+owYs472jqODcYauS0QrtEqaAL7Uu032RPnqERZp
   HJwqnLAYxlbwtaG//TQpIQjDlnt44gT0AaZLjxfVS5ENUhTO3kCQPnDG2
   A==;
X-CSE-ConnectionGUID: WhrrB8lCTXO8Ntqgt4emYQ==
X-CSE-MsgGUID: idvXyHUtSAqna8DCx9QXWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3491724"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3491724"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 06:50:54 -0800
X-CSE-ConnectionGUID: WDUILf8cSCuARF2hXQQ1Ig==
X-CSE-MsgGUID: wIArbPdDQ7Wlmv3HV+HTsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9160945"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Nov 2026 06:50:47 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSF5Y-000000015cW-0yZg;
	Sat, 14 Nov 2026 14:50:44 +0000
Date: Sat, 14 Nov 2026 22:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org,
	netdev@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/9] remoteproc: qcom_wcnss: migrate to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Message-ID: <202611142207.UkqcyoQJ-lkp@intel.com>
References: <20261113185009.157893-3-mukesh.ojha@oss.qualcomm.com>
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
In-Reply-To: <20261113185009.157893-3-mukesh.ojha@oss.qualcomm.com>

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on remoteproc/rproc-next]
[also build test ERROR on drm-misc/drm-misc-next ath/ath-next linus/master v7.4-rc2 next-20261113]
[cannot apply to linux-review/Mukesh-Ojha/remoteproc-qcom_wcnss-migrate-to-qcom_mdt_pas_load-and-qcom_pas_prepare_and_auth_reset/20260925-212730]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Ojha/firmware-qcom-pas-add-qcom_pas_context_init-for-pre-allocated-context/20261114-002001
base:   https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20261113185009.157893-3-mukesh.ojha%40oss.qualcomm.com
patch subject: [PATCH v2 2/9] remoteproc: qcom_wcnss: migrate to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261114/202611142207.UkqcyoQJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611142207.UkqcyoQJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611142207.UkqcyoQJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/remoteproc/qcom_wcnss.c: In function 'wcnss_load':
>> drivers/remoteproc/qcom_wcnss.c:161:75: error: passing argument 4 of 'qcom_mdt_pas_load' makes pointer from integer without a cast [-Wint-conversion]
     161 |         ret = qcom_mdt_pas_load(wcnss->pas_ctx, fw, rproc->firmware, wcnss->mem_reloc);
         |                                                                      ~~~~~^~~~~~~~~~~
         |                                                                           |
         |                                                                           phys_addr_t {aka long long unsigned int}
   drivers/remoteproc/qcom_wcnss.c:161:75: note: possible fix: take the address with '&'
     161 |         ret = qcom_mdt_pas_load(wcnss->pas_ctx, fw, rproc->firmware, wcnss->mem_reloc);
         |                                                                      ~~~~~^~~~~~~~~~~
         |                                                                      &
   In file included from drivers/remoteproc/qcom_wcnss.c:25:
   include/linux/soc/qcom/mdt_loader.h:24:58: note: expected 'phys_addr_t *' {aka 'long long unsigned int *'} but argument is of type 'phys_addr_t' {aka 'long long unsigned int'}
      24 |                       const char *firmware, phys_addr_t *reloc_base);
         |                                             ~~~~~~~~~~~~~^~~~~~~~~~


vim +/qcom_mdt_pas_load +161 drivers/remoteproc/qcom_wcnss.c

   155	
   156	static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
   157	{
   158		struct qcom_wcnss *wcnss = rproc->priv;
   159		int ret;
   160	
 > 161		ret = qcom_mdt_pas_load(wcnss->pas_ctx, fw, rproc->firmware, wcnss->mem_reloc);
   162		if (ret)
   163			return ret;
   164	
   165		qcom_pil_info_store("wcnss", wcnss->mem_phys, wcnss->mem_size);
   166	
   167		return 0;
   168	}
   169	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
