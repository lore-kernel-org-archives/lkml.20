Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762430;
	b=ez8vHtLKfub9H22vXpUAPTVOGhK8wUciTd3dqvrXMtwUYsHQwpLAllR+/9MwH2FTq/nx
	 0hSCxWnCGHGPCSCzkgt1qJ6S2E44+/noPewkfMuWOCPBfInkfOaMSf2enLc2opdcdUcFT
	 t5REklpjSnGmbtW70VkMAjRkX5CsJdHgDqn2gwvH3ge0wJk8W1f8Y0Kt4CDrchrRc8RJk
	 Uc0VcQTR70kFDxHgCg/WsbJcG5rAcvivoU3XwLzwX8yL2EkHqRV7rlyN7f7D03p0ERqB/
	 r2Ualzkn+tbWkGKCV9XiMUHVd8sSBYyv36D+7Qc6xKWIABttsrjZu9EOfsp5WQUWIeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762430;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=KL4o6xEzOAIte/25jp2EZ0upQXc2dTr/6KgTHFEVLJQ=;
	b=oacDZ5Xvgdl9Zi5ouip7DYQwFkfhbz9wiQlBvxrAMymTbZmRMaAFBAsaawbxV5KLL3jz
	 LnVk4NdRUDUA9AiwX2aqnlTCxKHvG449PcOwgBTitkecfZhZkaLJF4HHK8JfMirvBGIrE
	 dks+i6om28Lg1+R2KL3OI2eGsq5w3SkSasT6i6MzaWYVufBwcKVsNhIIUzyKhslWw2Qs7
	 TpW8J5Bc8G/OmzKClP8GfcsXweCgXcTqlVoKhk778T8ZVAal4iv39byVwd40qL7RkTtRE
	 G9JAR14NZDEnEayrGjnd3JBYFyotkfNDBppAZ/1yZuOx22IWjHrOdCkMj5ut0HEBeCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yWi1LMZo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4ffttTbU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yWi1LMZo;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4ffttTbU;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B793F606A31B;
	Fri, 23 Oct 2026 13:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B793F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yWi1LMZo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4ffttTbU;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yWi1LMZo;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4ffttTbU
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1F2311F458;
	Fri, 23 Oct 2026 13:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KL4o6xEzOAIte/25jp2EZ0upQXc2dTr/6KgTHFEVLJQ=;
	b=yWi1LMZoAt7P/DXw5Z/5oDY9qNBjiDScsdGWc+P0Zqt0L4iqRbwSzr8Yaom1dnE7lB6oYi
	v2obGghemmzg1htYagOopC6SkH3zVvLQ+7f2tYPtshYEeh3VqRkHzVWDJTj1vlUwVJlGo+
	0FF0rOcbVXfdumnlrzBCnGBvlDjTKBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762428;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KL4o6xEzOAIte/25jp2EZ0upQXc2dTr/6KgTHFEVLJQ=;
	b=4ffttTbUkcMP4aBGzHi/EsOBVNktwUQA7UM/CdlB6Q0emjyfE/H/vBcKACkQnwSEFPtJnG
	cxgGbIBzhCcuBVBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KL4o6xEzOAIte/25jp2EZ0upQXc2dTr/6KgTHFEVLJQ=;
	b=yWi1LMZoAt7P/DXw5Z/5oDY9qNBjiDScsdGWc+P0Zqt0L4iqRbwSzr8Yaom1dnE7lB6oYi
	v2obGghemmzg1htYagOopC6SkH3zVvLQ+7f2tYPtshYEeh3VqRkHzVWDJTj1vlUwVJlGo+
	0FF0rOcbVXfdumnlrzBCnGBvlDjTKBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762428;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KL4o6xEzOAIte/25jp2EZ0upQXc2dTr/6KgTHFEVLJQ=;
	b=4ffttTbUkcMP4aBGzHi/EsOBVNktwUQA7UM/CdlB6Q0emjyfE/H/vBcKACkQnwSEFPtJnG
	cxgGbIBzhCcuBVBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B2559133F6;
	Fri, 23 Oct 2026 13:33:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5fgDIjti22pDTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Oct 2026 13:33:47 +0000
Date: Fri, 23 Oct 2026 15:33:47 +0200
Message-ID: <87ik2sa6dg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <blum@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Baul Lee <baul.lee@xbow.com>,
	Qingyu Zhang <usupergate@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ump: Use safe_append_string() in snd_ump_update_group_attrs()
In-Reply-To: <20261022082247.1682-2-blum@kernel.org>
References: <20261022082247.1682-2-blum@kernel.org>
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
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,xbow.com,gmail.com,suse.de,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 22 Oct 2026 10:22:47 +0200,
Thorsten Blum wrote:
> 
> To prepare for removing strlcat() from the kernel [1], use the existing
> safe_append_string() helper to append the group name separator.
> 
> No functional change.
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Applied now.  Thanks.


Takashi
