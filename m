Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575339;
	b=uAiEpxAdwG1TFhQfJWILNooJkdjdXouELG4q7qb0eFCNTVPDdlNyNuF56sEWtW5wSjDq
	 NlQRndwueyDJqDJPHcLYavY8Xdk1Vh3fvNNOaJhDs6iU+FKjx08mFdZbgceh/l6x4vWKJ
	 6J7A0d5eLHi6pViygp11QsYbQfYRLsOhc/RysoRaWfpuraCdvsIxy/xVEeJ2P0sSzN8m9
	 Y37Hw2GQI22HYwVvlEm2inGsE1cG4WsoBjNq+OjaAK7h8oFYWxljiYguDrwEgnt5LnHHb
	 zTYR8xJVljOXlhGyIKzO25GGKwYk1RIkBwssHEyjuL7U71JpJmnnv7yC8JZRSp+f0LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575339;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Action:X-Spam-Score:X-Spam-Flag:X-Spamd-Result:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Server;
	bh=FDrIGCCegY9tFGkUW0wG/fsYFo4i4TOZGdAKPrq8uwU=;
	b=IaNi9aihuTeSYgAkmx+MbtKoS9rJ2+juSzLv/qt5F9Lbn0GDa/iB++7Lsesb6Z1Z3cQe
	 BxTW2ykKid9UbxxRyHj2QoB6hZo5Jda2B09OUYUDUUNEsRE/4/K8s4JWnHB39UFnEAO9V
	 SvxO/qGcRNRO+hOicnCAiy9vd9N/pDWuXDc5VbXX7gEWYmvABNhB6VMojF5uLcXtbv8SB
	 bokPErmHDcVpIetm0OezZRyW0pT7tSlgHTDPtTBP+7R/lEtVEmePqqxNpquI9oT5rdT8h
	 hglF0RVl03+1lrXgc9pX+GM/6zHRLimNl+qZF2MIZnn8f0i9QNkzdMy/MKChXtt8dQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mMp3owsL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="dlCWxwM/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jHVvcK0g;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=o0zlWSdI;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBD0606A329;
	Wed, 21 Oct 2026 09:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACBD0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mMp3owsL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dlCWxwM/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=jHVvcK0g;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=o0zlWSdI
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EF34C21DCD;
	Wed, 21 Oct 2026 09:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792575337; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FDrIGCCegY9tFGkUW0wG/fsYFo4i4TOZGdAKPrq8uwU=;
	b=mMp3owsLQCsxkTxDzi/xBll0tAr7I2zazp+0ELiUsZTGbo4fnVie/TUmwQuDalDUVsl6jm
	xcorjHP93XBzT3V31PuQmfV/HtOuCDbAwpmdcbivDZtwVtFW2/22d71MvimnWy2nHanfC3
	Y/xvPWF9nRAo8FV1XaZDZ+ASsA5nErw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792575337;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FDrIGCCegY9tFGkUW0wG/fsYFo4i4TOZGdAKPrq8uwU=;
	b=dlCWxwM/b679miizxRbbnvtE86oMXjjY8aTYnkTUlFFMTsXNpQr0CnoeqP/DFViytGhUfM
	HDPk8P5507AyHLAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jHVvcK0g;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=o0zlWSdI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792575336; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FDrIGCCegY9tFGkUW0wG/fsYFo4i4TOZGdAKPrq8uwU=;
	b=jHVvcK0gj8eqluN36iEb/PkkzosUZtbhdmNsPWvyCuctI+OQkUFT/yqHChPYK0EU3rxjog
	5nHoZNKI8AkIgTM4eQ4wg78UpB+QplQAiCgM9t9KS+rb8zB2xLB+gso8MJlyqLNiUZy3Wt
	l9dg0kRpRMXCscm/wLV5qDHW6MTLees=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792575336;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FDrIGCCegY9tFGkUW0wG/fsYFo4i4TOZGdAKPrq8uwU=;
	b=o0zlWSdIk2mOkxS0hTR/dI3aQNf2IH67QlbtELWYG0tcOkQo0X3bqqcm92+GZ/ggBAOebV
	12iCgvv93AzsTJDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B7AE4134A5;
	Wed, 21 Oct 2026 09:35:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9FBQI2iH2GpQGwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Oct 2026 09:35:36 +0000
Date: Wed, 21 Oct 2026 11:35:36 +0200
Message-ID: <875wyvflav.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: pci: Kconfig: Fix spelling mistake in help text
In-Reply-To: <20261020152816.16820-1-sarkarsubhadip604@gmail.com>
References: <20261020152816.16820-1-sarkarsubhadip604@gmail.com>
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
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: EF34C21DCD
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Tue, 20 Oct 2026 17:28:15 +0200,
Subhadip Sarkar wrote:
> 
> Fix 'useable' -> 'usable' in the Kconfig help text for
> SND_AU8810 and SND_AU8830 (Aureal soundcard drivers).
> 
> Signed-off-by: Subhadip Sarkar <sarkarsubhadip604@gmail.com>

Applied now.  Thanks.


Takashi
