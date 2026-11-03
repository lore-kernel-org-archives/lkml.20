Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717786;
	b=0PMQQA9hYvC+pM+kfcpdPXFQvVjSCUrDNt5ITqjSoOZj+4Q6X2TxotHtCcf1Qh9/ke5V
	 S/PYiHhA8gPzqC0o3++iuru2/mfwDshAARvQh8AEYn5QqUicSUvOev6/GM94OikDGmapA
	 G6c85VCWPU/3F+g47h3qQROyZJ1wmyTXrW3sfqI6AzXxRMyOfEcKOjbjXr/ihFagTR8pk
	 3BvOsmjum2L/UDji4GMog/m+p9jcctW8H2eTSN8NXgFIR9oFf5KAyFsoaIjOdMDyn0ykF
	 nWAxTaq+L05YD5xaUHP4apHACo58fmgf5gjH8hjKk2epKPwgkpg8oMV+9kcbsM6GNdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717786;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:
	 X-Spam-Score;
	bh=VFaYeRLxv/fuHi/sXIlzjxELmRRocbgSc2uJbcm7LKY=;
	b=O2xGi4CUkV1VrtSPilvI51CNw+peivAL3ZpwEmn/8XZz3/lP5p61dEg0R7iJiMKYcHEQ
	 /sAcA0WX3xhDZVX33VcZ/6ZjaOonhMG+gysmRWgeH3vbPI91zuIzsrFSR36H9BAyNSDZX
	 ZlmWaTa1I3vHJvykx3ZdOw2ErAKcUPL+cQyv3CmjLFg8YPogXprNrHxxj2sUb4kwKq8/3
	 sPkIjjUeRb4Bew4N/SnypTUCO7Tph1ly7SbvMHEWXHgDPoWNcSEllNQpShb1lNfAw3Pb2
	 Ybfxkhgmvj84xH/aXUHTewbygolbdtTrE1W9MkpoEtzvwxTih8p7SaDoGA4P7yM5rzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1QX9t4cI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kAlZd24h;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1QX9t4cI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kAlZd24h;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1208A6071C14;
	Tue,  3 Nov 2026 14:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1208A6071C14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1QX9t4cI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kAlZd24h;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1QX9t4cI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=kAlZd24h
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0EBD91F79B;
	Tue,  3 Nov 2026 14:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793717784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VFaYeRLxv/fuHi/sXIlzjxELmRRocbgSc2uJbcm7LKY=;
	b=1QX9t4cIM5vX+TV+K6rNhCGaYxgmtTzlKlOxta+O7yYkr58AvVz6qB9nrEt0wMFeWpbSpq
	l+t93dsWb3dYhkzLoBPLKxeSsz03Vq6UleMeqVeFSw7XdHr4lUei0fA5LHFpBTcL5bIZGR
	MlXixyJAQGmUolhSq9XeUbb1d5HPiH8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793717784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VFaYeRLxv/fuHi/sXIlzjxELmRRocbgSc2uJbcm7LKY=;
	b=kAlZd24hkOqiznbaQgQQbHyncJoO3KR/mjUdDewWKhq6M6/QW0Db3H3WQNrYGoIPd+n8Gy
	Z+hT23h2bmASpUCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793717784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VFaYeRLxv/fuHi/sXIlzjxELmRRocbgSc2uJbcm7LKY=;
	b=1QX9t4cIM5vX+TV+K6rNhCGaYxgmtTzlKlOxta+O7yYkr58AvVz6qB9nrEt0wMFeWpbSpq
	l+t93dsWb3dYhkzLoBPLKxeSsz03Vq6UleMeqVeFSw7XdHr4lUei0fA5LHFpBTcL5bIZGR
	MlXixyJAQGmUolhSq9XeUbb1d5HPiH8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793717784;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VFaYeRLxv/fuHi/sXIlzjxELmRRocbgSc2uJbcm7LKY=;
	b=kAlZd24hkOqiznbaQgQQbHyncJoO3KR/mjUdDewWKhq6M6/QW0Db3H3WQNrYGoIPd+n8Gy
	Z+hT23h2bmASpUCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CD4031350A;
	Tue,  3 Nov 2026 14:56:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MVQrJxf26WoyGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Nov 2026 14:56:23 +0000
Date: Tue, 03 Nov 2026 15:56:15 +0100
Message-ID: <87se1ivu9c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Micha=B3_Kope=E6?= <michal.kopec@3mdeb.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com
Subject: Re: [PATCH] ALSA: hda/core: Stop capability walk on empty capability header
In-Reply-To: <20261102114939.2182131-1-michal.kopec@3mdeb.com>
References: <20261102114939.2182131-1-michal.kopec@3mdeb.com>
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
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Mon, 02 Nov 2026 12:49:39 +0100,
Micha³ Kopeæ wrote:
> 
> From: Michal Kopec <michal.kopec@3mdeb.com>
> 
> snd_hdac_bus_parse_capabilities() walks the controller's linked
> capability list starting at LLCH. On some platforms one of the entries
> reads back as all zeros. Such a header does not describe a capability,
> but the walk still treats it as one: it falls into the default case and
> reports an error, printing the raw register value instead of the
> capability ID:
> 
>   snd_hda_intel 0000:00:1f.3: Unknown capability 0
> 
> The walk then stops anyway, because the next pointer of a zero header
> is 0, so the message is only noise.
> 
> Treat an all-zero header as the end of the list, the same way a failed
> read (-1) is already handled, and log it at debug level only. Also
> print the capability ID in hex for a genuinely unknown capability,
> instead of the full header value.
> 
> Fixes: 0b00a5615dc4 ("ALSA: hdac_ext: add hdac extended controller")
> Signed-off-by: Micha³ Kopeæ <michal.kopec@3mdeb.com>

Applied now.  Thanks.


Takashi
