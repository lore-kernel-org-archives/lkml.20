Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5716C3D9DB4;
	Sun, 18 Oct 2026 08:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792312557; cv=none; b=u0E00iq8i2O8P5tkb54EajwyX2+aT8ytrXMBHihsT9cGKkvKRQFT/4kXWMQxdi8ScE8RHJKP0J1xp3OgPuashMp6ZGHmNnDWw7B/ECjckF3PFRwZg871nmY79ykKs2dJ5idfIYIf06dfxMBWbxNGT2kI9GDZIkaQJCfkQ9sOgQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792312557; c=relaxed/simple;
	bh=DEn8q7D8G0goArVvLBRPnzokvb0RCdIYlf9hei/JsxU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mj+9KNC0c8rpFiOGIAV5iLH+U9zDQ/hQcAvu2oEtERe+bYSQMCbjOSO/6kXtydb7mVnof5uKg1iYNj03LlYmw79Ah2peJs76Fg5KqXYpty6Z0j0GThsP0S/OYHnUwpB1X+cJxcwBlYow79SeKeESMYjk4IocfE58pMKvtFlAjfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cMj7ewgN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LFhxLbLK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cMj7ewgN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LFhxLbLK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cMj7ewgN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LFhxLbLK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cMj7ewgN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LFhxLbLK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0F0041F45A;
	Sun, 18 Oct 2026 08:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792312553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DujejZ9vbQ+YRXRuNVZYnDoFT8vAWUgfLZvnmU//YPc=;
	b=cMj7ewgNc1ImqX6MdRHkiS0cPqNComxyZUNzjc+p75g6p5Vv0aMj+ulat0dxSvSlUpemlI
	tat1x4QxACLaiMt2t6BaMoz2a/w9VZmPv3PHt2ENaQ3E/Ohp0HHJ7jWlrM2bh0o1yksbjo
	akFZyWLucYmakLOg3d3xduYv1KpbgQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792312553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DujejZ9vbQ+YRXRuNVZYnDoFT8vAWUgfLZvnmU//YPc=;
	b=LFhxLbLKYKmgZVZZt544mLKHmHX2jctVlcPQj+jQU7jw7A6SmI7mr0dfWQONxF+XOv375A
	49yaejLM+O4OT9BQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cMj7ewgN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LFhxLbLK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792312553; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DujejZ9vbQ+YRXRuNVZYnDoFT8vAWUgfLZvnmU//YPc=;
	b=cMj7ewgNc1ImqX6MdRHkiS0cPqNComxyZUNzjc+p75g6p5Vv0aMj+ulat0dxSvSlUpemlI
	tat1x4QxACLaiMt2t6BaMoz2a/w9VZmPv3PHt2ENaQ3E/Ohp0HHJ7jWlrM2bh0o1yksbjo
	akFZyWLucYmakLOg3d3xduYv1KpbgQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792312553;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DujejZ9vbQ+YRXRuNVZYnDoFT8vAWUgfLZvnmU//YPc=;
	b=LFhxLbLKYKmgZVZZt544mLKHmHX2jctVlcPQj+jQU7jw7A6SmI7mr0dfWQONxF+XOv375A
	49yaejLM+O4OT9BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB1AE132D3;
	Sun, 18 Oct 2026 08:35:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nqcZIOiE1Gr0SAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 18 Oct 2026 08:35:52 +0000
Date: Sun, 18 Oct 2026 10:35:52 +0200
Message-ID: <871p9n1k47.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel.flying902@passmail.net
Subject: Re: [PATCH] ALSA: hda/realtek: Add fixup for Huawei MateBook X Pro 2019 (MACHR-WX9)
In-Reply-To: <20261017095400.350164-1-zhangheng@kylinos.cn>
References: <20261017095400.350164-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0F0041F45A
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Sat, 17 Oct 2026 11:54:00 +0200,
Zhang Heng wrote:
> 
> On the MACHR-WX9 (ALC256, PCI SSID 19e5:3e13) the BIOS pin table
> disables the main speaker pair (pin 0x14), so only the tweeters on
> 0x1b play.  Reusing the MACH_WX9 (19e5:3204) pin table restores all
> four speakers.
> 
> Pin 0x19 (headset mic) has broken presence detect on this board: it
> reports "plugged" even with the jack empty, so auto-mic routes capture
> to the empty jack and the internal mic goes silent.  Setting NO_PRESENCE
> on 0x19 (0x04a11140) suppresses the false reading.  Chaining to
> ALC269_FIXUP_HEADSET_MODE then infers headset-mic presence from the
> headphone jack (pin 0x21), whose detection works correctly.
> 
> Add ALC256_FIXUP_HUAWEI_MACHR_WX9_PINS with the MACH_WX9 pin table,
> chained to ALC269_FIXUP_HEADSET_MODE, registered for PCI SSID 19e5:3e13.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222126
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied to for-next branch.  Thanks.


Takashi
