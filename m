Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793668478;
	b=HMAIsxrsKSc4CBkcgkoiB8wDSbFouWGCDR22fBHQe0IlXizbLlG0Dnv2rKu6/ygyj34n
	 3FSt8hL5/HhiP2quHyj7LhwT5RqCI93uhT04PyBApT9v/5GsG4ApFz0J7bMRG60vC/CmG
	 KMnFEegEh0gzMAVG+Hkyv05tP/UmjTNCu5H2f/JGezFpkkg1rlGV/tsfUGiEVPvSV8RJy
	 EqLajiA+4o8fP7UiTW/oxUpNkAzwZtzRb5RVv8URRg0/kx4MYYHGlZBOl7XCAgwxvn9B5
	 7Pp48t+E3FPg6LavMB/HvLVlriVJGtzgKmjU+Nb/28s9zkFYQm/Aabb/tTiIaNY21rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793668478;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=aW7N2qRULoUhPWvzCC8goK29YzcJrPhPgeXp4+gf7Oc=;
	b=dWaDeHktqrPrruLiowIu73RFTCUuAQTF1zQPQ1jt8cDJ/VOzyBiz+B9UDe76K7P3Zx0a
	 eS9TSl+sEFjoYO+yCUYgbIy+aTdOHHp0jirttekUjrXPJ4AhYBvfqzSpJgkWrGQp1tcVc
	 aUfij2NYS5/H0siKeThqcB3E30cUwHThto+/pEPaDO9Bg94ixP9TeKSTM2HgU39fteer1
	 WUIEtOQIwQ/b+D5UfTXzYQXg409+91dq1aERIoZLTTGrMdLDmzHIypBma0UBqMVcOKLQ/
	 ZWdKKT+QdwcYXzXdhipYKzCks/zeuredPTI9APZ1H5qhZGsxz4l8rkX7MUL2is5bSxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA54F606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA54F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3550c917fd3so5015142eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793668477; x=1794273277;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aW7N2qRULoUhPWvzCC8goK29YzcJrPhPgeXp4+gf7Oc=;
        b=SojVTSepqwLjszPffs/Gz46OeNunFU4+hTb4zElaPzc63B5EVFApyGuaT2PyKInwz8
         Up7LZJsTNu3aTUlo+8akXTUQ0vP1lkjaUFYgmWJTvpp5eNQbZ+F22RNpFfYo7iZC13uL
         6Nxt6S4ugaabVju7jQ+PgPpZqLiuxGvEMVosM3Aw//QFM7ZzFXs3fTo4DHqEY5YGneyz
         OsKzvqk86zHVGMXJxJqAQCF0HpGp6ks8/tHc+CNudr+DSB07G3K5l9zx63OzL/ukSMbr
         g4aM36FX4YBrfLdhzNGgiHeD/fp3/e2tb+wjH0WVzoOpvFb51umn3owhj0Kah3zBt1nD
         72Yg==
X-Forwarded-Encrypted: i=1; AKwUvBzw1mt1FO9It4KobZ0Ros5PWz6NSloc+We0/xE9MY3vJ8nsRiD0cSbCpG4mU1eWfVVlATzVG81CimpTxQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zODJXLvDO2T8IMVUpf/bDjIMavA94W6en5JHnWtIDc/nLK8bV
	Ip/zIHcTpr7RkFw2KjpE8ZTnVCDqhhnN52iB5d2NHUjbQdUS8S07rkbB
X-Gm-Gg: AYBFou1YpNaMmPA5g2IPlIibYRNZM0XG9vxhhIGzoQiV/R4ehnIsHLbgXCITOfPmNPU
	ME6aQi4l3oDeNPH9X8o1UdjgZ1V9IEAYinLmVwOPNA+4F3cosfAGP9gehtFO4U2AIP4IcqW2EKA
	sWZzDQv1BdBBIh9HGU+xsXKCVQ8xrtGS4v5M7syTcCLcyCPQDcPNPUbGVc4gCo/Opy4G+ka1Zu1
	NtvuEk4DZjS2SeW+GLLh6aZ1FhjS50SHNLVFROsuEbJEvFETPOqZuaFsSF8jvEOQBB6yYKzRMes
	3oCvBW6QbmXDakE3EcBJgq1O5bOVHvfi+4zpnkBilWDrBszY3PnXijIQEUMpntYfAF/EeK0ylJo
	57AHDb5XQf0LA8UGyzmYT2boTUNSCJSW6HPSF0OGnBcjL6gLJ8vocV+A3etJMvgWXrgMLqa1Llr
	uyj1GKbyW6YrHcX6RJkAbnd4EdkeHeUhTdMUG6IddRHv3m07XO0dUS3+QGuT7G5Ao6Bhn1BtDNK
	Jv3teRg+0AtNzMOsrAYnb9Ad6EjRX6CNYIFI1ITF5H5fTk0pLjAuFLlktXHlQWdgabJKEOXVQMA
	PYW9tMaP+JUzITEgepH3L4wiucoHMKAO/UORi5m2oNBqZACIl/0pSkGbAXKVyjB7ClY1CEZWc6O
	b+WgUin8DsCzFvUA=
X-Received: by 2002:a05:693c:42d4:b0:361:1dd6:531b with SMTP id 5a478bee46e88-36a42484fa3mr16717584eec.26.1793668476727;
        Mon, 02 Nov 2026 17:14:36 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2602:294:1:b9:a2b::1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a426681aesm51988583eec.1.2026.11.02.17.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 17:14:36 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: samuel.thibault@ens-lyon.org, speakup@linux-speakup.org,
 linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org, chris@the-brannons.com, kirk@reisers.ca,
 w.d.hubbs@gmail.com, stable@vger.kernel.org
Subject:
 [PATCH v3 0/4] speakup: fix hang and use-after-free around synth removal
Date: Tue, 03 Nov 2026 09:14:33 +0800
Message-ID: <179366847311.70545.1738521378158835923@kylinos.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

This series fixes a speakup hang reported when a speakup synth module
is unloaded while its output cannot make progress (e.g. a serial
synth whose port has no consumer on the other end, so the tty write
keeps returning 0).  rmmod then stays stuck in D state forever, and
while the loop holds spk_mutex, any synth module load or sysfs synth
switch hangs the same way.

Patch 1 stops the catch-up loops when the synth is not alive anymore.
Patch 2 takes spk_mutex off the catch_up() call path, and makes
synth_release() drain any in-flight catch_up() before releasing the
synth resources, so loading, unloading and switching are no longer
blocked by speech output, while the synth structures stay valid for
the whole call.  It also guards the wake_up_process(speakup_task)
sites against the kthread not being up (or having failed to be
created) yet, pinning the task_struct with rcu_read_lock() so a
concurrent module exit cannot free it mid-wakeup, and closes the
SPEECH_KILL revival hole: spk_synth_is_alive_restart() could set
synth->alive back to 1 from the unguarded key handler after
synth_release() cleared it, which would make the drain wait forever;
the revival is now serialized against the clearing under
speakup_info.spinlock and skipped for a synth being released.

Patch 3 clears the global speakup_kobj after kobject_put() in both
speakup_kobj_init()'s error path and speakup_kobj_exit(): after a
late failure of a built-in speakup_init() the dangling pointer used
to stay behind, and a later insmod of a synth driver would feed it
to sysfs_create_group(); it now fails cleanly on the NULL check.
The removal side gets the same guard: a synth left set by a failed
do_synth_init() makes a later load go through synth_release(), whose
sysfs_remove_group() would now meet a NULL speakup_kobj and crash;
the group removal is skipped when the kobject is gone.

Patch 4 closes a related hole in the keyboard path:
speakup_key() checks the global synth before taking
speakup_info.spinlock, but do_spkup() and its handlers dereference
it inside the lock while synth_release() clears it under spk_mutex;
a speakup key pressed while the synth is being removed could pass
the unlocked check and oops.  The clear is now serialized against
the locked readers: both NULL clears take speakup_info.spinlock,
and every reader that dereferences synth inside that lock now
rechecks it after acquiring it - do_spkup() at entry, the console
notifier paths after their trylock, do_handle_shift(),
do_handle_spec(), the speakup_key() special-handler dispatch, the
synth_direct sysfs store, and the /dev/synth and /dev/synthu write
paths - so a clear can no longer land between a reader's check
and its dereference.

The races the series covers, and the patch that closes each (the
patches show the CPU0/CPU1 interleavings, before and after):

  R1  SPEECH_KILL revival vs. the release drain          patch 2
  R2  wakeup of a not-yet-created or gone kthread        patch 2
  R3  sysfs_create_group() on a freed kobject            patch 3
  R3' sysfs_remove_group() on a NULL kobject             patch 3
  R4  key path check vs. synth clearing                  patch 4
  R5  console path check vs. synth clearing              patch 4
  R6  catch_up() lifetime during unload/switch           patch 2

Patches 1 and 2 are both needed for the no-room hang: patch 1
provides the loop exit but nothing clears synth->alive in that case,
patch 2 provides the deactivation and the drain.  The drain of
patch 2 relies on the loop exit of patch 1 to terminate, so the
order is required, not merely convenient: without patch 1 first,
patch 2 would trade the spk_mutex hang for a new one inside
wait_event().  Patches 3 and 4 are independent fixes found while
reviewing the init/exit and key paths.

Tested on x86_64 (qemu, speakup + speakup_acntsa on a backpressured
serial port): unload, second synth load and sysfs switch all hang on
the unpatched kernel and complete on the patched one; soft synth
operation and a 30-round insmod/write/rmmod stress loop with
interleaved switches show no regression.  The whole series was also
re-verified with an automated base/fix A/B boot test in QEMU: with a
synth wedged on a stalled tty, rmmod never returns on the unpatched
kernel (hung task reports with the stack pinned in synth_remove),
and returns in all six trials with the series applied, with no oops.

While testing the series I noticed a few preexisting issues that are
NOT addressed here (kept out to keep the series focused, can be
follow-ups if wanted):

- the cursor_done timer callback still dereferences synth inside
  speakup_info.spinlock with no synth check at all; closing it
  needs the cursor_timer lifetime handled against synth teardown
  and is left as a follow-up.

- the serial read buffer handler (synth_readbuf_handler) also
  dereferences synth inside the lock unchecked, but cannot run
  in this tree: its only registration chain goes through
  spk_serial_synth_probe(), which has no callers, and any
  out-of-tree registration is serialized by the free_irq() in
  the serial synth release path, which runs before the in-lock
  clear.  Patch 4 discloses this in its commit message.

- speakup_dtlk.c: synth_flush() and synth_read_tts() spin on
  synth_writable()/synth_readable() with no timeout, so the catch-up
  drain of patch 2 could still wait unboundedly if the DoubleTalk
  hardware stops responding mid-flush.

- do_synth_init() does not roll back on a sysfs_create_group()
  failure (the global synth pointer stays set).  Patch 3 keeps that
  dangling synth from crashing on the kobject side, but the synth is
  still not cleaned up; the follow-up should make that error path
  unwind like the probe failure path does.

Changes in v2 (patch 4 only):

- patch 4: per review, the unlocked synth checks that only
  duplicated the in-lock rechecks are dropped; the only behavior
  difference is that an empty write to /dev/synth or /dev/synthu
  with no synth loaded now returns 0 instead of -ENODEV.  This was
  sent earlier as a single [PATCH v2] reply on the subthread.

Changes in v3:

- no code change; the Reviewed-by tags received from Samuel for all
  four patches are now carried in the commits.

- commit messages trimmed throughout.

Hongyu Xie (4):
  speakup: Stop catch_up when the synth is not alive
  speakup: Do not hold spk_mutex across catch_up()
  speakup: Guard late sysfs operations on speakup_kobj
  speakup: Serialize synth clearing against locked readers

 drivers/accessibility/speakup/devsynth.c      | 13 ++--
 drivers/accessibility/speakup/kobjects.c      | 10 ++-
 drivers/accessibility/speakup/main.c          | 31 +++++++--
 .../accessibility/speakup/speakup_acntpc.c    |  4 ++
 .../accessibility/speakup/speakup_apollo.c    |  4 ++
 .../accessibility/speakup/speakup_decext.c    |  4 ++
 drivers/accessibility/speakup/speakup_decpc.c |  4 ++
 .../accessibility/speakup/speakup_dectlk.c    |  4 ++
 drivers/accessibility/speakup/speakup_dtlk.c  |  4 ++
 drivers/accessibility/speakup/speakup_keypc.c |  4 ++
 drivers/accessibility/speakup/spk_priv.h      |  3 +
 drivers/accessibility/speakup/spk_types.h     |  1 +
 drivers/accessibility/speakup/synth.c         | 69 +++++++++++++++++--
 drivers/accessibility/speakup/thread.c        | 11 ++-
 14 files changed, 146 insertions(+), 20 deletions(-)


base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.32.0

