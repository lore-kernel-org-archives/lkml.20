Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903BB334692;
	Wed, 14 Oct 2026 06:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791958521; cv=none; b=LbnD84Q93yVDvy5XOyPF1hh6NzvLJs7uUER56bUYpxGl2FoL4e22oFiK6HCazbAs7cBnIEM0+c2NY86YmO5ejWfifmixkbbBo939284BK0fR4CqET9TLW7om3NVAMefIoyPeAy2TuMaAr6hZ7ORZGzl/CJ3TcgLnrvWViaJAvkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791958521; c=relaxed/simple;
	bh=84Nq3lZeWPjPrkfggO4wwR0qJjGwAjKkAFbBmQM326o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=auBf1wF2bSHnZ9YGc+gC/i/pCqNYm5wFfPr5huJBB1sMmBJhuYaD3XU9MbdbTM1NdmPZolkgoI+jqqMUKuC+OWzHsGuJ3YDVNZNJjkLnNslidhAD5jN9teTWTODZJ25EMylPO4XG/M3JtUk1sXbWnY+izIK8YtRRY1lWDEAUAo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yw5wwPHM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O7YdnDHA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yw5wwPHM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O7YdnDHA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yw5wwPHM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O7YdnDHA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yw5wwPHM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O7YdnDHA"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 56A941F7BD;
	Wed, 14 Oct 2026 06:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791958518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+iVttZPznqDdv5jLhdlalwWX8aojUPqZWAcRZk9zKiU=;
	b=yw5wwPHMFXGUtcAQ+4QgOanpn/wbiBbQaH9m9AuvspOzIpEjJ0CPEzBfUMkxuhr9paCi3r
	RdMYGO72Y5yUixkpv5Nh6ZqsDdDYGmXbRMUOnM4rFKXvqy979cKDRmF7syTKAPhHO1ErXN
	Y7DUPAwRSyfF/86c8YyEzbPmeMmQpPY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791958518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+iVttZPznqDdv5jLhdlalwWX8aojUPqZWAcRZk9zKiU=;
	b=O7YdnDHAnFTiaC9mrIn/kwWsR4tLohFGDkjxtvrCwkyugAC978Sc7yGwEa2AvlC1kAayRq
	FZQcozrj7Hi3X2DQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yw5wwPHM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=O7YdnDHA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791958518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+iVttZPznqDdv5jLhdlalwWX8aojUPqZWAcRZk9zKiU=;
	b=yw5wwPHMFXGUtcAQ+4QgOanpn/wbiBbQaH9m9AuvspOzIpEjJ0CPEzBfUMkxuhr9paCi3r
	RdMYGO72Y5yUixkpv5Nh6ZqsDdDYGmXbRMUOnM4rFKXvqy979cKDRmF7syTKAPhHO1ErXN
	Y7DUPAwRSyfF/86c8YyEzbPmeMmQpPY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791958518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+iVttZPznqDdv5jLhdlalwWX8aojUPqZWAcRZk9zKiU=;
	b=O7YdnDHAnFTiaC9mrIn/kwWsR4tLohFGDkjxtvrCwkyugAC978Sc7yGwEa2AvlC1kAayRq
	FZQcozrj7Hi3X2DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A3731368E;
	Wed, 14 Oct 2026 06:15:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uzffOfQdz2rdJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 06:15:17 +0000
Date: Wed, 14 Oct 2026 08:15:16 +0200
Message-ID: <87cxtcg64r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	2022090917019@std.uestc.edu.cn,
	nfraprado@collabora.com,
	cezary.rojewski@intel.com,
	cassiogabrielcontato@gmail.com,
	songxiebing@kylinos.cn,
	sammiee5311@gmail.com,
	hemanth.selam@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	tiwai@suse.de
Subject: Re: [PATCH v2] ALSA: vmaster: Serialize hook registration with control callbacks
In-Reply-To: <pm-pmb-c2667fb9cc42fbb7943c-v4-b7bc2fe90e950accb3f7@gmail.com>
References: <pm-pmb-c2667fb9cc42fbb7943c-v4-b7bc2fe90e950accb3f7@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 56A941F7BD
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
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kernel.org,std.uestc.edu.cn,collabora.com,intel.com,gmail.com,kylinos.cn,vger.kernel.org,suse.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Wed, 14 Oct 2026 05:59:49 +0200,
Cen Zhang wrote:
> 
> An HDA virtual-master hook must have its private argument initialized
> before a control callback can invoke it. snd_hda_add_vmaster_hook()
> installs the trampoline through snd_ctl_add_vmaster_hook(), which stores
> master->hook before master->hook_private_data without serialization.
> 
> When a codec with a vmaster mute hook binds to an already registered
> card, snd_hda_gen_build_controls() publishes and initializes the Master
> Playback Switch before installing the hook. A native write that changes
> the switch can then run in the following order:
> 
>   1. The codec bind path publishes and initializes the master control in
>      __snd_hda_add_vmaster(), then calls snd_hda_add_vmaster_hook().
>   2. The hook setter stores master->hook, but has not yet stored its
>      private argument.
>   3. SNDRV_CTL_IOCTL_ELEM_WRITE takes controls_rwsem and calls
>      master_put() while the setter remains between those stores.
>   4. master_put() sees the callback and invokes vmaster_hook() with a
>      NULL argument. The trampoline dereferences it before the setter
>      can complete publication.
> 
> The write lock held by snd_ctl_elem_write() does not exclude the hook
> setter, so this can cause a NULL pointer dereference. Take the same
> controls_rwsem for writing inside snd_ctl_add_vmaster_hook() so the
> callback and its argument are installed together with respect to
> native control callbacks. Pass the card into the helper and update
> the HDA caller, keeping the lock in the ALSA core. Release it when
> registration returns, before the caller synchronizes the hook.
> 
> KASAN report as below:
> 
>     Oops: general protection fault, probably for non-canonical address 0xdffffc0000000001: 0000 [#1] SMP KASAN NOPTI
>     KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
>     CPU: 1 UID: 0 PID: 499 Comm: alsa-vmaster-tr Not tainted 7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     RIP: 0010:vmaster_hook+0x35/0xb0
>     Code: f5 53 48 89 fb 48 83 ec 08 e8 57 f0 9a fc eb 50 e8 50 f0 9a fc 48 8d 7b 08 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <80> 3c 02 00 75 59 48 8d 7b 10 48 8b 43 08 48 ba 00 00 00 00 00 fc
>     RSP: 0018:ffff888117647cd0 EFLAGS: 00010212
>     RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff84e9ff50
>     RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000008
>     RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000001
>     R10: ffffffff89427457 R11: ffff888115ad1d00 R12: ffffffff84e9ff30
>     R13: ffff888114943ca0 R14: 0000000000000000 R15: 0000000000000001
>     FS:  00007fe8167b3780(0000) GS:ffff88826b7e3000(0000) knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: 0000557c8c2842a8 CR3: 000000011579f005 CR4: 0000000000770ef0
>     PKRU: 55555554
>     Call Trace:
>      <TASK>
>      master_put+0x20e/0x2b0
>      snd_ctl_elem_write+0x37f/0x5e0
>      snd_ctl_ioctl+0x997/0xdd0
>      ? __pfx_snd_ctl_ioctl+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? selinux_file_ioctl+0xaa/0x280
>      ? __pfx_snd_ctl_ioctl+0x10/0x10
>      __x64_sys_ioctl+0x163/0x1d0
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     RIP: 0033:0x7fe8168c291b
>     Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
>     RSP: 002b:00007fffab0cb150 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>     RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fe8168c291b
>     RDX: 00007fffab0cb310 RSI: 00000000c4c85513 RDI: 0000000000000003
>     RBP: 00007fffab0cb310 R08: 0000000000000000 R09: 0000000000000000
>     R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
>     R13: 00007fffab0cb1c0 R14: 0000000000000001 R15: 0000557c4f71fd10
>      </TASK>
>     Modules linked in:
>     ---[ end trace 0000000000000000 ]---
> 
> Fixes: ee52e56e7b12 ("ALSA: hda - Fix mute-LED fixed mode")
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> Assisted-by: LLM

Applied to for-next branch now.  Thanks.


Takashi
