Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427493;
	b=a/uzToLGgNXXqSJGC0yc4xTTbn8vurSFvZWhYuOveCs97ECH9rlp8gPOZycbww/UzoOo
	 G7KsLN7YmcFaA2sCBtlu1FWdHtgLBTnBq+m2HptK9UAn2DhO6BvAvgWgsYPPVP0R/UKCG
	 LesB3wlv0cdmuIKmkhl+ED3Yl16io8+iVNkpfPyv8Ib2qU+XCPzg7q1RD9RfQneQbINYw
	 41AdXFWdfC8yZoLZnJkl3Tbz+/doTi3grrTMb9B0eCVwtltqhlOdexG1cqbxxE9Z2I183
	 Rg/fMPr+HTNZF1hv+TJ7mYseCdyYpsP+DqdzDHG5X+m+o9KNDr4RQiwZVFY1lzBHVRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427493;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Rspamd-Action:X-Spam-Level:X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=B7yKnfAHa1v9LGP7+XQTfNitsFqTEJMzZVT63Vgda8I=;
	b=wV257H3tslWmWYW2vIrusqE686qA12Ortwuw3aHCfmbHlzL9j77aBHVSWIjIzOAn18EJ
	 C4W2F2U+mAQWLNheCIWcm0ph4E469o6vRuNQ/b0JfvXbihYe9olOGOXlDPTmA8Vs1t+KX
	 ywUtRX4dJcXoz97VrqWv50P4hAqh0tzdiixFIZwMlTVRc813vLXaLuePaGBXScrOLlfS+
	 hguaKd3VCgXFJtDchZvURVzDgjNNcFsWKoMaQJFxIkUFcKMVGY+VabKKBtQ9PYMZjSE+I
	 vR6iAoe0DAwG7yK+bN7PKI5hEgSb4Skjs9bj4aPsNDWGSF/PljkPzQb6GuDNcoTieQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=B1N4q3FF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sXlFMUUu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="wadop/V8";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9eStKV0R;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1B6606A320
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D1B6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=B1N4q3FF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sXlFMUUu;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=wadop/V8;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9eStKV0R
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1543121CFC;
	Mon, 19 Oct 2026 16:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792427490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B7yKnfAHa1v9LGP7+XQTfNitsFqTEJMzZVT63Vgda8I=;
	b=B1N4q3FFEN0cEUnHjO+0x3zR1YFaSlQRfUWYn2hl9qTJWTtJEh6bdQsesJ2Lfsq3/OzT3C
	T6E8Ia3/WGcmBJ5M+nwUODy1TpNe23xZm274bNnx8TAJ3wsNcdWXhDWYbpWlbm7z0SZEve
	6NKOqZ8CpFGLuNnYCHFhg60U5gwOZvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792427490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B7yKnfAHa1v9LGP7+XQTfNitsFqTEJMzZVT63Vgda8I=;
	b=sXlFMUUudGaLkEYbFgVW9Nd0ZiwsOgQo8cvBnuHrczvPUcl6oAe7EUBsmLuwqUGKXV40GB
	mO55j/aYCXUpq9BQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="wadop/V8";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9eStKV0R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792427489; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B7yKnfAHa1v9LGP7+XQTfNitsFqTEJMzZVT63Vgda8I=;
	b=wadop/V8PdksECiRJ+ZxP7GN88pWMCJL4pz9dPw1SdHI3jnfbzSlJnmF94bE5mOEw4wSjs
	QKIXMUBT8v5OUyGoM9xLXs48TvToI84+PA6p15PnVN+Atp+fugNALmp5ALHVdRc82xU9+Y
	J/gK2YksN2ysps/1QSedrocn4FVIVww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792427489;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B7yKnfAHa1v9LGP7+XQTfNitsFqTEJMzZVT63Vgda8I=;
	b=9eStKV0RTfFgYdA3saGtZpHWCvtdltoZtfLwgLva3zfn9Jv0SFkQ50LBiseKNe4QD9ZEQg
	ZlLoOH+PznFSr0CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DA5B2136CC;
	Mon, 19 Oct 2026 16:31:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dicoL+BF1mquawAAD6G6ig
	(envelope-from <dwagner@suse.de>); Mon, 19 Oct 2026 16:31:28 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 05/18] nvmet: Send an AEN on CCR completion
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Justin Tee <justin.tee@broadcom.com>, 
 Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
 Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
 Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
 Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260920182936.2317916-6-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-6-mkhalfella@purestorage.com>
Date: Mon, 19 Oct 2026 18:31:14 +0200
Message-Id: <179242747494.3619480.8696467521098938874.b4-review@b4>
X-Mailer: b4 0.16.0
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1543121CFC
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org,suse.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[purestorage.com:email,grimberg.me:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -4.01

> When an impacted controller that is the target of pending CCRs is torn
> down, send an AEN to each source controller that issued a CCR against
> it. The notification points to the CCR log page that the source
> controller can read to check which CCR operation completed.
> 
> Split nvmet_add_async_event() into a locked helper so the AEN can be
> queued while ctrl->lock is already held.
> 
> Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>

Reviewed-by: Daniel Wagner <dwagner@suse.de>

-- 
Daniel Wagner <wagi@kernel.org>
