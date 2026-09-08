Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C2F31985C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788832307; cv=none; b=gv4ka+mLm5KP5jUL1LNn3XkKAlakJ3yV8F+tLLHjR2Iv75cN6d0KaHdlCCJgNqgeBAFtOaSHW+nVBKRITREqFPjnBLjWJbPmRXeCtNtw5tbrhL8Kpzbvkw9482NUvuxZOfMfnpvWJKB7XLlRmH0lHOsEmzbBW2x/cNpxDTuhrok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788832307; c=relaxed/simple;
	bh=H5KfjH5Ca7rV8DDYGvbef9Ah6ByX8i0DotG6aGor3ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4ohYdMCebnjTMN+DCh7WB19TQCgYCR1AIGx1bA4A6F5eQ7ymtEsoUrP26nqojHJSD52IJFSRlXjaNnY8z4a4OXJ8VHVarKvFcMgzD0PD6pHZUH7vpf0jAirhcFvy6CYFp2CX9iDUiqW5ZHwOg+G+bLaVGMDURwk2sh02Ndur1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWnxue0/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWnxue0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788832306; x=1820368306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H5KfjH5Ca7rV8DDYGvbef9Ah6ByX8i0DotG6aGor3ag=;
  b=OWnxue0/YMIg/QJCbvONuLLMO7kEzB3ryfdX/lT60MM4ljzZNUxraWND
   CPvT7YLXQVaUf/as0aO0Ik+mmJ1kAdkR5vK0CFQQEgezQFWKhdydRz1AV
   SIG28SvmtTzHOhLxodhSCv6hu3CEDgpFGfVrLRi1PnlKAsYNKHt0+HeRP
   qMgQzLW+YeY/Te/YXHFDEqfQ/YgQkZItXuhn1roNWKbiZYUVy1twBAIZA
   zHJZ5oyVn2dheUvxOccJxGv0nUVo+D/iVQ6QDR9K+ANrN95QvNZhLuthb
   kzJKYlPPhl/qEbTZ532KHz4rrQMQ0QazxMFIsVut6sxv5mjewVh6QH50W
   Q==;
X-CSE-ConnectionGUID: S8FpD/IfSzm7gM4WhC/T7Q==
X-CSE-MsgGUID: uUkBEvV3SHCmn9B5Vj2g9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="100582947"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="100582947"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 18:51:45 -0700
X-CSE-ConnectionGUID: iQFGaFOTQPS3LPHK/g0vAg==
X-CSE-MsgGUID: midYSC7uQnSHi9LGil7hHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="266503127"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Sep 2026 18:51:43 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3kzs-000000001Wn-39jd;
	Tue, 08 Sep 2026 01:51:40 +0000
Date: Tue, 8 Sep 2026 09:51:29 +0800
From: kernel test robot <lkp@intel.com>
To: fzz <1768315307@qq.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	fzz <1768315307@qq.com>
Subject: Re: [PATCH] mtd: spinand: cache the last read page to avoid
 redundant SPI operations
Message-ID: <202609080921.381EOoBZ-lkp@intel.com>
References: <tencent_219EED44C45D6CEC1D6B6724343E13733005@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_219EED44C45D6CEC1D6B6724343E13733005@qq.com>

Hi fzz,

kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/nand/next]
[also build test ERROR on linus/master v7.3-rc2 next-20260907]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/fzz/mtd-spinand-cache-the-last-read-page-to-avoid-redundant-SPI-operations/20260907-191040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
patch link:    https://lore.kernel.org/r/tencent_219EED44C45D6CEC1D6B6724343E13733005%40qq.com
patch subject: [PATCH] mtd: spinand: cache the last read page to avoid redundant SPI operations
config: powerpc-randconfig-r072-20260908 (https://download.01.org/0day-ci/archive/20260908/202609080921.381EOoBZ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609080921.381EOoBZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609080921.381EOoBZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/nand/spi/core.c: In function 'spinand_read_from_cache_op':
>> drivers/mtd/nand/spi/core.c:563:46: error: 'const struct nand_page_io_req' has no member named 'disable_ecc'
     563 |  if (req->datalen && !req->continuous && !req->disable_ecc) {
         |                                              ^~


vim +563 drivers/mtd/nand/spi/core.c

   474	
   475	static int spinand_read_from_cache_op(struct spinand_device *spinand,
   476					      const struct nand_page_io_req *req)
   477	{
   478		struct nand_device *nand = spinand_to_nand(spinand);
   479		struct mtd_info *mtd = spinand_to_mtd(spinand);
   480		struct spi_mem_dirmap_desc *rdesc;
   481		unsigned int nbytes = 0;
   482		void *buf = NULL;
   483		u16 column = 0;
   484		ssize_t ret;
   485	
   486		if (req->datalen) {
   487			buf = spinand->databuf;
   488			if (!req->continuous)
   489				nbytes = nanddev_page_size(nand);
   490			else
   491				nbytes = round_up(req->dataoffs + req->datalen,
   492						  nanddev_page_size(nand));
   493			column = 0;
   494		}
   495	
   496		if (req->ooblen) {
   497			nbytes += nanddev_per_page_oobsize(nand);
   498			if (!buf) {
   499				buf = spinand->oobbuf;
   500				column = nanddev_page_size(nand);
   501			}
   502		}
   503	
   504		rdesc = spinand->dirmaps[req->pos.plane].rdesc;
   505	
   506		if (spinand->op_templates->cont_read_cache && req->continuous)
   507			rdesc->info.op_tmpl = &rdesc->info.secondary_op_tmpl;
   508		else
   509			rdesc->info.op_tmpl = &rdesc->info.primary_op_tmpl;
   510	
   511		if (nand->ecc.engine->integration == NAND_ECC_ENGINE_INTEGRATION_PIPELINED &&
   512		    req->mode != MTD_OPS_RAW)
   513			rdesc->info.op_tmpl->data.ecc = true;
   514		else
   515			rdesc->info.op_tmpl->data.ecc = false;
   516	
   517		if (spinand->flags & SPINAND_HAS_READ_PLANE_SELECT_BIT)
   518			column |= req->pos.plane << fls(nanddev_page_size(nand));
   519	
   520		while (nbytes) {
   521			ret = spi_mem_dirmap_read(rdesc, column, nbytes, buf);
   522			if (ret < 0)
   523				return ret;
   524	
   525			if (!ret || ret > nbytes)
   526				return -EIO;
   527	
   528			nbytes -= ret;
   529			column += ret;
   530			buf += ret;
   531	
   532			/*
   533			 * Dirmap accesses are allowed to toggle the CS.
   534			 * Toggling the CS during a continuous read is forbidden.
   535			 */
   536			if (nbytes && req->continuous) {
   537				/*
   538				 * Spi controller with broken support of continuous
   539				 * reading was detected. Disable future use of
   540				 * continuous reading and return -EAGAIN to retry
   541				 * reading within regular mode.
   542				 */
   543				spinand->cont_read_possible = false;
   544				return -EAGAIN;
   545			}
   546		}
   547	
   548		if (req->datalen)
   549			memcpy(req->databuf.in, spinand->databuf + req->dataoffs,
   550			       req->datalen);
   551	
   552		if (req->ooblen) {
   553			if (req->mode == MTD_OPS_AUTO_OOB)
   554				mtd_ooblayout_get_databytes(mtd, req->oobbuf.in,
   555							    spinand->oobbuf,
   556							    req->ooboffs,
   557							    req->ooblen);
   558			else
   559				memcpy(req->oobbuf.in, spinand->oobbuf + req->ooboffs,
   560					req->ooblen);
   561		}
   562	
 > 563		if (req->datalen && !req->continuous && !req->disable_ecc) {
   564			spinand->cur_target_cache = req->pos.target;
   565			spinand->cur_block_cache = req->pos.eraseblock;
   566			spinand->cur_page_cache = req->pos.page;
   567			spinand->cache_valid = true;
   568		}
   569	
   570		return 0;
   571	}
   572	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
