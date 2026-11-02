Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617935;
	b=cXBkMydb9I/uC16FpMAQ/yOwglYU2YIdidvs35lVJ08OCQUBcJJvw2SCkEH5ShkMd0Yv
	 /vp47/OfiWI2WtBa8LE3Ow30PdgNsOEavrUEdGNKkSRQeN9uujQKlivN+mwd3sRgqqMt/
	 PQsQttRDreSc/UW8tZjzgr11gWja4MFm1cmYNM42YGMBqaW6xY0p62A7a7GGwMaxYaTTN
	 yekf8hkjWmHtqD1RdWfZ/o98Z11OV7cg4cw38BChsOTTR2QH/x+NQSeH88400qZRhq74b
	 HlTiGbZGVFG47DLqLWv5fs3Dc9B9yHit8WvhBbrtDuvFxHqd5Lz6+UlpkXCToFGAtqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617935;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=p3QW/w/iY0YD/fqxj57gSpeQygMNXvAXA/WJlwwf7AY=;
	b=oCUN1Rn9UGqXkuDswvVlaoiKUFWuv9lK/rEKj+eY6N82SVTgpzTlSiPZFiynACCTisk1
	 NPZf6bA6c+IMliAt3pT+/7u0cfwhkKPdz4IsNOiedwzVO965E3dfLRWGJCw7HdpTn9voh
	 7zvAylOblSqG2abeYb9NNiH+ggWsUDd3oheeUQSzbeG3w7dy3zipLhHc9OgyE81rmM2Xy
	 AUZCAukFrWeZpnx6Fdtc6NAXmnPh/eZ66kLZb98+2uNEuZ/u1Dq5+ZD5x0CGFIxIJT2On
	 e6N4JkI93SM0XgDSNiu2PF6mj0lfJEEr6HppP9cxS5DCqKa4KoVoRZs2PPfMboGsq4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KDXpE5ZH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF722606A32E;
	Mon,  2 Nov 2026 11:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KDXpE5ZH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A531D1F00A18;
	Mon,  2 Nov 2026 11:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793617934;
	bh=p3QW/w/iY0YD/fqxj57gSpeQygMNXvAXA/WJlwwf7AY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KDXpE5ZHAugBzRh7LbV3zOAVu3BfNLWIqbN74KktzmBSjq9HPggqNlTTtHPzs8ZyV
	 8A9nwc7c9ipCGjvlBYVOZAs36kcyoSkX/RroQquXlpQmAXJ2jfOu+BsmSxscRGo6pd
	 JY5ypURvzCSbsrqtqfiZqnmBMDWhF20DP+jadUb0fM9lwyrkY6Pe/fgwki/YgC62P3
	 ZBqmxMyitVHBe5wS9g5/C/CrsSQ2Mz2l/ojGbPstB7KJS2Lv5EjS8zb3VAnC7clLeg
	 D40LtjIH8e618txqVm10LPMDkZBIHm3/iNBPqEp+wxppfwmDIOirCGmrbcxnsbarXb
	 5D5BBbKCETxYg==
Date: Mon, 2 Nov 2026 11:12:10 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Suren Baghdasaryan <surenb@google.com>, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: drivers/hwtracing/stm/core.c:509:8-24: WARNING: stm_fops:
 .write() has stream semantic; safe to change nonseekable_open ->
 stream_open. (fwd)
Message-ID: <auhvGNG1fJBFFM-q@gremlin>
References: <f887f7b3-b72c-99d2-8dbf-96cbd83774bf@inria.fr>
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
In-Reply-To: <f887f7b3-b72c-99d2-8dbf-96cbd83774bf@inria.fr>

+cc Alex

On Mon, Nov 02, 2026 at 12:54:31AM +0100, Julia Lawall wrote:
> just forwarding.  I don't know anything about this issue.
>
> julia

Thanks. This is unrelated to my change, looks like a cosmetic report that
predates it. Cc'd Alex, but not sure if any action is required.

Cheers, Lorenzo

>
> ---------- Forwarded message ----------
> Date: Mon, 02 Nov 2026 00:48:49 +0100
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: drivers/hwtracing/stm/core.c:509:8-24: WARNING: stm_fops: .write() has
>     stream semantic; safe to change nonseekable_open -> stream_open.
>
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
> CC: Andrew Morton <akpm@linux-foundation.org>
> CC: Linux Memory Management List <linux-mm@kvack.org>
> CC: Suren Baghdasaryan <surenb@google.com>
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> commit: b0085cb94d2477787f4197a3000e33aabf3d48fc stm: replace deprecated mmap hook with mmap_prepare
> date:   7 months ago
> :::::: branch date: 2 hours ago
> :::::: commit date: 7 months ago
> config: mips-randconfig-r2106-20261101 (https://download.01.org/0day-ci/archive/20261102/202611020009.xkUfJUpm-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8f6b51ca8bab1d49006ddaa042bc7e4e7306975d)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: b0085cb94d24 ("stm: replace deprecated mmap hook with mmap_prepare")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202611020009.xkUfJUpm-lkp@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
> >> drivers/hwtracing/stm/core.c:509:8-24: WARNING: stm_fops: .write() has stream semantic; safe to change nonseekable_open -> stream_open.
>
> vim +509 drivers/hwtracing/stm/core.c
>
> c7fd62bc69d022 Alexander Shishkin 2018-10-05  484
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  485  static int stm_char_open(struct inode *inode, struct file *file)
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  486  {
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  487  	struct stm_file *stmf;
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  488  	struct device *dev;
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  489  	unsigned int major = imajor(inode);
> a0ebf519b8a266 Johan Hovold       2016-11-18  490  	int err = -ENOMEM;
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  491
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  492  	dev = class_find_device(&stm_class, NULL, &major, major_match);
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  493  	if (!dev)
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  494  		return -ENODEV;
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  495
> bf4afc53b77aea Linus Torvalds     2026-02-21  496  	stmf = kzalloc_obj(*stmf);
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  497  	if (!stmf)
> a0ebf519b8a266 Johan Hovold       2016-11-18  498  		goto err_put_device;
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  499
> a0ebf519b8a266 Johan Hovold       2016-11-18  500  	err = -ENODEV;
> cde4ad8368840e Alexander Shishkin 2016-02-15  501  	stm_output_init(&stmf->output);
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  502  	stmf->stm = to_stm_device(dev);
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  503
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  504  	if (!try_module_get(stmf->stm->owner))
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  505  		goto err_free;
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  506
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  507  	file->private_data = stmf;
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  508
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22 @509  	return nonseekable_open(inode, file);
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  510
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  511  err_free:
> a0ebf519b8a266 Johan Hovold       2016-11-18  512  	kfree(stmf);
> a0ebf519b8a266 Johan Hovold       2016-11-18  513  err_put_device:
> f7c81c7176c72c Alexander Shishkin 2016-02-15  514  	/* matches class_find_device() above */
> f7c81c7176c72c Alexander Shishkin 2016-02-15  515  	put_device(dev);
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  516
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  517  	return err;
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  518  }
> 7bd1d4093c2fa3 Alexander Shishkin 2015-09-22  519
>
> :::::: The code at line 509 was first introduced by commit
> :::::: 7bd1d4093c2fa37d1ecab05da3c9d48ea2af2264 stm class: Introduce an abstraction for System Trace Module devices
>
> :::::: TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> :::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

--
Cheers, Lorenzo
