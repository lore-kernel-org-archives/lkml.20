Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABDC43D4EC;
	Wed, 14 Oct 2026 06:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960841; cv=none; b=eviqfoFIAVpkir2T8sRSI6hr+d20acpc2KCI0fdAS4aV0dtkWcZmroNPdgp1UiqNwDrVHEccy7ivKbzmnaZ6KYvXUqe42Z4CbzgLlzdf38urWp3SumnODd0Z34S64/qwa8+5vrEn7aIfUsy91580mi5CgW+eRMt5et+LxomPCSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960841; c=relaxed/simple;
	bh=neLc3P9pWXBI0WfYqwlewdW6/shu+dtCm5r5afpzb20=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OhMZjncbu3CW0KxOfh490RynSOIf/3QyyvkTkGEkpSr5VMI764Y3Cht+0KJ/3B0V9GX3mIPKKtGF2fZ/RTkpF9mqXv1pO95721cK4QJbNKQjjRTekpYz8mX99bs575DwndFkPcYqQpP0RfiTE3XQ6hxZgAwIXKe6Lozp9SGIwu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ts+HP15E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qvV1qVYw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TExD2Zs/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NHcBGDBz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ts+HP15E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qvV1qVYw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TExD2Zs/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NHcBGDBz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DE88F1F749;
	Wed, 14 Oct 2026 06:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791960837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zwpKUQgSjbfPDIjWiJQhYXVmK/7Qj+HlZ9ZXXuzaYzw=;
	b=ts+HP15EXt1OyI6bzCNlyKTy5NhuaUEROoCiHQKX3N5VRUczS+CGiaeurbZUT/aNZTYY1K
	41WInjS4qNApfl2TsYEVvvcmjTdIUTjOiUNz9OlD9HNwIXvl3FXWvP/BB1Ho5yBp5k6fgF
	VpREgMHaEBGPEfrSNVNCmC0wxKwKrE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791960837;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zwpKUQgSjbfPDIjWiJQhYXVmK/7Qj+HlZ9ZXXuzaYzw=;
	b=qvV1qVYwG2Y/gvdbxTiFVQlkXatTCq2SB9V02k1yNItX24aaGP33BKmGl2bBRZaBBHpR2a
	GWpJeQxeSr/DzzCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="TExD2Zs/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NHcBGDBz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791960836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zwpKUQgSjbfPDIjWiJQhYXVmK/7Qj+HlZ9ZXXuzaYzw=;
	b=TExD2Zs/I/U50lWrPpDbjtUgbPD/jSZ/AyN4J5jprFClQTlgfvl4EC5MGNn6TDXkeIwrYo
	ZotznCVnaIX1v4HJrgY+5BHvtmZ2uOChpzvZgJ10tkh5QOnKbDLqa1dCgV/9vkfzWNb3tn
	vnfqv/lUbkOk2I7IcRyMAn/26lt9Pdg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791960836;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zwpKUQgSjbfPDIjWiJQhYXVmK/7Qj+HlZ9ZXXuzaYzw=;
	b=NHcBGDBzX2nTR/8fsEwlfnN7RSczeW6K9uO4T06sg+MADkdDNaRF3J/36nvtpiQGuSe3zO
	bojKHD6s1HhgaJCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 734B613726;
	Wed, 14 Oct 2026 06:53:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id S81/EwQnz2rgUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 14 Oct 2026 06:53:56 +0000
Date: Wed, 14 Oct 2026 08:53:56 +0200
Message-ID: <87a4ogg4cb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	cassiogabrielcontato@gmail.com,
	kees@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: pcm: Reject compat refinement after disconnect
In-Reply-To: <pm-pmb-b3f7b3445bb11aaa9a7b-v2-a514c1399f30f407d626@gmail.com>
References: <pm-pmb-b3f7b3445bb11aaa9a7b-v2-a514c1399f30f407d626@gmail.com>
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
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,kernel.org,vger.kernel.org];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Spam-Level: 
X-Rspamd-Queue-Id: DE88F1F749
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Wed, 14 Oct 2026 06:04:12 +0200,
Cen Zhang wrote:
> 
> A disconnected PCM stream must reject hardware refinement before
> entering its runtime constraint program. The native ioctl path checks
> for SNDRV_PCM_STATE_DISCONNECTED, but snd_pcm_ioctl_hw_params_compat()
> only checks that the runtime exists before handling HW_REFINE32. The
> built-in BUFFER_BYTES rule retains the substream as its private payload
> and reads substream->buffer_bytes_max.
> 
> An open compat PCM file can therefore enter that rule after the
> component has been disconnected, while its owner is about to free the
> component. The request must include SNDRV_PCM_HW_PARAM_BUFFER_BYTES for
> this rule to run. A late HDA codec probe error on an already registered
> card can supply this teardown: snd_card_register() can publish an
> earlier PCM before a later registration fails, and
> snd_hda_codec_cleanup_for_unbind() then disconnects and frees the PCMs
> without the PCM-user drain used by normal codec removal.
> 
> The failing order is:
> 
>   1. The owner calls snd_pcm_dev_disconnect(), which marks the runtime
>      DISCONNECTED and returns.
>   2. The compat file enters snd_pcm_ioctl_hw_params_compat() and then
>      snd_pcm_hw_refine(), reaching snd_pcm_hw_rule_buffer_bytes_max().
>   3. The owner calls snd_device_free(); snd_pcm_free_stream() frees the
>      substream while the rule callback is still in progress.
>   4. The callback reads buffer_bytes_max through its freed private
>      payload, causing a use-after-free.
> 
> The runtime and its rules remain allocated in this component-free path.
> The disconnect locks do not cover the subsequent free or the synchronous
> refinement loop, so they do not prevent this ordering.
> 
> Reject compat HW_REFINE32 with -EBADFD when snd_pcm_get_state() reports
> a disconnected stream, matching the native ioctl. The existing helper
> reads the state under the stream lock. This stops refinement that starts
> after disconnect from entering the rule, closing the described window
> without changing component teardown.
> 
> KASAN report as below:
> 
>     BUG: KASAN: slab-use-after-free in snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
>     Read of size 8 at addr ffff888111b36870 by task pmbd_alsa_reade/486
> 
>     CPU: 2 UID: 0 PID: 486 Comm: pmbd_alsa_reade Tainted: G           O        7.2.0-rc6-pmb-bt-functional-v1+ #1 PREEMPT(lazy)
>     Tainted: [O]=OOT_MODULE
>     Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>     Call Trace:
>      <TASK>
>      dump_stack_lvl+0x93/0xd0
>      print_report+0xce/0x630
>      ? snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? __virt_addr_valid+0x20d/0x410
>      ? snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
>      kasan_report+0xe0/0x110
>      ? snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
>      snd_pcm_hw_rule_buffer_bytes_max+0x276/0x2a0
>      ? snd_pcm_hw_rule_div+0x16b/0x200
>      ? __pfx_snd_pcm_hw_rule_buffer_bytes_max+0x10/0x10
>      ? constrain_params_by_rules+0x17a/0xfe0
>      constrain_params_by_rules+0x506/0xfe0
>      ? __pfx_constrain_params_by_rules+0x10/0x10
>      ? __ia32_compat_sys_ioctl+0x289/0x2f0
>      ? do_int80_emulation+0x14a/0x5e0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? lock_release+0xc8/0x280
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? snd_interval_refine+0x284/0x470
>      snd_pcm_hw_refine+0x768/0xcc0
>      ? __pfx_snd_pcm_hw_refine+0x10/0x10
>      ? _copy_from_user+0x51/0xa0
>      snd_pcm_ioctl_hw_params_compat+0x138/0x280
>      snd_pcm_ioctl_compat+0x4c5/0x7c0
>      ? __pfx_snd_pcm_ioctl_compat+0x10/0x10
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      ? selinux_file_ioctl+0xaa/0x280
>      ? ksys_write+0x16b/0x200
>      ? __pfx_snd_pcm_ioctl_compat+0x10/0x10
>      __ia32_compat_sys_ioctl+0x289/0x2f0
>      ? srso_alias_return_thunk+0x5/0xfbef5
>      do_int80_emulation+0x14a/0x5e0
>      asm_int80_emulation+0x1a/0x20
>     RIP: 0023:0x8049084
>     Code: 80 b8 04 00 00 00 bb 01 00 00 00 b9 43 a0 04 08 ba 2b 00 00 00 cd 80 b8 36 00 00 00 89 f3 b9 10 41 5c c2 ba b8 b0 04 08 cd 80 <85> c0 78 6c b8 04 00 00 00 bb 01 00 00 00 b9 27 a0 04 08 ba 1c 00
>     RSP: 002b:00000000ffd35e40 EFLAGS: 00000246 ORIG_RAX: 0000000000000036
>     RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00000000c25c4110
>     RDX: 000000000804b0b8 RSI: 0000000000000003 RDI: 0000000000000004
>     RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
>     R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
>     R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
>      </TASK>
> 
>     Allocated by task 486:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      __kasan_kmalloc+0xaa/0xb0
>      __kmalloc_cache_noprof+0x251/0x610
>      snd_pcm_new_stream+0x98f/0x1350
>      _snd_pcm_new+0x1d1/0x310
>      snd_pcm_new+0x43/0x60
>      0xffffffffc0401115
>      do_one_initcall+0xf3/0x4e0
>      do_init_module+0x281/0x8e0
>      load_module+0x658c/0x7cc0
>      init_module_from_file+0x15b/0x180
>      idempotent_init_module+0x22d/0x770
>      __x64_sys_finit_module+0xd2/0x160
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     Freed by task 494:
>      kasan_save_stack+0x33/0x60
>      kasan_save_track+0x14/0x30
>      kasan_save_free_info+0x3b/0x60
>      __kasan_slab_free+0x5f/0x80
>      kfree+0x307/0x580
>      snd_pcm_free_stream+0xcf/0x290
>      snd_pcm_free+0xb1/0xf0
>      __snd_device_free+0x1a1/0x490
>      snd_device_free+0xcf/0x190
>      case_owner_ioctl+0xb8/0x160 [pmbd_alsa_fixture]
>      __x64_sys_ioctl+0x163/0x1d0
>      do_syscall_64+0x115/0x6a0
>      entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
>     The buggy address belongs to the object at ffff888111b36800
>      which belongs to the cache kmalloc-1k of size 1024
>     The buggy address is located 112 bytes inside of
>      freed 1024-byte region [ffff888111b36800, ffff888111b36c00)
> 
>     The buggy address belongs to the physical page:
>     page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888111b35800 pfn:0x111b30
>     head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
>     flags: 0x200000000000240(workingset|head|node=0|zone=2)
>     page_type: f5(slab)
>     raw: 0200000000000240 ffff888100042dc0 ffffea0004218610 ffffea00042c6810
>     raw: ffff888111b35800 000000000010000f 00000000f5000000 0000000000000000
>     head: 0200000000000240 ffff888100042dc0 ffffea0004218610 ffffea00042c6810
>     head: ffff888111b35800 000000000010000f 00000000f5000000 0000000000000000
>     head: 0200000000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
>     head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
>     page dumped because: kasan: bad access detected
> 
>     Memory state around the buggy address:
>      ffff888111b36700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>      ffff888111b36780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>     >ffff888111b36800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                                  ^
>      ffff888111b36880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>      ffff888111b36900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>     ==================================================================
> 
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Basically this isn't a problem only about the compat ioctl, but about
the all hw_refine-related ioctls.  That is, snd_pcm_hw_refine() should
have the proper buffer locking and the state check like
snd_pcm_hw_params().  However, since it's called from many places that
are already under buffer lock, we need two functions (with and without
lock/state-check), and it'll be something like below.

Could you verify whether this works?


thanks,

Takashi

-- 8< --
diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index 359197aa6076..c54cb07304ad 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -252,7 +252,7 @@ static int snd_pcm_ioctl_hw_params_compat(struct snd_pcm_substream *substream,
 		return -EFAULT;
 
 	if (refine) {
-		err = snd_pcm_hw_refine(substream, data);
+		err = snd_pcm_hw_refine_with_lock(substream, data);
 		if (err < 0)
 			return err;
 		err = fixup_unreferenced_params(substream, data);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index a845f242a163..a6880a96a918 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -580,29 +580,6 @@ int snd_pcm_hw_refine(struct snd_pcm_substream *substream,
 }
 EXPORT_SYMBOL(snd_pcm_hw_refine);
 
-static int snd_pcm_hw_refine_user(struct snd_pcm_substream *substream,
-				  struct snd_pcm_hw_params __user * _params)
-{
-	int err;
-	struct snd_pcm_hw_params *params __free(kfree) =
-		memdup_user(_params, sizeof(*params));
-
-	if (IS_ERR(params))
-		return PTR_ERR(params);
-
-	err = snd_pcm_hw_refine(substream, params);
-	if (err < 0)
-		return err;
-
-	err = fixup_unreferenced_params(substream, params);
-	if (err < 0)
-		return err;
-
-	if (copy_to_user(_params, params, sizeof(*params)))
-		return -EFAULT;
-	return 0;
-}
-
 static int period_to_usecs(struct snd_pcm_runtime *runtime)
 {
 	int usecs;
@@ -799,6 +776,22 @@ static void pcm_qos_req_update(struct snd_pcm_substream *substream, int usecs)
 					    usecs);
 }
 
+static int hw_params_state_check(struct snd_pcm_substream *substream)
+{
+	guard(pcm_stream_lock_irq)(substream);
+	switch (substream->runtime->state) {
+	case SNDRV_PCM_STATE_OPEN:
+	case SNDRV_PCM_STATE_SETUP:
+	case SNDRV_PCM_STATE_PREPARED:
+		if (!is_oss_stream(substream) &&
+		    atomic_read(&substream->mmap_count))
+			return -EBADFD;
+		return 0;
+	default:
+		return -EBADFD;
+	}
+}
+
 static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
@@ -813,20 +806,7 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 	err = snd_pcm_buffer_access_lock(runtime);
 	if (err < 0)
 		return err;
-	scoped_guard(pcm_stream_lock_irq, substream) {
-		switch (runtime->state) {
-		case SNDRV_PCM_STATE_OPEN:
-		case SNDRV_PCM_STATE_SETUP:
-		case SNDRV_PCM_STATE_PREPARED:
-			if (!is_oss_stream(substream) &&
-			    atomic_read(&substream->mmap_count))
-				err = -EBADFD;
-			break;
-		default:
-			err = -EBADFD;
-			break;
-		}
-	}
+	err = hw_params_state_check(substream);
 	if (err)
 		goto unlock;
 
@@ -947,6 +927,57 @@ static int snd_pcm_hw_params_user(struct snd_pcm_substream *substream,
 	return err;
 }
 
+/*
+ * call snd_pcm_hw_refine() after buffer lock and sanity check;
+ * this one should be used for ioctls and other external paths instead of
+ * direct call of snd_pcm_hw_refine()
+ */
+static int snd_pcm_hw_refine_with_lock(struct snd_pcm_substream *substream,
+				       struct snd_pcm_hw_params *params)
+{
+	struct snd_pcm_runtime *runtime;
+	int err;
+
+	if (PCM_RUNTIME_CHECK(substream))
+		return -ENXIO;
+	runtime = substream->runtime;
+	err = snd_pcm_buffer_access_lock(runtime);
+	if (err < 0)
+		return err;
+	err = hw_params_state_check(substream);
+	if (err)
+		goto unlock;
+
+	err = snd_pcm_hw_refine(substream, params);
+
+ unlock:
+	snd_pcm_buffer_access_unlock(runtime);
+	return err;
+}
+
+static int snd_pcm_hw_refine_user(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params __user * _params)
+{
+	int err;
+	struct snd_pcm_hw_params *params __free(kfree) =
+		memdup_user(_params, sizeof(*params));
+
+	if (IS_ERR(params))
+		return PTR_ERR(params);
+
+	err = snd_pcm_hw_refine_with_lock(substream, params);
+	if (err < 0)
+		return err;
+
+	err = fixup_unreferenced_params(substream, params);
+	if (err < 0)
+		return err;
+
+	if (copy_to_user(_params, params, sizeof(*params)))
+		return -EFAULT;
+	return 0;
+}
+
 static int do_hw_free(struct snd_pcm_substream *substream)
 {
 	int result = 0;
@@ -4218,7 +4249,7 @@ static int snd_pcm_hw_refine_old_user(struct snd_pcm_substream *substream,
 	if (IS_ERR(oparams))
 		return PTR_ERR(oparams);
 	snd_pcm_hw_convert_from_old_params(params, oparams);
-	err = snd_pcm_hw_refine(substream, params);
+	err = snd_pcm_hw_refine_with_lock(substream, params);
 	if (err < 0)
 		return err;
 
