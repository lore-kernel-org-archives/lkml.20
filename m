Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAD043F0B3;
	Mon, 31 Aug 2026 16:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192840; cv=none; b=nLnMonHxjv3VI/jwrrpIjRdAbu517GqyZyQC4QizIstiSnT4O6Ll9EdiMKdB0ErgPsA4os/801xSqxGIllzeP3il/0bkwUKNwdhiQIquL2g5VtmrIjsUs0xyd+ci9wEPRAXkbtDnuGzyG1hMwUVrz6Xff+zEg0KuBKT1FdLnBGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192840; c=relaxed/simple;
	bh=T5M7LVgEkCt809db0CpDFRJbrBhjE8+1x31eHD12gbo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sy1Me0BFrOPddkjpjXjAnbBCIWah2XU7kqgauNfDDuCbKL+rpSZ7N/XbepfEDVEudnTZakENSXha+oIOz0yrXmrkuSU/ojPkvcrqTNSY5n4XGvSkCOcjjWfVMvumqVrZYbXjKo6Le48kMrNSZzvNLBFCekszqJptldSpvrWYm1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=g71aVwJD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OxZ5+B3O; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=slJVCh+i; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xskLf8Xo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="g71aVwJD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OxZ5+B3O";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="slJVCh+i";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xskLf8Xo"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 802C12251D;
	Mon, 31 Aug 2026 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788192832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZrkzXJZNjHYcvsPHtKCbQID7q51joD+l1DUBKm8+nU=;
	b=g71aVwJDQL2NCmw6tenobjlyUfd5K/k2K929stmloUnbrEFRxT2ypKqwehYflheKdgKhm+
	xZMbe3X+twqtwbNafEWWVaqq4leDPI1wz+3O3kCJODOmv7Zmi2aYDgsK8ZOWcxNPzF3HFC
	BV4ufcMThZ81IhVndlfTwlAqcSHpb6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788192832;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZrkzXJZNjHYcvsPHtKCbQID7q51joD+l1DUBKm8+nU=;
	b=OxZ5+B3OcVAoQJPoX80MK3XyQ3d2H/QnFcgpJSx2ktbyhnFh1XKBRTjE105qyXw8MZDo6k
	sig46nB3ibb6u4DA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=slJVCh+i;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xskLf8Xo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788192828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZrkzXJZNjHYcvsPHtKCbQID7q51joD+l1DUBKm8+nU=;
	b=slJVCh+iX/jCaocpfmG3f2aFqf0xFyren1ijXcJMDZIuX8O+TPUxrHRe5JBQEMufceN8LY
	YXw2qKMLAu3zWc7Wy9h5ZaMZnx6k+q4wpEF5YN+rE9/4dyUsQhPV5XbrEOt75Xkqfo7TmH
	G/Qdx6QkSp6sYmfY6fBSSGZNnAtnA/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788192828;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZrkzXJZNjHYcvsPHtKCbQID7q51joD+l1DUBKm8+nU=;
	b=xskLf8XoZeFLSjKjGJDniaA0pa/74DRiLyymy6kbmTlf491VUjX6hSD7/nTYJ6BcBDV7a5
	Nm4kKZiKBYPhmsBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 349AD13515;
	Mon, 31 Aug 2026 16:13:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G+lOCzyolWo2ZQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 31 Aug 2026 16:13:48 +0000
Date: Mon, 31 Aug 2026 18:13:47 +0200
Message-ID: <874igafetg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: syzbot <syzbot+919c31c248e8a37b89d1@syzkaller.appspotmail.com>
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	tglx@kernel.org
Subject: Re: [syzbot] [sound?] BUG: scheduling while atomic in drain_urb_queue
In-Reply-To: <6a91b49c.1d9ded08.62e62.00f1.GAE@google.com>
References: <6a8a5f45.ae6ddae5.3da009.005f.GAE@google.com>
	<6a91b49c.1d9ded08.62e62.00f1.GAE@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 802C12251D
X-Spamd-Result: default: False [-1.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=19560cab9a915237];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,suse.de:dkim,suse.de:mid,appspotmail.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[919c31c248e8a37b89d1];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -1.01

On Fri, 28 Aug 2026 18:17:32 +0200,
syzbot wrote:
> 
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    1b78070aaef6 Merge tag 'net-7.3-rc1' of git://git.kernel.o..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=13016d79580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=19560cab9a915237
> dashboard link: https://syzkaller.appspot.com/bug?extid=919c31c248e8a37b89d1
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=162add79580000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+919c31c248e8a37b89d1@syzkaller.appspotmail.com
> 
> usb 33-1: config 1 interface 0 altsetting 1 bulk endpoint 0x1 has invalid maxpacket 64
> usb 33-1: config 1 interface 0 altsetting 1 bulk endpoint 0x82 has invalid maxpacket 64
> usb 33-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> BUG: scheduling while atomic: kworker/0:0/9/0x00010001
> locks held by kworker/0:0/9: 7, on CPU#0:
>  #0: ffff888023287940 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3362
>  #1: ffffc900000e7d08 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3363
>  #2: ffff88802c0c21d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
>  #2: ffff88802c0c21d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x1bb/0x4420 drivers/usb/core/hub.c:5912
>  #3: ffff888023ae91d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
>  #3: ffff888023ae91d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1073
>  #4: ffff8880348291a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
>  #4: ffff8880348291a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x7e/0x4d0 drivers/base/dd.c:1073
>  #5: ffffffff90bc96c0 (register_mutex#6){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
>  #5: ffffffff90bc96c0 (register_mutex#6){+.+.}-{4:4}, at: usb_audio_probe+0x385/0x3b10 sound/usb/card.c:985
>  #6: ffff8880268bc160 (&rmidi->open_mutex){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:253 [inline]
>  #6: ffff8880268bc160 (&rmidi->open_mutex){+.+.}-{4:4}, at: rawmidi_release_priv+0x45/0x280 sound/core/rawmidi.c:574
> Modules linked in:
> Preemption disabled at:
> [<ffffffff8bcf4ceb>] __mutex_lock_common kernel/locking/mutex.c:645 [inline]
> [<ffffffff8bcf4ceb>] __mutex_lock+0x17b/0x1bc0 kernel/locking/mutex.c:821
> Kernel panic - not syncing: scheduling while atomic: panic_on_warn set ...
> CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted syzkaller #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/05/2026
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
>  vpanic+0x553/0x970 kernel/panic.c:651
>  panic+0xd1/0xe0 kernel/panic.c:788
>  check_panic_on_warn kernel/panic.c:525 [inline]
>  check_panic_on_warn.cold+0x19/0x34 kernel/panic.c:520
>  __schedule_bug.cold+0xc4/0xf4 kernel/sched/core.c:6076
>  schedule_debug kernel/sched/core.c:6105 [inline]
>  __schedule+0x4066/0x6920 kernel/sched/core.c:7119
>  __schedule_loop kernel/sched/core.c:7347 [inline]
>  schedule+0xdd/0x2c0 kernel/sched/core.c:7362
>  schedule_timeout+0x127/0x280 kernel/time/sleep_timeout.c:99
>  drain_urb_queue.part.0+0x303/0x470 sound/usb/midi2.c:246
>  drain_urb_queue sound/usb/midi2.c:242 [inline]
>  snd_usb_midi_v2_drain+0x79/0xb0 sound/usb/midi2.c:383
>  snd_ump_rawmidi_drain+0x85/0xb0 sound/core/ump.c:294
>  snd_rawmidi_drain_output+0x3b3/0x880 sound/core/rawmidi.c:282
>  close_substream.part.0+0x3eb/0x860 sound/core/rawmidi.c:551
>  close_substream include/linux/mutex.h:253 [inline]
>  rawmidi_release_priv+0x210/0x280 sound/core/rawmidi.c:580
>  snd_rawmidi_kernel_release+0x3a/0xd0 sound/core/rawmidi.c:596
>  ump_request_close sound/core/ump.c:623 [inline]
>  snd_ump_parse_endpoint+0x15f/0xb00 sound/core/ump.c:1135
>  parse_ump_endpoints sound/usb/midi2.c:810 [inline]
>  snd_usb_midi_v2_create+0x1b97/0x4070 sound/usb/midi2.c:1158
>  snd_usb_create_quirk+0xad/0xf0 sound/usb/quirks.c:544
>  usb_audio_probe+0x96e/0x3b10 sound/usb/card.c:1058
>  usb_probe_interface+0x386/0x9b0 drivers/usb/core/driver.c:399
>  call_driver_probe drivers/base/dd.c:628 [inline]
>  really_probe+0x241/0xa60 drivers/base/dd.c:706
>  __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
>  driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
>  __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
>  bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
>  __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
>  device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
>  bus_probe_device+0x64/0x160 drivers/base/bus.c:620
>  device_add+0x121d/0x1970 drivers/base/core.c:3776
>  usb_set_configuration+0xd97/0x1c60 drivers/usb/core/message.c:2268
>  usb_generic_driver_probe+0xa1/0xe0 drivers/usb/core/generic.c:250
>  usb_probe_device+0xef/0x400 drivers/usb/core/driver.c:293
>  call_driver_probe drivers/base/dd.c:628 [inline]
>  really_probe+0x241/0xa60 drivers/base/dd.c:706
>  __driver_probe_device+0x210/0x460 drivers/base/dd.c:868
>  driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
>  __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
>  bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
>  __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
>  device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
>  bus_probe_device+0x64/0x160 drivers/base/bus.c:620
>  device_add+0x121d/0x1970 drivers/base/core.c:3776
>  usb_new_device.part.0+0xcc2/0x1686 drivers/usb/core/hub.c:2708
>  usb_new_device include/linux/workqueue.h:715 [inline]
>  hub_port_connect drivers/usb/core/hub.c:5580 [inline]
>  hub_port_connect_change drivers/usb/core/hub.c:5720 [inline]
>  port_event drivers/usb/core/hub.c:5884 [inline]
>  hub_event.cold+0x1e3/0xe90 drivers/usb/core/hub.c:5966
>  process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
>  process_scheduled_works kernel/workqueue.c:3470 [inline]
>  worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
>  kthread+0x373/0x450 kernel/kthread.c:436
>  ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
> Kernel Offset: disabled
> Rebooting in 86400 seconds..
> 
> 
> ---
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.

#syz fix: locking: Revert switching guards to _irq_{disable,enable}()


This looks like a temporary breakage after the commit 1b0866874833.
I verified locally 7.3-rc1 release fixed the crash.


Takashi
