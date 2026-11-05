Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864955;
	b=5kO3VzPPvdpGTrMlpvlDF96UtuwHdUbJAJ5eGmLAvzOz4WMbiktW2FrCEvR5XnDshxLv
	 L48ypP/HOGlj6sOZpjjIlUiCAKFPZTldhCNLRpfVmx04pigr7YH3xZcQUefth3GHRnKlH
	 m2TOuHD05DvAO6OAys0GN1ljAfvfyHQ8nHLSc4jUM16MMh3c7+NHDw70zoYIvFhbwlSju
	 RGmnl2yeCi5G72Lf2zZo4EQo6j2M+CAiQwv+3QHLIQO4omZHNzDdjooK7sNFRKnq26D1S
	 DEx+pNcOnz3mTY6lHLoQoKykkw0LrnLs60eTuf0K3ciXzaMhFMHniGwbNF4svDDj94Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864955;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=3lcPp0+i9zGqOaWVsZfRGOjsWcLycn2VKzkiYCWyX0o=;
	b=oaNfOZoLBrt+b+hzN1YbgApSJSNeE6+WbR2uLktMekO2c9DadAaaAmbTci8Yml7PANkG
	 s0+46trFgS3RjvnmHtzCepchIBFM7IWAYjd9ClEfyMqtMCP8l7DpyB54tmjszfU0C9xB6
	 6Ele8yYgnOwI4Fl+quknvav+G8MMAgArZVptK1I2I6NFGdWCx+SXYDzOinSr5VBQDb99m
	 Ox4yp0DiBcJADjs+eeeO1u0W6dqiFqvt3qr4FcY58dImgVPQlu3cIBsFr6p0UyuICtj60
	 LBRrZHFKhwDRJ+B86ErA1Pw30Zq3cv9tZuIVW9e9pNMtFMkPGARHD1TrE5zoqJPz94g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U0d5xADi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PePtuVwR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U0d5xADi;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PePtuVwR;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF321606A329;
	Thu,  5 Nov 2026 07:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF321606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U0d5xADi;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PePtuVwR;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=U0d5xADi;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PePtuVwR
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 042611F399;
	Thu,  5 Nov 2026 07:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793864953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3lcPp0+i9zGqOaWVsZfRGOjsWcLycn2VKzkiYCWyX0o=;
	b=U0d5xADiy6VBWAkGiUKwroicgSj1rqGanB1ncmTahScngqAe2nbcfJcEoE/Gkp9sA6jWA5
	um+4As/77nrPuwtpqYB8NnPg1OJXiynGQXpI7UQXeKacNTLs0qf5OXjDAqUdCAscpQJJPi
	5KcrJYBvd5IjyiElTE1tQ8NGsKtUoWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793864953;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3lcPp0+i9zGqOaWVsZfRGOjsWcLycn2VKzkiYCWyX0o=;
	b=PePtuVwRVNv0XZhGiAkTJi+naDtc8uIp43ttVw5nHfxsCjNktIAOHMiBCeVJvhGs5AMGZd
	3bOAoIwjHWtP+pDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793864953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3lcPp0+i9zGqOaWVsZfRGOjsWcLycn2VKzkiYCWyX0o=;
	b=U0d5xADiy6VBWAkGiUKwroicgSj1rqGanB1ncmTahScngqAe2nbcfJcEoE/Gkp9sA6jWA5
	um+4As/77nrPuwtpqYB8NnPg1OJXiynGQXpI7UQXeKacNTLs0qf5OXjDAqUdCAscpQJJPi
	5KcrJYBvd5IjyiElTE1tQ8NGsKtUoWQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793864953;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3lcPp0+i9zGqOaWVsZfRGOjsWcLycn2VKzkiYCWyX0o=;
	b=PePtuVwRVNv0XZhGiAkTJi+naDtc8uIp43ttVw5nHfxsCjNktIAOHMiBCeVJvhGs5AMGZd
	3bOAoIwjHWtP+pDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 88FA1134F4;
	Thu,  5 Nov 2026 07:49:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2wu3Fvg07GoCBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Nov 2026 07:49:12 +0000
Date: Thu, 05 Nov 2026 08:49:12 +0100
Message-ID: <8733tfu39j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: core: Validate device type for dynamic minors
In-Reply-To: <20261104155205.3378-1-sreekuttan2156239@gmail.com>
References: <20261104155205.3378-1-sreekuttan2156239@gmail.com>
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

On Wed, 04 Nov 2026 16:52:05 +0100,
Sreeraj S Kurup wrote:
> 
> Reject unsupported device types when allocating dynamic minors.
> 
> This prevents invalid device types from being registered and
> avoids unnecessarily consuming available minor numbers.
> 
> Return -EINVAL for unsupported device types.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

As it's no urgent fix, I applied to for-next branch now.


thanks,

Takashi
