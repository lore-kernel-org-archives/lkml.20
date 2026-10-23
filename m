Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762927;
	b=g6/m9wKclC58uA2VZozPyKfAeXutPvRwzNQU+tdTFi8Y7H+gTCQzBd0FosNr4K/8MgoU
	 hs4ByQIMpA2c39hLE/7fb6kW1AVzKlT8F/vCwDd0RDuR28txTtQQ+rqAIa9yK7JKSHXyM
	 pDGnIRDXVn4fmphkkfdh+2vwRAfXPKlQPJ1IcRS8/uUhFKXeEqZO12CUuxky0jx0stQxb
	 Z1seiZ5XsYQyT4PzB/nXXtQ7qRE9geTCQMcEMC5Yauv1KCHSnQyn0UVfeW7XLib7zKz7/
	 MXCsI1ADie6egR4sJk2AQ7ad+rZ6iaaCMeL6CHNM73yxO9dx95XM+auJGiAagkXLV9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762927;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=T7GiE8r883A1bjSZPW19TkKHAWvS3v3qo99XrDSJMKI=;
	b=sZWb78yTBAKINPHrqE656QcSgvVUDshHQE0ajW0/EWWZTKiWhcRv5Oh5drOK3CW3UfpZ
	 AJnpZlxRGYoVJrMs/9Rh6E+hOG5Hekv4JVvzy1GUGT1rG2k/Pg+uCnv93b09ZazIu7VwP
	 I9BkIOnBlkygOse9Ioa9MKqyXlL0CIpMLtuVxLD+uRwVBUonE+xwB70Qnl03jcUB3rJTT
	 UhbNQqI5n0FA/lLKwT+umPuV5DcAOlS7PEQIC61JgObe+FxdC0Du8T2zXFXFPXVwxfdL4
	 2P9jVWL8o218bR8cRzeC58jG0OmKxA8bevC6Gl5Ym/KCnoICu8O0q1LjXATCOGX63oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="Y6C4E9O/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f0NZtx7u;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="Y6C4E9O/";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f0NZtx7u;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9676606A320;
	Fri, 23 Oct 2026 13:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9676606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Y6C4E9O/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f0NZtx7u;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Y6C4E9O/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f0NZtx7u
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0E9361F391;
	Fri, 23 Oct 2026 13:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T7GiE8r883A1bjSZPW19TkKHAWvS3v3qo99XrDSJMKI=;
	b=Y6C4E9O/0uW2JHHejYeKRjKr1m5YSsebuXbtHXxKGvwSHw8OKnfkrNFCub5L81qmanSIbp
	uiK2ERu/UxEbDJ/r+da/Ty+m2Srn5O2trxiz2wLJEus2/KiUlJFfKc310zTZjDh6tYCM6c
	am3nZ1k17fPH3q141c7C7YoH4C7kBYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762925;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T7GiE8r883A1bjSZPW19TkKHAWvS3v3qo99XrDSJMKI=;
	b=f0NZtx7u0dxj40kzX/gu4EG1H6eUfkhkjdMUIgVFbtddVn5OgVQiNH5btmyLNWC74D+2FF
	n3CZM98N6ry5+PBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Y6C4E9O/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=f0NZtx7u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792762925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T7GiE8r883A1bjSZPW19TkKHAWvS3v3qo99XrDSJMKI=;
	b=Y6C4E9O/0uW2JHHejYeKRjKr1m5YSsebuXbtHXxKGvwSHw8OKnfkrNFCub5L81qmanSIbp
	uiK2ERu/UxEbDJ/r+da/Ty+m2Srn5O2trxiz2wLJEus2/KiUlJFfKc310zTZjDh6tYCM6c
	am3nZ1k17fPH3q141c7C7YoH4C7kBYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792762925;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T7GiE8r883A1bjSZPW19TkKHAWvS3v3qo99XrDSJMKI=;
	b=f0NZtx7u0dxj40kzX/gu4EG1H6eUfkhkjdMUIgVFbtddVn5OgVQiNH5btmyLNWC74D+2FF
	n3CZM98N6ry5+PBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B887E133F6;
	Fri, 23 Oct 2026 13:42:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ifrgIyxk22qlVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Oct 2026 13:42:04 +0000
Date: Fri, 23 Oct 2026 15:42:04 +0200
Message-ID: <878q3oa5zn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andrey Zakharov <dedemorow@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: emu10k1: Pass destination size to copy_string()
In-Reply-To: <20261023105027.53135-1-dedemorow@gmail.com>
References: <20261023105027.53135-1-dedemorow@gmail.com>
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
X-Rspamd-Queue-Id: 0E9361F391
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.51

On Fri, 23 Oct 2026 12:50:27 +0200,
Andrey Zakharov wrote:
> 
> copy_string() copies the bus and input/output names into fixed-size
> arrays of struct snd_emu10k1_fx8010_info using strcpy() and sprintf(),
> and it has no information about the size of the destination buffer.
> 
> All source strings are static and shorter than the 32-byte destination
> arrays (the longest one is 20 characters), so this is safe today, but the
> safety should not depend on the contents of the name tables. The earlier
> strcpy() to strscpy() conversions skipped this function because dst is a
> plain pointer.
> 
> Pass the destination size to copy_string() and use strscpy() and
> snprintf() instead.
> 
> No functional changes intended.
> 
> Testing: compile-tested only with clang (W=1) and sparse (C=1). The
> function is reached only through the SNDRV_EMU10K1_IOCTL_INFO ioctl of
> the EMU10K1 hardware, which is not available under QEMU.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Andrey Zakharov <dedemorow@gmail.com>

Applied now.  Thanks.


Takashi
