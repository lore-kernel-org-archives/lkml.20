Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793577275;
	b=lJIA3nmMrIhK7Ba/CdUV2KoUxLZqVfzhsBjwsOH5PaT4QX8NwRLX++1TCf3jAw3YdL0M
	 +91gbzlESUW5p23sX+a5wTARBeb8dCqwtZC8aSJM6uwc6TUVOPT1t1cTUyqY9ar3nbnCV
	 bSJPOeEB+h8VKwd7FncTDwDpe5MHSBd3P/PsxoHy0xgysjwf7SU4A12FNZTPbjYs42d0p
	 1Kvu4cFvuh61hLpREcSITVwuuqJOfH8Zb9AxnN8i80f80wj/+ZpsrXx8iv5N4x1GID3qc
	 IqRW/zjqCNDybgozbCuQrD1OyMHfBafOuBRV5GYBP2rw4oqqnbivwsNfU1GMV/gYtng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793577275;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:Message-ID:
	 MIME-Version:Content-Type;
	bh=BlqBpaBiBIH3lx9LCXT9bYsm6eEmk51QgXtyvSdnxRE=;
	b=h43EjAOp0pgeE64SWk0rjp3umKQFCI3qfzDR0ehVdDJ+ow3ulEBGgYIVGNcrSL9WdBRe
	 +YX+8DaaUOPZ9TA3qqf3NyWLT6ozq7grUW+hVbvuXCLCKJjpvQAR1xPnfCWVRbzVon3Fj
	 dqxm6ABJZkvaVDgJA8T8V8BLvCvh0BVLd965p2E5Tlhu7dtLcA/C+eFMzeuokpDHNN4ap
	 RX3OyjcF2hA2eU9fuqc31ANg3xu//x4srZTA25mu2Y9jpf/XcVFMe3Rp8REYst+U0ZRca
	 bJbiI+ohGaIivHjm7aAlHXYDlKcCDg7zBIX+DRWu7z4F/I3zCSuGOZANIT3jap6+XUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b="hXM26/to";
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0120606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0120606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=hXM26/to
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BlqBpaBiBIH3lx9LCXT9bYsm6eEmk51QgXtyvSdnxRE=;
  b=hXM26/toW/dGBf8YdPcVB8v1CmTt3tQYL4Nk9ZIAB+Wd1KIRUgXXbIDR
   Q9NVch7ziYUX8zSunSDAB6W1Ua9j+0DtBRbG6QTmfYxNqx8z/5IUU+cAB
   VFttaM4t7h0nCnn23XD6dymTUMC4rxVY3iG1TX9n7wU0vGhfi0Q4cSFnf
   4=;
X-CSE-ConnectionGUID: 7Vm0An2ETui3fCCnKWyczw==
X-CSE-MsgGUID: E/l8+JRzSWC0WBlBdEXO9g==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,190,1787004000"; 
   d="scan'208";a="303236812"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 00:54:32 +0100
Date: Mon, 2 Nov 2026 00:54:31 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    Linux Memory Management List <linux-mm@kvack.org>, 
    Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, 
    oe-kbuild-all@lists.linux.dev
Subject: drivers/hwtracing/stm/core.c:509:8-24: WARNING: stm_fops: .write()
 has stream semantic; safe to change nonseekable_open -> stream_open. (fwd)
Message-ID: <f887f7b3-b72c-99d2-8dbf-96cbd83774bf@inria.fr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

just forwarding.  I don't know anything about this issue.

julia

---------- Forwarded message ----------
Date: Mon, 02 Nov 2026 00:48:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/hwtracing/stm/core.c:509:8-24: WARNING: stm_fops: .write() has
    stream semantic; safe to change nonseekable_open -> stream_open.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Suren Baghdasaryan <surenb@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
commit: b0085cb94d2477787f4197a3000e33aabf3d48fc stm: replace deprecated mmap hook with mmap_prepare
date:   7 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 months ago
config: mips-randconfig-r2106-20261101 (https://download.01.org/0day-ci/archive/20261102/202611020009.xkUfJUpm-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8f6b51ca8bab1d49006ddaa042bc7e4e7306975d)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b0085cb94d24 ("stm: replace deprecated mmap hook with mmap_prepare")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611020009.xkUfJUpm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/hwtracing/stm/core.c:509:8-24: WARNING: stm_fops: .write() has stream semantic; safe to change nonseekable_open -> stream_open.

vim +509 drivers/hwtracing/stm/core.c

c7fd62bc69d022 Alexander Shishkin 2018-10-05  484
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  485  static int stm_char_open(struct inode *inode, struct file *file)
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  486  {
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  487  	struct stm_file *stmf;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  488  	struct device *dev;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  489  	unsigned int major = imajor(inode);
a0ebf519b8a266 Johan Hovold       2016-11-18  490  	int err = -ENOMEM;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  491
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  492  	dev = class_find_device(&stm_class, NULL, &major, major_match);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  493  	if (!dev)
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  494  		return -ENODEV;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  495
bf4afc53b77aea Linus Torvalds     2026-02-21  496  	stmf = kzalloc_obj(*stmf);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  497  	if (!stmf)
a0ebf519b8a266 Johan Hovold       2016-11-18  498  		goto err_put_device;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  499
a0ebf519b8a266 Johan Hovold       2016-11-18  500  	err = -ENODEV;
cde4ad8368840e Alexander Shishkin 2016-02-15  501  	stm_output_init(&stmf->output);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  502  	stmf->stm = to_stm_device(dev);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  503
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  504  	if (!try_module_get(stmf->stm->owner))
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  505  		goto err_free;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  506
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  507  	file->private_data = stmf;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  508
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22 @509  	return nonseekable_open(inode, file);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  510
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  511  err_free:
a0ebf519b8a266 Johan Hovold       2016-11-18  512  	kfree(stmf);
a0ebf519b8a266 Johan Hovold       2016-11-18  513  err_put_device:
f7c81c7176c72c Alexander Shishkin 2016-02-15  514  	/* matches class_find_device() above */
f7c81c7176c72c Alexander Shishkin 2016-02-15  515  	put_device(dev);
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  516
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  517  	return err;
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  518  }
7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  519

:::::: The code at line 509 was first introduced by commit
:::::: 7bd1d4093c2fa37d1ecab05da3c9d48ea2af2264 stm class: Introduce an abstraction for System Trace Module devices

:::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
