Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DFF4908CE;
	Mon, 12 Oct 2026 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817066; cv=none; b=E/z3vmxb9TmANF0YM5dCHyBtT9ZjIrTUN29cSBhnwpmR3bthPOA8/5og12yuJxHVmjZlMxYHExCZqDo74xuKNFnIwpB3vM+Ebz4zfwmgFy7JMu8awetqlSC59zzIcDmrhoFo7WvzBJoXLiAYXu1uO3ZuJMyvxviDr/JW+ksNxPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817066; c=relaxed/simple;
	bh=jgkWrRS1kuOixDXjmSqGzzgEBn58oa3IiZw02ig8r4w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=THcg7IYckD/u+e1Noj61qK9LeZHujX4XfWdfqRTzsXDx4+paaxHIuWGZAH6ctVf8YfUbouiwK3de365MCCNzg/61NqQMpv0W3f08Ru3P3DX40xwi+6zh4w2HM0j7P5SN7NTpVmjVXSFKEzDMP23HoEZzDaRKk6TwN6fIj/bZWjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VryG38gP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tGQJtYhb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VryG38gP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tGQJtYhb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VryG38gP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tGQJtYhb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VryG38gP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tGQJtYhb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 92BED1F7A6;
	Mon, 12 Oct 2026 14:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791817063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x0beSNIPZY3VBODQQLt6X8tB505Uzs7LokXw8c8p/IU=;
	b=VryG38gP0MCR6I9BXAa08UWiSWO1R+DWxyGjaWI+b4M1ZKYte1cx/42KLduuWKte3DTxxq
	KuuEtHZGBFHFv9nBD5goWwBC0l+0tx/hDRUjaiCWk6IcWU1GrGcCAE14XzUup5aDeq34j1
	L38iKlsbmvAqzwRaSGRBN5E6UlZBiBQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791817063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x0beSNIPZY3VBODQQLt6X8tB505Uzs7LokXw8c8p/IU=;
	b=tGQJtYhb1WZC0fNcuqLnGaQePuUo1Oujsrj99rSX+IY9hEEyWdLS7kQmTSdXTqIF0J02oW
	mj6VHY7xjtzHKKCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VryG38gP;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tGQJtYhb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791817063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x0beSNIPZY3VBODQQLt6X8tB505Uzs7LokXw8c8p/IU=;
	b=VryG38gP0MCR6I9BXAa08UWiSWO1R+DWxyGjaWI+b4M1ZKYte1cx/42KLduuWKte3DTxxq
	KuuEtHZGBFHFv9nBD5goWwBC0l+0tx/hDRUjaiCWk6IcWU1GrGcCAE14XzUup5aDeq34j1
	L38iKlsbmvAqzwRaSGRBN5E6UlZBiBQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791817063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x0beSNIPZY3VBODQQLt6X8tB505Uzs7LokXw8c8p/IU=;
	b=tGQJtYhb1WZC0fNcuqLnGaQePuUo1Oujsrj99rSX+IY9hEEyWdLS7kQmTSdXTqIF0J02oW
	mj6VHY7xjtzHKKCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43D3C13408;
	Mon, 12 Oct 2026 14:57:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id F/Q0CWf1zGozUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 Oct 2026 14:57:43 +0000
Date: Mon, 12 Oct 2026 16:57:37 +0200
Message-ID: <87fqybge5a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ali Ahmet =?ISO-8859-2?Q?Memi=BA?= <aliamemis@disroot.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+40b06a86af225236fdb4@syzkaller.appspotmail.com
Subject: Re: [PATCH] ALSA: hda: intel: Don't free card in the probe work
In-Reply-To: <20261012143508.1830791-1-aliamemis@disroot.org>
References: <20261011200648.1662935-1-aliamemis@disroot.org>
	<875wz7idx3.wl-tiwai@suse.de>
	<20261012143508.1830791-1-aliamemis@disroot.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
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
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[40b06a86af225236fdb4];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Spam-Level: 
X-Rspamd-Queue-Id: 92BED1F7A6
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Mon, 12 Oct 2026 16:35:05 +0200,
Ali Ahmet Memiº wrote:
> 
> On Mon, 12 Oct 2026 09:19:36 +0200, Takashi Iwai wrote:
> > For avoiding the card free, can it be the refcounting like below
> > instead?
> 
> I tried it in QEMU and it hangs on every failed delayed probe even
> without a remove.  snd_card_free() waits for the release of card_dev,
> but the reference taken in azx_probe_work() is dropped only after
> azx_probe_continue() returns, so the work never finishes:
> 
> kworker/1:1+events:
> [<0>] snd_card_free+0x107/0x160
> [<0>] azx_probe_work+0x57d/0x1fa0
> [<0>] process_one_work+0x937/0x1800
> [<0>] worker_thread+0x4ba/0xd20
> [<0>] kthread+0x331/0x420
> 
> It also doesn't help azx_remove() which reads the card without a
> reference before cancel_delayed_work_sync() and frees it again after
> the work.

OK, that's a problem, indeed.  How about replacing snd_card_free()
with *_when_closed() version that doesn't block in addition?

--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -2450,7 +2450,7 @@ static int azx_probe_continue(struct azx *chip, bool free_on_error)
 			dev_warn(&pci->dev, "GPU sound probed, but not operational: please add a quirk to driver_denylist\n");
 		if (free_on_error) {
 			pci_set_drvdata(pci, NULL);
-			snd_card_free(chip->card);
+			snd_card_free_when_closed(chip->card);
 		}
 		return err;
 	}

> Which user-visible change did you mean?  The card now stays until the
> device is removed instead of being freed in the work.

Staying the card means that the card slot will be kept, then if you
probe another card afterwards, it'll end up with assignment on another
card slot.


thanks,

Takashi
