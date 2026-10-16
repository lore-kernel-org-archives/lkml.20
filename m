Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9E03CF962;
	Fri, 16 Oct 2026 08:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138937; cv=none; b=bU/YluBDpAG+7lCyn/kf2KNuipHFye+qQdYjEX+VBmU2xzdeJrB8tGNIxPLJScHvKU43cM55Br1QXqQkvr752c8a9IhDlTXl5TAZ9b5SZkdhCZqwPkIPYqqaITYtlu3HQ18cYpsmR7JkJf6gOCxam8SvyTiuKvIHT0O5M3rK76E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138937; c=relaxed/simple;
	bh=hOPVGV7A4RiM0PZUR5h68U13Qbe4+jj32LP5STU5ldE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aOfcBkr2FBwGYhhAuD5de/9h7/OPLW2wEOTHKDLZOdj+DrBr4Os3Zu5fc0F+sVMyFySmfkSeDZKXmIZXRpIhETs0XznT5ha0ChS5X51aOi3tHuos1jMCzvQK+pzSagYX7uOqmXKcMEwG17YgVTT2wNkaLKOIJ700q5trXV5N0m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X4hjkZOg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NXNjLszw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X4hjkZOg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NXNjLszw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X4hjkZOg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NXNjLszw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X4hjkZOg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NXNjLszw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9B60821C68;
	Fri, 16 Oct 2026 08:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792138933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0gi0Ulp6aU8DkHVEPmeCTB3ZWzwfTYIs7clhzBHpum0=;
	b=X4hjkZOgBZeMitxLWeftKsk39tVe1BuziWJsozjZ+I04dutL9F6WvNvM6qb6IBXT89rD/e
	vVBZu+MtI3+cJoUmpuhL7yQX9w4xTKS1GdOiRYyp3vdBJeCTzL7mnx6ZQgy/78E1r5h7+U
	eol3Hpieffe3WZ3cYxT2wU3HuL6Eh/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792138933;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0gi0Ulp6aU8DkHVEPmeCTB3ZWzwfTYIs7clhzBHpum0=;
	b=NXNjLszwNWz9NOE6BO8YH8i3cZOPwGa8XIlPaEUGT7einnLptNgj42THXpHQx2fg2OAApr
	RiPWhZgnauem/OCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=X4hjkZOg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NXNjLszw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792138933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0gi0Ulp6aU8DkHVEPmeCTB3ZWzwfTYIs7clhzBHpum0=;
	b=X4hjkZOgBZeMitxLWeftKsk39tVe1BuziWJsozjZ+I04dutL9F6WvNvM6qb6IBXT89rD/e
	vVBZu+MtI3+cJoUmpuhL7yQX9w4xTKS1GdOiRYyp3vdBJeCTzL7mnx6ZQgy/78E1r5h7+U
	eol3Hpieffe3WZ3cYxT2wU3HuL6Eh/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792138933;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0gi0Ulp6aU8DkHVEPmeCTB3ZWzwfTYIs7clhzBHpum0=;
	b=NXNjLszwNWz9NOE6BO8YH8i3cZOPwGa8XIlPaEUGT7einnLptNgj42THXpHQx2fg2OAApr
	RiPWhZgnauem/OCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4A1A31339F;
	Fri, 16 Oct 2026 08:22:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XVSMCLXe0WqSVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Oct 2026 08:22:13 +0000
Date: Fri, 16 Oct 2026 10:22:12 +0200
Message-ID: <87ld7y5a2z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: seq: oss: Ignore sync echoes without a write queue
In-Reply-To: <pm-pmb-3634251be738461947da-v2-64371e8c8d6cbf6956a3@gmail.com>
References: <pm-pmb-3634251be738461947da-v2-64371e8c8d6cbf6956a3@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Rspamd-Queue-Id: 9B60821C68
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Fri, 16 Oct 2026 04:17:58 +0200,
Cen Zhang wrote:
> 
> The sync-echo callback needs a write queue before it can wake up a
> synchronizing writer. However, snd_seq_oss_open() publishes the session's
> port with snd_seq_oss_event_input() as its callback before allocating
> and assigning dp->writeq.
> 
> A kernel caller using snd_seq_kernel_client_dispatch() with the OSS
> client ID can deliver an ECHO containing SEQ_SYNCTIMER to this port
> before the write queue is assigned. The helper stamps the supplied
> client ID into the event, so the callback's source-client check accepts
> it. Regular userspace events carry their own client ID and are rejected.
> 
> The failing ordering is:
> 
>     OSS open                          Kernel direct dispatch
>     --------                          ----------------------
>     Zero-allocate dp
>     Set dp->cseq
>     Publish callback port
>                                       Dispatch ECHO as the OSS client
>                                       Look up and pin that port
>                                       Enter snd_seq_oss_event_input()
>                                       Pass NULL to writeq_wakeup()
>     Allocate and assign dp->writeq
> 
> Dispatch reaches the callback after port publication and before the
> queue assignment. OSS register_mutex serializes open and release, but
> direct dispatch does not take it. The port use reference keeps dp alive
> through the callback; it does not wait for constructor initialization.
> The wakeup helper therefore attempts to acquire sync_lock through a
> NULL queue pointer, causing a fault.
> 
> Sample dp->writeq once in the SEQ_SYNCTIMER branch and ignore the echo
> when the queue is absent, matching the adjacent read-queue check. Pass
> the checked pointer to the wakeup helper so a NULL sample cannot reach
> the lock access. The existing port reference protects the queue's
> lifetime through this call, since port deletion drains callbacks before
> free_devinfo() frees the queue.
> 
> KASAN report as below:
> 
>     Oops: general protection fault, probably for non-canonical address 0xdffffc000000000d: 0000 [#1] SMP KASAN NOPTI
>     KASAN: null-ptr-deref in range [0x0000000000000068-0x000000000000006f]
>     CPU: 2 UID: 0 PID: 69 Comm: kworker/2:1 Tainted: G        W           7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
>     Tainted: [W]=WARN
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     Workqueue: events pmbd_dispatch_early_sync_echo
>     RIP: 0010:do_raw_spin_lock+0x71/0x270
>     Code: d0 60 81 49 8d 14 04 c7 02 f1 f1 f1 f1 c7 42 04 04 f3 f3 f3 65 48 8b 15 05 df 88 09 48 89 54 24 60 31 d2 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 b9
>     RSP: 0018:ffff88810450f878 EFLAGS: 00010013
>     RAX: dffffc0000000000 RBX: 0000000000000068 RCX: 0000000000000000
>     RDX: 000000000000000d RSI: 0000000000000000 RDI: 000000000000006c
>     RBP: 0000000000000293 R08: 0000000000000001 R09: 0000000000000000
>     R10: ffffffff8940fe57 R11: 0000000000000000 R12: 1ffff110208a1f10
>     R13: 0000000000000068 R14: 0000000000000001 R15: ffff88810450fbee
>     FS:  0000000000000000(0000) GS:ffff8881fd885000(0000) knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 00000000006d2890 CR3: 0000000106cbf002 CR4: 0000000000770ef0
>     PKRU: 55555554
>     Call Trace:
>      <TASK>
>      ? pmbd_probe_hit_cookie+0xee/0x1c0
>      ? __pfx_do_raw_spin_lock+0x10/0x10
>      ? lock_acquire+0x2b8/0x2f0
>      ? __pfx_pmbd_probe_hit_cookie+0x10/0x10
>      _raw_spin_lock_irqsave+0x44/0x60
>      ? snd_seq_oss_writeq_wakeup+0x30/0xf0
>      snd_seq_oss_writeq_wakeup+0x30/0xf0
>      snd_seq_oss_event_input+0x1e4/0x2a0
>      ? do_raw_read_unlock+0x49/0xe0
>      ? __pfx_snd_seq_oss_event_input+0x10/0x10
>      __snd_seq_deliver_single_event+0x105/0x1a0
>      ? snd_seq_port_use_ptr+0x111/0x170
>      snd_seq_deliver_single_event+0x2fc/0x770
>      ? __pfx_snd_seq_deliver_single_event+0x10/0x10
>      ? __pfx_pmbd_hold_maybe+0x10/0x10
>      snd_seq_deliver_event+0x45a/0x760
>      ? __pfx_do_raw_spin_lock+0x10/0x10
>      ? lock_acquire+0x2b8/0x2f0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __pfx_snd_seq_deliver_event+0x10/0x10
>      ? _raw_spin_unlock_irqrestore+0x44/0x60
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? trace_hardirqs_on+0x18/0x160
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? _raw_spin_unlock_irqrestore+0x44/0x60
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      snd_seq_kernel_client_dispatch+0x19c/0x1e0
>      pmbd_dispatch_early_sync_echo+0x121/0x1c0
>      ? __pfx_pmbd_dispatch_early_sync_echo+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? finish_task_switch.isra.0+0x1dc/0x980
>      process_one_work+0x908/0x19c0
>      ? __pfx_process_one_work+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      worker_thread+0x65c/0xe40
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __kthread_parkme+0x175/0x220
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __pfx_worker_thread+0x10/0x10
>      kthread+0x34f/0x460
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork+0x659/0x940
>      ? __pfx_ret_from_fork+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __switch_to+0x74f/0xf80
>      ? __pfx_kthread+0x10/0x10
>      ret_from_fork_asm+0x1a/0x30
>      </TASK>
>     Modules linked in:
>     ---[ end trace 0000000000000000 ]---
>     RIP: 0010:do_raw_spin_lock+0x71/0x270
>     Code: d0 60 81 49 8d 14 04 c7 02 f1 f1 f1 f1 c7 42 04 04 f3 f3 f3 65 48 8b 15 05 df 88 09 48 89 54 24 60 31 d2 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 b9
>     RSP: 0018:ffff88810450f878 EFLAGS: 00010013
>     RAX: dffffc0000000000 RBX: 0000000000000068 RCX: 0000000000000000
>     RDX: 000000000000000d RSI: 0000000000000000 RDI: 000000000000006c
>     RBP: 0000000000000293 R08: 0000000000000001 R09: 0000000000000000
>     R10: ffffffff8940fe57 R11: 0000000000000000 R12: 1ffff110208a1f10
>     R13: 0000000000000068 R14: 0000000000000001 R15: ffff88810450fbee
>     FS:  0000000000000000(0000) GS:ffff8881fd885000(0000) knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 00000000006d2890 CR3: 0000000106cbf002 CR4: 0000000000770ef0
>     PKRU: 55555554
>     Kernel panic - not syncing: Fatal exception
>     Kernel Offset: disabled
>     Rebooting in 1 seconds..
> 
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
