Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501761;
	b=sOENAgAgQnD1iNGkzCeUw6/6kQo6xbk3NW9MGugDXHx8JkN4dPB6J7qzV9c/WFtdaKRJ
	 WWmIM9MoJus/Rb60iFhBcVY9n2ju1gpR/xLRR5BCF8Rv4DH0HmMMSFa9ZNWj5HnS+ESel
	 DJC4Dx0mdqsgieI3RghKO3so5CD7KQX1BGfbg3C/zw2kSYUMvwgV1ll0Wmr8+bztVrS8J
	 iwUl388Gsknef0zFmaEdygoqBFbZbexwS2SqbCbdYROaL4rmNmkPuD/Gdpm6xQPvs1JF9
	 6uMzEvx2V7sF+TBYvTb8HNH0GxTBNj/00rfMl2nm56K0KPMk+BRx6GkkRxMJFV2/wzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501761;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spamd-Result;
	bh=/vWu1JTtU9S+xGFWXFKlG5MqZV2GeDCjz3J0e7BzN4A=;
	b=qgu3cUZydPCZv7nqu/eOsdI9UoKJBmHlbqrYd9KygrUjaUZpBl5dtRuGMcXYILNsBRsu
	 whoYY1vKUBLDCAtmajiPyent/+JNhcX24ZPQrFQ4HFdS32fCl97MjedhzoiJk3/ryu70v
	 pdWQ3VHE0E5qE4Q0gUW4Yc3ltUtGX5WRlC6YeG/xaM6G2MTl5YBc3xV/b9Nib4CD9OQYX
	 uIwtrmI0ij51yBJLKF+EUbna+y6Aj8T7T7HEbp8IOCNgHsFYbxnxqtiFlaaSri0c9AW4J
	 xWlLhx+zvEWPu7/Yv6FSR25sXW3GYCRskuM35RYKkrkSnyFAfnD2knIiVmYyL1fPNfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SY2PHhv0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="t6/DSe3j";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SY2PHhv0;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="t6/DSe3j";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AED5606A31B;
	Tue, 20 Oct 2026 13:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AED5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SY2PHhv0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=t6/DSe3j;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SY2PHhv0;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=t6/DSe3j
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8F4391F7D4;
	Tue, 20 Oct 2026 13:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792501759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/vWu1JTtU9S+xGFWXFKlG5MqZV2GeDCjz3J0e7BzN4A=;
	b=SY2PHhv052HkGOIiwH4Wxtu83F465yFL3Wq6NTBhJg1cfqwjtqt8SrxbX+D666KkzEyJnb
	d6QLLxy6jg3SN4tlTqStyJVQSBnw1T9VvL7ZS2wK/ps6XbdZOTzMgvuLt+/PvJdLBFAfBd
	tL7TFRjp60HPwymsJGw4IhBe6XzMoLs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792501759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/vWu1JTtU9S+xGFWXFKlG5MqZV2GeDCjz3J0e7BzN4A=;
	b=t6/DSe3jSe54yrhPTe6h0EEcyflFwTfMEplezeIu0qLhqhx/p1+yVDnBmYWHNiN53S7QSQ
	rHqITuUCGTC0lOAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792501759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/vWu1JTtU9S+xGFWXFKlG5MqZV2GeDCjz3J0e7BzN4A=;
	b=SY2PHhv052HkGOIiwH4Wxtu83F465yFL3Wq6NTBhJg1cfqwjtqt8SrxbX+D666KkzEyJnb
	d6QLLxy6jg3SN4tlTqStyJVQSBnw1T9VvL7ZS2wK/ps6XbdZOTzMgvuLt+/PvJdLBFAfBd
	tL7TFRjp60HPwymsJGw4IhBe6XzMoLs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792501759;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/vWu1JTtU9S+xGFWXFKlG5MqZV2GeDCjz3J0e7BzN4A=;
	b=t6/DSe3jSe54yrhPTe6h0EEcyflFwTfMEplezeIu0qLhqhx/p1+yVDnBmYWHNiN53S7QSQ
	rHqITuUCGTC0lOAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4007A136CC;
	Tue, 20 Oct 2026 13:09:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iw3nBP9n12pSaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Oct 2026 13:09:19 +0000
Date: Tue, 20 Oct 2026 15:09:18 +0200
Message-ID: <877bjch62p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/4] ALSA: usb-audio: Add dB scale quirks for AB13X and Xiaomi Speaker Mini
In-Reply-To: <20261020-b4-uac-ya-audio-v1-0-2d6e053b7f50@rong.moe>
References: <20261020-b4-uac-ya-audio-v1-0-2d6e053b7f50@rong.moe>
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
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[rong.moe:email,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

On Mon, 19 Oct 2026 22:18:21 +0200,
Rong Zhang wrote:
> 
> I recently got two devices with insane volume control, so I tried to
> measure their volume mapping and add dB scale quirks for them.
> 
> PATCH 1 collects the code snippets for dB scale override into a helper
> function, with unified info and warning messages, and also deconflicts
> playback dB scale quirks of DragonFly.
> 
> PATCH 2 applies the MV-SILICON linear volume quirk only to the affected
> mixers, instead of the whole device.
> 
> PATCH 3 adds dB scale quirk for an AB13X variant.
> 
> PATCH 4 adds dB scale quirk for the Xiaomi Speaker Mini.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Rong Zhang (4):
>       ALSA: usb-audio: Unify dB scale override
>       ALSA: usb-audio: Apply MV-SILICON linear volume quirk per mixer
>       ALSA: usb-audio: Add dB scale quirk for an AB13X variant
>       ALSA: usb-audio: Add dB scale quirk for Xiaomi Speaker Mini

JFYI, I postpone this for 7.5, as 7.4 merge window was already opened,
and the code change amount is slightly too big as a last-minute fix.


thanks,

Takashi
