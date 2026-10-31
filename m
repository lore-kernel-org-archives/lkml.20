Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463088;
	b=hNNS8hbR07XBadcXDx2xdL8nkzh6VuWwdd3X2NJysPqNme+r7RLcqYDwUIknwLZY9C2H
	 jf2I1Tu/zmluPBJIMMco+BOyB6X4Bu3CxlPEClwjUN+sUqLjVDLSEi3WdljPv1lQKCwBy
	 G5F6s8ep+pxiGmnCLdDaQanGtaRAsBTpbIjvukAQ2phBaS4rmNKKlyzmMorvTg6Hey/zE
	 E96pvxpD12uStmDXe1LhDAD9vjnUVop3rkWcu4c11EBnxoNmvRs/78ydYq3P8EVQcrnxo
	 DNGl6aqYkJVJaajGk1m25iVKxTPyZLJQTvQ++B7iqYwz1n56Ms5JLNwGc8eC4vFdQ/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463088;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=uVtvP8KcQZeUE6Rjg2UBMFFGtVGkScy/H0lj1BNVEuA=;
	b=BCx4D581To6/BspgnvGyOS/V6lZ2N0ErxEg8YlRpZs4wfzRNJwFQbci9MK2WthFg43Lt
	 jlx6tHmKk2K+i9detLbiOpFInu9IGaYi+o3x+nQXPVOkbpKtVh/DFibYtlxJfQlOjQyXb
	 aj+PtH2zNXR5995/YGtIOCN9MSwOpXbgLEZ4+uS5r940tSbYGaeZbz6TLqAo9riBoJ5ZB
	 Rcx6HkLJYpecX57QQCEfrJA0iKAo/a9hWj/FkXkzm4fb/R5IZQqXQbBHHpnjoYbk81HMU
	 1lOoesSf+fRhAWdcUNmvXusvQ8UZPY6NjVyPOZNej7vyS9DNRtWfmvZXbmGXjlUvv2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ndbupPxU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6qfunOr7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ndbupPxU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6qfunOr7;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFAD606A31A;
	Sat, 31 Oct 2026 16:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EFAD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ndbupPxU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6qfunOr7;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ndbupPxU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6qfunOr7
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 38707222C9;
	Sat, 31 Oct 2026 16:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793463086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uVtvP8KcQZeUE6Rjg2UBMFFGtVGkScy/H0lj1BNVEuA=;
	b=ndbupPxUNxSFW4cK9wbQzCOOYUgzBkT2UQOsIl6KitYwpDEsNw4EmQkX3ppk7On9aN3Wxm
	p67WASR97bXKIrCCsALG/tNyvjn5mO8voHy43tEAYUirRBC15hkuB+MtQl/rcnrZKuT4uv
	XJm9R5gVo5GhDbSo+dpVM3JLzgp3zhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793463086;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uVtvP8KcQZeUE6Rjg2UBMFFGtVGkScy/H0lj1BNVEuA=;
	b=6qfunOr7Q19dLBPv++v1JLqu47c5tC2LsmNFWTXF2tGd9ksw7viDPPU5bGgjCW+K5HQ0ND
	3Wh/kSczqzfQkxDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ndbupPxU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6qfunOr7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793463086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uVtvP8KcQZeUE6Rjg2UBMFFGtVGkScy/H0lj1BNVEuA=;
	b=ndbupPxUNxSFW4cK9wbQzCOOYUgzBkT2UQOsIl6KitYwpDEsNw4EmQkX3ppk7On9aN3Wxm
	p67WASR97bXKIrCCsALG/tNyvjn5mO8voHy43tEAYUirRBC15hkuB+MtQl/rcnrZKuT4uv
	XJm9R5gVo5GhDbSo+dpVM3JLzgp3zhA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793463086;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uVtvP8KcQZeUE6Rjg2UBMFFGtVGkScy/H0lj1BNVEuA=;
	b=6qfunOr7Q19dLBPv++v1JLqu47c5tC2LsmNFWTXF2tGd9ksw7viDPPU5bGgjCW+K5HQ0ND
	3Wh/kSczqzfQkxDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4CFD132D3;
	Sat, 31 Oct 2026 16:11:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ppJmKi0T5mr1NwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 16:11:25 +0000
Date: Sat, 31 Oct 2026 17:11:25 +0100
Message-ID: <87mrrtrgsy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1 0/2] Add common wait_for_boot and reset_and_boot apis for cs35l41 drivers
In-Reply-To: <20261030171045.469944-1-sbinding@opensource.cirrus.com>
References: <20261030171045.469944-1-sbinding@opensource.cirrus.com>
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 38707222C9

On Fri, 30 Oct 2026 18:10:13 +0100,
Stefan Binding wrote:
> 
> Both HDA and ASoC CS35L41 drivers use a similar meachnism for waiting
> for the chip to boot: regmap_read_poll_timeout().
> However, this method can break if the macro returns early if a
> regmap_read() call fails.
> Replace this macro with a loop which does not break on regmap_read()
> failure.
> 
> In addition, ensure the software reset prior to boot does not fail,
> and ensure it is additionally run in the ASoC driver.
> 
> Stefan Binding (2):
>   ALSA: hda: cs35l41: Add common wait_for_boot api and reset_and_boot
>     api
>   ASoC: cs35l41: Use common wait_for_boot and reset_and_boot apis

Applied both patches now.  Thanks.


Takashi
