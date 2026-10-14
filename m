Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568BA411672
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962508; cv=none; b=AIkRiRr6+jUIUu2x2zWkfKMdPin6S7Lr7CDurXBoc16M/rLGY2sOM7nyWEMyStDKOpXDNRwmWW/d2oHdlIz1m9vj/vBuwgj5Clm+ut/yWXmgY1GNQwCFqfOedkoJg8Y0Aw0xpkTWIiDEeY64KtNEk0x5zXNtf/A7Iu59ET9tuC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962508; c=relaxed/simple;
	bh=a8D28j+tYWmYTbkwpWGNm5EGMySgHYXmfAOt5UZamSk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iletfwc33ha+pqcj9KEr5UHfWqAwzl5bkdr841JO+Wn0wBMsQb8nqHJmmv0ZKwuzhw8kfhHGQW7tzn9neV7xWgbRpjf28ddBapF+6RlvPhWDkeE+vtVlOR8PjJ2N1ndFm0v8vAWLuBiSU56iZdPJhjfBqj7ZIah/8U+y3PGsnHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso137392a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962505; x=1792567305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LkTr/mf0OCVBOqxGKMYpXjfImNVy6up2JgYGprNnEo=;
        b=nAG8J9Prj4kY28ffG4scUeMfoYj2+l1eGlMqIEzu1QJhdlhXQdStrERrVgERwuHAtR
         qvW5FScVaaE2ZK/zm/XHYbBlIoImHeMUe55hIGLdEJIhQvKTl6G0oNpt72vjaH8OWUob
         ToHb4hwLCVBs4XDE3+4slUZ12o4ypoYvZLlQNhY9afNbJb9IDWWfP338VypipKt30Zkt
         5Y3RwgCd5edm1oKrdab7dxh0GkrUPm+thUmmv6/FcS/mA/aJqAw8QF7k07NyYj+/9TpO
         b0x/7BVPDYURDTdeHQT33rDTaJCrC9ZAg5Bq9/cxy+zhGP8aIcxlVkJSxSjdvVVo6r+9
         7W0w==
X-Forwarded-Encrypted: i=1; AKwUvByqdkM9P9xnwdDCbjnrDfCqGAG8//Pk4N/A10KNGiKdNfHLshR9izyoZUjviDleEQQ5jawlEPKFRrEnYvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQOO+URyDZD+TsOLOZ/sM5Wfr7YV0tNzMOVfHYMotO5x7MLgqb
	GR+hR15ocJnN0d+1oXoWBIk2aTOEhdlIdZUPx7AsSrXNhvwI8KxN/j4s
X-Gm-Gg: AYBFou0Jsr/83celOMOPHQiCT8bJgYfvKK2WT3CTQF5PE20JQgcDzNVathB0HzT/gzq
	1NUOsRx6yQA0N3ZN2zjwztxQ/hm3uYGuyXXIHhCpAA0GPQeA5NA8FydfbGWYI5ZCg7WNluu6UNo
	luLZDgcss/c7AY2pUCsQmXTa7EBULfheeGV8iTe87fy5E6MxEBwIYyCJLYd1VhfIK8y3NbMBs9S
	OYT/GdNhxqrUBYeeKHhhNzrVrSC0A93Q+VI/g2deaCrznTOZXR4jMhRnGTIBojgjt+gIFtHSFqp
	50xasZIsL57ey0+jK9iXaxThl3mAhA2rSQtkfIpo+PtN/B5VtjvGaia6oW1SAhHG9z1BZcIglyT
	M3mSgtesaaUQ+NjOy/iWeqGs66b4hbq/TQL8tBMjq5qkNhQOXraoEWV/NQoBIC0OXwU7FXtCagl
	dv71MY9Z1lIC5Gd/H0agD1h7hmw0dHqSJK9WXqUu9TzfVxtyBtZ1HsT3NBgqgCBQ22sYK4+Xj4x
	vCWQmhq46s/vkQ=
X-Received: by 2002:a17:90b:570e:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3ab3a90e564mr10018303a91.18.1791962505099;
        Wed, 14 Oct 2026 00:21:45 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac604b2f7csm2997758a91.10.2026.10.14.00.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:21:44 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: samuel.thibault@ens-lyon.org,
	speakup@linux-speakup.org,
	linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	chris@the-brannons.com,
	kirk@reisers.ca,
	w.d.hubbs@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 0/4] speakup: fix hang and use-after-free around synth removal
Date: Wed, 14 Oct 2026 15:17:09 +0800
Message-Id: <20261014071713.321914-1-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
interleaved switches show no regression.  The four-patch version
re-ran the same matrix with identical results, and so did the
version extending the in-lock rechecks to the six remaining
reader sites.

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


Hongyu Xie (4):
  speakup: Stop catch_up when the synth is not alive
  speakup: Do not hold spk_mutex across catch_up()
  speakup: Guard late sysfs operations on speakup_kobj
  speakup: Serialize synth clearing against locked readers

 drivers/accessibility/speakup/devsynth.c      |  8 +++
 drivers/accessibility/speakup/kobjects.c      |  7 ++
 drivers/accessibility/speakup/main.c          | 20 ++++++
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
 14 files changed, 142 insertions(+), 5 deletions(-)

-- 
2.25.1

