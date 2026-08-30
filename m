Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB761FF5E3
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788071048; cv=none; b=ce+7u+Df/JGXqeglpVxc6XuH9Pi2Qf7nqVxRDpdEHsZ/0ef+KIph2xB6sfqDcwPgxa2zi62RKCvF+c55Y3sdQLMJDZOFRRPavbHjldRuUe+rsfaIJiQVFX/3Wji62Nisi62lkIZOdwfKaQ60lJ0w8zAGl7Nrs0+A1OaHEVvpbHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788071048; c=relaxed/simple;
	bh=gn8YZeve7W5ll0fLc6dBViOn7BizQoseI5UBCT3D1kE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eo+YWuSf3VAAkqA3TNwKKVwhXlev+751fkhUVr68RttYBHXzuPeo72++6Ri8+I8ARUutipcwWdT2FRY6mdUiWRSqYayfxUfMC9GeoVzVraPbHgrLR6JMfKYwF7Pcn7t/Wbh658p6Eqrj8HmvBmsLQs0Ioco1Bi0OFfPSElDKm0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Proe0YHt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Proe0YHt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C298F1F000E9;
	Sun, 30 Aug 2026 06:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788071047;
	bh=PAY0PBv7AVcSp/aAhiyhn8vjEDOF2xQgSMi6ncVy6iM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Proe0YHtAbwYtyuy9WMCzEibO0jxt9FdxqD4iGEQ4/29tgFZTYOC64+8XwF4ycwqj
	 Hz7pn4Qa0LxHhf+B92AW/gGl+4VGIIoOUoSnVIJLSa3QG6RRZzrw7BimMAkmUWTVXK
	 /haPzT8Kaqk+tBOFhXs9s+oJi5DQi+hF34eXmyxaYPwcd8ygq/wUSZ4WIBXIZHGWF2
	 12O1BKmis/Fo+QOsp9JjX75HYD8ZXQk3oP3Mws8bjU+co5Zd8xBNvmI+Eyai9HeEaP
	 W6/T0hJfy8MDg8bt60eFFCDsS+8eyfAv+yF81YqYYd5qGjDaR4t/PIFPbeLSweDkMA
	 3JXkM3jU0I+RA==
From: Thomas Gleixner <tglx@kernel.org>
To: Farhad Alemi <farhad.alemi@berkeley.edu>, Mark Brown <broonie@kernel.org>
Cc: falemi@asu.edu, Radu Rendec <radu@rendec.net>, linux-kernel@vger.kernel.org
Subject: Re: [BUG] KASAN: slab-use-after-free Read in
 irq_migrate_all_off_this_cpu
In-Reply-To: <CA+0ovCh1hKPQ3DSXBdaf3MHGZKv3-mbSNiWrAETr62mDd1weKg@mail.gmail.com>
References: <CA+0ovCh1hKPQ3DSXBdaf3MHGZKv3-mbSNiWrAETr62mDd1weKg@mail.gmail.com>
Date: Sun, 30 Aug 2026 08:24:04 +0200
Message-ID: <874igcdt2z.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Aug 27 2026 at 22:41, Farhad Alemi wrote:
> As part of the kernel research at ASU's SEFCOM
> lab, we hit the crash below. Crash reports can be found here:
>
>   https://github.com/farhad-alemi/public_bug_reports/tree/main/164-kasan-slab-use-after-free-read-in-irq-migrate-all-off-this-cpu/
>
>   BUG: KASAN: slab-use-after-free in irq_can_move_pcntxt
> kernel/irq/internals.h:305 [inline]
>   BUG: KASAN: slab-use-after-free in migrate_one_irq
> kernel/irq/cpuhotplug.c:57 [inline]
>   BUG: KASAN: slab-use-after-free in
> irq_migrate_all_off_this_cpu+0xdf/0xc80 kernel/irq/cpuhotplug.c:181
>   Call Trace:
>    irq_can_move_pcntxt kernel/irq/internals.h:305 [inline]
>    migrate_one_irq kernel/irq/cpuhotplug.c:57 [inline]
>    irq_migrate_all_off_this_cpu+0xdf/0xc80 kernel/irq/cpuhotplug.c:181
>    fixup_irqs+0x18/0x1e0 arch/x86/kernel/irq.c:527
>    cpu_disable_common+0xb27/0xd90 arch/x86/kernel/smpboot.c:1354
>    native_cpu_disable+0x2f/0x40 arch/x86/kernel/smpboot.c:1366
>    take_cpu_down+0xca/0x330 kernel/cpu.c:1282
>    multi_cpu_stop+0x227/0x420 kernel/stop_machine.c:238
>    cpu_stopper_thread+0x259/0x3e0 kernel/stop_machine.c:512
>
>   BUG: KASAN: slab-out-of-bounds in
> irq_migrate_all_off_this_cpu+0xdf/0xc80 kernel/irq/cpuhotplug.c:181

Please always provide the full KASAN splat along with all other required
information: Kernel version, commit id, config file, compiler version,
architecture. There is nothing wrong with additional artifacts and
information in a github place, e.g. the full dmesg and the reproducer.

Look at the syzkaller reports how they do this, .e.g.:

  https://lore.kernel.org/lkml/6a9003f9.27659fcc.2ceef7.0012.GAE@google.com

Also the failure is on kernel 7.1.0-rc5. Please always verify against
latest upstream.

Though based on the meager information I think I roughly can see how
that happens not only in the reported version. It's still the same
problem upstream.

Allocation happens at:

regmap_add_irq_chip_fwnode+0x375/0x2dd0 drivers/base/regmap/regmap-irq.c:709

         d = kzalloc_obj(*d);

That's initialized and then handed in as host_data when the interrupt
domain is created.

When the domain is successfully created and the subsequent

     request_threaded_irq()

fails, then it ends up here:

regmap_add_irq_chip_fwnode+0xd76/0x2dd0 drivers/base/regmap/regmap-irq.c:963

Interestingly enough the code has a comment in that failure path:

err_domain:
        /* Should really dispose of the domain but... */

And it should dispose the domain properly which also would remove and
free the interrupt descriptors.

I bet that regmap_add_irq_chip_fwnode() was invoked with an irq_base !=
0 argument because that causes the interrupts to be associated. That
means they are mapped and the mapping code assigns 'd->chip' as the
interrupt chip in the descriptor. chip is handed in by the caller of
regmap_add_irq_chip_fwnode() and the caller frees it on failure.

Because the interrupt descriptors are leaked this causes any function
which accesses desc->chip to access freed memory.

Mark, do you remember why you ended up with adding this comment instead
of actualy mopping up the domain?

Thanks,

        tglx

