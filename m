Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387360;
	b=QrBiNyqJt+8w6yt0PDiv4Bkp8VXLZ9X37w+n4qljK0T1GEK2mD/BnOnkjleUJRaFWeoL
	 DvAlh19rtVMxA7cDBjK01R87g/NVoWO8aNva2GaC2bpjbURebP84l+V9b2K6pCFiHACAy
	 UP3qbNKpTn5SXbiZRbCL++nlRM/owKWnEI27Zcz6MsF8buhL7VGzyCTjYEFyrnIxkLO5d
	 cv/I3gBy6d61dV9AcuZSu/DDLx15Zgn94Vv7DYXCy0ep39fExR9AOLbydzRgSKjF5Apf3
	 fBZXsotanOpUsrq2T73vxepw7SHbVzBKqM/6WWWZBCJMlaBOYw2bT9n5wbrOFeZueJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387360;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=MC8k8+LVNglx7NfVl53JNeiZh5nsiY1EpRAdjR9NweU=;
	b=oGxz6uTJZnuNCe3fNTJ+qDdSFAInkThOaAvc1UEgp1/wpqPmMC9ewL+1O2jRaA9wEpz8
	 z5WEGYddVk5+fs+gZWqk+2CeyEawuwxuOdGY3k4fiw3UQ5U2cDz0FWdSG/XU3fvnN300P
	 TSuiTfy63s0L5AIwEwtgSlJv1flYVOThoJPN9tszRfbMwKLvC1lkAfFUOORQNDpSj4t0B
	 FqZXfZDloZZRuqUBvtV91flL4EoYVNR5nJaEqiXOt/4ECFbmdNngLwjHptidvjqtFEkRT
	 UWT1Zeuhwpq9fepvvdCI6HjZQh8/cadSLdDKMF52q2V5Dk9GOxDeGGO2JWkOkxtzyUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1kSa3ygX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gBTJ+rfI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1kSa3ygX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gBTJ+rfI;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9075E606A321;
	Wed, 11 Nov 2026 08:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9075E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1kSa3ygX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gBTJ+rfI;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1kSa3ygX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gBTJ+rfI
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 77EB51FB7C;
	Wed, 11 Nov 2026 08:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794387357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MC8k8+LVNglx7NfVl53JNeiZh5nsiY1EpRAdjR9NweU=;
	b=1kSa3ygXzsig/EFJfih8gE4awDqUBE3KMakMqX60KCnfcwYzWNbfeOc8dhH2B4HUP+XugJ
	PwRCqa4mZccIGzHuyZiJ466UL2XpNqMrGARpIENfZjJXaPhvEDxL1OspEHClUI5VHnE7mP
	Pg2dEBxhpY/IntSl6OR61yKzrW/PNdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794387357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MC8k8+LVNglx7NfVl53JNeiZh5nsiY1EpRAdjR9NweU=;
	b=gBTJ+rfIzwkDqftYD6NcRb+pSUzl4iq18d+FcyQrDOvr7rtWCh/p+P1+CthNswB3agoCKb
	eqPQhi4pt7tvFrAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1kSa3ygX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gBTJ+rfI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794387357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MC8k8+LVNglx7NfVl53JNeiZh5nsiY1EpRAdjR9NweU=;
	b=1kSa3ygXzsig/EFJfih8gE4awDqUBE3KMakMqX60KCnfcwYzWNbfeOc8dhH2B4HUP+XugJ
	PwRCqa4mZccIGzHuyZiJ466UL2XpNqMrGARpIENfZjJXaPhvEDxL1OspEHClUI5VHnE7mP
	Pg2dEBxhpY/IntSl6OR61yKzrW/PNdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794387357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MC8k8+LVNglx7NfVl53JNeiZh5nsiY1EpRAdjR9NweU=;
	b=gBTJ+rfIzwkDqftYD6NcRb+pSUzl4iq18d+FcyQrDOvr7rtWCh/p+P1+CthNswB3agoCKb
	eqPQhi4pt7tvFrAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2536D1339F;
	Wed, 11 Nov 2026 08:55:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id d3RvO5wt9GpsMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 11 Nov 2026 08:55:57 +0000
Date: Wed, 11 Nov 2026 09:55:56 +0100
Message-ID: <87mrrfu4pv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] ALSA: ump: Fix RPN/NRPN handling at MIDI 1.0 CC conversion
In-Reply-To: <20261111084734.2592346-1-sammiee5311@gmail.com>
References: <cover.1794141913.git.sammiee5311@gmail.com>
	<87zevhugi6.wl-tiwai@suse.de>
	<20261111084734.2592346-1-sammiee5311@gmail.com>
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
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 77EB51FB7C
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,suse.com,perex.cz,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -12.51

On Wed, 11 Nov 2026 09:47:34 +0100,
HyeongJun An wrote:
> 
> Hello Takashi,
> 
> Thanks for picking these up. I may be missing something, but I don't
> see the four patches in sound.git for-next yet. Only the selftest is
> there (ec925d374015), and without the fixes 11 of its 22 tests fail.
> 
> Could you take a look when you have a moment?

My bad, the patches were dropped mistakenly.  Now applied and pushed
out.


thanks,

Takashi
