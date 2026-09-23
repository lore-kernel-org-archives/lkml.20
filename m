Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C599481FA3;
	Wed, 23 Sep 2026 10:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159516; cv=none; b=Zn3L81y84/tcRlMsAUcfUPk1ux31gfoj5DBUn+p5Sfwjw/69soGVhmgq2XvMsB/O0ZYgCD3cv1UpIbUYQ3NEw6VV6Pe/gs1CO4oamSJmSy+DqHsBquwOmxXvCisEzK8SGhoR9whH7aNI3VH3h/mPXYt9q05Fe8paJYMdBmAaAW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159516; c=relaxed/simple;
	bh=uYAgUWmDkt5tAnRAdtuAjtEyDUTVXyouusjoTlEzuDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KFaqp4OZIkwsE2VMRJeSLDt7LkX4ak4hzIY3cB0L5dsIg8BcCg15hbuRPgypQH1+dL51+ITODECgtQduH9nOsrMLCCWSJ4An+owejy9LgduJEW9aE/8+YK9csa56hJoitGLOzZrdMBGseDl4M8aK1ueqILmxRaNu4oL57q4ZxP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn; spf=pass smtp.mailfrom=stu.xidian.edu.cn; dkim=fail (0-bit key) header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.b=Q1xUV2Ua reason="key not found in DNS"; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=stu.xidian.edu.cn header.i=@stu.xidian.edu.cn header.b="Q1xUV2Ua"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=aN5+hXQh4QAljOgcLU7EeBC/zT8rIgkY33kRX/5zcK8=; b=Q1xUV2UaPWzYU
	riUTrPkT/+IzbT8FUcdCiImLmPJ7KweeqOf9x8ZoaG2yfoqv1PmgANNcmkmGBl64
	X4Jx7wc2g/8NN5PFZmgcrKnO7Biy1y88lU5WbUQIcebgG2l4Y60xW6zWHph4bYPY
	lO584olAPL8F38Qs/HYGtHPJkRX1w8=
Received: from localhost.localdomain (unknown [113.200.174.5])
	by hzbj-edu-front-2.icoremail.net (Coremail) with SMTP id BLQMCkCmK9qEqrNqdiYZAA--.17422S2;
	Wed, 23 Sep 2026 18:31:34 +0800 (CST)
From: Yuanzhe Liu <25031212351@stu.xidian.edu.cn>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuanzhe Liu <25031212351@stu.xidian.edu.cn>
Subject: [PATCH 0/1] ALSA: bcd2000: fix use-after-free of MIDI URBs on disconnect
Date: Wed, 23 Sep 2026 18:31:15 +0800
Message-ID: <20260923103116.1666-1-25031212351@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.45.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:BLQMCkCmK9qEqrNqdiYZAA--.17422S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF48Ww4rtrW5ur4rAFy8uFg_yoWrCrWrpF
	WftrW7Ar1UZr9I9r42yF1kWr1Fyan7Aa4UurySq34FvFy5Zw17JF4xtFyruFW5CFy8J34Y
	yF1DJay3WFs8CwUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8twCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUDKs8UUUUU=
X-CM-SenderInfo: ysvqjiysrsjkur6v33wo0lvxldqovvfxof0/1tbiAgUFD2qyxZua4gACsx

Hi,

this single-patch series addresses a slab-use-after-free in the
snd-bcd2000 driver, observed on a Behringer BCD2000 USB DJ controller
under a KASAN-enabled kernel (7.1.2, x86_64, CONFIG_SND_BCD2000=y).

Root-cause walkthrough
----------------------

The bug is a lifetime mismatch between driver disconnect and ALSA rawmidi
file lifetime:

1. A userspace process (e.g. amidi) opens /dev/snd/midiC0D0.
2. The USB interface is unbound (via USBDEVFS_DISCONNECT ioctl or physical
   unplug).
3. bcd2000_disconnect() runs:
     snd_card_disconnect(bcd2k->card);
     bcd2000_free_usb_related_resources(bcd2k, interface);
   snd_card_disconnect() only marks the card disconnected and stops new
   opens, but returns immediately while open file descriptors still exist.
   bcd2000_free_usb_related_resources() proceeds to free both
   bcd2k->midi_out_urb and bcd2k->midi_in_urb via usb_free_urb().
4. Later, the process closes the rawmidi fd (or exits):
     snd_rawmidi_release -> close_substream -> bcd2000_midi_output_close()
   Because bcd2k->midi_out_active was set (and left set by completion
   re-submissions), bcd2000_midi_output_close() calls
   usb_kill_urb(bcd2k->midi_out_urb), reading the already-freed URB
   object (slab-use-after-free at urb->dev).

Patch summary
-------------

Patch 1 fixes the bug via two complementary changes:

 - Switch snd_card_disconnect() to snd_card_disconnect_sync(), which
   waits for all open card files to be closed before returning. The
   rawmidi close callbacks (and their usb_kill_urb()) run while the URBs
   are still valid. devices_mutex held during disconnect is not taken by
   rawmidi close, so the wait cannot deadlock.

 - Add an atomic shutdown flag set at the beginning of disconnect and
   checked in bcd2000_midi_send() and both URB completions, preventing
   URBs from being re-submitted after disconnect. Also NULL the URB
   pointers after usb_free_urb() so any stray access becomes an
   immediate NULL dereference rather than a silent UAF.

Crash report addressed
----------------------

  Report 1: slab-use-after-free in usb_kill_urb (read of size 8 at urb->dev,
            sound/usb/bcd2000/bcd2000.c:182 <- sound/core/rawmidi.c:560).
            Condensed splat appended below the diffstat.

Yuanzhe Liu (1):
  ALSA: bcd2000: fix use-after-free of MIDI URBs on file close after
    disconnect

 sound/usb/bcd2000/bcd2000.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

--
Crash excerpt:

  BUG: KASAN: slab-use-after-free in usb_kill_urb+0x74/0x80 drivers/usb/core/urb.c:706
  Read of size 8 at addr ffff8880078e7d40 by task amidi/30287

  Call Trace:
   usb_kill_urb+0x74/0x80 drivers/usb/core/urb.c:706
   bcd2000_midi_output_close+0xd4/0x140 sound/usb/bcd2000/bcd2000.c:182
   close_substream.part.0+0x15f/0x8d0 sound/core/rawmidi.c:560
   close_substream sound/core/rawmidi.c:585 [inline]
   rawmidi_release_priv+0x21d/0x290 sound/core/rawmidi.c:580
   snd_rawmidi_release+0x4e/0xa0 sound/core/rawmidi.c:610
   __fput+0x3a6/0xac0 fs/file_table.c:510
   task_work_run+0x158/0x220 kernel/task_work.c:233
   do_exit+0x87b/0x22d0 kernel/exit.c:976

  Allocated by task 34:
   usb_alloc_urb+0x67/0x190 drivers/usb/core/urb.c:75
   bcd2000_init_midi sound/usb/bcd2000/bcd2000.c:319 [inline]
   bcd2000_probe+0x5a0/0x1350 sound/usb/bcd2000/bcd2000.c:401
   usb_probe_interface+0x395/0x850 drivers/usb/core/driver.c:396

  Freed by task 30294:
   usb_free_urb+0xbb/0x100 drivers/usb/core/urb.c:96
   bcd2000_free_usb_related_resources sound/usb/bcd2000/bcd2000.c:354 [inline]
   bcd2000_disconnect+0xfc/0x280 sound/usb/bcd2000/bcd2000.c:433
   usb_unbind_interface+0x188/0x770 drivers/usb/core/driver.c:458
   usb_driver_release_interface+0x105/0x180 drivers/usb/core/driver.c:640
   proc_ioctl drivers/usb/core/devio.c:2359 [inline]
   usbdev_ioctl+0x6f05/0x86d0 drivers/usb/core/devio.c:2826

  The buggy address belongs to the object at ffff8880078e7d00
   which belongs to the cache kmalloc-192 of size 192
  The buggy address is located 64 bytes inside of
   freed 192-byte region [ffff8880078e7d00, ffff8880078e7dc0)

