Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793131426;
	b=ObLYbkD5U3p9uUSPG3B+60sRblniaLipXloP85HF6+w8bXxmCiudzEAb0y7yJ2RsU0lF
	 n6ebhKgw71FHf5a9ovWEooRzNUQAY70QhpZifuduHz5MAiS/5fe/oy8v1W48KjAR5KWoC
	 +bcjEwzARLIUOIp1KCQ6frg5BtPU5NwqTKrmlyB7cAZ8axvw9zglDzShqCQkgqZWpEP3x
	 rgYOyS+V8YFzUwCjgyco5B22e4q514yqtbch8KKDYNs6TpUi7sB7MK9//Bg5G2/Kz3XUZ
	 A4S0ufZsAJ5nNV42nbZnxQVsn1DEvteLHlVCSHM60/LdyrP9O9BX21nQa/lw0xuNwkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793131426;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zI1LtDdMCHtcuHQCYhcbyED5/mQEBKDbhEXb83l5fYI=;
	b=Dpd/mVAe2/pylUH5OtyvhT289qKzfilkKFmtcPSeYkpUY0xeRUako3Mbz1vPaX3MJzAq
	 mzyntcT9yBIC1Nl4HIfxb/gOzTXz63wghK5fgDECGy5+ZNxGvCxeImUBLw3wKauQdCAwc
	 JKr8uIZRvuVnrFhyu0zMz/xKv08PwTw8FYhlAbSElGigLhpZT5tAuTk6GW+apCRwabonn
	 HdcKPKbZJ50a0IPA5ptEx8TUnzwUTTwvH42G3wMq8isqcFQw26pqUt2akYGNbVur9UKZB
	 fKeUCkrEnFGNfYg5zvXyItgykhilPfVnNY/EWR89HxVGhNaxEa8yVn076LFT5Iz7pLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yuj7WlQL;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49D3606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A49D3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yuj7WlQL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793131424; x=1824667424;
  h=date:from:to:cc:subject:message-id;
  bh=gkwdKQZ8NyLJLfXg5tsrNeW8YNCrNkSIjFEBgo3mCHQ=;
  b=Yuj7WlQLceWCDtTi93DiSZ1V4fa0jgA7713GOHX1YUnDbFZ52LNmTpT6
   IbxWz8xbJ0VGlmsPpQftGtKi4pV7gZRTzRZdQeoZGTVUev8gW/AtVKG26
   JgoJtFIEm3S/GdBTxxq333IP6fEqf8p8rx3nd3i2sjWjPbygGIoJs+ArX
   Dvft9+0fW6/CKQXJHxDrDesJxAZqRTGzGel34zb4RYqWegzvpkecQK1kE
   WPgBYPUI3JHpnpIT7HejG21m8GJGAvVU/cxFpeXwVUEdjrmDfQUrUyrsN
   QMrmvaRuGAOnrY58aApcGz/QtJ97pNgGxmeY/ZzK6laJxylWt6CzFr434
   A==;
X-CSE-ConnectionGUID: M2CILU6dQJOg1vSKQYnPxA==
X-CSE-MsgGUID: 6V5skhuoQtyoAP+oX3fbmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1872262"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1872262"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 13:03:44 -0700
X-CSE-ConnectionGUID: tMGarHfBTQmZyg9nzR9T5w==
X-CSE-MsgGUID: nOZkb9HCRWOuiVSstT96yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4983928"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 27 Oct 2026 13:03:42 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLnOV-000000004bx-3743;
	Tue, 27 Oct 2026 20:03:39 +0000
Date: Tue, 27 Oct 2026 21:03:23 +0100
From: kernel test robot <lkp@intel.com>
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: drivers/rtc/rtc-m41t93.c:496: undefined reference to
 `devm_watchdog_register_device'
Message-ID: <202610272125.Me30O4PA-lkp@intel.com>
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
head:   83f32c773255720a661aa45d83e36278135f23f5
commit: 15ec2ce19962b61576c8bf25bc129fc61a653c2e rtc: m41t93: Add watchdog support
date:   4 months ago
config: powerpc64-randconfig-r2109-20261027 (https://download.01.org/0day-ci/archive/20261027/202610272125.Me30O4PA-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610272125.Me30O4PA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 15ec2ce19962 ("rtc: m41t93: Add watchdog support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610272125.Me30O4PA-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: drivers/rtc/rtc-m41t93.o: in function `m41t93_probe':
>> drivers/rtc/rtc-m41t93.c:496: undefined reference to `devm_watchdog_register_device'


vim +496 drivers/rtc/rtc-m41t93.c

   481	
   482	static int m41t93_watchdog_register(struct device *dev, struct m41t93_data *m41t93)
   483	{
   484		int ret;
   485	
   486		m41t93->wdd.parent = dev;
   487		m41t93->wdd.info = &m41t93_wdt_info;
   488		m41t93->wdd.ops = &m41t93_watchdog_ops;
   489		m41t93->wdd.min_timeout = 0;
   490		m41t93->wdd.max_timeout = 10;
   491		m41t93->wdd.timeout = 3; /* Default timeout is 3 sec */
   492		m41t93->wdd.status = WATCHDOG_NOWAYOUT_INIT_STATUS;
   493	
   494		watchdog_set_drvdata(&m41t93->wdd, m41t93);
   495	
 > 496		ret = devm_watchdog_register_device(dev, &m41t93->wdd);
   497		if (ret) {
   498			dev_warn(dev, "Failed to register watchdog\n");
   499			return ret;
   500		}
   501	
   502		/* Disable watchdog at start */
   503		ret = m41t93_wdt_stop(&m41t93->wdd);
   504	
   505		return ret;
   506	}
   507	#endif
   508	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
