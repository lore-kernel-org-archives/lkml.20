Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716945;
	b=k5nVQZLrg5DTLdIGn1aJoW7TrO4hyxBK2Fwf7WVLkDpkJS6aYTZpv221LyWyD2SNpJqN
	 v8gHyJKRbrFksV2Lp47savNkfUr+gHxjpBYqw6T/a39JkKfRcepwbGT8K4X36eMNYw46C
	 ehYhGQd0CjZHEPaimMRcHxuBdpC4DFGXMcn3/XIhR3kUoNbqIZo0Mkyy2Oejh3rD5MLm9
	 /r/NHO5TwI6qOybO8dWZKfefkMTIDaSZAYm+kViAybBkKuul2Ro2hKlKGkRVrFFu4nhiN
	 4K2sR9BptLnxXSZWaPFwX5vMrWCiRJI91nU9+cW1SAtMhSsDagq/swi9EkKMtXrjHEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716945;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=T6/q6QjCoLJn3pJStx+qUEEr8xGJyJ+1T7hFKQ1zg0E=;
	b=KAYR1c2gCfX7j6wbabwCRkPiju17B5bO+lvcCpbTxahDJzi0pUD8sdoUtZo18flTqiQ7
	 6DtNAWxKucJkKWRA4odwyzqms8lwyl/Y9sotDfgxS6ilFREP5BRyUeUIQLJfiGDYy8rIz
	 i7munm9GjGAk9gvl7vSjIEvZZ2wkb5mAJZ4csj+rdwLyqBOkZoHRntkGdDcPTFlimzlxl
	 MaBIiXjtBnKmayxNRFyRZ7QyaVoTlSCZQgN27GTNcOwqPICUNGPz2fcVvq4cZMQAdAvcC
	 lKtn2KbrdIR8Bp8Fmq1UlacvCVJMFkqSkGj5xNqSZPv/RGeuy+jXGHJSomyWET/kvXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RCV6t8xM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Cj3eoL6+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="us5GvG/C";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6XmP0pS6;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14E1606D83B;
	Tue,  3 Nov 2026 14:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D14E1606D83B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RCV6t8xM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Cj3eoL6+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=us5GvG/C;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6XmP0pS6
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CD64F1F745;
	Tue,  3 Nov 2026 14:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793716943; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T6/q6QjCoLJn3pJStx+qUEEr8xGJyJ+1T7hFKQ1zg0E=;
	b=RCV6t8xMHNw8cO3lvHKLb91Ht9fJD52yW+U6BepP66XiPFuXyBuEIub65PPwLBCfaQo6CX
	fOq0drUvozhU5r35hTaF0rVjwkNpoFfen7UdnO948qxLlDkpT8EM8bYYyGcqG7zg43/pg6
	FSGnMEUj28HEp2JzJRa4REU67P16KPU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793716943;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T6/q6QjCoLJn3pJStx+qUEEr8xGJyJ+1T7hFKQ1zg0E=;
	b=Cj3eoL6+GJIJYCEyItg3saQWy2VkYdpcSOM45e5NgjeRoIxKbicLv/IrOMgRONWlIlOKOO
	tNlJWnsRTpDDdLDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="us5GvG/C";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6XmP0pS6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793716942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T6/q6QjCoLJn3pJStx+qUEEr8xGJyJ+1T7hFKQ1zg0E=;
	b=us5GvG/CzvuM4qLxOpJVOP8r8AQf60FnxHcsiGPJyUegw2CbczzdCswprBDk1fsaAQ+C3D
	yxQ0EOYF6f31tQoiJ+bGsj5ITzt/FvJnkviPGg2GNRVmp0eAwCNKHxq+jc5FQsiilBVlMg
	F1lZ6mmuxif8jDU/gX0LpMOVJHDT1vU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793716942;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T6/q6QjCoLJn3pJStx+qUEEr8xGJyJ+1T7hFKQ1zg0E=;
	b=6XmP0pS6OBrR8iMlcPjlHhiYEEx00vT3NszrdSWzT0RK3pjBGJf60o8lfGZmImvrh5fAxg
	JFyPJTJ5mSd9meCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EE37134B8;
	Tue,  3 Nov 2026 14:42:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G7pZGs7y6WrEDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Nov 2026 14:42:22 +0000
Date: Tue, 03 Nov 2026 15:42:14 +0100
Message-ID: <8733tix9h5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: tiwai@suse.de,
	cezary.rojewski@intel.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	rosenp@gmail.com,
	tim.bird@sony.com,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: pcm: Fix source frame count calculation
In-Reply-To: <20261103125211.3484-1-sreekuttan2156239@gmail.com>
References: <87pkwn8ebe.wl-tiwai@suse.de>
	<20261103125211.3484-1-sreekuttan2156239@gmail.com>
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
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,intel.com,vger.kernel.org,perex.cz,gmail.com,sony.com,suse.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: CD64F1F745

On Tue, 03 Nov 2026 13:52:11 +0100,
Sreeraj S Kurup wrote:
> 
> Hi Takashi,
> 
> I would like to kindly follow up on my first patch.
> 
> Could you please let me know if you have had a chance to review it?
> 
> For reference, here is the patch link:
> https://lore.kernel.org/all/20261102135034.2751-1-sreekuttan2156239@gmail.com/
> 
> I would appreciate your feedback whenever you have time.
> 
> Thank you for your time and consideration.

Don't worry, it's still on my TODO to be processed :)


Takashi
