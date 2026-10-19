Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428969;
	b=KogjH784ci4qBvPOpm9uNrcYuno7/PrBQDp8jJPP+7ErRGw+Rd82XQBEpd3T/dxRw7+l
	 qB+NVNwsvNHu6KON+vbOO4HZeC/v1s1Adx8rdznUW9CeRoQnhA3W6IHI6qCDmK2nus3+l
	 58F/fOW6hBzQB5HJbjdX03hNJlcfKdJytKBQJrkPARu2rtBzClrYca3u91lIk2gzEPl9z
	 tBLsuvNxT17f1lOaM4OiOIxtDjQDW8E51Rb4jBZfAoFl7ffaNbAox92I5WiSyItyiLuq1
	 diYhO9v8G+J+TvYtAT04Ovr0Mybcqu006Ys3Ehf9TZHfmkq4ex84FFTbynqIdjcTiQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428969;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spamd-Result;
	bh=1HvB4Y2zBxs7WYLMe29I4Dl34Va5y8vlRI+QEd8b7R4=;
	b=228vSmnYXZ9LBbYCxejARAvARJQ1LQ/KBE2TQjEY4uJxTO7XChKVutuJy0QLuEPJhyv6
	 QNx4O+PezryhxlwxlhQ6BmZ1DKbU2ofJarJodSxL8/CipNdhjNOsVFDbNDTZy+xCbHTrw
	 jeNgZDaBHnhVu1NgIx8qbK+zmQi4cWlTl5L+BKw+3/xibPduILi1UxkqimVFj+FNXOfLZ
	 0alQh/pBBJx5LiUnnNrQl8Qv0c0Pp8/h/Nb5kpv8ptw1cMkHWmKn1NHcn6AfiKSKIGABU
	 Ru4fgGgQEnkdAXyy9o0JqByLryWXnZ/v2PfAbn0Za/OuqwUEdvaaC1BvfTlC45ZVCMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mGj3SyMj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZQJR8Txv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mGj3SyMj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZQJR8Txv;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0F160A2613
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D0F160A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mGj3SyMj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZQJR8Txv;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mGj3SyMj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZQJR8Txv
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 69ADC1F45B;
	Mon, 19 Oct 2026 16:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792428967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HvB4Y2zBxs7WYLMe29I4Dl34Va5y8vlRI+QEd8b7R4=;
	b=mGj3SyMjP0fAAairHpxyFpnOyTkxAYPb/HIetE9Op738WMLug2ldCUW6QZwtfgKWybbn03
	sK8D2bhRafWC7O8olV+LWbM9UMVHJskbHs23qVfw9oYm/MOB6c31rQrvDZ3E2IWHtkd9H/
	5GNIWzDYyzNL7DSqPLXhCVnOqxJKWQQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792428967;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HvB4Y2zBxs7WYLMe29I4Dl34Va5y8vlRI+QEd8b7R4=;
	b=ZQJR8Txv95QmdQn0ETZILeVvPfyy2CaO86qJdLQVDU+SLahzBeBxa2UnCDhhrsYQuL2J/A
	RJB15J0hhItbLiDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792428967; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HvB4Y2zBxs7WYLMe29I4Dl34Va5y8vlRI+QEd8b7R4=;
	b=mGj3SyMjP0fAAairHpxyFpnOyTkxAYPb/HIetE9Op738WMLug2ldCUW6QZwtfgKWybbn03
	sK8D2bhRafWC7O8olV+LWbM9UMVHJskbHs23qVfw9oYm/MOB6c31rQrvDZ3E2IWHtkd9H/
	5GNIWzDYyzNL7DSqPLXhCVnOqxJKWQQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792428967;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1HvB4Y2zBxs7WYLMe29I4Dl34Va5y8vlRI+QEd8b7R4=;
	b=ZQJR8Txv95QmdQn0ETZILeVvPfyy2CaO86qJdLQVDU+SLahzBeBxa2UnCDhhrsYQuL2J/A
	RJB15J0hhItbLiDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2F7D0136CC;
	Mon, 19 Oct 2026 16:56:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /IV6MqZL1mpbBgAAD6G6ig
	(envelope-from <dwagner@suse.de>); Mon, 19 Oct 2026 16:56:07 +0000
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
Subject: Re: [PATCH v6 06/18] nvme: Rapid Path Failure Recovery read
 controller identify fields
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
In-Reply-To: <20260920182936.2317916-7-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-7-mkhalfella@purestorage.com>
Date: Mon, 19 Oct 2026 18:56:04 +0200
Message-Id: <179242896496.3619480.12975259904515722687.b4-review@b4>
X-Mailer: b4 0.16.0
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org,suse.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]

> TP8028 Rapid Path Failure added new fields to controller identify
> response. Read CIU (Controller Instance Uniquifier), CIRN (Controller
> Instance Random Number), and CCRL (Cross-Controller Reset Limit) from
> controller identify response. Expose CIU and CIRN as sysfs attributes
> so the values can be used directly by user if needed.

What's the use case for it? This is an public/stable interface,
it needs a justification and documentation

> Also add the nvme_fence_timeout_ms() helper that derives a fencing
> timeout from the controller keep-alive timeout (kato).

There is no user in this patch, introduce it when you use it.

-- 
Daniel Wagner <wagi@kernel.org>
