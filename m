Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794665930;
	b=s1gpHQ10t3FP5vzcM8Vh4HnQDgZ5hiIjyO4GFxTzTfC9SlRq/sNXm/rpEWat3xN3FrSb
	 gCAA58b73oLPDZcoAMAit2aKNhs+3oyNhpiwNvMeM/ugsshC2Hgtf0G8c9fduQE3wuBJU
	 ktNKlJ3axdokY18hhhu4zpdWaDYOrqwBS5F6W11dVqNNswqbYJDewc+VUo9O+ibfHWM5e
	 RvWimN3/8SDFtWtCs3oJVZMZprPe3iMgWzBLVXqq/Z57otp6kwkFlwBBJXC2cCSmpMfdP
	 x9E+jhJcZp9wCvu4gNKbSIRdC+eM6e4WHiRCqLTJEEIk0otE9uP9/boenE8GGqJrhCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665930;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=u6ctXCDfJuK0m6zgWpeQsh0tuqCll1c0CjCah2CUMhQ=;
	b=mFvnPFWQgxZKguA/EBw4+pqIj/YWExOO4XlenpJh/sNKyXT3DHe8OGcOeY0gquIiWgkc
	 SAtwp/J4+rpoalEfywoKyA/g0jMrTD3x2hp4z4d/zAst45k77z29MZo7HVkWaINVrX7eQ
	 4mDs2IyXe8EUu2/GDqA8CIZHCXlFWqAhMKcTkvo0TAaJBBbnSFRDLeTIbR0//2D5JNwpf
	 ZKg3hwDZuywuBZrqQevbQwgf9+ZaRaPn+ADES1oETy2rKQ7153KjZdkbMEWLzh9E2VY0O
	 lAuT0TxQRiJpvQOu6A1rNu/zGCxm9aNVWAtcWP+4E4x5VJKm0QkVj+RT174cFBusneA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I9Sy4lqL;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27213606A32E;
	Sat, 14 Nov 2026 14:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27213606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I9Sy4lqL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794665929; x=1826201929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5NzkEldU8PeiMd6TmpAcTQ5ct/QNtwfvPv8ekNmhzxw=;
  b=I9Sy4lqLPNDzYAUtSxSFkvrnocnw4pKOyVdsPlVxrpNN1tOlnrdJsLZi
   6T50S1zVh+72yyVgS0Ci+BSbEBoy7rdEXcdYEmmv2Ln17aW7xfR77VgLk
   gvQbobsD2p6qHRpIoTggV0iON+CJzb7bd7dRf/qGsf6oargER6u8H01cw
   h2hAXKga83t+gXX7dYByMqrDafAJMhoUdo4kJ64p3fVkTHSOWT40RLuLI
   y/bbLfErMJUQoMhV5pmndrd6+ZhGLzOYT0/Apl8gu8NBg1p4ITAe1qxB5
   POwBYDOKJ8uA3Y+K7/8AOMLOtr6/5SpTeeEVlKVgJM/QryJN/waGa/fE0
   A==;
X-CSE-ConnectionGUID: 8XZg42f8RgWkfdAztxbQEg==
X-CSE-MsgGUID: F/xe5wafQQO1xoI2JoUg7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3347463"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3347463"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 06:18:48 -0800
X-CSE-ConnectionGUID: H9+FIedKRBqOcRVs+N1cXg==
X-CSE-MsgGUID: P6odMSy5Su2SgJSMSlP1tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="10874534"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 14 Nov 2026 06:18:44 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSEaX-000000015ZM-0L2T;
	Sat, 14 Nov 2026 14:18:41 +0000
Date: Sat, 14 Nov 2026 22:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: Vikas Gupta <vikas.gupta@broadcom.com>, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	andrew+netdev@lunn.ch, horms@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bhargava.marreddy@broadcom.com,
	rahul-rg.gupta@broadcom.com, vsrama-krishna.nemani@broadcom.com,
	rajashekar.hudumula@broadcom.com, dharmender.garg@broadcom.com,
	ajit.khaparde@broadcom.com, Vikas Gupta <vikas.gupta@broadcom.com>
Subject: Re: [PATCH net-next v7 05/10] bnge: add ethtool support to manage
 RSS contexts
Message-ID: <202611142235.fFLV6D4T-lkp@intel.com>
References: <20261114074742.1484603-6-vikas.gupta@broadcom.com>
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
In-Reply-To: <20261114074742.1484603-6-vikas.gupta@broadcom.com>

Hi Vikas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vikas-Gupta/bnge-restructure-VNIC-and-filter-code/20261114-131733
base:   net-next/main
patch link:    https://lore.kernel.org/r/20261114074742.1484603-6-vikas.gupta%40broadcom.com
patch subject: [PATCH net-next v7 05/10] bnge: add ethtool support to manage RSS contexts
config: x86_64-buildonly-randconfig-1004-20261114 (https://download.01.org/0day-ci/archive/20261114/202611142235.fFLV6D4T-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611142235.fFLV6D4T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611142235.fFLV6D4T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bnge/bnge_resc.c: In function 'bnge_reserve_rings':
>> drivers/net/ethernet/broadcom/bnge/bnge_resc.c:314:37: warning: variable 'old_rx_nr_rings' set but not used [-Wunused-but-set-variable]
     314 |         u16 rx_rings, old_rx_rings, old_rx_nr_rings;
         |                                     ^~~~~~~~~~~~~~~


vim +/old_rx_nr_rings +314 drivers/net/ethernet/broadcom/bnge/bnge_resc.c

627c67f038d2e9 Vikas Gupta  2025-07-01  310  
627c67f038d2e9 Vikas Gupta  2025-07-01  311  int bnge_reserve_rings(struct bnge_dev *bd)
627c67f038d2e9 Vikas Gupta  2025-07-01  312  {
627c67f038d2e9 Vikas Gupta  2025-07-01  313  	u16 aux_dflt_msix = bnge_aux_get_dflt_msix(bd);
d6031788285120 Sachin Holla 2026-08-27 @314  	u16 rx_rings, old_rx_rings, old_rx_nr_rings;
627c67f038d2e9 Vikas Gupta  2025-07-01  315  	struct bnge_hw_rings hwr = {0};
627c67f038d2e9 Vikas Gupta  2025-07-01  316  	u16 nq = bd->nq_nr_rings;
627c67f038d2e9 Vikas Gupta  2025-07-01  317  	u16 aux_msix = 0;
c7c6bcf2c57acc Vikas Gupta  2026-11-14  318  	bool indir_lost = false;
c7c6bcf2c57acc Vikas Gupta  2026-11-14  319  	bool rx_changed;
627c67f038d2e9 Vikas Gupta  2025-07-01  320  	bool sh = false;
627c67f038d2e9 Vikas Gupta  2025-07-01  321  	u16 tx_cp;
627c67f038d2e9 Vikas Gupta  2025-07-01  322  	int rc;
627c67f038d2e9 Vikas Gupta  2025-07-01  323  
627c67f038d2e9 Vikas Gupta  2025-07-01  324  	if (!bnge_need_reserve_rings(bd))
627c67f038d2e9 Vikas Gupta  2025-07-01  325  		return 0;
627c67f038d2e9 Vikas Gupta  2025-07-01  326  
627c67f038d2e9 Vikas Gupta  2025-07-01  327  	if (!bnge_aux_registered(bd)) {
627c67f038d2e9 Vikas Gupta  2025-07-01  328  		aux_msix = bnge_get_avail_msix(bd, aux_dflt_msix);
627c67f038d2e9 Vikas Gupta  2025-07-01  329  		if (!aux_msix)
627c67f038d2e9 Vikas Gupta  2025-07-01  330  			bnge_aux_set_stat_ctxs(bd, 0);
627c67f038d2e9 Vikas Gupta  2025-07-01  331  
627c67f038d2e9 Vikas Gupta  2025-07-01  332  		if (aux_msix > aux_dflt_msix)
627c67f038d2e9 Vikas Gupta  2025-07-01  333  			aux_msix = aux_dflt_msix;
627c67f038d2e9 Vikas Gupta  2025-07-01  334  		hwr.nq = nq + aux_msix;
627c67f038d2e9 Vikas Gupta  2025-07-01  335  	} else {
627c67f038d2e9 Vikas Gupta  2025-07-01  336  		hwr.nq = bnge_nqs_demand(bd);
627c67f038d2e9 Vikas Gupta  2025-07-01  337  	}
627c67f038d2e9 Vikas Gupta  2025-07-01  338  
d6031788285120 Sachin Holla 2026-08-27  339  	hwr.tx = bnge_tx_rings_demand(bd);
627c67f038d2e9 Vikas Gupta  2025-07-01  340  	hwr.rx = bd->rx_nr_rings;
627c67f038d2e9 Vikas Gupta  2025-07-01  341  	if (bd->flags & BNGE_EN_SHARED_CHNL)
627c67f038d2e9 Vikas Gupta  2025-07-01  342  		sh = true;
d6031788285120 Sachin Holla 2026-08-27  343  	hwr.cmpl = bnge_cprs_demand(bd);
627c67f038d2e9 Vikas Gupta  2025-07-01  344  
bff7700def65f9 Vikas Gupta  2026-11-14  345  	hwr.vnic = bnge_get_total_vnics(bd);
627c67f038d2e9 Vikas Gupta  2025-07-01  346  
627c67f038d2e9 Vikas Gupta  2025-07-01  347  	if (bnge_is_agg_reqd(bd))
627c67f038d2e9 Vikas Gupta  2025-07-01  348  		hwr.rx <<= 1;
627c67f038d2e9 Vikas Gupta  2025-07-01  349  	hwr.grp = bd->rx_nr_rings;
bff7700def65f9 Vikas Gupta  2026-11-14  350  	hwr.rss_ctx = bnge_get_total_rss_ctxs(bd, &hwr);
627c67f038d2e9 Vikas Gupta  2025-07-01  351  	hwr.stat = bnge_func_stat_ctxs_demand(bd);
627c67f038d2e9 Vikas Gupta  2025-07-01  352  	old_rx_rings = bd->hw_resc.resv_rx_rings;
d6031788285120 Sachin Holla 2026-08-27  353  	old_rx_nr_rings = bd->rx_nr_rings;
627c67f038d2e9 Vikas Gupta  2025-07-01  354  
627c67f038d2e9 Vikas Gupta  2025-07-01  355  	rc = bnge_hwrm_reserve_rings(bd, &hwr);
627c67f038d2e9 Vikas Gupta  2025-07-01  356  	if (rc)
627c67f038d2e9 Vikas Gupta  2025-07-01  357  		return rc;
627c67f038d2e9 Vikas Gupta  2025-07-01  358  
627c67f038d2e9 Vikas Gupta  2025-07-01  359  	bnge_copy_reserved_rings(bd, &hwr);
627c67f038d2e9 Vikas Gupta  2025-07-01  360  
d6031788285120 Sachin Holla 2026-08-27  361  	/* Exclude the MPC reservation before adjusting the L2 rings. */
d6031788285120 Sachin Holla 2026-08-27  362  	if (bnge_is_roce_en(bd)) {
d6031788285120 Sachin Holla 2026-08-27  363  		if (hwr.tx <= 1 || hwr.cmpl <= 2)
d6031788285120 Sachin Holla 2026-08-27  364  			return -ENOMEM;
d6031788285120 Sachin Holla 2026-08-27  365  		hwr.tx--;
d6031788285120 Sachin Holla 2026-08-27  366  		hwr.cmpl--;
d6031788285120 Sachin Holla 2026-08-27  367  	}
d6031788285120 Sachin Holla 2026-08-27  368  
627c67f038d2e9 Vikas Gupta  2025-07-01  369  	rx_rings = hwr.rx;
627c67f038d2e9 Vikas Gupta  2025-07-01  370  	if (bnge_is_agg_reqd(bd)) {
627c67f038d2e9 Vikas Gupta  2025-07-01  371  		if (hwr.rx >= 2)
627c67f038d2e9 Vikas Gupta  2025-07-01  372  			rx_rings = hwr.rx >> 1;
627c67f038d2e9 Vikas Gupta  2025-07-01  373  		else
627c67f038d2e9 Vikas Gupta  2025-07-01  374  			return -ENOMEM;
627c67f038d2e9 Vikas Gupta  2025-07-01  375  	}
627c67f038d2e9 Vikas Gupta  2025-07-01  376  
627c67f038d2e9 Vikas Gupta  2025-07-01  377  	rx_rings = min_t(u16, rx_rings, hwr.grp);
627c67f038d2e9 Vikas Gupta  2025-07-01  378  	hwr.nq = min_t(u16, hwr.nq, bd->nq_nr_rings);
627c67f038d2e9 Vikas Gupta  2025-07-01  379  	if (hwr.stat > bnge_aux_get_stat_ctxs(bd))
627c67f038d2e9 Vikas Gupta  2025-07-01  380  		hwr.stat -= bnge_aux_get_stat_ctxs(bd);
627c67f038d2e9 Vikas Gupta  2025-07-01  381  	hwr.nq = min_t(u16, hwr.nq, hwr.stat);
627c67f038d2e9 Vikas Gupta  2025-07-01  382  
627c67f038d2e9 Vikas Gupta  2025-07-01  383  	/* Adjust the rings */
d6031788285120 Sachin Holla 2026-08-27  384  	rc = bnge_fix_rings_count(&rx_rings, &hwr.tx, hwr.cmpl, false);
d6031788285120 Sachin Holla 2026-08-27  385  	if (rc)
d6031788285120 Sachin Holla 2026-08-27  386  		return rc;
627c67f038d2e9 Vikas Gupta  2025-07-01  387  	rc = bnge_adjust_rings(bd, &rx_rings, &hwr.tx, hwr.nq, sh);
d6031788285120 Sachin Holla 2026-08-27  388  	if (rc)
d6031788285120 Sachin Holla 2026-08-27  389  		return rc;
627c67f038d2e9 Vikas Gupta  2025-07-01  390  	if (bnge_is_agg_reqd(bd))
627c67f038d2e9 Vikas Gupta  2025-07-01  391  		hwr.rx = rx_rings << 1;
627c67f038d2e9 Vikas Gupta  2025-07-01  392  	tx_cp = hwr.tx;
627c67f038d2e9 Vikas Gupta  2025-07-01  393  	hwr.nq = sh ? max_t(u16, tx_cp, rx_rings) : tx_cp + rx_rings;
c7c6bcf2c57acc Vikas Gupta  2026-11-14  394  
c7c6bcf2c57acc Vikas Gupta  2026-11-14  395  	/* One ring group per rx ring, so rss_ctx is checked against the final
c7c6bcf2c57acc Vikas Gupta  2026-11-14  396  	 * rx ring count. Fail before any driver state is changed, so that a
c7c6bcf2c57acc Vikas Gupta  2026-11-14  397  	 * retry reserves again instead of finding the failed values in place.
c7c6bcf2c57acc Vikas Gupta  2026-11-14  398  	 */
c7c6bcf2c57acc Vikas Gupta  2026-11-14  399  	hwr.grp = rx_rings;
c7c6bcf2c57acc Vikas Gupta  2026-11-14  400  	if (!bnge_rings_ok(&hwr))
c7c6bcf2c57acc Vikas Gupta  2026-11-14  401  		return -ENOMEM;
c7c6bcf2c57acc Vikas Gupta  2026-11-14  402  
627c67f038d2e9 Vikas Gupta  2025-07-01  403  	bd->tx_nr_rings = hwr.tx;
d6031788285120 Sachin Holla 2026-08-27  404  	if (!bd->num_tc)
d6031788285120 Sachin Holla 2026-08-27  405  		bd->tx_nr_rings_per_tc = bd->tx_nr_rings;
627c67f038d2e9 Vikas Gupta  2025-07-01  406  
c7c6bcf2c57acc Vikas Gupta  2026-11-14  407  	rx_changed = rx_rings != bd->rx_nr_rings;
c7c6bcf2c57acc Vikas Gupta  2026-11-14  408  	if (rx_changed) {
627c67f038d2e9 Vikas Gupta  2025-07-01  409  		dev_warn(bd->dev, "RX rings resv reduced to %d than earlier %d requested\n",
627c67f038d2e9 Vikas Gupta  2025-07-01  410  			 rx_rings, bd->rx_nr_rings);
c7c6bcf2c57acc Vikas Gupta  2026-11-14  411  		indir_lost = bd->netdev &&
c7c6bcf2c57acc Vikas Gupta  2026-11-14  412  			     netif_is_rxfh_configured(bd->netdev) &&
c7c6bcf2c57acc Vikas Gupta  2026-11-14  413  			     (bnge_cal_nr_rss_ctxs(bd->rx_nr_rings) !=
c7c6bcf2c57acc Vikas Gupta  2026-11-14  414  			      bnge_cal_nr_rss_ctxs(rx_rings) ||
c7c6bcf2c57acc Vikas Gupta  2026-11-14  415  			      bnge_get_max_rss_ring(bd) >= rx_rings);
c7c6bcf2c57acc Vikas Gupta  2026-11-14  416  		bnge_check_rss_ctxs_lost(bd, rx_rings);
c7c6bcf2c57acc Vikas Gupta  2026-11-14  417  	}
627c67f038d2e9 Vikas Gupta  2025-07-01  418  
627c67f038d2e9 Vikas Gupta  2025-07-01  419  	bd->rx_nr_rings = rx_rings;
627c67f038d2e9 Vikas Gupta  2025-07-01  420  	bd->nq_nr_rings = hwr.nq;
627c67f038d2e9 Vikas Gupta  2025-07-01  421  
c7c6bcf2c57acc Vikas Gupta  2026-11-14  422  	if (old_rx_rings != bd->hw_resc.resv_rx_rings || rx_changed) {
c7c6bcf2c57acc Vikas Gupta  2026-11-14  423  		if (!bd->netdev || indir_lost ||
c7c6bcf2c57acc Vikas Gupta  2026-11-14  424  		    !netif_is_rxfh_configured(bd->netdev))
c7c6bcf2c57acc Vikas Gupta  2026-11-14  425  			bnge_set_dflt_rss_indir_tbl(bd, NULL);
c7c6bcf2c57acc Vikas Gupta  2026-11-14  426  		bnge_refill_dflt_rss_ctxs(bd);
c7c6bcf2c57acc Vikas Gupta  2026-11-14  427  	}
627c67f038d2e9 Vikas Gupta  2025-07-01  428  
c7c6bcf2c57acc Vikas Gupta  2026-11-14  429  	/* Notify only now, so the notification reports the new ring count
c7c6bcf2c57acc Vikas Gupta  2026-11-14  430  	 * and the reset indirection table.
c7c6bcf2c57acc Vikas Gupta  2026-11-14  431  	 */
c7c6bcf2c57acc Vikas Gupta  2026-11-14  432  	if (indir_lost)
c7c6bcf2c57acc Vikas Gupta  2026-11-14  433  		ethtool_rxfh_indir_lost(bd->netdev);
627c67f038d2e9 Vikas Gupta  2025-07-01  434  
627c67f038d2e9 Vikas Gupta  2025-07-01  435  	if (!bnge_aux_registered(bd)) {
627c67f038d2e9 Vikas Gupta  2025-07-01  436  		u16 resv_msix, resv_ctx, aux_ctxs;
627c67f038d2e9 Vikas Gupta  2025-07-01  437  		struct bnge_hw_resc *hw_resc;
627c67f038d2e9 Vikas Gupta  2025-07-01  438  
627c67f038d2e9 Vikas Gupta  2025-07-01  439  		hw_resc = &bd->hw_resc;
627c67f038d2e9 Vikas Gupta  2025-07-01  440  		resv_msix = hw_resc->resv_irqs - bd->nq_nr_rings;
627c67f038d2e9 Vikas Gupta  2025-07-01  441  		aux_msix = min_t(u16, resv_msix, aux_msix);
627c67f038d2e9 Vikas Gupta  2025-07-01  442  		bnge_aux_set_msix_num(bd, aux_msix);
627c67f038d2e9 Vikas Gupta  2025-07-01  443  		resv_ctx = hw_resc->resv_stat_ctxs  - bd->nq_nr_rings;
627c67f038d2e9 Vikas Gupta  2025-07-01  444  		aux_ctxs = min(resv_ctx, bnge_aux_get_stat_ctxs(bd));
627c67f038d2e9 Vikas Gupta  2025-07-01  445  		bnge_aux_set_stat_ctxs(bd, aux_ctxs);
627c67f038d2e9 Vikas Gupta  2025-07-01  446  	}
627c67f038d2e9 Vikas Gupta  2025-07-01  447  
627c67f038d2e9 Vikas Gupta  2025-07-01  448  	return rc;
627c67f038d2e9 Vikas Gupta  2025-07-01  449  }
18a975389fcc81 Vikas Gupta  2025-07-01  450  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
