Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F3D288C2D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791279352; cv=none; b=K3GE7ENL3S9eG0QeVF6D+6B94SmE1KlQBNL9iisMHO75L0xSoVvKtYyOcvpraM81Y66RJz+vmPneGEoQmm5PcKl1k8I8yDPjLsfFmNWsQ7R+aNgBFVfrwzqgHFHd78PpbvNgxWfD/+YGtEOxn8zI/ar4P96flQlJ0mk4HdteOMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791279352; c=relaxed/simple;
	bh=TObM65NBjBYwCaft6O0/QOlU54JyJSGJETTZRgol+kQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CBxS/2JbNu9VqK19No18rtfCDG7gv+LY8BX8bFmNAq49jcMNQjpYRlX/s9ViU7YhrufrxETFbK54UCjlCno/tBsjTVH6fFMh8vVP2hYgN7sfqIibyCqN/YfAwmqXUBNXocQoGAblrvop5xX8z34NPzCeAQGmreaUoVwEXYDmqvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjwWXXyD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjwWXXyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791279351; x=1822815351;
  h=date:from:to:cc:subject:message-id;
  bh=TObM65NBjBYwCaft6O0/QOlU54JyJSGJETTZRgol+kQ=;
  b=hjwWXXyD+C9wEd2aL5yZaaOJNuqMltMSi0pz5NW+yH17q3AXDcGe8Xoa
   1lSHGXr+tgenkYwxNobqXfPvjvdTC+UqiluniDScN1vwNX7NfgL12ssCC
   1Ql0+toZBkj/S57GH7ht5Wj59HNrSs+f9RyqXYuslyKaqP5AByRdGwyPV
   KFGCUaHlYUfQntTelJjo06V6cdka4QxBNtMpy6X2XJ4651UtVvEmRyh7L
   GDWAdmb657xMrFOO4aIDy+XNtQPGNNPYIxatguLDff3yBC2FSpUmjc8ck
   WF+1QFYaxzY8QrwWRkNdpSmNbh1sehP6QohW1obrZ+kSQdorKZdLFbK9q
   g==;
X-CSE-ConnectionGUID: 8ca86X/0T7uwgBHf7oOwXg==
X-CSE-MsgGUID: PTKcmh9MRZuHfqYJigSAiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="95780492"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="95780492"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 02:35:50 -0700
X-CSE-ConnectionGUID: sxA7jR1hSQaID3qpen9CJQ==
X-CSE-MsgGUID: 4KYqBwuLRLijd/MLFVBGIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280828417"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 06 Oct 2026 02:35:48 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE1aM-0000000013H-2zRu;
	Tue, 06 Oct 2026 09:35:46 +0000
Date: Tue, 06 Oct 2026 11:34:50 +0200
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <md.alam@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: drivers/spi/spi-qpic-snand.c:1502:6-18: opportunity for
 str_enabled_disabled(quad_enabled)
Message-ID: <202610061128.0Hjx7Feh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2c3418fffa9d037b2038a6db48be63f9e2291806
commit: cdb1dbba490205c32f1e72aaaad26715c8f98f80 spi: spi-qpic-snand: add quad mode support
date:   8 weeks ago
config: sparc64-randconfig-r2106-20261005 (https://download.01.org/0day-ci/archive/20261006/202610061128.0Hjx7Feh-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 195c81658995a4b7531c30a12c5aef6cf2bbd671)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cdb1dbba4902 ("spi: spi-qpic-snand: add quad mode support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061128.0Hjx7Feh-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/spi/spi-qpic-snand.c:1502:6-18: opportunity for str_enabled_disabled(quad_enabled)

vim +1502 drivers/spi/spi-qpic-snand.c

  1433	
  1434	static int qcom_spi_io_op(struct qcom_nand_controller *snandc, const struct spi_mem_op *op)
  1435	{
  1436		int ret, val, opcode;
  1437		bool copy = false, copy_ftr = false;
  1438	
  1439		ret = qcom_spi_send_cmdaddr(snandc, op);
  1440		if (ret)
  1441			return ret;
  1442	
  1443		snandc->buf_count = 0;
  1444		snandc->buf_start = 0;
  1445		qcom_clear_read_regs(snandc);
  1446		qcom_clear_bam_transaction(snandc);
  1447		opcode = op->cmd.opcode;
  1448	
  1449		switch (opcode) {
  1450		case SPINAND_READID:
  1451			snandc->buf_count = 4;
  1452			qcom_read_reg_dma(snandc, NAND_READ_ID, 1, NAND_BAM_NEXT_SGL);
  1453			copy = true;
  1454			break;
  1455		case SPINAND_GET_FEATURE:
  1456			snandc->buf_count = 4;
  1457			qcom_read_reg_dma(snandc, NAND_FLASH_FEATURES, 1, NAND_BAM_NEXT_SGL);
  1458			copy_ftr = true;
  1459			break;
  1460		case SPINAND_SET_FEATURE:
  1461			/* fully handled by qcom_spi_send_cmdaddr() */
  1462			return 0;
  1463		case SPINAND_PROGRAM_EXECUTE:
  1464		case SPINAND_WRITE_EN:
  1465		case SPINAND_RESET:
  1466		case SPINAND_ERASE:
  1467		case SPINAND_READ:
  1468			return 0;
  1469		default:
  1470			return -EOPNOTSUPP;
  1471		}
  1472	
  1473		ret = qcom_submit_descs(snandc);
  1474		if (ret) {
  1475			dev_err(snandc->dev, "failure in submitting descriptor for:%d\n", opcode);
  1476			return ret;
  1477		}
  1478	
  1479		if (copy) {
  1480			qcom_nandc_dev_to_mem(snandc, true);
  1481			memcpy(op->data.buf.in, snandc->reg_read_buf, snandc->buf_count);
  1482		}
  1483	
  1484		if (copy_ftr) {
  1485			qcom_nandc_dev_to_mem(snandc, true);
  1486			val = le32_to_cpu(*(__le32 *)snandc->reg_read_buf);
  1487			val >>= 8;
  1488			memcpy(op->data.buf.in, &val, snandc->buf_count);
  1489	
  1490			/*
  1491			 * Track QUAD mode state from configuration register.
  1492			 * When core layer reads register 0xB0 (CFG), check if
  1493			 * QUAD enable bit (bit 0) is set and update our state
  1494			 * accordingly for future READ/WRITE operations.
  1495			 */
  1496			if (op->addr.val == SPINAND_FEATURE_ADDR) {
  1497				bool quad_enabled = !!((u8)val & BIT(0));
  1498	
  1499				if (snandc->qspi->quad_mode != quad_enabled) {
  1500					snandc->qspi->quad_mode = quad_enabled;
  1501					dev_info(snandc->dev, "SPI NAND QUAD mode: %s\n",
> 1502						 quad_enabled ? "enabled" : "disabled");
  1503				}
  1504			}
  1505		}
  1506	
  1507		return 0;
  1508	}
  1509	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
