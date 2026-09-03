Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A4E5111A2;
	Thu,  3 Sep 2026 20:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788465859; cv=none; b=f8vryRf9nVRxnOhAidixsKRVmRvbts1A/EEfnCyVYklygDeRP0znyQmKt2m9POgYmoRESt1UeBfBep8AYAyDwus+iInjd6aPpx80FTg8jSefpoos7fDVkepSeRk24Zcwp+9co6ELmfeY+6eOpdW67p5e7FkXgPkGr529cE6Jwe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788465859; c=relaxed/simple;
	bh=W6D6nSNz5J+OydIEGM9dAju/NaAUXCdU/pmVsdSIvL8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bfj1wq6lYWLIQkLu3sAjzx5bBOYjz06owffIeJVn30rIl79O2bhLamEx7lvsd2bwA2SPN5Dm80EIZ4WxzBsbnEqQf8bXBrN878ORkeHY5eP0S52hZwZGzP7lXr3mKhJtFKJu0pb1pgvgUj1Vwg+wthBDj/NJ3doQGu7SRrgSC4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TS7v8mJo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TS7v8mJo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F0D1F00A3D;
	Thu,  3 Sep 2026 20:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788465839;
	bh=vmYieKVuqWUUBs/P/3HQoMemVH0LqupG2FD0izL7cBU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=TS7v8mJogrtLJ6Lg38z008KCK+68tRZAFnMA8fGex1u9zjAopXp+JegdvD8uTTm87
	 Y9zWNueEEs833gLjE17WtTTarAtkuTYblnUazxx9JeXiVJHfeX2eG/OYgDWYNS6ySV
	 sTMer6d5i6Ibq1E5S8GxS/AdYlcNqXIr6SLMyYJ7vbnkA9k4Wih1yIsQ2i4XT03iie
	 0ueXlC6WPzo58iVYvXRS54DZpFNdhcbIGgAeavFqusnA4PuyojhtH09Bw8PyVasUUa
	 R4hZ7yAgJ1dKixbYdfj2IdwvVwGMqi/07gyVfV1pqxbBk+bkUFTFvrr0cP0xCVtLff
	 50KEdPnSR0bjw==
From: Thomas Gleixner <tglx@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Jinjie Ruan
 <ruanjinjie@huawei.com>
Subject: Re: include/linux/irq-entry-common.h:218: undefined reference to
 `syscall_enter_audit'
In-Reply-To: <202609031938.ZvZZaRQy-lkp@intel.com>
References: <202609031938.ZvZZaRQy-lkp@intel.com>
Date: Thu, 03 Sep 2026 22:03:56 +0200
Message-ID: <87wlt29k5v.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Sep 03 2026 at 19:35, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   940de590b839f71d6dc846160534bf202401b8b7
> commit: 6f25517010ddd3f8080d7e06b9b1cb1b64b73772 entry: Rework syscall_audit_enter()
> date:   6 weeks ago
> config: riscv-randconfig-r052-20260903 (https://download.01.org/0day-ci/archive/20260903/202609031938.ZvZZaRQy-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031938.ZvZZaRQy-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 6f25517010dd ("entry: Rework syscall_audit_enter()")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609031938.ZvZZaRQy-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    riscv64-linux-ld: arch/riscv/kernel/traps.o: in function `__exit_to_user_mode_validate':
>>> include/linux/irq-entry-common.h:218: undefined reference to `syscall_enter_audit'

Seriously?

>
> vim +218 include/linux/irq-entry-common.h
>
> a70e9f647f501e3 Jinjie Ruan     2025-06-24  212  
> 70fe25a3bc53a89 Thomas Gleixner 2025-10-27  213  static __always_inline void __exit_to_user_mode_validate(void)
> 70fe25a3bc53a89 Thomas Gleixner 2025-10-27  214  {
> a70e9f647f501e3 Jinjie Ruan     2025-06-24  215  	/* Ensure that kernel state is sane for a return to userspace */
> a70e9f647f501e3 Jinjie Ruan     2025-06-24  216  	kmap_assert_nomap();
> a70e9f647f501e3 Jinjie Ruan     2025-06-24  217  	lockdep_assert_irqs_disabled();
> a70e9f647f501e3 Jinjie Ruan     2025-06-24 @218  	lockdep_sys_exit();

What the heck has line 218 to do with that failure?

This is getting stupid. It seems there is yet another compiler aside of
s390 gcc which fails to do dead code elimination but this time it's
worse it also points to the wrong place ....

Thanks,

        tglx
