Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C88547074;
	Mon, 28 Sep 2026 12:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598423; cv=none; b=E6aAR8ejjiAnn7EdTxgPVzjiPq4/+7JsqaKDf2J9Qbk/qEsc7+sW8aU0Eji5h5+wnSAx8P0G+y5Ks6aV4SN3T76LOP/8RdPUZkTWJvp1es2rXbGw3Eu5G5McOV6PbD2FR2CVtqs+RDBtSK8bvwFAmDxoMwU8jXWJnYQ7nmBgFak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598423; c=relaxed/simple;
	bh=fzBb13jWeHbetOHaxkffaUktqw43QLasIW90cL/E2tk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lS1Kg6AThaZpVbpw5hcfP38oYNx8PArGP8NJlVufbAnYrv6zCoEfHGEPz+WNk7+EnMcq/eOUZGqCywrLRHJ+kSahkOAVGTOvL9EpPx0GiOv6LYf+2Unf0rcfhYSjdJWuR1T7ut1UQsw1RaeiszhZVGa3h5eTqGOUMJw4d0er/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=peBfZOi1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ccUrRNL1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mzij3oPg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IvTcol6R; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="peBfZOi1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ccUrRNL1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mzij3oPg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IvTcol6R"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CE6D21FB2C;
	Mon, 28 Sep 2026 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790598416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AMCD1jeroqJFqfdYDzOlxe/63Fke+HvavrjJJ6441D0=;
	b=peBfZOi1m7YE098432bgzU/fSACSLy97d2EsRcPSZWAwrPDJbFvm1K7WaiT/89pMKbIFnq
	QLBUyYIbQEo88I33SyoCfYD+HmZgrbYEAcQUaptlLcajUg7c81TOWdiUsL4edu14Kq7WXC
	DOuoQnsVYL9fZxCf26yfFCYb+n44Uck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790598416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AMCD1jeroqJFqfdYDzOlxe/63Fke+HvavrjJJ6441D0=;
	b=ccUrRNL1G96MHGxcHtZa3NjjtRmgAf1SZI5wqobSl1Si4K2cQCVP0mvwz7o+W9PCImeC76
	LyjsWrQrjwLI+8Bw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mzij3oPg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IvTcol6R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790598411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AMCD1jeroqJFqfdYDzOlxe/63Fke+HvavrjJJ6441D0=;
	b=mzij3oPgLYHrmsz4kLk/2DvIQtaTwexg5VEiqC+LXy04gXwCi7s51mOYNn4ABj6rNI2MMj
	Obbb/LKZDrrg2zJ98dKl/e+kagCsFdCI74fm1hh9WJ0KLLEOWoVzSf6axvg0YlrErZXjAW
	u86OEUp1MPDsk88VY9Ba64IjO6fCzkk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790598411;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AMCD1jeroqJFqfdYDzOlxe/63Fke+HvavrjJJ6441D0=;
	b=IvTcol6R0kO8aUXbmJkQQCUTxTeYWzQlGeapgLgXJODX8dfOL1YkTJ2FEDgn+TWNJXu5nx
	MN999/3VP4KMgWBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 78F3B133F1;
	Mon, 28 Sep 2026 12:26:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id U29lEwtdumrLeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 12:26:51 +0000
Date: Mon, 28 Sep 2026 14:26:50 +0200
Message-ID: <87h5j95zp1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jianhao Xu <jianhao.xu@seu.edu.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: via82xx: use helper to activate DXS controls
In-Reply-To: <20260927141447.788664-1-runyu.xiao@seu.edu.cn>
References: <20260927141447.788664-1-runyu.xiao@seu.edu.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CE6D21FB2C
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,seu.edu.cn:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Sun, 27 Sep 2026 16:14:47 +0200,
Runyu Xiao wrote:
> 
> The VIA DXS playback callbacks modify control access flags directly when
> a stream opens or closes. This bypasses the control core locking and
> notification path.
> 
> Use snd_ctl_activate_id() for both transitions so access changes are
> serialized by the control core and reported with the expected info event.
> 
> Fixes: 3d00941371a7 ("sound: via82xx: deactivate DXS controls of inactive streams")
> Assisted-by: LLM
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

Applied to for-next branch.  Thanks.


Takashi
