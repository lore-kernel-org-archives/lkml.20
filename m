Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C567C493D5C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405343; cv=pass; b=kJewMAqFXV5Rcg4zHUZjJMvI9oIiIYTu+GrtVazWzI8Zf0A6vFKJ0tgHD7QiO0yGtgwHbSarcFK3IB8vvhwyu3uDuuoJsiqFjT4eezDqMsIvWjPj7XN3SI5zYbABmbNMJ61V0um6Bx5h0uW9LaD4R6SAM5tyFgtAvgYrP+SZGgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405343; c=relaxed/simple;
	bh=V77UNZj6zYAotLf94d56/zvRXmpazANgeBTP8j7UHRY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mF24Ydthro30aLw0l2ThlAsjxU1cpsAQNrqEHlWJrIFf7NJieTXp96MOfk+akwLGJEiqkVOy1svKrZ1Rm2cZkW5NjD75LetfWlaVFMQeHKhtI75u3mZ48OdDaEuOATK0U8bnBQyC6IRRoKs7O7KKHEPnX+B57fnuGlNVWvLUFhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=DIimeCpW; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="DIimeCpW"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-679a2297c55so1264847d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:22:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792405339; cv=none;
        d=google.com; s=arc-20260327;
        b=Vjex7OGRPnYPUdVzjUY5EYPAsMbWu77knm/p4bNDPHkXQgvx5UEvkuwVydywj68KOw
         8IlABOi7YkM1Ua4PQ5XfFWDmAnGpLR3sMSjjRRUrCpfkDy60ttKvxhEGeagnZgeeBGpz
         cSnrcU5LRWLoR4x5pb9WOJ/QkX9762XZbbKQMaeU+TwwQ81MCjEU28e9tG9imZv6dpor
         Q7trgiInOZby5by/5H4i14xSPUBSVmN7XxGMlhikw9MOC3asBsHrDgpVnkhI3QvnlmMN
         YKya93Vs1lsn8AO02sLt2gedUpwPL23RW0/34DLPHqU31JgTPpY0TIbcr7e5kdwpQRtG
         aR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=0MqRB+M/itsr4/e68tgNqvPI85uDdqkabxfr3c6YqWg=;
        fh=PYGlu0/kVWEwFbwv/rnJ9rUSgj+39orG1hAK2xvJRx0=;
        b=PB2w+kMQV9WRUIdatRzS56RcfFz365qyFr49RNYzzN+qGpTn6ALVo2sjROW1QY5+CU
         N/BCP7XcJ/8vjTHAuTeZRPbYhmb1yvTLgvsi5q2+vgnrdGrNzeXKKscjPBEmBmSKoxQA
         3bEGjRuY1xppQS/5xvZz4P+6bDTnQA+0YdTwdzb39dDpteh5J7nXk3o9OJPmuYs3v5i3
         oRJbOvhWCMe9ZPIrPA62rRyj8Iypb+RoeyEAfuPTmzceWfv2O9t1UZ7rB0cH3IfZgjw5
         nmimhRngFSU/YNGiFEuBNlrVsZilnGM9VTHvHk0EEpNqYNgEqPiGogPb9JV/K8JMOwmF
         bMyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1792405339; x=1793010139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MqRB+M/itsr4/e68tgNqvPI85uDdqkabxfr3c6YqWg=;
        b=DIimeCpWaNnp9tBgDdZREUgeBf2GTg8Sb1AvmyQEkrjcplfU9LXmtDVBd6JNzraD0w
         39Ei1tmstj2icwFVYSBNHsunWG/32cZRa+sdAxjTmbl5QZSTKSfRcFQs286QlTA9iv1n
         Qajq0mklMbqXzZrx6GnhU59edimJrBX91pujc6vmn0qziF3sXe/0Zy5yNJv9kByfgSDW
         37VWPOX8z7tgyOLUXEOIn7T6f8xvZqUat7iEHwRq6vIGMiTy0NuKf7CiqRw/9j9lDM9o
         v6nPpt+Zg+rgYb3AdYi0yTlgJxpP4fCSMGFdwvXUv7i99Xf6vr7y1r4sW15hz2J5TLjZ
         B5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405339; x=1793010139;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0MqRB+M/itsr4/e68tgNqvPI85uDdqkabxfr3c6YqWg=;
        b=CzkBfRlCUmyeBatVbRIbsnlNhhGLDM53vQdSpFoOrb/L/SE9C4Y//vCjneMbxcbQz2
         X4CTRmOLAWd4MpQcW1QlhB7GuufLNJ9CPGK58IvCiNkp6SDspXsKlTtnTSa7Ei9pLzWd
         gCEI51Bw1gPPuZJwFRQs+NbTKil0SnY7QJysYvOMNOEN/pP+OZVO1FMPIFuiE1DXEewL
         TlCn9ve1vtECj3Sot6FdEznAtyLdKXPyOM2uagVORvL5rF7qhZW8xlZot69A1HYIbZ60
         g5TAInc4EaC5I8hxUipWf7BaDeWERHdn96A2/wt1cOFlZMShLoW5isJYEaVkufIfHWq/
         kLgg==
X-Gm-Message-State: AFq9FYIdcYp9r6k2fcEg4HJz3517Ab9ZIs+pR699ZjDbMuk9r2eLnDkF
	u9sas3vw06WipPo/pAOQ0OObZBQPt4XNK2JMTktyVmV7tMCx9vl39VwUd0jEfxVSot4chV+BXpX
	RfND0WyTMp8bi4y6ExUTmrIMt3i/1ljwUav+L5l/yAiDosIqaluBxDhfhs0s=
X-Gm-Gg: AYBFou3PmJPbAc2igZ037vm2/8V/yg1e1OeEhyarYkkJywOPWIMxorim/Ue6dhurBg/
	JftznY2vjkEnH47poQayUxPRslsaN6pVc8aOWQI7pRXevyXWJQqwDAAGS0/LKnjIaISbqIE9XQj
	QQvpcmSbrtbF94AR5I+aRvXo81KkNyoFTdEsAkMgASrtvDWBm2GTAD5/hp0PkOs9mxO8SnltjLH
	pFES5CTAze2Ktzc29lTcNBLP60ssH0YlbELrC+8w5ENrYLKTol+2gGEPv1raAvq0LoXmyhOeNFx
	VHeKKzzKQoHXOdkFHt899f8s/8j3tJOcB5kmg7Q7Kwr74jdtuYD53BcouboxfIh8SLgOHldSVFb
	kNZKwgvOKB+n5
X-Received: by 2002:a05:690e:d4f:b0:672:ede8:d1f4 with SMTP id
 956f58d0204a3-679ca81b399mr1736567d50.62.1792405339308; Mon, 19 Oct 2026
 03:22:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 19 Oct 2026 12:22:06 +0200
X-Gm-Features: AclHuK-SwDShXQNktq8I6FtH9S9KeoZ0M_ytwPO-OJbugtjGczU0vrQF5hjHFXU
Message-ID: <CAHTX3dKCkUGo7Xmn55QEhJkiKtAyfNBj8pS8yK3QYpJsm-MW1A@mail.gmail.com>
Subject: [GIT PULL] arch/microblaze patches for 7.4-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, David Gow <david@davidgow.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Some issues were found by AI but nothing dramatic.
The signal changes are related to upgrading the toolchains supported by AMD=
.
Hardened MicroBlaze cores are used in AMD/Xilinx chips, and they will be
supported for another 10+ years. New tests were run as part of this effort,=
 and
that's how the signal stack issues were found.

The KUnit patches have been reviewed by David, and he agreed that they can =
go
through my tree.

Please pull these patches into your tree.

Thanks,
Michal


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935=
:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.monstr.eu/linux-2.6-microblaze.git tags/microblaze-v7.4

for you to fetch changes up to d037d22b216b52cc7c45c4b7ec06f3929d5a03f7:

  microblaze: Build userprogs for the correct endianness (2026-10-16
15:08:09 +0200)

----------------------------------------------------------------
Microblaze patches for 7.4-rc1

- Add Kunit support
- Update signal handling

Small changes:
- coding style, typos
- don't use "new" ASM pseudocode
- fix refcount leak in cpuinfo code
- prevent ptrace writes to MSR and pt_mode
- enable Xilinx DMA driver by default
- build userprogs for the correct endianness

----------------------------------------------------------------
Alexander A. Klimov (1):
      microblaze: CCF: fix refcount leak

Hemanth Selam (1):
      microblaze: fix typo "multipler" in comment

Julia Lawall (1):
      microblaze: drop unneeded semicolon

J=C3=A9r=C3=A9my Jean (1):
      microblaze: prevent ptrace writes to MSR and pt_mode

Karl Mehltretter (1):
      microblaze: Fix MB_MANAGER build with older binutils

Michal Simek (1):
      microblaze: Enable xilinx dmas and axi emac drivers

Ramin Moussavi (4):
      microblaze: wire up sigaltstack
      microblaze: reserve the ABI argument-home area in the signal frame
      microblaze: don't clobber r3/r4 restored by rt_sigreturn
      microblaze: restore the ABI argument home area below pt_regs (PTO)

Sam Price (1):
      microblaze: preserve the MSR carry flags across signals

Thomas Wei=C3=9Fschuh (6):
      microblaze: uaccess: Zero out destination on failed get_user()
      microblaze: Pass -m{big,little}-endian through KBUILD_CPPFLAGS
      microblaze: reset: Call POWER_OFF handlers
      microblaze: reset: Provide a power off handler through an unaligned P=
C
      kunit: qemu_configs: Add microblaze configurations
      microblaze: Build userprogs for the correct endianness

 arch/microblaze/Kconfig                          |  20 ++
 arch/microblaze/Makefile                         |   8 +-
 arch/microblaze/configs/mmu_defconfig            |   2 +
 arch/microblaze/include/asm/entry.h              |  13 +
 arch/microblaze/include/asm/processor.h          |   2 +-
 arch/microblaze/include/asm/uaccess.h            |   3 +-
 arch/microblaze/kernel/cpu/cpuinfo-pvr-full.c    |   2 +-
 arch/microblaze/kernel/cpu/cpuinfo-static.c      |   2 +-
 arch/microblaze/kernel/cpu/cpuinfo.c             |   1 +
 arch/microblaze/kernel/entry.S                   | 348 +++++++++++--------=
-
 arch/microblaze/kernel/hw_exception_handler.S    |   5 +
 arch/microblaze/kernel/process.c                 |   5 +-
 arch/microblaze/kernel/ptrace.c                  |   3 +
 arch/microblaze/kernel/reset.c                   |  22 ++
 arch/microblaze/kernel/signal.c                  |  26 ++
 arch/microblaze/kernel/syscalls/syscall.tbl      |   2 +-
 tools/testing/kunit/qemu_configs/microblazebe.py |  24 ++
 tools/testing/kunit/qemu_configs/microblazeel.py |  27 ++
 18 files changed, 339 insertions(+), 176 deletions(-)
 create mode 100644 tools/testing/kunit/qemu_configs/microblazebe.py
 create mode 100644 tools/testing/kunit/qemu_configs/microblazeel.py

--=20
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
