Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E254968FE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160624; cv=none; b=gIwnr1KwXeMxWzDZXcAE2AkYZ1zOiMrT9V0UUppzS3DPLIhMEOLybqM40i0CcUH9T0Lh3oqpw34SPwJ2gk0rpqfZ5/dDWbFMWYEOImij4CB6spHmCWJ8ewx2vZ9SkwYHI/u8Lf2ta0S3372ayKrXb6fXCHeTtDWc1MqUo0o5jXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160624; c=relaxed/simple;
	bh=9YVglxgi/gmLjJr6PvGn+O793fCf4qaK/LYAtK23DUg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fArljnWeuoeih+7bAbMbkW+PU/i/bC5MC16AKBeaaTQF04YmF34W2Jng4HOhQIzLQ7CO0zBkC4C1/XC/nzaRa2VErxuo7uz33S0ganO85I9rpOJYLHRRpeoLgC6mc2yHsszMLcJs5qDeGSYksrjVGkAtx9vojpvCwvIEZs7JH7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QvNtslP+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QvNtslP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790160605; x=1821696605;
  h=date:from:to:cc:subject:message-id;
  bh=9YVglxgi/gmLjJr6PvGn+O793fCf4qaK/LYAtK23DUg=;
  b=QvNtslP+N9cNVpOSIZXvdIycG8AmeD7JSoyLyUBGnWuB8qFqhsg+jrfx
   78K6cWXSV7zcgpfJgxnvZ/krzveTrtmwZ4A0kZ5UwcU3ptPiTWlmaGN2V
   gjh7RNBl3FaZSBfyCeM546b3eXLsjvTONM+9vaduPz9xucoeRsTkfpV/g
   nIDb5I1Ln59CM1b+HzdO/vQk0bAfZV4LAWiYa4Ota4D8Jj76EKKoC9PJC
   02Ibb0jK7gZyXa70an4lKHDxhltfoUuP2+ZWnbPO1tKZ3B5RrA9sIgCy6
   QmcvWdUBXqSjmHww+nRHl+Yb/Cs5i7l8fYF0s9UGn4w1QTHKVXD2r127N
   w==;
X-CSE-ConnectionGUID: znz8NOVBRBm6IDxnYt3Imw==
X-CSE-MsgGUID: cAElAO/TRzGzi6N/CAE4Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="108339021"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="108339021"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 03:49:58 -0700
X-CSE-ConnectionGUID: Emj6mXmSR0GTwBm8yrQ5gA==
X-CSE-MsgGUID: 2lVbd/o/Q6SxxzKNXQGPEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="278287252"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Sep 2026 03:49:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9KXx-00000000Gxg-2rcB;
	Wed, 23 Sep 2026 10:49:53 +0000
Date: Wed, 23 Sep 2026 18:49:27 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: net/netfilter/nfnetlink_cthelper.c:254:22: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202609231853.Y4WT9aF7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: ac46f3f35b6e68fb062ae7cf780d516c0cf4c00a netfilter: nf_conntrack_helper: add refcounting from datapath
date:   4 months ago
config: parisc-randconfig-r1301-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231853.Y4WT9aF7-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231853.Y4WT9aF7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ac46f3f35b6e ("netfilter: nf_conntrack_helper: add refcounting from datapath")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231853.Y4WT9aF7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/netfilter/nfnetlink_cthelper.c:254:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected int ( [noderef] __rcu *help )( ... ) @@     got int ( * )( ... ) @@
   net/netfilter/nfnetlink_cthelper.c:254:22: sparse:     expected int ( [noderef] __rcu *help )( ... )
   net/netfilter/nfnetlink_cthelper.c:254:22: sparse:     got int ( * )( ... )

vim +254 net/netfilter/nfnetlink_cthelper.c

12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  212  
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  213  static int
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  214  nfnl_cthelper_create(const struct nlattr * const tb[],
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  215  		     struct nf_conntrack_tuple *tuple)
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  216  {
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  217  	struct nf_conntrack_helper *helper;
83d90219a5df8d9 Liping Zhang      2017-03-25  218  	struct nfnl_cthelper *nfcth;
157ffffeb5dc1b5 Florian Westphal  2017-04-16  219  	unsigned int size;
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  220  	int ret;
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  221  
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  222  	if (!tb[NFCTH_TUPLE] || !tb[NFCTH_POLICY] || !tb[NFCTH_PRIV_DATA_LEN])
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  223  		return -EINVAL;
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  224  
6031487d4e273d7 Pablo Neira Ayuso 2026-06-04  225  	nfcth = kzalloc_obj(*nfcth, GFP_KERNEL_ACCOUNT);
83d90219a5df8d9 Liping Zhang      2017-03-25  226  	if (nfcth == NULL)
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  227  		return -ENOMEM;
6031487d4e273d7 Pablo Neira Ayuso 2026-06-04  228  
6031487d4e273d7 Pablo Neira Ayuso 2026-06-04  229  	helper = kzalloc_obj(*helper, GFP_KERNEL_ACCOUNT);
6031487d4e273d7 Pablo Neira Ayuso 2026-06-04  230  	if (!helper) {
6031487d4e273d7 Pablo Neira Ayuso 2026-06-04  231  		ret = -ENOMEM;
6031487d4e273d7 Pablo Neira Ayuso 2026-06-04  232  		goto err_cth;
6031487d4e273d7 Pablo Neira Ayuso 2026-06-04  233  	}
6031487d4e273d7 Pablo Neira Ayuso 2026-06-04  234  
6031487d4e273d7 Pablo Neira Ayuso 2026-06-04  235  	nfcth->helper = helper;
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  236  
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  237  	ret = nfnl_cthelper_parse_expect_policy(helper, tb[NFCTH_POLICY]);
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  238  	if (ret < 0)
6031487d4e273d7 Pablo Neira Ayuso 2026-06-04  239  		goto err_helper;
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  240  
872f690341948b5 Francis Laniel    2020-11-15  241  	nla_strscpy(helper->name,
4b83a9049a983b2 Eric Dumazet      2018-05-21  242  		    tb[NFCTH_NAME], NF_CT_HELPER_NAME_LEN);
157ffffeb5dc1b5 Florian Westphal  2017-04-16  243  	size = ntohl(nla_get_be32(tb[NFCTH_PRIV_DATA_LEN]));
c593642c8be0469 Pankaj Bharadiya  2019-12-09  244  	if (size > sizeof_field(struct nf_conn_help, data)) {
157ffffeb5dc1b5 Florian Westphal  2017-04-16  245  		ret = -ENOMEM;
6031487d4e273d7 Pablo Neira Ayuso 2026-06-04  246  		goto err_helper;
157ffffeb5dc1b5 Florian Westphal  2017-04-16  247  	}
703acd70f249653 Pablo Neira Ayuso 2020-05-24  248  	helper->data_len = size;
157ffffeb5dc1b5 Florian Westphal  2017-04-16  249  
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  250  	helper->flags |= NF_CT_HELPER_F_USERSPACE;
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  251  	memcpy(&helper->tuple, tuple, sizeof(struct nf_conntrack_tuple));
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  252  
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  253  	helper->me = THIS_MODULE;
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13 @254  	helper->help = nfnl_userspace_cthelper;
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  255  	helper->from_nlattr = nfnl_cthelper_from_nlattr;
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  256  	helper->to_nlattr = nfnl_cthelper_to_nlattr;
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  257  
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  258  	/* Default to queue number zero, this can be updated at any time. */
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  259  	if (tb[NFCTH_QUEUE_NUM])
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  260  		helper->queue_num = ntohl(nla_get_be32(tb[NFCTH_QUEUE_NUM]));
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  261  
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  262  	if (tb[NFCTH_STATUS]) {
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  263  		int status = ntohl(nla_get_be32(tb[NFCTH_STATUS]));
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  264  
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  265  		switch(status) {
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  266  		case NFCT_HELPER_STATUS_ENABLED:
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  267  			helper->flags |= NF_CT_HELPER_F_CONFIGURED;
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  268  			break;
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  269  		case NFCT_HELPER_STATUS_DISABLED:
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  270  			helper->flags &= ~NF_CT_HELPER_F_CONFIGURED;
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  271  			break;
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  272  		}
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  273  	}
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  274  
6031487d4e273d7 Pablo Neira Ayuso 2026-06-04  275  	ret = __nf_conntrack_helper_register(helper);
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  276  	if (ret < 0)
6031487d4e273d7 Pablo Neira Ayuso 2026-06-04  277  		goto err_helper;
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  278  
83d90219a5df8d9 Liping Zhang      2017-03-25  279  	list_add_tail(&nfcth->list, &nfnl_cthelper_list);
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  280  	return 0;
6031487d4e273d7 Pablo Neira Ayuso 2026-06-04  281  err_helper:
6031487d4e273d7 Pablo Neira Ayuso 2026-06-04  282  	kfree(helper);
6031487d4e273d7 Pablo Neira Ayuso 2026-06-04  283  err_cth:
83d90219a5df8d9 Liping Zhang      2017-03-25  284  	kfree(nfcth);
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  285  	return ret;
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  286  }
12f7a505331e6b2 Pablo Neira Ayuso 2012-05-13  287  

:::::: The code at line 254 was first introduced by commit
:::::: 12f7a505331e6b2754684b509f2ac8f0011ce644 netfilter: add user-space connection tracking helper infrastructure

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
