Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8732E286D5D;
	Thu, 15 Oct 2026 07:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048686; cv=none; b=ozH0AeOT7ot3of2tHpKoHNglslCmjJXDtYbKgVLDmymmA7Tt2lT1n/qsW3L1uUws7t2/jig8R7vlDDgNY/MQaLtqhJy3Tee4Z025KRcpsnp9mKMedXA1Z9bJYzBh32Vksq8jvXhSqbO02ZTwDsVzq0QefTyyjZ+d4l7MByVSrZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048686; c=relaxed/simple;
	bh=kEX4WS5AhK704RBTjHunhol0ktc4geR9ykQTqOkL08w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pd8m383CYmlRmB7eYkDQhcWm29Nk4aHwpdYJcv0UQskpPTjRWVdfXyvuKI3BZ7F347F7Mt40WF2NACPimF00PQ51T/3fEz6rXv91upYLzCKeeEQBenDJWP1tD1eZH8LMElUQMIvgAUPC444JaVCplveYb2mEbl8w6J9Sh3zK+AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O//0JZvU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yFOiIn79; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O//0JZvU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yFOiIn79; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O//0JZvU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yFOiIn79";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O//0JZvU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yFOiIn79"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2045A1F388;
	Thu, 15 Oct 2026 07:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792048674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=28MamruUpDWAswKRcebQJD0B63xIJPwNyFHIc6Zc5wQ=;
	b=O//0JZvUHebt43ls++hc3KH+GisbB6OYPxMCTOm5kpePCd7szXg1tURRT1Om9Ro8/fPRfX
	0OXhX6ACUu/YlcEewY7+OHpvg9NGO12+e2czo10/0SS1pxmk8UtS1eK1sHjwsiDOjfb8mN
	cTIy/G0BMGfUpvZMRdz1bCzM2vsF0U4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792048674;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=28MamruUpDWAswKRcebQJD0B63xIJPwNyFHIc6Zc5wQ=;
	b=yFOiIn79cGfNmi8A5HLhcVoj5vapk9EATzYdYC8J1hf44aqtPv+i/WDdKLx70qkGJNuNe2
	s/56zB3Zm8p54UCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792048674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=28MamruUpDWAswKRcebQJD0B63xIJPwNyFHIc6Zc5wQ=;
	b=O//0JZvUHebt43ls++hc3KH+GisbB6OYPxMCTOm5kpePCd7szXg1tURRT1Om9Ro8/fPRfX
	0OXhX6ACUu/YlcEewY7+OHpvg9NGO12+e2czo10/0SS1pxmk8UtS1eK1sHjwsiDOjfb8mN
	cTIy/G0BMGfUpvZMRdz1bCzM2vsF0U4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792048674;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=28MamruUpDWAswKRcebQJD0B63xIJPwNyFHIc6Zc5wQ=;
	b=yFOiIn79cGfNmi8A5HLhcVoj5vapk9EATzYdYC8J1hf44aqtPv+i/WDdKLx70qkGJNuNe2
	s/56zB3Zm8p54UCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C23D1373D;
	Thu, 15 Oct 2026 07:17:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9IovECF+0Gr+NQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 Oct 2026 07:17:53 +0000
Date: Thu, 15 Oct 2026 09:17:52 +0200
Message-ID: <87qzhrmnz3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	perex@perex.cz,
	tiwai@suse.com,
	phucduc.bui@gmail.com,
	cezary.rojewski@intel.com,
	cassiogabrielcontato@gmail.com,
	kees+treewide@kernel.org,
	yilinzhang@moonshot.ai,
	sammiee5311@gmail.com,
	kees@kernel.org,
	thomas.weissschuh@linutronix.de,
	tglx@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH v2] ALSA: pcm: Unlink substreams before releasing them
In-Reply-To: <CAFRLqsX6Yz2dv_dV4BvV6_F-16WDWYTAk5ikC9WY7ZySkoJKUQ@mail.gmail.com>
References: <pm-pmb-9c80f858ccc13b3de84d-v7-fcd8c7aa0e837bf0b036@gmail.com>
	<87zewgcuhy.wl-tiwai@suse.de>
	<CAFRLqsX6Yz2dv_dV4BvV6_F-16WDWYTAk5ikC9WY7ZySkoJKUQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[treewide];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,gmail.com,intel.com,kernel.org,moonshot.ai,linutronix.de,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]

On Thu, 15 Oct 2026 04:07:10 +0200,
Cen Zhang wrote:
> 
> Hi Takashi,
> 
> >
> > Applied to for-next branch now.
> >
> > A problem with racy link removal Sashiko suggested is an interesting
> > case to be revisited, but it's no regression and can be triggered
> > independently from this change.
> >
> >
> > Takashi
> 
> I saw that. The drain/unlink case looks like a real concurrency issue.
> I'll try to
> address it with a separate patch.

The patch I submitted yesterday is such an attempt:
  https://lore.kernel.org/20261014141212.316223-1-tiwai@suse.de

Unfortunately it couldn't be reviewed by Sashiko, as it's based on my
latest tree.  And now I noticed that there is still a potential race,
and fixed now.  Will resubmit v2 patch.


thanks,

Takashi
