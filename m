Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112DC4E9C14;
	Wed, 14 Oct 2026 12:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982507; cv=none; b=Vblt5AxXO2FyqYD/vkSR5AYxtwA25OCZ2JwjTjON7CudM4KSGAFKNc7H+Xm5uDvmN7mufruqQHPVKJmaipLXOOafggLcLQ43/vDzzcQ8FbSozpPA9ceC/OiH0U/SstxK+WdQmWU9fYi11c602THWP0fqqzVBRfT0XuILLHo1rzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982507; c=relaxed/simple;
	bh=kAGnx0x2hcPL30CMjfJi5ddEiWH8zRIYbQn3Txe0m50=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qiWWkQnBarT2PBM6czReakvrB2zuKdU7oA4rdiAEjnB4LAni0vZCrxzaxNsKgeZygB95aV+fv3AMB4v0Sh9omGS1vbseZVMvbACn5+ginAzs04n+YgoJaz+PUXi1HqkprXDNRniSJsUGTEdnAtLUZKfRcANaWWlwHB8mdbzUYKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WIzXecvx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K1aGpqRC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WIzXecvx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K1aGpqRC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WIzXecvx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K1aGpqRC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WIzXecvx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K1aGpqRC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AB3961FB60;
	Wed, 14 Oct 2026 12:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791982490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=os3Da2QH2l1gaTIXvXtjZKd6x88bLq7SC0LzecHRAAI=;
	b=WIzXecvxBiQFwiBLRmQbCYyML9gtRQZ5NUKGC3YRhllUhSh6iLIhsab5n8rstAL6YWBkeX
	sENP40D1wQ8V1fHSbx+S860qHEOBkGPsJywPDg97/CiM5HhE8MIDECIaYYv0e496aceZsz
	gF3HtXmr+WkGn0354t2GsyqHNf7BaRo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791982490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=os3Da2QH2l1gaTIXvXtjZKd6x88bLq7SC0LzecHRAAI=;
	b=K1aGpqRCOxS0LLLcjcQC7YK6ku43UFoj+hGMmXjKTuVcv1+x2+6TKuIVX8S6ED13BNXVRY
	WAEaSNRn4VufS1Dw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791982490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=os3Da2QH2l1gaTIXvXtjZKd6x88bLq7SC0LzecHRAAI=;
	b=WIzXecvxBiQFwiBLRmQbCYyML9gtRQZ5NUKGC3YRhllUhSh6iLIhsab5n8rstAL6YWBkeX
	sENP40D1wQ8V1fHSbx+S860qHEOBkGPsJywPDg97/CiM5HhE8MIDECIaYYv0e496aceZsz
	gF3HtXmr+WkGn0354t2GsyqHNf7BaRo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791982490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=os3Da2QH2l1gaTIXvXtjZKd6x88bLq7SC0LzecHRAAI=;
	b=K1aGpqRCOxS0LLLcjcQC7YK6ku43UFoj+hGMmXjKTuVcv1+x2+6TKuIVX8S6ED13BNXVRY
	WAEaSNRn4VufS1Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2030C1368E;
	Wed, 14 Oct 2026 12:54:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id r7zvOZl7z2r9FgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 12:54:50 +0000
Date: Wed, 14 Oct 2026 14:54:49 +0200
Message-ID: <87zewgcuhy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	phucduc.bui@gmail.com,
	cezary.rojewski@intel.com,
	cassiogabrielcontato@gmail.com,
	kees+treewide@kernel.org,
	yilinzhang@moonshot.ai,
	sammiee5311@gmail.com,
	kees@kernel.org,
	thomas.weissschuh@linutronix.de,
	tglx@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	tiwai@suse.de
Subject: Re: [PATCH v2] ALSA: pcm: Unlink substreams before releasing them
In-Reply-To: <pm-pmb-9c80f858ccc13b3de84d-v7-fcd8c7aa0e837bf0b036@gmail.com>
References: <pm-pmb-9c80f858ccc13b3de84d-v7-fcd8c7aa0e837bf0b036@gmail.com>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[treewide];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,intel.com,kernel.org,moonshot.ai,linutronix.de,vger.kernel.org,suse.de];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 14 Oct 2026 12:52:15 +0200,
Cen Zhang wrote:
> 
> A closing PCM substream can remain in its linked group after the
> driver close callback has freed its private data. With two configured
> dummy capture substreams on the same PCM device, linked with LINK,
> PREPARE on the surviving substream can still visit the closing member:
> 
>   Final close of A                   PREPARE on linked B
>   ----------------                   -------------------
>   snd_pcm_drop(): group -> SETUP
>   do_hw_free(A)
>   dummy_pcm_close(A): free dpcm
>                                      Take snd_pcm_link_rwsem for reading
>                                      Walk the group, including A
>                                      dummy_pcm_prepare(A)
>                                        Read freed timer_ops
>   pcm_release_private(A)
>     snd_pcm_unlink(A)
> 
> Unlink at the start of final substream release, before dropping the
> stream or releasing driver resources. The link write lock waits for
> an existing group PREPARE, and unlink removes the closing member from
> later group actions. Keep the existing stop synchronization in
> do_hw_free() before the driver resources are freed.
> 
> Make unlink independent of the pcm_release callback so OSS substreams
> are covered too. Remove the native-only unlink callback and its
> registration, while retaining the callback hook for OSS cleanup.
> 
> The existing KASAN report below records the freed timer_ops read in
> dummy_pcm_prepare().
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
> Fixes: 1576274d3028 ("[ALSA] Fix Oops of PCM OSS emulation")
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied to for-next branch now.

A problem with racy link removal Sashiko suggested is an interesting
case to be revisited, but it's no regression and can be triggered
independently from this change.


Takashi
