Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9007D4A99C2;
	Thu, 10 Sep 2026 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055738; cv=none; b=l7TQvww1soLVVqfUTG5oi47me9ibZCvQSR32I9h3ppTKgJg6oFMJPIyzx2XE4PW+ZJnj6H1qRIEnwVa+K0/tJzTFgKQ3HysQV4o0zhEacLYR8vxw8sNY22S7dX3TX2XMPKVRYRfVui3Jw/hM/YCjpUDI48Y3/xzB6ITton46ZpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055738; c=relaxed/simple;
	bh=Dcf/H/fn5OHeMnWFATuxwJGtJRRfEq7AoTyU2O3Vfhs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E2XI7GYiTrVxtzs0b5rbGR1OutCkIlEmMHpKtAPzJyfvV37MSxnGC3jGjqgGN54Mqjjjucll1u0nSZPXkuI+nTH459fQfOFCT/nLWfbaR//m79tSHaWESOOPlscBkZj5rbO3fR55QaB95kQ83EdIVufO4VaQcOIvRcNc3ru85tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gfbBY2sM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jj1KZhg7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Te8hChC2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pubmd7u/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gfbBY2sM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jj1KZhg7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Te8hChC2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pubmd7u/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EE99021294;
	Thu, 10 Sep 2026 15:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789055730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XlRHWYTcy6xQDck7lMF3WTrOkXRo1M8AXw1STCUV6zs=;
	b=gfbBY2sMxy4vThKzwI8yyV9PuljbrcmtVKJUDZJ+8jao8uR0jyBNY9zSmY94wqWCy8tDiz
	o+zknTSzB1Qi4g+KSuqIvj2+/hTGXQRZ4UG6MNhqDkKDHiYYabCwD1PUNi7m+ffkd8UEXX
	52sT+kvqQZQIgZIcmtn/gxSNCB7YitU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789055730;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XlRHWYTcy6xQDck7lMF3WTrOkXRo1M8AXw1STCUV6zs=;
	b=Jj1KZhg7brRE6p1kzz62Uyu/gRIajd7s6vGlC5O2zUNb+Wqxdf2RQb+f424oD6QB5zLgQr
	MSjYn28ov7/C1yAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Te8hChC2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="pubmd7u/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789055725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XlRHWYTcy6xQDck7lMF3WTrOkXRo1M8AXw1STCUV6zs=;
	b=Te8hChC22pjPIwU6rAWwjC+eZb6OhMLFkle5oCoC7xywCYRDW6P5INVDvWjl2z7DdzRkXz
	MnghyKzKThtkBRAmU36KVMq1mBmq3yhPToifCOWqn6ddMMF/8yJb++/JI+rKcdzva12zm3
	u1YM6KhuDCq/xwsTy7jkK8zRzhvyLLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789055725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XlRHWYTcy6xQDck7lMF3WTrOkXRo1M8AXw1STCUV6zs=;
	b=pubmd7u/MyLiTil2bxy8NrEMCNi0QX1Y/owgovlCMLZiPLKHKoEEopndhj/qFi2FF/n19s
	Sy9eMtDHW2T24pAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A77C31326D;
	Thu, 10 Sep 2026 15:55:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Cx6pJ+3SomqlLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Sep 2026 15:55:25 +0000
Date: Thu, 10 Sep 2026 17:55:25 +0200
Message-ID: <87y0d9je36.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andrew Udvare <audvare@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker dropouts on MSI GE66 Raider 11UE
In-Reply-To: <20260909193104.26508-1-audvare@gmail.com>
References: <20260909193104.26508-1-audvare@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: EE99021294
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Wed, 09 Sep 2026 21:31:04 +0200,
Andrew Udvare wrote:
> 
> The speakers on this laptop are driven by a Realtek ALC1316 smart amplifier
> sitting behind the ALC298 processing-coefficient tunnel. Nothing configures
> it, so it runs on its power-up defaults with silence detection enabled: the
> speaker path is muted after roughly 0.2 s of quiet and takes roughly 0.4 s
> to reopen. Anything arriving in that window is lost, so the beginning of
> every sound that follows a pause is cut off. It is most obvious with speech
> synthesis, where the first syllable of each utterance disappears, but it
> affects music equally. Headphones do not pass through the amplifier and are
> never affected.
> 
> Measured on the affected machine with generated tones: isolated 150 ms
> bursts spaced one second apart are inaudible, the same bursts spaced 100 ms
> apart are heard, and a continuous tone loses only its first 0.4 s.
> 
> Add a fixup that programs the amplifier's initialisation sequence at codec
> init, which turns silence detection off. Writes go through the tunnel with
> coefficient 0x22 selecting the amplifier, 0x23 carrying the 16-bit
> register, 0x24 and 0x25 the value's high and low halves, and 0x26
> committing.
> 
> Link: https://github.com/thesofproject/sof/issues/5842
> Signed-off-by: Andrew Udvare <audvare@gmail.com>

As it's a non-trivial change, I applied to for-next branch (for 7.4).


thanks,

Takashi
