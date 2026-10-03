Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E0D4052A6;
	Sat,  3 Oct 2026 09:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021490; cv=none; b=JOkuZ/UZtZbzJg6rkj5WyLQt3DEMGQj2HYtX2kA9kCQPCkckgD0pvltM46mknxFERolhx7rOJaJlh3Sq4OzYPK/Hbfn8w1lFjLydm9Ju5CMaMFl9Z/amMm4NoEsX1Bkt5YhrYE2o91Fu8Cwu/V3AYdiqn6wgbR9Pb45nkJzNlOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021490; c=relaxed/simple;
	bh=DHf3bcWhNx060EzuchW68p1C96V+s6DxBKUSERzbM3s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iDvKt1uuHYFvLLs3FT1e14KjUvzuDyfIX0cWyt/TPZFKvnc401G89C/YErng5Q2DjItVM8iHpQRGdh2pxyAgmU24SWqd26cG6GmkjIp/+Z7P6qx3frAkm/u8sI4QYeOdnJq2xXe+pTa0pw24NGfs0jK3eCCp4laxAFZaL0FPKrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uQKnSwId; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yawyFyq7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tjRBVZ2s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C07mdI3l; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uQKnSwId";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yawyFyq7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tjRBVZ2s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C07mdI3l"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B20BC21D07;
	Sat,  3 Oct 2026 09:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791021474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3jw3NAjRzC5Gw+nVkz++HnHQcU0jeL3LLF//BhZbiGw=;
	b=uQKnSwIdHvizydSuYTw4sqbVvEzJ12oFmaftkZk5tQkCkzaGZJJ9Q1D+NWyLPkTBBd0lIw
	LH+JZ/E8NRet2XJ6kWDsNEkd65hrI+66T+uygpYqB5CUzy6h4gHUIDYzkjX2bZqKhcLBZh
	Q16QbzGjcJWw3omvHCfcgfUeJQ/C6kA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791021474;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3jw3NAjRzC5Gw+nVkz++HnHQcU0jeL3LLF//BhZbiGw=;
	b=yawyFyq7pDCaFUsHZjNaanUz6d9ulsttX89vnT26IVkixTl1qkct4DTgnJz/lxey1OdAGj
	YgMWJWCH92gC/IAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791021470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3jw3NAjRzC5Gw+nVkz++HnHQcU0jeL3LLF//BhZbiGw=;
	b=tjRBVZ2sL/WKWKZ3Hu7nMHqsAKlAK+CECThT3s3teAZkxpjJ6ugTYqkJqMaT6qKyQwZVGm
	Msy1evqo5wchwisBLApOcqdMXzHOUjcrZeG5iV/w5GwTtpFmXgty92227rWtK++mSv2T9E
	y+fI6LXOMacjNSvtqdsxT2VgK3MAmRs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791021470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3jw3NAjRzC5Gw+nVkz++HnHQcU0jeL3LLF//BhZbiGw=;
	b=C07mdI3lJHGc5BKwSJmGLNYBIfqtUoUFpgeKx961Jy1zYGSWfHoY8lQolSr3SjRltiaCSP
	ICPywTf04ONudXAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B26013712;
	Sat,  3 Oct 2026 09:57:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kMJSBJ7RwGoGTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 09:57:50 +0000
Date: Sat, 03 Oct 2026 11:57:49 +0200
Message-ID: <874if3xg0y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: tjdqudcks0424@naver.com
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcmtest: handle multiple wraps in random capture fill
In-Reply-To: <20261002232824.808952-1-tjdqudcks0424@naver.com>
References: <20261002232824.808952-1-tjdqudcks0424@naver.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,naver.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[naver.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Sat, 03 Oct 2026 01:28:24 +0200,
tjdqudcks0424@naver.com wrote:
> 
> From: 성병찬 <tjdqudcks0424@naver.com>
> 
> The random capture helpers assume that the data generated for one timer
> tick wraps the DMA ring at most once. However, b_rw describes 200 ms of
> audio because the timer runs at 5 Hz, so it can be several times larger
> than a small ring.
> 
> For 48 kHz, S16_LE, four-channel capture with a 512-frame buffer, the DMA
> ring is 4096 bytes while one tick generates 76800 bytes. After filling the
> 4096-byte tail, the existing code issues a second 72704-byte write from the
> ring base, writing 68608 bytes beyond the ring. Both interleaved and
> non-interleaved capture are affected.
> 
> KASAN reports the first write into the adjacent free page as a
> use-after-free in the random-byte generator. The underlying defect is an
> out-of-bounds write from the live DMA ring, not a stale DMA allocation.
> 
> Split each random write repeatedly at the interleaved ring or per-channel
> block boundary. Keep the hardware-pointer update exactly once after the
> complete logical write.
> 
> The issue reproduced on three of three clean boots. With this change, the
> same vulnerable geometry completed six times without a sanitizer finding.
> Boundary, pattern-fill, no-timer, open/close, and module-reload controls
> also completed normally.
> 
> snd-pcmtest is a test driver, and selecting random fill requires an
> administrator-controlled module parameter. The written values come from the
> kernel random generator; no privilege escalation or attacker-controlled
> write primitive was demonstrated.
> 
> Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
> Cc: stable@vger.kernel.org
> Assisted-by: OpenAI Codex
> Signed-off-by: 성병찬 <tjdqudcks0424@naver.com>

The code change looks OK through a quick glance, but could you try to
keep your From and Signed-off-by tag with Latin (at best ASCII)
letters, so that other people can handle more easily?


thanks,

Takashi
