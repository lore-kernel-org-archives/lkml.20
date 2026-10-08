Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F54247045C;
	Thu,  8 Oct 2026 08:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449642; cv=none; b=IPxwi2+vdN1SKMEd9lOHngIYuYNJ8iF+vginxlxuR6Zn40OKP24qW8qR3qhuLd+ThWngMWTQ8Hkhu+191DXmhDzTSl3Qm3GJcowXzToVo9HPa/scbwnnvdX0IqJGCiwHA1gW0LQUfKvM4tR8SYmH9Z5SHAUDY95/SW+jserKIFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449642; c=relaxed/simple;
	bh=5OylZOYUJqQr6m2w4tfhw1hprzhKlOGpyLwPpD2CfxE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R1tpGZa+MO8Ycpx0TuHRpgQF8z25eucSg7PF8UJ5FvOgTEybBSSIPhwm9eOf9MDksW2kSwiMoXlX5pUqfHDzKOiI/b3zHg9ZSu9WQWlG02zCEj0iZ5nCDi3JkG8kAmImI/09PZWG+W8lgwd0Ei8e6Twi/YBdAiPKxUdscMqG2fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZXMHi+pt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uXpE95f2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k1hWMBKJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Cs60C160; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZXMHi+pt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uXpE95f2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k1hWMBKJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cs60C160"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D849E1F455;
	Thu,  8 Oct 2026 08:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791449639; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5IUHmEeZI7t84H6lmsJaegHG8GBA213mq/nDympbarI=;
	b=ZXMHi+ptaquxdJ8jW0K4aGbhXdI6M85qyaUyiMe6fymaxJ4rpIhcBMCSHw3TNfLWxtAc6K
	E4zrKErrY/t4eqHH3XhZwHzXxMg/HHXI/pmNTildYZ1W1xki6vnNAvyTiTJzW3zceXN/ft
	afndvvb+TTJc6NC25NU3sflFCgLdBM0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791449639;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5IUHmEeZI7t84H6lmsJaegHG8GBA213mq/nDympbarI=;
	b=uXpE95f2jiS0pjkafBdTU/HigeH1yT77QnfSlqwztSg6txkwkpolFThv2faVWC92LF9trX
	GgdlqsE43RjP1gDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=k1hWMBKJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Cs60C160
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791449638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5IUHmEeZI7t84H6lmsJaegHG8GBA213mq/nDympbarI=;
	b=k1hWMBKJlVjV/5zMcMu48Dwl4rt0iBR2WXyZu1GYbso3wPJU5TwfIh94T0RqqnhY3dGQJ1
	tbtOEzXro6R5W13kpHlMgOS7xwMqTX0DH4XgmcBRwCPCTx7r8Ggg6fMaZ/w4KtN1cJkNz8
	SnG8r/hSZWBIVoBqeW/fp4tPn+ZdKZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791449638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5IUHmEeZI7t84H6lmsJaegHG8GBA213mq/nDympbarI=;
	b=Cs60C160mQBwqIhbMjHZLsZmb3lehahwey18BMH2uhXRetHGK8RHmo0l9JUFBkM8M2LCyJ
	n4SjRU8eItYYATAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9DA21339F;
	Thu,  8 Oct 2026 08:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0sMEIyZax2ogWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 08 Oct 2026 08:53:58 +0000
Date: Thu, 08 Oct 2026 10:53:58 +0200
Message-ID: <87o6d4609l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	<linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH v3 7/7] ALSA: seq: Don't lose partial read failure
In-Reply-To: <aa22e14b-fa6d-4164-b8fa-6a77eb2a2d39@intel.com>
References: <20261007172533.14667-1-tiwai@suse.de>
	<20261007172533.14667-8-tiwai@suse.de>
	<aa22e14b-fa6d-4164-b8fa-6a77eb2a2d39@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: D849E1F455

On Thu, 08 Oct 2026 10:32:29 +0200,
Cezary Rojewski wrote:
> 
> On 10/7/2026 7:25 PM, Takashi Iwai wrote:
> 
> > --- a/sound/core/seq/seq_clientmgr.c
> > +++ b/sound/core/seq/seq_clientmgr.c
> > @@ -480,11 +480,11 @@ static ssize_t snd_seq_read(struct file *file, char __user *buf, size_t count,
> >  	if (err < 0) {
> >  		if (cell)
> >  			snd_seq_fifo_cell_putback(fifo, cell);
> > -		if (err == -EAGAIN && result > 0)
> > -			err = 0;
> >  	}
> >  
> > -	return (err < 0) ? err : result;
> > +	if (result > 0)
> > +		return result;
> > +	return err < 0 ? err : 0;
> 
> Can 'err' even be positive? Looks to me as if 'result' holds the bytes
> and flat 'return err' suffices.

Yes, it's just to make sure.


Takashi
