Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793085000;
	b=GH2EVf2LfDbhvA119u35Ze7+rem9StaJ3CE/1sMtqS8u0RftANdBCovqezpm0BJdIZ3H
	 V+YWVus1iE3Q6dI0NCwHDc01pOEerPqtMBzZ25FkOHAUs6c0wxFp4zzhOZ7DCPsV+LcJ9
	 zKZl2Ug0E1f1ALhgeDkBmv6T64BnCF8ni1RJbBcifaYQrHoSu4w5njvuLYCgLN6DFFy0g
	 1xNV34+pvIXsXTci1AQ1e74aG6j9GPhDKwCbrdPhjk+SrM8n9xUHSQk/7nT8q8IIHwcRg
	 G0m3PsgY+4FkeomLZD/0+3tSx3QPp3N9rVAOQD08928Sf4GmnnICKYoz0LWx0Or4Wkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793085000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C2zQrivhWq2xS7rGadMgkWdZZAgjXLYRNp3PSXeLbqM=;
	b=GaqQOo1ErwNzk6mrTaPq06MfFreiTFDu0xDSZGnaClOXV1HobY8RqqAdFHqIRmotR41F
	 jeupnOD5B/LzINDCzTX7/J2fVwNdK2CgCQFOQJlBknQXo+u5d+cWoyReac7gATW6ZqxZ0
	 E+02Phl/SpKzva6CTACJrhvyfZvQhT0+259kfXom0v0teVXawhElgHLZX7zfmJyfDyyTR
	 wOix64sDCTiedpSl1PfAJe6Ema2Xm6fncq+QI6drlae8RS25Kl1EWUC4Hq2ECXDoCG+3v
	 TeX+oXhxyJKJ5GFVd/lx/xQDYxaFcuzyk8X1bGU3emfnlOuV4hxV1ySLm4Q7zNPSVsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=egN0oQ5f;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021FB606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 021FB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=egN0oQ5f
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-881269371acso307271b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793084999; x=1793689799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C2zQrivhWq2xS7rGadMgkWdZZAgjXLYRNp3PSXeLbqM=;
        b=egN0oQ5f3P4k9liFx0lazyZgm7QoUXhnN/1UbwQhc+0aUl7uD79Np68WD90AhuU7Pf
         ikWfRnV7+O/2d+wKRCzBf6BKAWUUTHKGig5HfJ8cPK39I7o6N3XuBe35K4/aJfUNOEZL
         jwxsV5kIZXUR/kiYDRA/jDloF8DEMX58jSyvA6qeOSL7EvqFFhtT9Peen1r6vJ/3UL+Y
         kkV/vPr6bg/s9/7k85fLoUc0xoPQYQNk5gwV2kg6XmonQfeeqkJByXDBRxeCiyJb/+Hj
         VkDzzEW9bisy4ZhVujcu5X/Colswjr1HrQuzEX4ZdoqY8TaCgBhIIgAXeosZFYBDG/aC
         Xhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084999; x=1793689799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2zQrivhWq2xS7rGadMgkWdZZAgjXLYRNp3PSXeLbqM=;
        b=qw7XaeyIZpa44DA9IU8KZ4ZpSH2eFd42895Zet/d0fT3BJ+UHJ/EXTnL8jsdXiY5/y
         M+NUHJn85+XmDHV0OrTIVouYRHfbQonWU+Ssjj5xIEvAPzH9bZueaJj2P2BscYG9UJAd
         VtE2xmJGxSEmIA+2ZPpcOyowOYnrez9BfJun2cMOFZbJMQs5AJt3Qxd+3E4xuhmQnREv
         uAGz1KYJdQo564GrTRajpw4roSDiIdQ90wAcF8JSTxJeMKZs+UoyrLPobtyxq8GMGFIh
         A7fnX9ehuF0kSlBofTo7Bt+QjpYku89s8OTbIbWpQmV+831KuMx9zFDqv5bAdtnqEGsT
         hl8A==
X-Forwarded-Encrypted: i=1; AKwUvByNfRGsyUxtzi/TFxglV9qQmuMiogLIpdTmuphn/9WKIQ9ao1BIH/2v73DkrxoYh/xtH1vfQtZBaIZLol0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZWH8h3RbNi7mIT/Z9Af8cQQJkRkearJf5XLzhQSIeb5zCtEhM
	b/OZc5dm8GfuemqTpu2hb6IjyFcLhrUCerONlQYXdhS3fRFHXq2g0dkg
X-Gm-Gg: AYBFou2NmUHh3f7AOQ23V5QAEpTGxHMFB0FaOnhvuLS5wcHX/NF2IWrc6aKEZPm/tWB
	lQy07RcAuSjt6KQ2DM0dh59VxiiyxrurhkWqKkZABvAS/UcgF7BSKjNNc9PJ+4yWbIWvOsgBM6p
	kqNxtiLHkfP4ZAtVt1cOrpvI7O5FEZetbKC3YkkzJdsvd89PLlBAJrs6WYElnoy72X9Gf4/MWOm
	nPeD7UrNmmnnz/gT3TGLvPKYq/t8sEr76PZkwcxPVts2M2+5sydaaRFKw8wRx9NWAoigBpvi14L
	XRuDE1yNPrMhu4F14IkGy9OISfcu58WpPBnsmgDWaqONz+mdiKu+mm3C11DuZztwCguYqk1ipBr
	Ju6p/RdDZ49NV2mucPkjX2EOcVFIEop88b5af4We4YZKFgWUcRkWZPaQuYDrBFvdM3M07BQbEqF
	ZVJAuLeQOb3IVRuRj9zmjqn6r8WNqWLNBfw1+vn40rCwDXgMUcsJP0Uui6RHqnHgdv6qPU19Nc5
	XLftc6B+v5PdaTJBCnPqqaDjgIHqmyOq3hwTa0Onk/VPnotuNP8JH/Ja1ubusR8iGqsTZNjIQ==
X-Received: by 2002:a05:6a20:e290:b0:3e2:9b9e:7efb with SMTP id adf61e73a8af0-3e8eaea247fmr1321044637.50.1793084998943;
        Tue, 27 Oct 2026 00:09:58 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc21274sm2277512a12.8.2026.10.27.00.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:09:58 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: jiangshanlai@gmail.com,
	paulmck@kernel.org,
	josh@joshtriplett.org,
	work@onurozkan.dev,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org,
	urezki@gmail.com
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	qiang.zhang@linux.dev,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH v2 00/10] rcu: Improve callback diagnostics and validation
Date: Tue, 27 Oct 2026 15:09:13 +0800
Message-ID: <20261027070923.3054462-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hi,

This series improves callback diagnostics and validation across RCU,
SRCU, and RCU Tasks.

Patches 1-3 record callback registration stacks for KASAN in Tree
SRCU, Tiny SRCU, and Tiny RCU.  KASAN prints the recorded auxiliary
stack when reporting a use-after-free.

Patches 4-6 add rcu_head alignment and NULL callback-function checks.

Patches 7-10 detect duplicate callback enqueue attempts before
queueing, using the RCU head debug-object mechanism.  A duplicate
registration is rejected at entry and __ratelimit() controls the
diagnostic output group (pr_err, mem_dump_obj, dump_stack).
Detection requires CONFIG_DEBUG_OBJECTS_RCU_HEAD.

Changes since v1:
- Patches 7-9: __ratelimit() + dump_stack() instead of hard-coded limit
- Patch 10 (new): same change for Tree RCU's rcu_do_enqueue()
- Patch 9: fixed log format to avoid pseudo-function names
- Tags: Reviewed-by (4-6), Suggested-by (7-10)
- v1: https://lore.kernel.org/all/20261023101841.2910719-1-kunwu.chan@gmail.com/


Testing:
  rcutorture with KASAN (SRCU-N, SRCU-P, SRCU-T, SRCU-U, TINY01,
  TINY02, TREE03, 3min each): all exitcode 0.

  KASAN aux stack (QEMU, CONFIG_KASAN_GENERIC=y):
    Last potentially related work creation:
     kasan_save_stack+0x33/0x60
     kasan_record_aux_stack+0x8c/0xa0
     call_srcu+0xb2/0x390

  Duplicate enqueue (QEMU, CONFIG_DEBUG_OBJECTS_RCU_HEAD=y):
    call_srcu(): Duplicate call_srcu() CB ... ->cb
    dump_stack_lvl+0x47/0x60
    call_rcu_tasks_generic(): Duplicate CB for RCU Tasks, ... ->cb
    dump_stack_lvl+0x47/0x60
    rcu_do_enqueue(): Double-freed CB ... ->cb  slab kmalloc-16 ...


Kunwu Chan (10):
  srcu: Record callback registration stack for KASAN
  srcutiny: Record callback registration stack for KASAN
  rcu: Record callback registration stack for Tiny RCU
  srcu: Validate callback arguments
  rcu: Validate callback arguments in Tiny RCU
  rcu-tasks: Validate callback arguments
  srcu: Detect duplicate callback enqueue at registration
  srcutiny: Detect duplicate callback enqueue
  rcu-tasks: Detect duplicate callback enqueue
  rcu: Improve duplicate callback diagnostics

 kernel/rcu/srcutiny.c | 34 ++++++++++++++++++++++++++++++++++
 kernel/rcu/srcutree.c | 36 ++++++++++++++++++++++++++++++------
 kernel/rcu/tasks.h    | 27 +++++++++++++++++++++++++++
 kernel/rcu/tiny.c     | 11 +++++++++++
 kernel/rcu/tree.c     |  9 +++++++--
 5 files changed, 109 insertions(+), 8 deletions(-)


base-commit: 940793b926aa94bf65ec404043050888e3053188
-- 
2.43.0

