Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743482;
	b=3KQKl/i85MrFFhAMlDzbM5ktKxBSM8F1kCk22Ore+DGkkH7E996rbjC1B5FEM1srQHjw
	 W25Ssg6ftpH7r7VK2Fxj9VndBmIxmsfn6KJvZk6+bTIvjQg63YhANjUgCmwnmC+ggKMGd
	 J+NqTauhD/R0Sb9jXsUMqj+vZ8bQdL8Xsomww5MB+R9hwl/Znll70eGCjKj2Pfbkyb4jU
	 MEwp7jHPAX3ACzEd49Pntk4DwgRlHzLopc+vSqGio3rXnuIQZUn5brNh6vADRCSM3Tt9Z
	 utqgvqscQCQ5yNqWBB/k9bW6V7aDeI56ot0AEoZ7XBblxXWLIx3yXUH0mfnB7Ap+ldg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SmTMwpv1OD2XFRpOKXXdUL7roE1j9Y1IT5kBf1gh+/U=;
	b=KccHajYx34OFra4LvBqFLqToKh6TM/uDrtAWnyElyryWxUx7hORd+pvG1a+cTBoNVX21
	 tjLW7TEgdICQFEvmZrlG4WJ7MvFkH9oeX9dBpzV2GBR/44r8swqNxEzAu1IWTHGSYbFf8
	 7rgWNUjdwz6+qD5NV8WRGgTiDOaDHILcC8d92+579KxiaVu3vHcDjBN2+TgGp1TV8Vij1
	 IbWw9TrHqRtQz9HY0QLcfmBExZuIQI9CIdQiiSpMY7jHX9h+BXlJ57566nz7sCSgw6+VK
	 4GBFJmyX8UdMS9pqUU5XGypuykrquIb6BuAxmR2oldA+XhVz7/DLJzMPANYPNu3WrCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RxP77Fp7;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A6A606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:04:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A6A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RxP77Fp7
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4682977f9aso10114866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793743481; x=1794348281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SmTMwpv1OD2XFRpOKXXdUL7roE1j9Y1IT5kBf1gh+/U=;
        b=RxP77Fp7gvmnpACHIJiraNzksHDeZFHro8vTJoTKCjkqbvzj9VFpB27KW3GDTF3tp4
         KxVfQ632eD/w3Mx5MCvFI/rgTeQZoUAztcUELgXlQcgetx09eg+QRMhm0b9FZgj3DxCw
         AN9lyTB/EYeVkErvS9Ynwq3PhH8vMmyWiPDfvQlHZVWdrtT3VQAr8wTtsjDQgS6Gb6Sj
         Ppa6jG+4ztzMaWaVvxxeIloQyOMZlJZMoPEY/flzp2ABmKAr2dqvGMkBw8y9zI00xh1R
         fWrIy/s2VaDO+faDvDiCk9PLQbtYHb7JSY/qmJkDqg2RnEIaE99bvXtxkZ+8uHl6EY4s
         99Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793743481; x=1794348281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmTMwpv1OD2XFRpOKXXdUL7roE1j9Y1IT5kBf1gh+/U=;
        b=XpeQxuNzEInobfdtT6UbKCXg5y7elVvzfhgit1dPz7q2AgdGtaEbFtb0FbMWj4RUdk
         xiDGEDMY1SdjmqXKXSWJfKL8X+SiabbNXrY1Zi8a6JBRm5Re42mWnwgQImwGVqNsPjfo
         GEAjZMHcL3iUOffoyPveL5KuGjm3XX+TURS0k8LFMKRDQksrXzUu2YYIU5JlYAoNqANB
         JgHAlg4MkshpE/0/6dJdS8qnd8cd6jHcFUktqD4OWUy/d077iJHao/Lpri7QaJ9EKBR8
         QLSa5WskSfSCSKrvkEBmxN9gCEY95axxblLSyitXNzU1XRHBd4LGBYugJSyGWRlX92G9
         jhOA==
X-Forwarded-Encrypted: i=1; AKwUvBxoHR+n3ujKWvqHsLlv5or5scCoiYkKDrMp2PDiPGBMJoLFg/Dp8qjcI351ZBri9mDv++9rjkm4gHKcm1Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yj1xoUvznbbiVflOpJSklIepK93FYK/mIlz631J3p9VOiCRly
	XyWCKQIBSqEO8uZqVr65sTijjky9TXUM8utrTiWtKbQia3p0AT9cxdN1
X-Gm-Gg: AYBFou0frQov0dRYGXgDtqTfk2S93oiPcWPat1FkraW7EB+tdD1gTTyJ9qCYl533aDQ
	Uryh73JLu4hgWTA7/jcFHMHqas2+QcgSiwnaGs8Zirwk1lPwKolfcshDsWJmR/jJ+EBaeZ/1zKq
	35Z/9eBribuvFMKhUdnZL35aa+UYe6XXXDdwraTZqiJUBXUmK5DWxM9b8Oc2tOT0oMT0rfUNIaH
	NoFIWMBbZMqIx4YMjTWzgShYHXBsiHcQNIyX+x9qLCVNK77o9XRVv98SBFVkJzxO3DSfJ+7X8UE
	FS0BFZH9ouJOvdEj6nBXqmLF08TVXOrRwD6TSsA9jT768aWbms4WJinwJaB8tmPTGlzSOWBth0I
	e5qd2Q+L90oxKzwG9tD7eg3RkAo54xczHCQXT71lv4kUki0YLUoakW7bSQwK+6Nc7Iq8pp+GAzR
	gmruRB+8IshfKzXb9Br8tx1Al8v+ckre20XH9T3nGiljqje4PigEUm19YOuDweycsuDhvfmUqn9
	3INqAUt7IijkgQYWJIEkBqujxJYfg0aWywEqpVzP3N5h2WiraTTe/WnipZkkoxJrAa7KVpAbeMy
	NB9TXDpIw1OQJqYza63OuAyBJGriGPX9DNIpB3+KDxS4yC1HJ9ch93MwdYaJge0lImyTpvsrvbZ
	Sc/I9Rg==
X-Received: by 2002:a17:907:5c6:b0:c41:55b4:d88b with SMTP id a640c23a62f3a-c4ca7a9f7d5mr1183044366b.43.1793743480728;
        Tue, 03 Nov 2026 14:04:40 -0800 (PST)
Received: from localhost.localdomain (host-188-122-3-146.finemedia.com.pl. [188.122.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e424c34sm4574266b.13.2026.11.03.14.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:04:40 -0800 (PST)
From: Kyrylo Biryuk <illofspeed@gmail.com>
To: dm-devel@lists.linux.dev
Cc: mpatocka@redhat.com,
	snitzer@kernel.org,
	agk@redhat.com,
	bmarzins@redhat.com,
	dlemoal@kernel.org,
	hare@kernel.org,
	hare@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] dm zoned: fix idle reclaim busy loops
Date: Tue,  3 Nov 2026 23:04:36 +0100
Message-ID: <20261103220438.510609-1-illofspeed@gmail.com>
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

Two dm-zoned reclaim fixes for the 7.4 cycle and stable, split from the
earlier series as Mikulas asked after reverting v4 from dm-7.4: these
two carry Fixes and Cc: stable; the third change, "dm zoned: keep
polling for idle reclaim after a reclaim pass", will follow separately
for 7.5 and depends on patch 1 of this series.

1/2 stops dmz_reclaim_work() from rescheduling itself at once when a
pass cannot make progress (-ENOSPC: no zone to copy into; -EBUSY: no
zone to reclaim). On an idle target that retry ran without pause and
called dmz_check_dev() on every pass. 2/2 stops idle reclaim from
copying a random zone into another random zone, which frees nothing;
its -ENOSPC result relies on the back-off from 1/2, so the order
matters for backports too.

v5: https://lore.kernel.org/r/20261013145522.17499-1-illofspeed@gmail.com
Mikulas's request:
https://lore.kernel.org/r/b7e35437-de42-d078-e75a-1f08541eb725@redhat.com
Damien on v5 4/4:
https://lore.kernel.org/r/bf59b38e-635d-48b8-861f-e50961472e92@kernel.org

Changes since v5 (posted on 2026-10-13; a v6 was prepared but never
sent):
- Rebased on 7.4-rc1 without conflicts; its dm-zoned sources are
  identical to those of 7.3-rc7, on which v5 was based.
- 1/2 (was "dm zoned: back off when reclaim finds no destination zone")
  also takes the -EBUSY back-off from v5 4/4, as Damien asked ("This is
  undoing what patch 1 does"), but not v5 4/4's dmz_should_reclaim()
  change (idle reclaim only when a zone holds data). Without the
  polling patch that change stopped the idle poll after a complete idle
  drain, so later data was not reclaimed until the next allocation;
  the back-off alone stops both loops. Hannes's and Damien's
  Reviewed-by from v5 1/4 are dropped because the patch changed, as is
  Hannes's later one on v3 1/3 (2026-10-21).
- 2/2: code unchanged since v3; Damien's Reviewed-by kept, Hannes's
  added from his reply to v3 2/3 (2026-10-21).
- The polling patch is no longer part of this series (see above).
  Hannes, your comment on v3 3/3 concerns code that v4 moved into
  dmz_schedule_reclaim(), as Damien asked. The polling patch keeps that
  form, which avoids one extra run of the work after a pass that leaves
  reclaim not needed; if you prefer the unconditional reschedule,
  please say so and I will change it.
- The Assisted-by tags are gone, following commit 1e035297ffda ("docs:
  remove Assisted-by references"); tool use is described below.
- Commit messages: test results for exactly these patches on 7.4-rc1;
  measured rates are SCSI request counts, not commands reaching the
  drives.

Tested on 7.4-rc1 with emulated host-managed drives (scsi_debug),
RAM-backed: idle request rate and reclaim passes against the stock
module (1/2), the random-to-random case on a two-device target (2/2),
and checksums of all written data; details are in the commit messages.
md/dm-zoned reassembly after target removal was also clean, and a target
suspend and a "reclaim" message each landed during a copy with no hang
or kernel warning.

Also tested on three 27 TB host-managed SATA drives, each a
single-device dm-zoned target (998 random zones of 256 MiB) used as an
md RAID5 member under dm-crypt and XFS, with the stock module and with
both patches built out of tree for 7.2.10 (whose dm-zoned sources differ
from 7.4-rc1 only in three places where 7.2.10 open-codes
clear_and_wake_up_bit()). One run per module, kprobes attached
throughout; the drives sit behind a SATA port multiplier on a Marvell
88SE9235, and two other drives on the same controller were being
zero-filled at about 218 MB/s each, which affects the absolute numbers:
- idle for 300 s with all random zones free: stock, about 32.5 million
  reclaim passes per worker, each with a TEST UNIT READY that libata
  completes in software (about 108,000 SCSI requests per second per
  member) and about 915 s of system CPU time across all CPUs; patched,
  29-30 passes per worker, no dmz_check_dev() call, 58 requests per
  member and about 46 s of system CPU time. Those passes issue no I/O:
  the requests come with the target's periodic metadata flush;
- 300 s of single-threaded random 4 KiB O_DIRECT overwrites spread over
  1,100 chunks (more chunks than random zones), with dm-zoned's free
  random zone percentage at or below 30 (at most 309 of 998 free) in
  72-79% of the samples: 2,457 (stock) and 2,395 (patched) writes,
  99th percentile latency 0.49 s and 0.48 s;
- a target suspend with the array running, and removal of one
  member's dm-zoned target after the array was stopped, each while
  reclaim was copying a full zone (patched): each waited about 11 s
  for the copy to end, with no hang or kernel warning (with stock,
  reclaim on the member to be suspended had stopped after a busy pass,
  so there was no copy to overlap; the stock removal also waited for
  its copy);
- sha256 of all written data, read back at the end of each run: no
  mismatch; md parity checks of every stripe of the suspend/removal
  test and of a random sample (about 4%) of the other written stripes:
  no mismatch.

2/2's case does not arise on these single-device targets. As with the
stock module, reclaim still stops after a pass that ends while the
target is busy and reclaim is not needed (here: after a busy pass at
31% free, no pass for 600 s); the polling patch addresses that.

Not tested:
- the back-off while the target is busy: in the overwrite test every
  reclaim pass copied a zone, so no pass ended with -ENOSPC or -EBUSY;
- the -ENOSPC back-off on a single-device target without cache zones
  (found by code inspection) and recovery after a sequential zone is
  freed (neither test setup could establish those states);
- the effect of the cache-to-random fallback that 2/2 keeps: 6 such
  copies completed while the two-device target was being filled, but
  the test of its effect could not establish its starting state;
- system reboot and shutdown; only stopping and reassembling the md
  array and the dm-zoned targets was exercised;
- stable kernels at run time, other than the 7.2.10 runs above. Both
  patches apply with at most a 2-line offset to 7.3.1, 7.2.15, 6.18.60,
  6.12.115, 6.6.161, 6.1.191, 5.15.224 and 5.10.273, and the dm-zoned
  objects build there without warnings (x86-64 defconfig plus dm-zoned,
  W=1).

I used LLM coding assistants for root-cause analysis, drafts of the
code and changelogs, the test harnesses and reviews. I reviewed the code
and changed it where needed, and I am responsible for these patches.

Kyrylo Biryuk (2):
  dm zoned: back off when reclaim cannot make progress
  dm zoned: do not reclaim a random zone into another random zone

 drivers/md/dm-zoned-reclaim.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

