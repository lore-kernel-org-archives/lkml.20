Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDEA3BB672;
	Wed, 14 Oct 2026 06:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958591; cv=none; b=lVLyzgkcBIBe/K3UY1s24X7DSMw4zRdQmPXfbl/0fzk51u7kEEFUAGVqWOsHfWUj9Xqjwygq+YnHB7yIH6WxRtmJF4i+LywtsolsoLcXZj0YdfILtN73xn9cXaM43yBuc8XllouYG0wQ+b19jOPXSGfxZ6zXIVXE1dXm7CSkj+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958591; c=relaxed/simple;
	bh=TWqH4d23PEaHF3jS0z2UNCQFi222PXci3/mVx5QOMzI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lnWwV5OLEP0RYDt0ljBJVRlxWXGecC7lTLOYwIrX7svPHqD/EDMI8O2kbIiuXA5K7HQtL0ghEhPGLKDzhnBTgW3lIFW2/oGCdE+1obDqf+amjaI0mJ0auhwMbmlzwPI2ELc0pq3Mwmn3n/vjsNeae+lTkDa6bHGsh65NhK9PtOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kXTq9Ys7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TALO4atx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kXTq9Ys7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TALO4atx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kXTq9Ys7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TALO4atx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kXTq9Ys7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TALO4atx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2C30122054;
	Wed, 14 Oct 2026 06:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791958588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rhBekBiDbKj2ne9YzGaINFzq883JhODXZ6r12gXHyhA=;
	b=kXTq9Ys7umTAjHJe8lla3hk81O9fM3ah/9c7qD/PsJcCaErgyhpIZ9Cde8W8jsx3+8mK67
	QToaEHJs+7UksvAmQH8cqqunVpxFgYLV9nDzPvcWIFiFj9UYnkhNVXKMZlB9w22pT7Bv9D
	AUxfrayOkw42AFncpp6GdYWMUb5WIrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791958588;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rhBekBiDbKj2ne9YzGaINFzq883JhODXZ6r12gXHyhA=;
	b=TALO4atxdZ+qF6woiz+M5a9U7j/3YgAAw26c812/EtlNQWkK0rAG6RKj651VIdw5KoaMso
	lAokLa/5u3A6jHDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kXTq9Ys7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TALO4atx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791958588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rhBekBiDbKj2ne9YzGaINFzq883JhODXZ6r12gXHyhA=;
	b=kXTq9Ys7umTAjHJe8lla3hk81O9fM3ah/9c7qD/PsJcCaErgyhpIZ9Cde8W8jsx3+8mK67
	QToaEHJs+7UksvAmQH8cqqunVpxFgYLV9nDzPvcWIFiFj9UYnkhNVXKMZlB9w22pT7Bv9D
	AUxfrayOkw42AFncpp6GdYWMUb5WIrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791958588;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rhBekBiDbKj2ne9YzGaINFzq883JhODXZ6r12gXHyhA=;
	b=TALO4atxdZ+qF6woiz+M5a9U7j/3YgAAw26c812/EtlNQWkK0rAG6RKj651VIdw5KoaMso
	lAokLa/5u3A6jHDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 956081368E;
	Wed, 14 Oct 2026 06:16:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rE/AEDsez2pWKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 06:16:27 +0000
Date: Wed, 14 Oct 2026 08:16:26 +0200
Message-ID: <87bj8wg62t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: emux: Guard the OSS argument during port initialization
In-Reply-To: <pm-pmb-f8d6ccb28f196910444f-v2-c253bf022b6e954a7bdc@gmail.com>
References: <pm-pmb-f8d6ccb28f196910444f-v2-c253bf022b6e954a7bdc@gmail.com>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Level: 
X-Rspamd-Queue-Id: 2C30122054
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Wed, 14 Oct 2026 06:02:50 +0200,
Cen Zhang wrote:
> 
> The OSS argument must be non-NULL before reset_port_mode() writes its
> event_passing field. snd_emux_open_seq_oss() assigns p->oss_arg only
> after snd_emux_create_port() attaches the writable sequencer port, so
> this field is still NULL when the callback first becomes reachable.
> 
> With sequencer OSS and an EMUX provider enabled, another sequencer
> client can learn the new address from a PORT_START announcement and
> send a direct SNDRV_SEQ_EVENT_OSS channel-mode command, with marker
> 0xfe and command byte 0x8a. The following ordering is possible:
> 
>   OSS opener                        Sequencer writer
>   snd_emux_create_port()
>     snd_seq_event_port_attach()
>       publish port, announce
>                                     receive PORT_START
>                                     snd_seq_write()
>                                       snd_emux_event_oss_input()
>                                         reset_port_mode()
>                                           write via NULL oss_arg
>   p->oss_arg = arg
> 
> The callback's write precedes the opener's assignment. The core's port
> reference keeps the private data allocated but does not wait for its
> initialization. The write therefore dereferences NULL and can panic the
> kernel, as shown by the report below.
> 
> Take a single READ_ONCE() snapshot of oss_arg and update event_passing
> only when that snapshot is non-NULL. Pair it with WRITE_ONCE() in the
> open path, so the check and write use the same pointer despite
> concurrent initialization. The open path still sets the initial mode
> after assigning the argument, and subsequent channel-mode events retain
> their existing handling.
> 
> KASAN report as below:
> 
>     Oops: general protection fault, probably for non-canonical address 0xdffffc0000000003: 0000 [#1] SMP KASAN NOPTI
>     KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
>     CPU: 2 UID: 0 PID: 495 Comm: fixture Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
>     Tainted: [O]=OOT_MODULE
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     RIP: 0010:snd_emux_event_oss_input+0xa76/0xdd0
>     Code: fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 e1 02 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5d 78 48 8d 7b 18 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 40 03 00 00 c7 43 18 00 00 00
>     RSP: 0018:ffff88810a937888 EFLAGS: 00010216
>     RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff84f391b2
>     RDX: 0000000000000003 RSI: 0000000000000000 RDI: 0000000000000018
>     RBP: ffff8881179fc000 R08: 0000000000000001 R09: 0000000000000001
>     R10: ffffffff89444257 R11: ffff888107dd3a00 R12: 1ffff11021526f17
>     R13: 0000000000000000 R14: 0000000000000001 R15: ffff888112cda000
>     FS:  00007fdd13c9f780(0000) GS:ffff8881fd826000(0000) knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 00007fdd13e2f943 CR3: 00000001057ba005 CR4: 0000000000770ef0
>     PKRU: 55555554
>     Call Trace:
>      <TASK>
>      ? __pfx_snd_emux_event_oss_input+0x10/0x10
>      ? snd_seq_port_use_ptr+0x40/0x170
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? find_held_lock+0x2b/0x80
>      ? snd_seq_port_use_ptr+0x10c/0x170
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? lock_release+0xc8/0x280
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __pfx_snd_emux_event_oss_input+0x10/0x10
>      __snd_seq_deliver_single_event+0x105/0x1a0
>      ? snd_seq_port_use_ptr+0x111/0x170
>      snd_seq_deliver_single_event+0x2fc/0x770
>      ? __pfx_snd_seq_deliver_single_event+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? add_lock_to_list+0x9d/0x1e0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? check_prev_add+0x34c/0xe80
>      snd_seq_deliver_event+0x45a/0x760
>      ? __pfx_snd_seq_deliver_event+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? lock_acquire+0x17b/0x2f0
>      snd_seq_client_enqueue_event.constprop.0+0x278/0x430
>      ? __pfx_snd_seq_client_enqueue_event.constprop.0+0x10/0x10
>      ? __might_fault+0xdd/0x190
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __might_fault+0x14e/0x190
>      ? _raw_spin_unlock_irq+0x28/0x50
>      snd_seq_write+0x30a/0x5e0
>      ? __pfx_snd_seq_write+0x10/0x10
>      ? selinux_file_permission+0x122/0x570
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? security_file_permission+0x26/0x80
>      vfs_write+0x25a/0x1010
>      ? __pfx_snd_seq_write+0x10/0x10
>      ? __pfx_vfs_write+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? trace_hardirqs_on+0x18/0x160
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __call_rcu_common.constprop.0+0x5c1/0xbd0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __fput+0x5ba/0xa60
>      ksys_write+0x1b7/0x200
>      ? __pfx_ksys_write+0x10/0x10
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     RIP: 0033:0x7fdd13d31687
>     Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
>     RSP: 002b:00007fff073e9f20 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
>     RAX: ffffffffffffffda RBX: 00007fdd13c9f780 RCX: 00007fdd13d31687
>     RDX: 000000000000001c RSI: 00007fff073e9fc0 RDI: 0000000000000003
>     RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
>     R10: 0000000000000000 R11: 0000000000000202 R12: 0000561260c48082
>     R13: 0000561260c48011 R14: 0000561260c4809d R15: 0000000000000002
>      </TASK>
>     Modules linked in: snd_emux_validation(O)
>     ---[ end trace 0000000000000000 ]---
>     RIP: 0010:snd_emux_event_oss_input+0xa76/0xdd0
>     Code: fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 e1 02 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5d 78 48 8d 7b 18 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 40 03 00 00 c7 43 18 00 00 00
>     RSP: 0018:ffff88810a937888 EFLAGS: 00010216
>     RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff84f391b2
>     RDX: 0000000000000003 RSI: 0000000000000000 RDI: 0000000000000018
>     RBP: ffff8881179fc000 R08: 0000000000000001 R09: 0000000000000001
>     R10: ffffffff89444257 R11: ffff888107dd3a00 R12: 1ffff11021526f17
>     R13: 0000000000000000 R14: 0000000000000001 R15: ffff888112cda000
>     FS:  00007fdd13c9f780(0000) GS:ffff8881fd826000(0000) knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 00007fdd13e2f943 CR3: 00000001057ba005 CR4: 0000000000770ef0
>     PKRU: 55555554
>     Kernel panic - not syncing: Fatal exception
>     Kernel Offset: disabled
>     Rebooting in 1 seconds..
> 
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
