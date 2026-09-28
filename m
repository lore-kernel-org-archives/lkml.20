Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3814649F116;
	Mon, 28 Sep 2026 11:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593763; cv=none; b=lOpiaa2WvU/kJ6RUIDCWNzMrQ9UeUUWuKUWYqAIWqsFVaTCCoWp7NGJN3iZo63vx6PNxAy+p6l1LFMSRPmzmjjUGv1j03I72YNlL0QJUqHwu+RRjSOp3imsj6A+T/W5I40PVoXK3h5w9XyDAyG2kK62cLQQLpIueQL8fRa9kb5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593763; c=relaxed/simple;
	bh=WE6PzurydW/drmbxJyh6GpCx2suGeOTn5nUycRCNkk0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DguPs92iyArzCibJyn0AiAYHdfCx3J8Eju768tt096chdRqhsV3usHn2UbkABsROLwDde761RTdK0b8Xztsa2+Cb0cYSsOQIlGbN/nOCNWJTW3HaxYqqtIrPzbs7zIdAGcYJvLg14PhCqSqYdcrCHjEJKJJ/8eqtwh7Y/e4HdpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Cb2hREYr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q1YgcN1O; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ioi9EQTw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LznkOXU5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Cb2hREYr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q1YgcN1O";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ioi9EQTw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LznkOXU5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 18F6522722;
	Mon, 28 Sep 2026 11:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790593756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u82Pe7jWAg2xKFd3Qp2Tapdiw5beq5HkcKj2Uql+6sg=;
	b=Cb2hREYrRbXZS+bvpmYD6oUjkeE75XpljXiEzFwNB5NX/nsa76f6brMQMXA1DuGYwiCf4t
	qq/WM7NrKgucJNonvuw3dSzagCV1MfQBWCqd2xymUbv5uYQbL3r/oUEXTq+HUTxOHUhY37
	L7vXgVbNkPuwkk7cu6Xw/DH7fgoqJak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790593756;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u82Pe7jWAg2xKFd3Qp2Tapdiw5beq5HkcKj2Uql+6sg=;
	b=q1YgcN1OADD+7AAcpg6jFEPBcUZqTMi21zteIerGeuGbQG2VtHPb3wnITfoybnHHvTJeqW
	V+2geBVN8VebXmAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ioi9EQTw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LznkOXU5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790593752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u82Pe7jWAg2xKFd3Qp2Tapdiw5beq5HkcKj2Uql+6sg=;
	b=Ioi9EQTwIYdrY/LpSm6A1KCMKB4lyxX7/lPmb3mwSYosNkq/Ci4TN6tvBd2hCGNrt627he
	D3pAVTJMUXc8iD23ajPzLvK1U+XQzhqg+gjxehA9svszbb3yOd//VmtlKbrkUxAmutN/JD
	d2TcCibsUGpPXahVpkCF2yygYqhEoXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790593752;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u82Pe7jWAg2xKFd3Qp2Tapdiw5beq5HkcKj2Uql+6sg=;
	b=LznkOXU5D5ds+jQSX42ycNRyiT9qpENSaEDXdWVVj9XZeo/NIJNktGh9wODgZr8QC4sE8G
	ykmkkJVlCGbbVzAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B0A2133F1;
	Mon, 28 Sep 2026 11:09:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 84gwFNdKumpVKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 11:09:11 +0000
Date: Mon, 28 Sep 2026 13:09:11 +0200
Message-ID: <87a4p17huw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Clemens Ladisch <clemens@ladisch.de>,
	Peng Fan <peng.fan@nxp.com>,
	Zhao Dongdong <zhaodongdong@kylinos.cn>,
	Arun Raghavan <arunr@valvesoftware.com>,
	Fu Hao <fuhao@open-hieco.net>,
	Joakim Zhang <joakim.zhang@cixtech.com>,
	linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA/ASoC: use assign_bit() where applicable
In-Reply-To: <20260918141532.3022761-1-peng.fan@oss.nxp.com>
References: <20260918141532.3022761-1-peng.fan@oss.nxp.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 18F6522722
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,ti.com,gmail.com,kernel.org,ladisch.de,nxp.com,kylinos.cn,valvesoftware.com,open-hieco.net,cixtech.com,vger.kernel.org,suse.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,nxp.com:email];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Fri, 18 Sep 2026 16:15:20 +0200,
Peng Fan (OSS) wrote:
> 
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
> 
> Done with Coccinelle semantic patch:
>     // set_bit -> clear_bit => assign_bit
> 
>     @@
>     expression cond, bit, addr;
>     @@
> 
>     -if (cond)
>     -        set_bit(bit, addr);
>     -else
>     -        clear_bit(bit, addr);
>     +assign_bit(bit, addr, cond);
> 
>     // clear_bit -> set_bit => assign_bit
> 
>     @@
>     expression cond, bit, addr;
>     @@
> 
>     -if (cond)
>     -        clear_bit(bit, addr);
>     -else
>     -        set_bit(bit, addr);
>     +assign_bit(bit, addr, !cond);
> 
>     // __set_bit -> __clear_bit => __assign_bit
> 
>     @@
>     expression cond, bit, addr;
>     @@
> 
>     -if (cond)
>     -        __set_bit(bit, addr);
>     -else
>     -        __clear_bit(bit, addr);
>     +__assign_bit(bit, addr, cond);
> 
>     // __clear_bit -> __set_bit => __assign_bit
> 
>     @@
>     expression cond, bit, addr;
>     @@
> 
>     -if (cond)
>     -        __clear_bit(bit, addr);
>     -else
>     -        __set_bit(bit, addr);
>     +__assign_bit(bit, addr, !cond);
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Applied to for-next branch now.  Thanks.


Takashi
