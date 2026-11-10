Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307028;
	b=3RRTyuyIS+8WEwkn7G0YZyD08WoFf5ss0YSSDBw4+V77ieaodY+kOvL15MqumT800kx/
	 YIqxUwJqfsdbOcLLGH/XSRp7A6kG9ENMS3vxjPTdFjuuyVxCxs6W4GKXE6qMDbadudi6R
	 tRiH5UE/JHx5t0cz3X/7TQwdg8bouwHCQYVKYYvWcyHf3m5WwUxWc95XC/j58CRsOrK2A
	 EtbB09G05qsnK859C2G42DuKpJjsTqSrcUwnSt1O8g0isNt9HWuzcdW/P3nTM2PT39zhs
	 BizexrqZamf0uKUW2BUQasTcEP0libaX2xSZvoCzNBYh/EeeVvxbldw99qDaX0IIasw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307028;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aPt7aXHPfvHdE2UblKo8kSchH+XYw6EnXAvGnqpbEA4=;
	b=cAE5EfAZA3nMppBiV5nyF4qzoeuGF9928oATTd0UB1V+6lqMYX4NYpG4WNSR0eRG8JX8
	 c8C7/Kt5yyna8KPwqPUgz4C9Q9s3inV5yC7bD0R3oKwVt3OdJdF4n7NAJlKj+rUUrhHEg
	 ++dXF3MEqwYXETNJ90BUvjnAxVP5JNNbDDewtYEAw/2B4G+IxY4ZWb4+4Mxl50jmCVlW3
	 VvyMkJ8YKtai+NZuSkiYN7l9sJoBU1+5dbQ4ioDZrcjfziBQEe9kqYRasKDxi+5bCjH7x
	 TevmKnQTXPoeZuKhLm+il08UYguJdyDFtjrSeIAo7PCwSsKwebHDzCJaBckukzOcTqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="gGEMD/02";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47E8606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C47E8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gGEMD/02
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so19152495e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794307026; x=1794911826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aPt7aXHPfvHdE2UblKo8kSchH+XYw6EnXAvGnqpbEA4=;
        b=gGEMD/02KgLqbaZrSm/ICQNKt6tdpsc0lbc276bLUKHGgeD6+jjPbDCW3rzoPHK+mR
         cZUQz2nDCByUtMhZuaq/ASxSkbCY2Vzu6aSd2Hmi9CHZN7JJl0rtBaKV+RJqMzKG9LtG
         jrsCfETWUL1GdKuj/W/3C1IbyogIOpDpSSo3uVZ8djtN9q+1ae9dVicB14gyT0VAQSeE
         8+OzgHE2FIE1Xgt0S/CpKrvJYtrfP1A6bzB7cZ1A12YWj0t1EtjbxwrRElK7o+uXQgTo
         DjyvZp1Emc9HHQ8WcwD0tQalhKcObVZasTm95eMCei871BDLophdT/T5gN0tNlo5UDIR
         +/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307026; x=1794911826;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPt7aXHPfvHdE2UblKo8kSchH+XYw6EnXAvGnqpbEA4=;
        b=uCzZH6+UP0Ev2m66uDgZAEc0V9OZMvqeixeOeOSa39p/0GjHyqf2srm+6HemoQWzi5
         WhI9EQQ3kAf64WXSmNzyVQcnVUminAl/DyWdwhOUmU6nUzfO/31wGWsOsOoov7S/O5Vb
         DsnQHl+KNu1odsMUcFwywk3TP7PPs9cOeQOcyoxtqFnhSKD6K6h0pqBa2YoECfSmmyfx
         p45XNhvAqtEtvQ8B/wyGp+Vi+hnA6ZE3xTUIah+ama5J/Y1s6/3cDiBYKE4mz3YcA+fo
         BGz1pMgZnN459p+IpVC1wTtsfgEY8pBCfl/9mWCQNn3YV8MVEFXSRcmVtV5F9e9QRCmi
         r/YA==
X-Forwarded-Encrypted: i=1; AL+hErF4aLIMS69EWcyk5U+tNOqQpPEpP1Jf0RAevyqXGa75tq88uetBT9sQGCyGQ1uKTp0OmGpc/AXSrVMcu50=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jCxuuFppK2ZJmoMk8wyd/MiMx/QEtPc31/Jkeq9EfHblPPTay
	D4Rpi/EPaxah+TQ6/Xv4EPjFW+ILfH+c5E7dFHEBKhlvWM0pHIRb80q/0wmENKy1Vic=
X-Gm-Gg: AYBFou1ZR1Jk5JZvPAOAYMPAPVYp7fyAE2SfRpVlw6iwjziElJoX3e1bBGO+r59OICI
	Ln706CS686nxBBj2XI9r1qWK70gN5RKr1u15SCPDJxFKEh5SHbku5hp2KS84P1lhMxCG+XiUs57
	/GbQEznGzCw7T/2kr3gagpRGDjprsN3TTQDIG0mFZ4bgQ8kscTC/sg4fTcmpRmh13YNTgmJEBNG
	uZId8L97HpZCt+ktyosOG9wROfkxAdffKGQgZAXufZYU3dxp4sMMss71TshRs1Pg272eUMavycN
	/hyibsrWX1n6foRkqWkCylSYTcS+kMLKfWlmeMNweiVDFsQKLwn07WP6yJ/gk4OKOJQyPXIOg6Y
	jqU3JWspY6F2JJZgHiA1zX9bZkngfFkQ+Ij8ocX1MFfakiv60c+LhbfcgGraFR9pwVa3A12VArk
	vViGx3eqTvAa+mbNZQaeJhzNPTpIjFc7NNbJIuPtYgtko7PMLW0FnEKVpZZ0qSHcNw7e2v/JmwN
	YXz+oeQ4gElxrXFZCBip/0Bhy/rB466kznsyOXDp/hpxlx6ktXILOTnyU2zVIZQSdDbjJFsE35J
	VZLBUOXUICgrlKorwdhJaUXYDMH5YEexvn8A/kJpcusC0w==
X-Received: by 2002:a05:600c:8b21:b0:4a1:dfaf:f465 with SMTP id 5b1f17b1804b1-4ba023064e9mr33872945e9.4.1794307025923;
        Tue, 10 Nov 2026 02:37:05 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585923bsm4477565f8f.11.2026.11.10.02.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:37:05 -0800 (PST)
Date: Tue, 10 Nov 2026 11:37:03 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	Yafang Shao <laoar.shao@gmail.com>, Shuah Khan <shuah@kernel.org>,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] selftests/livepatch: build test modules against
 the selected kernel
Message-ID: <avLzz7VlRWoKev8R@pathway.suse.cz>
References: <20261103222706.1642224-1-sashal@kernel.org>
 <20261103222706.1642224-2-sashal@kernel.org>
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
In-Reply-To: <20261103222706.1642224-2-sashal@kernel.org>

Hi,

the commit message seems to be generated using LLM.
For me, it is a hard to read maze. But I'll try to go through it.

Let's start with Subject. What is "the selected kernel"?
How can it be selected?

I would personally say that this this patch "allows to pre-built
the test modules for the livepatch selftest into a separate directory".

My understanding is that there are several ways how to build
the test modules, some work, and some does not. I would help
me if the commit message better explains what works and what
does not work.


On Tue 2026-11-03 17:27:05, Sasha Levin wrote:
> The livepatch test modules are built against /lib/modules/$(uname -r)/build
> unless KDIR is set, and they are built unconditionally. This has three
> problems:

My understanding is that the Makefiles currently expects that
"the kernel devel files, for the running kernel, are installed
on the system " so that they could find them by
/lib/modules/$(uname -r)/build.

The KDIR allows to find the devel files in another directory?
But how do we set it?

> - When the selftests are built for a kernel in an output directory
>   (make O=...), the modules are still built against the running host
>   kernel, or fail when the host has no build directory.

What exactly is in the output directory?
What is build directory?
How they differ?

I see in Documentation/dev-tools/kselftest.rst:

  <paste>
  To build, save output files in a separate directory with O= ::

    $ make O=/tmp/kselftest TARGETS="size timers" kselftest
  </paste>

It would help if the commit message follows this naming scheme,
aka "save output files in a separate directory with O="
and mentions an usable example, e.g.

  $ make O=/tmp/kselftest TARGETS="livepatch" kselftest

explain where it is supposed to search for the build files.

My understanding is that you want to pre-built the test modules
when building a kernel. I mean to use a custom kernel source
tree instead of using devel files for the currently running kernel.


> - The top-level selftests Makefile passes O to every suite, and the
>   test_modules Makefile hands it on to the kernel build. Even an empty
>   O= on the command line overrides the KBUILD_OUTPUT set by the
>   Makefile of a kernel build directory, so the build fails against
>   output directories and distribution headers such as Debian's:
>   "make -C tools/testing/selftests TARGETS=livepatch" builds no
>   modules at all.

This is another way how to build the modules:

    make -C tools/testing/selftests TARGETS=livepatch

Again, it would be great to make it clear that it is for
per-building the test modules from a custom kernel sources.

But it mentions also KBUILD_OUTPUT which seems to be another
way, from Documentation/dev-tools/kselftest.rst:

  <paste>
  To build, save output files in a separate directory with KBUILD_OUTPUT ::

    export KBUILD_OUTPUT=/tmp/kselftest; make TARGETS="size timers" kselftest
  </paste>

It seems that "KBUILD_OUTPUT" has the same effect as "O".
Why is it mentioned in a paragraph with
"make -C tools/testing/selftests TARGETS=livepatch" example?

> - A kernel configured without CONFIG_LIVEPATCH cannot build the
>   modules, although the installed scripts would correctly skip.

This is a puzzle. If "the installed scripts would correctly skip"
then what fails?


> Select KDIR from O or KBUILD_OUTPUT when it is a prepared kernel build
> directory containing Module.symvers, then from the source tree when the
> kernel was built in place, and otherwise from the running kernel. An
> explicit KDIR still takes precedence. Pass KDIR to test_modules as an
> absolute path, also when it was given on the command line, and stop
> forwarding O and KBUILD_OUTPUT to the kernel build, including when the
> selftests are built through the kernel's kselftest targets, since KDIR
> already names the output directory.
> 
> Read CONFIG_LIVEPATCH from the selected .config and skip the modules
> only when the configuration is readable and the option is not enabled. A
> KDIR without a readable configuration still attempts the build, so that
> a directory that is not a prepared kernel tree fails the build instead
> of silently producing an installation without modules. A KDIR that does
> not exist keeps being skipped, as before.
> 
> Always clean test_modules, through the kernel source tree that contains
> them. Cleaning external modules needs neither a configuration nor
> Module.symvers, and unlike the build targets, the clean target of the
> selftests Makefile does not pass the absolute O on, so the kernel the
> modules were built against cannot always be found at that point.

The above paragraphs might be "fine" as a "More details" section.

> Have the scripts report a skip after the root check when the running
> kernel does not provide livepatch.

This patch should fix the build. This change does not fit here,
see below.

> --- a/tools/testing/selftests/livepatch/Makefile
> +++ b/tools/testing/selftests/livepatch/Makefile
> @@ -1,7 +1,26 @@
>  # SPDX-License-Identifier: GPL-2.0
>  

The code below is a maze. It would be nice to add a comment here
explaining how we try to find the kernel sources, ideally
even include examples.

   1. When using separate output directory, for example:
      make O=/tmp/kselftest TARGETS="livepatch" kselftest
      export KBUILD_OUTPUT=/tmp/kselftest; make TARGETS="livepatch" kselftest

   2. When building directly from the tools/testing/selftests/livepatch
      source directory.

   3. When using installed devel files for the running kernel.

But I might be wrong.

> +ifndef KDIR
> +LIVEPATCH_OBJTREE := $(firstword $(O) $(KBUILD_OUTPUT))

The above checks both $(O) $(KBUILD_OUTPUT)

> +ifneq ($(and $(LIVEPATCH_OBJTREE),$(wildcard $(LIVEPATCH_OBJTREE)/Module.symvers)),)
> +KDIR := $(LIVEPATCH_OBJTREE)

I am a bit confused. What is the KDIR when using, for example:

      make O=/tmp/kselftest TARGETS="livepatch" kselftest

Is it in "/tmp" ?

> +else ifneq ($(wildcard ../../../../Module.symvers),)
> +KDIR := ../../../..

This seems to support building by calling:

   $ cd tools/tests/selftest/livepatch
   $ make

> +else
> +KDIR := /lib/modules/$(shell uname -r)/build

This supports the build with the devel files installed for the
currently running kernel.

> +endif
> +endif
> +override KDIR := $(abspath $(KDIR))
> +export KDIR
> +MAKEOVERRIDES := $(filter-out KDIR=%,$(MAKEOVERRIDES))
> +
> +LIVEPATCH_CONFIG := $(shell if [ -r "$(KDIR)/.config" ]; then \
> +	grep -qx 'CONFIG_LIVEPATCH=y' "$(KDIR)/.config" && echo y || echo n; fi)

Why LIVEPATCH_CONFIG and not CONFIG_LIVEPATCH?
IMHO, the reverse ordering adds more harm than good.

>  TEST_GEN_FILES := test_klp-call_getpid
> +ifneq ($(LIVEPATCH_CONFIG),n)
>  TEST_GEN_MODS_DIR := test_modules
> +endif
>  TEST_PROGS_EXTENDED := functions.sh
>  TEST_PROGS := \
>  	test-livepatch.sh \
> @@ -16,3 +35,12 @@ TEST_PROGS := \
>  TEST_FILES := settings
>  
>  include ../lib.mk
> +
> +ifeq ($(LIVEPATCH_CONFIG),n)
> +clean: clean_livepatch_mods
> +
> +clean_livepatch_mods:
> +	$(Q)$(MAKE) -C test_modules clean
> +
> +.PHONY: clean_livepatch_mods

My understanding is that this will remove the test modules even
LIVEPATCH_CONFIG became disabled in the meantime. I guess
that it is related to the 3rd problem (puzzle) in the commit
message.

It makes sense. I am surprised that we need an extra target
for this.

Anyway, it would make sense to fix this in a separate patch.

> +endif
> diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
> index 429fce1f31431..8b26b70f92d8c 100644
> --- a/tools/testing/selftests/livepatch/functions.sh
> +++ b/tools/testing/selftests/livepatch/functions.sh
> @@ -150,6 +150,7 @@ function cleanup() {
>  #		 the ftrace_enabled sysctl.
>  function setup_config() {
>  	is_root
> +	[[ -d "$SYSFS_KLP_DIR" ]] || skip "livepatch is not available"

This seems to be used only when _running_ the test. But this patch
fixes _building_. It should be in a separate patch, maybe
together with the check for CONFIG_LIVEPATCH.

>  	has_kdir
>  	push_config
>  	set_dynamic_debug
> diff --git a/tools/testing/selftests/livepatch/test_modules/Makefile b/tools/testing/selftests/livepatch/test_modules/Makefile
> index a13d398585dcb..62cb724c6b333 100644
> --- a/tools/testing/selftests/livepatch/test_modules/Makefile
> +++ b/tools/testing/selftests/livepatch/test_modules/Makefile
> @@ -16,14 +16,15 @@ obj-m += test_klp_atomic_replace.o \
>  	test_klp_state3.o \
>  	test_klp_syscall.o
>  
> +modules clean: MAKEOVERRIDES := $(filter-out O=% KBUILD_OUTPUT=%,$(MAKEOVERRIDES))
> +
>  # Ensure that KDIR exists, otherwise skip the compilation
>  modules:
>  ifneq ("$(wildcard $(KDIR))", "")
> -	$(Q)$(MAKE) -C $(KDIR) modules KBUILD_EXTMOD=$(TESTMODS_DIR)
> +	$(Q)env -u KBUILD_OUTPUT $(MAKE) -C $(KDIR) modules KBUILD_EXTMOD=$(TESTMODS_DIR)

Why is KBUILD_OUTPUT unset here?
It would deserve a comment.

>  endif
>  
> -# Ensure that KDIR exists, otherwise skip the clean target
> +# Any kernel tree can clean the test modules, so use the one containing them

Here is a comment. But what does "Any kernel tree" means?
Could we be more specific, please?

>  clean:
> -ifneq ("$(wildcard $(KDIR))", "")
> -	$(Q)$(MAKE) -C $(KDIR) clean KBUILD_EXTMOD=$(TESTMODS_DIR)
> -endif
> +	$(Q)env -u KBUILD_OUTPUT $(MAKE) -C $(TESTMODS_DIR)/../../../../.. \
> +		clean KBUILD_EXTMOD=$(TESTMODS_DIR)

Note that my workflow still works with this patch. I am testing the
running kernel, have installed the devel files, and doing:

  cd $KDIR/tools/tests/selftests/livepatch
  make run_tests

But it would be great to better document which other scenarios
are newly supported by this patch.

Best Regards,
Petr


Best Regards,
Petr
>  LocalWords:  cd
