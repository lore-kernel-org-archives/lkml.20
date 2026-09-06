Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E1D35C1B1;
	Sun,  6 Sep 2026 08:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788682387; cv=none; b=iXwQkOIds32qvBdoIpupAbzkw/eZQGg5zRiqpvFT9xD3UeTJaFFhOCsQVA9hd6eT8yTOn0lqX34ZXk+c4jtT7NyR0ZIIq7N7mN1/djvkySpEx03yXUR7Y2BMbkpwBfH7QX8klCa0kzNPBpk6DZHLTFGahbsWtx4LI8paTQfgVWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788682387; c=relaxed/simple;
	bh=2Ae4w5FVGlCRPio6S8p1O9D6Q80pFAho9TyWa9ZDKOM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DqlbBxjF/8xyyNS89eDjqFQLrSlFcf3iTOlRpcfruAadBUJhVgqZmQWQPlzU1rgbGX4+xAf77CkbeT/i5LFQkyEUCHEkfLw2TQQBJr1a9GXflGlmvQQm9EH56joMbOcu4vdXF7syjPBb8jHGTJHnNwVzf/emPYGA3v3Nx85TdVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WyBieGDm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dB0ll/Va; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XpTOGvAi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=a4Q+mnVl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WyBieGDm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dB0ll/Va";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XpTOGvAi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a4Q+mnVl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6843F1F796;
	Sun,  6 Sep 2026 08:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788682380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jJ5LTB2S3MUKcsscjfFt7FCaPlcCSRBEtBK3enUp1A=;
	b=WyBieGDm5LNW8pKUn3/rYJUbeaAC76LHC02aoIsQSSsFx8pJRMH8UBhLib5dO6VuGoz5k5
	GHV7uCl4cBBWvhoLZokJPpU9pv34UdICdjj8qZk+4DXK6129fRuE/2DGBI5hrdMWe/ibGr
	IIFlBuq+pgXBnTdNA2UuZO42837KbHI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788682380;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jJ5LTB2S3MUKcsscjfFt7FCaPlcCSRBEtBK3enUp1A=;
	b=dB0ll/VaCpQPRjo+OicpKRJGCAacWc6xEHk5mP56+48heCijIn7KE8LhABiHAl3S+yA05v
	8ncoWJU1T2zBG/CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XpTOGvAi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=a4Q+mnVl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788682376; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jJ5LTB2S3MUKcsscjfFt7FCaPlcCSRBEtBK3enUp1A=;
	b=XpTOGvAitKriA9DuGM7MHVThy0O3vnVA5MKtbjixW0sVTdFnM0LvEyJ73zY3trtoNy4xih
	GDlSQUHlP24Zhq2vlxqV4qmPg2qppZ5eKB3faNt65r3EfG361FLyvPKXKi2/6vLFLl1HqV
	dYmYn7F6ZkbzN86q66zn131+qeGNaUE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788682376;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/jJ5LTB2S3MUKcsscjfFt7FCaPlcCSRBEtBK3enUp1A=;
	b=a4Q+mnVlVgSe/iaiq7jPuVAda8uJEeVo9JxGTJooaXexSP4sI1PgQfHNzqtZSm6u1kNb+G
	4Gfx7RFgHHLt8+DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1813413432;
	Sun,  6 Sep 2026 08:12:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6f9aBIggnWqdcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 06 Sep 2026 08:12:56 +0000
Date: Sun, 06 Sep 2026 10:12:55 +0200
Message-ID: <87fqzm4x2w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sebastian =?ISO-8859-1?Q?Dalfu=DF?= <sd@sedf.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add boot quirk for Behringer CM1A
In-Reply-To: <apwG4DRfNyvmRzyb@sedf.de>
References: <apwG4DRfNyvmRzyb@sedf.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6843F1F796
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Sat, 05 Sep 2026 14:11:12 +0200,
Sebastian Dalfuﬂ wrote:
> 
> After a power cycle and reenumeration, the Behringer CM1A* leaves its
> MIDI endpoint inoperative. USB enumeration and driver binding
> complete successfully, but MIDI outputs remain pending.
> 
> A GET_DESCRIPTOR request for the device descriptor, issued after USB
> configuration, makes the endpoint operational. Add a one time boot quirk
> to perform that request before ALSA initializes the device.
> 
> *
> ID 1397:1234 BEHRINGER International GmbH CM1A
> 
> Signed-off-by: Sebastian Dalfuﬂ <sd@sedf.de>

Applied now.  Thanks.


Takashi
