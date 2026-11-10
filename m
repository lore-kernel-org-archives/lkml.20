Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794306467;
	b=u/M03B4HKtYoDGRys/T0uru5CGhLG7j5Qb0K4BVnbjL4DAJCjUQPmF4vxlZfO+ttILnQ
	 xs51qtTkRhyXMVPwYZzukPAvOfjnFzWfJo0SwhPWlgRITk4ufFTuZJcqlMueCe9b029zo
	 8fq1k+XNzPp+54QCralMkg9pAr0nT8VEQAsGDa87yyzmfupS1AWycZzCccZlwWkCozjjs
	 rclUc/s7lxG2gb8ngt65mIiJCc38pnUDEJ/arHHf769NIydaz2rV2bYCtBCvvOWKjvIWK
	 m7qM7H4U1rGK/MmzXHn7zCNE2T9Z2HaKnxHI6uqxu+R1p8IagZBYLddjbszbvNLaByQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306467;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=TCc4V/L2P6UjCCK1GR1LVjIGB2BZY7iLpT/Bq6XIgZk=;
	b=xcZBJ9Bm6ONttv+tLZLsQSLNondN30OEdvEteHiK2iiRdX/1n6IYY7bru6uYPB64GSqh
	 bcBjHYyUm0kabp8HG2CN3Ngu7wumbc8vyEGvnmkL1ZFGu7rQsL2dIq0m5wcBNX5tNWYq7
	 VH2vEZge0bsjcq6jDXx9g7hlBqNZeLYC4IbGTgcsK6DPz/nJ+UJ1taChNsRR9IS2FoVOr
	 wVl8R6r3aFr8haETn93nuvKH+MFQ30Vd/wryfwYECm2+GBnI50s2aZ5xLVT7I1oPhHBU3
	 KJd0E6C7d2+8v5Wh3Vb06AN9nYqh0HafTfcU187dZotrn/zw65NnGgOAwuh5uAKKxPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LCUzBzzy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VHrvle2g;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LCUzBzzy;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VHrvle2g;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C99C606A321;
	Tue, 10 Nov 2026 10:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C99C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LCUzBzzy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VHrvle2g;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=LCUzBzzy;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VHrvle2g
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5D2A61F7BE;
	Tue, 10 Nov 2026 10:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794306465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TCc4V/L2P6UjCCK1GR1LVjIGB2BZY7iLpT/Bq6XIgZk=;
	b=LCUzBzzytejC4+Tq04FwJmAt9TT6yrc72QrnGnLvyzLRMbTInlyidZhXS2jDUMHvTh9A6E
	w+owwft0CYxORUzNkR8WVrbkocqBKbPPiXYQyYcNg8L2jDZZ1LP2Xu2gOFE3m8oezHGdPy
	TedtQCXfg3NH/q714YQODxmwCVhamdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794306465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TCc4V/L2P6UjCCK1GR1LVjIGB2BZY7iLpT/Bq6XIgZk=;
	b=VHrvle2gzNMcqHh2anztYMMckYOx2Nibne04AYq/Eeoh1QTXRFFewNp9DyLfPoj1jw4e6M
	79d4W8IUfSyZ4TBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794306465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TCc4V/L2P6UjCCK1GR1LVjIGB2BZY7iLpT/Bq6XIgZk=;
	b=LCUzBzzytejC4+Tq04FwJmAt9TT6yrc72QrnGnLvyzLRMbTInlyidZhXS2jDUMHvTh9A6E
	w+owwft0CYxORUzNkR8WVrbkocqBKbPPiXYQyYcNg8L2jDZZ1LP2Xu2gOFE3m8oezHGdPy
	TedtQCXfg3NH/q714YQODxmwCVhamdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794306465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TCc4V/L2P6UjCCK1GR1LVjIGB2BZY7iLpT/Bq6XIgZk=;
	b=VHrvle2gzNMcqHh2anztYMMckYOx2Nibne04AYq/Eeoh1QTXRFFewNp9DyLfPoj1jw4e6M
	79d4W8IUfSyZ4TBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 256FC1339F;
	Tue, 10 Nov 2026 10:27:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yubUOqDx8mrfKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Nov 2026 10:27:45 +0000
Date: Tue, 10 Nov 2026 11:27:40 +0100
Message-ID: <871p8tvv4z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: Re: [PATCH v5] ALSA: control: Fix parsing of numeric fields
In-Reply-To: <20261109163531.2639-1-sreekuttan2156239@gmail.com>
References: <20261108124832.3058-1-sreekuttan2156239@gmail.com>
	<20261109163531.2639-1-sreekuttan2156239@gmail.com>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Mon, 09 Nov 2026 17:35:31 +0100,
Sreeraj S Kurup wrote:
> 
> parse_uint() passes the remaining input string to kstrtoull().
> 
> When the input contains comma-separated fields, the string
> contains both the numeric value and the following fields.
> 
> For example, with:
> 
> device=1,subdevice=0,name=Master
> 
> kstrtoull() receives "1,subdevice=0,name=Master" and fails
> to parse the numeric value.
> 
> Stop parsing at the next comma and pass only the numeric
> field to kstrtouint().
> 
> Make all parse_*() functions return the end of the current
> substring, leaving delimiter handling to set_led_id().
> Temporarily terminate the numeric substring in parse_uint()
> before calling kstrtouint().
> 
> This allows numeric fields to be parsed correctly in
> comma-separated input.
> 
> Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
