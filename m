Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BB94CF47C;
	Sun, 18 Oct 2026 08:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792312430; cv=none; b=gGYl2zAdKv70uZn8zlDfE8OJMwvkxaEMrxfDlSAZ7wK5uR6BuSxl/2xH3yWw/rnLQ+31QiHK7Q4mcAP3eOWH9oEY6es5hvlDRLvbhuD3K8zGMGj26mU+P8vif/uCxI/9imk9btM3Yl/Qpu/33BFvJ6mYWP4kqvtnmLkoZLqkkGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792312430; c=relaxed/simple;
	bh=2I/Rf1HKZQt3s7dwwGFp/tMeLtOVw8z+JO3DuhIT8PI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZhljCzqjyTGiK0qi1p/8XS0xGG+A2EJGeJoXYPs42ustW2XPwih0p0FrovNV/gxVZpMQ5RZGyrKgi5t1jQvv8NSZP+D+1rRImTRTZhDmqqQ1wlQPjJU/3ucwlzIGi5MGy+K+UI8b8X8yc9bwelb+vMS8876CmgW4RR8CIIDPtCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SWqazx7n; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JugsGYa6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SWqazx7n; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JugsGYa6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SWqazx7n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JugsGYa6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SWqazx7n";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JugsGYa6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BBF9221CCD;
	Sun, 18 Oct 2026 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792312426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zIfND5ox+slI8KcSKaDl9XOUKtQx9XxUwqsirW9HZWw=;
	b=SWqazx7n3CiAZYMjYjoyT7C8jWP7pClbfACENYUIw4rd2I6kg4dMoDlyu96pFco+smTliS
	5atnQNx8x4tCYObeO1ranQRA+qn3pOEi+eXABlq2h4L5bu6asXyM14We6eXQ+ROpuhcxZn
	AT5URhEb6dyvBi7T+MwlUORHqWyy3SQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792312426;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zIfND5ox+slI8KcSKaDl9XOUKtQx9XxUwqsirW9HZWw=;
	b=JugsGYa63+Cd9dxd5hebOqjwCj7Yac14hyRv9vtiJPV2BjCQvs13YHqMT1RQeB04FZdEsu
	4lGBD3AL/76SRmCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792312426; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zIfND5ox+slI8KcSKaDl9XOUKtQx9XxUwqsirW9HZWw=;
	b=SWqazx7n3CiAZYMjYjoyT7C8jWP7pClbfACENYUIw4rd2I6kg4dMoDlyu96pFco+smTliS
	5atnQNx8x4tCYObeO1ranQRA+qn3pOEi+eXABlq2h4L5bu6asXyM14We6eXQ+ROpuhcxZn
	AT5URhEb6dyvBi7T+MwlUORHqWyy3SQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792312426;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zIfND5ox+slI8KcSKaDl9XOUKtQx9XxUwqsirW9HZWw=;
	b=JugsGYa63+Cd9dxd5hebOqjwCj7Yac14hyRv9vtiJPV2BjCQvs13YHqMT1RQeB04FZdEsu
	4lGBD3AL/76SRmCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C8E4132D3;
	Sun, 18 Oct 2026 08:33:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2O45EWqE1GozRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 18 Oct 2026 08:33:46 +0000
Date: Sun, 18 Oct 2026 10:33:45 +0200
Message-ID: <874iej1k7q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Vasiliy Kovalev <kovalev@altlinux.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Maksimov <nickstogramm@yandex.ru>
Subject: Re: [PATCH] ALSA: hda/via: Apply runtime PM workaround for ASUS X55A
In-Reply-To: <20261017101257.215166-1-kovalev@altlinux.org>
References: <20261017101257.215166-1-kovalev@altlinux.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[yandex.ru];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,vger.kernel.org,yandex.ru];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sat, 17 Oct 2026 12:12:57 +0200,
Vasiliy Kovalev wrote:
> 
> ASUS X55A requires the same workaround like other machines with
> VT1802, otherwise it loses the codec power on a few nodes and the
> sound stays silent.
> 
> Fixes: a0645daf1610 ("ALSA: HDA: Early Forbid of runtime PM")
> Link: https://bugzilla.altlinux.org/45606
> Cc: <stable@vger.kernel.org>
> Tested-by: Nikita Maksimov <nickstogramm@yandex.ru>
> Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>

The addition of a quirk is OK, but is Fixes tag really pointing to the
culprit?  The commit is for forbidding the runtime PM, and I see no
clear reason how this commit breaks.


thanks,

Takashi

> ---
>  sound/hda/codecs/via.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/via.c b/sound/hda/codecs/via.c
> index 807312cffd35..0641fc14b346 100644
> --- a/sound/hda/codecs/via.c
> +++ b/sound/hda/codecs/via.c
> @@ -933,6 +933,7 @@ static const struct hda_fixup via_fixups[] = {
>  static const struct hda_quirk vt2002p_fixups[] = {
>  	SND_PCI_QUIRK(0x1043, 0x13f7, "Asus B23E", VIA_FIXUP_POWER_SAVE),
>  	SND_PCI_QUIRK(0x1043, 0x1487, "Asus G75", VIA_FIXUP_ASUS_G75),
> +	SND_PCI_QUIRK(0x1043, 0x1c33, "Asus X55A", VIA_FIXUP_POWER_SAVE),
>  	SND_PCI_QUIRK(0x1043, 0x8532, "Asus X202E", VIA_FIXUP_INTMIC_BOOST),
>  	SND_PCI_QUIRK_VENDOR(0x1558, "Clevo", VIA_FIXUP_POWER_SAVE),
>  	{}
> -- 
> 2.50.1
> 
