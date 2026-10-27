Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793083183;
	b=f8qIcEJYdDienj7yVI1brsn+H6PUTgRe1MJndxgpKzZ2ujN20Ri83PO7iI0t/aeJhqRI
	 p64VbQaH+PrppCjXLHgK09K0f4+WwNRtDB/l5fpet5ZmAmo9CPog5GTALlfN73A0T+E0m
	 Paj7L/5AS08mLCkNO90xqnX+K4uhG2A1HQndYDeuT7jW1ieotZhw4Z1Vm7JLB/6vQO0G1
	 4X4gpoTJtaJ6G0ja0WVA0Rh6ErtD75qsil1dbF8Cn9vXA2bdTgjZosWAJqAWzH3/3Edyr
	 26YqW0EjXRruzAkWlAH//iMJqudFAx3Gx+UjiqOGtkqT3RhVvLfxWZEYfVM5eGKJmaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793083183;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=bI6aKdaB2M5yXnnn9vXm8oVgJvix8I/foxf6hwtvCMA=;
	b=aBKk3uvpqntSVJQqbr4c1YSAuSqjH9uXzaOAQKkbVGz9n9K/72RdaZkx/Ig+daZ9cvXQ
	 KFd/h4GwDUUlBrF217xU4w+Q54Vo90Fv2IbsKeYfCWjCKmjwIUr3No1Kaohf+2FOtXRnh
	 2iICfQoCWQjTMf1Vlm1eDlCAo9EROaO/58HxAkyYXW0boD2x8Y9zdAwIiKm07Kj4UZorA
	 pHb1EcxNStZJZL3r3JJenv7dzzpT7qKuv1cGesQysW0XNl5/lhjbEI0x6z3Cyj0sPAFW8
	 4vvvzDy7zxJty92ducj1grj2AKg1spiY2rpHz6bXbuDmrPg2NG/J1H/dzoia5lRGjSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=O4ee8AhY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gmXeMJGa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=O4ee8AhY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gmXeMJGa;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335F6606A31A;
	Tue, 27 Oct 2026 06:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 335F6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=O4ee8AhY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gmXeMJGa;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=O4ee8AhY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gmXeMJGa
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 234651F791;
	Tue, 27 Oct 2026 06:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793083181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bI6aKdaB2M5yXnnn9vXm8oVgJvix8I/foxf6hwtvCMA=;
	b=O4ee8AhY1aKg4XPOg2J/uRQ167b+9aACUIExtQW3u1eAb0QfJ67hImKeXiO/y86HysNhXg
	KeBQSmPBVmsNVTUIclmmrhftmamHNRQDJM3rRqb26104Mql0rbquWEKkyCYOPq3oxlvfyr
	u9CZgouUyWxRONyeHFdNx7eHYms3ps8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793083181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bI6aKdaB2M5yXnnn9vXm8oVgJvix8I/foxf6hwtvCMA=;
	b=gmXeMJGafaamXFCXBKxDxMCXfvXNMbRGWHcDBk2v5AvimIdPI2N153Z1DEu7F07z2HM4qx
	ENE6ZFcUzqEhFKDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=O4ee8AhY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gmXeMJGa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793083181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bI6aKdaB2M5yXnnn9vXm8oVgJvix8I/foxf6hwtvCMA=;
	b=O4ee8AhY1aKg4XPOg2J/uRQ167b+9aACUIExtQW3u1eAb0QfJ67hImKeXiO/y86HysNhXg
	KeBQSmPBVmsNVTUIclmmrhftmamHNRQDJM3rRqb26104Mql0rbquWEKkyCYOPq3oxlvfyr
	u9CZgouUyWxRONyeHFdNx7eHYms3ps8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793083181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bI6aKdaB2M5yXnnn9vXm8oVgJvix8I/foxf6hwtvCMA=;
	b=gmXeMJGafaamXFCXBKxDxMCXfvXNMbRGWHcDBk2v5AvimIdPI2N153Z1DEu7F07z2HM4qx
	ENE6ZFcUzqEhFKDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB1CE1321C;
	Tue, 27 Oct 2026 06:39:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Sh5fKCxH4Gr+IAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Oct 2026 06:39:40 +0000
Date: Tue, 27 Oct 2026 07:39:40 +0100
Message-ID: <875wyn4pg3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: ernstp@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zhangheng@kylinos.cn
Subject: Re: [PATCH] ALSA: hda/realtek: Extend quirk for HP Pavilion All-in-One 27-ca1xxx
In-Reply-To: <20261027-realtek-alc274-v1-1-c0eae15d0c55@gmail.com>
References: <20261027-realtek-alc274-v1-1-c0eae15d0c55@gmail.com>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 234651F791

On Tue, 27 Oct 2026 07:13:44 +0100,
Ernst Persson via B4 Relay wrote:
> 
> From: Ernst Persson <ernstp@gmail.com>
> 
> A quirk was added in commit 704de5697008 ("ALSA: hda/realtek: Add quirk
> for HP Pavilion All-in-One 27-ca1xxx")
> Also enable the quirk for the actual 89e9 model named there.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216139
> Signed-off-by: Ernst Persson <ernstp@gmail.com>

Applied now.  Thanks.


Takashi
