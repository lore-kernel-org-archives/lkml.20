Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610010;
	b=h96PKyHV+nISFsyN3z2Uia+zOmyqwjIrtWguW7WjJEtlFU+QKhAl/hKTtnIqpkTys7iU
	 Ufc+WZbfS1x5/9Mr1eu+euKbUu9ojkMZctZiRuYpsLwLUOwXkoNFM/qLTJlmjgK8Hywds
	 mD/zv7U/qh5Pp6VBpQEmIh4dHdSTYfKiewR/SlhGEPVolrDkE6Pvid2zyVAsuQg3kvA/0
	 z8XyG8bvdmCW4mPPYz7A3c/Zu213IoCnK3Kx3sAgq3zP2RCHkqvy/hKllgqZIS1fQxKKd
	 cul3CxUIQKYnYdDglFiWv6HTT85FQNJgZDPvfGH91pRMLsyLYG0Fw0rHhPrxqEDq75A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610010;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=57BiYOXdOi8uKNsKTxyABVWaUaY+V4fc2euaOk5k4KM=;
	b=V6c3ofFhBx5D8oDVpb4xoNwhARrH0aHg7aQtkQx2WU2L2osZG7Mim2RKHHrQKBkbQXGU
	 kJ+3kymGBpEI59tPBSBLPhExrFPu1/55Yarh4DISm+mr3PrnDpPabKGIzevqGFjPtr9Vg
	 6abepta+MkJNZw2cByDc8iJDPxyGBsaae6PUyi8LRcuekcSFp+MWWNNItfIXuNmBHygaW
	 ZfR1jk/36bso0s8bU7h0w5hB5U52sW0hMHPxSm0Z3AvpcDvN233kXskncxe7CN3WmVXVz
	 kivgpe5b0uSPIaPeq/4MY5FQ4CafYhv0sbNjrhuamZHfYhvofW5HZKbllzt+UKnEx+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="FNY8/VdP";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6jA1WgW0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="FNY8/VdP";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6jA1WgW0;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A79606A333;
	Mon,  2 Nov 2026 09:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64A79606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FNY8/VdP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6jA1WgW0;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FNY8/VdP;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6jA1WgW0
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 83876222B7;
	Mon,  2 Nov 2026 09:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793610008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57BiYOXdOi8uKNsKTxyABVWaUaY+V4fc2euaOk5k4KM=;
	b=FNY8/VdPl6jRayA3Go7XyVATXkMA3YHP41BzvYg/FJwwaxGy5f4Dq3VuwclK/ChBYLMdY9
	l5RGU78ABBIgdmNMH3eYq89TxnOc1eLN0x5GcEpf8lOTDDUKYvT5FTov4dU/8g57rwP1j7
	E2ML55EWILvtlhTxNTIJbkhEjb3GAVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793610008;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57BiYOXdOi8uKNsKTxyABVWaUaY+V4fc2euaOk5k4KM=;
	b=6jA1WgW0bl/+wJCuHWw5yj7yjLoHo8IlOZ9EVIliyrW3TgxcaS4XrsLIra0A5xIMJ6TNN9
	49xzfuiyQW18rRCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="FNY8/VdP";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6jA1WgW0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793610008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57BiYOXdOi8uKNsKTxyABVWaUaY+V4fc2euaOk5k4KM=;
	b=FNY8/VdPl6jRayA3Go7XyVATXkMA3YHP41BzvYg/FJwwaxGy5f4Dq3VuwclK/ChBYLMdY9
	l5RGU78ABBIgdmNMH3eYq89TxnOc1eLN0x5GcEpf8lOTDDUKYvT5FTov4dU/8g57rwP1j7
	E2ML55EWILvtlhTxNTIJbkhEjb3GAVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793610008;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=57BiYOXdOi8uKNsKTxyABVWaUaY+V4fc2euaOk5k4KM=;
	b=6jA1WgW0bl/+wJCuHWw5yj7yjLoHo8IlOZ9EVIliyrW3TgxcaS4XrsLIra0A5xIMJ6TNN9
	49xzfuiyQW18rRCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CD0C134B8;
	Mon,  2 Nov 2026 09:00:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VQVFBRhR6GoHUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Nov 2026 09:00:08 +0000
Date: Mon, 02 Nov 2026 10:00:07 +0100
Message-ID: <87cxsn4nhk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ingyu Jang <ingyujang25@korea.ac.kr>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] ALSA: ice1712: Make chip_init helpers return void
In-Reply-To: <20261101172134.3451066-3-ingyujang25@korea.ac.kr>
References: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
	<20261101172134.3451066-3-ingyujang25@korea.ac.kr>
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
X-Rspamd-Queue-Id: 83876222B7
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Sun, 01 Nov 2026 18:21:31 +0100,
Ingyu Jang wrote:
> 
> snd_ice1712_chip_init() and snd_vt1724_chip_init() always return 0, so
> the error checks on their return values in the probe and resume paths
> never trigger.
> 
> Change both functions to return void and remove the dead checks.
> 
> Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>

This one doesn't apply any longer due to the recent change.
Could you rebase and resubmit only this?  Others have been merged.


thanks,

Takashi
