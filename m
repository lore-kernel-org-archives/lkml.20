Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905949;
	b=aFtrWLxlgCBm9QTkAdw34CcdcSwVDK7j4A3bdG2rNoR6/+M7q8AtD6T5mRP2mCXctnw0
	 5STLHkP+CuhGPAaOdTT1IcFTSRM3wQVHFA1zeAQNzZaZyEMI2blw7mkzvrIQzzbZy+01F
	 zQhpRMeqCPl/fR0b/lDU3c5w1BMPOgj81mXwzMAtC+z/XX5ZxmTjdSdy6QvB28aRDmgg6
	 jDZ7hhEN2CzYnG8dWEczsaFYqK/llTXlDSsUPlP2cyOKhxOXsS5G4fqIkC170h6F6wBbj
	 byyDjAk+1mStrgKD6MYsSTsdWUEt7Ix2O+6MDtAgusYt3Ot9lE3PnFombRkGpCnZ/Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905949;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=k6lkZWK0oA1Eo7EQbZcq2dK23BsFOFW90tKXgCMu5VY=;
	b=eRI5twnDNzulfjz9rzR1zkxJtFakM50ESPvnvwpJVuuhB2qlgpOGi+AwMk19z4B57JhZ
	 4crkDiCCn3OPvg/cLwCZz1f5+Lu7VJTbDCbLkorGWi2lqMb1stnafh7Y8/GHupMgwMrlm
	 7f7jo6soZMTk3nzsZIQ4ImPiyMQOaC6GI9dOy31Clk/qBwaXdHHzckSgqmRwtLzgGxO4C
	 Abpk8nuJfXCncvk+H4AHKArxpe0Shg5+7ELTNFDADdwdfTcQCoudm7xfSOwC48uoAHpPW
	 dySTCsD62kQ/z/t6hBOpoJEQcVNYFsY5JQLo4KwGkWxNV4fL9A61joyE1FAFcBH4b7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iw6BSLEW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=o+SP36iv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=W1RjdlXD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YjrKvF5L;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD80A606A330;
	Tue, 17 Nov 2026 08:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD80A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=iw6BSLEW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=o+SP36iv;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=W1RjdlXD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YjrKvF5L
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E28601F787;
	Tue, 17 Nov 2026 08:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794905947; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k6lkZWK0oA1Eo7EQbZcq2dK23BsFOFW90tKXgCMu5VY=;
	b=iw6BSLEWk943NuJi6LU15Y9kjK4NsXHHRZpIbdLO9o5Clq9FysQxtwUbyQmgZ5D5eu7tD/
	QdMFl937wqjbxADo7kpUa7cbYPE0SSB1Wf6kmLywvqlqsMnxQVyGZ/w2oDAm1pKvf2HqwE
	eoBbC+51Jgtw+BnRmJjaoAS1A2dFi1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794905947;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k6lkZWK0oA1Eo7EQbZcq2dK23BsFOFW90tKXgCMu5VY=;
	b=o+SP36ivUMFOzmkmo0yeCsexTB8RSj1COZhmM1TR8m5wduNR5e3EKcWHhmh64mDvvOVDo4
	RtQZ3CsDyOmIygAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794905946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k6lkZWK0oA1Eo7EQbZcq2dK23BsFOFW90tKXgCMu5VY=;
	b=W1RjdlXD5wRrQUBxLbEWqfF1el6HYvv1u8mDth/lWq1k8RSDs4TeTAlD1tCTQxQCXKjJOv
	jxB4oYnNYWmovhMC2YDTmvPVtz485vzyIrcS4Oy+DNhPs/nUlOc1cqOBNTeEfjzWy7Ay3U
	PFLAX8hFsg/yzumDHAezagQalgeXRaY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794905946;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k6lkZWK0oA1Eo7EQbZcq2dK23BsFOFW90tKXgCMu5VY=;
	b=YjrKvF5L4+d95ab8dpNBzLyRaq/Yo7Dj0KcZKdUW0jnD08G9TK/3TBg53enCYHm6AXHg6W
	cWQvo3xOidPcs+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B0941334C;
	Tue, 17 Nov 2026 08:59:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CnXSHFoX/GoPYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 17 Nov 2026 08:59:06 +0000
Date: Tue, 17 Nov 2026 09:59:06 +0100
Message-ID: <87wlqbzvdx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Devin Christensen <dchristensen8@proton.me>
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rafael@gexdigital.net
Subject: Re: [PATCH 0/2] ALSA: hda/ca0132: Fix AE-5 strip color glitch and add on-card LEDs
In-Reply-To: <20261116142542.4178770-1-dchristensen8@proton.me>
References: <20261116140237.4137662-1-dchristensen8@proton.me>
	<87qzgkyi5l.wl-tiwai@suse.de>
	<20261116142542.4178770-1-dchristensen8@proton.me>
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
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Mon, 16 Nov 2026 15:25:47 +0100,
Devin Christensen wrote:
> 
> Split into a 2-patch series per Takashi's review:
> 
> - Patch 1 is a standalone fix for the external WS2812 strip color
>   corruption glitch during rapid updates, targeted for 7.4-rc (carries
>   the Fixes tag).
> - Patch 2 adds ALSA card control support for the 5 on-board APA102
>   RGB LEDs, targeted for 7.5.
> 
> Thanks,
> Devin
> 
> Devin Christensen (2):
>   ALSA: hda/ca0132: Fix AE-5 LED strip color corruption during animation
>   ALSA: hda/ca0132: Add Sound BlasterX AE-5 on-card RGB LED support

Applied both patches now.  The latter is in for-next branch.


thanks,

Takashi
