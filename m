Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359DF5540A8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155485; cv=none; b=jc3wZLqmBMO7IGFkNiv7aLjcVdQe293tW/Yw3qpPEoLemTusO5elPkdBIDTevIEQhhCWixV7NrtMUUumlwdzXlIerg7Ghp33iyzpq9N6nUDeN9UnY/jE7GXp4eI+AHhSMKEfIsylM+jYL7DUJRgqLXvMu/sojcc6XGzJvMpWpj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155485; c=relaxed/simple;
	bh=fa/Qeb96oMIW5T8LspLwkD0jLNb+byEmUjzRFc7U9bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQXYnUCG3SLtjQpEtqapQPDqCay4/W8wpE+aUczTDrwBnJ3zf0WPOYUq5MUGdEB13iwF9PcRhFBJgqQsv28jujvXB+Yd4xhXE6Hb9TeozLtB9y6JzQc2r/bj50+fd0t+9pLu1jxr6Rrmga1WzWV8lrkClKfENI/0cXLDLXd+hF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cd7/P7f1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cd7/P7f1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789155473; x=1820691473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fa/Qeb96oMIW5T8LspLwkD0jLNb+byEmUjzRFc7U9bE=;
  b=cd7/P7f1EXAYV5slNasPo0F5Rk2+pzY54qChjT7cBeP9zF7rPvQjYZ1f
   YGG5ewt+Y8fbUt8xqJ4g8hEEaqX2LkN2gTuzbyt4rNPnZoQluexErZmjM
   v4/ltpxNHrcNpNNsk2sx4FZV7lI4fXTwRjgVLAAaQD0AhDwO1+otpYiuY
   CZWZgsrg+JqVLdYhnyg3ksAzbVZsJw6S75P6SI8l1dD6dVhepPIVBO+L0
   ZjWrzvNmX0yI41jHx6tbnrTgCAuQAePPS1vN/kImbCPeLWPoIPjZ9v1q9
   LLvXLOk0v7PlFlXP5uLLeDyqURq9ZwLE2qC6KYTXNRtiRP+/CfO3cocyp
   w==;
X-CSE-ConnectionGUID: cvIeQgfQQmGGuFCplRaBjQ==
X-CSE-MsgGUID: VlD9YDqMRG+WOIt5siM4Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="100219223"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100219223"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 12:37:48 -0700
X-CSE-ConnectionGUID: Uk1sUkphTIm9x26Lc89Pow==
X-CSE-MsgGUID: dLARZMgRQJKX3i/XqnpjcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="270239988"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 11 Sep 2026 12:37:47 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x573w-0000000022v-24QR;
	Fri, 11 Sep 2026 19:37:37 +0000
Date: Sat, 12 Sep 2026 03:36:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] printk: Use two irq_works instead per-CPU
Message-ID: <202609120349.yDbrP6Tf-lkp@intel.com>
References: <20260911103832.w6C8cT4L@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911103832.w6C8cT4L@linutronix.de>

Hi Sebastian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.3-rc2 next-20260909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Andrzej-Siewior/printk-Use-two-irq_works-instead-per-CPU/20260911-123832
base:   linus/master
patch link:    https://lore.kernel.org/r/20260911103832.w6C8cT4L%40linutronix.de
patch subject: [PATCH] printk: Use two irq_works instead per-CPU
config: m68k-randconfig-r131-20260911 (https://download.01.org/0day-ci/archive/20260912/202609120349.yDbrP6Tf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609120349.yDbrP6Tf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609120349.yDbrP6Tf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/printk/printk.c:4614:17: sparse: sparse: symbol 'pending_wakeup_work' was not declared. Should it be static?
>> kernel/printk/printk.c:4615:17: sparse: sparse: symbol 'pending_output_work' was not declared. Should it be static?

vim +/pending_wakeup_work +4614 kernel/printk/printk.c

  4613	
> 4614	struct irq_work pending_wakeup_work = IRQ_WORK_INIT_LAZY(pending_wake_fn);
> 4615	struct irq_work pending_output_work = IRQ_WORK_INIT_LAZY(pending_output_fn);
  4616	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
