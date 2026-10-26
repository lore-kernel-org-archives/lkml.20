Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051755;
	b=YGdDdgjoG9POkeXnm1BUO3Jswx/DAy8VrUnNq52djr/lPf6+EoNCMhnMlLiI8FBumHcB
	 bLWxQ4fTCg6sbOjy3ac2RrnyFa/AzYJy0FvXACRY1GdpduI2BkSfAAHK8Vgs24zAYzqZ1
	 wWIVZfp+FY9p0Rq/Ym5V2AAlgb+AdssavAsb8KKtD0+xZqA0b/FVsTkb6IqurjiyBrHn2
	 1uxFxRXGS7fhnrd2lZm6cc4fuMrEheNwCRGiawzSbdj6zsma/12IpjBj+jhe/wVM41WOt
	 oFRF+Ou8GdnRmVVR3h3MVq9+Nzgo1zQDhF0ixEGvKmeMToFqsI3lRiVRu3sCAqudajw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051755;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EhGcnjUkFtHrBzTYh2OSeEzvO4o7DxmKsvaxyBcAlmM=;
	b=uISuY9mgYZ8/X4kTl+lTiZIkIPY5lRltZBDDYN9iS0In4u3aNj9Sr9auLazSoGeQbeSs
	 rE6Gg+5XiWMaocYJ5vhRLZKqJuW9QC2Df+UmB5LhgCJOvgQNHng3rFE0Pde3UUSBFxbOE
	 BR9VbMBvZJLcqB/2yPw0WpnwQHOeWvyKh9ln51c1ExgAKszQXsE21yY3+mpZ8eTkrr/mx
	 pOBXuOxfJk8AYsoQQp5TqKAT8OqSav2yPv9R+1k8HXS8sHhWTdr3mbg/JUO3zYsF6pxVK
	 Fs+zZRdBLCCQboz4ziLdPkdDCRqXgJQDBqv6Yy1h4ToMYwzWyHBbvb7g3Rp9CZ2I6jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l8AIqsWH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAE8606A31B;
	Mon, 26 Oct 2026 21:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l8AIqsWH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C971F01825;
	Mon, 26 Oct 2026 21:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793051755;
	bh=EhGcnjUkFtHrBzTYh2OSeEzvO4o7DxmKsvaxyBcAlmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l8AIqsWHD6Eek/lVL5PX3vbyVuzj0D/I7YVo9HTfIM/gie0y8YEuOq3n8oKCNjx8q
	 Zat0kz50JUM74onR0VO8BtctuCnn1CP+vorJRPVHouZPp+heTK6g6IZZLSKm+OzHn/
	 E1HdJZxqcD+gHtdGaFaAwih8F/srTIRYO3TOS/nal8E+pUJMEIfBAqnjice3qJdmlN
	 bjYSk3Yb/s3LOhTPqzM5cDrIyzOJfKG4Aqs6BxBXpRM5ChgtDIMrVpwFJ+PnoXEXbY
	 IHZAMEfqnvq780qQ2vhKZJjIBNhZpb3DvkfHMVcXdCvafFi6CJnKNWEpCfmWfVfAUU
	 SgKcdJGQ0zs1Q==
Date: Mon, 26 Oct 2026 14:55:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Jason A. Donenfeld" <zx2c4@kernel.org>
Subject: Re: error[E0080]: evaluation panicked: assertion failed:
 size_of::<isize>() == size_of::<isize_atomic_repr>()
Message-ID: <20261026215551.GD1330439@ax162>
References: <202610261307.vnC1uCAL-lkp@intel.com>
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
In-Reply-To: <202610261307.vnC1uCAL-lkp@intel.com>

On Mon, Oct 26, 2026 at 01:51:14PM +0100, kernel test robot wrote:
> Hi Nathan,
> 
> FYI, the error/warning still remains.

I think the result of this bisection is wrong. When building at the
parent change (703749b069d5) with this toolchain, there is the error
that this change (eb13a1ff271b) resolves:

  ld.lld: error: undefined symbol: memset
  >>> referenced by getrandom.c:87 (lib/vdso/getrandom.c:87)
  >>>               arch/loongarch/vdso/vgetrandom.o:(__vdso_getrandom)
  make[4]: *** [arch/loongarch/vdso/Makefile:83: arch/loongarch/vdso/vdso.so.dbg] Error 1

If I use LLVM 23.1.4 + rust 1.99.1 to build at the parent change, I can
get the same error reported, so I don't think my change is responsible
for it.

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   6b4b543fa18757297ac756a6fe6e64f506b7844a
> commit: eb13a1ff271b0d180687eebb30611b0b276d5193 random: vDSO: avoid call to memset() when zeroing reserved parameter
> date:   3 weeks ago
> config: loongarch-randconfig-r2103-20261026 (https://download.01.org/0day-ci/archive/20261026/202610261307.vnC1uCAL-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610261307.vnC1uCAL-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: eb13a1ff271b ("random: vDSO: avoid call to memset() when zeroing reserved parameter")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610261307.vnC1uCAL-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> error[E0080]: evaluation panicked: assertion failed: size_of::<isize>() == size_of::<isize_atomic_repr>()
>    --> rust/kernel/build_assert.rs:112:23
>    |
>    112 |         const _: () = ::core::assert!($condition $(,$arg)?);
>    |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `sync::atomic::predefine::_` failed here
>    |
>    ::: rust/kernel/sync/atomic/predefine.rs:98:1
>    |
>    98 | static_assert!(size_of::<isize>() == size_of::<isize_atomic_repr>());
>    | -------------------------------------------------------------------- in this macro invocation
>    |
>    = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)
> --
> >> error[E0080]: evaluation panicked: assertion failed: align_of::<isize>() == align_of::<isize_atomic_repr>()
>    --> rust/kernel/build_assert.rs:112:23
>    |
>    112 |         const _: () = ::core::assert!($condition $(,$arg)?);
>    |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `sync::atomic::predefine::_` failed here
>    |
>    ::: rust/kernel/sync/atomic/predefine.rs:99:1
>    |
>    99 | static_assert!(align_of::<isize>() == align_of::<isize_atomic_repr>());
>    | ---------------------------------------------------------------------- in this macro invocation
>    |
>    = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)
> --
> >> error[E0080]: evaluation panicked: assertion failed: size_of::<usize>() == size_of::<isize_atomic_repr>()
>    --> rust/kernel/build_assert.rs:112:23
>    |
>    112 |         const _: () = ::core::assert!($condition $(,$arg)?);
>    |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `sync::atomic::predefine::_` failed here
>    |
>    ::: rust/kernel/sync/atomic/predefine.rs:100:1
>    |
>    100 | static_assert!(size_of::<usize>() == size_of::<isize_atomic_repr>());
>    | -------------------------------------------------------------------- in this macro invocation
>    |
>    = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)
> --
> >> error[E0080]: evaluation panicked: assertion failed: align_of::<usize>() == align_of::<isize_atomic_repr>()
>    --> rust/kernel/build_assert.rs:112:23
>    |
>    112 |         const _: () = ::core::assert!($condition $(,$arg)?);
>    |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation of `sync::atomic::predefine::_` failed here
>    |
>    ::: rust/kernel/sync/atomic/predefine.rs:101:1
>    |
>    101 | static_assert!(align_of::<usize>() == align_of::<isize_atomic_repr>());
>    | ---------------------------------------------------------------------- in this macro invocation
>    |
>    = note: this error originates in the macro `::core::assert` which comes from the expansion of the macro `static_assert` (in Nightly builds, run with -Z macro-backtrace for more info)
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
Cheers,
Nathan
