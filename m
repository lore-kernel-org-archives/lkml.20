Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843966;
	b=EDgMahIcgoBRGwq1fQ6KQ7oNihZlsi9o/vPhz0jBNzLIcRENFheMeDvSrysKQAwHEoK9
	 o0yKViLIKjM1XP0WVuKXXIsGzZrXN1zgpyQjSNugIBhtoPypBBH87t41KFTnjPmKxW4EB
	 D/eHenaBB+b3m8XOT5b8y/+kT2D97YcmccyGyXd8zcmcQBl9V8OPw7Zq8uJVx30hfGBKw
	 GMhl+TuvIcZ5WQE7hQR4e8ArlERhPPp2x8QtrS96TE0Tb+7wh4sRpvUSqpqNm7a2wSvt9
	 JFgJWDEm3yxn4EFQa2Qh+VSbtVFw3R4dQQLlwh/ZpPmy6I7604PVplmRYuCaRqHzp4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843966;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=ZsLcpSlu0xOtB99tdS5E7q9n/YT6799JHqXWdfxhZo8=;
	b=quXhIiGs9EdVaUUdYE+FrUlkLCRR+q5QqPOPBTZUCfxTZxji/6c1qHbsvlSKFbALT47T
	 6/qcSpZtT50dgp3M/Setnp3jGva9xrHY9PvbMt3VI/nvanCceHek7KF6CB9fmTOSKDkpf
	 pCjor7+J3wUZ3rrYOzOYWaKYUpVdJKNAmZBaRza89aEgEsrSrWninok5T4CH5waFEpUFJ
	 2ghNyJg18HULSybIBSnaSyWXMhn1wD4JlxdBgXPFX0WABJg/aAiD/i56iUEY1IE0bpoRO
	 qnzX04IFYrtmbXyg13DO1kDWY4bt0d8xbo3AC4SwQyOZzxGOWMoQye6ZbSS+zylm6Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yOwJkUDg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=J7bRhhE9;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KsFApR+i;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PaCckNme;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1A2606A32F;
	Mon, 16 Nov 2026 15:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E1A2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yOwJkUDg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=J7bRhhE9;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=KsFApR+i;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PaCckNme
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0B0B91F83B;
	Mon, 16 Nov 2026 15:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794843963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsLcpSlu0xOtB99tdS5E7q9n/YT6799JHqXWdfxhZo8=;
	b=yOwJkUDgiFXnugsqmiSpX3119tzGEvaCu5sQV/RTvV5mpqZBtggax6g42INI2PLVHFbQ2O
	o5GlmNUVX198qrXEu8Lwo/4ZIe3QYqaZUKc7KKwxAsoeyP676tc0thy/4c1lno+6nslzY5
	lHqwr9etSrD0YKEztpI01zEeS4atjdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794843963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsLcpSlu0xOtB99tdS5E7q9n/YT6799JHqXWdfxhZo8=;
	b=J7bRhhE9tJMXPZWRkNX57ENbybpqVSLrVlMja3soQX+tCxwcEHN7ZsSc2fYp8oR8ZP4X4X
	k6B7wkht8RRYtkBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KsFApR+i;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PaCckNme
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794843962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsLcpSlu0xOtB99tdS5E7q9n/YT6799JHqXWdfxhZo8=;
	b=KsFApR+ipCGQGiSHXQ3J4jkq9kUW+2WVgp0RUd5NzXrSl9GK6Jwm65/T8Rx3DRsPvePwzu
	O1fVeeXQ6ZsHyf0+qqn/Syju2F2GnkwxsKUu+ezwt2XkMrNL9MZam432mVQ8ePADo3sc1N
	vNsj7sQ4KOq0mBlHN7e0yEOwk9MrgNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794843962;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsLcpSlu0xOtB99tdS5E7q9n/YT6799JHqXWdfxhZo8=;
	b=PaCckNmeU9U8M2mLIHyWUe8Kd+Ifp8hLUJPXyCuLhu08TwZRd0AnfetQnJQxp5a7PFH+nr
	pcNcbF4rObS0fBDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B054A13408;
	Mon, 16 Nov 2026 15:46:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 82yKITkl+2q2QQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 15:46:01 +0000
Date: Mon, 16 Nov 2026 16:46:01 +0100
Message-ID: <8733t0ye2u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: jack: Fix jack control cleanup on error paths
In-Reply-To: <20261115114315.3679-1-sreekuttan2156239@gmail.com>
References: <20261115101949.2483-1-sreekuttan2156239@gmail.com>
	<20261115114315.3679-1-sreekuttan2156239@gmail.com>
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
X-Rspamd-Queue-Id: 0B0B91F83B
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Sun, 15 Nov 2026 12:43:15 +0100,
Sreeraj S Kurup wrote:
> 
> snd_jack_new() creates an ALSA jack control before allocating
> the jack structure.
> 
> If a later allocation or device registration fails, the
> function returns without removing the previously created
> control. This leaves the control attached to the sound card
> and can cause invalid list operations during card teardown.
> 
> Initialize the control list in snd_jack_kctl_new() so that
> the private_free callback can safely remove the list entry.
> 
> Route all failure paths in snd_jack_new() through common
> cleanup labels to remove the control and free allocated
> resources.
> 
> Fixes: 4e3f0dc65883 ("ALSA: jack: extend snd_jack_new to support phantom jack")
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Applied to for-next branch now, as it's no urgent fix that can trigger
a crash or such.


thanks,

Takashi
