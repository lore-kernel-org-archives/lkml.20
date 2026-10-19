Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707C0446053
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792383500; cv=none; b=GM12aJE2ohsbKrWXaL4w0zzQxDiJxhEG+KYxY/0Mlul1Nr7vDf+Bgnv6TeAxD28nyBJBNSetzAg4w+8XBltVGcH8QtAplb227ITvyhxO5wEuzHIBrxIC8rEBDbWIqVQQU/sd3amWZ1rkbY/c/hpxmx35B5AkRiLn4I2dvP0QED4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792383500; c=relaxed/simple;
	bh=DKWcwLVPYEbazp5IrjwAYhy11Btxpm2xb9gQaBxSuL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIEo+0dmZKbOIX16GJm0gMgO3t4ZmjchBXf34sicGBdf7I+iENGTrh92HtRd6C8jjT6SoxY9kH58UvkCVMBuusNzopHUO1kwJ2uePYVWGGe9pf9KmvA9yXOZbDpHhljFuffNmukfgyWhygW7u71etBqwWMGL/2vFnQf2ZLx6HUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qm63cRp7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qm63cRp7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792383496; x=1823919496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DKWcwLVPYEbazp5IrjwAYhy11Btxpm2xb9gQaBxSuL4=;
  b=Qm63cRp7q++TTfJnQILTR9SrhONEe4JffZrIinZmvQGGqDOz0AxmXkvh
   U/0rPhOwgVRMu4A8F9dc/948zfoyeoji4dt60yq1s2gLFHH+hpInJXGGT
   GnnGm9HN1QszpN2rkmlKi1AbPqhzo9bdeEekiG+6OapOnLdF12B/nwOra
   eCjmi0rACuP7d1hYm29FXyv4jQ8kzTwI+WxItdxmVVZhn/sdFGJnsbLrj
   ZLFm/s+JIXydvF8YpoLgm7mY4tB6Y8jcyoNzElRoIe+MDJl1iklJ7j2Z6
   Rb623BQUBYRiVZGI6rPTz01w+P/riemkU0PZTTiSbEVuEuVftLU8vXGb+
   A==;
X-CSE-ConnectionGUID: ejJDAzUATVu1hqxTocziwQ==
X-CSE-MsgGUID: if43DUXLQNm9CazvYxn6ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="963175"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="963175"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 21:18:15 -0700
X-CSE-ConnectionGUID: WQ92mKKYR6mqCmrUJpk1vw==
X-CSE-MsgGUID: 4lCetu/rTxSuqbD7fpcFIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2369239"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Oct 2026 21:18:12 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIep7-00000000LGM-3MQV;
	Mon, 19 Oct 2026 04:18:09 +0000
Date: Mon, 19 Oct 2026 12:17:12 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Menachem Adin <menachem.adin@intel.com>,
	Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Reuven Abliyev <reuvenab@gmail.com>
Subject: Re: [PATCH char-misc-next v2 4/4] issei: add driver to driver
 interface
Message-ID: <202610191253.F5L34Ggm-lkp@intel.com>
References: <20261018-issei_pm_and_itf-v2-4-7a07452e3606@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018-issei_pm_and_itf-v2-4-7a07452e3606@intel.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 79e5797d243a466138f641932f81dc69f796060c]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Usyskin/issei-save-power_down-flag-while-processing-event/20261018-123052
base:   79e5797d243a466138f641932f81dc69f796060c
patch link:    https://lore.kernel.org/r/20261018-issei_pm_and_itf-v2-4-7a07452e3606%40intel.com
patch subject: [PATCH char-misc-next v2 4/4] issei: add driver to driver interface
config: i386-randconfig-1002-20261019 (https://download.01.org/0day-ci/archive/20261019/202610191253.F5L34Ggm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191253.F5L34Ggm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191253.F5L34Ggm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from drivers/misc/issei/issei_device.c:4:
   drivers/misc/issei/issei_device.c: In function 'issei_device_write':
>> drivers/misc/issei/issei_device.c:163:45: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'ssize_t' {aka 'int'} [-Wformat=]
     163 |                         dev_dbg(&idev->dev, "Failed writing data ret = %ld\n", ret);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:139:49: note: in definition of macro 'dev_no_printk'
     139 |                         _dev_printk(level, dev, fmt, ##__VA_ARGS__);    \
         |                                                 ^~~
   include/linux/dev_printk.h:171:40: note: in expansion of macro 'dev_fmt'
     171 |         dev_no_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                        ^~~~~~~
   drivers/misc/issei/issei_device.c:163:25: note: in expansion of macro 'dev_dbg'
     163 |                         dev_dbg(&idev->dev, "Failed writing data ret = %ld\n", ret);
         |                         ^~~~~~~
   drivers/misc/issei/issei_device.c:163:74: note: format string is defined here
     163 |                         dev_dbg(&idev->dev, "Failed writing data ret = %ld\n", ret);
         |                                                                        ~~^
         |                                                                          |
         |                                                                          long int
         |                                                                        %d


vim +163 drivers/misc/issei/issei_device.c

   113	
   114	/**
   115	 * issei_device_write - send data to the firmware client.
   116	 * @ctx: opaque context
   117	 * @ubuf: data to send
   118	 * @length: data length
   119	 * @timeout: operation timeout in milliseconds
   120	 *
   121	 * Return: >=0 data length on success, <0 on error
   122	 */
   123	ssize_t issei_device_write(void *ctx, const u8 *ubuf, size_t length, unsigned long timeout)
   124	{
   125		struct issei_host_client *cl = ctx;
   126		struct issei_device *idev = cl->idev;
   127		ssize_t ret;
   128		long wret;
   129	
   130		if (idev->rst_state != ISSEI_RST_STATE_DONE) {
   131			dev_dbg(&idev->dev, "Device is in transition\n");
   132			return -EBUSY;
   133		}
   134	
   135		if (!length)
   136			return 0;
   137	
   138		/* sanity check */
   139		if (length > idev->dma.length.h2f) {
   140			dev_dbg(&idev->dev, "Write is too big %zu > %zu\n", length,
   141				idev->dma.length.h2f);
   142			return -EFBIG;
   143		}
   144	
   145		u8 *buf __free(kfree) = kmemdup(ubuf, length, GFP_KERNEL);
   146		if (!buf)
   147			return -ENOMEM;
   148	
   149		do {
   150			ret = issei_cl_write(cl, buf, length);
   151			if (ret < 0 && ret != -EAGAIN)
   152				return ret;
   153			/* buf is consumed by issei_cl_write on success */
   154			if (ret >= 0)
   155				retain_and_null_ptr(buf);
   156			wret = wait_event_interruptible_timeout(cl->write_wait,
   157								issei_cl_check_write(cl) != 1,
   158								msecs_to_jiffies(timeout));
   159			if (wret == 0) /* timeout */
   160				wret = -ETIMEDOUT;
   161			if (wret < 0) {
   162				issei_cl_clean_all_wbuf(cl);
 > 163				dev_dbg(&idev->dev, "Failed writing data ret = %ld\n", ret);
   164				return wret;
   165			}
   166		} while (ret == -EAGAIN);
   167	
   168		return ret;
   169	}
   170	EXPORT_SYMBOL_GPL(issei_device_write);
   171	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
