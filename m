Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793506371;
	b=M9WIRgbYMAF46VBZJckgKsWa360eHiv/YeQnuvxYJgYOvsfgaRpBdiypBNaibA9FCt1o
	 GbZjJypp5T0BP4g2nZnslVfVzY04B2jIHPNjq5g3f8ZYFpp0EweCHCgRQmhQE9YXIotHW
	 qfzeI9cY4Sko0XfRXRL9dIQlEOHc4CsHZ0EPmEwJNIFUK+PwhTNcQAtJ32xGFFq/DwMFs
	 KoSUXUwflu5XZH8sFaaFJSS3BcHHjjlepK8myDxeQTC0WsJz2tagoelEyXAGNP53UtgCD
	 TRcyOByWlM5AFVd4cK+PrFqfVH0bTFulfgHSmcBcvkDDwVlvtx7FzNlmgtGwinHuFrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793506371;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=hO/+P3Td3wNwkEtYO2g/WJJ6jmuq7Ax6ILtBhBfgEDs=;
	b=S3BklG5T1UFo8FOf8uDQAGXmhuy1q5ydou6IyNxViUs88FiGepITPQhXvGfS7YNyB59N
	 cWiV8LQylkr0gbGLf/7udClqmM7bq58LU+pmK2AN/JLiS3JT7jbupyMhrm49+XvxEw1Ve
	 Gw8L0o2x/fjuQJzCwCS286Imn2kCGaoH0aItrlV5U+IA7iQcjYbB5PFNs21AcnQxe5R6L
	 HFc2nLUz7mwk1WAIR6FsMwOLQQcna4m22/o3sGzBsWtaLPcmYhJbvFtgDXZ+Z/wJJJXlM
	 bUT1w0n5U/HQZL5bq3f27hhYEwBVF7g1oJOhtTq/DbZol0xTF7MPIfLD1YvskL7vbkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="aErLGa/V";
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22CF606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 04:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D22CF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aErLGa/V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793506369; x=1825042369;
  h=date:from:to:cc:subject:message-id;
  bh=yQbnzjl6gfov+6xQYnPIdCSLM8cNA2Q4v43h8G7cumE=;
  b=aErLGa/VJwzZh4byhdVSYuHe6njTj5js/nM8p+6VbpjSfNPTrjzHUVb6
   6YdXa9BgmG7QJweAHmcpiXY/LmUyBCBTeLPUCwtnnUmUrsav8zIfFXGZn
   PJ4BQQpYaurFdCLnL5jCpammrLTA4Sqg3t7vTwNntCZKSAkh1/TQo6Zbs
   93vV5sBNn8gEij6+3Xd8YcBGnUYSbZHKce4192EhS42KZO2WyHkKBcDbR
   VixIUZpRpsL8th81XgvQUbG/cVS/HOlS6kvZR0DMhEJig7p0STx112CKD
   TmBtxZmUp+Bm5aQ1wURdO2ZZRpb5LldmEu/ng5i1MiPYA//Wqpa++Xhl/
   g==;
X-CSE-ConnectionGUID: j/oVQ5BySBayIoiJKEnF7Q==
X-CSE-MsgGUID: pTnH99qMTCan2bJgH/avpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2118221"
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="2118221"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 21:12:49 -0700
X-CSE-ConnectionGUID: TEVf9u6qQTukRVP6Sarwrg==
X-CSE-MsgGUID: unOTJ3fuTWSGxYMo1+IRyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="7602324"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 31 Oct 2026 21:12:46 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNMw0-000000006KR-1HpF;
	Sun, 01 Nov 2026 04:12:44 +0000
Date: Sun, 01 Nov 2026 05:11:53 +0100
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>
Subject: 
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1494:24: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202611010511.Mk620DTd-lkp@intel.com>
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
head:   cbbddb6b08cc9900a87cccaa9b22bbe06aa4f50a
commit: 9a56a27e6002e29a6707dc4238d469ec84c3a68e net: stmmac: selftests: Pass the IP proto mask in the TC selftest
date:   9 weeks ago
config: hexagon-randconfig-r2309-20261101 (https://download.01.org/0day-ci/archive/20261101/202611010511.Mk620DTd-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8f6b51ca8bab1d49006ddaa042bc7e4e7306975d)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611010511.Mk620DTd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9a56a27e6002 ("net: stmmac: selftests: Pass the IP proto mask in the TC selftest")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611010511.Mk620DTd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1118:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [usertype] mask @@     got int @@
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1118:27: sparse:     expected restricted __be32 [usertype] mask
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1118:27: sparse:     got int
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1363:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [addressable] [usertype] src @@     got unsigned int [usertype] src_mask @@
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1363:18: sparse:     expected restricted __be32 [addressable] [usertype] src
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1363:18: sparse:     got unsigned int [usertype] src_mask
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1364:18: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 [addressable] [usertype] dst @@     got unsigned int [usertype] dst_mask @@
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1364:18: sparse:     expected restricted __be32 [addressable] [usertype] dst
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1364:18: sparse:     got unsigned int [usertype] dst_mask
>> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1494:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [addressable] [assigned] [usertype] src @@     got unsigned int [usertype] src_mask @@
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1494:24: sparse:     expected restricted __be16 [addressable] [assigned] [usertype] src
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1494:24: sparse:     got unsigned int [usertype] src_mask
>> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1495:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [addressable] [assigned] [usertype] dst @@     got unsigned int [usertype] dst_mask @@
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1495:24: sparse:     expected restricted __be16 [addressable] [assigned] [usertype] dst
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:1495:24: sparse:     got unsigned int [usertype] dst_mask

vim +1494 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c

4647e021193d63 Jose Abreu        2019-09-04  1427  
4647e021193d63 Jose Abreu        2019-09-04  1428  #ifdef CONFIG_NET_CLS_ACT
4647e021193d63 Jose Abreu        2019-09-04  1429  static int __stmmac_test_l4filt(struct stmmac_priv *priv, u32 dst, u32 src,
4647e021193d63 Jose Abreu        2019-09-04  1430  				u32 dst_mask, u32 src_mask, bool udp)
4647e021193d63 Jose Abreu        2019-09-04  1431  {
4647e021193d63 Jose Abreu        2019-09-04  1432  	struct {
4647e021193d63 Jose Abreu        2019-09-04  1433  		struct flow_dissector_key_basic bkey;
4647e021193d63 Jose Abreu        2019-09-04  1434  		struct flow_dissector_key_ports key;
9a56a27e6002e2 Maxime Chevallier 2026-08-25  1435  	} __aligned(BITS_PER_LONG / 8) keys = { };
4647e021193d63 Jose Abreu        2019-09-04  1436  	struct {
4647e021193d63 Jose Abreu        2019-09-04  1437  		struct flow_dissector_key_basic bmask;
4647e021193d63 Jose Abreu        2019-09-04  1438  		struct flow_dissector_key_ports mask;
9a56a27e6002e2 Maxime Chevallier 2026-08-25  1439  	} __aligned(BITS_PER_LONG / 8) masks = { };
4647e021193d63 Jose Abreu        2019-09-04  1440  	unsigned long dummy_cookie = 0xdeadbeef;
4647e021193d63 Jose Abreu        2019-09-04  1441  	struct stmmac_packet_attrs attr = { };
4647e021193d63 Jose Abreu        2019-09-04  1442  	struct flow_dissector *dissector;
4647e021193d63 Jose Abreu        2019-09-04  1443  	struct flow_cls_offload *cls;
e715d745043529 Jose Abreu        2020-01-10  1444  	int ret, old_enable = 0;
4647e021193d63 Jose Abreu        2019-09-04  1445  	struct flow_rule *rule;
4647e021193d63 Jose Abreu        2019-09-04  1446  
4647e021193d63 Jose Abreu        2019-09-04  1447  	if (!tc_can_offload(priv->dev))
4647e021193d63 Jose Abreu        2019-09-04  1448  		return -EOPNOTSUPP;
4647e021193d63 Jose Abreu        2019-09-04  1449  	if (!priv->dma_cap.l3l4fnum)
4647e021193d63 Jose Abreu        2019-09-04  1450  		return -EOPNOTSUPP;
e715d745043529 Jose Abreu        2020-01-10  1451  	if (priv->rss.enable) {
e715d745043529 Jose Abreu        2020-01-10  1452  		old_enable = priv->rss.enable;
e715d745043529 Jose Abreu        2020-01-10  1453  		priv->rss.enable = false;
b6b6cc9acd7b99 Arnd Bergmann     2019-09-19  1454  		stmmac_rss_configure(priv, priv->hw, NULL,
4647e021193d63 Jose Abreu        2019-09-04  1455  				     priv->plat->rx_queues_to_use);
e715d745043529 Jose Abreu        2020-01-10  1456  	}
4647e021193d63 Jose Abreu        2019-09-04  1457  
bf4afc53b77aea Linus Torvalds    2026-02-21  1458  	dissector = kzalloc_obj(*dissector);
4647e021193d63 Jose Abreu        2019-09-04  1459  	if (!dissector) {
4647e021193d63 Jose Abreu        2019-09-04  1460  		ret = -ENOMEM;
4647e021193d63 Jose Abreu        2019-09-04  1461  		goto cleanup_rss;
4647e021193d63 Jose Abreu        2019-09-04  1462  	}
4647e021193d63 Jose Abreu        2019-09-04  1463  
2b3082c6ef3b01 Ratheesh Kannoth  2023-07-29  1464  	dissector->used_keys |= (1ULL << FLOW_DISSECTOR_KEY_BASIC);
2b3082c6ef3b01 Ratheesh Kannoth  2023-07-29  1465  	dissector->used_keys |= (1ULL << FLOW_DISSECTOR_KEY_PORTS);
4647e021193d63 Jose Abreu        2019-09-04  1466  	dissector->offset[FLOW_DISSECTOR_KEY_BASIC] = 0;
4647e021193d63 Jose Abreu        2019-09-04  1467  	dissector->offset[FLOW_DISSECTOR_KEY_PORTS] = offsetof(typeof(keys), key);
4647e021193d63 Jose Abreu        2019-09-04  1468  
bf4afc53b77aea Linus Torvalds    2026-02-21  1469  	cls = kzalloc_obj(*cls);
4647e021193d63 Jose Abreu        2019-09-04  1470  	if (!cls) {
4647e021193d63 Jose Abreu        2019-09-04  1471  		ret = -ENOMEM;
4647e021193d63 Jose Abreu        2019-09-04  1472  		goto cleanup_dissector;
4647e021193d63 Jose Abreu        2019-09-04  1473  	}
4647e021193d63 Jose Abreu        2019-09-04  1474  
4647e021193d63 Jose Abreu        2019-09-04  1475  	cls->common.chain_index = 0;
4647e021193d63 Jose Abreu        2019-09-04  1476  	cls->command = FLOW_CLS_REPLACE;
4647e021193d63 Jose Abreu        2019-09-04  1477  	cls->cookie = dummy_cookie;
4647e021193d63 Jose Abreu        2019-09-04  1478  
323bbfcf1ef883 Linus Torvalds    2026-02-21  1479  	rule = kzalloc_flex(*rule, action.entries, 1);
4647e021193d63 Jose Abreu        2019-09-04  1480  	if (!rule) {
4647e021193d63 Jose Abreu        2019-09-04  1481  		ret = -ENOMEM;
4647e021193d63 Jose Abreu        2019-09-04  1482  		goto cleanup_cls;
4647e021193d63 Jose Abreu        2019-09-04  1483  	}
4647e021193d63 Jose Abreu        2019-09-04  1484  
4647e021193d63 Jose Abreu        2019-09-04  1485  	rule->match.dissector = dissector;
4647e021193d63 Jose Abreu        2019-09-04  1486  	rule->match.key = (void *)&keys;
4647e021193d63 Jose Abreu        2019-09-04  1487  	rule->match.mask = (void *)&masks;
4647e021193d63 Jose Abreu        2019-09-04  1488  
4647e021193d63 Jose Abreu        2019-09-04  1489  	keys.bkey.ip_proto = udp ? IPPROTO_UDP : IPPROTO_TCP;
4647e021193d63 Jose Abreu        2019-09-04  1490  	keys.key.src = htons(src);
4647e021193d63 Jose Abreu        2019-09-04  1491  	keys.key.dst = htons(dst);
9a56a27e6002e2 Maxime Chevallier 2026-08-25  1492  	/* Match the full IP proto field */
9a56a27e6002e2 Maxime Chevallier 2026-08-25  1493  	masks.bmask.ip_proto = 0xff;
4647e021193d63 Jose Abreu        2019-09-04 @1494  	masks.mask.src = src_mask;
4647e021193d63 Jose Abreu        2019-09-04 @1495  	masks.mask.dst = dst_mask;
4647e021193d63 Jose Abreu        2019-09-04  1496  
4647e021193d63 Jose Abreu        2019-09-04  1497  	cls->rule = rule;
4647e021193d63 Jose Abreu        2019-09-04  1498  
4647e021193d63 Jose Abreu        2019-09-04  1499  	rule->action.entries[0].id = FLOW_ACTION_DROP;
0dfb2d82af4cd7 Jakub Kicinski    2020-03-19  1500  	rule->action.entries[0].hw_stats = FLOW_ACTION_HW_STATS_ANY;
4647e021193d63 Jose Abreu        2019-09-04  1501  	rule->action.num_entries = 1;
4647e021193d63 Jose Abreu        2019-09-04  1502  
4647e021193d63 Jose Abreu        2019-09-04  1503  	attr.dst = priv->dev->dev_addr;
4647e021193d63 Jose Abreu        2019-09-04  1504  	attr.tcp = !udp;
4647e021193d63 Jose Abreu        2019-09-04  1505  	attr.sport = src;
4647e021193d63 Jose Abreu        2019-09-04  1506  	attr.dport = dst;
4647e021193d63 Jose Abreu        2019-09-04  1507  	attr.ip_dst = 0;
4647e021193d63 Jose Abreu        2019-09-04  1508  
4647e021193d63 Jose Abreu        2019-09-04  1509  	/* Shall receive packet */
4647e021193d63 Jose Abreu        2019-09-04  1510  	ret = __stmmac_test_loopback(priv, &attr);
4647e021193d63 Jose Abreu        2019-09-04  1511  	if (ret)
4647e021193d63 Jose Abreu        2019-09-04  1512  		goto cleanup_rule;
4647e021193d63 Jose Abreu        2019-09-04  1513  
4647e021193d63 Jose Abreu        2019-09-04  1514  	ret = stmmac_tc_setup_cls(priv, priv, cls);
4647e021193d63 Jose Abreu        2019-09-04  1515  	if (ret)
4647e021193d63 Jose Abreu        2019-09-04  1516  		goto cleanup_rule;
4647e021193d63 Jose Abreu        2019-09-04  1517  
4647e021193d63 Jose Abreu        2019-09-04  1518  	/* Shall NOT receive packet */
4647e021193d63 Jose Abreu        2019-09-04  1519  	ret = __stmmac_test_loopback(priv, &attr);
4647e021193d63 Jose Abreu        2019-09-04  1520  	ret = ret ? 0 : -EINVAL;
4647e021193d63 Jose Abreu        2019-09-04  1521  
4647e021193d63 Jose Abreu        2019-09-04  1522  	cls->command = FLOW_CLS_DESTROY;
4647e021193d63 Jose Abreu        2019-09-04  1523  	stmmac_tc_setup_cls(priv, priv, cls);
4647e021193d63 Jose Abreu        2019-09-04  1524  cleanup_rule:
4647e021193d63 Jose Abreu        2019-09-04  1525  	kfree(rule);
4647e021193d63 Jose Abreu        2019-09-04  1526  cleanup_cls:
4647e021193d63 Jose Abreu        2019-09-04  1527  	kfree(cls);
4647e021193d63 Jose Abreu        2019-09-04  1528  cleanup_dissector:
4647e021193d63 Jose Abreu        2019-09-04  1529  	kfree(dissector);
4647e021193d63 Jose Abreu        2019-09-04  1530  cleanup_rss:
e715d745043529 Jose Abreu        2020-01-10  1531  	if (old_enable) {
e715d745043529 Jose Abreu        2020-01-10  1532  		priv->rss.enable = old_enable;
4647e021193d63 Jose Abreu        2019-09-04  1533  		stmmac_rss_configure(priv, priv->hw, &priv->rss,
4647e021193d63 Jose Abreu        2019-09-04  1534  				     priv->plat->rx_queues_to_use);
4647e021193d63 Jose Abreu        2019-09-04  1535  	}
4647e021193d63 Jose Abreu        2019-09-04  1536  
4647e021193d63 Jose Abreu        2019-09-04  1537  	return ret;
4647e021193d63 Jose Abreu        2019-09-04  1538  }
4647e021193d63 Jose Abreu        2019-09-04  1539  #else
4647e021193d63 Jose Abreu        2019-09-04  1540  static int __stmmac_test_l4filt(struct stmmac_priv *priv, u32 dst, u32 src,
4647e021193d63 Jose Abreu        2019-09-04  1541  				u32 dst_mask, u32 src_mask, bool udp)
4647e021193d63 Jose Abreu        2019-09-04  1542  {
4647e021193d63 Jose Abreu        2019-09-04  1543  	return -EOPNOTSUPP;
4647e021193d63 Jose Abreu        2019-09-04  1544  }
4647e021193d63 Jose Abreu        2019-09-04  1545  #endif
4647e021193d63 Jose Abreu        2019-09-04  1546  

:::::: The code at line 1494 was first introduced by commit
:::::: 4647e021193d638d3c87d1f1b9a5f7f7a48f36a3 net: stmmac: selftests: Add selftest for L3/L4 Filters

:::::: TO: Jose Abreu <Jose.Abreu@synopsys.com>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
