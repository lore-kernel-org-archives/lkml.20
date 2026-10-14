Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1562037BE81;
	Wed, 14 Oct 2026 07:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962385; cv=none; b=SipcL+0znBhFjvWSQHemjtuFw/Py0ka+2l8kGue04gE8NCy4aKWuCwWk01yGpkMZsslAyEndCfCl5e9D/8jMgTvovUfJstuexMR9J5tqIoYDeMFVnNC00wCoV59iVtangdwE2SxNpW4cEO7+9FEsqCcUIJZ7almfGPFOu1ybQFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962385; c=relaxed/simple;
	bh=OLWvxHlK/pIvDgLktYglhtdP6v0ZNV6ImIyFRtLN7WE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jOQOSEAGhTvwpwedl343eGXsyr6Qq55bvW3Tb2fEOf2x8gF0A+vF96vAPeu3qc5e8D4usHK/Wllvv0F4lAt82BqOp2NAI1E3s0Ym/KgZAp7oTFjRDZtsn2XYgkx8yduM2PXDUDMQE6T4fT+3Rmbn9hifZZUcwcdd1gGc9mOGvRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nWkiHJm0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dR9RVHVu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z/RmM4wJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t6dMdoFW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nWkiHJm0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dR9RVHVu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z/RmM4wJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t6dMdoFW"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF0D922175;
	Wed, 14 Oct 2026 07:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791962382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRYVxI++fS0QZo2yXcnUnT/97oDV2nUc02sQ2k41UyY=;
	b=nWkiHJm0xPKV/dtM/EB4I1Gizy/eZCNnL8noke2Wyq/YF0XSC078MdQPi/DWQ9bRsidHOv
	+r7demFyuhsDVB9Y388IqITUmzzuWHi0miEat3a9RWySJfSQZpAbV707lzk8vsOCzjrNQI
	1K6YJtWUTx9PSOLDhUo42bDd5j6jPVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791962382;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRYVxI++fS0QZo2yXcnUnT/97oDV2nUc02sQ2k41UyY=;
	b=dR9RVHVuszag0VH85goZLUwzGHV6Dd65BvMutQZjQN4IG7sUiPRq5TshTdQSwBqV6eBWGs
	iUQvbOKtSZeYvmAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791962381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRYVxI++fS0QZo2yXcnUnT/97oDV2nUc02sQ2k41UyY=;
	b=Z/RmM4wJzxxGIsBo1r+JyHks/3zPPDiQI9IC4qy9LBkDBVdLFuD+bESv/XCa1VUB0ZrtA4
	g5hFXqxjroMF5W5nFI1AlFffnaVT3rRMPrkcudxxLzx4LEbr5apaqDa6Qr57ei4LlDIbIv
	Qq3YjZJFwzD3KAblP3HrG8gzCAE+CPE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791962381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DRYVxI++fS0QZo2yXcnUnT/97oDV2nUc02sQ2k41UyY=;
	b=t6dMdoFWtDQImGNHeFZV/68MDUWR7gA3LB/c5KTMcRhwgnxv8QOFiBENfP5Xv9jgjHUAdO
	Zfntefw5jXUxraBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3672F13726;
	Wed, 14 Oct 2026 07:19:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IlQvAw0tz2oRcAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 07:19:41 +0000
Date: Wed, 14 Oct 2026 09:19:40 +0200
Message-ID: <877bjkg35f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	sammiee5311@gmail.com,
	phucduc.bui@gmail.com,
	kees@kernel.org,
	thomas.weissschuh@linutronix.de,
	tglx@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: dummy: Defer hrtimer data freeing until runtime detach
In-Reply-To: <pm-pmb-9c80f858ccc13b3de84d-v6-d4059ea2910fe5430f5f@gmail.com>
References: <pm-pmb-9c80f858ccc13b3de84d-v6-d4059ea2910fe5430f5f@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
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
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,kernel.org,linutronix.de,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 14 Oct 2026 07:25:31 +0200,
Cen Zhang wrote:
> 
> The hrtimer record must remain alive while a linked PCM action can
> visit its substream. dummy_pcm_close() frees that record before
> pcm_release_private() unlinks the substream. runtime->private_data still
> points to the freed allocation.
> 
> With two configured dummy capture substreams linked and the hrtimer
> backend selected, final close drops the group to SETUP. A surviving
> peer can then issue PREPARE before the closing substream is unlinked:
> 
>   Target close                       Peer PREPARE
>   snd_pcm_drop(): group -> SETUP
>   do_hw_free()
>   dummy_pcm_close(): kfree(dpcm)
>                                      snd_pcm_action_nonatomic()
>                                        read-lock snd_pcm_link_rwsem
>                                      dummy_pcm_prepare()
>                                        read dpcm->timer_ops
>   pcm_release_private()
>     snd_pcm_unlink(): write-lock
> 
> PREPARE holds the link read semaphore and the members' buffer mutexes,
> but driver close holds neither across the free. Unlink's write lock
> comes too late to protect the record. The ops-pointer read can use freed
> memory and dispatch through an invalid function pointer. If PREPARE
> already obtained the record before close, dummy_hrtimer_prepare() can
> instead write period_time after it has been freed. The report below
> shows the dispatch-time read and the ensuing fault; it does not show
> the later write.
> 
> Defer freeing the hrtimer record to runtime->private_free. Runtime
> detach follows unlink, which waits for existing linked PREPARE actions
> and prevents new ones from visiting the target. Cancel the embedded
> timer in the destructor before releasing its storage. Register the
> destructor from the backend free callback so the open error path also
> releases the record through runtime detach.
> 
> KASAN report as below:
> 
>     BUG: KASAN: slab-use-after-free in dummy_pcm_prepare+0xb7/0xc0
>     Read of size 8 at addr ffff888106b35f00 by task alsa_pcm_fixtur/491
> 
>     Call Trace:
>      <TASK>
>      dump_stack_lvl+0x93/0xd0
>      print_report+0xce/0x630
>      ? dummy_pcm_prepare+0xb7/0xc0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __virt_addr_valid+0x20d/0x410
>      ? dummy_pcm_prepare+0xb7/0xc0
>      kasan_report+0xe0/0x110
>      ? dummy_pcm_prepare+0xb7/0xc0
>      dummy_pcm_prepare+0xb7/0xc0
>      snd_pcm_do_prepare+0x71/0xb0
>      snd_pcm_action_group+0x505/0xb30
>      snd_pcm_action_nonatomic+0xab/0x150
>      snd_pcm_common_ioctl+0x1bf5/0x3a50
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? do_vfs_ioctl+0x1f5/0x1280
>      ? __pfx_do_vfs_ioctl+0x10/0x10
>      ? ioctl_has_perm.constprop.0.isra.0+0x34f/0x500
>      ? __pfx_snd_pcm_common_ioctl+0x10/0x10
>      ? __fput+0x5ba/0xa60
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      snd_pcm_ioctl+0x76/0xb0
>      ? __pfx_snd_pcm_ioctl+0x10/0x10
>      __x64_sys_ioctl+0x163/0x1d0
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     RIP: 0033:0x41ee8d
>     Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
>     RSP: 002b:00007ffcfa72fb60 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>     RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 000000000041ee8d
>     RDX: 0000000000000000 RSI: 0000000000004140 RDI: 0000000000000004
>     RBP: 00007ffcfa72fbb0 R08: 00007ffcfa72fb98 R09: 0000000000000110
>     R10: 0000000000000001 R11: 0000000000000246 R12: 00007ffcfa72fcd8
>     R13: 00007ffcfa72fcf0 R14: 00000000004a8f28 R15: 0000000000000001
>      </TASK>
> 
>     Allocated by task 488:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      __kasan_kmalloc+0xaa/0xb0
>      __kmalloc_cache_noprof+0x251/0x610
>      dummy_hrtimer_create+0x4a/0x170
>      dummy_pcm_open+0xe7/0x730
>      snd_pcm_open_substream+0x926/0x1580
>      snd_pcm_open+0x28d/0x6d0
>      snd_pcm_capture_open+0x82/0xe0
>      snd_open+0x1ec/0x3e0
>      chrdev_open+0x21f/0x660
>      do_dentry_open+0x5c8/0x1300
>      vfs_open+0x87/0x390
>      path_openat+0x2460/0x3cd0
>      do_file_open+0x21e/0x470
>      do_sys_openat2+0xf4/0x1b0
>      __x64_sys_openat+0x136/0x1e0
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     Freed by task 490:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      kasan_save_free_info+0x3b/0x60
>      __kasan_slab_free+0x5f/0x80
>      kfree+0x307/0x580
>      dummy_hrtimer_free+0x72/0xe0
>      dummy_pcm_close+0x9f/0xd0
>      snd_pcm_release_substream.part.0+0x104/0x310
>      snd_pcm_release+0x106/0x240
>      __fput+0x39f/0xa60
>      fput_close_sync+0xff/0x200
>      __x64_sys_close+0x8c/0xf0
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     ==================================================================
> 
> Fixes: c631d03c6873 ("ALSA: dummy - Support high-res timer mode")
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> 
> ---
> 
> diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
> index 6b0a06e5c87638264e5d22deda1fe4bc028febe7..ae7cef9d74819a68dcf951a21768dccf38c7c4ad 100644
> --- a/sound/drivers/dummy.c
> +++ b/sound/drivers/dummy.c
> @@ -476,13 +476,20 @@ static int dummy_hrtimer_create(struct snd_pcm_substream *substream)
>  	return 0;
>  }
>  
> -static void dummy_hrtimer_free(struct snd_pcm_substream *substream)
> +static void dummy_hrtimer_runtime_free(struct snd_pcm_runtime *runtime)
>  {
> -	struct dummy_hrtimer_pcm *dpcm = substream->runtime->private_data;
> +	struct dummy_hrtimer_pcm *dpcm = runtime->private_data;
>  
> +	hrtimer_cancel(&dpcm->timer);
>  	kfree(dpcm);
>  }
>  
> +static void dummy_hrtimer_free(struct snd_pcm_substream *substream)
> +{
> +	/* Linked PREPARE can still use the data until unlink. */
> +	substream->runtime->private_free = dummy_hrtimer_runtime_free;
> +}
> +
>  static const struct dummy_timer_ops dummy_hrtimer_ops = {
>  	.create =	dummy_hrtimer_create,
>  	.free =		dummy_hrtimer_free,

Hmm, it's not clear how this happens.  It looks like a typical
obscuration by AI reports...

Basically dummy_hrtimer_sync_stop should handled the hrtimer cancel,
but maybe the problem is rather its lack at releasing?  If so, the
patch below should cover instead.


thanks,

Takashi

-- 8< --
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2301,6 +2301,8 @@ static int snd_pcm_drop(struct snd_pcm_substream *substream)
 	result = snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
 	/* runtime->control->appl_ptr = runtime->status->hw_ptr; */
 
+	snd_pcm_sync_stop(substream, true);
+
 	return result;
 }
 
