Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813462;
	b=oexec2Oo1clp/74x7OH/9VRRe2p6cTG08D1Qu2zKw5TARvZSr7016kKOOP6GC/uy++wn
	 q7gooVX4IoDKfQDJmSBkBEb3f9r5ZAzpUxVzfSSQSQ1LIuIChZMqYnaas984Mah3ZAVlS
	 hAppsI97/jws0AlIa+C1vIpZ6VZycjJWsjUqxNdVQ3AWXbL/K+7p9Z5soYs2THumOWNAZ
	 +nFIxUS6zxO5kY3TztuQouzdFUWGQdpvdHQpsm0+6Zfh1E981bLcM1A7CkRh8DSL7+ivA
	 zqv1h84Ny/g1qtEeGMjPxwMqOldJVxOxPR9isSlGE+922iTXOH1NHrWzBeINjclFnrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813462;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:
	 X-Spam-Level:X-Spam-Flag;
	bh=OZobk/NGTcANriPsPutF2I2SAiaHc+3u7UL8mja7RRE=;
	b=amzUYGPOtkSlYMKDOkBHxsM1Pp9cSTSMzC3GXV65JbJ0zcRBpfdqACUuO15ZCCP1ldhg
	 KmflqgDJpZ3l9I6Tjvs+bo35LAM1yFkgQ3vDsIsYtLo14AkpifkjHKqTAzlCzg0JzUUBD
	 SUWl0hr3hX0Hs4fxjyj0nPpBDpF2v8x2sgNt1cNZXGOTt/890hWlGeFBiqr1KRlsxJlGK
	 G/nYHFeGYuI9mFVNh6KUI82heqbw9GtxHiR5Fkd/S8V+2ZJo2B4WSsJXD7APwvaUlUOa7
	 ZgN4a3CRmj2A6H18WbTNvgj/2ZPEzcWFAZtQndBcvOnRA+9OGQk4vsybBedci3IWDiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AnxVIpyW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=g2aWAKnB;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AnxVIpyW;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=g2aWAKnB;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE857606A334
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE857606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AnxVIpyW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=g2aWAKnB;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AnxVIpyW;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=g2aWAKnB
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 986E71FCD5;
	Mon, 16 Nov 2026 07:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794813453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZobk/NGTcANriPsPutF2I2SAiaHc+3u7UL8mja7RRE=;
	b=AnxVIpyWuT9z2tQw4KKznL1KYD+izZkhy1Ocywcs883vt+KZ8/WJ96vhqwMUxiN8gAxtCw
	3AHI6NAT+cU3vdX0tUu5UImzcEKW/JclRpKsTjod2tR9VaYk0hQ6yTWPwLoXbn3Vi8eox/
	Jwzgr8TxukiAUK2ZrkcRTQOH2ZC/auE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794813453;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZobk/NGTcANriPsPutF2I2SAiaHc+3u7UL8mja7RRE=;
	b=g2aWAKnBooUidahSY8Ijv9GCm2Lfane2EmwmvieEMKKTjZIA4sXBG5EWgMFbBd1gZA5zdn
	HeUo3ViOQgksZ5CQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794813453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZobk/NGTcANriPsPutF2I2SAiaHc+3u7UL8mja7RRE=;
	b=AnxVIpyWuT9z2tQw4KKznL1KYD+izZkhy1Ocywcs883vt+KZ8/WJ96vhqwMUxiN8gAxtCw
	3AHI6NAT+cU3vdX0tUu5UImzcEKW/JclRpKsTjod2tR9VaYk0hQ6yTWPwLoXbn3Vi8eox/
	Jwzgr8TxukiAUK2ZrkcRTQOH2ZC/auE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794813453;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OZobk/NGTcANriPsPutF2I2SAiaHc+3u7UL8mja7RRE=;
	b=g2aWAKnBooUidahSY8Ijv9GCm2Lfane2EmwmvieEMKKTjZIA4sXBG5EWgMFbBd1gZA5zdn
	HeUo3ViOQgksZ5CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 21803134B8;
	Mon, 16 Nov 2026 07:17:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NeFFNgyu+mruHAAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 16 Nov 2026 07:17:33 +0000
Message-ID: <993e9ed5-5f5e-497b-9afa-4e449ee156c1@suse.de>
Date: Mon, 16 Nov 2026 08:17:32 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/17] nvme: Implement cross-controller reset
 completion
To: Mohamed Khalfella <mkhalfella@purestorage.com>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: Justin Tee <justin.tee@broadcom.com>,
 Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
 Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
 Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>,
 Randy Jennings <randyj@purestorage.com>, Daniel Wagner <dwagner@suse.de>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
 <20261114030454.2836543-10-mkhalfella@purestorage.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261114030454.2836543-10-mkhalfella@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-13.29 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,purestorage.com:email,grimberg.me:email];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,kernel.org,nvidia.com,purestorage.com,suse.de,lists.infradead.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,purestorage.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.29
X-Spam-Level: 
X-Spam-Flag: NO

On 11/14/26 4:04 AM, Mohamed Khalfella wrote:
> An nvme source controller that issues CCR command expects to receive an
> NVME_AER_NOTICE_CCR_COMPLETED when pending CCR succeeds or fails. Add
> ctrl->ccr_work to read NVME_LOG_CCR logpage and wake up threads waiting
> on CCR completion.
> 
> Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
> ---
>   drivers/nvme/host/core.c | 51 +++++++++++++++++++++++++++++++++++++++-
>   drivers/nvme/host/nvme.h |  1 +
>   2 files changed, 51 insertions(+), 1 deletion(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
