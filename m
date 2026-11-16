Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839491;
	b=yabUWQCckBc79MSXa2P2WG8cYBLi8tSCAOIJWmMU19NoFaqwRvz7XDZsGwWILDh4kTkE
	 1gd1LIptHZQZfv7++8nHOBffmTfeMRYhOfmYPnDaMXn9RvdoB9iHgnYVrNSqdS98u5cwJ
	 lQKSMJ4PcLaK3RiwbmUUEfaM+CQfpTtuW/pG/8BrwQejm+8Yy3C9UmludAIOgPCvMTw4p
	 0qiKd4jTOWQg2uBWsPC3MAgLr+FWVSkFnwzuGmfbPbag6pLdYgyNaXcIF3sk/Htezzwb7
	 kC7oXvZEoPYKbpYv4LhQW0Zlsno8ItsAwVfjdMcMw6+kWA+Kk7+7aAjl1oO/CCKxhgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839491;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=C3yURuvwYHRTcUiCeiNUQxSEWXHl2w1xWIfAoQc74Z0=;
	b=bBD86RLuzezwv9cdjmsgA/6EVtS81rEAHCtAl/H02Zz8MTaHaQ+hXCFvlWz0WH+ym83d
	 TL1Sx2hVHsBJy0XOQwnI8pd98+/RgZ8H0P50r7bQl9Eae8LdGARMOFsdhsWMl301/SmYl
	 JSmABJSZ1kkkC+DB+cvKxPHPpeBojA8lsbsSW3gcWmVQ/j9XB4cSAt8K8i+l3rT9vgZQ3
	 AMXmaimjSxqyzXvfMNYfNN7iealzO89pVgZF1jbdMVZPNHieF+o+F5USN+tezUIr4A/Cf
	 CjIvbpGhfmwbEwSDjQOeITujWe4B+YD0gExQ9c1basn88u5Ekuj45gJIm0yWtcNepow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SdhpFqE1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Rp3Q6KD0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=J0h9s4Go;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LQ6vNA9x;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1A2606A31C;
	Mon, 16 Nov 2026 14:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC1A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SdhpFqE1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Rp3Q6KD0;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=J0h9s4Go;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LQ6vNA9x
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 186AE1F834;
	Mon, 16 Nov 2026 14:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794839488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C3yURuvwYHRTcUiCeiNUQxSEWXHl2w1xWIfAoQc74Z0=;
	b=SdhpFqE1SEg63wLebmU3NYmZm3zsL8iP6bSa8AcUGoq9m3xjJWUzGBchTTROLNkG6WXYgT
	vxJ7ey7UevzLllNpAayecSaA/MwT9uCfZHVfrwYaulzWreDKqxm7scVaODbxTWI5IIwMzk
	dOFtXmJcZ1RqxRnotBfgaU5qBy/zJWI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794839488;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C3yURuvwYHRTcUiCeiNUQxSEWXHl2w1xWIfAoQc74Z0=;
	b=Rp3Q6KD08L3btR80YhMTuQtksyX5btiBmhfWHVGvOexGaGH1Yplvky81COxp8B7pGrziv2
	Q3JupGdNnvmUQPDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=J0h9s4Go;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LQ6vNA9x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794839487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C3yURuvwYHRTcUiCeiNUQxSEWXHl2w1xWIfAoQc74Z0=;
	b=J0h9s4GoAQwcMAApsn+cju6j5UD1FenlkeISgpPer5IDV4Muuj2S2X+M8dhdlr972i/W8r
	iUZ/DziIMcaTulzSuiDExk1+NPz5kiRSdkkxEKyWYFATdjDQmynJpax5dRVol+1pSFPTKU
	za00nTK6KJgtvZa3T4kzD5WcH9Y7PW8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794839487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C3yURuvwYHRTcUiCeiNUQxSEWXHl2w1xWIfAoQc74Z0=;
	b=LQ6vNA9xnQebmbJF7TYCIfPbAR7HvDDTt8VSSz03mI761LfKL6Wn1wJG5rX8ZCTrn9dl9t
	Nr6Urm68GtMgUjDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF3A31334C;
	Mon, 16 Nov 2026 14:31:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yE/2I74T+2oYbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Nov 2026 14:31:26 +0000
Date: Mon, 16 Nov 2026 15:31:26 +0100
Message-ID: <87o6boyhj5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aibing Chen <chenaibing@cmss.chinamobile.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hdsp: enlarge the MIDI name buffer
In-Reply-To: <20261114130220.142-1-chenaibing@cmss.chinamobile.com>
References: <20261114130220.142-1-chenaibing@cmss.chinamobile.com>
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
X-Rspamd-Queue-Id: 186AE1F834
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chinamobile.com:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Sat, 14 Nov 2026 14:02:20 +0100,
Aibing Chen wrote:
> 
> snd_hdsp_create_midi() formats "<card shortname> MIDI <n>" into a 40
> byte buffer.  The card shortname can be up to 31 characters, " MIDI "
> adds 6 and the MIDI number up to 11, so the name can reach 48
> characters plus the terminator.
> 
> Building with W=1 reports a -Wformat-truncation warning: the output can
> reach 49 bytes including the terminator into a destination of size 40.
> Only the rawmidi device name is affected, so nothing changes apart from
> the name no longer being cut short.
> 
> Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>

The real question is whether it really overflows and truncated with
the driver's actual setups.  Otherwise it's nothing wrong in the code,
per se.

Could you verify that?


thanks,

Takashi
