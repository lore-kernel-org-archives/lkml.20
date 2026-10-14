Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB532F3C07;
	Wed, 14 Oct 2026 06:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960962; cv=none; b=OCscNuytjcnQj+W/vaV50JEAccXSx6lacI6l8Lq0ZSKdENYRzW3sl3zdPnUcJmKvSbaauzpJjVATWnnOZ9+9V4Dqrmy9mT3yC0D64wp7k2U8WVg7Y9gGfq+qC7Q/SqACfmQ4bAzT5h6bwfBjkkAScFuIFX4p73PcyzBdgd0IlQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960962; c=relaxed/simple;
	bh=elXshJHzqsP6151olGaqdu31VHh+iR3X8AhTxNdpilk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s95RzmFfyArMyVMHmSCy0PoY2FjOszqur0UQBS2OknC7wfYtRUruyJ3MmjA7OUQvCS3VvmrF/43TUcP4p8dxdhfevvZjGBlKaMx5ebxnSF7xJUN/9ZhjmNuxvfXbtOUGMq1Okq/XLOwLkSB/fhrf2FyuS+SqDY/paVQ2Pp3k+ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qpK06rBJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L7scxcJI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qpK06rBJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L7scxcJI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qpK06rBJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L7scxcJI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qpK06rBJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L7scxcJI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3539421F93;
	Wed, 14 Oct 2026 06:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791960958; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rwgxG29qaEu+nWnUkrNZt2bNiBXHtnEqVNMN6Ghlspw=;
	b=qpK06rBJOSPtov5B8wTwXmCIcmcGPhiF/kPVpvIh3K3BNYzEH6w2cCcSfMxCGPWUbE6hwj
	8su44endfaEk+X8hqh/j4CEhwxTvRPqWKbnWsxIHFGW8FpjYExKrr0XdPExQwePiEATccv
	cxaUQBZnYKpI13qLJs6nl8Ub8dMYONE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791960958;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rwgxG29qaEu+nWnUkrNZt2bNiBXHtnEqVNMN6Ghlspw=;
	b=L7scxcJIVxBeqnxrMbT7za+WEYNoi08IDJC+JsCFD/NcuMOrur/IzLmdQebQr8qRKJSyNm
	5ewwUEHOhjibAEAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qpK06rBJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=L7scxcJI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791960958; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rwgxG29qaEu+nWnUkrNZt2bNiBXHtnEqVNMN6Ghlspw=;
	b=qpK06rBJOSPtov5B8wTwXmCIcmcGPhiF/kPVpvIh3K3BNYzEH6w2cCcSfMxCGPWUbE6hwj
	8su44endfaEk+X8hqh/j4CEhwxTvRPqWKbnWsxIHFGW8FpjYExKrr0XdPExQwePiEATccv
	cxaUQBZnYKpI13qLJs6nl8Ub8dMYONE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791960958;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rwgxG29qaEu+nWnUkrNZt2bNiBXHtnEqVNMN6Ghlspw=;
	b=L7scxcJIVxBeqnxrMbT7za+WEYNoi08IDJC+JsCFD/NcuMOrur/IzLmdQebQr8qRKJSyNm
	5ewwUEHOhjibAEAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B3B513726;
	Wed, 14 Oct 2026 06:55:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FMJULXwnz2ohVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 06:55:57 +0000
Date: Wed, 14 Oct 2026 08:55:56 +0200
Message-ID: <878q40g48z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: seq: oss: Prevent duplicate MIDI device teardown
In-Reply-To: <pm-pmb-7c5128efe2110a87b872-v2-c718183fd693e73d8e95@gmail.com>
References: <pm-pmb-7c5128efe2110a87b872-v2-c718183fd693e73d8e95@gmail.com>
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
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
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kernel.org,vger.kernel.org,gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Spam-Level: 
X-Rspamd-Queue-Id: 3539421F93
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Wed, 14 Oct 2026 06:06:52 +0200,
Cen Zhang wrote:
> 
> Each OSS MIDI alias and its coder must have one final-release owner.
> find_slot() pins the alias under register_lock, but
> snd_seq_oss_midi_check_exit_port() clears its slot in a separate critical
> section without checking whether another callback already removed it.
> The use counter protects active users, but draining it does not elect a
> single remover.
> 
> This requires overlapping raw kernel-client port controls for the same
> client. snd_seq_kernel_client_ctl() does not take ioctl_mutex, and
> snd_seq_delete_port() releases ports_mutex before returning to the
> DELETE_PORT handler's PORT_EXIT broadcast. If the old deletion is delayed
> before that broadcast, a new port can reuse the vacant address. Its
> PORT_START finds and keeps the old alias. Deleting the replacement then
> produces a second PORT_EXIT for the same address. Non-atomic subscriber
> delivery holds a read rwsem, so the two receive_announce() callbacks can
> run concurrently:
> 
>   Old-port deletion                 Replacement-port controls
>   -----------------                 -------------------------
>   Unlink and drain old port
>   Delay before PORT_EXIT            Create port at the same address
>                                     PORT_START keeps existing alias
>                                     Delete port; PORT_EXIT pins mdev
>   PORT_EXIT pins the same mdev
>   Clear slot; drop pin              Clear slot; drop pin
>   Wait for users to drain           Wait for users to drain
>                                     Free coder; pause before kfree(mdev)
>   Free coder again: read
>   freed coder->buf
> 
> Both callbacks can select the same alias before either clears its slot.
> After both drop their pins, both waits can return. The second call to
> snd_midi_event_free() can then read the freed coder's buffer pointer,
> as in the report below, and attempt to release the same objects twice.
> 
> Check that the pinned alias still occupies its slot under register_lock
> before clearing it. A callback that finds it already removed drops its
> pin and returns. Only the callback that removes the alias drains users
> and frees the coder and record. The pin keeps the record alive through
> this check, and the wait remains outside the spinlock.
> 
> KASAN report as below:
> 
>     ==================================================================
>     BUG: KASAN: slab-use-after-free in snd_midi_event_free+0x53/0x60
>     Read of size 8 at addr ffff888107074518 by task alsa-seq-fixtur/492
> 
>     CPU: 3 UID: 0 PID: 492 Comm: alsa-seq-fixtur Not tainted 7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     Call Trace:
>      <TASK>
>      dump_stack_lvl+0x93/0xd0
>      print_report+0xce/0x630
>      ? snd_midi_event_free+0x53/0x60
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __virt_addr_valid+0x20d/0x410
>      ? snd_midi_event_free+0x53/0x60
>      kasan_report+0xe0/0x110
>      ? snd_midi_event_free+0x53/0x60
>      snd_midi_event_free+0x53/0x60
>      snd_seq_oss_midi_check_exit_port+0x1d8/0x370
>      receive_announce+0x1b8/0x370
>      ? __pfx_receive_announce+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __lock_acquire+0x466/0x2260
>      ? snd_seq_port_use_ptr+0x40/0x170
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? find_held_lock+0x2b/0x80
>      ? snd_seq_port_use_ptr+0x10c/0x170
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? lock_release+0xc8/0x280
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __pfx_receive_announce+0x10/0x10
>      __snd_seq_deliver_single_event+0x105/0x1a0
>      ? snd_seq_port_use_ptr+0x111/0x170
>      snd_seq_deliver_single_event+0x2fc/0x770
>      ? __pfx_snd_seq_deliver_single_event+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __pfx_down_read_nested+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? do_raw_read_unlock+0x49/0xe0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? _raw_read_unlock+0x23/0x40
>      snd_seq_deliver_event+0x351/0x760
>      ? __pfx_snd_seq_deliver_event+0x10/0x10
>      ? _raw_spin_unlock_irqrestore+0x44/0x60
>      ? trace_hardirqs_on+0x18/0x160
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? _raw_spin_unlock_irqrestore+0x44/0x60
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      snd_seq_kernel_client_dispatch+0x13f/0x170
>      snd_seq_system_broadcast+0x100/0x150
>      ? __pfx_snd_seq_system_broadcast+0x10/0x10
>      ? mark_held_locks+0x40/0x70
>      ? _raw_spin_unlock_irqrestore+0x44/0x60
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? lockdep_hardirqs_on_prepare+0xea/0x1a0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      snd_seq_ioctl_delete_port+0x179/0x4b0
>      call_seq_client_ctl+0x90/0x110
>      snd_seq_kernel_client_ctl+0x8a/0x100
>      pmbd_case_delete_port+0xa6/0xf0
>      ? __pfx_pmbd_case_delete_port+0x10/0x10
>      ? __might_fault+0xdd/0x190
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __might_fault+0x14e/0x190
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? strim+0x19c/0x200
>      pmbd_case_control_write+0x2c5/0x470
>      ? __pfx_pmbd_case_control_write+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __debugfs_file_get+0x1bd/0x7f0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? lock_acquire+0x17b/0x2f0
>      ? ksys_write+0x111/0x200
>      full_proxy_write+0x11f/0x180
>      vfs_write+0x25a/0x1010
>      ? __pfx_full_proxy_write+0x10/0x10
>      ? __pfx___mutex_lock+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? lock_acquire+0x17b/0x2f0
>      ? __pfx_vfs_write+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __fget_files+0x1e1/0x370
>      ksys_write+0x111/0x200
>      ? __pfx_ksys_write+0x10/0x10
>      ? rseq_register.isra.0+0x1f3/0x2e0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? exit_to_user_mode_loop+0x3a5/0x570
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     RIP: 0033:0x7f3532e4e9ee
>     Code: 08 0f 85 f5 4b ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 80 00 00 00 00 48 83 ec 08
>     RSP: 002b:00007f3532dafe08 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
>     RAX: ffffffffffffffda RBX: 00007f3532db06c0 RCX: 00007f3532e4e9ee
>     RDX: 000000000000000a RSI: 000055efbd747156 RDI: 0000000000000003
>     RBP: 000055efbd747156 R08: 0000000000000000 R09: 0000000000000000
>     R10: 0000000000000000 R11: 0000000000000246 R12: 000000000000000a
>     R13: 0000000000000000 R14: 00007ffe7894e7f0 R15: 00007f35325b0000
>      </TASK>
> 
>     Allocated by task 490:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      __kasan_kmalloc+0xaa/0xb0
>      __kmalloc_cache_noprof+0x251/0x610
>      snd_midi_event_new+0x74/0x210
>      snd_seq_oss_midi_check_new_port+0x329/0x610
>      receive_announce+0x277/0x370
>      __snd_seq_deliver_single_event+0x105/0x1a0
>      snd_seq_deliver_single_event+0x2fc/0x770
>      snd_seq_deliver_event+0x351/0x760
>      snd_seq_kernel_client_dispatch+0x13f/0x170
>      snd_seq_system_broadcast+0x100/0x150
>      snd_seq_ioctl_create_port+0x39a/0x9d0
>      call_seq_client_ctl+0x90/0x110
>      snd_seq_kernel_client_ctl+0x8a/0x100
>      pmbd_case_create_port+0xcc/0x160
>      pmbd_case_control_write+0x21d/0x470
>      full_proxy_write+0x11f/0x180
>      vfs_write+0x25a/0x1010
>      ksys_write+0x111/0x200
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     Freed by task 493:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      kasan_save_free_info+0x3b/0x60
>      __kasan_slab_free+0x5f/0x80
>      kfree+0x307/0x580
>      snd_midi_event_free+0x48/0x60
>      snd_seq_oss_midi_check_exit_port+0x1d8/0x370
>      receive_announce+0x1b8/0x370
>      __snd_seq_deliver_single_event+0x105/0x1a0
>      snd_seq_deliver_single_event+0x2fc/0x770
>      snd_seq_deliver_event+0x351/0x760
>      snd_seq_kernel_client_dispatch+0x13f/0x170
>      snd_seq_system_broadcast+0x100/0x150
>      snd_seq_ioctl_delete_port+0x179/0x4b0
>      call_seq_client_ctl+0x90/0x110
>      snd_seq_kernel_client_ctl+0x8a/0x100
>      pmbd_case_delete_port+0xa6/0xf0
>      pmbd_case_control_write+0x398/0x470
>      full_proxy_write+0x11f/0x180
>      vfs_write+0x25a/0x1010
>      ksys_write+0x111/0x200
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     The buggy address belongs to the object at ffff888107074500
>      which belongs to the cache kmalloc-96 of size 96
>     The buggy address is located 24 bytes inside of
>      freed 96-byte region [ffff888107074500, ffff888107074560)
> 
>     The buggy address belongs to the physical page:
>     page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x107074
>     flags: 0x200000000000000(node=0|zone=2)
>     page_type: f5(slab)
>     raw: 0200000000000000 ffff888100042280 dead000000000122 0000000000000000
>     raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000
>     page dumped because: kasan: bad access detected
> 
>     Memory state around the buggy address:
>      ffff888107074400: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>      ffff888107074480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>     >ffff888107074500: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
>                                 ^
>      ffff888107074580: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
>      ffff888107074600: fa fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
>     ==================================================================
> 
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
