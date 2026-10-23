Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762447;
	b=AuOKFbLicQFDequVyoK+Vn0/j0bXPYTe0zxmQrBiUD+8sgw4F0vWHdAW0HB/Ji3/wMhr
	 IVl5iN57+jDbHi+Z0Hlib7mcM94DbUZTC6K0o6n1faN6aUh6ChRho//qgXvOfepbCWXQi
	 Z6B5xcmRjq2rWEo8bZIeSKUXInk39pqYKW+buNaSVnRNGoykfcbUfVzvF+nYFXA4MfbUf
	 GJ8JkFvUi+nLZBLlx3stdqpkbh7Q6p0kVPvI6Obm5kn0y84T8OgUviIPIXpCSB6+wAS5r
	 XpKaaMQNwcA7qUgYQDffTcdbqjSy680QJfh6cXgPQdqw4QAsnGxfB25GP7RghgwyHYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762447;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=4DUQZ8KTzA58M2ePEzmfN785cYb/uj5h5rNraNyYL8g=;
	b=jPEjaY2ocUhzC4d+CM30dBfYIz+roLiROY/wAybl9A8B1GLofIFgdOOVLFkuIQ/Liqu0
	 oJ1VKT1bkws2P+sENanezIHmr+nlVYtI6HyXbwbaUrHndJ5dSup8pDLsC8M5lQ5SML7CP
	 yMh9zCZB2yAmq16Dn1sb8c/hj3B/ILUklZpfjvhZTq/xJq2ZpykoOlpeaC2Yq3aMZIshz
	 lo+L0su2EObDhE/Uc55iEWzP2Zcz0k5Fkh/S9eKyOf29e3+vs+70re6OzLcecd939qzPp
	 4EH/4JTXAgE2ykTaXDeGzEmm+E5mXfldjuDMbM/QINJoGZg/2QaVuiwGt0DFp7qdcIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="RW/Rqe9e";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+KaHnapv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="RW/Rqe9e";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+KaHnapv;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA396606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA396606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RW/Rqe9e;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+KaHnapv;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RW/Rqe9e;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+KaHnapv
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 191C6220E6;
	Fri, 23 Oct 2026 13:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4DUQZ8KTzA58M2ePEzmfN785cYb/uj5h5rNraNyYL8g=;
	b=RW/Rqe9eXh0xbI23smWE9SdpdoqRn7ZLNO8SsPR1Sy2jqqZQ+39yDCL0vd4EhfQ6nHf4H+
	g7rhMHRjaFhck96t7RIxHfwwzzlNb+gpwnUuNfBD8hUz3ivjNQGasqOR95KmTwCdJcoPPL
	w3pb0DBO4dFwxIRsqcQ927gh0qriUvY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4DUQZ8KTzA58M2ePEzmfN785cYb/uj5h5rNraNyYL8g=;
	b=+KaHnapvzQmazttFunDjMUT96oLZf2RclixXWbvy9h7pBT7hPn8euG/nw+0/9WmwenmVZf
	G/HCzMA9UC6jq1BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4DUQZ8KTzA58M2ePEzmfN785cYb/uj5h5rNraNyYL8g=;
	b=RW/Rqe9eXh0xbI23smWE9SdpdoqRn7ZLNO8SsPR1Sy2jqqZQ+39yDCL0vd4EhfQ6nHf4H+
	g7rhMHRjaFhck96t7RIxHfwwzzlNb+gpwnUuNfBD8hUz3ivjNQGasqOR95KmTwCdJcoPPL
	w3pb0DBO4dFwxIRsqcQ927gh0qriUvY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4DUQZ8KTzA58M2ePEzmfN785cYb/uj5h5rNraNyYL8g=;
	b=+KaHnapvzQmazttFunDjMUT96oLZf2RclixXWbvy9h7pBT7hPn8euG/nw+0/9WmwenmVZf
	G/HCzMA9UC6jq1BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B51D2133F6;
	Fri, 23 Oct 2026 13:34:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nw4mI0xi22pmTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Oct 2026 13:34:04 +0000
Date: Fri, 23 Oct 2026 15:34:04 +0200
Message-ID: <87h5ica6cz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: rppxj178543@163.com
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.com,
	perex@perex.cz,
	fuhao@open-hieco.net,
	linux-kernel@vger.kernel.org,
	renpanpan <renpanpan@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda: Force MSI for Hygon H34M51A board
In-Reply-To: <20261022085438.1315679-1-rppxj178543@163.com>
References: <20261022085438.1315679-1-rppxj178543@163.com>
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
	FREEMAIL_TO(0.00)[163.com];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,kylinos.cn:email]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 22 Oct 2026 10:54:38 +0200,
rppxj178543@163.com wrote:
> 
> From: renpanpan <renpanpan@kylinos.cn>
> 
> The Hygon HDA controller (PCI 1d94:14a9) has AZX_DCAPS_NO_MSI set in
> the PCI ID table to use legacy INTx, as MSI may lose interrupts under
> heavy load on some Hygon platforms (commit 41212ff3e4ed ("ALSA: hda:
> Add support for Hygon family 18h model 5h HD-Audio")).
> 
> However, on the Kunlun H34M51A board (PCI subsystem 1d94:c950) the
> INTx interrupt line is not wired.  /proc/interrupts shows zero count
> for the HDA IRQ from boot, so the RIRB interrupt handler is never
> called.  Without RIRB processing, azx_rirb_get_response() times out
> after 1 s, switches to polling mode, and the resulting slow codec
> communication delays card registration by ~20 s and breaks
> unsolicited jack-detection event delivery.
> 
> Force MSI on for subsystem 1d94:c950 by adding it to msi_deny_list
> with value 1.  The list is consulted in check_msi() before the
> AZX_DCAPS_NO_MSI check, so H34M51A gets MSI enabled while other
> Hygon platforms retain INTx.
> 
> Signed-off-by: renpanpan <renpanpan@kylinos.cn>

Applied now.  Thanks.


Takashi
