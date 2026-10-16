Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D535C34388D;
	Fri, 16 Oct 2026 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160404; cv=none; b=LVDfdtVxMpStT56LrAT9G+gWJKAa7qi2KjE9hP7II3yM/EzxIPEXz75Qix2i7WPUlO8Psj26Z8CpXmDb4bXRKyrrbl3nALGe8FEKUDzcmnf2qjSBzZyCNKaYj/uM6diw5+ojZcgpFlr2YXG0MxgcIBhSKw32Q5Er1nQv10ZyUG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160404; c=relaxed/simple;
	bh=iqNBBJIlVjt4caCTbNHs1e+BYgx5oZ6XFn2kqTGUyRA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wxz9BjtkfbY7OssUkTahTHVuG61nS/uQFPsyXEJ2+ol0RszgYzDdrM95XJDsEx7O2YEkQWlQd5eakMZBYGPlHIqeh7Zkdqs9EB3pUxb1i+hvMTvdnKzMfU1IMmoa02mIy0MVgAFIot3NiHgGXIivsNgl0yjo0HZd0Xv+XiOWrVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O9zrLUL2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3JIp4AQp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gXlWOB0U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Z+Fl/Gx1; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O9zrLUL2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3JIp4AQp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gXlWOB0U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z+Fl/Gx1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CE79B21C42;
	Fri, 16 Oct 2026 14:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792160401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwQlgmeU4ZA2UJ4lAP9mbLBESGN/5Miy+QpPsG3hxqk=;
	b=O9zrLUL2WxwNdt6mRtSBLUuehw2OGKmPiHdIop5XZUESl1YDGeBOxr5gCgDVABMCClqYYf
	psqYMhkgYWgyDf9IQrklR5hq+4VM3+IvSwT4JMD1lbOzKonvhaHGBOJsQhgM4zGvnTFDRH
	8gMhS/xhpTMLHVZ8TXHg3wnzMlPnvFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792160401;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwQlgmeU4ZA2UJ4lAP9mbLBESGN/5Miy+QpPsG3hxqk=;
	b=3JIp4AQpmBmPhxSqW4Gk74ykHj+K3cBBDJw9UI1mj0AFdOmxyozjtPZwWe1pulM6ybMEh4
	pbD27/8V9b4klfBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792160400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwQlgmeU4ZA2UJ4lAP9mbLBESGN/5Miy+QpPsG3hxqk=;
	b=gXlWOB0ULhUBbR9XjRDoR/iuNCTDNoyPHs7Q6lHs7aTEwe3N/ajfh5sS2XMgtKvjrrjjoG
	M/Z4K72yGMBL/5B8VB5oJn6p6h3eBbLWYj2Xk5d/+F02uYNHACQxTbFvWPIXpQKlOtBc4w
	4q2BGmM4uTMhjSt3rRfx+6WvOxG2F2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792160400;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwQlgmeU4ZA2UJ4lAP9mbLBESGN/5Miy+QpPsG3hxqk=;
	b=Z+Fl/Gx11TkUbveQ4RkOWQLEIlBG/wX6NQH6lpm6QSinoSnhx+F7+DMObNgAI/QeZojVD/
	B0Yzfl5X5S3UFyBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7DAF71378C;
	Fri, 16 Oct 2026 14:20:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cXkyFZAy0mqeFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Oct 2026 14:20:00 +0000
Date: Fri, 16 Oct 2026 16:20:00 +0200
Message-ID: <878q3x3ey7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	lethiebaut2@gmail.com
Subject: Re: [PATCH] ALSA: hda: cs35l41: Add support for HP OmniBook 7 14-hg0xxx
In-Reply-To: <20261016130219.690074-1-zhangheng@kylinos.cn>
References: <20261016130219.690074-1-zhangheng@kylinos.cn>
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
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.com,vger.kernel.org,opensource.cirrus.com,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,kylinos.cn:email]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 16 Oct 2026 15:02:19 +0200,
Zhang Heng wrote:
> 
> The HP OmniBook 7 14-hg0xxx (SSID 103C8F07) uses two CS35L41
> amplifiers connected via I2C. The left speaker works, but the right
> speaker is silent because the cs35l41-hda driver fails to probe with
> -EINVAL:
> 
>   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: Failed property cirrus,dev-index: -22
>   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: error -EINVAL: Platform not supported
>   cs35l41-hda i2c-CSC3551:00-cs35l41-hda.0: probe with driver cs35l41-hda failed with error -22
> 
> Add the missing SSID entry to the CS35L41 configuration and property
> tables, using the generic DSD configuration and the same parameters as
> other HP laptops (e.g. 103C8CDE). This allows both amplifiers to probe
> and restores the right speaker.
> 
> Tested on HP OmniBook 7 14-hg0xxx (SSID 103C8F07).
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222124
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied to for-next branch now.  Thanks.


Takashi
