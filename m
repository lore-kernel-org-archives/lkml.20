Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575215;
	b=WF+OA9RO9VJjxvoR+keNQ2BCfh9TjH4f8Uti5jUhArtBI8TB/DpB7xd+DAEgXb0hNVjg
	 k1S5wtWyHpPBPBoVESfK6LEnZnD+wBm3LK7b1CdJRuqogfmPNSfg3N+FEy1PMkeVJJfqQ
	 D7CnzuscsRaObRufPbQtlf5C3NsLNVa9xAEO2PuE98Ehqx1VOy1KFD07blUKaaho1ow2j
	 1IHG/ZOUr2mqq9vOMGYVBxykFKObcp728hfHX2ySDdcb0ZOUgyW3sg2UetCKLA7NKfI+T
	 DFPVNwmjhK4uP94XbiztTKlTCgO9B6oA6KzeeQ5QDOPwdcIWM9BNBlV/0hpXTAYe48w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575215;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Action:X-Spam-Score:X-Spam-Flag:X-Spamd-Result:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Server;
	bh=fUwJNqnNPo0HhGsYSuG5OpCh+f36MUeEvCJNxa2Yx6M=;
	b=y/bzyroqqPXnMM+UYbXBrj+AeIsm2JqXfWOyaog3sVyEd9+pK6ZEsKrhB1AbCisVzP7f
	 iwVU63NfZA5TDTsgwjEzBeXzWVW5IqkO9L+x3mKZc8h20FilzvhNcGIBfppvYPut8NrLd
	 1565xDHwQxGz/CcvavdHtjNj3zFb4rgh6d3fgZqrsXRJC8tah1BkWgNEHGnW9J3vWvG2Z
	 qPbZtTjGR+UoYOrM9eavJvZEgYPnyoDKFsN8Ec+Brnc9EhJaXbpX804yJ7PfrEDMybDN/
	 Np522H1iP4gTUgmqMYeDYhRCA1LeBXliBKhR8uc42mXP1Cjfxie6WneW9REFelqY5ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KIyMXt9V;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5exfmNHU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bT90IVEy;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="/exeiU5y";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52C0606A319;
	Wed, 21 Oct 2026 09:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D52C0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KIyMXt9V;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5exfmNHU;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bT90IVEy;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/exeiU5y
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F14CB1F457;
	Wed, 21 Oct 2026 09:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792575213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fUwJNqnNPo0HhGsYSuG5OpCh+f36MUeEvCJNxa2Yx6M=;
	b=KIyMXt9V3eg1/1fRVCrDu4HHijyeid7PRPyK3sHdmg1ZKDGS4DjppNItJBPDmyguur8Wzf
	Cl5LEWw5UORDZu9E+VjNOuBHHlU0HOPfsJ/4K1DwXxdcYCW5eiHIfpC2jNzfRcRHZ9DllP
	dtMrBdbEa/IWRJ3okJowu6FQstZ9QXs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792575213;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fUwJNqnNPo0HhGsYSuG5OpCh+f36MUeEvCJNxa2Yx6M=;
	b=5exfmNHUVoUkKCvIO+vmRNfj/s74VEldOHoNnrGdBMOVuJ3cgP0BDLEkORQwJJz3Pghx54
	FuYWYqYCUWKGYiAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bT90IVEy;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/exeiU5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792575212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fUwJNqnNPo0HhGsYSuG5OpCh+f36MUeEvCJNxa2Yx6M=;
	b=bT90IVEyFNn62P0y1WTcbhjlg1EPBQ1AdiyQZfjjwm4zpYq3MqeFrBte4Txnx5OzkIw1mI
	xrD4+QTpBbRpOeFxwJu2iYfnY0P6ehkg4bxRIIJCZvIptQqbOG58s4P6iuIJScm70v768Q
	3f0vxxyFcMq4LxTJZWX5mIoz2rZXoy8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792575212;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fUwJNqnNPo0HhGsYSuG5OpCh+f36MUeEvCJNxa2Yx6M=;
	b=/exeiU5yDR3qa7iuUU137EbULsGZYELXDsPQEHHCRCGq4lQ0Zm3LsilZqPTL8UrQRBUGee
	0zgZIJLgT6o+Y0AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5057134A5;
	Wed, 21 Oct 2026 09:33:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HGHqIuyG2GoUGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Oct 2026 09:33:32 +0000
Date: Wed, 21 Oct 2026 11:33:28 +0200
Message-ID: <87a4o7flef.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: tiwai@suse.de,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/realtek: enable AW88399 on Lenovo Legion R9000P AFR10
In-Reply-To: <SN6PR19MB2303183ED736005C0A40CA8BFC662@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <87qzhseiuc.wl-tiwai@suse.de>
	<SN6PR19MB2303183ED736005C0A40CA8BFC662@SN6PR19MB2303.namprd19.prod.outlook.com>
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
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[outlook.it];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVRCPT(0.00)[outlook.it];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: F14CB1F457
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Wed, 21 Oct 2026 10:38:28 +0200,
Marco Giunta wrote:
> 
> Friendly ping on this patch. After the 7.4 ASoC PR, this should apply
> cleanly.

Oh, I thought this was the one of your patches I already applied, but
it's not.  Applied now.


thanks,

Takashi
