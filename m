Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953983;
	b=G0r/eielRzd/5fwIHmENtndbBJkMspJPkhe7y6hCRWhQK4ILSZ7xA+b2gIpY8cBvk+39
	 3tlRHSwWkfXO4RoCkM8qE4VR9ANLBrKB15PpDBTCNX3eID5B79jbvbwM0pBOP6/Y0YrJE
	 +aAD38MvBRtOK4Vj+qZdWG0NzfznmmNg4tU9oek3rYUJJ8G1s7aVueE7zrPzfMpmxePSF
	 hvf/bLFXtoB2+Et7UnojzoI4FlTnNj+JS9tnYaKG1nf+1ZBcx+zo0vqtaietFm5FzmN1M
	 oQRmml2cMaPYI6Jenhw4W+VgqiAvDryCK/Jt7mZEhPatZz4iu/rj9B+s8ZE+7x5iSqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953983;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=xTeyXotE9CqHyoXVzJOPjd+DZKi1ifsw28DOJpbzOlE=;
	b=M8UfG8z+T6ycJGCe7SP0IK8eBoAIso/GOMQwRHXlBkKFZ2XQ299Laka78l+ZLXWclxee
	 pZgg01tXtMk4lvY6drU8GNpTw67F6hC0i5Dalk4KOVBqZ9ilu6t0WE/P/ObXBUGYprJ0+
	 Saf39v7yLxF5B8hDWAjBWMwBEugOHfhzsdRPk6DK4nicyOaUom78c6nrsUI0pViwFqL1a
	 yc1aS26TYs0Uz9KZWkUCu7joqKHkJ3BuCx0yweTQGMv5+u3nFkHOeX9FOtHpt2qCuiNfj
	 BbWvHI43odbSNr17w4f2nnrP9lIMmYbTJeoCevawo3mQEUwvV/hpiED8K4Djd42m3SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u1b2yEKn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sZO5cXiD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u1b2yEKn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sZO5cXiD;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5C6606A326;
	Fri,  6 Nov 2026 08:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E5C6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u1b2yEKn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sZO5cXiD;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u1b2yEKn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sZO5cXiD
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 514372227B;
	Fri,  6 Nov 2026 08:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793953981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xTeyXotE9CqHyoXVzJOPjd+DZKi1ifsw28DOJpbzOlE=;
	b=u1b2yEKnANEWG3Z0h+pkZ5D51q34HP1Z2hK2Iy4ewFDMq9uWlmnF+mH4+cCB907/110IEl
	WHOEaRugp/okQXuI+7Ss2FuWICtpg+ljpgUA3WlcqO7a9nciHJxfJhF/GwqLZyZ91hCkMB
	N4tR9euFrZ8MSs4CkeuQsb4KqbLKFPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793953981;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xTeyXotE9CqHyoXVzJOPjd+DZKi1ifsw28DOJpbzOlE=;
	b=sZO5cXiDIZyLoC6LtENpj8BkutBAw38UPqKWlM1dulS36AjKmnwBpgyl7UeYCWNqfH2pU5
	oqsnadd6C98a2dCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=u1b2yEKn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sZO5cXiD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793953981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xTeyXotE9CqHyoXVzJOPjd+DZKi1ifsw28DOJpbzOlE=;
	b=u1b2yEKnANEWG3Z0h+pkZ5D51q34HP1Z2hK2Iy4ewFDMq9uWlmnF+mH4+cCB907/110IEl
	WHOEaRugp/okQXuI+7Ss2FuWICtpg+ljpgUA3WlcqO7a9nciHJxfJhF/GwqLZyZ91hCkMB
	N4tR9euFrZ8MSs4CkeuQsb4KqbLKFPI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793953981;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xTeyXotE9CqHyoXVzJOPjd+DZKi1ifsw28DOJpbzOlE=;
	b=sZO5cXiDIZyLoC6LtENpj8BkutBAw38UPqKWlM1dulS36AjKmnwBpgyl7UeYCWNqfH2pU5
	oqsnadd6C98a2dCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E24CE132C9;
	Fri,  6 Nov 2026 08:33:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b+ULLbyQ7WqgfQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Nov 2026 08:33:00 +0000
Date: Fri, 06 Nov 2026 09:33:00 +0100
Message-ID: <87h5huqs03.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1] ALSA: hda: cs35l41: Override malformed _DSD properties for various laptops
In-Reply-To: <20261105170341.219204-1-sbinding@opensource.cirrus.com>
References: <20261105170341.219204-1-sbinding@opensource.cirrus.com>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 514372227B

On Thu, 05 Nov 2026 18:03:34 +0100,
Stefan Binding wrote:
> 
> Several HP laptops have malformed and incorrect _DSD properties used by
> the CS35L41 HDA driver. This results in audio for those laptops being
> broken. We can fix this by overriding the _DSD for those laptops,
> ensuring the driver uses the correct settings.
> 
> The laptops whose _DSD will be overridden are:
> 
> - 103C8E11
> - 103C8E12
> - 103C8E13
> - 103C8E3A
> - 103C8E3B
> - 103C8E60
> - 103C8E61
> - 103C8E62
> - 103C8E75
> - 103C8F57
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Applied now.  Thanks.


Takashi
