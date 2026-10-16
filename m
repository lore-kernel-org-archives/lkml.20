Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8424D9F69;
	Fri, 16 Oct 2026 14:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160184; cv=none; b=AnykgFogK6sZ60UzGmpFHx2KAbFYD70Ti1vrGc4e8a7I7bo2cDr8DQ6y2+hKXXxPMnSH7N0+c8/s7rn1Lb15cF6rqSsqNQrUlUwttVrnoYiD2sc4k3oCMf87dLzI3p3A/xDbP+LAewrgBLQTccCSTsfp4Aw58y1k9gBmHHDLV48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160184; c=relaxed/simple;
	bh=OyxBcEjtPs6DLKLa2OuIVYahLlFdqMCkKR8/VwBA7gw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jg1VO3IuHqa2tP17d0TPcqN9l8jcZKyS40kXp/JfH++pdKO0LCCGBKOjG/yaujjSvYjPtfietn4jLBPqrInwlnLVQfW37i39dU8jH9XLIvxA3YKIRRKZUdNJpC4SE54IYSR31tktWlboE8NljqpOSEkW5SDidYXH0K8kPO71YrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Asb2qjWs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eCk9u4Bw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Asb2qjWs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eCk9u4Bw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Asb2qjWs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eCk9u4Bw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Asb2qjWs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eCk9u4Bw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3EEAC1F385;
	Fri, 16 Oct 2026 14:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792160177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LWxpqNzZIEQ0WFtCKfWjRTGsr/OLdS9s3M9UqgLWM4w=;
	b=Asb2qjWsldM5rTdB/T3nGEU36tWOsPn31TNLDu1qpUR9xa2ooaLN+OWU2cThAIvjEd8eEz
	bgWBeY3wufK/tDf/W3LZQSlRyFA3Jr9yVL+5PTGC+vw4drZn/l8kYPiwjkKqtzV5GZQV4Y
	FLM00kfjd573cJKPbCOX84P+qoaZV2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792160177;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LWxpqNzZIEQ0WFtCKfWjRTGsr/OLdS9s3M9UqgLWM4w=;
	b=eCk9u4Bw6NJejDmKBqX17Jdkht731gYI8SqYqugVBC/0q2NB8Z6JEB7hI/8sEbKYIHQd+x
	iZjLx1+GDFkcrYCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792160177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LWxpqNzZIEQ0WFtCKfWjRTGsr/OLdS9s3M9UqgLWM4w=;
	b=Asb2qjWsldM5rTdB/T3nGEU36tWOsPn31TNLDu1qpUR9xa2ooaLN+OWU2cThAIvjEd8eEz
	bgWBeY3wufK/tDf/W3LZQSlRyFA3Jr9yVL+5PTGC+vw4drZn/l8kYPiwjkKqtzV5GZQV4Y
	FLM00kfjd573cJKPbCOX84P+qoaZV2o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792160177;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LWxpqNzZIEQ0WFtCKfWjRTGsr/OLdS9s3M9UqgLWM4w=;
	b=eCk9u4Bw6NJejDmKBqX17Jdkht731gYI8SqYqugVBC/0q2NB8Z6JEB7hI/8sEbKYIHQd+x
	iZjLx1+GDFkcrYCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D6B1F1339F;
	Fri, 16 Oct 2026 14:16:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LXT5KrAx0mq9EQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Oct 2026 14:16:16 +0000
Date: Fri, 16 Oct 2026 16:16:16 +0200
Message-ID: <87a4od3f4f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jon Harrison <jonerickharrison@gmail.com>
Cc: skbotnl@disroot.org,
	david.rhodes@cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	perex@perex.cz,
	rf@opensource.cirrus.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: hda: cs35l41: Support HP OmniBook 7 Laptop 16-bh0xxx
In-Reply-To: <CAEG=48+jRv7wHgd-yPTHEf9YFO++XusKQgT+WJz60hgCE8pGww@mail.gmail.com>
References: <CAEG=48+jRv7wHgd-yPTHEf9YFO++XusKQgT+WJz60hgCE8pGww@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Fri, 16 Oct 2026 00:15:24 +0200,
Jon Harrison wrote:
> 
> On Mon, 24 Aug 2026, Stefan Binding wrote:
> > We are currently awaiting confirmation of the correct settings before we do
> > so.
> 
> I have another HP OmniBook 7 Laptop 16-bh0xxx, SKU D2KR6UA#ABA,
> BIOS F.12, subsystem 103c:8e60, running Linux 7.2.5. Both CS35L41
> amplifiers still fail to probe:
> 
>   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Failed property
> cirrus,dev-index: -22
>   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: error -EINVAL: Platform
> not supported
> 
> The speakers only play through the Realtek fallback and are very quiet.
> Has that settings confirmation arrived, and is there an expected time
> for the quirk?

OK, we've waited enough long, so I take the patch to for-next branch
now (for 7.4-rc1).

If this is really breaking something, let me know.  We'll fix up again
before 7.4 release.


thanks,

Takashi
