Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830286;
	b=TId6gZGjIRwb9RCPO16pxqWERMv09B7jLJ8zwVGArYGZsYd/wZEHF1s2Q1Fu82pUJrm/
	 FAjwNGtZ+VullKonbSlZHVOsh8kdI1UIFdaUGr6ONyD/Bc5GGZnl/Qfb0i5YYsmC5bFXk
	 /GkYpmpHo/K5ugEkRQJKtsyJVddfn4zl1u0cZ/8uztEGao3ZfUK8Qx5b1Xxql7Emwtf/6
	 HkATzL47RjZIHdkHjuyF+HOZzna4Rsi6ty2cw77qAvwBePdDMkLEumOWpxynMvqm2d7Q9
	 bezy+IdJf52dhtBavHjnFLjyw7RRlXMqPU0C7P+bpMw5c9RuFPPYaDDVjysrK5q0zxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830286;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=sm2w6tpbz6ShCI0v4rAWqCnsZcid3K9bnRNAGydJJc8=;
	b=KinlM1Bi1gKFeysrAVl836PUaKsuHrmi1MGynfHGUnvCRrZ6zzwG2edVbSw6chew49uH
	 tXTyhQG2M4T8ubsF3ACgQkyJticJ1GilE7yCuyD1ClXP8BBwN3Ik/bIRv8s5scTgk5VZ+
	 CeQokPG6FXE/n5GlMm9yMZIENH89Wm3b8hGPm5qlc4aGKHBoIQYmaWqesjfXaNtVnt5BG
	 Yus09vQ9NSvbt4twHUOrr++d2dCL/3Cp4iMEBzxeMpHLGLQNRzuxDU4W66gIJI3SmdRR0
	 4wFQHUgze50GOqAe+wbzd3BLPAjvvYItbDqTuVCppCmnzYWxySE8tOhmsu6VnvvtWhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cTpdi2Zk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zas99iNl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cTpdi2Zk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zas99iNl;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C593A606A31C;
	Mon, 16 Nov 2026 11:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C593A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cTpdi2Zk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zas99iNl;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cTpdi2Zk;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zas99iNl
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A692D1FD69;
	Mon, 16 Nov 2026 11:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794830283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sm2w6tpbz6ShCI0v4rAWqCnsZcid3K9bnRNAGydJJc8=;
	b=cTpdi2ZkF9PyWbPIw7A7UV4LQGmhUqVx3cGKhfpFy+jjRGzRJFPu6lZAHs55VwRgKnx2/z
	rr8pKo1847T6M3QGDN4b/mKyBY7oiZBOwav5/DBU0pr/MjNW64POaVf6iK02o17Yr7+6Sc
	0qnbR0GSWYRzmVH+nKq7YxGqiu/SpwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794830283;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sm2w6tpbz6ShCI0v4rAWqCnsZcid3K9bnRNAGydJJc8=;
	b=zas99iNlFS2gnlzykIUnDEosidAs3J9FU6y49oDQ7PDknou71/vubGQh8d7cMn350Qhori
	EpJiXnN/6pgGSeAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cTpdi2Zk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zas99iNl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794830283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sm2w6tpbz6ShCI0v4rAWqCnsZcid3K9bnRNAGydJJc8=;
	b=cTpdi2ZkF9PyWbPIw7A7UV4LQGmhUqVx3cGKhfpFy+jjRGzRJFPu6lZAHs55VwRgKnx2/z
	rr8pKo1847T6M3QGDN4b/mKyBY7oiZBOwav5/DBU0pr/MjNW64POaVf6iK02o17Yr7+6Sc
	0qnbR0GSWYRzmVH+nKq7YxGqiu/SpwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794830283;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sm2w6tpbz6ShCI0v4rAWqCnsZcid3K9bnRNAGydJJc8=;
	b=zas99iNlFS2gnlzykIUnDEosidAs3J9FU6y49oDQ7PDknou71/vubGQh8d7cMn350Qhori
	EpJiXnN/6pgGSeAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 343451334C;
	Mon, 16 Nov 2026 11:58:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cyOzA8vv+mriRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 11:58:03 +0000
Date: Mon, 16 Nov 2026 12:58:02 +0100
Message-ID: <87bj7pyomt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Josh Klecka <joshklecka.dev@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Damien Dagorn <damien.dagorn29@gmail.com>,
	Kailang Yang <kailang@realtek.com>,
	Eric Naim <dnaim@cachyos.org>,
	Matej Sochan <matej.sochan@gmail.com>,
	Denis Yakovlev <mfthesun@vivaldi.net>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED support for HP Pavillion Aero 13-be1xxx
In-Reply-To: <6af77cec.d7a53d1d.2ea921.e37a@mx.google.com>
References: <6af77cec.d7a53d1d.2ea921.e37a@mx.google.com>
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
X-Rspamd-Queue-Id: A692D1FD69
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,perex.cz,kylinos.cn,gmail.com,realtek.com,cachyos.org,vivaldi.net];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -11.01

On Fri, 13 Nov 2026 22:11:03 +0100,
Josh Klecka wrote:
> 
> The HP Pavillion Aero 13-be1xxx audio controller (103c:89fa) uses
> the ALC287 chipset. This model is similar to the 13-be0xxx model
> (which is already in the fixup table).
> 
> Adding this model to the fixup table using the ALC287_FIXUP_HP_GPIO_LED
> quirk makes the mute led on the keyboard work.
> 
> It has been tested on the target model (HP Pavillion Aero 13 be1xxx),
> and confirmed to operate correctly.
> 
> Signed-off-by: Josh Klecka <joshklecka.dev@gmail.com>

Applied now.  Thanks.


Takashi
