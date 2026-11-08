Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794139592;
	b=F+Dyp2iSe3Xosqy/7MkHLj/0tlW26ioMUM7CVheYX7wsLQbQszERRwcg60dBtNpqxddU
	 qYsdFx1QKu6XwylwIc7nA/CyBVOfXwziOuWi9v7fZzjewJ8gMeJeGlC3h7RKBKNl5z2sh
	 k4XIx+4u1snuTCUJ/mrwVtQtILL4dpgSntzAluO2F/AhNyingL9Q+8ljrXpszB9GaHs7y
	 FS0vOg7U9VvhRDCBJ7q3J2rEVM9ldsyjnTiiv4ybazoJToEQElVLFU7NE/tTUFeDjXuUM
	 YN6C+7rrxKWRmEvMVn+U5fkpsAOAXfhU9tvNIVtFCP7SkEWt19wpbDv0HHw3YwyD+Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794139592;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=Ec8qdUAub/BPOp+QURrhrzJhXLAMgc5zg47bvM6M0Og=;
	b=uIlk3aV4cS3Vguaq2rHyOUt+09iR+4nR5zKimSy0hV8ik1JWAyb/bpZ2HNvYo7ZkgucF
	 Mpg1jKK3j/xMjrcS4XPj0YJphNNRFuA04GfWobInjeukij7euDimXQmLtAswLbvciddv6
	 O45gpWiPQ1GbLW22zwOMVIrscaM++zlS+7yHIWd6ocYmuITwSkvzMB8ACKL1HY4uqaxsq
	 NWdpB7d6WhFPV377OuK+ThDWWU4s9wcKMpPoSnoLSxYS5+dxuB7ukbCn4PpqwC3QmZp2W
	 TP1OXFYYVzv8DkVCD/JmykKrzgE+bLbj67g5H7uNSf1F8d6n0/gw0CBCrvcLFCiVOnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=slQl8fi3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=TMA7RDK9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=slQl8fi3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=TMA7RDK9;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBE3606A31C;
	Sun,  8 Nov 2026 12:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEBE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=slQl8fi3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=TMA7RDK9;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=slQl8fi3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=TMA7RDK9
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D0E321F74B;
	Sun,  8 Nov 2026 12:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794139589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ec8qdUAub/BPOp+QURrhrzJhXLAMgc5zg47bvM6M0Og=;
	b=slQl8fi3i5QY2WMszjrCYzr4xlFyQgwQXl5XhTysA3sKuC6+LVzj1iLOTdCBycvVBQMHCs
	dvvb2UQ5gWtwixefBkioUmZ+qysKXWlkDR+Y8Hj1CAlBKV/auNMUL9hAaRjf98uvRJslrW
	hgAsUvhslIKBFpJm/0RG77qdIfr3QTo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794139589;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ec8qdUAub/BPOp+QURrhrzJhXLAMgc5zg47bvM6M0Og=;
	b=TMA7RDK9fqRmPD/QvqCiOGiLli4DK81Yun0F08eY6FB8XGI86HkUMZy2s2fuMmfRnuWX+i
	qRggqFRp9/NyNzAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794139589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ec8qdUAub/BPOp+QURrhrzJhXLAMgc5zg47bvM6M0Og=;
	b=slQl8fi3i5QY2WMszjrCYzr4xlFyQgwQXl5XhTysA3sKuC6+LVzj1iLOTdCBycvVBQMHCs
	dvvb2UQ5gWtwixefBkioUmZ+qysKXWlkDR+Y8Hj1CAlBKV/auNMUL9hAaRjf98uvRJslrW
	hgAsUvhslIKBFpJm/0RG77qdIfr3QTo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794139589;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ec8qdUAub/BPOp+QURrhrzJhXLAMgc5zg47bvM6M0Og=;
	b=TMA7RDK9fqRmPD/QvqCiOGiLli4DK81Yun0F08eY6FB8XGI86HkUMZy2s2fuMmfRnuWX+i
	qRggqFRp9/NyNzAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5937913302;
	Sun,  8 Nov 2026 12:06:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hXlvCcVl8GobJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 08 Nov 2026 12:06:29 +0000
Date: Sun, 08 Nov 2026 13:06:28 +0100
Message-ID: <87zevjwmrf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: control: Fix parsing of numeric fields
In-Reply-To: <20261108111848.2493-1-sreekuttan2156239@gmail.com>
References: <87a4njy53s.wl-tiwai@suse.de>
	<20261108111848.2493-1-sreekuttan2156239@gmail.com>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sun, 08 Nov 2026 12:18:48 +0100,
Sreeraj S Kurup wrote:
> 
> Hi Takashi,
> 
> I compared the approaches.
> 
> Using simple_strtoul() would provide an end pointer, but it is deprecated.
> 
> Another option is to retain kstrtoull() from the original implementation 
> and apply the delimiter-first approach. This would minimize changes to the 
> existing conversion logic.
> 
> However, since the destination is an unsigned int, kstrtouint() better matches 
> the destination type and also detects values outside the unsigned int range.
> 
> I currently prefer the v2 approach, but wanted to point out this difference in 
> overflow handling.

OK, thanks.  Feel free to resubmit whatever you find better :)


Takashi
