Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E49744CF2F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518808; cv=none; b=gf0HCplE16Y9QKaAoXXIn+2O5nhVarY89CWxiv0J4Or4FLMLilOpLmXfqoZAn5RvuX+OaeTf6KsRgO67DuxfYJHvI2Yw0EQZjZ95TD7k8lj2fgZ+xMQeaaNkBmcTZHBQ5v2dvK2plj5TBQcW08QxpENDquKu0UlMDhL9r8HdxtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518808; c=relaxed/simple;
	bh=vI4BJr98zD4bOrNCkL53UUoMMREvxeA7/vSX23Pxl1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B8jX6Tn5ASjx2BDk+TfB9vgAdp4hVMRmxt2F+Kfvwigd/tfzSM5mQhtt7blm71ICKCbPSZqa5RtqZkOrsmnFxWsGHMtmCmbagXhc5k203w5+mV/kzf2rRahndM1g0ABvpx34mFXo65pyq+RiyTVyjv0I73Xen0oJj5hYCZ1PiSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oMKqpteW; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oMKqpteW"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1c9879395so748159a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788518807; x=1789123607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iv/xpcLt6Tqe8TYSIG+UqJI3LRRHyMQu/zPg+MfHTPY=;
        b=oMKqpteW3+WnaHxTkewH6KL3fuF+kbwF2BOstzhvOHp152hhu7FTHGH+cWiNbHZqDE
         +bUquTYkDsObNDcg1+Y+0Qf3yUa4zjq2p1He4QJgn88IaHDt/OLq1rvx35ja7q/iYsPV
         c61yU1tZBVHlT/XMGjdts/cwA7j0mwhcjBpLtU00oYvhJGJ5xL82PFfAwOLKvpdPrrJy
         od6zpKIADRENY2YYs/uIQ99u7EovK0ho8h/qeMIrkK50VfLjA6u3enp6Z4Q2p0dH27ry
         vegsWs4myT3M1pUcPCLuyakz2WWcS+t8wu7Fggz+ontxERt57ycwQatGBKRSm7ttMxt5
         AM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788518807; x=1789123607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iv/xpcLt6Tqe8TYSIG+UqJI3LRRHyMQu/zPg+MfHTPY=;
        b=Ws2+ZDoRH5lc3PsxCqF9C02mjIVHpO8P2wWm/PV+thMX+FLC8Q4qUWmsNGob4CWesb
         KlUmNQoQXFMkzdXkR47JTC9tOxXNlPGYaPo6KTCym9SOtAYtcPOtU5uHKlhh1tznr0Mf
         HyEY70+re+rOScduvVdThKyD8Bsh1gbz8htD1OtSqxjPECuQXcAvO9Q9tHFG4xeZxhLl
         je6fpYStVS29mCJZOnIlVnqQH2wqQ7lOR/skfJfKR0AhjdUGEu1JOpyUSTOBXMe0Y3hk
         O5mB+lSZq5wagUN2tp56lKOsLmWbCrFzYG6TGB+/cAJX0yOY7BO0ElRVVik1OqyrXX+l
         tzWw==
X-Gm-Message-State: AFuF++kEF9gNEwX+YjFliSExnI2QvgMzTrdCFeuMdCjDkstGSJMbzNxB
	BkLbUxmZbqUyZCJYhZSZ+M9vkWIQTXd9EI7ih7a9g1AVAaI43ZZOt+oZ6urL6VOCP2s=
X-Gm-Gg: AYBFou1Afgpr6HK345CFx7vvArsGHNkXWOl0id1saQ0G1WhGmGD3neCosKKC1kKsLRR
	njoke4mF2cCQ46ghweifSb7U+PjMLmMKKrmTiId0cr095WY2RutDg1c1CQHc1TtQlBA6MUbhHw3
	cC+huYXZdIiU62NbPn1W2N2ow4Yojriq6Xcx+idVBCCRWvU8m1GcRr5VnuX2AwVff8LDirt49JK
	yfkcLsgeNlSWupm//ZQaVlluw9Zllt5cmFSwr9NTQeb/J4FSxXusr7A8e7GkLoT2sWFTjB/XKlC
	SUp/ZN2w2BEli5ZSCMFTSKbuU7BQujc6Pzf8WCMDHTt20MoBbkboqF45T06LSG1jMEdq2Le9547
	qkEVgiH5mJIOUkVu5OAEss9XTGqozrMqyOcAnyPUUBQIL1cNDIGA+o1FNC5zsuStf9+kvyTtXaj
	bPFqlrQwiRpVmt8Z4YLQWXSjHuCvqEcDXJO+lTksPtjZKzFh3bhCG1sg1toO4wpM1dd7P2dIiAU
	xV140plTdYIsiE=
X-Received: by 2002:a17:90b:3c45:b0:398:9beb:5c19 with SMTP id 98e67ed59e1d1-39b26232bb1mr7927733a91.20.1788518806719;
        Fri, 04 Sep 2026 03:46:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm8536223eec.15.2026.09.04.03.46.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:46:45 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] treewide: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 16:16:24 +0530
Message-ID: <20260904104639.21537-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  treewide: fix typos in comments
  treewide: fix repeated words in comments

 drivers/cdrom/cdrom.c                        | 4 ++--
 drivers/cdrom/gdrom.c                        | 2 +-
 drivers/comedi/drivers/comedi_parport.c      | 8 ++++----
 drivers/comedi/drivers/pcl812.c              | 4 ++--
 drivers/firmware/memmap.c                    | 2 +-
 drivers/parport/parport_pc.c                 | 2 +-
 drivers/w1/masters/ds2482.c                  | 2 +-
 drivers/w1/w1.c                              | 2 +-
 fs/qnx4/namei.c                              | 2 +-
 fs/qnx6/inode.c                              | 2 +-
 fs/qnx6/qnx6.h                               | 2 +-
 fs/squashfs/cache.c                          | 2 +-
 fs/udf/inode.c                               | 4 ++--
 fs/udf/super.c                               | 2 +-
 include/clocksource/timer-ti-dm.h            | 2 +-
 include/linux/amba/pl022.h                   | 4 ++--
 include/linux/amba/pl08x.h                   | 2 +-
 include/linux/average.h                      | 2 +-
 include/linux/backing-dev-defs.h             | 2 +-
 include/linux/folio_queue.h                  | 2 +-
 include/linux/iov_iter.h                     | 4 ++--
 include/linux/journal-head.h                 | 2 +-
 include/linux/most.h                         | 2 +-
 include/linux/msi.h                          | 4 ++--
 include/linux/platform_data/emif_plat.h      | 2 +-
 include/linux/platform_data/pxa_sdhci.h      | 6 +++---
 include/linux/prime_numbers.h                | 4 ++--
 include/linux/rmi.h                          | 2 +-
 include/linux/rseq.h                         | 2 +-
 include/linux/rseq_entry.h                   | 2 +-
 include/linux/sxgbe_platform.h               | 2 +-
 include/linux/ti_wilink_st.h                 | 2 +-
 include/uapi/linux/acrn.h                    | 2 +-
 include/uapi/linux/chio.h                    | 2 +-
 include/uapi/linux/genwqe/genwqe_card.h      | 2 +-
 include/uapi/linux/magic.h                   | 2 +-
 include/uapi/linux/pmu.h                     | 2 +-
 include/uapi/linux/serial_reg.h              | 4 ++--
 include/uapi/linux/um_timetravel.h           | 6 +++---
 kernel/acct.c                                | 2 +-
 kernel/async.c                               | 2 +-
 kernel/compat.c                              | 2 +-
 kernel/context_tracking.c                    | 2 +-
 kernel/exit.c                                | 2 +-
 kernel/latencytop.c                          | 2 +-
 kernel/panic.c                               | 2 +-
 kernel/pid.c                                 | 2 +-
 kernel/ptrace.c                              | 2 +-
 kernel/relay.c                               | 2 +-
 kernel/signal.c                              | 6 +++---
 kernel/user_namespace.c                      | 2 +-
 samples/trace_events/trace_custom_sched.h    | 2 +-
 scripts/check_extable.sh                     | 6 +++---
 tools/arch/x86/include/asm/cmpxchg.h         | 2 +-
 tools/arch/x86/include/uapi/asm/kvm.h        | 2 +-
 tools/include/linux/filter.h                 | 2 +-
 tools/include/uapi/asm-generic/mman-common.h | 2 +-
 tools/include/uapi/linux/elf.h               | 2 +-
 tools/include/uapi/linux/fs.h                | 2 +-
 tools/include/uapi/linux/seccomp.h           | 2 +-
 60 files changed, 79 insertions(+), 79 deletions(-)

-- 
2.48.1

