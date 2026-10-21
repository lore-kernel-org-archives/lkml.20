Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587584;
	b=e3FmsSibj0jKGy/APgMZ+Hs3DKQiP+T7myOc4ouV9M2hyC1Xk4jaAl/iRXCPZZ9vUJ0G
	 /gM75PWNYVEljS2r2faayngA+uGDMn2KEvDgHi/6BmX+FN1UQZfpkMLzgSLxuL70ow+5u
	 ZbGK8g1ufzaoRIEnTG21o/CdvcF8ONkbWSli+8AUV1HsR+thl9XBJVZd+7faXPeKsZ1Q5
	 gZ0xofoREv3uvjn6D2DxFNm+2jUKXE31h4G7LqbEfWwHbVuDGC4MOh0J1TrFcc1U55dTW
	 wQiyxQSF2//KcBNf0PbmVwfAsNOb1WqmDEEUoOQKFLwjrwJMULPx1UpQ2Jz4HFUPdtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587584;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=3cwQXsuZBjkdM7DJELkYtVzT4iwCYHrvMluYvN+QnNE=;
	b=ybpK/FDczvAXk+2MWhI91Wbbf6WJJ83wr+FIW7o9XlJ3n/DF2tdV8LCIhr6W5TuYXEgE
	 hLDmZxngacDeuBzY5mInVIXQ0LMjPEy4ND6PwNj+lugKtV3T/NudVhjrc8IVkdSOIQeUi
	 3G0ZNdCLcFIqN1z5jPxuaLNQn2VxkCgt5CDpwUVrR+d5PFkxRgeae7w3sPefL29Gge/FI
	 N4PU71Zcy9KJnOX4rTAP4B+G6LwYQk+kXe2Ma1L4HbgpYJrBRtRvWntzU+3b3hChkiHNw
	 P/fR+YpSolyE21HiK92SXJPqBWaVeew4FijP+iwPlJsA5Mve1XcPpUBelqUUfD/Oapw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="PB6R/rH3";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mwrcx9NK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="PB6R/rH3";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mwrcx9NK;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AB8606A31A;
	Wed, 21 Oct 2026 12:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32AB8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PB6R/rH3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mwrcx9NK;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=PB6R/rH3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mwrcx9NK
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1AFCE21CF9;
	Wed, 21 Oct 2026 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792587582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3cwQXsuZBjkdM7DJELkYtVzT4iwCYHrvMluYvN+QnNE=;
	b=PB6R/rH3bDKinZQF9o4SDxheIiJRfKNP8Wg5iX/kxjtJKIMPbBma0dau0oMspTWc4umikx
	HwevwXZCEjfzeL96hD8AU9fJq6exnELSwl3OzEwHRRNRSMD3FyHm5wvMUwBRsg/RbFwluX
	oUwdJwVU7r5BtyiZfbz/82FR5pGEp70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792587582;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3cwQXsuZBjkdM7DJELkYtVzT4iwCYHrvMluYvN+QnNE=;
	b=mwrcx9NKzOox5mvkE2lu7RNazp2Y0meab0JgWA1VMrAbrWOcr1p74JHv1h5exEZ0q0BMcm
	U/xbRpHojFjzDmAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792587582; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3cwQXsuZBjkdM7DJELkYtVzT4iwCYHrvMluYvN+QnNE=;
	b=PB6R/rH3bDKinZQF9o4SDxheIiJRfKNP8Wg5iX/kxjtJKIMPbBma0dau0oMspTWc4umikx
	HwevwXZCEjfzeL96hD8AU9fJq6exnELSwl3OzEwHRRNRSMD3FyHm5wvMUwBRsg/RbFwluX
	oUwdJwVU7r5BtyiZfbz/82FR5pGEp70=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792587582;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3cwQXsuZBjkdM7DJELkYtVzT4iwCYHrvMluYvN+QnNE=;
	b=mwrcx9NKzOox5mvkE2lu7RNazp2Y0meab0JgWA1VMrAbrWOcr1p74JHv1h5exEZ0q0BMcm
	U/xbRpHojFjzDmAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D33A0134A5;
	Wed, 21 Oct 2026 12:59:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AmuvKj232GqWcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Oct 2026 12:59:41 +0000
Date: Wed, 21 Oct 2026 14:59:33 +0200
Message-ID: <87qzhjdxai.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <blum@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rong Zhang <i@rong.moe>,
	Arun Raghavan <arunr@valvesoftware.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Use strscpy() in append_ctl_name()
In-Reply-To: <20261021105826.147060-3-blum@kernel.org>
References: <20261021105826.147060-3-blum@kernel.org>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 21 Oct 2026 12:58:26 +0200,
Thorsten Blum wrote:
> 
> To prepare for removing strlcat() from the kernel [1], use strscpy()
> instead with the current name length as the append offset. Change
> append_ctl_name() to return void since no caller uses its return value.
> 
> Use append_ctl_name() to append " Jack" in build_connector_control().
> 
> No functional change.
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Applied now.  Thanks.


Takashi
