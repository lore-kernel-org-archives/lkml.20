Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D81D356750
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791724525; cv=none; b=JFdNh3NhRd1f260KWu7mSkMYk3IlWDt5KNmEgt/u4OR+1bojba1tEC/KxbnAvoL9NUdZYPomDHLT0KLZYePI84koMAsi1fKsS0NmsKuTJQrs9/y+rpFYujJnmg8wI22NQ3ZBpzSKpMWKoboKr0jgrgsb1qPsqjZQcosrH4sRXSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791724525; c=relaxed/simple;
	bh=4LTWqZOsQQVaJZ+YiPBER72YgxMoK7hq/JgYQ5D5H4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbPtX91gkOKwStJlMYvOkjh/03sOFiUdNng8M31OQgG9dDIVXy37Fduv6NeE2bgQvZf00LPdryfbFikKSxqZqLcnGfz75tyzmutuT5WC3BchazK/L4fqcXmRB3m1aVnxTSgpen4phGQ4Txogieh2PseGIxJZ0PhclcL58ygHzX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bC3tfJXT; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bC3tfJXT"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso398188a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791724524; x=1792329324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mJ9iC+O+vPqb3WC9SF1MqS5h0PqRsFdPKt4vGtej/xE=;
        b=bC3tfJXTNUCpeht5kHb9DzPkkMEg6ji+4UPzCBDNvHslM/Vlc5Wz9GCDjhGq45eKWu
         WHyRKjxVocMgvgcBWeXOjEwBtza4CYzNtFvBlu/SRnhUFGytB0GaeUb152fkp83iiAw9
         +J4cg8g0UyeIgl2jps+5BEE+tKsXOV9l57pcRVhcFvlXYMkcibXiZxo+yxGN47ajIAWU
         z6Y3+1se7QjvY51veCg65xhCocsdrthNoMRqaah2PH+462eGdDnv3Ta9Jf0NDW/2jWi/
         shYd6pNfwrUG5q5dMNStSy3fcAK9B5bfu7e4rF164G3SQwN2hWNF8iAmOM4RzgKpW8tG
         OW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791724524; x=1792329324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mJ9iC+O+vPqb3WC9SF1MqS5h0PqRsFdPKt4vGtej/xE=;
        b=fX7kdn/whp2Y0iZdTAAac2MDq1FH24gOKQisEnFqEXS/umMi8S5EvWk2BvFZZw78IA
         TRvxmwizDDcw3oXP7e8N+cjMtjiT++8tpo0WrxGEfQuSm5vZJ+072iQNrm/DaUFUkSqM
         p5ZxQvEtTTlOw1dO9UglAUuuJvDpMdVZmDwnWmdEuUbmili/zrVFcjmqBA8YaZWvmORT
         Jw3XGsyDGXi5L9H5hnOA/EY9AxAHp9n7pmzMutNQE5YGQHn4TcW+T+Vs/oxdm6PoemNt
         jR4+SXzy1S/xMghmVGdGT7RA1U2MKwkcsg2az20aR6K2wnuFcKjUCgsr6k4WpNjO5oen
         jXLA==
X-Forwarded-Encrypted: i=1; AKwUvBxWVNHJu0AEe28r8db0Xs5qHcnBb+5o/zn+6n2F6nFRkAIdl8cd7ckvtkX1+GoAFJw5l9RaQ8tEPmAi5mY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaY3DJuu3Xnx10owOKb/9XFoVo//m2QAI9+WOMn3/Ckmpn0nPS
	peAujFJr9HhgGmtfX/8sv9fwY6W+JKYDGnQqXaOYK7sxtxXf0TOvPB36
X-Gm-Gg: AYBFou0k9GwgrQDu4JPWkZvK31yQnWmoRMFLT8/6lJy2MsMJ9RFI8mtoB32B+HtATVT
	WJcZHuyiDcgA/wq3l7QrkAVN2HOPZUfvxD2SxMt6DBFWMpzgoSjqB3vKxVradi429CtXsd/DqZL
	3kZOfpypSoelHEd81Y6cjIcgz0bzW9eiPHlX9b0lB7iySEbTxbIaYhuO04k2HqWfgXVx1hguY1r
	s5GyiEFnsV/CH+ZGLEtFCF8rZpOYywXSkV2vRikcpwa/bU2NEwEsUAKDqGC+LyVvKodG2ohyRV2
	U7m+WBqK2apTnp+xWcon3vtLSHkLxlsgGvbGaBXeADbBLXrrPzd8FUAfunRugfORKHzhCnFMou1
	cBMWz52sTrMOZjjWkoWQFuhE2eYKQpO1z71XtdF/pj/ISCUutg3u9Qjtjfh/qkglw+3UQOb7263
	ZlxAg1TRlrgk+cOGZYmrVyPtRfYrpWp/HEcPAwBZahVWw1hQRprsZadTPMzou4AOvQoGdfkPjXx
	A6ERYVboaSd2Smb7u7E3TEk9nPJmtGGFJt6xZuONQ5FnkIAz7aUVAqOZuvZZ0JTw5AXh3h61xZC
	vTpi4/GgG60+eLjtn7Fb4bQDhL9/UvTYL5RDUuojTUQ5dzvfPQbPsxIH+JyLR2XY1RQqNGPUAnK
	6Ygufj+WJ0i5ByA+aE9fPC+IjvQw6apOBzpp/64wgy2IMmIW32KVJ8jekQ/9jdELiisGzfpmZ
X-Received: by 2002:a17:90a:bc8:b0:3a8:545a:9e87 with SMTP id 98e67ed59e1d1-3ab3a747e4dmr3791690a91.15.1791724523682;
        Sun, 11 Oct 2026 06:15:23 -0700 (PDT)
Received: from desktophank.localdomain (111-242-217-19.dynamic-ip.hinet.net. [111.242.217.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da05caaesm3168968a12.32.2026.10.11.06.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:15:22 -0700 (PDT)
From: Ting-Han Hou <ue081723@gmail.com>
To: Danish Khateeb <danishkhateeb03@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Andy Lutomirski <luto@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/entry: Fail invalid syscall numbers other than -1 with -ENOSYS again
Date: Sun, 11 Oct 2026 21:15:16 +0800
Message-ID: <20261011131516.104193-1-ue081723@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929173345.257226-1-danishkhateeb03@gmail.com>
References: <20260929173345.257226-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 29, 2026 at 12:33:45PM -0500, Danish Khateeb wrote:
> x86/entry: Fail invalid syscall numbers other than -1 with -ENOSYS again

I tested this on top of current mainline a5ebb76233b7
(v7.3-rc6-386-ga5ebb76233b7): x86_64 defconfig + kvm_guest.config,
booted in QEMU/KVM (-cpu host), with the x86 selftests built from the
same tree.

selftests/x86/syscall_numbering_64:

  without the patch:
    [FAIL]  A total of 37800 system calls had incorrect behavior
  (12600 each in the "modifying the default return", "clobbering the
  top 32 bits" and "sign-extending the syscall number" ptrace passes,
  e.g. "x32 syscall 0:-64 returned -9999, but it should have returned
  -ENOSYS")

  with the patch:
    [OK]    All system calls succeeded or failed as expected

It also passes with CONFIG_X86_X32_ABI=y ("x32 is supported").

The selftest does not cover the syscall_32.c hunk, so I also used a
small tracer that sets the return register to -9999 at the
syscall-entry stop of int $0x80, from both a 32-bit and a 64-bit
process. Without the patch, numbers 1000, 0x7fffffff, -2 and -1000 all
return -9999. With the patch they return -ENOSYS. -1 returns -9999 in
both cases, as expected.

ptrace_syscall_{32,64}, syscall_nt_{32,64}, syscall_arg_fault_{32,64},
single_step_syscall_{32,64}, check_initial_reg_state_{32,64},
sysret_rip_64, sigreturn_64 and test_syscall_vdso_32 pass with and
without the patch. No warnings in dmesg on the patched kernels. I did
not test a native 32-bit kernel.

The kernel test robot report for this is
https://lore.kernel.org/all/202609210251.4f7bf339-lkp@intel.com/ ,
which asked for:

Reported-by: kernel test robot <yi1.lai@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202609210251.4f7bf339-lkp@intel.com

I used an AI assistant (Claude Code) to help build and run these tests
and to read through the change; I checked the results myself.

Tested-by: Ting-Han Hou <ue081723@gmail.com>
Reviewed-by: Ting-Han Hou <ue081723@gmail.com>
