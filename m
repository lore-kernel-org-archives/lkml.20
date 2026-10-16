Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E563836EAA4;
	Fri, 16 Oct 2026 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138910; cv=none; b=LN99jxa3dujESJ7M9ZJhlAGFeRIC1B/tmrk1wAoxdEDN2EFYyzN9xBCM1dBzxhPd4YUx64ckZKRWv3T7oodVBJR3sUzju2O70AauV36FiX1HZMjOYulJzIKk0ZxXaZ1sDEgqLIAj3ZewTPa/LFeygSv33rB+NXGZ6jJIOMnDRhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138910; c=relaxed/simple;
	bh=iH33ZwSzsKvbb294Cxd2ezlaOiKc7/eTwIgSaXukpwI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NlCLkiQPKItINgwJhsHHcwf23F9LJyLdjQlkQBIpwnH/2ilvKPUg4Rjg9Z9vS0I7O9AcKT3zgwBhyegyGY/nL0IyVQKCTo7FRKSKQ/CH8VHVLhXXRSJITcyXsUCrszvSkPIAPfrPxDXN0upT2Dq+zgHnO0IDMfplwnOPoZss1iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HWS1Nvmu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OtCMRTOn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HWS1Nvmu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OtCMRTOn; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HWS1Nvmu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OtCMRTOn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HWS1Nvmu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OtCMRTOn"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CFE041F443;
	Fri, 16 Oct 2026 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792138904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BXuvA3my8MPg44hQq06ErEwSQHyLzkap6/ifKw/x3nE=;
	b=HWS1Nvmuq3l124egseY7Owri46knZn0TNFqOnVUSzQDt7zQ/qJgTlKY5wT34zlDZEbkeBn
	pG+UtqIpEK1uQRQNLSxmvyr6N7Lm4ZNBlf/0g3tO+GgZevrHUkX0xA/53pZZ93j0z3uxrW
	0yZHzbcr8N2K46+rEQopjlXFno03xEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792138904;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BXuvA3my8MPg44hQq06ErEwSQHyLzkap6/ifKw/x3nE=;
	b=OtCMRTOnshcJQahCq8ug2yfGH0EqmfobWDQQ9fNNqUVsx4VBVYJN4yVQs/psOJ5fl/Zf+o
	f0UqXtzoIZDrT/AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792138904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BXuvA3my8MPg44hQq06ErEwSQHyLzkap6/ifKw/x3nE=;
	b=HWS1Nvmuq3l124egseY7Owri46knZn0TNFqOnVUSzQDt7zQ/qJgTlKY5wT34zlDZEbkeBn
	pG+UtqIpEK1uQRQNLSxmvyr6N7Lm4ZNBlf/0g3tO+GgZevrHUkX0xA/53pZZ93j0z3uxrW
	0yZHzbcr8N2K46+rEQopjlXFno03xEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792138904;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BXuvA3my8MPg44hQq06ErEwSQHyLzkap6/ifKw/x3nE=;
	b=OtCMRTOnshcJQahCq8ug2yfGH0EqmfobWDQQ9fNNqUVsx4VBVYJN4yVQs/psOJ5fl/Zf+o
	f0UqXtzoIZDrT/AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A6EF1339F;
	Fri, 16 Oct 2026 08:21:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JGx3FJje0Wp5VAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Oct 2026 08:21:44 +0000
Date: Fri, 16 Oct 2026 10:21:44 +0200
Message-ID: <87mrse5a3r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: vmaster: Protect follower lookup and setup
In-Reply-To: <pm-pmb-6c0b7e841529ddd0b21a-v2-b53dbcd593a7a4bd9582@gmail.com>
References: <pm-pmb-6c0b7e841529ddd0b21a-v2-b53dbcd593a7a4bd9582@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kernel.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 16 Oct 2026 04:02:29 +0200,
Cen Zhang wrote:
> 
> A control selected by snd_ctl_add_followers() must remain alive until
> _snd_ctl_add_follower() has copied it and installed its wrapper. The
> lookup returns a raw pointer without retaining the control, and neither
> the short-lived list lookup lock nor the fast lookup protects later use.
> 
> If a kernel client adds followers to a live virtual master while another
> client removes or replaces a published follower, the following order is
> possible, with the card and master kept alive:
> 
>   Follower setup                      Control removal
>   snd_ctl_add_followers()
>     snd_ctl_find_id_mixer()
>       return follower
>                                       snd_ctl_remove()
>                                         down_write(controls_rwsem)
>                                         __snd_ctl_remove()
>                                           unlink follower
>                                           snd_ctl_free_one(follower)
>                                         up_write(controls_rwsem)
>     _snd_ctl_add_follower()
>       read follower->count
> 
> Removal completes after lookup returns and before setup reads the
> control. Since setup holds neither controls_rwsem nor a reference, the
> count read and subsequent control copies can access freed memory.
> 
> Hold controls_rwsem for writing across the lookup and follower setup.
> This prevents removal or replacement from freeing the selected control
> until wrapper installation is complete. Write ownership also excludes
> control callbacks while setup changes the callback and private fields.
> 
> KASAN report as below:
> 
>     BUG: KASAN: slab-use-after-free in _snd_ctl_add_follower+0x452/0x520
>     Read of size 4 at addr ffff888107957d50 by task loadmodule/491
> 
>     CPU: 3 UID: 0 PID: 491 Comm: loadmodule Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
>     Tainted: [O]=OOT_MODULE
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     Call Trace:
>      <TASK>
>      dump_stack_lvl+0x93/0xd0
>      print_report+0xce/0x630
>      ? _snd_ctl_add_follower+0x452/0x520
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __virt_addr_valid+0x20d/0x410
>      ? _snd_ctl_add_follower+0x452/0x520
>      kasan_report+0xe0/0x110
>      ? _snd_ctl_add_follower+0x452/0x520
>      _snd_ctl_add_follower+0x452/0x520
>      snd_ctl_add_followers+0x153/0x2b0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __pfx_snd_ctl_add_followers+0x10/0x10
>      ? __might_fault+0x135/0x190
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __might_fault+0x14e/0x190
>      ? __pfx_fixture_write+0x10/0x10 [pmbd_vmaster_fixture]
>      fixture_write+0x174/0x1f0 [pmbd_vmaster_fixture]
>      ? __pfx_fixture_write+0x10/0x10 [pmbd_vmaster_fixture]
>      ? __pfx___might_resched+0x10/0x10
>      proc_reg_write+0x1fb/0x2d0
>      vfs_write+0x25a/0x1010
>      ? __pfx_proc_reg_write+0x10/0x10
>      ? kmem_cache_free+0x242/0x580
>      ? __pfx_vfs_write+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? putname+0x93/0xe0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? do_sys_openat2+0x12a/0x1b0
>      ? __pfx_do_sys_openat2+0x10/0x10
>      ksys_write+0x111/0x200
>      ? __pfx_ksys_write+0x10/0x10
>      ? irqentry_exit+0xbe/0x820
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     RIP: 0033:0x7f0b835a9687
>     Code: 48 89 fa 4c 89 df e8 58 b3 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
>     RSP: 002b:00007ffc82ea0360 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
>     RAX: ffffffffffffffda RBX: 00007f0b83517780 RCX: 00007f0b835a9687
>     RDX: 0000000000000005 RSI: 0000564f8a21d074 RDI: 0000000000000003
>     RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
>     R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000000
>     R13: 00007ffc82ea04f0 R14: 00007f0b83755000 R15: 0000564f8a21ed78
>      </TASK>
> 
>     Allocated by task 485:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      __kasan_kmalloc+0xaa/0xb0
>      __kmalloc_noprof+0x2d7/0x770
>      snd_ctl_new+0x51/0x190
>      snd_ctl_new1+0x13c/0x650
>      0xffffffffc04011b5
>      do_one_initcall+0xf3/0x4e0
>      do_init_module+0x281/0x8e0
>      load_module+0x658c/0x7cc0
>      init_module_from_file+0x15b/0x180
>      idempotent_init_module+0x22d/0x770
>      __x64_sys_finit_module+0xd2/0x160
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     Freed by task 492:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      kasan_save_free_info+0x3b/0x60
>      __kasan_slab_free+0x5f/0x80
>      kfree+0x307/0x580
>      __snd_ctl_remove+0x2ac/0x3d0
>      snd_ctl_remove+0x46/0x70
>      fixture_write+0x1ae/0x1f0 [pmbd_vmaster_fixture]
>      proc_reg_write+0x1fb/0x2d0
>      vfs_write+0x25a/0x1010
>      ksys_write+0x111/0x200
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     The buggy address belongs to the object at ffff888107957d00
>      which belongs to the cache kmalloc-192 of size 192
>     The buggy address is located 80 bytes inside of
>      freed 192-byte region [ffff888107957d00, ffff888107957dc0)
> 
>     The buggy address belongs to the physical page:
>     page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x107957
>     flags: 0x200000000000000(node=0|zone=2)
>     page_type: f5(slab)
>     raw: 0200000000000000 ffff8881000423c0 dead000000000100 dead000000000122
>     raw: 0000000000000000 0000000000100010 00000000f5000000 0000000000000000
>     page dumped because: kasan: bad access detected
> 
>     Memory state around the buggy address:
>      ffff888107957c00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>      ffff888107957c80: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>     >ffff888107957d00: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                      ^
>      ffff888107957d80: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>      ffff888107957e00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>     ==================================================================
> 
> Fixes: ae07eb9bf23e ("ALSA: vmaster: Add snd_ctl_add_followers() helper")
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
