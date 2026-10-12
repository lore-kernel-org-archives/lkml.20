Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739F1223328;
	Mon, 12 Oct 2026 07:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789957; cv=none; b=h9ZbCnjPs0YriM5RcVBwK8qf+9BLAv8jt+Cf9bgC7mbZvToOwVxfddS2kbeikzFZMDodiRQVLo1wN5Ya4fYbluhcGL9vyQ4e21P5iOnQJs2iZPyGkaubcDtFEnvmDMWzweTpSDC8cqeFcsnIRvQ/2EpAj12BPMwi1QyFarJCpA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789957; c=relaxed/simple;
	bh=rwUDJfOuAEno59OlXWEql41+CJQz5EUrlfs7jNV+K7Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tOl16QlnUMrBzwTiY/Q43jZop3D7pwny1LnG94QuFp6iay4P7f9+032ry6gEF7RklhCgALecKCbpPdhYVVphpCtrY1yaB1Uwq5+A34mON6CU1LBCQTvt/XSFE46wj8A8QUMEVaeETvrdJdJ9Bxus+I6m3txjPQUTS78PfgUjcC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zkO4WUPH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eQ0N0jgF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jdgDDeIr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XuIJ/AoE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zkO4WUPH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eQ0N0jgF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jdgDDeIr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XuIJ/AoE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 248641F791;
	Mon, 12 Oct 2026 07:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791789953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dRt2TsoRwj8j35wnKQv6gaQN9QmhW/wtsLcDcB2zaCg=;
	b=zkO4WUPHou6rUxLYDL34pbRxGZ9u6szz9MwqgQQQRX6bYEbUM3s5b/2QPuPAtTYZML6KE1
	fB+X3WQboPNPgf+CI5X5EjVTSAE9rZqmGxZ+BEwRaJndVnr9HdZGIs1X2ppq+pyKLrpGu/
	JpNcZnebSD9k0nWiTHnCEX0IKqgOvKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791789953;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dRt2TsoRwj8j35wnKQv6gaQN9QmhW/wtsLcDcB2zaCg=;
	b=eQ0N0jgF6Zo0thE5OahLlaaRFNNOSJ6DmyTWhawnEYwz8tW0JtH3p6nPoPgj+Flduw64Av
	qmusEmwhEtNVNPDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791789952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dRt2TsoRwj8j35wnKQv6gaQN9QmhW/wtsLcDcB2zaCg=;
	b=jdgDDeIrDgfovinqnUMsiDQCZqKy83rX0OiPT2k5QfeUczvLwR21uCM0Swf3yI2r9G0OEs
	B852+ksMsBwkhwxKDtdBZ9cus433snnKAWEcAO/CH6FkmC5AFwPKwC92mnqiX6yj8pC0km
	XNpuHfsSICgFbKOX7Hw9mY/WVx/wZdE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791789952;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dRt2TsoRwj8j35wnKQv6gaQN9QmhW/wtsLcDcB2zaCg=;
	b=XuIJ/AoEobueMkE7qFFYbYmcUpfSCy6zj6s8+HykPWcCUzK8m+V8HkVE8G3VeQl5nRXWKv
	leZCuXTJ6l9fL6CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B97213314;
	Mon, 12 Oct 2026 07:25:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aRLlE3+LzGpdXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Oct 2026 07:25:51 +0000
Date: Mon, 12 Oct 2026 09:25:50 +0200
Message-ID: <8733ubidmp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	norbert@doyensec.com,
	kees+treewide@kernel.org,
	phucduc.bui@gmail.com,
	danishkhateeb03@gmail.com,
	cassiogabrielcontato@gmail.com,
	maoyixie.tju@gmail.com,
	ivan.orlov0322@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: timer: Pin the module for userspace timer controllers
In-Reply-To: <pm-pmb-98fb8f747fc7b8499fd4-v2-1c531f149a6d6c084f48@gmail.com>
References: <pm-pmb-98fb8f747fc7b8499fd4-v2-1c531f149a6d6c084f48@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[treewide];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,doyensec.com,kernel.org,gmail.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Sun, 11 Oct 2026 18:02:50 +0200,
Cen Zhang wrote:
> 
> The static snd_utimer_ids IDA must remain live until a userspace timer
> controller has returned its ID. However, snd_utimer_fops has no owner,
> so anon_inode_getfd() does not take a reference to snd-timer for the
> controller file.
> 
> With CONFIG_SND_TIMER=m and CONFIG_SND_UTIMER=y, userspace can create a
> controller with SNDRV_TIMER_IOCTL_CREATE and close the native timer
> file. If no timer instances or dependent modules retain snd-timer,
> ordinary module unload can then overlap the controller's final release:
> 
>   Controller final release              Module unload
>   snd_utimer_release()
>     snd_utimer_free()
>       snd_timer_free(): unlink provider
>       snd_utimer_put_id()
>         enter ida_free()
>                                         delete_module()
>                                           alsa_timer_exit()
>                                           free_module(): free MOD_DATA
>         access snd_utimer_ids.xa
> 
> The provider is already absent from snd_timer_free_all() when unload
> runs. Neither register_mutex nor the IDA's lock keeps module storage
> resident through the remaining IDA access. That access can therefore
> use freed module data and fault while acquiring the XArray lock, as
> shown in the Oops below.
> 
> Set snd_utimer_fops.owner to THIS_MODULE so anonymous-file creation
> takes the existing module reference. The VFS drops it only after
> snd_utimer_release() returns, keeping the IDA resident through
> ida_free() and preventing ordinary unload during that interval.
> 
> Oops report as below:
> 
>     BUG: unable to handle page fault for address: fffffbfff80480af
>     #PF: supervisor read access in kernel mode
>     #PF: error_code(0x0000) - not-present page
>     PGD 1a7ff6067 P4D 1a7ff6067 PUD 1a7ff2067 PMD 100ad6067 PTE 0
>     Oops: Oops: 0000 [#1] SMP KASAN NOPTI
>     CPU: 0 UID: 0 PID: 485 Comm: alsa-utimer-fix Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
>     Tainted: [O]=OOT_MODULE
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     RIP: 0010:kasan_byte_accessible+0x15/0x30
>     Code: 00 00 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 48 b8 00 00 00 00 00 fc ff df 48 c1 ef 03 48 01 c7 <0f> b6 07 3c 07 0f 96 c0 e9 69 f1 2b ff 66 66 2e 0f 1f 84 00 00 00
>     RSP: 0018:ffff88811a457c48 EFLAGS: 00010086
>     RAX: dffffc0000000000 RBX: ffffffffc0240578 RCX: 0000000000000000
>     RDX: 0000000000000000 RSI: ffffffff861f111c RDI: fffffbfff80480af
>     RBP: ffffffffc0240578 R08: 0000000000000001 R09: 0000000000000000
>     R10: ffffffff891cc057 R11: ffff88811531ba00 R12: ffffffff861f111c
>     R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>     FS:  00007ff190ff7780(0000) GS:ffff8881fda2a000(0000) knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: fffffbfff80480af CR3: 0000000116890003 CR4: 0000000000770ef0
>     PKRU: 55555554
>     Call Trace:
>      <TASK>
>      __kasan_check_byte+0x13/0x50
>      lock_acquire+0x113/0x2f0
>      ? __pfx_pmbd_probe_hit_cookie+0x10/0x10
>      ? lock_release+0xc8/0x280
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      _raw_spin_lock_irqsave+0x3c/0x60
>      ? ida_free+0xd4/0x2b0
>      ida_free+0xd4/0x2b0
>      ? __pfx_ida_free+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __pfx_locks_remove_file+0x10/0x10
>      ? __fput+0x39f/0xa60
>      ? fput_close_sync+0xff/0x200
>      ? __pfx_fput_close_sync+0x10/0x10
>      ? dnotify_flush+0x22/0x4b0
>      ? __x64_sys_close+0x8c/0xf0
>      ? do_syscall_64+0x115/0x6a0
>      ? entry_SYSCALL_64_after_hwframe+0x77/0x7f
>      </TASK>
>     Modules linked in: snd(O) [last unloaded: snd_timer(O)]
>     CR2: fffffbfff80480af
>     ---[ end trace 0000000000000000 ]---
> 
> Fixes: 37745918e0e7 ("ALSA: timer: Introduce virtual userspace-driven timers")
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied now to for-next branch.  Thanks.


Takashi
