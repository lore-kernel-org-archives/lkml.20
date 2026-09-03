Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8234334A9;
	Thu,  3 Sep 2026 09:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428698; cv=none; b=UdGdPsq23BjfYs8bA80KZJoA5GPACk4dYmXLUd267Vh5hh49DIURQcv4oOOOF7LK/5H9LHBnEQYIns/Z6asGRHk3m8Ub06PEEH3HXksdOUcTCCnKvX7afXS3XMTl57jZBT80bWmX0dMMe4cbUEWMa+VhNOqHDZFlhKpPlADGDoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428698; c=relaxed/simple;
	bh=1HcaO00vdh7fbIN8UIVc1AZzdZeIJ5kFG2af2++MRL4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uSub1RQOQSk4abFAZJNE8E+fN4IeMOEFMih17/Nr8h4DAFKeyAUaUJ1OE5Td/Rd9aXUv8AYc07bdocKkmJCrsTrmE1KaXzK1fzKIaM+S+kdoq8z9U5zVbg980FWPGJ+Q7kvuLnLGWY6At9TfYZaE9R2UXJG/RIKkW6JhospcRVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vpp16Fxp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Q4O1r6H+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mO1Doftg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aUKhck05; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vpp16Fxp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Q4O1r6H+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mO1Doftg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aUKhck05"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EBC4B21ECC;
	Thu,  3 Sep 2026 09:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788428690; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A3/wSTW1MhRqb806sXDSM4CH0tyIBJp1UTl32VjE50Y=;
	b=Vpp16FxpaYh9cMqbiVuk3ZEB4YRRwahYr4XA1DsPf1TuXM5+ImngDjdFhHCmOS4kwBMks6
	TZMnNkxEvL6qg8ROPNg8Ne+E72vayP8v5gvFF2obht1jjM6okM8HFKWI1M4Fw/2Vm09wu0
	kvd6GrWxtsDEIsX1E/e5hFNyD09nIMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788428690;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A3/wSTW1MhRqb806sXDSM4CH0tyIBJp1UTl32VjE50Y=;
	b=Q4O1r6H+KJmjd/XMqznRwGUYrFDB7tpoV5Pp5cSduTxdhCSW0sSigsfAl2muQoopFVvu0/
	GvV6x7ooljz6CMCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788428686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A3/wSTW1MhRqb806sXDSM4CH0tyIBJp1UTl32VjE50Y=;
	b=mO1DoftgFbMWQjYSWGkH07FqWGhAHnck/MQofpUODk7GM0rKBMCbwfHzp1LPgBdmttIgaC
	41v39VeFedb9lisPSa7q5fULiN/OUOcBidD8WfN+neRgVs2WUga9cImvPMb/UUNZ8MZcXO
	6SIJhRrCtw93Ifh/0d3sdbzXGHOLguw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788428686;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A3/wSTW1MhRqb806sXDSM4CH0tyIBJp1UTl32VjE50Y=;
	b=aUKhck05NIf3I9tJmQrlrIGwiekW0x7vxbquiBx7HgV6o4ej3EFtjcji2p+Fd0ELF07Ap6
	JKa0FyhtBu4skBBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 871A513738;
	Thu,  3 Sep 2026 09:44:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VAHIH41BmWrSdAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Sep 2026 09:44:45 +0000
Date: Thu, 03 Sep 2026 11:44:45 +0200
Message-ID: <87o6ee8y9e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: syzbot <syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com>,
	bolewara@gmail.com,
	devnull@kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mchehab@kernel.org,
	syzkaller-bugs@googlegroups.com,
	Daniel Mack <zonque@gmail.com>,
	Takashi
 Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Write in usb_free_urb
In-Reply-To: <20260903112417.21b76017.michal.pecio@gmail.com>
References: <6a6e9502.f794c993.27aeb.0018.GAE@google.com>
	<6a97af8d.27a413cd.1e878c.0004.GAE@google.com>
	<20260903112417.21b76017.michal.pecio@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -0.80
X-Spam-Level: 
X-Spamd-Result: default: False [-0.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	URI_HIDDEN_PATH(1.00)[https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[832ce9fa3face1b7d44d];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[syzkaller.appspotmail.com,gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,googlegroups.com,suse.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,storage.googleapis.com:url,appspotmail.com:email,syzkaller.appspot.com:url,imap1.dmz-prg2.suse.org:helo];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Spam-Flag: NO

On Thu, 03 Sep 2026 11:24:17 +0200,
Michal Pecio wrote:
> 
> On Tue, 01 Sep 2026 22:09:33 -0700, syzbot wrote:
> > syzbot has found a reproducer for the following issue on:
> > 
> > HEAD commit:    786262be6048 Merge tag 'edac_updates_for_v7.3_rc2' of git:..
> > git tree:       upstream
> > console+strace: https://syzkaller.appspot.com/x/log.txt?x=12a28125580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=b454dc6b1b7acd30
> > dashboard link: https://syzkaller.appspot.com/bug?extid=832ce9fa3face1b7d44d
> > compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1735af79580000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=135b7f79580000
> > 
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/c3e528ebf709/disk-786262be.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/46f3418d2828/vmlinux-786262be.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/60ab8a27c4f7/bzImage-786262be.xz
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+832ce9fa3face1b7d44d@syzkaller.appspotmail.com
> > 
> > usb 1-1: received EP1 urb->status = -2
> > ==================================================================
> > BUG: KASAN: slab-use-after-free in instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
> > BUG: KASAN: slab-use-after-free in atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
> > BUG: KASAN: slab-use-after-free in __refcount_sub_and_test include/linux/refcount.h:389 [inline]
> > BUG: KASAN: slab-use-after-free in __refcount_dec_and_test include/linux/refcount.h:432 [inline]
> > BUG: KASAN: slab-use-after-free in refcount_dec_and_test include/linux/refcount.h:450 [inline]
> > BUG: KASAN: slab-use-after-free in kref_put include/linux/kref.h:64 [inline]
> > BUG: KASAN: slab-use-after-free in usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
> > Write of size 4 at addr ffff88803cee1050 by task ktimers/1/29
> > 
> > CPU: 1 UID: 0 PID: 29 Comm: ktimers/1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
> > Call Trace:
> >  <TASK>
> >  dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
> >  print_address_description+0x55/0x1e0 mm/kasan/report.c:378
> >  print_report+0x58/0x70 mm/kasan/report.c:482
> >  kasan_report+0x117/0x150 mm/kasan/report.c:595
> >  check_region_inline mm/kasan/generic.c:-1 [inline]
> >  kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
> >  instrument_atomic_read_write include/linux/instrumented.h:112 [inline]
> >  atomic_fetch_sub_release include/linux/atomic/atomic-instrumented.h:400 [inline]
> >  __refcount_sub_and_test include/linux/refcount.h:389 [inline]
> >  __refcount_dec_and_test include/linux/refcount.h:432 [inline]
> >  refcount_dec_and_test include/linux/refcount.h:450 [inline]
> >  kref_put include/linux/kref.h:64 [inline]
> >  usb_free_urb+0x24/0x120 drivers/usb/core/urb.c:96
> >  dummy_timer+0xaac/0x4d50 drivers/usb/gadget/udc/dummy_hcd.c:2019
> >  __run_hrtimer kernel/time/hrtimer.c:2067 [inline]
> >  __hrtimer_run_queues+0x3eb/0xaf0 kernel/time/hrtimer.c:2124
> >  hrtimer_run_softirq+0x1e1/0x2e0 kernel/time/hrtimer.c:2141
> >  handle_softirqs+0x1da/0x6d0 kernel/softirq.c:645
> >  __do_softirq kernel/softirq.c:679 [inline]
> >  run_ktimerd+0x6a/0x100 kernel/softirq.c:1183
> >  smpboot_thread_fn+0x565/0xa70 kernel/smpboot.c:160
> >  kthread+0x38b/0x470 kernel/kthread.c:436
> >  ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
> >  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> >  </TASK>
> 
> [Adding sound people]
> 
> So what happens here is that USB core continues to use a URB after
> completion to implement things like usb_kill_urb(), so URBs are
> reference counted. Then core decrements the count - one more use.
> 
> If a driver waits for completion or even usb_kill_urb() to return
> and then proceeds to free the URB's storage, this becomes a UAF.
> This driver embeds 2 URBs in its priv and does just that.
> 
> A URB can only exist as an independent allocation, core will free
> it if upon finding zero reference count in such case.
> 
> This is a mechanical conversion, untested. I don't have the HW.

This should work, and we've received another similar patch submission
already.

So, IIUC, now the URB *must* be always allocated via usb_alloc_urb()
and an embedded URB isn't allowed?  If so, we'd need to address other
drivers, too.


thanks,

Takashi
