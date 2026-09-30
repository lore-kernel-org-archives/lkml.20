Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40F23769E1;
	Wed, 30 Sep 2026 03:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739180; cv=none; b=Rwy7/XPm8ghV1/yuvST2kO9bbGbhrL6qn394Txi1FfsAvw73RuxDRxtenG0tFsLWzKEuLWpn8bn9kC9TQLm0oDOFG/Tk3EB9FA56jq7GmF8u/TzNXqu7NbXxNf7TtNXNJjusK87rsh0FHXjdx3DQJAuLhSuBee4hr1ysOFQj4bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739180; c=relaxed/simple;
	bh=F7yB+D0IFepWy0sCKHOz+1szfj0w0UzZ+J/K3eaDBhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xq5IdEMbsNW+9HofyJHlwKfrAj0g2pDadhvQOklGntIAq5iC3T9QUyNnhbXY+Og47+YntahAkToeDWGvSVwVHxpPMrOYPwwYsJFAMBXsoyLLLq0/LSDuyK7X+4Nu/7ZpOEhRPtVkgf3h2bcuUkP2IDz01C0wK7CNJ0POeI2yBO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwM/jzLY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwM/jzLY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE371F000FF;
	Wed, 30 Sep 2026 03:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790739176;
	bh=OAxFcNutWaEJc7UROCwX8/ekY1pHdbFP/wZdGR502Ww=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=lwM/jzLYDhIs8nuczFQIgEfiw7dl7opcRVMTjZ0uHhwWbhtHPkLIEPc2AjoARQKae
	 WT2m5e16V+U4c75b8362p4UWinVQu9xo+TNrNWO65JlBj2jiik9UIzMESeL484zX4r
	 1mrUXxEMqZRy75ejvnf5wz7a1h7/5Np9wcTeZnaQcCDfN0xJyJRyZQx9nX98Yp/9/L
	 ZiDQJnN+nXzMdQOcKAedr6KxroKt2P7se3KSOwkYEF/HNVzpBT4/yTN4DMHizBjkr2
	 QeRFG848qJMJBoYMidKzokP/JuzwnR+D7X7nXwUVh92hI0Y8W8M0UQ9lU2lY3xT3tD
	 qYonHw4Wffvdw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id EE702CE3A55; Tue, 29 Sep 2026 20:32:55 -0700 (PDT)
Date: Tue, 29 Sep 2026 20:32:55 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Bradley Morgan <brads@mainlining.org>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [paulmck-rcu:dev.2026.09.18a 24/34] block.c:undefined reference
 to `cmpxchg_emu_u8'
Message-ID: <e030337e-b2ca-4192-a357-1d54189f6ada@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202609301117.nVKrDSkb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609301117.nVKrDSkb-lkp@intel.com>

On Wed, Sep 30, 2026 at 11:13:04AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2026.09.18a
> head:   90599c372e13369d11f6c1a01ff0094b16f72cf8
> commit: c98d10b438b5626edb3f4e06f4f62bcb6ed6fe90 [24/34] lib: Add two-byte cmpxchg emulation function
> config: xtensa-randconfig-1000-20260929 (https://download.01.org/0day-ci/archive/20260930/202609301117.nVKrDSkb-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301117.nVKrDSkb-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609301117.nVKrDSkb-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

My bad.  I need to adjust the Kconfig change.

							Thanx, Paul

>    xtensa-linux-ld: fs/crypto/block.o: in function `fscrypt_limit_io_blocks':
> >> block.c:(.text+0x300): undefined reference to `cmpxchg_emu_u8'
>    xtensa-linux-ld: fs/crypto/block.o: in function `fscrypt_zeroout_range_end_io':
>    block.c:(.text+0x31c): undefined reference to `cmpxchg_emu_u8'
>    xtensa-linux-ld: fs/btrfs/bio.o: in function `btrfs_bio_alloc':
> >> bio.c:(.text+0x88c): undefined reference to `cmpxchg_emu_u8'
>    xtensa-linux-ld: fs/btrfs/bio.o: in function `btrfs_bio_end_io':
>    bio.c:(.text+0x8e8): undefined reference to `cmpxchg_emu_u8'
>    `.exit.text' referenced in section `__jump_table' of drivers/staging/vme_user/vme_fake.o: defined in discarded section `.exit.text' of drivers/staging/vme_user/vme_fake.o
>    `.exit.text' referenced in section `__jump_table' of drivers/staging/vme_user/vme_fake.o: defined in discarded section `.exit.text' of drivers/staging/vme_user/vme_fake.o
>    xtensa-linux-ld: block/blk-crypto-fallback.o: in function `blk_crypto_fallback_decrypt_endio':
> >> blk-crypto-fallback.c:(.text+0x10c): undefined reference to `cmpxchg_emu_u8'
>    xtensa-linux-ld: block/blk-crypto-fallback.o:blk-crypto-fallback.c:(.text+0x18c): more undefined references to `cmpxchg_emu_u8' follow
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
