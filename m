Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C5249F101;
	Mon, 28 Sep 2026 11:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593677; cv=none; b=AJwdaRCYNMtiIH8vtXG9yw/m2sG5+Z/M009H+gPJEGkquolYnIVAEKpfHLqTB4J1BdAtsVUYebocz7dsW+dMwsSDNS7c+TyCfed670Ow7WoLW2dWRjU6cy1/x4ldxSs04KKjoyMRRwX0AoqdlsvKAn+4gGVBBJDwrjOVQGA4a58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593677; c=relaxed/simple;
	bh=57b/YzYuSHdu+o9cCJVFoSgxIqo1aFOb5mFzPCBh7oI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P4GOFtHp4ImccKWkjkc+8oUtfWSohYSUbeU5fD+NDYCnE6Eyv6CWlpF/ZUXyZYEdJnJ9yR4jkGQEi0rppVUS6K7ffEHuT4LuSivRllXcNFreiQ+fKcljdyuYuU7nEFnEd1CSB3c0nMhsmqwL6akqQ2zkEG5fV0gW5jk6zh4e7Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eFV+WFEj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dOlZyP0f; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bEww68CL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L/VlbHuc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eFV+WFEj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dOlZyP0f";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bEww68CL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L/VlbHuc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A3951F812;
	Mon, 28 Sep 2026 11:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790593669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N5Xk/Hmvw4QQu9jIAup5HawycBoBR2CCMQqxVFU3P00=;
	b=eFV+WFEjl9RLBTENAzBwOI/XEne8Y+y4x9orjvmvFjqnTz/Yqd78HeYCA+60aZFDCROIT5
	XRRpxK84jPoukWtbwuIqnuSQeKkQuBpCkaSqps/Mlb6hm/dl8l6APx3WM8sHjwIUoeGDFs
	PuXLluPanMqgcgh1c88OzF+GZri5KcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790593669;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N5Xk/Hmvw4QQu9jIAup5HawycBoBR2CCMQqxVFU3P00=;
	b=dOlZyP0fDDr4g3Gim4DXTldlvIEngkEbcPstn3gDep3bweFiM0DgP/AgdYrjwFr3Z00egB
	NXmmE55tNt17hiDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bEww68CL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="L/VlbHuc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790593665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N5Xk/Hmvw4QQu9jIAup5HawycBoBR2CCMQqxVFU3P00=;
	b=bEww68CLKK8H2AbBuqBgm5ggXmVDisQ9oCH139EMjtL3LjrkMC+pg2GCGadAdBZ75JSbR2
	uIxFcjlZE72p1H2fbGAHooMop9yTDxj4e8TGIw0XaNdSPYmO4GqH0JQMaH/BbgMTi255mx
	AabiFDihiC5FpAnNH2/ygvfSGpjz6jg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790593665;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N5Xk/Hmvw4QQu9jIAup5HawycBoBR2CCMQqxVFU3P00=;
	b=L/VlbHucyqoiwdXONs0wq4Z3RGKIaJlBR8HTdMJJNltsov0DPpexMn/zMAbL01TcEgpr9E
	ItjUAFML9vLpAoBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3A1BE133F1;
	Mon, 28 Sep 2026 11:07:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lGKLBIFKumpMKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 11:07:45 +0000
Date: Mon, 28 Sep 2026 13:07:44 +0200
Message-ID: <87cxtx7hxb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Acer Nitro ANV16-41
In-Reply-To: <20260918110301.664172-1-zhangheng@kylinos.cn>
References: <20260918110301.664172-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 8A3951F812
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Fri, 18 Sep 2026 13:03:01 +0200,
Zhang Heng wrote:
> 
> The Acer Nitro ANV16-41 requires the ALC2XX_FIXUP_HEADSET_MIC quirk
> to make the headset microphone work properly.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221953
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied now.  Thanks.


Takashi
