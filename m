Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833F0456E18;
	Tue, 13 Oct 2026 09:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884309; cv=none; b=begY3DezB2oaS04xFcMCqN3GS8jwgI3jRLaVfJtGeHX1DggJtBKA94Dxmxvt+K1kQ/9Gzy/fHbhTtElmKy7SUU5gcz6U1NJXetmbumM1OEQeDNOzCHbrous0Ya/Ktg8vtMtCPXQrD+6of3dTKZ0voppWygGVz5nnto5bvYsVfl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884309; c=relaxed/simple;
	bh=tzVevFuIp4cjG/Mn/K1zL2Q6uNiinODyKAaXGtvaNz8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PS17u5Pij9fRrugRbGiT1NIPRZvBqLiB0NXP1PaAJAOQmVbWs/FoVLKHhb0z0JWosJDBJyBuqu7/guwoW+VEba1Tb54bE+asryDI8Se3J20LhRfiYyzDCIweg2/JtlbcCK8QJDyh9hz6zqq+2Y7AqS4qIjWsL8/gvo+l09+XWaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mKx9E4wy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JRyIjBWV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mKx9E4wy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JRyIjBWV; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mKx9E4wy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JRyIjBWV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mKx9E4wy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JRyIjBWV"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 84DDA22010;
	Tue, 13 Oct 2026 09:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791884306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EOzsbH+earnGxd0l6P8jU1L/wVar+1pkB4F7goZB+0k=;
	b=mKx9E4wyS1dbcAPjfFk6F0mb9iDG0MwVN89VMzdSe1KcDrxrI04A6Tjc8/QLIue3IqTO63
	Vzjj4PZSqV04ijNM5FOfJfSED+GHQv6HnYzu21jWLkNnlQaXm2sS/+xZWnkZUThFDSjg5t
	vk0lA7IT3MyOMZ712pjKdQn/GiOav3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791884306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EOzsbH+earnGxd0l6P8jU1L/wVar+1pkB4F7goZB+0k=;
	b=JRyIjBWVe2trapV9ERtMTWQ8MnSzOdnTt4G8xKqDtzqqf69zpluShkEP+t5G6THHt5QFRA
	8fEKJefdWZrFbKDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mKx9E4wy;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JRyIjBWV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791884306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EOzsbH+earnGxd0l6P8jU1L/wVar+1pkB4F7goZB+0k=;
	b=mKx9E4wyS1dbcAPjfFk6F0mb9iDG0MwVN89VMzdSe1KcDrxrI04A6Tjc8/QLIue3IqTO63
	Vzjj4PZSqV04ijNM5FOfJfSED+GHQv6HnYzu21jWLkNnlQaXm2sS/+xZWnkZUThFDSjg5t
	vk0lA7IT3MyOMZ712pjKdQn/GiOav3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791884306;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EOzsbH+earnGxd0l6P8jU1L/wVar+1pkB4F7goZB+0k=;
	b=JRyIjBWVe2trapV9ERtMTWQ8MnSzOdnTt4G8xKqDtzqqf69zpluShkEP+t5G6THHt5QFRA
	8fEKJefdWZrFbKDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 485BE13432;
	Tue, 13 Oct 2026 09:38:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8aooBxL8zWp6cAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Oct 2026 09:38:26 +0000
Date: Tue, 13 Oct 2026 11:38:10 +0200
Message-ID: <87bj8ygcu5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan den Hollander <johan.den.hollander@finalist.nl>
Subject: Re: [PATCH v2] ALSA: hda/realtek: Add GPIO2 low quirk for ASUS E5402WHA
In-Reply-To: <20261013071255.270131-1-zhangheng@kylinos.cn>
References: <20261013071255.270131-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 84DDA22010
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,kylinos.cn:email,finalist.nl:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 13 Oct 2026 09:12:55 +0200,
Zhang Heng wrote:
> 
> The internal speaker amplifier on the ASUS ExpertCenter AIO E5402WHA
> (ALC256, SSID 1043:3500) is enabled via GPIO2 and is active-low.
> Driving GPIO2 high, as ALC256_FIXUP_ASUS_AIO_GPIO2 does on the ZN270IE,
> keeps the speakers muted. Add a dedicated fixup that drives GPIO2 low
> so the internal speakers work.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221938
> Tested-by: Johan den Hollander <johan.den.hollander@finalist.nl>
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied to for-next branch.  Thanks.


Takashi
