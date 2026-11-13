Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794587457;
	b=au3fyWpoS/9L1rx+4fu0ymgzHEG10Un4YxcwC9JuFrvXW0/qAAK/gch5hGErzV71Dmt8
	 tzvvOZ/QBZ/CS5bJeYYzF3n9IShxLD4ppLW8HaRdTc5A/b2kx+n9lJc8KX2ewK9CRA9PK
	 PulwGKk8CnHSpBQWMXitPD4qJFQmfk4BPbn0z5FfzMZWZFJwK2dyslBlpP02X3sxQKWx7
	 jCsGQPY7Tg8Nbpk9ZL/tXjheXPfKhPUb2GQrDz3ionMixAyamkJEpyRfw0CFUyVMW76Sn
	 3izJK5DMprZsszJcd/G28OqYVRJ8v2StccI4sDRIoNIXW8Rba/a4lJD68Fmq8whh+aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587457;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=WX/unREMWHH3328d9roC1pYnSGZP1D9EWEBhaNhK3t0=;
	b=sdmWH8CSjgwgsi4IaNgmtQNMYWcxKJcXZcBM5oIwGf9RERR7o72Ghwao9VuU4G6cZ3zR
	 rYBIbAEqAhl1u1thBup81VrlrvHLnar8KklEeQpsbmgkgzdyzieYZFFhVLnRiUOOPAuIi
	 9rwF3qwnQtwS/PrcOLV4to2uu/EIXvS0TsxGz0OKwczEXrjLxfIf/pj/p4B6XOIT7+Bk5
	 WHdhgPK4jNcGppr6TjBLSFlZ0Ur3/Rmn+lDlqB0ChNZw27u/yNXvHbnEWGk68GhUcv1Kz
	 VPrl7BOGkissyDmIqz7jUYv+xlXF2Y0PjxCZkTt1HVHzM0eeXBLFmw/gHJCdbdoVu2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VKTpUn12;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HQTWMhNF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VKTpUn12;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HQTWMhNF;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13676606A33D;
	Fri, 13 Nov 2026 16:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13676606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VKTpUn12;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HQTWMhNF;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=VKTpUn12;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=HQTWMhNF
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 47FFD1F79B;
	Fri, 13 Nov 2026 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794587455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WX/unREMWHH3328d9roC1pYnSGZP1D9EWEBhaNhK3t0=;
	b=VKTpUn12sAqkcIYtgCWBw+fR1RF4SoNHGRo53UgQe+PxypRET3UFIhPDMa0EyxdOy8hFiP
	QCzrKE5blmrV8ebPo6NunTxMGm/3uKEzH0UQIfhz5V7E58zRZSKxBJYQtQhYzJD6mdXZ3m
	JYtAM6fW4H3uxsULR0g4VyiWG2vChqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794587455;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WX/unREMWHH3328d9roC1pYnSGZP1D9EWEBhaNhK3t0=;
	b=HQTWMhNF45xhT7sfCyI5OgqM4WhUltr86L7Qfn52fnxXymxxLFwiMhS8VYJ9+jDToeHuvj
	/cOa8NibeiA3nVAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VKTpUn12;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HQTWMhNF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794587455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WX/unREMWHH3328d9roC1pYnSGZP1D9EWEBhaNhK3t0=;
	b=VKTpUn12sAqkcIYtgCWBw+fR1RF4SoNHGRo53UgQe+PxypRET3UFIhPDMa0EyxdOy8hFiP
	QCzrKE5blmrV8ebPo6NunTxMGm/3uKEzH0UQIfhz5V7E58zRZSKxBJYQtQhYzJD6mdXZ3m
	JYtAM6fW4H3uxsULR0g4VyiWG2vChqs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794587455;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WX/unREMWHH3328d9roC1pYnSGZP1D9EWEBhaNhK3t0=;
	b=HQTWMhNF45xhT7sfCyI5OgqM4WhUltr86L7Qfn52fnxXymxxLFwiMhS8VYJ9+jDToeHuvj
	/cOa8NibeiA3nVAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05C52134C3;
	Fri, 13 Nov 2026 16:30:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 60z0ND4792rodgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Nov 2026 16:30:54 +0000
Date: Fri, 13 Nov 2026 17:30:54 +0100
Message-ID: <87ik20publ.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?0Ozqz8/o?= <xuhx@hust.edu.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: ALSA: ctxfi: free atimer only after the timer IRQ is quiesced
In-Reply-To: <57529fbf.262c8.1a1d4c65987.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
	<2026102727-data-sequel-ce41@gregkh>
	<57529fbf.262c8.1a1d4c65987.Coremail.xuhx@hust.edu.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 47FFD1F79B

On Fri, 13 Nov 2026 12:58:51 +0100,
ÐìêÏÏè wrote:
> 
> `ct_timer_free()` frees `struct ct_timer` while the ctxfi timer IRQ handler can
> still be executing, or can start after `snd_card_disconnect()` has already done
> its single `synchronize_irq()`.  A handler that has passed the non-atomic
> `hw->irq_callback` check then calls `ct_timer_interrupt()` with the freed
> `atimer`; `free_irq()` only runs later, inside `ct_atc_destroy()` ->
> `destroy_hw_obj()`.  This is a use-after-free on the timer object and can crash
> or wedge the device during PCI removal/unbind.
> 
> The detailed description:
> 
> * Test environment / affected version
> 
>   Linux 7.3.0 source tree under review.  This report is source-level only: no
>   ctxfi hardware was available and QEMU has no ctxfi device model, so no
>   driver-specific reproducer was run.  The source paths/line numbers below are
>   from 7.3.
> 
> * Mechanism
> 
>   `ct_timer_new()` (`sound/pci/ctxfi/cttimer.c:388-411`) installs the native
>   timer callback by default when `!use_system_timer && hw->set_timer_irq`:
> 
>     hw->irq_callback_data = atimer;
>     hw->irq_callback      = ct_timer_interrupt;
> 
>   The PCI IRQ handlers `ct_20k1_interrupt()` (`cthw20k1.c:1878-1891`) and
>   `ct_20k2_interrupt()` (`cthw20k2.c:2045-2059`) do:
> 
>     if (hw->irq_callback)
>         hw->irq_callback(hw->irq_callback_data, status);
> 
>   `ct_timer_interrupt()` (`cttimer.c:379-386`) then reads
>   `timer->ops->interrupt` and calls it with `timer`.  Neither the check nor
>   the two loads is atomic.
> 
>   `ct_timer_free()` (`cttimer.c:414-421`) does:
> 
>     struct hw *hw = atimer->atc->hw;
>     hw->irq_callback = NULL;
>     if (atimer->ops->free_global)
>         atimer->ops->free_global(atimer);
>     kfree(atimer);
> 
>   `ct_xfitimer_free_global()` only calls `ct_xfitimer_irq_stop()`; that helper
>   stops the hardware only if `atimer->running` is set (`cttimer.c:137-145`).
>   It does not wait for an in-flight IRQ handler.
> 
>   `ct_atc_destroy()` (`ctatc.c:1250-1286`) then calls `ct_timer_free()` at
>   1257-1260, calls `destroy_hw_obj(atc->hw)` at 1274-1275, and only after that
>   `kfree(atc)` at 1283.  `destroy_hw_obj()` -> `hw_card_shutdown()` ->
>   `free_irq()` at `cthw20k1.c:1969` / `cthw20k2.c:2140`.  So `atc` itself is
>   not the freed object in this window; `atimer` is freed before `free_irq()`.
> 
> * Why the existing synchronization does not close the window
> 
>   ctxfi does set `card->sync_irq` at `cthw20k1.c:1937` / `cthw20k2.c:2104`,
>   and `snd_card_disconnect()` (`sound/core/init.c:495-562`) calls
>   `synchronize_irq(card->sync_irq)` once at 540-541.  But that call happens
>   before `ct_timer_free()`, only waits handlers that are running at that
>   instant, and does not disable the IRQ line.  A new handler can enter after
>   the one-time sync and before `free_irq()`.
> 
>   The `hw->irq_callback = NULL` store does not close the race either: a
>   handler that loaded the callback pointer before the store can still call it.
> 
> * Trigger model
> 
>   Open a ctxfi device (native timer path, the default), then remove/unbind the
>   PCI device while an interrupt is pending or arrives during teardown.  The
>   window is between `ct_timer_free()` and `free_irq()`.  Consequence: UAF read
>   of `atimer->ops` and timer fields in IRQ context; crash, stall, or potential
>   control-flow corruption.
> 
> * Suggested direction
> 
>   After clearing `hw->irq_callback` and calling `free_global()`, but before
>   `kfree(atimer)`, do:
> 
>     if (hw->irq >= 0)
>         synchronize_irq(hw->irq);
> 
>   Alternatively, move `free_irq()` earlier so it precedes the timer free.
>   Keep the existing `hw->irq == -1` initialization contract.
> 
> 
> Please keep me in Cc; I am not subscribed to the lists.

Could you rather submit a fix patch (with a proper patch description)
for each your reported issue?  You can put Link: tag to pointing to
the earlier reports.


thanks,

Takashi
