Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432928;
	b=nDppp64EUOUcRHCfhAwgn7hTI6RngIofmVM9rIfpBcQAQ6DIRnHcEsRzIuSXWonHv1FD
	 5DLQMTNm235ArHJPpN6wkJ7cFtSukdLnk8KUS12UKFcvvq5VJdDrvXi+5GMynPAw+UqK5
	 iypmm/G6kiM5yyS8W5tPmyPCLnDJokTEgHjRHP0pYCIGKRdZPxjPGu5hMYoCBylgg/qtR
	 bAMs5EvoPMi+xf2dxCievJ9kTP/voVwuPUtTeUP9iQsscctXDoXKXD59j8+h8KXzzNQmT
	 NPHeBixEyVvoQ1DxNq7RRg8d6IprfuBa2MvEjo9PKMwx1gm8EZrLnE8lpEmj5a354AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432928;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Action:X-Spam-Score:X-Spam-Flag:X-Spamd-Result:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Server;
	bh=aKZ1aikurg0GK4TNGTnJUIcJOAbEKq4AMkWrBbjPblc=;
	b=wP2FbrWI09SBEK/+3GnH5DB1ifhaG9C2XZNjyRRtVGdfxQEQDOdwo/wmFxnZ83bp56bw
	 7QFn+R1iLfmbmZBkY2ybS19/blYm68FDfpFrSqnTNWvgqP40oPbz7Htg1lGRKl2YRhhmN
	 DY25IHxkeOojMNtJqELPjd4v9hyThq9Vie5rlKfpK8J/OdMiL15Ev6/So3mpE7amsDTeQ
	 qE8kOJikXv6xKuua88MGEyvYS2ryDMf25YbU2fANSgGpW8vVBlVnrlJwUtNvS7qnKy8SM
	 yQ21Tq80lozu/0GFsdP4Ap1FcJpotuM2QHusmGMTbrprBIHMxVJYr3brs5ADHYW5X9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YiurJyDj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="duS3kh/i";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YiurJyDj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="duS3kh/i";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004A8606A31A;
	Mon, 19 Oct 2026 18:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 004A8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YiurJyDj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=duS3kh/i;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YiurJyDj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=duS3kh/i
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 39A8021CAF;
	Mon, 19 Oct 2026 18:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792432926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aKZ1aikurg0GK4TNGTnJUIcJOAbEKq4AMkWrBbjPblc=;
	b=YiurJyDjTFRcA8i6plpi1exYm5U8/QJ2E1+HxpJXoI2rZNFGl/e61pDODM0DR7vNNzUaPJ
	w4YM3QUqGJtBJovAcfVaYrYe7jFQhvnHOj1pJy72PAiBbhr7QR5Vw92LWthqTrDXqV9f0z
	D6U+a6tuwZcjn+/IVOus0oSoSaFcRt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792432926;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aKZ1aikurg0GK4TNGTnJUIcJOAbEKq4AMkWrBbjPblc=;
	b=duS3kh/iZw2/IlJvi0hNThHdo422ia+vYZL8qjovVw/VTfZDQtbKau03GEw32g/njnZzgw
	F2173iU5tMg12WCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YiurJyDj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="duS3kh/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792432926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aKZ1aikurg0GK4TNGTnJUIcJOAbEKq4AMkWrBbjPblc=;
	b=YiurJyDjTFRcA8i6plpi1exYm5U8/QJ2E1+HxpJXoI2rZNFGl/e61pDODM0DR7vNNzUaPJ
	w4YM3QUqGJtBJovAcfVaYrYe7jFQhvnHOj1pJy72PAiBbhr7QR5Vw92LWthqTrDXqV9f0z
	D6U+a6tuwZcjn+/IVOus0oSoSaFcRt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792432926;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aKZ1aikurg0GK4TNGTnJUIcJOAbEKq4AMkWrBbjPblc=;
	b=duS3kh/iZw2/IlJvi0hNThHdo422ia+vYZL8qjovVw/VTfZDQtbKau03GEw32g/njnZzgw
	F2173iU5tMg12WCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9DAD134B3;
	Mon, 19 Oct 2026 18:02:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LyIcJB1b1moMSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Oct 2026 18:02:05 +0000
Date: Mon, 19 Oct 2026 20:02:05 +0200
Message-ID: <87wlrdin6q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Wayne Sun <sunweiwen@awinic.com>,
	Jimmy Zhang <zhangjianming@awinic.com>,
	Ben Yi <yijiangtao@awinic.com>,
	Xia Yun'an <imitoy@imitoy.top>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: hda: aw88399: Add per-model firmware loading
In-Reply-To: <SN6PR19MB230399720ECFE990FF92A7BFFC992@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB230399720ECFE990FF92A7BFFC992@SN6PR19MB2303.namprd19.prod.outlook.com>
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
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[outlook.it];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.it];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,kernel.org,perex.cz,gmail.com,squebb.ca,awinic.com,imitoy.top,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 39A8021CAF
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Sun, 18 Oct 2026 19:43:55 +0200,
Marco Giunta wrote:
> 
> The AW88399 HDA side codec driver currently requests firmware using
> the same hardcoded generic filename ("aw88399_acf.bin") as the ASoC driver
> it was derived from.
> This requires users to manually extract the firmware from the
> Windows driver, rename it with this model-independent name, and place
> it in /lib/firmware, which is not sustainable for distribution packaging.
> 
> This series adds support for per-model firmware filenames based on the
> ACPI subsystem ID (e.g. "awinic/aw88399_acf_17aa3938.bin"), making the
> driver compatible with the linux-firmware repository's per-device naming
> convention.
> ACF firmware binaries for the currently supported Lenovo Legion models
> have been submitted to the linux-firmware ML by AWINIC [1] (currently
> pending review).
> 
> The series is as follows:
> 
> * Patch 1 adds a name parameter to the shared firmware request function
>   so callers can specify the filename.
> 
> * Patch 2 uses the ACPI subsystem ID to construct model-specific firmware
>   names in the HDA driver.
> 
> Note: since there are still some AW88399 patches either pending merge or
> that have yet to cross the ASoC/HDA bridge (see the note in [2]), I based
> this series on linux-next, meaning a rebase may be needed before merging.
> Apologies for the extra noise; I'm sending the series now for review
> as I'd rather not miss the 7.4 merge window.

Applied both patches now.  Thanks.


Takashi
