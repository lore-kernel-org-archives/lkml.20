Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12F539D6D5
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131142; cv=none; b=LtoJ6iY+8LJVSTvsoIIqVT9/NWax+pcSaUahUwm4GQWd2JRzOENey8fs8ELmNCRdCHH3FPttAPQQv/ZkiVnBMPOQJEk6xBC3MzeMmAaeHYbEENUeZejmfdVrxzg79Gn3tvbP3sHGJeKxFizuyPFeXpwEc0htr/1VToYYUf+3J4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131142; c=relaxed/simple;
	bh=GiK1rjWkVKYkYUyerIeHUjnzQfFpbLLdF4axllSUko8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nElf5YED84K/X/YntO5EWBc4T/1HT2lOsw4DyFW3a3R7ujxAjCvT/4vMLiAqH36Qrd56njxn9WBbkx4HdLS6YmDIs4Cn7wOvsdllroCNTbUbSqIqU8YDaVWxEzqIQZQLuWC1W4/jboe2reqMWRLjVYoqJVZDwrWSYuU/S157IF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cT9KOWN2; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cT9KOWN2"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso2785473a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131140; x=1792735940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cECDn9wixA330bGvTffyTHattrcKzY/ix80ysxVbhlI=;
        b=cT9KOWN2ERwzS2XFzWsSwVytrHoIP911OrNYFbosERYwo6FDgwjUiNTI57jAI3WSNz
         3LKijCyMgpUQbfNdQCKgzq/Ox7FLy0scCdzLXEbOArVwnR6XGM/u7ZLrf3v3S1JyhSiD
         lwOV0Id1fiShnsro1j+WJqGEYo+gSYc4wLAGY2KLfHs5IquYACXuE35wYYoYvUmOeCz9
         gBSWOl4LT4776qH6BGhkhT9er5Cc/B8IZKAvwYOL6gnAVkOp9AHQXoWtrxJQFf9NnnsI
         06RcscAltZ1PUwgO7m2mzFKTxSkmMCXavjFDdq34zpOfZOB8R7v9as1Ma1BCEuUunbgh
         eCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131140; x=1792735940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cECDn9wixA330bGvTffyTHattrcKzY/ix80ysxVbhlI=;
        b=qkbrHRTXHZjLrTJeNcGHqe7FAmP/mNO98/Wy/5V6SOd0une9nrScS+GGnk6Geowzgh
         sVU0uiJn01DxVZ2k9QlEMEvkLNCKX+80LTHOf+KAxNHZusTIwEs6jtGDuCrFodm8W/L0
         mFLEFdnUg13qfjh7k92pHa2YPjcVeXzrlf+rnjVjVfF4E5PW6e1BJRMMrRuNDYNfB0MW
         +jI8XEDzmbG+k8YM0+5g1FWQzhDc3JOgp3wQrskeKDlm83Z7DN2iM6zo1NTHT/Kls6Jq
         Hyohchb+xbYsipjjpBwNk9BgpIrYIWl3AMDGj7AZZCtVI7SQB+pSpwg/NZdcFgk9x0HN
         zBOA==
X-Forwarded-Encrypted: i=1; AKwUvBw66bT7pPY/9FgsvGuLEAL6l8QSVyFGrvaJIxFTc7aimSg2oPBVZZYiwlx5x78coBC+rk8mx1G7qBXGkRg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAKwjpMS5exAHvNVGCGphFvT2wvU8Sa24hE1sE7TU7xX5tZQMS
	CKHHBil52tRlgV10Qecuoy2RWGSwQzCEZJgD0vv1RT3R+AGE5UfTkIJV
X-Gm-Gg: AYBFou3lOrb0VM2ZfnduVQUEMgI43VccoYO8It82SoSgrHBZMeYNhDK8QskDC+4/ypE
	OxXTzDXZpriLU/yuDlCvkq8wZZ8OZX00RfTcR8EmZuGIvp4PKNgb4UAvybg19BSdnst9W/Dsd0d
	azGDwG6Px6A7pZ11YgZbDcVCEdlVDEFSOOPsHrwQdv74K+dx4pMKF+LZIp5NZU4fCymD0mwQloF
	AXsPjFFuk/Elm5HWD/3uylGZ+eV9b6CzD16MS+LUcfMxhZXQk/4aJbR/yFXHvYtRKrlSBDc9nQw
	RqY47NQAcU4L7QXG/3r5r+6IM3ENKoHSva7ZQhzaskmd4ZOx/QG/Xrd8Hw+FNChB54UfexO4LHu
	E+gKPSPTAKG24FXIRrPdZEzxH54BNaoF02oLl1pspIMegsRvi/GwjvSTudCk6iPqsMCQ2S0A1iy
	4PSf2z8Fakk63AMESRFiXHnYtXlsTsWJlauDtGDvhmI61eIN8CPAk7rlZQ6ZFHnKJqQo+26rWrc
	ukf5hTQT/NDp1NDH1mw3cZBndLwnmYsMtqXmVrplOPQgTuRV5RShrZSfilybeUhTlXVbwpwFRfH
	DVfYgreoxnX+BsvzEQ4ZfQBgHJgpgqer9OeRYq42LFb62UZR
X-Received: by 2002:a17:90b:4acb:b0:3ac:aa8d:19d6 with SMTP id 98e67ed59e1d1-3acaa8d2219mr2736921a91.17.1792131140016;
        Thu, 15 Oct 2026 23:12:20 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947dfa00sm7587036a91.17.2026.10.15.23.12.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 Oct 2026 23:12:18 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Mike Christie <michael.christie@oracle.com>,
	Dmitry Bogdanov <d.bogdanov@yadro.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>
Subject: [BUG] scsi: target: use-after-free in PR REGISTER AND MOVE racing PR OUT CLEAR
Date: Fri, 16 Oct 2026 16:11:50 +1000
Message-ID: <20261016061150.90624-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

core_scsi3_emulate_pro_register_and_move() (drivers/target/target_core_pr.c)
drops dev_reservation_lock to allocate the destination registration, then
re-takes the lock and re-locates it:

	spin_unlock(&dev->dev_reservation_lock);
	if (core_scsi3_alloc_registration(... , 2, 1)) {
		ret = TCM_INSUFFICIENT_REGISTRATION_RESOURCES;
		goto out;
	}
	spin_lock(&dev->dev_reservation_lock);
	dest_pr_reg = __core_scsi3_locate_pr_reg(dev, dest_node_acl, iport_ptr);
	new_reg = 1;			/* result used unchecked */
	...
	__core_scsi3_complete_pro_release(dev, pr_res_nacl,
					  dev->dev_pr_res_holder, 0, 0);
	dev->dev_pr_res_holder = dest_pr_reg;
	dest_pr_reg->pr_res_holder = 1;

While the lock is dropped, a PR OUT command from another I_T nexus - most
easily CLEAR, which frees all registrations - runs
__core_scsi3_free_registration() and clears dev->dev_pr_res_holder. The move
path then uses the freed / NULL registration.

On a stock tree this is a NULL dereference (dest_pr_reg / dev_pr_res_holder
are NULL):

  BUG: KASAN: null-ptr-deref in __core_scsi3_complete_pro_release+0x9d/0x3b0
  Read of size 1 at addr 0000000000000228
  Call Trace:
   __core_scsi3_complete_pro_release+0x9d/0x3b0
   ? __core_scsi3_locate_pr_reg+0x13f/0x170
   core_scsi3_emulate_pro_register_and_move+0xa95/...
   target_scsi3_emulate_pr_out+0x3a4/...
   __target_execute_cmd+0x56/0x140

A NULL check after the re-locate is not sufficient; a use-after-free of the
destination registration then shows up - allocated by one REGISTER AND MOVE,
freed by the concurrent CLEAR, still used by the move path (three tasks):

  BUG: KASAN: slab-use-after-free in target_scsi3_emulate_pr_out+0xaf5/...
  Read of size 8 at addr ffff8880058db670
  Allocated by task 23:
   __core_scsi3_alloc_registration+0x7c/...
   core_scsi3_emulate_pro_register_and_move+0xed7/...
   target_scsi3_emulate_pr_out+0x3a4/...
  Freed by task 33:
   __core_scsi3_free_registration+0x3d2/...
   target_scsi3_emulate_pr_out+0xac0/...        (PR OUT CLEAR)

Reproducer (KASAN build, panics in ~1 minute)
---------------------------------------------
- Two tcm_loop TPGs (SAS, distinct rtpi), a nexus each, both mapping one
  iblock backstore -> two /dev/sdX = two I_T nexuses to the same LU.
- Thread A on nexus 1: loop { PR OUT REGISTER; RESERVE;
  REGISTER AND MOVE to nexus 2 (unregistered destination) }.
- Thread B: loop { PR OUT CLEAR }.

C reproducer and full dmesg available on request.

Reported-by: Yu Zhang <yuz08559@gmail.com>
