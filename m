Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF60440A07;
	Thu, 15 Oct 2026 19:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093987; cv=none; b=rqDb2gIJ0cIeVmNDA5/D+s7mxbHXfncknP7eAfIgGnx3m21rEV3Gdgl8cfTCJbWRAxKuwzFqG0WLRMkJwnUX0SWbanbvo8aCQdPbbWrpumWCuZA+WELoxuVIn7arS/P5+sxGefI99v2nF/hbCGeCArwrbzz4fHvPNZnV3YV+MSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093987; c=relaxed/simple;
	bh=/w3XM0DroDbYRdyZAGOsadoWGF5zkjpUN6SDZfubrgc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DYPkya0/TpskhwjElbJQkpBeQNxvOqzglAzGfx49bxyeiNYraMwUGjOJ3V1h+Vu9DwMIYaK5BlOTx8PvN9zH4EuxwlgVGMqgWXMEY8Cs3QItHBCqFaZfc5uiDXZX1M2IUTfZKwIZhABMs9uwDFL/WQ7UTYrdUWst83igCLUe1q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eVveUbvP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/u3gCg+i; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eVveUbvP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/u3gCg+i; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eVveUbvP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/u3gCg+i";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eVveUbvP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/u3gCg+i"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4B1511FC9E;
	Thu, 15 Oct 2026 19:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792093982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=quQmuT39V0P4Z1x9hh+N8SVVusKzolu/f/wXl7UQdCU=;
	b=eVveUbvPSmyib+5rG9IDd99IgKDVgyzBFv8IkMrZQI2jgEu9tXMAf6wUlASB4+1c2zL82I
	mI4UDuVZ8v8vep8I7PlEKz0e+ZEh72XpyaKyY2Q6zpv+BQEQsCLRjBs78ShR49NVl8QXtV
	82chwx0bZGySWBx+ZdkxJpfU3quHBDw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792093982;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=quQmuT39V0P4Z1x9hh+N8SVVusKzolu/f/wXl7UQdCU=;
	b=/u3gCg+i7LmeQ72jq6PFo90MWCzCvKDiHLBL07v2oIq2JnLe5ptqq2OItlBp+A3OwfGrZV
	8llR1Yfh91fcvyDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eVveUbvP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/u3gCg+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792093982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=quQmuT39V0P4Z1x9hh+N8SVVusKzolu/f/wXl7UQdCU=;
	b=eVveUbvPSmyib+5rG9IDd99IgKDVgyzBFv8IkMrZQI2jgEu9tXMAf6wUlASB4+1c2zL82I
	mI4UDuVZ8v8vep8I7PlEKz0e+ZEh72XpyaKyY2Q6zpv+BQEQsCLRjBs78ShR49NVl8QXtV
	82chwx0bZGySWBx+ZdkxJpfU3quHBDw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792093982;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=quQmuT39V0P4Z1x9hh+N8SVVusKzolu/f/wXl7UQdCU=;
	b=/u3gCg+i7LmeQ72jq6PFo90MWCzCvKDiHLBL07v2oIq2JnLe5ptqq2OItlBp+A3OwfGrZV
	8llR1Yfh91fcvyDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D73E913223;
	Thu, 15 Oct 2026 19:53:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uzxDKx0v0WqAWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Oct 2026 19:53:01 +0000
Date: Thu, 15 Oct 2026 21:53:01 +0200
Message-ID: <871p9q7nc2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	phucduc.bui@gmail.com,
	cezary.rojewski@intel.com,
	kees+treewide@kernel.org,
	error27@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: mixer: oss: Serialize initial slot construction
In-Reply-To: <pm-pmb-99c1214968ae9fa4d744-v2-df0befb9a699eb50dcec@gmail.com>
References: <pm-pmb-99c1214968ae9fa4d744-v2-df0befb9a699eb50dcec@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4B1511FC9E
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,intel.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[treewide];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Thu, 15 Oct 2026 19:11:38 +0200,
Cen Zhang wrote:
> 
> OSS mixer slot callbacks require an initialized private_data payload.
> However, snd_mixer_oss_notify_handler() publishes card->mixer_oss before
> snd_mixer_oss_build() constructs the default bindings, and
> snd_mixer_oss_build_input() stores get_volume before private_data.
> 
> With OSS mixer emulation enabled and a native control matching a default
> mapping, a volume read can arrive during initial binding construction.
> For example, the dummy card provides the Master Volume control before
> registration. The following ordering lets the read use the callback
> before its payload is attached:
> 
>     Card registration                    OSS volume read
>     -----------------                    ---------------
>     register the OSS mixer device
>     publish card->mixer_oss
>     store slot->get_volume
>                                          open the mixer device
>                                          lock reg_mutex
>                                          invoke slot->get_volume
>                                          load NULL private_data
>                                          read slot->present
>     store slot->private_data
> 
> The read holds reg_mutex, but the initial builder does not acquire it.
> The controls_rwsem read lock protects native controls and does not
> serialize the builder with another reader. As a result,
> snd_mixer_oss_get_volume1() can dereference a NULL payload and Oops.
> 
> Hold the existing reg_mutex throughout snd_mixer_oss_build(), as proc
> remapping already does for snd_mixer_oss_build_input(). A request can no
> longer invoke a callback between its installation and the payload store.
> This keeps the existing reg_mutex-before-controls_rwsem lock order.
> 
> KASAN report as below:
> 
>     Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
>     KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
>     CPU: 1 UID: 0 PID: 431 Comm: alsa-oss-trigge Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
>     Tainted: [O]=OOT_MODULE
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     RIP: 0010:snd_mixer_oss_get_volume1+0xd1/0x610 [snd_mixer_oss]
>     Code: 00 c7 03 64 00 00 00 e9 b8 01 00 00 e8 e8 82 44 c1 49 8d 75 04 48 b8 00 00 00 00 00 fc ff df 48 89 f2 48 89 34 24 48 c1 ea 03 <0f> b6 14 02 48 89 f0 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 3f
>     RSP: 0018:ffff888104c67cc8 EFLAGS: 00010257
>     RAX: dffffc0000000000 RBX: ffff888104c67d80 RCX: ffffffffc0406cb8
>     RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffffffff862d93a4
>     RBP: ffff888104c67d90 R08: 0000000000000001 R09: 0000000000000001
>     R10: ffffffff89406e57 R11: ffff888104c9d700 R12: ffff888113c48038
>     R13: 0000000000000000 R14: ffff888113c48000 R15: ffff888104646820
>     FS:  00007f7904d29780(0000) GS:ffff8881fd81d000(0000) knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 00007f7904e388e0 CR3: 000000010662c002 CR4: 0000000000770ef0
>     PKRU: 55555554
>     Call Trace:
>      <TASK>
>      snd_mixer_oss_ioctl1+0x25d/0x16f0 [snd_mixer_oss]
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __pfx_snd_mixer_oss_get_volume1+0x10/0x10 [snd_mixer_oss]
>      ? __pfx_snd_mixer_oss_ioctl1+0x10/0x10 [snd_mixer_oss]
>      ? lock_release+0xc8/0x280
>      ? pmbd_site_is_armed+0xa1/0xd0
>      ? lockdep_hardirqs_on_prepare+0xea/0x1a0
>      ? trace_hardirqs_on+0x18/0x160
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? _raw_spin_unlock_irqrestore+0x44/0x60
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? pmbd_gate_site_armed+0x31/0x1c0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? pmbd_probe_hit_cookie+0xee/0x1c0
>      ? __pfx_pmbd_probe_hit_cookie+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? selinux_file_ioctl+0xaa/0x280
>      snd_mixer_oss_ioctl+0x4a/0x80 [snd_mixer_oss]
>      ? __pfx_snd_mixer_oss_ioctl+0x10/0x10 [snd_mixer_oss]
>      __x64_sys_ioctl+0x163/0x1d0
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     RIP: 0033:0x7f7904e3891b
>     Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
>     RSP: 002b:00007ffc72071e20 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>     RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f7904e3891b
>     RDX: 00007ffc72071e84 RSI: 0000000080044d00 RDI: 0000000000000003
>     RBP: 0000000000000003 R08: 0000000000000000 R09: 0000000000000000
>     R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffc72072e12
>     R13: 00007ffc72072060 R14: 00007f7904f67000 R15: 000055cd1e601d50
>      </TASK>
>     Modules linked in: snd_dummy(O) snd_mixer_oss(O)
>     ---[ end trace 0000000000000000 ]---
>     RIP: 0010:snd_mixer_oss_get_volume1+0xd1/0x610 [snd_mixer_oss]
>     Code: 00 c7 03 64 00 00 00 e9 b8 01 00 00 e8 e8 82 44 c1 49 8d 75 04 48 b8 00 00 00 00 00 fc ff df 48 89 f2 48 89 34 24 48 c1 ea 03 <0f> b6 14 02 48 89 f0 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 3f
>     RSP: 0018:ffff888104c67cc8 EFLAGS: 00010257
>     RAX: dffffc0000000000 RBX: ffff888104c67d80 RCX: ffffffffc0406cb8
>     RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffffffff862d93a4
>     RBP: ffff888104c67d90 R08: 0000000000000001 R09: 0000000000000001
>     R10: ffffffff89406e57 R11: ffff888104c9d700 R12: ffff888113c48038
>     R13: 0000000000000000 R14: ffff888113c48000 R15: ffff888104646820
>     FS:  00007f7904d29780(0000) GS:ffff8881fd81d000(0000) knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 00007f7904e388e0 CR3: 000000010662c002 CR4: 0000000000770ef0
>     PKRU: 55555554
>     Kernel panic - not syncing: Fatal exception
>     Kernel Offset: disabled
>     Rebooting in 1 seconds..
> 
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
