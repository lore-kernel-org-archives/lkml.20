Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF98322A2E;
	Tue, 13 Oct 2026 09:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885186; cv=none; b=EPEdKwFNn3dEwJMRfqaBcwo6iQvgfHH1S8dNdmfHVVe1BwWkmvxiAlPCSI44vcImeE8rFq1ANJxgP8pUc21ms9eC1kUgeph80NhLEDSF3/qoL23DOXLAcl43HbjAxlT9HvRFQnTcQ35HiXCXVX0u0jGw8ZGaFikc+E+ujhf0fh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885186; c=relaxed/simple;
	bh=50CYxcAt+PdnYSTKLTPrImEuPfLgAEZMJJXM77Th0Eg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KRlgGFBRw//H01rlj04cRc9YtV31g4VXMWleBmO6U5AAqoXhRBbIKiAZmC/HXZgwjroFTq25Zn1UktB/oIiHCKr2ij2NeynKlUK3AMABHAztl3wSgXcUSPXb80r1hT6tkEP1tbc3IkjgnrVTKSZGgMPE2uE0B1tuiBdRskjaNvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GQZw7Nhf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=e6dI9lDP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ge8G8tYZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PKjrMQe0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GQZw7Nhf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="e6dI9lDP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ge8G8tYZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PKjrMQe0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D1BCD22018;
	Tue, 13 Oct 2026 09:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791885183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dLGrRVGebtrrYnhzcB26rT1FNHoeKMuAoOsUQCo7tQY=;
	b=GQZw7NhfG04R3W6i5E0dg77K2bZs/ZUaAIF0HSYHj/MorljtTr3ABRgQH0Gk7HgWDqv44R
	AY6fdmzrNBOxHAYRIzZB5/DJPUmeLwTcVW1Ugg8iA2rfwI3Nu441v+4XVak5h89XBAmQTB
	lLhBcIf/o8dIR7QzL1zH0W2aXa9aFfc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791885183;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dLGrRVGebtrrYnhzcB26rT1FNHoeKMuAoOsUQCo7tQY=;
	b=e6dI9lDP3wv8LAL8cezud999vq1dGLaT0iMjghFOisZxScoHPXQoJhZhrptHyrrMxDST0t
	qsOFXGfGn7YoQAAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ge8G8tYZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PKjrMQe0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791885181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dLGrRVGebtrrYnhzcB26rT1FNHoeKMuAoOsUQCo7tQY=;
	b=Ge8G8tYZ0ZIWfSBrlcozzrwTcbfgzUCfLRh9etNrZfQZgVpKvz1SI4HTKFA1IztByQcp/l
	+uS4J15bMG3VRCpCdLVzKCO5qJ+Z4+UEt50uEhO4LTI5zcxGgDK3q8s+dj0B/+WUi0fzx2
	6ejwUnba8w/npN1VtgSEKLi5PxTG0aI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791885181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dLGrRVGebtrrYnhzcB26rT1FNHoeKMuAoOsUQCo7tQY=;
	b=PKjrMQe0wpAN/2ZCiELqteuFhfI9OvQV/LP1aYpnMin8VaSToUO08uqYqS6hcjqlwHpwWu
	3bWIAVtnxGw2hqCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33F5913432;
	Tue, 13 Oct 2026 09:53:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id u1XnA33/zWp0AgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Oct 2026 09:53:01 +0000
Date: Tue, 13 Oct 2026 11:53:00 +0200
Message-ID: <877bjmgc5f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	2022090917019@std.uestc.edu.cn,
	hemanth.selam@gmail.com,
	nfraprado@collabora.com,
	songxiebing@kylinos.cn,
	sammiee5311@gmail.com,
	kees@kernel.org,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: hda: Serialize virtual-master hook registration
In-Reply-To: <pm-pmb-c2667fb9cc42fbb7943c-v2-d4b95981cdbb696491c5@gmail.com>
References: <pm-pmb-c2667fb9cc42fbb7943c-v2-d4b95981cdbb696491c5@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO
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
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,std.uestc.edu.cn,gmail.com,collabora.com,kylinos.cn,kernel.org,vger.kernel.org];
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
X-Spam-Level: 
X-Rspamd-Queue-Id: D1BCD22018
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Tue, 13 Oct 2026 09:54:55 +0200,
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
> controls_rwsem for writing in snd_hda_add_vmaster_hook() so the callback
> and its argument are installed together with respect to native control
> callbacks. Release it when registration returns, before the caller
> synchronizes the hook.
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
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
> ---
> 
> diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
> index 18838a45e6f72b838eace2d7b21d7a0a3b21017b..029e56ae78727c8cb3c3edbace8b27a5615c2a3c 100644
> --- a/sound/hda/common/codec.c
> +++ b/sound/hda/common/codec.c
> @@ -2024,6 +2024,8 @@ int snd_hda_add_vmaster_hook(struct hda_codec *codec,
>  {
>  	if (!hook->hook || !hook->sw_kctl)
>  		return 0;
> +	/* Serialize hook registration with control callbacks. */
> +	guard(rwsem_write)(&codec->card->controls_rwsem);
>  	hook->codec = codec;
>  	snd_ctl_add_vmaster_hook(hook->sw_kctl, vmaster_hook, hook);
>  	return 0;

It's not nice to use such a low-level guard here in the upper driver.
So I guess it's better to move the rwsem guard into
snd_ctl_add_vmaster_hook().  But it'd need to pass the card pointer,
too.

Alternatively, you can rearrange the assignment in
snd_ctl_add_vmaster_hook() and put a barrier to assure the
hook_private_data store, too.


thanks,

Takashi
