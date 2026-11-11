Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411583;
	b=hXRuzexPyR8M3BJkgJROAK8P3AAsDk3XRtOCpOrGLbLIfAfGma/ENJAHoKiQtiDGJcoj
	 9oZYLLHPEc6T5F1Fm0I1jQ8n1E02YE1NMtyvEDXD6l1qIvsNkLqFDpcPj6SFUWBAja4Ij
	 hZHKKb7Sw0xOmxLnrMeRINQB6piILDigLuwgBZZpTr4H8Tvaz8SC4v9nglplU+nABxHdO
	 o2esQlKi9SphdL2jRH4v/93UZqyKu12FwgHFay8Sc2Ta62M5YWmDSfevy6obt2FS612u3
	 VUedf+kP6bPI1G/29NbIFbBoZlQGPLu1VrocvWh8E7RT/X+Ye2Pr6kRFeApORW/sSXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411583;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=nvpaID2gKp6efy4Wlx4HuTRP0eslc+/9qyuwXt20F0U=;
	b=kU81mS9K+uNyAaKASOlQgGen1Z/kd20hCFRojKn3KOZeayLG1n5KDEoSJDkMhU7rF0hs
	 NZ8eMkom0ncf4KVlF4b/wJiuHjJb/6eD+h7QBPwRkGZzR+IXYk2k2E3kLGtTJwiTJ7jlL
	 lhr8F8kFkc2VrYHIeIvT3pzolyawSdq5myYtH8k5yXxSWbjwhlv5GqGm6NPdh+qk9TrUt
	 OPO2R0jHrSk1wSgP2jqRE0fRHWpSOPpZbNs8WQXzwfrMvRwGixJyA4ITNy0jPL/taS8za
	 BfvYCczw1VAOpA8zMVuKmDZg9HQLlc89P30V5orJQpk/s2z+1AfWATLLaegDtgSPfGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="Po2/AWjZ";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=N0B32M2+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="Po2/AWjZ";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=N0B32M2+;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAA2606A321;
	Wed, 11 Nov 2026 15:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DAA2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Po2/AWjZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=N0B32M2+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Po2/AWjZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=N0B32M2+
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 955961F7A2;
	Wed, 11 Nov 2026 15:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794411580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nvpaID2gKp6efy4Wlx4HuTRP0eslc+/9qyuwXt20F0U=;
	b=Po2/AWjZA0luJNjBtW+YuXRxNrLOnmLAtG5NBaC/6JI75p4GlMKIUVknGGMfZi300RJRsz
	DrK9FumbeVtM71hhiB68Qlxkc9DVplvEpuAhcGLiKVYbuuOP9Tg+JXq6jH0Va2hmRg+w0m
	gdktDoR/jAZ0roe2ysNjDgKhIyFYveE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794411580;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nvpaID2gKp6efy4Wlx4HuTRP0eslc+/9qyuwXt20F0U=;
	b=N0B32M2+8AfF/5WqE5BbNt0cYJ21k9cLv4tHLvzb3IJcVlxQjDZrwHMciZJP7In/uyJ17c
	fQmGc9hJQpy9m9Bg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Po2/AWjZ";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=N0B32M2+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794411580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nvpaID2gKp6efy4Wlx4HuTRP0eslc+/9qyuwXt20F0U=;
	b=Po2/AWjZA0luJNjBtW+YuXRxNrLOnmLAtG5NBaC/6JI75p4GlMKIUVknGGMfZi300RJRsz
	DrK9FumbeVtM71hhiB68Qlxkc9DVplvEpuAhcGLiKVYbuuOP9Tg+JXq6jH0Va2hmRg+w0m
	gdktDoR/jAZ0roe2ysNjDgKhIyFYveE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794411580;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nvpaID2gKp6efy4Wlx4HuTRP0eslc+/9qyuwXt20F0U=;
	b=N0B32M2+8AfF/5WqE5BbNt0cYJ21k9cLv4tHLvzb3IJcVlxQjDZrwHMciZJP7In/uyJ17c
	fQmGc9hJQpy9m9Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4757413511;
	Wed, 11 Nov 2026 15:39:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pzbwCTyM9GrXVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 11 Nov 2026 15:39:40 +0000
Date: Wed, 11 Nov 2026 16:39:39 +0100
Message-ID: <871p8rtm10.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: add micmute LED quirk for Acer Predator PHN16-72
In-Reply-To: <1jca4Y-sRYC8k7kF1YLCmA@gmail.com>
References: <20261111021328.16153-1-faiz.faadhillah@gmail.com>
	<87jymju4jr.wl-tiwai@suse.de>
	<1jca4Y-sRYC8k7kF1YLCmA@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 955961F7A2
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -11.01

On Wed, 11 Nov 2026 13:45:32 +0100,
Fa-Iz Faadhillah Ibrahim wrote:
> 
> On Wednesday, November 11, 2026 3:59:36 PM Western Indonesia Time Takashi Iwai wrote:
> > On Wed, 11 Nov 2026 03:13:28 +0100,
> > Fa-Iz Faadhillah Ibrahim wrote:
> > > 
> > > fix micmute LED for Acer Predator PHN16-72.
> > > 
> > > Signed-off-by: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
> > > ---
> > >  sound/hda/codecs/realtek/alc269.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> > > index a756e0076021..fa78a36bba5f 100644
> > > --- a/sound/hda/codecs/realtek/alc269.c
> > > +++ b/sound/hda/codecs/realtek/alc269.c
> > > @@ -7553,6 +7553,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
> > >  	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC2XX_FIXUP_HEADSET_MIC),
> > >  	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
> > >  	SND_PCI_QUIRK(0x1025, 0x172c, "Acer Nitro ANV16-41", ALC2XX_FIXUP_HEADSET_MIC),
> > > +	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC245_FIXUP_ACER_MICMUTE_LED),
> > >  	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC2XX_FIXUP_HEADSET_MIC),
> > 
> > You see that there is already an entry for 1025:1731.
> > You should replace it with the new quirk instead of appending yet
> > another.
> thanks for the correction, yes I should've replaced it instead.
> > 
> > And, please elaborate a bit more.  You're changing the existing quirk,
> > so you'd need to show that there is no regression by your change.
> I can confirm that the headset mic fixed by the existing quirk does still
> work properly with the new quirk, what do i need to show exactly?

You just need to write down your verification in the patch
description, so that it can convince other users.

After all, you're trying to sell your replacement, so be a good
salesman :)


thanks,

Takashi
