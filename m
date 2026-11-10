Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315399;
	b=h63yG1WwiMSX8Gp91tJDhR++0hZ9O53kAMH10FhH64eF4ly371b0WgoNbhJWfCjdMERY
	 19GPkoeuS4bdIgLr6v0d27jdioEiXSGZddU5yh6tGUrNqEvWzKLCCM2SnyyzQuHhFAvJ1
	 mMlzJxK+SqLAa+W/zWEaIT2nkLfHwVQtpVMU1gcXvWntZBCsAeIWtntLMHO4GHE4/kD3Z
	 j10ZGUSleywYtTfdudodYnoClQD1YklJWiBNhK1rluMOkggHSHUUooterrh+VPfWK58sb
	 e7+vu4kzgKnm22cI2BEPjqioG/gIdGYDDKoVfv/v4HpHLIeRAWxRWskPru+FDXaS8Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315399;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=BPT5I+y8uo9yjpkzOY3Iko74xhOAFrTC4kK7nNK/IzM=;
	b=1HimZ7hroCSjLtyheWWPMhWWJnxKqorWVQRd+nbbC42T3vsqBewwPQk335R2u6Ne17AB
	 SsIEGHKGUxpm3VqQl0jC08EiZzOd3Ppg0g8ePDs647hkET5cQJ2P2fU58I3f4Rd9Uv9sc
	 WuuLOQr3FSEtBsrnLkinvXpoYMQMLgEr2LefhA6eaX4L0n+udeA1hAW5h83jcU02Cz7fM
	 2hPQc2dAAiF/c1tRiVuraXV6xq28xYwHbtbWR1Sa3zchjBHoFJcK2C4vgdQuQSYsmRcu6
	 273qDsiIbKS8TzEvZq71Lsk1TqAk+5JdKAgT+lCZb+BECEI4cqkerxqYQJZhUgOx88Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="NHvJhY/3";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="vwx43/zW";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fl9BUuuZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UOMOAio9;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709F260A260A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 709F260A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=NHvJhY/3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vwx43/zW;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=fl9BUuuZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UOMOAio9
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 69D9F21ECA;
	Tue, 10 Nov 2026 12:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794315396; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BPT5I+y8uo9yjpkzOY3Iko74xhOAFrTC4kK7nNK/IzM=;
	b=NHvJhY/3Fq8U+z/HC1L1oLOsbIMa9q9z8IV4IsyovmsVYroa6xI8ZIsiOMsZNGVdmc6r8m
	MnfTYraYybxLXsR+3FNBqJRzq3hKCFqygT6tMmz0H77YPRudpRMpWIlKEiFNJ2LB+vEqXZ
	5ij6jZuzsgq5Gk3MnN/G8q/jCFa0Y+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794315396;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BPT5I+y8uo9yjpkzOY3Iko74xhOAFrTC4kK7nNK/IzM=;
	b=vwx43/zW7gJ7F5Ny7rLZGFoPhXOxZ7tTSSojTnV8mWQLj3hXHdCJEAJcBxqDLHLCKRTORE
	jvZAf3PPjETx+qBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fl9BUuuZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UOMOAio9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794315395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BPT5I+y8uo9yjpkzOY3Iko74xhOAFrTC4kK7nNK/IzM=;
	b=fl9BUuuZocYsoopqQCW53BVGvAF7GUD7+Ejurj5fGtUuTHYuh9NBHJUaewlHlyMvANrnJT
	q81yP5Y8DiYA9z7fbwcZshiG69Yr36ntkUczpHp6WvLfNhpAQjdIqyPnBKDG6KN3SMfRQg
	chnuP4K/ma+5j/DyTROJQdVD67snKOo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794315395;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BPT5I+y8uo9yjpkzOY3Iko74xhOAFrTC4kK7nNK/IzM=;
	b=UOMOAio9TMonEel8PAsU2Qd+GBFs4CrOTsAyEFZi5+Y5tsPLg/pKdCmNRvh0T6Lz4SMiVk
	x6rgUPWB2q2CxGDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37D951339F;
	Tue, 10 Nov 2026 12:56:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0SsVA4MU82q4QwAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 10 Nov 2026 12:56:35 +0000
Message-ID: <b0671c91-4fcc-4bea-a2c7-1029a54a53ad@suse.de>
Date: Tue, 10 Nov 2026 13:56:34 +0100
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
Subject: Re: [PATCH] nvmet: drop the redundant auth check in
 nvmet_parse_io_cmd()
To: shao.mingyin@zte.com.cn, hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
 linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <20261104211446891tN1QRJiKV3CLPQqfb7gJu@zte.com.cn>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261104211446891tN1QRJiKV3CLPQqfb7gJu@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-13.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -13.50
X-Spam-Level: 
X-Rspamd-Queue-Id: 69D9F21ECA

On 11/4/26 2:14 PM, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> nvmet_parse_io_cmd() calls nvmet_check_auth_status() and then
> nvmet_check_ctrl_status(), which performs the same check again.  The
> first call cannot fail either: this path only handles commands from I/O
> queues, and nvmet_check_auth_status() returns true unconditionally for
> qid > 0.  Drop the duplicate.
> 
> No functional change.
> 
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
> diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
> index a8171b88035c..12b82bb7e412 100644
> --- a/drivers/nvme/target/core.c
> +++ b/drivers/nvme/target/core.c
> @@ -1120,9 +1120,6 @@ static u16 nvmet_parse_io_cmd(struct nvmet_req *req)
>   	if (nvme_is_fabrics(cmd))
>   		return nvmet_parse_fabrics_io_cmd(req);
>   
> -	if (unlikely(!nvmet_check_auth_status(req)))
> -		return NVME_SC_AUTH_REQUIRED | NVME_STATUS_DNR;
> -
>   	ret = nvmet_check_ctrl_status(req);
>   	if (unlikely(ret))
>   		return ret;
> 

If you insist ...

Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
