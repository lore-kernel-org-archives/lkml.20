Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865069;
	b=DT6OjRnb7eTcYc0CB3RWAGmvW5BokbnWAsBYDb1egB2EBdPIMJuet6t5pryuo1/db2aB
	 RhbzxRfePa5d3TWNd4EVTRsPbbqSXq3lg1ucRHMRNlf+rDLTdT5NwfvON7Xd3XpanKziy
	 8h+rgg5OaSBtl6eHndjc1b7KzhNVVva/gZU1Z121qLkwGUbGg3v7PbYuMD/EhFHpqZLqV
	 Hyingg3f03Uk6Z6kDuG0fNhO+rU7mLm+1dv2o2hywnT1++y09OeduCNBS2NszA4Z2oPC/
	 dSVqBuRlqMc6D8ufSkVcKGpmknIW5+QpuRGwHivo0EIx1rPYg6jxRKhMDzvfO9mXdBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865069;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=Hph0IOhhCjMqImQYDnrzARj/y1pmvIpZAgqPEVLSd8E=;
	b=MrkJPqv6Y009xYp23ZBbgH4ZN014zHak5XmHKoX7+d49m9RJnxPSaXb0SmaOxD259VQh
	 eaZqLUMAGAw+UxMyGfd7McYIuwQVqTox7baB9yOIwJ79iqFavrxSEaEQa7G9ZuHKZXoGw
	 3AE0kQ5P/mfTaRPmkW30e24VmmT+VBqQ6xPaV26ghX0fY8qxlJtvTWYw7y3R2LkA+Fj/u
	 kyIqs/0xA9LxPl0lSUYdWDW1e+0OEQr0xL78aQXs7wMZtvNFwBafLb0Bxy60OhkmHNih7
	 PuB/1rseBFeTFxDwnrGE+3MYm8+uSQnHz2cN6JzYrYvvgY1tbibSpMRzY+Qe2QsFidA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nZk06gix;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FUVRRk8F;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cm4GeSiL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zc8l29zC;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF506606A31B;
	Thu,  5 Nov 2026 07:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF506606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nZk06gix;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=FUVRRk8F;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=cm4GeSiL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zc8l29zC
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E8DDF21FD1;
	Thu,  5 Nov 2026 07:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793865061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hph0IOhhCjMqImQYDnrzARj/y1pmvIpZAgqPEVLSd8E=;
	b=nZk06gixHKzcn/fXNmp2QkSp5Fx34uFXLAxgRlITwnPRgv79D47a7UvrHrOZ1hS8WC4+Uq
	ay0iMiJHz0G7mX11YplRL6bUM+bofl0ziMhdTqE5Ye7ukG2XhM48aDtoCaoRsJNC/sNICl
	uSfwFaNhl848Kzh7e58aRh1ABDIA/rE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793865061;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hph0IOhhCjMqImQYDnrzARj/y1pmvIpZAgqPEVLSd8E=;
	b=FUVRRk8Fr6Ww6hCWKoiaoxFiVcTZFFNpOyiC2ywEKyzAEEdSQ3c7OP1Kh4H4QhJU34yzWa
	5R6JU15WIGPVqhCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793865060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hph0IOhhCjMqImQYDnrzARj/y1pmvIpZAgqPEVLSd8E=;
	b=cm4GeSiLK0LkImEP+sceqjWeO8bc3QsOp9Xn1nopT6/bWZUEpjqzOC+d6RSGRhWGkVRkqa
	AAL9LLTMzLJwQP/Jv2Ip08sktskvs2SYNfo9b9LFB5debBrzlw/OnqvNsPjQwkEkOVCurj
	BqVsvggxs7JT7tdkgm8OF6Mw55EB2w4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793865060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hph0IOhhCjMqImQYDnrzARj/y1pmvIpZAgqPEVLSd8E=;
	b=zc8l29zC9oQJpZo3EG//5cPZaRh0sjxensAIjuxJdZRTluonrYrJrgwMQwylkX3a01QkgK
	sGnIZtu42Vq7fOBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D2F1134F4;
	Thu,  5 Nov 2026 07:51:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 98dUEWQ17GqyCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Nov 2026 07:51:00 +0000
Date: Thu, 05 Nov 2026 08:50:59 +0100
Message-ID: <87zevnsom4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: raoxu <raoxu@uniontech.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	luiz.von.dentz@intel.com,
	pmenzel@molgen.mpg.de,
	pengpeng@iscas.ac.cn,
	brgl@kernel.org,
	u.kleine-koenig@baylibre.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: intel8x0: keep AC97 PCM descriptors for ICH4 capture
In-Reply-To: <5387AE07DB9C7930+20261105014642.73877-1-raoxu@uniontech.com>
References: <5387AE07DB9C7930+20261105014642.73877-1-raoxu@uniontech.com>
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
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 05 Nov 2026 02:46:42 +0100,
raoxu wrote:
> 
> From: Xu Rao <raoxu@uniontech.com>
> 
> When S/PDIF uses the AC-link, spdif_idx is negative and the AC97
> PCM assignment drops its last descriptor.  On ICH4 this leaves five
> entries, but PCM2IN and MIC2 still use entries four and five.
> Opening MIC2 then reads beyond the allocated descriptor array.
> 
> Keep all six descriptors on ICH4 so the capture stream indices stay
> valid.  The S/PDIF descriptor occupies its fixed position but does
> not create a separate hardware PCM when S/PDIF uses the AC-link.
> Other controller types retain their existing descriptor counts.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Applied now.  Thanks.


Takashi
