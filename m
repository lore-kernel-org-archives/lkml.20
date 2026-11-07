Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794042232;
	b=Ar4F6rvmVQepSJyEJkPWisze3xU2XcCoKNrJp9h9D5tQQl9UCJUzuV4bHPAzOURv+rD1
	 P0jO/v4owMYBNgb8pdKyvB/sKTYJ557ufh1UXcR2SQ0r2EgXfXeQr0BSpzWEWOgDh26/J
	 xtlkRJTHsRYhcAGm8a20YRZEKxB1s01avbTQpxYs6quKzRbthfWGCoMvfuo9ljv4wJkXa
	 7R/F5pKcDr3iPHRBJYtOyFBtKOP9FAZOF9S82dmI/dDo1zCFMaVQx5QTqQtvUYGuXstpq
	 gAM8+Rdq+Moh0vNE0F7RfYqnbdzJ0koWj8kynZrJaIZ/ltEp2CXh4XJxaYTUFqExh3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794042232;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=r0Hy/1DnrBqDCtf3CjNZbKNyKl8Di/TQUVIBIaEgNCY=;
	b=PFFVvNYRkK2JaHNGPMApyYrgeJIqtf8wEfFMs9n3zkYYDN6zhusNyOlYlCLQO/IfUFWF
	 gUKo2jEcuraEaLXL18NatFclttp8L+WNqoiy5WJ5fXfr7htBFxtZqRVVsXH66VJCieJCF
	 4gfPOxLO7OS+F4hIs23OWYSUprnz5FIBbPOqk9HLDRWgdkOTIP5GbT/JuB5lLp6Nsg39h
	 GAEYP8mfvhswJ9EpazYPCjlNxKhJdiKHIlSSRx3lQyYI1jhGqkL5Rh/Immta/Ru9lUrc7
	 0nmGgYkYors/CpVMzGPkT3XQkufLZGMGvG7NWJSsMkRpAfQpsV+edJ3EZP8yBscVWfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u2EQzWdx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KiXFxrz2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="Nap/kJjZ";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="okNnxr+/";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D2C606A326;
	Sat,  7 Nov 2026 09:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98D2C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u2EQzWdx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KiXFxrz2;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Nap/kJjZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=okNnxr+/
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6A5F52204D;
	Sat,  7 Nov 2026 09:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794042229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r0Hy/1DnrBqDCtf3CjNZbKNyKl8Di/TQUVIBIaEgNCY=;
	b=u2EQzWdx+jwP7Q3axrIol/agfgbcp7nm3/55fzizo5Nqt9k2OQFRP5sWyGqcj80eIwJ3ug
	+sZrwdNxXuPaRmFSuytLdDNCfYasgVCoWkUTlUlnDPJyJrZqcVxPdhuf2+khTGAi3RF4qT
	KQGTs3pq2HZ2LleSXryQX1bQgVmIzHk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794042229;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r0Hy/1DnrBqDCtf3CjNZbKNyKl8Di/TQUVIBIaEgNCY=;
	b=KiXFxrz2AT6nkE9BrdPW8U2XUo36nU/BiQBLnVu9vLhSuQfzvCWnQVMR1k+hmDbzGzsNNY
	8mAWVJQa9MQNsLBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Nap/kJjZ";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="okNnxr+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794042228; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r0Hy/1DnrBqDCtf3CjNZbKNyKl8Di/TQUVIBIaEgNCY=;
	b=Nap/kJjZuCQRP96Nsdq+lznWflbJaHH5VsejTsxoIFGUtvjeL2ZPYmQ10V0lVLuiGveXwo
	lS9SIpXdfaJakF2/f9tD9C62x02nqbpE08BLEgtiCBkb6Ap0yn61+xiClVYWKg1D8HJvQZ
	HDLIlqFUNkF17kK8YaIL1R0xRoyReag=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794042228;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r0Hy/1DnrBqDCtf3CjNZbKNyKl8Di/TQUVIBIaEgNCY=;
	b=okNnxr+/StqBMebNpTmSt/0aYb2xJhn43AN/gI0Sm9KYiua+EvnZzXi41iidmaU74H4jR5
	rQbUafAMYsx8i3CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F823132C9;
	Sat,  7 Nov 2026 09:03:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id o6cOOnPp7mrgWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Nov 2026 09:03:48 +0000
Date: Sat, 07 Nov 2026 10:03:47 +0100
Message-ID: <87h5htypvw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Subject: Re: [PATCH v2] ALSA: control: Trim whitespace from sysfs input
In-Reply-To: <20261106172625.4622-1-sreekuttan2156239@gmail.com>
References: <20261106165531.4074-1-sreekuttan2156239@gmail.com>
	<20261106172625.4622-1-sreekuttan2156239@gmail.com>
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
X-Rspamd-Queue-Id: 6A5F52204D
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
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.51

On Fri, 06 Nov 2026 18:26:25 +0100,
Sreeraj S Kurup wrote:
> 
> The attach and detach sysfs interfaces receive input from
> userspace.
> 
> When userspace writes a value using echo, the input normally
> ends with a newline character.
> 
> The parser does not remove this newline in all input formats.
> For example, a bare numeric ID can be treated as a control name,
> and an unquoted name= field can include the newline.
> 
> Trim leading and trailing whitespace before parsing the input.
> 
> This keeps spaces inside mixer control names unchanged.
> 
> Fixes: a135dfb5de15 ("ALSA: led control - add sysfs kcontrol LED marking layer")
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
