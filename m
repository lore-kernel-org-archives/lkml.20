Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811657;
	b=Xl85OGLRX273UO21hLhlb1g0NgTahniX6sNgyQCloObuYutFq0z4BB+4cdInVeiIVZuu
	 kc3JaNL3DVenbYXDPU/B9Det85/N27xmOHidO6HlLskbdG7aipkAc7N5kjycxY5AqMy6t
	 p38nQ4XIP89slfGz+i/lO0eli+JC2+lpTAX5ZLaGdMpcxFbp8FNEVBq7FKzkRSHRG/s/h
	 YNi2yPE9B3IVfpA+yc53pnMI4HJ3SVemliUyW+HAzPTxmWIVMz14Eipa/To8WL5Me7u20
	 shaVwQ+XpTQuLD3eX5TQndnDmK24lfEaxt5aH6I6vaM20A5HTnHnaHQ24uKPhHJwSTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811657;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=qxwJEGvRDYC2fouEGGfiHPJUQv0R13J5Ht6/dfbzxcM=;
	b=UbLSUe1XlXU0VOz710dJB9sIOVj7SXoaipw/ZoraYKxFfjNvUxMnGqantGWShggfwvcV
	 Sb1ohPJD8MP+6lQGRl1Joe7vvySCRA1pTYFIFBT2H5WxipOWKBZkxGa2sFiOkefqgiC8w
	 +RVqvf+sv/LfFqA+v5xHEcWdg3WVnWYJuWiTEmTho8rtauH3tEkvlUFe0APu1bc9KwTvR
	 aUH74Yjp8Z+inIe6H5gxkmaz4r3T+u09TKzPi8LyEx3mRz8Ay50l+b3wrxAhD29dExfCQ
	 lMDttdY2iZgC28CXogQKA0MX8FbSGlOhfiq5zZ2VnqK5tbXBvoj6tTfU3XpfAznTMgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rQjQPSQj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=omRhSrXa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gQwOVIEy;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ObuCuOEg;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A9A606A31B;
	Wed,  4 Nov 2026 17:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31A9A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=rQjQPSQj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=omRhSrXa;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=gQwOVIEy;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ObuCuOEg
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3FC3321DD0;
	Wed,  4 Nov 2026 17:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793811655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qxwJEGvRDYC2fouEGGfiHPJUQv0R13J5Ht6/dfbzxcM=;
	b=rQjQPSQj2l5yB3bKAKN2g1VsRAI60z1/4oFRe30ba1Z7jGzS61MRNMbUnxSh4o0dorIGk6
	651/KjgKpg7WH53CVpDF6LSDrGG1Af3p4bBaKibpbKpRYJjVpoNUROmrMxX/z6p3rNyoh0
	bGtyVZOjixaxo38o7PrrvvUUR8Sw7AE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793811655;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qxwJEGvRDYC2fouEGGfiHPJUQv0R13J5Ht6/dfbzxcM=;
	b=omRhSrXaKEkg8mt2IaEzjyLchK8mtuev2VSrsHEtBu49z3EPO0lLIJLsslIMyDWpplRJa8
	Pz90dtTaXprjKmDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=gQwOVIEy;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ObuCuOEg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793811654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qxwJEGvRDYC2fouEGGfiHPJUQv0R13J5Ht6/dfbzxcM=;
	b=gQwOVIEyM+LOahG6CoWzw8xVOd7smEUwj573HRmNis4z2Djb1ewLhdjhRVZvJTYt0JGyaU
	ycYjTYmf/ldmUByFCuihkCmUZcCAnqQ+afU3uAaxSqA8s1poZBQbgwGKmyrjSpE+MUOn8I
	xFF7cBiZcGO3t9Gn4mSn0ExxFzUAnWc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793811654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qxwJEGvRDYC2fouEGGfiHPJUQv0R13J5Ht6/dfbzxcM=;
	b=ObuCuOEg/7P5VBksV8YBaYum9zh6JaJFQM3UU9tUgBUFGr0r813oocxzxYm2Op9pA8qHH2
	jwwMwFAclu6tjuBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D51E4134A5;
	Wed,  4 Nov 2026 17:00:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WcIlLMVk62pGDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 17:00:53 +0000
Date: Wed, 04 Nov 2026 18:00:53 +0100
Message-ID: <87h5hwtttm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/generic: Add indep_dig_outs hint
In-Reply-To: <20261102-indep-dig-outs-v1-1-b468f76bdd2e@telaak.dev>
References: <20261102-indep-dig-outs-v1-1-b468f76bdd2e@telaak.dev>
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
X-Rspamd-Queue-Id: 3FC3321DD0
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
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,telaak.dev:email,suse.de:dkim]
X-Spam-Score: -12.51

On Tue, 03 Nov 2026 00:55:23 +0100,
Joseph Telaak wrote:
> 
> The generic parser gives a codec one digital playback PCM. Any further
> digital output pin is set up as a follower of the first: it gets the
> same stream tag, so every digital jack plays the same stream. That is
> the right default for a codec with, say, a coax and an optical jack.
> 
> Some boards wire two digital converters to different places instead.
> On the Control4 HC-800, an ALC888 has converter 0x10 driving pin 0x11,
> which feeds an HDMI transmitter, and converter 0x06 driving pin 0x1e,
> the S/PDIF coax jack. These are two outputs that should play different
> streams at the same time. The follower setup cannot express that, and
> userspace cannot split one stream tag in two.
> 
> Add an "indep_dig_outs" hint. Like indep_hp does for the headphone DAC,
> it gives the second digital output pin its own stream: its own
> hda_multi_out and its own PCM, "Alt Digital", typed from its pin and
> with its own IEC958 controls. The digital playback ops pick the
> multiout by the stream's NID. The analog "IEC958 Default PCM"
> duplication stays on the first digital output only. Unlike indep_hp,
> the split is fixed at parse time; there is no mixer switch. A codec
> driver can also set spec->indep_dig_outs itself. Without the hint or
> the flag nothing changes.
> 
> The new PCM takes the next free device number of its type. With an
> HDMI-typed first output and an S/PDIF-typed second one, as on the
> HC-800, the HDMI output stays the "Digital" PCM (device 3) and the
> coax output becomes "Alt Digital" (device 1), with its IEC958 controls
> at index 16.
> 
> Assisted-by: LLM
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
> Tested on a Control4 HC-800 (Atom D525, ALC888-VD) with this patch on 7.1.8,
> with [hint] indep_dig_outs = yes in an hda patch file: HDMI and coax run at
> the same time on separate stream tags, also at different rates (48 kHz and
> 44.1 kHz) and alongside the analog output. Each IEC958 switch affects only
> its own converter, and closing or reopening one output leaves the other
> running. The HDMI transmitter fed from pin 0x11 (an ADV7513) decodes the
> sample rate of the Digital PCM in every combination, and never the Alt
> Digital one. With the coax output connected to an external S/PDIF receiver,
> the coax carries the Alt Digital PCM bit-exact and never the Digital one, at
> equal and at different rates. Built on sound.git for-next with W=1, with no
> new warnings.
> 
> The HC-800 turns this on with a patch file, and the patch adds no quirk for
> it. It is meant as a generic option for any board whose digital outputs go
> to different places.

Applied to for-next branch now.  Thanks.


Takashi
