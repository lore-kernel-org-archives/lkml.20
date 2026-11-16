Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828686;
	b=CzbbHkJBGj7o67+5hF9BEC9P9wmQ1s64V0DZTCowCPqGjlHj3L20lN5M3bE8PHrcyLZ5
	 bVdxbJmAS+hUFOSmDHw+s4ffNviIrQBK2CGlY2AIvfM8yCU1hLMmQR1ohNfpwSwHBlhKT
	 QMfml9r+7sQadfbdxgsxyzD0u4Kwij3wd57pJ01h7wxC6BiODW326bJIX2An4zatoWiFV
	 s4tYsBw5QeHTbWBvef8mPWUjd73bfz5JDVc4oEc78lcAtLS6DCAm9LhVF0TZj+WRdBhr3
	 bUNkE5HN4zSEahzfqSmFaLfC04yAnOo31PlTV7qAp9nkAVkD4y7aOFGJ207RJqlFybA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828686;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=z0NfAU13XjWmlAo1rlpRgFlZWwAks7dSH1PU/xp7JUU=;
	b=MSqgbzsNmRLDbon7o0ZBLMmWDBgSk23YZxrPQedF4InMuqZmcJ1MrR3ss6aUqHnemzzp
	 xR2NcX3FHaS8xsqtC16voFJ1XgEPX4lHevu3C3jHK4PGPq144TMXAkIYQ7CbPwr65dxBN
	 irQOxWYouzUEK5aDxOeNe//bV563vr41eriuNeEoRSOhP0sxuAlCdxveBB7qKP7HeOa7V
	 SW52dOrVmJTozcHXo56coH/u7I0Gfu11b6BoZ28A4pvQgsUiGV3NQpQwTxV+8OLcYWSBt
	 DlAivz8j1nuB/afPFxQDt9hkOZIGbhKlrC5fEKp0Gv2A5ln/MpIAaq6sto2rF+7YMGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y1Ncqxja;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YE1dl6mj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y1Ncqxja;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YE1dl6mj;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDA7606A31C;
	Mon, 16 Nov 2026 11:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CDA7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y1Ncqxja;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YE1dl6mj;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=y1Ncqxja;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YE1dl6mj
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8848A1FD65;
	Mon, 16 Nov 2026 11:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794828683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z0NfAU13XjWmlAo1rlpRgFlZWwAks7dSH1PU/xp7JUU=;
	b=y1NcqxjaiHBrCPuLMKR4v85WWVRxX9Hj/yKxKY4vTb3l+mgDjvgzQ5rTiSwuRqkIsS7J7H
	leBhRUxkUaCYKyUg+gGuomkTBPbuF66mifJHtD5CE5U5n0hack7kSgF+qTxHyMJBEeoTdh
	7xVyXSuyDkZuVKQtFQThiD0KAqhwa+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794828683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z0NfAU13XjWmlAo1rlpRgFlZWwAks7dSH1PU/xp7JUU=;
	b=YE1dl6mjJa/IZnQUJpX4DFP1YnMgU7OintJKsYFXvL9zsGKyZhnzHZd4RHiPppckc1jk//
	xlc1dFt0B3PMh3CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=y1Ncqxja;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YE1dl6mj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794828683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z0NfAU13XjWmlAo1rlpRgFlZWwAks7dSH1PU/xp7JUU=;
	b=y1NcqxjaiHBrCPuLMKR4v85WWVRxX9Hj/yKxKY4vTb3l+mgDjvgzQ5rTiSwuRqkIsS7J7H
	leBhRUxkUaCYKyUg+gGuomkTBPbuF66mifJHtD5CE5U5n0hack7kSgF+qTxHyMJBEeoTdh
	7xVyXSuyDkZuVKQtFQThiD0KAqhwa+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794828683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z0NfAU13XjWmlAo1rlpRgFlZWwAks7dSH1PU/xp7JUU=;
	b=YE1dl6mjJa/IZnQUJpX4DFP1YnMgU7OintJKsYFXvL9zsGKyZhnzHZd4RHiPppckc1jk//
	xlc1dFt0B3PMh3CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3ACD813408;
	Mon, 16 Nov 2026 11:31:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wOvrBovp+mo/KgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 11:31:23 +0000
Date: Mon, 16 Nov 2026 12:31:22 +0100
Message-ID: <87cxs5ypv9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aibing Chen <chenaibing@cmss.chinamobile.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: aoa: size the codec reference property name buffer
In-Reply-To: <20261113103006.705-1-chenaibing@cmss.chinamobile.com>
References: <20261113103006.705-1-chenaibing@cmss.chinamobile.com>
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
X-Rspamd-Queue-Id: 8848A1FD65
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
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -12.51

On Fri, 13 Nov 2026 11:30:06 +0100,
Aibing Chen wrote:
> 
> check_codec() builds the device tree property name
> "platform-<codec>-codec-ref" in a 32 byte buffer with snprintf().
> A codec name may be up to MAX_CODEC_NAME_LEN - 1 (31) characters and
> the surrounding text adds 19 characters, so the full name can be 50
> characters plus the terminator.  Codec names longer than 12 characters
> are silently truncated, of_get_property() then looks up a property name
> that does not exist, and check_codec() fails the codec with "required
> property ... not present".
> 
> All codecs in the tree use shorter names today, but the buffer should
> match the documented maximum.  Size it from MAX_CODEC_NAME_LEN, which
> is already available through "../aoa.h".
> 
> Compiling with W=1 before this change reports:
> 
>   sound/aoa/fabrics/layout.c:780:36: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size 23 [-Wformat-truncation=]
> 
> Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>

Is the string really truncated unexpectedly?

Otherwise it's just an incorrect compiler warning, and extending the
size doesn't make sense.


thanks,

Takashi
