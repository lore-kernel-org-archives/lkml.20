Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794508779;
	b=E6DTfvyYfG4yz1yc1ziwrXRd6dREdm9ABqFcZ5SusjDXbFw0Axp3uyaDZX0JnI4BJYp+
	 A//zWB7UuWEYZ2+5/2aiRk8Hd8R7w3c+JPUvMTQaUkhokYAdFie71zqNJqpDfwL2gVgiG
	 YMsJ4ouegvm7In+YbTPK/qKfrrRy0qMeLu1FfKH4W80jTVZxQwUfvuGh/woZxhFy+zIQw
	 afJGwTbkHH3Da8PzcrlnSt4uXLrUEYQvLMHCLJxL94+ZO+1jOhbPj931ruURGA+39WMkw
	 98Ghul4UX3qpNNIvqycRKAdhAu+gwzR7ae/gAxV/TndPPCH9nFMXc6c6CG3/H3ra7lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794508779;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=gcJK9aNGFdibIIhndF5zzviRUAhRSCw1NuaopYZSjL8=;
	b=s8N5rlYHXFUm4vGoiq/8QsIw0Wc42rFy+IVADzZUYJTLk4Yvanwe98RYAJYsKVSK1V3r
	 GRcQLKfK8NWD/l4pmmpTL6y3brKsIb/bKb4vTms33whce4EakbCsLi7zYd9dNLB0yFwbc
	 vn0yhk3d+Vicvcyk0xG1v930gGb9PJ/KMufyD0h88wGQMFrj/JyJONh0VHhRMHuZQNxb+
	 RNlDZbKD3frnb9O+itlDWaGkWA5pj3PSb7kiUsATiU5yGsrhbUlhD7Gq5mXIu1SF4wuVG
	 3NCZFzb6V7KrJmb1dnpdLVcks0/4AH0T3pboY4RA6CQJCrc4BRS3kuK/j/13WtA/YEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fDtdxhcr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=XiKYTxHM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mgTQ9d9m;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7dbsVIWh;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF90606A321;
	Thu, 12 Nov 2026 18:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BF90606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fDtdxhcr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=XiKYTxHM;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mgTQ9d9m;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=7dbsVIWh
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3C3ED21E87;
	Thu, 12 Nov 2026 18:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794508775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gcJK9aNGFdibIIhndF5zzviRUAhRSCw1NuaopYZSjL8=;
	b=fDtdxhcrvoNiWcmvZCnhjNXIA12n9e6T/YKrokGyqzbKQl8FrTbK2AEYymvaa+4bRWcrkd
	wOKtVzZe7/rDr7v/UA6pSI8fgACobxWqt97sKKOHJovKpki+7VaLfeH/qCBJPdIvwRYmUI
	QWDupK4o7PdM+1saizbnZnPjdB4bvUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794508775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gcJK9aNGFdibIIhndF5zzviRUAhRSCw1NuaopYZSjL8=;
	b=XiKYTxHMbfE8KjmeOn0oUL2GwOUEHzovv3i+KwI3+IQFD38ahLNvVg8lbCIZD03Wg+2GNY
	NseJ6yakqOFN2UAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mgTQ9d9m;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7dbsVIWh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794508774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gcJK9aNGFdibIIhndF5zzviRUAhRSCw1NuaopYZSjL8=;
	b=mgTQ9d9mIM0SRjM7E/M+DO+fu6gAX1gGSrpE5fWQJT0PegPSO+bc5itQtTKzquNbq89cpB
	F0CZohZn79mrCHi4KbWOT8ed8J3YMFu1+upkSbkB0EjScEXoD3Tg+2zY2kYx6ywG2gJkv0
	L5TUUgB7uF2x9LNC8c/ngHGEhKH0PeA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794508774;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gcJK9aNGFdibIIhndF5zzviRUAhRSCw1NuaopYZSjL8=;
	b=7dbsVIWhcHQxM37UJHa9+S3p+ddN6Yv3nGKX9xDSSof0X+EkJ1U/MqOTVubl0Q8yZt4p7J
	7mLI1IqU8J7SvTAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BB5A313432;
	Thu, 12 Nov 2026 18:39:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PD85JOUH9moNRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Nov 2026 18:39:33 +0000
Date: Thu, 12 Nov 2026 19:39:33 +0100
Message-ID: <87h5hlrj16.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shengyu Qu <wiagn@4d2.org>
Cc: perex@perex.cz,
	tiwai@suse.com,
	hulianqin@vivo.com,
	i@rong.moe,
	g@b4.vu,
	jon@soh.re,
	hhkieu@gmail.com,
	panxucc@gmail.com,
	wiagn233@outlook.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: usb-audio: Add native DSD support for NiceHCK Octave
In-Reply-To: <20261112173131.86655-1-wiagn@4d2.org>
References: <20261112173131.86655-1-wiagn@4d2.org>
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
X-Rspamd-Queue-Id: 3C3ED21E87
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vivo.com,rong.moe,b4.vu,soh.re,gmail.com,outlook.com,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.51

On Thu, 12 Nov 2026 18:31:31 +0100,
Shengyu Qu wrote:
> 
> NiceHCK Octave is an OEM of TTGK TT39039F01-PROMAX[1] and supports DSD64/
> DSD128/DSD256/DSD512[2].
> 
> It advertises the UAC2 RAW_DATA format on altsetting 4 of its playback
> interface, but without the DSD_RAW quirk flag the driver exposes it only as
> a SPECIAL format that cannot be used.
> 
> Add QUIRK_FLAG_DSD_RAW for the device (USB ID 3302:39c3), so the altsetting
> is exposed as DSD_U32_BE, enabling native DSD playback.
> 
> [1] https://www.audiosciencereview.com/forum/index.php?threads/nicehck-octave-dongle-dac.65535/post-2390027
> [2] https://szttgk.com/product/HIFIAUDIOMODULE/846.html
> 
> Signed-off-by: Shengyu Qu <wiagn@4d2.org>

Applied now.  Thanks.


Takashi
