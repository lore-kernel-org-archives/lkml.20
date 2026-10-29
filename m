Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793237347;
	b=ayKHV7QjT7MHhpFz9hph2z53RJO8rgr30SpxpTB16Z3dl1Rx7k/84J3qA52ajSET5sG1
	 F7snUYHD69UrDkFwPGQpRoDUFps5lxQ0PblZBp8sF5ylKHpnxI5gUv9Urs10u0OXU8PFw
	 AiRnEWC6ddMEzDb5WCFsN+vHsTN6k5bOUIuzX5yNjUnaO+8kZHqjSTc1jJfanWuYxE5mb
	 yW/ETYK1LtSV5U0xVFM2v6wVC/kPp6vG62UhIBPyVNtCSc+GrY28TBYasrYRScAvl3k4E
	 Gyq64YJdQnvkJ7U5Hr0kftct6CIW/ggorwr+3zYQbDYvDK1DyF3xccHRxSEDh8QvSGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793237347;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8qwyeiOdfw6vGb0L8uIG6+BGz4UgyPwLOvdoFvPupG0=;
	b=on/OFM31+t4TzdGJWzzg0Hu4Xvmedv+LFTJOCYXZN2go9yWltJcgvgclOeVisqwNPcBX
	 mQKWR4l9oZjxkvKULR+bSg12OIcjqAN98z42MkvxqahK+s4hKNiNIobc3pZ2svRJK0lnm
	 g+0CweMJVRmTnVYpEGEW6A1MOfFyrnXTtqpW5JkYbuH9f6k0JCVillsMrjouo5LPUJ9T1
	 Usn56rzs1vIBu0TCCfbx3M5Mqp12KFjrdMugxHY5yPFN09jDu8DgzCT2mPdsU/zGBxO+r
	 1lP0pFTFXvLYMIvMmTnQ4wtqHaGjRKxjev+oNYAO1/KN2IBqYKTUZ9xA6nj06i7dNNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=qgv4ByLt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A5C606A31A;
	Thu, 29 Oct 2026 01:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=qgv4ByLt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65BF61F01825;
	Thu, 29 Oct 2026 01:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1793237346;
	bh=8qwyeiOdfw6vGb0L8uIG6+BGz4UgyPwLOvdoFvPupG0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=qgv4ByLtJAZquTR5cCSx5SeRbA+nAU8G5F0i3qyZkYx0ByYKUvvP97WRdju74FR7J
	 y0Q2vKypJjTmZA0gN92NrcG+ab1nrvBk7oD56b6cigPnqfoZsgf0gbNaCCPrfRSVIC
	 8D3ptcD2U9O8dmbdC/z0DsqvVqQDD40Qr5+Rbcb0=
Date: Wed, 28 Oct 2026 18:29:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Linux Memory
 Management List <linux-mm@kvack.org>, Bradley Morgan
 <brads@mainlining.org>, Jonas Bonn <jonas@southpole.se>, Stefan
 Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne
 <shorne@gmail.com>, Cc: Arnd Bergmann <arnd@arndb.de>
Subject: Re: ERROR: modpost: lib/kunit/kunit-example-test.ko: symbol
 '__mulsi3' undefined!
Message-Id: <20261028182905.016f44ee406076e80c6e2f5b@linux-foundation.org>
In-Reply-To: <202610290106.o8Fs3NvO-lkp@intel.com>
References: <202610290106.o8Fs3NvO-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Oct 2026 01:59:13 +0100 kernel test robot <lkp@intel.com> wrote:

> Hi Karl,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   c339f4010dea8b0d754f84ace70cd1b089878ef8
> commit: 7c3f4d699f34535285d0ceb184927d71543d0064 resource, kunit: stop selecting GET_FREE_REGION
> date:   2 weeks ago
> config: openrisc-randconfig-r2306-20261028 (https://download.01.org/0day-ci/archive/20261029/202610290106.o8Fs3NvO-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 16.2.0
> sparse: v0.6.5-rc1-1-gc4640450
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610290106.o8Fs3NvO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 7c3f4d699f34 ("resource, kunit: stop selecting GET_FREE_REGION")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610290106.o8Fs3NvO-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> ERROR: modpost: kernel/rcu/rcutorture.ko: symbol '__mulsi3' undefined!
> ERROR: modpost: fs/fuse/virtiofs.ko: symbol '__mulsi3' undefined!
> ERROR: modpost: fs/pstore/ramoops.ko: symbol '__mulsi3' undefined!
> ERROR: modpost: fs/ecryptfs/ecryptfs.ko: symbol '__mulsi3' undefined!
> ERROR: modpost: fs/overlayfs/overlay.ko: symbol '__mulsi3' undefined!
> ERROR: modpost: crypto/asymmetric_keys/pkcs8_key_parser.ko: symbol '__mulsi3' undefined!
> ERROR: modpost: crypto/ccm.ko: symbol '__mulsi3' undefined!
> ERROR: modpost: lib/kunit/kunit.ko: symbol '__mulsi3' undefined!
> ERROR: modpost: lib/kunit/kunit-test.ko: symbol '__mulsi3' undefined!
> >> ERROR: modpost: lib/kunit/kunit-example-test.ko: symbol '__mulsi3' undefined!
> WARNING: modpost: suppressed 1014 unresolved symbol warnings because there were too many)

Thanks.

#syz test

From: Andrew Morton <akpm@linux-foundation.org>
Subject: openrisc: export __mulsi3 for modules
Date: Wed Oct 28 06:24:22 PM PDT 2026

OpenRISC configurations without hardware multiplication fail to build
modules which contain compiler-generated calls to __mulsi3.  The failure
is widespread, affecting filesystems, drivers and KUnit tests at modpost.

When CONFIG_OPENRISC_HAVE_INST_MUL is disabled, the architecture Makefile
passes -msoft-mul to GCC.  The multiplication helper is supplied by the
libgcc archive linked into vmlinux, but or32_ksyms.c does not export it. 
Built-in callers can therefore link while module callers cannot resolve
the symbol.

Export __mulsi3 alongside the other compiler-generated helpers.

The omission predates 7c3f4d699f34 ("resource, kunit: stop selecting
GET_FREE_REGION"), which the robot identified when reporting an additional
failing module.  It was already present in the initial OpenRISC export
list.

Fixes: 616257669e1a ("OpenRISC: Miscellaneous")
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610290106.o8Fs3NvO-lkp@intel.com/
Assisted-by: LLM
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>
Cc: <stable@vger.kernel.org>
---

 arch/openrisc/kernel/or32_ksyms.c |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/openrisc/kernel/or32_ksyms.c~openrisc-export-mulsi3
+++ a/arch/openrisc/kernel/or32_ksyms.c
@@ -35,6 +35,7 @@ DECLARE_EXPORT(__divsi3);
 DECLARE_EXPORT(__umodsi3);
 DECLARE_EXPORT(__modsi3);
 DECLARE_EXPORT(__muldi3);
+DECLARE_EXPORT(__mulsi3);
 DECLARE_EXPORT(__ashrdi3);
 DECLARE_EXPORT(__ashldi3);
 DECLARE_EXPORT(__lshrdi3);
_

