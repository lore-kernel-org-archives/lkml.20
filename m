Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890220;
	b=AZBc29Au5+67Kz9179zcgA1ujlBAq0b5noAII3Rb1QhvcLQn25b8t8ozmzTBp88+36Wf
	 9t3bJdG7C+gQKE1FMqSWfFVXSWFYxKu6sRTUWC15LwO8cL/5VvCW3TzSVGCvVRY2JNFbI
	 63YAxRjxvY3qweqxd7mIxr4w0Fl8QE6dVbqpTvjmIc9hFXZQZwQ+mKufYv2n8wloAEtbZ
	 9MEGr0YCebtbzfwWi5A/MSHDUTKFWmvxKItqDi3QeSitXMFdH4NZrnQO4Vcc1KTH+XvaH
	 ndcWmTbjOTOt0jyN4QTZufcoY+lTT75ijshhqxXYxBB0S4PBNsA/7mOgKlbMXRF0mWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890220;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=GwTFC76gcVt6WPWxDY7a3hzw2d7MaZ4yXVqNz/wjyA4=;
	b=kfC6AD+Sd5p2Jo2xaxizO8Oe+U6YR1apv4iyQlzRRy6xuBNEKkQ87FMs+ntpZ1D7I/F0
	 oZj20T/iptmGiwOyWVeJi3Ygy1MYTVbUN02lEznuv8h7fchOt0pWKjcZfD6Ehsua3/bl0
	 kITkOqajGkb7Et96dImoP/ecm4RMKtCMwLBWpjOWXIJe0V8A+fkoTqy7RMEw9QGOBIDdH
	 y+OgW2jWUZuVsv5BqIPa08+HSmFy+l6da3lz+0wZJn6xc1cPYfCk7Ta3p6bnVe6frtJao
	 rQKyD3E70u6t2KlU/n3tTWYdDNJSUnxbGzZzwG6Ic2FJ3ItZHTqtP2PJ/Vw5Vsiyd/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qykix7SU;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A89606A336;
	Thu,  5 Nov 2026 14:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6A89606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qykix7SU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793890219; x=1825426219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SEacydVAocOoM2UCf6wrFxtqPAImR/F2TO+ME5G6D8s=;
  b=Qykix7SUOTGlNKlDMa7aEdT5v7GOI164bdyY+ksIGw05lmBMbqdJd+pf
   OQMzZCW4EQ493L3r6x+gAdhmtVYE6h9RdgB6pheroe513JCV/9SwjGaec
   b1l0ISAoF5Zl/L8qdiGqyAgWiA4+rtuLkQb8zsTGUJcj5Tdm+2+SCBycM
   N8xN39fLYbXr2ksyysZ48SKCtBme9bi7mBGtdqziUqAdNjqnd5rh+meIm
   8cuq/TmF+magGlP8/ty1/D266nVtFEwZzajWm1tr7pOSvKtP/u9zUh7ZY
   a+/JQHR0dpjCG2d0OIp8kjNE1KEVl7d6uVivrVs2sXv5bA+HAy1WRgUtA
   A==;
X-CSE-ConnectionGUID: ocWZ60GUTNmVbeZwWqCclQ==
X-CSE-MsgGUID: /x80r4lcTsySxn6Eb/kZUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2551290"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2551290"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 06:50:17 -0800
X-CSE-ConnectionGUID: VCsj7JxxQo6Ld5HGrJ2f3Q==
X-CSE-MsgGUID: DXMJKH2VR4iY8okcCBmtKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7151188"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Nov 2026 06:50:13 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOyn3-00000000mLZ-3tNZ;
	Thu, 05 Nov 2026 14:50:09 +0000
Date: Thu, 5 Nov 2026 22:49:36 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shubhrajyoti.datta@amd.com,
	shubhamsanjay.patil@amd.com, adrian.hunter@intel.com,
	manikanta.guntupalli@amd.com, linux-i3c@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
	wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com
Cc: oe-kbuild-all@lists.linux.dev, konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org, jyothi.seerapu@oss.qualcomm.com,
	viken.dadhaniya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
	praveen.talari@oss.qualcomm.com
Subject: Re: [PATCH v7 2/3] i3c: master: Add Qualcomm I3C controller driver
Message-ID: <202611060055.y4Q35SU8-lkp@intel.com>
References: <20261104111610.3739095-2-mukesh.savaliya@oss.qualcomm.com>
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
In-Reply-To: <20261104111610.3739095-2-mukesh.savaliya@oss.qualcomm.com>

Hi Mukesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on i3c/i3c/next]
[also build test WARNING on linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Kumar-Savaliya/i3c-master-Add-Qualcomm-I3C-controller-driver/20261104-164609
base:   https://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git i3c/next
patch link:    https://lore.kernel.org/r/20261104111610.3739095-2-mukesh.savaliya%40oss.qualcomm.com
patch subject: [PATCH v7 2/3] i3c: master: Add Qualcomm I3C controller driver
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261106/202611060055.y4Q35SU8-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060055.y4Q35SU8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060055.y4Q35SU8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i3c/master/i3c-qcom-geni.c: In function 'qcom_geni_i3c_conf':
   drivers/i3c/master/i3c-qcom-geni.c:284:15: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     284 |         val = FIELD_PREP(CLK_DIV_VALUE_MASK, clk_idx->clk_div);
         |               ^~~~~~~~~~
   drivers/i3c/master/i3c-qcom-geni.c: In function 'geni_i3c_irq':
>> drivers/i3c/master/i3c-qcom-geni.c:363:13: warning: variable 'm_stat_mask' set but not used [-Wunused-but-set-variable=]
     363 |         u32 m_stat_mask, dm_tx_st, dm_rx_st;
         |             ^~~~~~~~~~~
   drivers/i3c/master/i3c-qcom-geni.c: In function 'i3c_geni_resources_init':
   drivers/i3c/master/i3c-qcom-geni.c:977:15: error: too few arguments to function 'geni_icc_get'; expected 2, have 1
     977 |         ret = geni_icc_get(&gi3c->se);
         |               ^~~~~~~~~~~~
   In file included from drivers/i3c/master/i3c-qcom-geni.c:19:
   include/linux/soc/qcom/geni-se.h:576:5: note: declared here
     576 | int geni_icc_get(struct geni_se *se, const char *icc_ddr);
         |     ^~~~~~~~~~~~


vim +/m_stat_mask +363 drivers/i3c/master/i3c-qcom-geni.c

   359	
   360	static irqreturn_t geni_i3c_irq(int irq, void *dev)
   361	{
   362		struct geni_i3c_dev *gi3c = dev;
 > 363		u32 m_stat_mask, dm_tx_st, dm_rx_st;
   364		u32 m_stat, rx_st, dma_mode;
   365	
   366		m_stat = readl_relaxed(gi3c->se.base + SE_GENI_M_IRQ_STATUS);
   367		m_stat_mask = readl_relaxed(gi3c->se.base + SE_GENI_M_IRQ_EN);
   368		rx_st = readl_relaxed(gi3c->se.base + SE_GENI_RX_FIFO_STATUS);
   369		dm_tx_st = readl_relaxed(gi3c->se.base + SE_DMA_TX_IRQ_STAT);
   370		dm_rx_st = readl_relaxed(gi3c->se.base + SE_DMA_RX_IRQ_STAT);
   371		dma_mode = readl_relaxed(gi3c->se.base + SE_GENI_DMA_MODE_EN);
   372	
   373		scoped_guard(spinlock, &gi3c->irq_lock) {
   374			if (m_stat & SE_I3C_ERR || dm_rx_st & DM_I3C_CB_ERR) {
   375				geni_i3c_handle_err(gi3c, m_stat);
   376				/* Disable the TX Watermark interrupt to stop TX */
   377				if (!dma_mode)
   378					writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
   379			} else if (dma_mode) {
   380				dev_dbg(gi3c->se.dev, "i3c dma tx:0x%x, dma rx:0x%x\n", dm_tx_st, dm_rx_st);
   381			} else if ((m_stat & (M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN)) &&
   382				    !gi3c->cur_is_write && gi3c->cur_buf) {
   383				/* FIFO RX handling */
   384				u32 rxcnt = rx_st & RX_FIFO_WC_MSK;
   385				int avail = rxcnt * 4;
   386				int need  = gi3c->cur_len - gi3c->cur_idx;
   387				int n     = min(need, avail);
   388	
   389				if (n > 0) {
   390					i3c_readl_fifo(gi3c->se.base + SE_GENI_RX_FIFOn,
   391						       gi3c->cur_buf + gi3c->cur_idx, n);
   392					gi3c->cur_idx += n;
   393				}
   394			} else if ((m_stat & M_TX_FIFO_WATERMARK_EN) &&
   395				   gi3c->cur_is_write && gi3c->cur_buf) {
   396				/* FIFO TX handling */
   397				int avail = gi3c->tx_wm * 4;
   398				int need  = gi3c->cur_len - gi3c->cur_idx;
   399				int n     = min(need, avail);
   400	
   401				if (n > 0) {
   402					i3c_writel_fifo(gi3c->se.base + SE_GENI_TX_FIFOn,
   403							(void *)(gi3c->cur_buf + gi3c->cur_idx), n);
   404					gi3c->cur_idx += n;
   405				}
   406			}
   407	
   408			if (!dma_mode && gi3c->cur_idx == gi3c->cur_len)
   409				writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
   410		}
   411	
   412		if (m_stat)
   413			writel_relaxed(m_stat, gi3c->se.base + SE_GENI_M_IRQ_CLEAR);
   414	
   415		if (dma_mode) {
   416			if (dm_tx_st)
   417				writel_relaxed(dm_tx_st, gi3c->se.base + SE_DMA_TX_IRQ_CLR);
   418			if (dm_rx_st)
   419				writel_relaxed(dm_rx_st, gi3c->se.base + SE_DMA_RX_IRQ_CLR);
   420		}
   421	
   422		/* if this is err with done-bit not set, handle that through timeout. */
   423		if (m_stat & (M_CMD_DONE_EN | M_CMD_ABORT_EN)) {
   424			writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
   425			complete(&gi3c->done);
   426		} else if ((dm_tx_st & TX_DMA_DONE) || (dm_rx_st & (RX_DMA_DONE | RX_RESET_DONE))) {
   427			complete(&gi3c->done);
   428		}
   429	
   430		return IRQ_HANDLED;
   431	}
   432	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
