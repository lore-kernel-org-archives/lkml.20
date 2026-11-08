Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794130129;
	b=MCQb2TzddHUCCaeR08SFc3WahWUOEzC9sD32yygkD7excT6zymVP28UwhTd5NFtU3W+Y
	 ptoJiEOhwT9EnRbCdp7+pIzt43uznwWgIpRquc8othV8SYBIeFI1ZBPyH0FXKxdXh/Y1a
	 hOPwMG3rlDUhoxkU07nqmiq6mBCrJsB+pDa0VvaIlcUxLId0eoPF26eJfyFWTbKd7bnDt
	 h/7sSGnltQFuVze1VfoewmNzy0qIizSiETQOVmzt4NRCst+7ojLmIYysoZokKec4CVcXN
	 lDSEhzO7/nnlU87nGwTewSgls46QKrRWZRg0fQp7VYMLhRM6wzhIw+mPnfA8vy2dM7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794130129;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=giruqofCEKLGW/gftydut3TGaQa4hJZhY1xYbnABmjg=;
	b=F6Iw+9TTiETbHcJ4pHD2N2FnW7WXuUmvEMQtS/QMdtKBLfXhQct/juJbbXomKxT+ZaMP
	 60yxvjcINLORN7xVW6YhKV0WRhXPIjz8ZXMmBw2h7mfu2xQ5mQgmJtL93MD5njqwdJlCh
	 2vBUpjBi84cdaoILBsmKh6ArGt25vJ7yegE4Mpv9e6sJoB3hxj7jcSmsOuhUs/lHT5+Jd
	 TB6pwYoI+y2/kUtr7c3rRPDfQTsOVMavBDMuygHtK03kxxCixuBfJ4gy4sl2wqNiX/8V4
	 NkXhabfP/7LWRjCCuWOIkyxN4tU+KDgTGxLZucGUWSyIHy84++RUTVs6I7eWQMPJOAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PWezvDtO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6EadtCRt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PWezvDtO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6EadtCRt;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B73606A31C;
	Sun,  8 Nov 2026 09:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67B73606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PWezvDtO;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6EadtCRt;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PWezvDtO;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6EadtCRt
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 29E9F21E34;
	Sun,  8 Nov 2026 09:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794130120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=giruqofCEKLGW/gftydut3TGaQa4hJZhY1xYbnABmjg=;
	b=PWezvDtO/1RfweS1GD5i710qXqBGStJ1uEK6/2kjppq1v7OC1eaXD3NJoKs4Bd4wvx+2EB
	Da2ExaK0kruG8hm6+8YZyXnwhvupse74942m0cHn0h8tfE3U2ttMzQuZSErmBy16mjoAyG
	za8oszn/duSGAAr+n42QgYjiZVGrBvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794130120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=giruqofCEKLGW/gftydut3TGaQa4hJZhY1xYbnABmjg=;
	b=6EadtCRtQE+NcLSwndUztHzsk6GC2F6GPUfgUpFdEo09PJY4PMMvphGWIdxjYflXL3stfW
	wOvRfef0JdUkZjDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PWezvDtO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6EadtCRt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794130120; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=giruqofCEKLGW/gftydut3TGaQa4hJZhY1xYbnABmjg=;
	b=PWezvDtO/1RfweS1GD5i710qXqBGStJ1uEK6/2kjppq1v7OC1eaXD3NJoKs4Bd4wvx+2EB
	Da2ExaK0kruG8hm6+8YZyXnwhvupse74942m0cHn0h8tfE3U2ttMzQuZSErmBy16mjoAyG
	za8oszn/duSGAAr+n42QgYjiZVGrBvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794130120;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=giruqofCEKLGW/gftydut3TGaQa4hJZhY1xYbnABmjg=;
	b=6EadtCRtQE+NcLSwndUztHzsk6GC2F6GPUfgUpFdEo09PJY4PMMvphGWIdxjYflXL3stfW
	wOvRfef0JdUkZjDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9F5731339B;
	Sun,  8 Nov 2026 09:28:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GHaQHMdA8Go6CgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 08 Nov 2026 09:28:39 +0000
Date: Sun, 08 Nov 2026 10:28:39 +0100
Message-ID: <87eccvy8mw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <blum@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: info: Use scnprintf() in snd_info_card_create()
In-Reply-To: <20261107140949.350482-2-blum@kernel.org>
References: <20261107140949.350482-2-blum@kernel.org>
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
X-Rspamd-Queue-Id: 29E9F21E34
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-11.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,intel.com,gmail.com,suse.de,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -11.01

On Sat, 07 Nov 2026 15:09:48 +0100,
Thorsten Blum wrote:
> 
> While the current code works correctly, replace the unbounded sprintf()
> with scnprintf() to bound the formatted string to the str buffer.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Applied to for-next branch now.  Thanks.


Takashi
