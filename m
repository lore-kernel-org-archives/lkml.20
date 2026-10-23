Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762892;
	b=GxXm1PvyxS9YrygsvLF32Z45Eljj2rp4DOHnqvkbHUYEjJ7dT/wZNZg2Lmf9bRNDykXr
	 q88x5oXbkWST6VtoW0d9uW/Ppnx1TovnT+Op+G9lArNOhjoFgk+Xaw+DPVJ+RR2chihd3
	 WHbTXBmv4xG3jIWxoHwREyngJedN6raMQ0Yvr9zaPEdvS+2ulGibiGmu6/45pXgywbn7x
	 ug0cEoM/zetYDwHTA6m8dpsvzsyGUZPYZI5Isr1A0cZXE4jHsvhusOogd6KXzAW38Ksmh
	 xLpwE2PdFn9w7XNJ9qly3A4W3qW2AopDQe+LHXCxiFBEmg3a5I4oWj3Hi+iieFd3xDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762892;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=MJA56YWAjUxP+l9C9vTB0zTWAnmWvzavAz3c4E1WIOA=;
	b=fjJWmgX33CplWoUUxxYcA7Noh8edX6hBkTFJZyPrlItDg3BGwHswMuIenWAD71BOH7qn
	 ameohCeoR4hsHX4hdMUHp7IgcDtEdDB6doOCKap92h5akHpgxYyTXJ5wgbY3j04xhWEcO
	 c1+G3DJq6EfBzeXuYrYOYOimMYza2O37dfeIYQFNVg3Df/3KuHGB9UI4eRoftZoaxAumQ
	 5JNdhVwkFeJb1eaIP8ZclmkDdBmoxHF9hEg1eRTOOq7RGhMoICSnH4xZ8wxua4MbwlO4F
	 NJlY3PmoOX/3Ibmc12k84ZiRvK3rYY/JN9/bcCJcVmZZ2rdl9602eaWDl0D+NKStr6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IemoemOu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gQrI1FzN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=N9O0Cbxo;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oQNcKunP;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EAF60A3811;
	Fri, 23 Oct 2026 13:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71EAF60A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IemoemOu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=gQrI1FzN;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=N9O0Cbxo;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=oQNcKunP
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6484F1F391;
	Fri, 23 Oct 2026 13:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MJA56YWAjUxP+l9C9vTB0zTWAnmWvzavAz3c4E1WIOA=;
	b=IemoemOusg4/u/JhA/eHLugJjZmnhxm+5ucAEXpu1484kNgyFiiR/RbnI2HvA3ZBzeLvnD
	eLUdwGUzIhDgze8HQAejLAxzZRgkGGwE/9i8OTYOP5IP81DT+aff9YKxf/3q5J1RrknIW4
	s92LxjBqLFE2TjYcXz6qkR7HhjZEwzQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762889;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MJA56YWAjUxP+l9C9vTB0zTWAnmWvzavAz3c4E1WIOA=;
	b=gQrI1FzNnwbLvNH5GgI3Uk0+W3Lu3df8sc/4+yIW31MpUOTgq6M4GP0GINDbz3UXATjah7
	K+0vh8x6Qi1Bt1Aw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=N9O0Cbxo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=oQNcKunP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762888; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MJA56YWAjUxP+l9C9vTB0zTWAnmWvzavAz3c4E1WIOA=;
	b=N9O0Cbxo0ZxQyU7twBNYvY8istnGquDb0X0PXa5i3vOxtQbBPSB0JMFbzc5bNNERDVW+gD
	ZlhBwz93C9UD/QUKKs4d7v0Mt7f8/4FW0cmy2QAl4dDy2336Tp9XM0PoTGXSvrwc4rWc4f
	4VJekJpdhRsGtQxZhiEbCdnR56B/6p4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762888;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MJA56YWAjUxP+l9C9vTB0zTWAnmWvzavAz3c4E1WIOA=;
	b=oQNcKunPtVmlX0jn3Y+FKRCUytzWEimz4l3OrmvU8sfRr0HXRD/ZXvwZC1knfXJza3b6ew
	AqKlFQAAxctUcyCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0923E133F6;
	Fri, 23 Oct 2026 13:41:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Oh3VNAdk22rqVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Oct 2026 13:41:28 +0000
Date: Fri, 23 Oct 2026 15:41:27 +0200
Message-ID: <87bj8ka60o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <blum@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>,	Zhao Dongdong <zhaodongdong@kylinos.cn>,
	Takashi Iwai <tiwai@suse.de>,	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: cmipci: Use strscpy() in snd_cmipci_create()
In-Reply-To: <20261022164013.95811-2-blum@kernel.org>
References: <20261022164013.95811-2-blum@kernel.org>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 6484F1F391

On Thu, 22 Oct 2026 18:40:11 +0200,
Thorsten Blum wrote:
> 
> To prepare for removing strlcat() from the kernel [1], use strscpy()
> instead with the current driver name length as the append offset. Also
> use size_t in the multi-channel branch to match strlen()'s return type.
> 
> No functional change.
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Applied now.  Thanks.


Takashi
