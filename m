Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490014;
	b=mRNiUOo0k5VgLWdMG4aj2o6NXIcEyYqwNcXA5vWeWCUt7SYYmaH2xOTKJqO+Mt+O9ARX
	 zhAMDEkNbn53dIkp9YaVCl9PFZnYba7XJO4gG82kIZ5mDmalA9aMeKciuWA4dx//b4Kza
	 9f9IGGapR5hcuWu50vNKiwhs8jb+o0eQ28AYqTAFfZDnLH4YfzlnXzH6JX2q84d2oBCJs
	 x+AJh6ZDvpgsWewiAa+78ogiIDvsLJREcvz47WhocfbGRuKiGCIXo0izC0Q7BEi/Npitd
	 +KQfl05DNFbqo2Lb0nNZMF6HsI540ESga5JU4DR1Tg6EZ/O5swB0zk7JwuaIBRzp+SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490014;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=3Z30wjXLFQIno+gq5I1WhXfovP5pAQ1vWZ+UsbR2c4A=;
	b=VqbGy/PU7Zrd2srvgeiqTa+p/7KwhMiDJOHeNB1p6ecSK+qXmOlbnNMXvSx8AG1GFf2B
	 3NEm5YPlQUjfpTjY8TDScaRKf3H0WqXTIom4cvqBACekpeLv8/xDGkqw/zzgbN62HFk4d
	 jVhy7fLiEXTh3ml74y0W+76BSdA/OhaaIhfj7Yw9lGFIDdUzj4/uzChRakQwqPLYTyvvK
	 lYUmNiq6Vgfp3nJBI2ZGhCX6zGAiPdPuerJ2i717Qk33E0dYpltktBWOO0LpWNy9mEnUz
	 SWd6TzVU5ttYFLtoaOAaGJ5GW0xfKXZ3K3twhFo3W823nAgO7hnqTu5YdTXcRQf0Itg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KybAABcX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LvhxK40g;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ovxmZ2Sb;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=M6aN7GSH;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1258C606A31C;
	Thu, 12 Nov 2026 13:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1258C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KybAABcX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LvhxK40g;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ovxmZ2Sb;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=M6aN7GSH
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E73901F444;
	Thu, 12 Nov 2026 13:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794490012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z30wjXLFQIno+gq5I1WhXfovP5pAQ1vWZ+UsbR2c4A=;
	b=KybAABcXH3ZfOnwS0LG1XO20OrgsuXCt5Dp7Avn0D8uPWi/Tm8OHq4ssQqQNjA+zhpD0j3
	dkedCnTDgLnli/8DYTVv8RobJoS+CktKYLdWkBUw2HptMSqnSqe3i6a2EtCxMJV1locUKj
	Bs2vfZlU5rP6h3YQT6sOLFVqwPtdjnI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794490012;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z30wjXLFQIno+gq5I1WhXfovP5pAQ1vWZ+UsbR2c4A=;
	b=LvhxK40gQS2uWEqtqAhe6wYb8aCFF4zkN7tnUBdAhFEhY4kjkYSSl7Tc0Veg10Oir0kFQY
	TEM6CWM81jMoG0Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ovxmZ2Sb;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=M6aN7GSH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794490011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z30wjXLFQIno+gq5I1WhXfovP5pAQ1vWZ+UsbR2c4A=;
	b=ovxmZ2SbL21RSBEbuR6JVdY7W83jx1pw2qtMUFo9akuSdOTInpGoVL/c+m8FRJJvSMD7vx
	0zhlZqSzbYw9TMPUcGBPFU749ObDvCbj0PcNYJQ88/lTfMhopC4ZkxNGW8/xlT/gEquKpk
	eC2Atpz82vsqiRabzKAC64R3QGwby3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794490011;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z30wjXLFQIno+gq5I1WhXfovP5pAQ1vWZ+UsbR2c4A=;
	b=M6aN7GSHSWD2/vheBPrZfBspls9AiXXErvnAeWX5yUuLmY7GsIq6CGz0mOPqsi3QHjfKDy
	qs4EikBlEvt4yWBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8BFEC134A0;
	Thu, 12 Nov 2026 13:26:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Pt6iGpu+9WrxAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Nov 2026 13:26:51 +0000
Date: Thu, 12 Nov 2026 14:26:51 +0100
Message-ID: <87bj7urxic.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	ivan.orlov0322@gmail.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ALSA: pcmtest: Add a volume control with event fault injection
In-Reply-To: <cover.1794386073.git.sammiee5311@gmail.com>
References: <cover.1794386073.git.sammiee5311@gmail.com>
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
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,gmail.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -11.01
X-Spam-Level: 
X-Rspamd-Queue-Id: E73901F444

On Wed, 11 Nov 2026 10:04:27 +0100,
HyeongJun An wrote:
> 
> Hello Takashi,
> 
> This is the non-RFC version of [1], which Mark found reasonable [2].
> 
> Patch 1 fixes the places where pcmtest.rst does not match the driver.
> Patch 2 adds the volume control and its two fault parameters, and
> documents them.
> 
> mixer-test results on the new control, under qemu on sound/for-next:
> 
>   no fault                    all 8 checks pass
>   inject_ctl_no_event=1       only event_missing fails
>   inject_ctl_spurious_event=1 only event_spurious fails
> 
> The pcmtest selftest still passes all 10 tests.
> 
> Changes since the RFC:
> - document the new parameters
> - rename the control to "Test Playback Volume", which the OSS mixer
>   emulation does not map
> - add the documentation fix as patch 1
> 
> [1] https://lore.kernel.org/all/20261103011000.1012035-1-sammiee5311@gmail.com/
> [2] https://lore.kernel.org/all/61df01a7-10ee-407e-879f-d9c1085a5d43@sirena.org.uk/
> 
> Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64 under qemu.
> 
> Best regards,
> HyeongJun An
> 
> HyeongJun An (2):
>   ALSA: doc: pcmtest: Update to match the driver
>   ALSA: pcmtest: Add a volume control with event fault injection

Applied both patches to for-next branch.  Thanks.


Takashi
