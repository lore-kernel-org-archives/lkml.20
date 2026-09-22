Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065014A64F4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059479; cv=none; b=IURe2Xq1vBY9g65U/GHPHDOvdMr0t1Fd6lJZqAAS7e47YEkaiPQwgTwYy6PPo4tqyoBabnF5e3iEq7IkgBORRcuEsr57p1NFINbvou5v5Ii11Hg8KjVOz8lctdUF9rSOMXkaVwVajvs/iMfRsUHarNpIeD+htDRMbykBYAQADrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059479; c=relaxed/simple;
	bh=Dhu0hyoCEsbj+OnFPgqYbioPlXT9FXZOJdmKeoRR6lk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gyHf8QUZ6jsMUsHpQf/xJE7+p89lsh7pemMBfZBdVqeq3zR4F5a1aMSIgVLdm2xdeMg17QV3Sl9STEU21YlwTklHAQ1/K1X7fONzKDTyP8pha3dihgPKOb1ZdJzxD+cmBnH3et0NUQFBmNHsr6gq8jpJ327rSX0uMexnMBmIA9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i3S6gbqK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i3S6gbqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790059476; x=1821595476;
  h=date:from:to:cc:subject:message-id;
  bh=Dhu0hyoCEsbj+OnFPgqYbioPlXT9FXZOJdmKeoRR6lk=;
  b=i3S6gbqK6NKswXmuq02YSSwt1P+/ZMXG0XY3OkRmzrmUBKkRKGG1CTeG
   aS6ejn/mi+i/+fshzYs4SoW1kT9P+C1tRjPnpkkI4+9hAoLvVB/XyCPRr
   siNGtqK25VZvi9eQvoXuHGVdDMWIFUS+IdEbB/XLbdzWV0+tU4OrcVQ15
   YPr+ks1FjCESIRiN6E4WKN9ZIdCD1oM+wGcNntIk16dB5YrIBJwWmXaRr
   4WvHBjGGbUuW74pIQAoSdEnZTCu/jVk6fIGBXzsQUtfs95Rm0FW2+adz8
   47VJZPIjqr0UztpW9zI4Rd06NLrfnyy8ORI6HgosKgstNH+/RIKEdUxVO
   w==;
X-CSE-ConnectionGUID: 5t/vFu+UQSKb7kud02nP0A==
X-CSE-MsgGUID: B7u4nxwyR7GfOtgFzAYZPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90499861"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="90499861"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 23:44:35 -0700
X-CSE-ConnectionGUID: xcaGmwPtQ3+vomBciyMznA==
X-CSE-MsgGUID: PLWjBDEJRpWbtcLg1OSiXA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Sep 2026 23:44:33 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8uEw-00000000F68-2fqn;
	Tue, 22 Sep 2026 06:44:30 +0000
Date: Tue, 22 Sep 2026 14:44:30 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Georgi Djakov <djakov@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: drivers/interconnect/qcom/icc-rpmh.c:176:28: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202609221350.3Y8MOce9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: c96fc14322cee45cdf751cb4ae62c9eab25bc643 interconnect: qcom: add COMPILE_TEST
date:   9 weeks ago
config: openrisc-randconfig-r1309-20260922 (https://download.01.org/0day-ci/archive/20260922/202609221350.3Y8MOce9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609221350.3Y8MOce9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c96fc14322ce ("interconnect: qcom: add COMPILE_TEST")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609221350.3Y8MOce9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/interconnect/qcom/icc-rpmh.c:176:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] unit @@     got unsigned int [usertype] @@
   drivers/interconnect/qcom/icc-rpmh.c:176:28: sparse:     expected restricted __le32 [usertype] unit
   drivers/interconnect/qcom/icc-rpmh.c:176:28: sparse:     got unsigned int [usertype]
>> drivers/interconnect/qcom/icc-rpmh.c:177:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] width @@     got unsigned short [usertype] @@
   drivers/interconnect/qcom/icc-rpmh.c:177:29: sparse:     expected restricted __le16 [usertype] width
   drivers/interconnect/qcom/icc-rpmh.c:177:29: sparse:     got unsigned short [usertype]
--
>> drivers/interconnect/qcom/bcm-voter.c:102:77: sparse: sparse: restricted __le16 degrades to integer
   drivers/interconnect/qcom/bcm-voter.c:106:78: sparse: sparse: restricted __le16 degrades to integer
   drivers/interconnect/qcom/bcm-voter.c:112:66: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] base @@     got restricted __le32 [usertype] unit @@
   drivers/interconnect/qcom/bcm-voter.c:112:66: sparse:     expected unsigned int [usertype] base
   drivers/interconnect/qcom/bcm-voter.c:112:66: sparse:     got restricted __le32 [usertype] unit
   drivers/interconnect/qcom/bcm-voter.c:115:66: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int [usertype] base @@     got restricted __le32 [usertype] unit @@
   drivers/interconnect/qcom/bcm-voter.c:115:66: sparse:     expected unsigned int [usertype] base
   drivers/interconnect/qcom/bcm-voter.c:115:66: sparse:     got restricted __le32 [usertype] unit

vim +176 drivers/interconnect/qcom/icc-rpmh.c

976daac4a1c581 David Dai   2020-02-28  138  
976daac4a1c581 David Dai   2020-02-28  139  /**
976daac4a1c581 David Dai   2020-02-28  140   * qcom_icc_bcm_init - populates bcm aux data and connect qnodes
976daac4a1c581 David Dai   2020-02-28  141   * @bcm: bcm to be initialized
976daac4a1c581 David Dai   2020-02-28  142   * @dev: associated provider device
976daac4a1c581 David Dai   2020-02-28  143   *
976daac4a1c581 David Dai   2020-02-28  144   * Return: 0 on success, or an error code otherwise
976daac4a1c581 David Dai   2020-02-28  145   */
976daac4a1c581 David Dai   2020-02-28  146  int qcom_icc_bcm_init(struct qcom_icc_bcm *bcm, struct device *dev)
976daac4a1c581 David Dai   2020-02-28  147  {
976daac4a1c581 David Dai   2020-02-28  148  	struct qcom_icc_node *qn;
976daac4a1c581 David Dai   2020-02-28  149  	const struct bcm_db *data;
976daac4a1c581 David Dai   2020-02-28  150  	size_t data_count;
976daac4a1c581 David Dai   2020-02-28  151  	int i;
976daac4a1c581 David Dai   2020-02-28  152  
976daac4a1c581 David Dai   2020-02-28  153  	/* BCM is already initialised*/
976daac4a1c581 David Dai   2020-02-28  154  	if (bcm->addr)
976daac4a1c581 David Dai   2020-02-28  155  		return 0;
976daac4a1c581 David Dai   2020-02-28  156  
976daac4a1c581 David Dai   2020-02-28  157  	bcm->addr = cmd_db_read_addr(bcm->name);
976daac4a1c581 David Dai   2020-02-28  158  	if (!bcm->addr) {
976daac4a1c581 David Dai   2020-02-28  159  		dev_err(dev, "%s could not find RPMh address\n",
976daac4a1c581 David Dai   2020-02-28  160  			bcm->name);
976daac4a1c581 David Dai   2020-02-28  161  		return -EINVAL;
976daac4a1c581 David Dai   2020-02-28  162  	}
976daac4a1c581 David Dai   2020-02-28  163  
976daac4a1c581 David Dai   2020-02-28  164  	data = cmd_db_read_aux_data(bcm->name, &data_count);
976daac4a1c581 David Dai   2020-02-28  165  	if (IS_ERR(data)) {
976daac4a1c581 David Dai   2020-02-28  166  		dev_err(dev, "%s command db read error (%ld)\n",
976daac4a1c581 David Dai   2020-02-28  167  			bcm->name, PTR_ERR(data));
976daac4a1c581 David Dai   2020-02-28  168  		return PTR_ERR(data);
976daac4a1c581 David Dai   2020-02-28  169  	}
976daac4a1c581 David Dai   2020-02-28  170  	if (!data_count) {
976daac4a1c581 David Dai   2020-02-28  171  		dev_err(dev, "%s command db missing or partial aux data\n",
976daac4a1c581 David Dai   2020-02-28  172  			bcm->name);
976daac4a1c581 David Dai   2020-02-28  173  		return -EINVAL;
976daac4a1c581 David Dai   2020-02-28  174  	}
976daac4a1c581 David Dai   2020-02-28  175  
976daac4a1c581 David Dai   2020-02-28 @176  	bcm->aux_data.unit = le32_to_cpu(data->unit);
976daac4a1c581 David Dai   2020-02-28 @177  	bcm->aux_data.width = le16_to_cpu(data->width);
976daac4a1c581 David Dai   2020-02-28  178  	bcm->aux_data.vcd = data->vcd;
976daac4a1c581 David Dai   2020-02-28  179  	bcm->aux_data.reserved = data->reserved;
976daac4a1c581 David Dai   2020-02-28  180  	INIT_LIST_HEAD(&bcm->list);
976daac4a1c581 David Dai   2020-02-28  181  	INIT_LIST_HEAD(&bcm->ws_list);
976daac4a1c581 David Dai   2020-02-28  182  
cb30e0292db258 Mike Tipton 2020-09-03  183  	if (!bcm->vote_scale)
cb30e0292db258 Mike Tipton 2020-09-03  184  		bcm->vote_scale = 1000;
cb30e0292db258 Mike Tipton 2020-09-03  185  
976daac4a1c581 David Dai   2020-02-28  186  	/* Link Qnodes to their respective BCMs */
976daac4a1c581 David Dai   2020-02-28  187  	for (i = 0; i < bcm->num_nodes; i++) {
976daac4a1c581 David Dai   2020-02-28  188  		qn = bcm->nodes[i];
976daac4a1c581 David Dai   2020-02-28  189  		qn->bcms[qn->num_bcms] = bcm;
976daac4a1c581 David Dai   2020-02-28  190  		qn->num_bcms++;
976daac4a1c581 David Dai   2020-02-28  191  	}
976daac4a1c581 David Dai   2020-02-28  192  
976daac4a1c581 David Dai   2020-02-28  193  	return 0;
976daac4a1c581 David Dai   2020-02-28  194  }
976daac4a1c581 David Dai   2020-02-28  195  EXPORT_SYMBOL_GPL(qcom_icc_bcm_init);
976daac4a1c581 David Dai   2020-02-28  196  

:::::: The code at line 176 was first introduced by commit
:::::: 976daac4a1c581e5d5fd64047519fd6fcde39738 interconnect: qcom: Consolidate interconnect RPMh support

:::::: TO: David Dai <daidavid1@codeaurora.org>
:::::: CC: Georgi Djakov <georgi.djakov@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
