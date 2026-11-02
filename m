Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610033;
	b=1ue5lqsQTP/iDCu4pzb1fNFQWb1OdHdZvM0VrB5Dmc7myeRSh0b7LA+r9BbOq+Mnwrbv
	 rEupeLk576sYckEKFToY7dED4sD1KAgNmRWKJy3M02oTotRIJ7Ur9RrwxkGFMJ4Mrfyhk
	 ktR/SY5i+ew+8rJydqpRoH9FTMp6eXuh6xlywEGnIvpukN9nibzlrq2fWM+nZP+/PoinK
	 hQpPNIJKF11jtnz7j8/WqwKlimCyU3KnAN6DbokDQRqO0xGOI0KSBVQVRSGLxomJNkEkF
	 OoCGJIwMYphriLVaKvvaz9HWfEI/+If/W9IXpJHEUd8zXarYH/wZGLdw4VbXb94BzOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610033;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=tXSuDzNrT3fcpHY1zu73T+ik72oiK9rHI1BZCaJtwf4=;
	b=EbbCW/4HYhw8MFKVls/QCnhfplm5cLQhlYL5UWydntdEgYLMhDeK/9NX3rVJ/XICUTCY
	 PfMJzKlj90GtiUarteeI0TlaAU1itGLYbl4VCMyNwQ6/+LcexfaLSFsASPJ8jJNlPzLA1
	 vTdaJBW6zH+LSm+Uz0u0WixLdbPmSRRiUh4rH7FVfW/9jQZCGBF66ogKn5Z+hmOvOfoG9
	 3BDpMO8TZ8I63/roYzlnEc3xpinzPsRZTPPApRrP6WNzpLcBp9Nhg/28WztOpAxI/zn2w
	 PBMMZKlqX4BwSwOpGgefyFE1LL5gRmjdx4dMqeYCGlN/grfHpGbPr5FhbDysHbya7rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TMO6bFYy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="w/fj61sv";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="PwW/BcP/";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cvJsFTam;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E2E606A326;
	Mon,  2 Nov 2026 09:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63E2E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=TMO6bFYy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=w/fj61sv;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PwW/BcP/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cvJsFTam
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CABD4221D4;
	Mon,  2 Nov 2026 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793610031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tXSuDzNrT3fcpHY1zu73T+ik72oiK9rHI1BZCaJtwf4=;
	b=TMO6bFYy4Vz/do+TshvGsRjQm2J2z80Oklc3vOREVgX1Gi2QWSTLjxpHZDZCsNiCrNy7O8
	HZfsWXk6ndO4uUCprV1p/tBqfsLguggynI5oBKYJUEGZGBzqbrzHmDDRvfRrgPaiES/2mr
	NseCAGRydj2LyBQtT9JQcIHeRErmTjA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793610031;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tXSuDzNrT3fcpHY1zu73T+ik72oiK9rHI1BZCaJtwf4=;
	b=w/fj61svlPGip7ZgegYQnguG4OGBFVdrUWltXiqdCbZImNwB9yx8MYklpOqtkjzuZZU2js
	ypM5gpDv6eCJOJBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793610030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tXSuDzNrT3fcpHY1zu73T+ik72oiK9rHI1BZCaJtwf4=;
	b=PwW/BcP/Vo9VdDVMyI5vMj1NO1uXG7QHoKIcoL7gxYXZvGIdu6flFu56cA2vcL6qDMLEk3
	Zo3xv7OsCPGAmQtCta7KNzJFPDj6GnoYd0WmcLevoL7LqUUFiNzxbX6dpc8cWbs34DLn6B
	YmCE0fS7xYjYVAO1iiyMjwdnTX1tFxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793610030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tXSuDzNrT3fcpHY1zu73T+ik72oiK9rHI1BZCaJtwf4=;
	b=cvJsFTamCoNt6JqIEc6hvA1rAwCRjj+zrjO5tp7coXUjEWck23ES858oBBW2T27PKhm2hX
	4LNJnJThGAdnOJCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8518B1351F;
	Mon,  2 Nov 2026 09:00:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rQXMEy5R6Go7UwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Nov 2026 09:00:30 +0000
Date: Mon, 02 Nov 2026 10:00:30 +0100
Message-ID: <87bj874ngx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ingyu Jang <ingyujang25@korea.ac.kr>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] ALSA: Make always-successful helpers return void
In-Reply-To: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
References: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sun, 01 Nov 2026 18:21:29 +0100,
Ingyu Jang wrote:
> 
> These helpers always return 0, so the error checks on their return
> values never trigger. This series makes them return void and removes
> the dead checks, one driver per patch.
> 
> This follows up on the earlier discussion:
> https://lore.kernel.org/all/87jywvyu2q.wl-tiwai@suse.de/
> 
> Ingyu Jang (5):
>   ALSA: hda: Make snd_hda_multi_out_analog_{prepare,cleanup}() return
>     void
>   ALSA: ice1712: Make chip_init helpers return void
>   ALSA: cs4236: Make snd_cs423x_pnp_init_mpu() return void
>   ALSA: vx222: Make put_xilinx_data() return void
>   ALSA: ali5451: Make snd_ali_reset_5451() return void

Patches except for ice1712 have been merged to for-next branch now.


thanks,

Takashi
