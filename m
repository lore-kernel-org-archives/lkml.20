Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794134698;
	b=XaUB29aY5WoyopxDmGLAl512G6/78ztNnE9CgcLobP2yVSHbLa0brvD1GTi+M1GW5cjc
	 dQ4mdKEhbrUmNcCUbRk7d7BLVKl8NYE2mPsTuqSOv45bj44ecEmaEvRIXwJ3fOCDLaO8+
	 GnzdpBkXxo3kCwsIorYp2MW0c1rB+8pV70aL95Az9di9+Kop3HmI0Yv0A9XqEYzrL9QRG
	 4A3qps5+VwIf/X7FC/pwoKFogrZwg8wcPp3usSQAKKOA2cJ2DlcO0mmlb2uNFX9vYcVGC
	 c4h8KX73NnI78KFCZDBpAggQZF8eisGJDiVAokZCOJdd66XvRZbqdQuujhKzCAdAGdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794134698;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=4jm/n8n8kvwXcA+cX5ikUvn39hfJLIJLWCRHz+H02v4=;
	b=KLbPKVgzdJzrI2iy0SqMCoZmeNdse5BaH9Rr8hdkVjZz/h1uT7xTxFSW8DROnaiiVyBQ
	 3X+Nw1vPWRW3xb317omzmxnj/Uod3OH33CZSxP6T1nVvKD9fby69Uk11WvR56huKkNh2C
	 Ld8O+ITP7Z3YsbrnZtzF58ZPtmQHFFHo9KSnFw0Rc+o3yuUBCEQJCYmkwyvmsTn6JJxPl
	 CvvBekcwUnPTEAXLavOqdUFXuKhgLboHqxlngu4GrOLsyUkUq9RJKYb3d3UFWJ/n01vU6
	 e44TFqTdjURf6nzCOPOpaO/kC9LDQRsOn3ylSG9EM2ekTZT1QgnaA9W63IN2cOuEsSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tRMTpKOz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eoZ0p+vM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iVJL+V75;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=C11oGiPp;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA62C606A31C;
	Sun,  8 Nov 2026 10:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA62C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tRMTpKOz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=eoZ0p+vM;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iVJL+V75;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=C11oGiPp
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EA1C221E34;
	Sun,  8 Nov 2026 10:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794134696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4jm/n8n8kvwXcA+cX5ikUvn39hfJLIJLWCRHz+H02v4=;
	b=tRMTpKOzLaZMeDn27YDWyNfh1HYgG/QKLnwR8xtaprzcC4yMjXz1KN9hNospsnK5h8/UFw
	7D5YJPRjnRIEyDVlg6orb38TEuJkzW7Ws93oLzfW4s0LHBs4o1a2Qoh34mIjAMNyBNw2JB
	+jso1RoDZXQFfP3H49+itvU/vRBPjgY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794134696;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4jm/n8n8kvwXcA+cX5ikUvn39hfJLIJLWCRHz+H02v4=;
	b=eoZ0p+vMu91aB1KhLFruPB+mIoxtVfSzfa/NrHuy280LToNBYMEHeL/ZLuZQD5LUO2WMp3
	cgxPDqyeepzkXjAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794134695; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4jm/n8n8kvwXcA+cX5ikUvn39hfJLIJLWCRHz+H02v4=;
	b=iVJL+V75zSDpijt1bQNBE87gN7R3SnqgA0qOUJHotGTsccaq7m/ezelB0WCrCKYe5v3Sm1
	NWRIFEuYP9BhE4CU3/tMGb76gStR2J9bTk7TLU0qlFPpOA3z5hc7q78WmqUIoJlMXIVnmw
	3FrdwWDJ2RXqoGkBruyfrhZm9It0FPE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794134695;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4jm/n8n8kvwXcA+cX5ikUvn39hfJLIJLWCRHz+H02v4=;
	b=C11oGiPpIVRjZnljHSq1WDcZMGptKwqEWE5wXw9+PBZocahYirsMX2C0Xb1vZzjxDcoTdr
	ZwV0r3kcf1s0DKAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 952C61339B;
	Sun,  8 Nov 2026 10:44:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HAzPGqdS8GpgVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 08 Nov 2026 10:44:55 +0000
Date: Sun, 08 Nov 2026 11:44:55 +0100
Message-ID: <87a4njy53s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: Re: [PATCH v2] ALSA: control: Fix parsing of numeric fields
In-Reply-To: <20261108095430.3300-1-sreekuttan2156239@gmail.com>
References: <20261106162357.3616-1-sreekuttan2156239@gmail.com>
	<20261108095430.3300-1-sreekuttan2156239@gmail.com>
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

On Sun, 08 Nov 2026 10:54:30 +0100,
Sreeraj S Kurup wrote:
> 
> Hi Takashi,
> 
> I looked into using simple_strtoul(), but noticed that it is deprecated. 
> kstrtoul() does not provide an end pointer either.

Yes, that's also my concern about that approach.

> Would it be reasonable to retain the delimiter-first approach with 
> kstrtouint(), as in v2?

I depends on the result :)  We can compare.


thanks,

Takashi
