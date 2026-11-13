Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532006;
	b=qF5zruYwJUEJpipIz6GggLlItVbTE226gFfVGPLMxG2z1aXzwjV/ICgg1p6u+LkrYgTF
	 CGT3tvwrgTX3bz03zgimSeDwWiXlzcQaGitQq5V2oFAEnyKO0X/pd85+9Uu4nrFfzrAEA
	 W9KpIJ5XcGWjpi9EsLIm3D/8ZF8sfKDoDFMHEiXMJfMuO+kGZgGT/oNH96NyTtj2YM/ke
	 t+Dfbmje2BVCB5wWrbSTtLwqYrIsRCO8nCzdtenl1CYtI5ao8S+H2uKnG3ljn4F6EbIRd
	 mqdsW5XzM/wGAD1/7XBsPRmPCn4KoaQb4QGpXssLJNMuoYpmn6Oo1LO5fMNdsd7ybrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=W5PK+MTjJ8QnNJmv5+ZxwNMS4FNWBwBOn4Y8MNye8DI=;
	b=PMzybbCTrSHHLIm7YO0U3wM6W5R7g+XCYmaWss3i2pdLs1w+Ysu8pajrhSGu+kwfPrHQ
	 4mJhFd3eF6FE4wV6W+cM4DEoDc0APBUEP5SkAHb5z2GyGrmGZEpO51D7uqUxKJL/3XwP0
	 w0lvf+8MEeQ5x63wVBVqWC7WFuoA7F1zl6dNAvvY8DmXErZEiwmNBatYOEAEMKFq0MnJD
	 zCryaBvrrMnnEwhOYdeCZJjAFbsn6dT8CaeAOTJ2EGvBGiS+3kCQ0TOuoUzFAHyxwxRzD
	 kayVBfFm1+Rb0rGHXqfxa3BHH5OmdtRgQ/zCxpaTMMnGD6rrkLQW4ReZOdXTH/cX3IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0VjU1tQ;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D0C606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1D0C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0VjU1tQ
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ace304021eso4707151fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532004; x=1795136804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W5PK+MTjJ8QnNJmv5+ZxwNMS4FNWBwBOn4Y8MNye8DI=;
        b=V0VjU1tQLLJkjueeoPfkTlmlkeaB02KmEMy+MsgOfH06p0dwxgCigKh5MlzbVho4Yi
         Vhh5w+A2/I6rUEnI13RRxv7t81uX+zl9ClBTuBvv+GpRi5u0sgHhQQNV7wtCFnAp+4kd
         JxGrWmqiczmCq3aKGz0IM/DKUONETaHBzMkPyzitmtSGaJihlGU9zBKbvdAxxltgt9xh
         YRLuXk/kLc5BDKWRfh/z+f9tdWl3uZfSbSyFspJN5jJLDrI77elnfCnFaAKIKOVoRSf7
         rl+5beN3oaf4kX3wKeAMmy4rWXb12nbBgrE8EucSWGCDK2u2WiRlY0CHUR+88LLSc9Ce
         0Ifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532004; x=1795136804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W5PK+MTjJ8QnNJmv5+ZxwNMS4FNWBwBOn4Y8MNye8DI=;
        b=rk7i2bkDVHyiFM95nYJCuaBuDYEteMmEB5KoJFJNdxaRx/aYhwNiYVHRnx7aTNAYpe
         pfSAE1xLroltoI4GdT1IKwMsMP4rapRPWgqtVA/iWaKHAaCLNN34EFkLMFV/oBblZM1o
         nkCMGiquBcMMPh6uQQFxTUfvpZ5eYzG5duVlGetEQo/mBTLK7T+ZciW+RKE4i5XnYov7
         TsTu87itWlfufqjiWDKtXcvQ0Urc+8Ryi+4K8LahYYHfhai92b3PpQoDmC3Avf+8+PaR
         JuhB45cFlxrOGONEKJxboBHLFIeZO6NsXQmOPUue+eWnrl5HE+pII3ydWBViKMvSnoXw
         gsaw==
X-Gm-Message-State: APuU4Z+wySEMbPOwWItUGsIOG0VWEKHun8VcmidC49Y9GPXz5DymRhel
	EvWCyIUi6P7J8pxM9s6CTH+oFLOT68lK40yVBu4mrmjrOpwUrPAtsgimbe5x2iSubw0=
X-Gm-Gg: AYBFou0jjVbb24EeJLBCiCCrXgpLfyQybA9wlrKF5M+rp2U1+o69A+0ketCK698XR87
	U+vksq1pcGM77PMtoNEWIIenwJo/jrvAtVa149zBbeoRqgGN6Cbijp75OWYFJaw0dhM76p5nSUx
	0CBuv7zRK0mg48z5Yf531qdzDwC9g1TrvGLdLqvFewALYG1JF2YIPtWsJmm2MyasgRCzOETbQQ3
	zurCBRgUnS8aRbCo6J2aYM3nI5Kikkmdc4hg+u0kGXrS/wn8af3psKXYFQgtWnRlstnHaw9CWdR
	5MuyWz+ZOjIYg7PVqYkyOpHHmXhrXYKW1LjYtmdmJw+WEhBs7BO8UteqD+cPuKc1KFKJqoFS2q9
	2ocMxhzEs0StycfNt8UqEfLrGwYN7jxSDEqkHUyQCxmSNuFHAMWPH8FLW+ARMZorzrfcBHqqDQr
	0u9OdQHuop1kHD4swO/3ktF9sCsd1+hC7PdcGL8zwrGWb3SLBOth4mighDmPCRtku/sodKCZ0tw
	QURiIW0p6jmkULTUsJyIdW5dPImtPKvNYjUVd3iU3P7Wuq6J59e8GBP0/BbLep02gigjIaTamSP
	I/aNkYcA3pmpw9MftGieX5yX0HOurJ2iNDfK3ANRbvPcD2nICpT3SL4hJMf1VrLiBZ4Vpigg7wX
	Aw9+0UJiZFQ==
X-Received: by 2002:a2e:8a89:0:b0:3a9:9b0b:b781 with SMTP id 38308e7fff4ca-3ae2b52a663mr4220581fa.27.1794532003913;
        Thu, 12 Nov 2026 17:06:43 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d183bsm3133941fa.31.2026.11.12.17.06.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:06:42 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/10] Remove redundant extern declarations
Date: Fri, 13 Nov 2026 05:06:05 +0400
Message-ID: <20261113010631.139191-1-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unnecessary extern keywords from function declarations
that use asmlinkage across various architectures and core subsystems.

In C, function declarations at file scope have external linkage by
default, making the explicit extern keyword redundant. Additionally,
asmlinkage already expands to extern "C" when __cplusplus is defined,
so combining it with extern results in duplicate linkage specifiers.

Changes in v2:
- Fix commit messages corrupted by shell expansion in v1.
- Clarify the rationale based on C linkage rules and asmlinkage macro
  expansion rather than C++ module compilation.
- Format the Bugzilla URL using the standard Link: tag.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257

Safocl Stollmannovic (10):
  ARM: fix duplicate extern declarations
  loongarch: fix duplicate extern declarations
  microblaze: fix duplicate extern declarations
  MIPS: fix duplicate extern declarations
  openrisc: fix duplicate extern declarations
  riscv: fix duplicate extern declarations
  x86: fix duplicate extern declarations
  drivers: fix duplicate extern declarations
  sched/preempt: fix duplicate extern declarations
  kernel: fix duplicate extern declarations

 arch/arm/include/asm/bug.h                |  2 +-
 arch/arm/include/asm/opcodes.h            |  2 +-
 arch/loongarch/include/asm/idle.h         |  2 +-
 arch/loongarch/include/asm/smp.h          |  4 +-
 arch/loongarch/include/asm/switch_to.h    |  2 +-
 arch/microblaze/include/asm/entry.h       |  2 +-
 arch/microblaze/kernel/microblaze_ksyms.c |  2 +-
 arch/mips/cavium-octeon/setup.c           |  2 +-
 arch/mips/include/asm/bmips.h             |  2 +-
 arch/mips/include/asm/idle.h              |  2 +-
 arch/mips/include/asm/paccess.h           |  4 +-
 arch/mips/include/asm/ptrace.h            |  4 +-
 arch/mips/include/asm/smp.h               |  2 +-
 arch/mips/include/asm/switch_to.h         |  2 +-
 arch/mips/kernel/r4k-bugs64.c             |  2 +-
 arch/mips/kernel/signal-common.h          |  8 ++--
 arch/mips/kernel/traps.c                  | 50 +++++++++++------------
 arch/openrisc/kernel/process.c            |  2 +-
 arch/riscv/include/asm/string.h           | 24 +++++------
 arch/riscv/kernel/process.c               |  4 +-
 arch/riscv/kernel/stacktrace.c            |  2 +-
 arch/x86/include/asm/efi.h                |  2 +-
 arch/x86/include/asm/gsseg.h              |  2 +-
 arch/x86/include/asm/preempt.h            |  8 ++--
 arch/x86/include/asm/processor.h          |  2 +-
 arch/x86/include/asm/suspend.h            |  2 +-
 arch/x86/um/sys_call_table_32.c           |  4 +-
 arch/x86/um/sys_call_table_64.c           |  4 +-
 drivers/soc/bcm/brcmstb/pm/pm.h           |  6 +--
 include/asm-generic/preempt.h             |  4 +-
 include/linux/lockdep.h                   |  2 +-
 include/linux/printk.h                    |  6 +--
 include/linux/sched/task.h                |  2 +-
 include/linux/start_kernel.h              |  2 +-
 include/linux/suspend.h                   |  4 +-
 35 files changed, 88 insertions(+), 88 deletions(-)

--
2.56.1
