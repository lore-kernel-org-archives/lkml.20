Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059498;
	b=ZKt/mO8r7FrktuYlRDSQCVFROa1aSVTt7gwF5s7k346zbLf3veoelH0D7V0fgnkzyBIK
	 suREq+ZCpVD8lQy9mKiZsqFAEwu8/5P0La+vvROzKXs8H2LF1znqrJstVSFcy8zNYePqP
	 iwyvjwGmmchP5tFmeW+MkNbBx+YI/cy5Qx61tvto4x2dZTYdrLdnw3nuzonO44VmI0O+h
	 BcJ4krpbS72Pydwk4yPx6DL1bmfdy7rqimZFw3jPVTiVrtqORyC1VruryZRJHZO6QHwpY
	 7YDBKLNlIMnJD+9bjo3xQKncJkS4PmrA5fKhk40iwCoXGJMbyrNgbT0dGRjXIUMHA+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059498;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=pqUAkDNNAJZ9CmUCakMTpSvJRPQcD4aiilzSL9SBeVY=;
	b=cCIx1+wxVMm6JpVVYDSv3afsFm/NscWhsIdT2j2OSQppxJgzVNjZzZPGIqyWt09VdsPi
	 shPiRmYmcjjgzasqcH5uI+7OuGS/bwCJA5qToXqqAposKTTvNFJPvdyW2ZX63ljSo/ja6
	 +wAy3HeWfw1SFwT0ZhG5h84hZg/+iSHr9aERF53+909rcarGsCNkR34aqNud7RDRNS0XE
	 i1XQXuenjuHE1/dPRjienfaTxvPO6LjpFMKGrRPsEfh7/P13iv2sdr8DH/+sBeGC5iuFi
	 DF1D8H1NkZg7/zEfSBsAxjJ4FViz/nn30wN48R3mkv6RVHz9aaT5jwxN16HU6XG7gBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tUgtLHtR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=M0DE5hKm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=coySoHTf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xMKiocSW;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC5E606A326;
	Sat,  7 Nov 2026 13:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABC5E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=tUgtLHtR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=M0DE5hKm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=coySoHTf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xMKiocSW
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E49D121DB5;
	Sat,  7 Nov 2026 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794059496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pqUAkDNNAJZ9CmUCakMTpSvJRPQcD4aiilzSL9SBeVY=;
	b=tUgtLHtRvr7gKprVxvZ4hxkWt+bpwrZXRTs0waOjZLEwxdqtMgPSSbcLJFLZtJvedkGlMP
	u8SAl74AFC/F/jurYJ9MB19OwdBUBUpx16NstTnjfvshetEGJphMxA6yJboRE3z8ct0B2K
	o7NowN2MuQR9BAVHMedkLk8MEPRs2Tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794059496;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pqUAkDNNAJZ9CmUCakMTpSvJRPQcD4aiilzSL9SBeVY=;
	b=M0DE5hKm/lV37s7nI9SB21uYnrDqLK5eFSR4YBA+eItcRj+eRo5mKGgB2SRGnUQYSYr/V9
	sTOY04sKUj71PVDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794059495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pqUAkDNNAJZ9CmUCakMTpSvJRPQcD4aiilzSL9SBeVY=;
	b=coySoHTfjGHNvP4A7UyAataf7GLXaqNOFkPTZh799cpz80N6PlIbQgJ54zcRFh1i4qAJs9
	ovt+r2tdFqGv8hctCsED8eAApZTJP/y0kMonvYBsD5DFnbslCR7OTZilxr9BqjiLMfIXod
	FrV0sk66nCDUttqkGf5ux9x6jaVuRMo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794059495;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pqUAkDNNAJZ9CmUCakMTpSvJRPQcD4aiilzSL9SBeVY=;
	b=xMKiocSWxlQ0BM8H2AuQ1hVoklvPjzEUqojjGdgjcmonr7uBn943FB1lQ4kZ+5L/2nabiU
	L7THV2aVAj2p4HBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72318133F1;
	Sat,  7 Nov 2026 13:51:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gFFpEecs72pYeQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Nov 2026 13:51:35 +0000
Date: Sat, 07 Nov 2026 14:51:34 +0100
Message-ID: <87pkwgyck9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alyandra Zahran Nadhir <alyandra5b@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: Re: [PATCH 1/2] ALSA: ump: clear stale RPN selector on NRPN change
In-Reply-To: <20261107111056.667-1-alyandra5b@gmail.com>
References: <20261107111056.667-1-alyandra5b@gmail.com>
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sat, 07 Nov 2026 12:10:54 +0100,
Alyandra Zahran Nadhir wrote:
> 
> The legacy-to-UMP converter keeps separate RPN and NRPN selector
> flags. When a stream changes selector type without sending data first,
> both flags remain set and fill_rpn() gives RPN priority, so subsequent
> NRPN data is emitted as RPN.
> 
> Clear the previous selector flag after flushing any pending parameter
> data and before recording the newly selected parameter type.
> 
> Signed-off-by: Alyandra Zahran Nadhir <alyandra5b@gmail.com>

Thanks for the patch.

Recently there was a discussion about RPN/NRPN handling, and this
looks related:
  https://lore.kernel.org/20261104121508.3972314-1-sammiee5311@gmail.com

Adding HyeongJun to Cc.


Takashi

> ---
>  sound/core/ump_convert.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/core/ump_convert.c b/sound/core/ump_convert.c
> index 0a7972d91..b112064cb 100644
> --- a/sound/core/ump_convert.c
> +++ b/sound/core/ump_convert.c
> @@ -378,6 +378,7 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
>  		switch (buf[1]) {
>  		case UMP_CC_RPN_MSB:
>  			ret = fill_rpn(cc, midi2, true);
> +			cc->nrpn_set = 0;
>  			cc->rpn_set = 1;
>  			cc->cc_rpn_msb = buf[2];
>  			if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
> @@ -385,6 +386,7 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
>  			return ret;
>  		case UMP_CC_RPN_LSB:
>  			ret = fill_rpn(cc, midi2, true);
> +			cc->nrpn_set = 0;
>  			cc->rpn_set = 1;
>  			cc->cc_rpn_lsb = buf[2];
>  			if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
> @@ -392,11 +394,13 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
>  			return ret;
>  		case UMP_CC_NRPN_MSB:
>  			ret = fill_rpn(cc, midi2, true);
> +			cc->rpn_set = 0;
>  			cc->nrpn_set = 1;
>  			cc->cc_nrpn_msb = buf[2];
>  			return ret;
>  		case UMP_CC_NRPN_LSB:
>  			ret = fill_rpn(cc, midi2, true);
> +			cc->rpn_set = 0;
>  			cc->nrpn_set = 1;
>  			cc->cc_nrpn_lsb = buf[2];
>  			return ret;
