Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793462856;
	b=hTwjx1m5zM/npN5P5S5bXdxOEv5aSgAQN+XaivmQfxvGstflyG2sAyhuV/A3Pue/XZ1M
	 KMb3YoVDMH//xSfIt48LBI/owZi1DjE9zctqcNIUJVGGIHZNvejS49ry0VHp3KSPeG3Ll
	 8pmmOzUH4cmh1rc066Si++8h3U9Tcz0e/46zCohXIPcrJf0nbjmweQ6mUXn+g5XH07dBi
	 yoe3PgO12+CkCHJ1WzLDXPC1rKaPQtJ0Z5on0c2yo6+KrUAT9fPE6EDmdfQpkxpk0CHYW
	 ssCE8178MvU6W0OSAMZ3EFyjPFTPc6hb0j4IiXOVadjjMtP+b6VsDbngEWVJmZD/mWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793462856;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=PA9vU0omq/fxSdNdd7H4n2vOQMmXeVuMKu9PtE3/l7E=;
	b=S/9+psnYrMkSm2XrJMSr8kz+Je2zH900k7UuiNZDSb+84/r4kSBINsnc7ZRMBYfmins5
	 qKDMMy3titE+3NnygImWAaQd6Rn0psDr1iLEnLyjeeOyb3qGBCD0/fNhlzi3JUfY99eg1
	 g3GfdovED0pblEyqGsCwLyJtfwaCI+5u0wRUzIBMhH03QZ1zFvAG1yOMFutkmk7eBcI+y
	 mbIqGTAPrezb7D5vEaFXv5pra3M6qFdf0npeLse6fLW83sW5Xic7fjFYxgqa9lMqqJdwk
	 ZBQrfpC/EOIDKnNp5D8Bmr7ek4QLzoToV8mcQJOTfkYwhrWsNBwmt01E/P+l1DMi/rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DvrvSMd0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xkKyDRWE;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DvrvSMd0;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xkKyDRWE;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422D9606A31A;
	Sat, 31 Oct 2026 16:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 422D9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DvrvSMd0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xkKyDRWE;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DvrvSMd0;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xkKyDRWE
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4EBC01F397;
	Sat, 31 Oct 2026 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793462854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PA9vU0omq/fxSdNdd7H4n2vOQMmXeVuMKu9PtE3/l7E=;
	b=DvrvSMd0rfLgEDBDL/EJlSOqNx+XK8mJjfG4BSALz90gbBjZEAe/HCQnNLOvA/hZPlE04R
	OI1aYSetctq0yWfGr3XIqTT8YNI73eU51ZyBYnPWvgIpGxT+6uK5eOjl6nLkUn0/8DrxfF
	4tC002XqzGqHqKTqYAELV6Q/wjAh+rA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793462854;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PA9vU0omq/fxSdNdd7H4n2vOQMmXeVuMKu9PtE3/l7E=;
	b=xkKyDRWEPBUh03fTCbJwAKjuHJdisjGp8xA1FoBMmkXzMdGNsY9YO0jGtJT0yL/I9mooSL
	0YimWzH0dgoayFAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DvrvSMd0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xkKyDRWE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793462854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PA9vU0omq/fxSdNdd7H4n2vOQMmXeVuMKu9PtE3/l7E=;
	b=DvrvSMd0rfLgEDBDL/EJlSOqNx+XK8mJjfG4BSALz90gbBjZEAe/HCQnNLOvA/hZPlE04R
	OI1aYSetctq0yWfGr3XIqTT8YNI73eU51ZyBYnPWvgIpGxT+6uK5eOjl6nLkUn0/8DrxfF
	4tC002XqzGqHqKTqYAELV6Q/wjAh+rA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793462854;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PA9vU0omq/fxSdNdd7H4n2vOQMmXeVuMKu9PtE3/l7E=;
	b=xkKyDRWEPBUh03fTCbJwAKjuHJdisjGp8xA1FoBMmkXzMdGNsY9YO0jGtJT0yL/I9mooSL
	0YimWzH0dgoayFAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBE0D132D3;
	Sat, 31 Oct 2026 16:07:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id f3PJJ0US5mouNAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 16:07:33 +0000
Date: Sat, 31 Oct 2026 17:07:33 +0100
Message-ID: <87qzh5rgze.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <blum@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usx2y: Use prepare_inurb() in usb_stream_start()
In-Reply-To: <20261030111200.114945-3-blum@kernel.org>
References: <20261030111200.114945-3-blum@kernel.org>
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
X-Rspamd-Queue-Id: 4EBC01F397
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	URIBL_BLOCKED(0.00)[suse.de:dkim];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.51

On Fri, 30 Oct 2026 12:11:59 +0100,
Thorsten Blum wrote:
> 
> Replace the open-coded packet count and transfer buffer length
> assignments with prepare_inurb().
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Applied now.  Thanks.


Takashi
