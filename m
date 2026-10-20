Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502134;
	b=sAjeg56+r9AiIxoQMAHxu4MGPNRp1TbCOkl4si6ctbJ85H8gBaHRGCUCNTqgjhxRKyQV
	 4465duPHhAzOkof6KT7XEPCap1FNuZQFVIHf/A27g7JZ+KAwcQ1mEv+vLTunzwKelQvMW
	 ZIe/L5ZepOjSILjvfF0IqDY6nFc2RFWTDf1/zR2ub+MeIDHCIQlir4iuXpML8ds6EAfwC
	 92/tn+q4Y1s+4y52AELFmJnZJ8fSecnldxisQrcHbG5OnJwlvUaNoKJgodhBgw038aS6e
	 if0tA/50TeTDfBEEs75Cv/VOsRNPGEDs/1RvewIrBdOW1crEXhIEYSs3j51xmIpN+5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502134;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=rN6kmjv/RS/jx2dapMRXSuCZAjvpCu3kUb1jRO+0WUY=;
	b=Sov9948EwUFyQzVNo/dIdnTpg4VcKJIpZmyrmA8+Lue/V3dUgYABmdameEwq1GKKkugK
	 vGgr8evwWdjjpCWGMjiSzmVOjlr24lpsP/bjQe3spKBZhVYVdzO81obiK922vA1UMYSVx
	 mDjIBAU5DaqkYdNhLr5MQ7j8tbBdHTKmYh/0NeZbD26xS7pXe9Kru5KKcQtNibJsp4PYb
	 GwDstw+MVNILRuypnHzNEnNvgPSXHinEQBf7GZNAJBIThU/fXQvR77rhgcBDP8yJwBabO
	 /I2nqR5fHRMrVaXgqs5ZwpcgBK9URA8g6nKwUf0VUIC+s1kisKXgosWsrulZVNkCLVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jzeSqCqc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=79iImQwL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jzeSqCqc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=79iImQwL;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EBD606A32F;
	Tue, 20 Oct 2026 13:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90EBD606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jzeSqCqc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=79iImQwL;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jzeSqCqc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=79iImQwL
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DCB461F7DA;
	Tue, 20 Oct 2026 13:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792502131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rN6kmjv/RS/jx2dapMRXSuCZAjvpCu3kUb1jRO+0WUY=;
	b=jzeSqCqccZA6cFuVk2M3ISFaDXNYFK4nwk/WNh34JWYGZL4JbARu7IC4rodj4xRZk8WwdW
	VCviASn7T0zoewWc0PkdjyYiyy9QSOFJlm6+cdnCnnmlE1msi7x7FOFZHUNsFFLNa8knQF
	E+j1CfFoP2rEJRcO+7sJ8Dwv2cTDNX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792502131;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rN6kmjv/RS/jx2dapMRXSuCZAjvpCu3kUb1jRO+0WUY=;
	b=79iImQwL6LADj7R8HIMcfVxmK1IjkHjX8Lig0Gtt45YUutWZc5zHnl8iC4k0WcshIhekVP
	MTbHthQ8VjSwOfBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792502131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rN6kmjv/RS/jx2dapMRXSuCZAjvpCu3kUb1jRO+0WUY=;
	b=jzeSqCqccZA6cFuVk2M3ISFaDXNYFK4nwk/WNh34JWYGZL4JbARu7IC4rodj4xRZk8WwdW
	VCviASn7T0zoewWc0PkdjyYiyy9QSOFJlm6+cdnCnnmlE1msi7x7FOFZHUNsFFLNa8knQF
	E+j1CfFoP2rEJRcO+7sJ8Dwv2cTDNX4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792502131;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rN6kmjv/RS/jx2dapMRXSuCZAjvpCu3kUb1jRO+0WUY=;
	b=79iImQwL6LADj7R8HIMcfVxmK1IjkHjX8Lig0Gtt45YUutWZc5zHnl8iC4k0WcshIhekVP
	MTbHthQ8VjSwOfBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5F39136CC;
	Tue, 20 Oct 2026 13:15:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7227HnNp12pjcAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Oct 2026 13:15:31 +0000
Date: Tue, 20 Oct 2026 15:15:31 +0200
Message-ID: <8733u0h5sc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: emux: Skip events until fully initialized
In-Reply-To: <20261016161953.482441-1-tiwai@suse.de>
References: <20261016161953.482441-1-tiwai@suse.de>
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
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 16 Oct 2026 18:19:52 +0200,
Takashi Iwai wrote:
> 
> The emux synth creates a sequencer port and then continues
> initializing the port attributes.  It allows the port receiving
> already input events even though the synth stuff hasn't been fully
> initialized.  Similarly, upon the releasing, it clears up the voices,
> etc, then detaches the port.  This may leave some pending voices
> before the detaching.
> 
> For addressing such races, introduce a simple guard to skip the event
> processing in the premature or teardown phases.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

This doesn't look covering the issue enough, and I created a different
fix for emux synth, so let's scratch this one.


Takashi
