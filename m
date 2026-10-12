Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833AF4C224A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828382; cv=none; b=tFNzEpJPBwlmvpMZqvhSILMmxB1orhmY6BUwYEmk+G1Bj+Rj+rQIUg9AvNd41ICiauD4nKmVOWBnBDUhsDAYQNsK83ZecXxGOKfx1jeZbLYTHkHrVnLqzPYhAjRCK8GMIluBZYlQmhww0K4tjrlf9z+WEsagWPhqZ4AAD7DhabY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828382; c=relaxed/simple;
	bh=4OG04QfGZFfWbQdHF8rI5PN3E9tEtZ/cMt2W/+pf/X4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qkHmyURaE4lIBZgFnvMKKRYUpuWyRXYlUHcsUgSLnrFuhi9k+x14YeJQA27fX4AmE63eW203Q6l92j7tYsuOaAZGrKcLjZvCmlSY+FUKNVw0x5+a4WbpT/b/xKWnjjg5E5fL9vR25JabDN+EDeR5RNtX8C9GOUZok9lz6Ph5ReI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=EvVq0Fsl; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="EvVq0Fsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791828372; bh=3o+jyBzU8mUCpYQMWos+tP8nlAQxD+SpC0ny4cPJcho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EvVq0FsloWi7LjgQqrHfazfsaDf4yXdZtMXZn3XcjKBpqvJrU0lDEcC/pFGTZy8zO
	 Bgx8/AbFckAmld1pHdBQqG/33bcjRmOeAMdvPuVCmfGN3DoAxA7gPjQgb1Zx1EXiD9
	 LVnINAJRZEsORoCqWylWx5EDLynV9Vyiy+D9C+RA=
Received: from [172.18.4.77] ([61.136.26.103])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 189216DA; Tue, 13 Oct 2026 02:06:09 +0800
X-QQ-mid: xmsmtpt1791828369t8rr3nzkm
Message-ID: <tencent_8BA9ABDFF623474ECBA6E251A03E19512808@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5qsDaqL1yrE9sioqSRvvmsmxEYgeqPtOtTuQIV77Ol2/tMKnTGb
	 zMLhzMvOq5NQJgwurpi8mNOMXQnZin58JABsqGjrOO7J8vwySJMUErOH4rIkOJwrUy02Ro98cG0r
	 hbrXZt8J7fPWB4PjfokCnjuzSMg0SAfbZs/pRwroJoTj1VR4BmuPcZXrk9dfth7AYpwvPCCal9Fu
	 akkIEw898yZ6Q1cpYmBTL13gVCdRxpfaaaQ/xY7QmQiUshhWFv+Um5AfqRtBo39JSKQpCmB92Ru2
	 S3XeDEbgvNv33cTzOrNso17pCXFNBKpZMJO0qtK/7hprK74sfcaHhfv8wJftJ7UB99wFz2aw5AeM
	 kdEgSPe/4EpL9tZlG4Oz8XWyPCSP4K8lGOy3lxYtPEanrNND+fjwFU9IxHP/ZsMS4aKqVFyhaxXD
	 oMcIVrSjs6RxqoHgSl/F4groL6qMITtT2z9eDhy18rukGmwsqV/50/+pLVCIhQJveWpAIX7DqdKj
	 h9UoiEeH/S2UtdcqbjhNLbSnQBCZ34gYhuy8AnGXEVcAZyf/iXMaPLq/Ug0TtmAs62Imi8X5a3dv
	 YdysLybs6VfOgF0VbPJqLaGrteNUM1FgOMF7tY72YFEzBSeAiTvtokPk/E3RCFj6tOjWxCgRXtOQ
	 8LKIAWE7JcpMB9lnt4VvhhgvkBZZkMCHZgTz6lAFB3s6zG0O9DNQpyNlHikF23jhBcVYsDqGsNY/
	 8pAlW5p/y67P9DBYAAJG7FhyQ6JgyoYm9/TRHQDPKOzGyJ7KP3rtrRejNVUCNXItjI+81nd8VaCG
	 IsVQGvLaFZElMdSh/i5iOxHDpUGsVVoOlAI0HO7+Xd0gG0jiUGIYm3kMEWUXZskoKjg7ApvkohXX
	 8J9shg5F3LRX8GnHi43JVEFoNO5U+mhmJEfxCTZrS2KNKpnTmCRVbx9YtNKcApHpuNqc/qssC/HT
	 eiqxaMD3GTKtIi1VTzYC/TzDrZ43HidT5aNFMlrrWnb/gy+tTpCCtUYxOTVDuw2P6bhd/xLiiUa7
	 bWPFjuUz/aNvG/JUi/4Ak0etlQ6gyK6+apTj9cOw==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: 1sh1ro <yangguikun19@qq.com>
To: Ihor Solodrai <ihor.solodrai@linux.dev>,
 Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Alexander Potapenko <glider@google.com>, Thomas Gleixner <tglx@kernel.org>, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] kasan: Fix false-positive wild-memory-access on x86 under 5-level paging
Date: Tue, 13 Oct 2026 02:06:08 +0800
X-OQ-MSGID: <20261013020608.44976-kasan-fp-5level@yangguikun19.qq.com>
In-Reply-To: <20260624234510.GHajxsBgG62PHgEZa4@fat_crate.local>
References: <20260624234510.GHajxsBgG62PHgEZa4@fat_crate.local> <20261013015904.44144-kasan-early-boot@yangguikun19.qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

I hit the same false positive and can add a data point that seems relevant for
the fix: it still reproduces on 7.3-rc5, i.e. after the CPUID rewrite that was
expected to take care of it.  The rewrite is in 7.3 -- get_cpu_cap() became
cpu_detect() -- and that is exactly the function my crashes interrupt.

Two occurrences, two kernels:

7.2.0-rc5:
  BUG: KASAN: wild-memory-access in do_raw_spin_lock+0x11c/0x270
  Write of size 4 at addr ff110000158860a8 by task swapper/0/0
   <IRQ> kasan_check_range; do_raw_spin_lock; handle_edge_irq+0x2e;
         __common_interrupt; common_interrupt
   RIP: get_cpu_cap+0x12f/0xc10
        identify_cpu+0x2f9  <- arch_cpu_finalize_init+0x58 <- start_kernel+0x373

7.3.0-rc5:
  BUG: KASAN: wild-memory-access in _raw_spin_lock+0x71/0xe0
  Write of size 4 at addr ff110000010ca8a8 by task swapper/0/0
   <IRQ> kasan_check_range; _raw_spin_lock; handle_edge_irq+0x2e;
         __common_interrupt; common_interrupt
   RIP: cpu_detect+0x20a/0x470
        identify_cpu+0x2df  <- arch_cpu_finalize_init+0x25 <- start_kernel+0x39c

The 5-level hypothesis matches what I measured on the 7.2-rc5 kernel:
page_offset_base is ff11000000000000, so the faulting address is physical
0x158860a8; /proc/iomem puts that immediately past the kernel image (Kernel bss
ends at 0x15577fff) and /proc/kpageflags reports SLAB for that PFN -- an
ordinary early-boot slab page (most likely the irq_desc itself), and KASAN
prints no "belongs to the object/cache" section for it.  So I agree this is a
false positive rather than a genuinely wild access.

Impact, in case it helps argue for the stable one-liner Borislav mentioned:
with panic_on_warn=1 (the syzkaller/syzbot default) this panics the booting
kernel, so fuzzing VMs fail to start; I currently work around it by booting
with panic_on_warn=0, which also loses real warnings.

Rate: rare and load-dependent -- 0 hits in 60 clean boots, but the fuzzer
(under load) saw it about 3 times in two weeks, so it is reproducible with
patience.

I filed it as <20261013015904.44144-kasan-early-boot@yangguikun19.qq.com> (both splats included) before finding this
thread.

Thanks,
1sh1ro

