Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812473;
	b=xxwg1vdkkneLvs2nJFdABe4sLtZUU+urgMSXrfJhtpETVwWbRDTr/Zx7y/xyimrKScPi
	 i2hXpWjISiPkhLIA1wbg+LzX5Mr81cx/KselNqxyOpFgmY5/Z2yoDLTIeLamxdbKiHvV/
	 WyHaSJyDYKYbVupUtbRp8/z3zOV5x/TEwOMeqjHW7/Gy91MINc/t1KlCx+CqJZa2hKqAg
	 EHZmVgjWa62eFYSP+k9HPwgpez6PbLQ96ZCeXcxCsbzRRq7ubsapufkZUpHRcG7q4BShS
	 MpuDuCu55tlLQxPFGdrQxeKXvuV1YORwoZ+2oXvZ7a/7MWUkDMP2deBcqE3S0nOiTug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812473;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=KK3mtgPRaIXVNpLsRScDcf1MaPAwGgkseQZjK/OSWLI=;
	b=A09hEhVc23L+1gRB6TIQ5BdqtEUfnYUeihR8gaz+Y+ZK2XHZO6l4C6n6PkHo2pwtpve2
	 vlc8qRDDp2XPFKCPa2Pd6pq4h5qPVxBSgxMbuXrH2whV7kzW4U3bufMHsctYW+vOq560d
	 9Q4A4s5cAgU8jiuYFEwidI+pZdtw5pU36lbE70wZ+vzmEmzaXlFty4Gl+veGPt+Qlmimu
	 22TAIwIVjCfZHU0xkTIBl9ugjTFsEVxRge8TWdwyubzazXHdhnGXeoc7rScOxoIpsRQAX
	 tOrZpFQm+Q9n2hf2Kag7V2ywcaqQyGSqfsyRJrA44N7AgO7G1Ouieu4+Hpxaaw0mmHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fou3cc2B;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xbl2hErt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Q1ekp3fV;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Sd5WdOHE;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB279606A326;
	Wed,  4 Nov 2026 17:14:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB279606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fou3cc2B;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xbl2hErt;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Q1ekp3fV;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Sd5WdOHE
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CFD6521EB2;
	Wed,  4 Nov 2026 17:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793812471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KK3mtgPRaIXVNpLsRScDcf1MaPAwGgkseQZjK/OSWLI=;
	b=fou3cc2BZobMVUer9udZTpJPe2LlHpHT3Zn3gir5B6vjfflK7S9CKOoAX7VypKIJp8ITU/
	XQVDCgh3qW4VBaKv+LYV4SjxhCidc8SFvjWBP3xSa7JV7tXNXAN2WiDNO3sW9Er2vrkB90
	dStjw/DmoySPWvBeEdJzBkav9fQ7Rlk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793812471;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KK3mtgPRaIXVNpLsRScDcf1MaPAwGgkseQZjK/OSWLI=;
	b=xbl2hErt8EJYShD+c3M7ZUydXHsrKcuEZ59gtGazLcrUqdWjbWo5bLc11PwnbUD7dVE9Mn
	Uv7EYsJMtBO6ILAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Q1ekp3fV;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Sd5WdOHE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793812470; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KK3mtgPRaIXVNpLsRScDcf1MaPAwGgkseQZjK/OSWLI=;
	b=Q1ekp3fV6x35E/ndrr0YbnuynFTnjU39ZTDjdTc4VcfinvkR1v1+NawPhB+o2Rg/zRMydj
	rK5DSAVi629ktKcaO8yROCFkUHK0iU2TXwAxSl2pQr3KgGVS9J5hdSHfPBX6dXrAe/hTHn
	tdOlCmzUeAteXphyQJdIV/y55BuLiAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793812470;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KK3mtgPRaIXVNpLsRScDcf1MaPAwGgkseQZjK/OSWLI=;
	b=Sd5WdOHEczI+Lb3bhCQpqszXKphpyQtm0uO+cLD7uhdhFmJs+UMTg2fWDjp4DaQ1/l6jWt
	BGJnj1X0SdSG+ABw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 81835134A5;
	Wed,  4 Nov 2026 17:14:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hKvLFfZn62ppHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 17:14:30 +0000
Date: Wed, 04 Nov 2026 18:14:30 +0100
Message-ID: <87ecd0tt6x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Deukjung Kim <mentalese@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add Arturia AudioFuse 48V/Main mute mixer controls
In-Reply-To: <20261103113138.39209-1-mentalese@gmail.com>
References: <20261103113138.39209-1-mentalese@gmail.com>
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
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: CFD6521EB2

On Tue, 03 Nov 2026 12:31:38 +0100,
Deukjung Kim wrote:
> 
>     Add mixer quirk controls for Arturia AudioFuse (0x1c75:0xaf02):
>      - Input1 48V LED Switch (wValue 0x0001)
>      - Main Speaker Mute LED Switch (wValue 0x0500)
> 
>     Values are written with a class MEM request to entity 0x46 and the
>     initial state is read from a 178-byte status block of entity 0x47.
>     Protocol reverse engineered from Arturia AudioFuse Control Center.
> 
>     Signed-off-by: Deukjung Kim <mentalese@gmail.com>

The patch description is indented wrongly.
I guess you didn't produce the patch properly but just pasted git-show
output?


thanks,

Takashi
