Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793462565;
	b=Jgw/ElwfpCJBlqnNsw979ww1SMSYxdoOe4Ik+by4UeGtB5ooq8MK7UKZJoT9cq8LtFiO
	 UcXLFsqmPN3dQ0dkYX7eex1lk/3n0db46qm6NbnQN3M0n9YKpJD7IbGbSsT8vwH9V6UHY
	 MQ/rDFsvJlFzc8tk6Vwt7DGAbRPy7RZNZ4GqbD5XDnqX3Ms1sXfWWW8EyyhkklElDqzxO
	 +rwYvGPGkKP24k/PJyakxaJ3Lftffk0HdyObUAyHB6Lqdc5B22Eb/xq3/nEdKRhLndkqg
	 2U4A9luBNbnvywwuQRoKh5+oqtLInyj+VHg25bSmFjmWBmcVaXnIJrWIMtjeB9lzU8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793462565;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=AhVnczUGqYKssZE10voDAppJ5/gCgBmXEG3euk3yX50=;
	b=SEYEtQhd8H1jM1kdbcoz49MJSRIfnqfWJ3hlsHeTiyCuh1yYjPxK5uPvFvRDrK6mMI8v
	 NpEfD1ZWdR8Wa33DoBiHdibRjISvtJ6+yPky+lYqCxvuh5+y++51Juh4hdOxQn5wb0O0H
	 FUxV+QJkmTCwoR/meMIFvE7s/k/R0e+MDaiqzPyq3K4YKgG+yOA/05/cIDKp3Hnf2ty6j
	 BIvD9tGZJf9rNf7Poei4V9GYSPtYJTjXD2q0/bfy/8+EbT2j6H7BO1ooBlMK66inJJ/fo
	 SgCH7C3/WiDL9a7Z76Xta9ogtcuDlVH68pjjv9xaLenSYdf7PHuD4KsbyT6aCV1mMcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aJe8V5Zp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tXmZ9CPN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aJe8V5Zp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tXmZ9CPN;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7E4606A31C;
	Sat, 31 Oct 2026 16:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F7E4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aJe8V5Zp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tXmZ9CPN;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aJe8V5Zp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tXmZ9CPN
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7F0111F43B;
	Sat, 31 Oct 2026 16:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793462562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AhVnczUGqYKssZE10voDAppJ5/gCgBmXEG3euk3yX50=;
	b=aJe8V5ZpQ0sKSfRpw3z0SBJBRL0orsQjPXIihlGTsx80M2fSKmTegGjOf9i0PJ+oA1lWQ2
	wjTqHjB4VJdsaKagor0qioudcEp49wS33PW5f9xHa8WpHK2WWbQLSgmkZbwBgSNjHZ1ESA
	c+J/0b9Ibb5nvmaxS/iB3sVLDt52WQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793462562;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AhVnczUGqYKssZE10voDAppJ5/gCgBmXEG3euk3yX50=;
	b=tXmZ9CPNk4Sp0wRfn6s0kV9lBoYpC+YFlKH7OijUItw2uOCCMgC+FGWraZO5gR822wFyKN
	3zSfDDwVGPvAkGAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aJe8V5Zp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tXmZ9CPN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793462562; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AhVnczUGqYKssZE10voDAppJ5/gCgBmXEG3euk3yX50=;
	b=aJe8V5ZpQ0sKSfRpw3z0SBJBRL0orsQjPXIihlGTsx80M2fSKmTegGjOf9i0PJ+oA1lWQ2
	wjTqHjB4VJdsaKagor0qioudcEp49wS33PW5f9xHa8WpHK2WWbQLSgmkZbwBgSNjHZ1ESA
	c+J/0b9Ibb5nvmaxS/iB3sVLDt52WQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793462562;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AhVnczUGqYKssZE10voDAppJ5/gCgBmXEG3euk3yX50=;
	b=tXmZ9CPNk4Sp0wRfn6s0kV9lBoYpC+YFlKH7OijUItw2uOCCMgC+FGWraZO5gR822wFyKN
	3zSfDDwVGPvAkGAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2CB5F13432;
	Sat, 31 Oct 2026 16:02:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3eGXASIR5mpPLwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 16:02:42 +0000
Date: Sat, 31 Oct 2026 17:02:41 +0100
Message-ID: <87y0bdrh7i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marco Giunta <marco_giunta@outlook.it>
Cc: Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ALSA: hda: aw88399: use auto-cleanup for ACPI subsystem ID string
In-Reply-To: <SN6PR19MB23035A048BCAF108507B59D0FC6E2@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB23035A048BCAF108507B59D0FC6E2@SN6PR19MB2303.namprd19.prod.outlook.com>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_TO(0.00)[outlook.it];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.it];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,kernel.org,perex.cz,gmail.com,vger.kernel.org];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 7F0111F43B

On Thu, 29 Oct 2026 11:51:57 +0100,
Marco Giunta wrote:
> 
> Use scope-based cleanup for the string returned by acpi_get_subsystem_id()
> instead of freeing it manually, consistent with the other cleanup
> annotations in aw88399_hda_acpi_probe() and aw88399_hda_init().
> 
> This is just a code cleanup, with no functional changes intended.
> 
> Signed-off-by: Marco Giunta <marco_giunta@outlook.it>
> ---
> Hi Takashi & Mark,
> 
> This series contains some trivial cleanups that should (hopefully) improve
> the overall code quality. These patches are the result of me re-reviewing
> the driver code during the development of the recent firmware path change
> series.
> 
> I appreciate that it's likely too late to get these into 7.4.
> Apologies for not sending them earlier, I have been quite busy these past
> few weeks.
> 
> Note: for simplicity, I based everything on Takashi's tree, but if
> preferred I can resend patch 3 separately rebased on Mark's.

Applied all three patches now.  thanks.


Takashi
