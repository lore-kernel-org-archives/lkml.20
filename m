Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631880;
	b=cP7sVV+daDODS+3DLnVR34OEcPIAbK/PdM6o0iFjf5qf9W2m9wRKU12ovIGCgmu9uCjD
	 9KOIHprOXNiAgWZZn/muPJWKrXvyWIjatEnpzMwQvGRNoqivmBiZw67I242rMJKf37h1L
	 mwOXd72JyrzPiLVEr/bJMBO2/incbjwZioY+1ublRcuzN/4WxmeoAWo/W0bO5edviIMG6
	 FL0oQ6eyhX+dVmVDVovH3RQHxV5rjw2d0hfDrSzRSuRTMZ71k0BWgAAXRvfFnEa//QgNp
	 A4c8a+hdnZ+PI0f2UtYiRn+VRPOdZ19TCxwQwTNcVQ/Xx/JTk3cb+1gv/f7W239800w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631880;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=q8sdb5D0GbMU6BQu/a0AaTK3g6BiqqeOgE4WIs6sYWQ=;
	b=NbCpGhq5IWsZ6JehzqC92v1bIOb/x4+GnUtE23I5f7Trn6gPgmkvWVTqQWxC9eXNioq5
	 n+GNjtGaTpDyj/Kpew24eFqYYZWwpu+hOFQcA2Nns12tPC5hZAsjadzhSBsfFTdaySK9P
	 qyyMhZwgUyQtnIm0UhmPEMxxyZNdrmqKivKJTmmjHcj9yWCeEjgWMds2FDRHsTMIqGDOW
	 o5n43rz9KPhPaAS5LvTECXe3qFlQiUrtFTf7wiDH2fdeKWz5FX21bSbPB/T2MHLRu/oNI
	 gZNGfd9MgaJBxZj0mTfXBRNsrHVcccsIH9b9jn6AW6OR2mZpHp3C97My7TVBCvPML9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Ym0V8ERo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+O1trQrU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=r5HEpL+J;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UPM1v8oD;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30E66085088;
	Mon,  2 Nov 2026 15:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E30E66085088
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Ym0V8ERo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+O1trQrU;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=r5HEpL+J;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UPM1v8oD
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E93311F7FB;
	Mon,  2 Nov 2026 15:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793631878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q8sdb5D0GbMU6BQu/a0AaTK3g6BiqqeOgE4WIs6sYWQ=;
	b=Ym0V8ERo2TdfCQMjUEy9xrS7WpPPUaaAdSm9ninyrN+n8B586btwkIjKPcCA929cPTP0lb
	pO+dIGxtP04a9zPiFkaLxhDlV/7RYKZoEG4iBLyCcVfgYU3XpFNGVfbZwAx8Gqip5RlH1z
	/6X2BJmjJjiDpBEjuzjmUAJ6JG2J8fs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793631878;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q8sdb5D0GbMU6BQu/a0AaTK3g6BiqqeOgE4WIs6sYWQ=;
	b=+O1trQrUxomczyPFDSMFWH25Edfmdc+7LPO2ZXENNC6ihIuz17PMY30TYFbkaLBQ9fTwVv
	CFPXUHzqfmZ1lrDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=r5HEpL+J;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UPM1v8oD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793631877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q8sdb5D0GbMU6BQu/a0AaTK3g6BiqqeOgE4WIs6sYWQ=;
	b=r5HEpL+J9KnvodNqUWGZDJ1OPJVPVmptlF7NJ8er0/r9AV+po1B9Of1b0kY3neIb1NTVLp
	UMY1NDQHbLscQosV7J/ILpqkQ93R0j7isWzVJxuPC6xxPFzSnZOp6queKpoVxxYluKPbUP
	2NoENqPWZg5hz7wviLN4SAcU3TKuRP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793631877;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q8sdb5D0GbMU6BQu/a0AaTK3g6BiqqeOgE4WIs6sYWQ=;
	b=UPM1v8oDLoFr/x0U1TspMjjhgMs0LrSL3/jv4StxTUBckQb/Sr9J7SzCftXRaxU21Gbhlg
	x1u7cUdo4cRzN+Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86CE8134B8;
	Mon,  2 Nov 2026 15:04:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Jr/VFYWm6GouYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Nov 2026 15:04:37 +0000
Date: Mon, 02 Nov 2026 16:04:37 +0100
Message-ID: <87pkwn8ebe.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: tiwai@suse.de,
	cezary.rojewski@intel.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	rosenp@gmail.com,
	tim.bird@sony.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: pcm: Fix source frame count calculation
In-Reply-To: <20261102144736.3679-1-sreekuttan2156239@gmail.com>
References: <87wlqv8ftw.wl-tiwai@suse.de>
	<20261102144736.3679-1-sreekuttan2156239@gmail.com>
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
X-Rspamd-Queue-Id: E93311F7FB
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,intel.com,vger.kernel.org,perex.cz,gmail.com,sony.com,suse.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.51

On Mon, 02 Nov 2026 15:47:36 +0100,
Sreeraj S Kurup wrote:
> 
> You're right. I checked the callback implementation, and 
> "snd_pcm_plugin_client_channels()" always returns the input 
> frame count. All plugins created through "snd_pcm_plugin_build()" 
> use this callback.
> 
> So the condition "err != frames1" is not reached in the normal path. 
> My patch is unnecessary. Sorry for the noise.

Well, the logic you described looks still correct, so it's better to
correct the code even if it's only hypothetical.

So I applied your patch now with a bit more explanation.


thanks,

Takashi
