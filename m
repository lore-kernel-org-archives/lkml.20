Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216298;
	b=JifhURpy+lX8A/cuUpURZrLBK8L33yMFUdRUljINcMipk9/8LTlmPtPZuIwZdbJ3ibj+
	 hrWVGNdKNA8YiS0RNqEQnRARWAa70Er9raZMyMnr42kye0ZtrnbeSiwoG7bxugyIA38yr
	 G4xce/+pRD33wjUG3reqS98jnBS/tFyIuoorjoQg5r4wMT4zMO0SQRbW25vHqJbVz2SfO
	 2csj9+Un7qbclU4oRaKMPEwOgY5c0RlB224OgjLIGey/fNscTz4nsgUDDBjpfdpVswZoX
	 zYdwreYZSVLhJqEZ3aPG6Tsii4fhKsTTKz8/a7pyvEEmTAqLNjzB3R2YmCctdO6BLvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216298;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=HGALxD8WUQh3k5e3MegYEdBDBQp8GKt6d5KoonnP72I=;
	b=yA8v1s5n/nR1r3EyvGGDOdgkCkuLVU4tmMI0GEPoBkgEKmSNpNKGn6xiB1MYhBayrCEU
	 nA+KrHyNGeBQAl2ue3XhvBIicx3DYq5bNpn9dudCb/cWwfk+zpTglLhcfB0PA1YphcpFC
	 dIGjxsSYAtYG7zRWHjk6qJeluRuhlZM2xAOKvv02WYuRGrw8RnLYDFS+pX9L6hIgKmxYy
	 xy7qslh0NTmaBoNT2r+oMycbwzLSPdc4W2pObN6KUn8yR7MMbRcMaAWOMSZaY60HgdfIY
	 WrgYz0GvYoCQXXfwp3aiSbMBPDPYsOwfwsrNqpzd8MbZyMIoTOq7gDS8hIJ7uxqmUWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YpbCzhAx;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C8A606D80E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C8A606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YpbCzhAx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794216297; x=1825752297;
  h=date:from:to:cc:subject:message-id;
  bh=kfjgmSMfsPk6Yd4+gNBg3pZU7iF+GpI3egFCB98F2P8=;
  b=YpbCzhAxDZPvuIsPGYaP3odHP3uXPl787XhB4Oer97jQLoMXigOaKFZC
   V88jFUAfbcx68BEqm8aRxP9wOaptnDLsl0zHXaFeyFsfLF9BskflKVIuP
   UCzYNJZVRUPv4L0udcrKfNXe9JL3GaJA5nHVbwqgtTSKzW3iOPQWLYfFB
   ela2ucuLwAJxUgPq/dp7jsyVTIaBVI6rl9bMJfHFJaH3NGBLGdcpouAzp
   8roJeHrOasAHt006LL2IJrQU32OVKcmnLghFoetNKgt+tsv1kZEGcD9Sq
   do/50hlvlcC5Zsz6BAE5YMg0uzeEyVsuz745c7gfQBXwIv59ypif6xrql
   Q==;
X-CSE-ConnectionGUID: yXbAyU7qRQmo5B76vaDMbg==
X-CSE-MsgGUID: 50OeKUp1TumX8C14dFa27A==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2830521"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2830521"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 01:24:57 -0800
X-CSE-ConnectionGUID: lYAG9YVGTQ6H9HmDxXwvhQ==
X-CSE-MsgGUID: Xy9uimLMT++A69ksgL1ZEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7699383"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 09 Nov 2026 01:24:56 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQLcR-000000000I1-3tFI;
	Mon, 09 Nov 2026 09:24:51 +0000
Date: Mon, 09 Nov 2026 10:24:51 +0100
From: kernel test robot <lkp@intel.com>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/crypto/ccp/sev-dev.c:1496:2-13: opportunity for
 str_enabled_disabled(data . tio_en)
Message-ID: <202611091052.6Mr5WKA1-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7475ea8b58616b33c04afb976cf0fbaad9dd63fb
commit: 4be423572da1f4c11f45168e3fafda870ddac9f8 crypto/ccp: Implement SEV-TIO PCIe IDE (phase1)
date:   11 months ago
config: x86_64-randconfig-2102-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091052.6Mr5WKA1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4be423572da1 ("crypto/ccp: Implement SEV-TIO PCIe IDE (phase1)")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091052.6Mr5WKA1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/ccp/sev-dev.c:1496:2-13: opportunity for str_enabled_disabled(data . tio_en)

vim +1496 drivers/crypto/ccp/sev-dev.c

  1368	
  1369	static int __sev_snp_init_locked(int *error, unsigned int max_snp_asid)
  1370	{
  1371		struct psp_device *psp = psp_master;
  1372		struct sev_data_snp_init_ex data;
  1373		struct sev_device *sev;
  1374		void *arg = &data;
  1375		int cmd, rc = 0;
  1376	
  1377		if (!cc_platform_has(CC_ATTR_HOST_SEV_SNP))
  1378			return -ENODEV;
  1379	
  1380		sev = psp->sev_data;
  1381	
  1382		if (sev->snp_initialized)
  1383			return 0;
  1384	
  1385		if (!sev_version_greater_or_equal(SNP_MIN_API_MAJOR, SNP_MIN_API_MINOR)) {
  1386			dev_dbg(sev->dev, "SEV-SNP support requires firmware version >= %d:%d\n",
  1387				SNP_MIN_API_MAJOR, SNP_MIN_API_MINOR);
  1388			return -EOPNOTSUPP;
  1389		}
  1390	
  1391		/* SNP_INIT requires MSR_VM_HSAVE_PA to be cleared on all CPUs. */
  1392		on_each_cpu(snp_set_hsave_pa, NULL, 1);
  1393	
  1394		/*
  1395		 * Starting in SNP firmware v1.52, the SNP_INIT_EX command takes a list
  1396		 * of system physical address ranges to convert into HV-fixed page
  1397		 * states during the RMP initialization.  For instance, the memory that
  1398		 * UEFI reserves should be included in the that list. This allows system
  1399		 * components that occasionally write to memory (e.g. logging to UEFI
  1400		 * reserved regions) to not fail due to RMP initialization and SNP
  1401		 * enablement.
  1402		 *
  1403		 */
  1404		if (sev_version_greater_or_equal(SNP_MIN_API_MAJOR, 52)) {
  1405			bool tio_supp = !!(sev->snp_feat_info_0.ebx & SNP_SEV_TIO_SUPPORTED);
  1406	
  1407			/*
  1408			 * Firmware checks that the pages containing the ranges enumerated
  1409			 * in the RANGES structure are either in the default page state or in the
  1410			 * firmware page state.
  1411			 */
  1412			snp_range_list = kzalloc(PAGE_SIZE, GFP_KERNEL);
  1413			if (!snp_range_list) {
  1414				dev_err(sev->dev,
  1415					"SEV: SNP_INIT_EX range list memory allocation failed\n");
  1416				return -ENOMEM;
  1417			}
  1418	
  1419			/*
  1420			 * Retrieve all reserved memory regions from the e820 memory map
  1421			 * to be setup as HV-fixed pages.
  1422			 */
  1423			rc = walk_iomem_res_desc(IORES_DESC_NONE, IORESOURCE_MEM, 0, ~0,
  1424						 snp_range_list, snp_filter_reserved_mem_regions);
  1425			if (rc) {
  1426				dev_err(sev->dev,
  1427					"SEV: SNP_INIT_EX walk_iomem_res_desc failed rc = %d\n", rc);
  1428				return rc;
  1429			}
  1430	
  1431			/*
  1432			 * Add HV_Fixed pages from other PSP sub-devices, such as SFS to the
  1433			 * HV_Fixed page list.
  1434			 */
  1435			snp_add_hv_fixed_pages(sev, snp_range_list);
  1436	
  1437			memset(&data, 0, sizeof(data));
  1438	
  1439			if (max_snp_asid) {
  1440				data.ciphertext_hiding_en = 1;
  1441				data.max_snp_asid = max_snp_asid;
  1442			}
  1443	
  1444			data.init_rmp = 1;
  1445			data.list_paddr_en = 1;
  1446			data.list_paddr = __psp_pa(snp_range_list);
  1447	
  1448			data.tio_en = tio_supp && sev_tio_enabled && amd_iommu_sev_tio_supported();
  1449	
  1450			/*
  1451			 * When psp_init_on_probe is disabled, the userspace calling
  1452			 * SEV ioctl can inadvertently shut down SNP and SEV-TIO causing
  1453			 * unexpected state loss.
  1454			 */
  1455			if (data.tio_en && !psp_init_on_probe)
  1456				dev_warn(sev->dev, "SEV-TIO as incompatible with psp_init_on_probe=0\n");
  1457	
  1458			cmd = SEV_CMD_SNP_INIT_EX;
  1459		} else {
  1460			cmd = SEV_CMD_SNP_INIT;
  1461			arg = NULL;
  1462		}
  1463	
  1464		/*
  1465		 * The following sequence must be issued before launching the first SNP
  1466		 * guest to ensure all dirty cache lines are flushed, including from
  1467		 * updates to the RMP table itself via the RMPUPDATE instruction:
  1468		 *
  1469		 * - WBINVD on all running CPUs
  1470		 * - SEV_CMD_SNP_INIT[_EX] firmware command
  1471		 * - WBINVD on all running CPUs
  1472		 * - SEV_CMD_SNP_DF_FLUSH firmware command
  1473		 */
  1474		wbinvd_on_all_cpus();
  1475	
  1476		rc = __sev_do_cmd_locked(cmd, arg, error);
  1477		if (rc) {
  1478			dev_err(sev->dev, "SEV-SNP: %s failed rc %d, error %#x\n",
  1479				cmd == SEV_CMD_SNP_INIT_EX ? "SNP_INIT_EX" : "SNP_INIT",
  1480				rc, *error);
  1481			return rc;
  1482		}
  1483	
  1484		/* Prepare for first SNP guest launch after INIT. */
  1485		wbinvd_on_all_cpus();
  1486		rc = __sev_do_cmd_locked(SEV_CMD_SNP_DF_FLUSH, NULL, error);
  1487		if (rc) {
  1488			dev_err(sev->dev, "SEV-SNP: SNP_DF_FLUSH failed rc %d, error %#x\n",
  1489				rc, *error);
  1490			return rc;
  1491		}
  1492	
  1493		snp_hv_fixed_pages_state_update(sev, HV_FIXED);
  1494		sev->snp_initialized = true;
  1495		dev_dbg(sev->dev, "SEV-SNP firmware initialized, SEV-TIO is %s\n",
> 1496			data.tio_en ? "enabled" : "disabled");
  1497	
  1498		dev_info(sev->dev, "SEV-SNP API:%d.%d build:%d\n", sev->api_major,
  1499			 sev->api_minor, sev->build);
  1500	
  1501		atomic_notifier_chain_register(&panic_notifier_list,
  1502					       &snp_panic_notifier);
  1503	
  1504		if (data.tio_en) {
  1505			/*
  1506			 * This executes with the sev_cmd_mutex held so down the stack
  1507			 * snp_reclaim_pages(locked=false) might be needed (which is extremely
  1508			 * unlikely) but will cause a deadlock.
  1509			 * Instead of exporting __snp_alloc_firmware_pages(), allocate a page
  1510			 * for this one call here.
  1511			 */
  1512			void *tio_status = page_address(__snp_alloc_firmware_pages(
  1513				GFP_KERNEL_ACCOUNT | __GFP_ZERO, 0, true));
  1514	
  1515			if (tio_status) {
  1516				sev_tsm_init_locked(sev, tio_status);
  1517				__snp_free_firmware_pages(virt_to_page(tio_status), 0, true);
  1518			}
  1519		}
  1520	
  1521		sev_es_tmr_size = SNP_TMR_SIZE;
  1522	
  1523		return 0;
  1524	}
  1525	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
