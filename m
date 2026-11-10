Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312889;
	b=aGPSjrJ9rA9+f7cYM6izMMEPYjLxPVgkvBlhmn+r3dWqjC1wCmHys1V5alvkgLH1HdoN
	 sx1rXyJCGx92FzMHZl28+A9DehDthmex4lsPTII1EZD1ptZHvNz1ctTuzhly97O0Dan1J
	 YSJENmSTaxR0gssnBpzGW2W9ycQwxMrvxNHFd4emsoB9y8+grK72UHO8hz+g8gKmZ8D3N
	 BGgylq+g0wZjbkXgnFje4FEuxC9Ox/TgmqK4AWnrJnzrh3ev3imK/q8DfXFHOQF0dXzGY
	 4otJR9OI8kfMrGGgcz16WSZOR0NBUpWM4BRDXdi0rrMoEhChMeTl7hRQb9l1DaE2brA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312889;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Score;
	bh=x5lhyeWppTmeVCGlG4TUa8XBfP0xo9dqljDJjmh0tBg=;
	b=Xsp2NG8EXoIsxrqbkEMGbg5WPVBmvgVD6vJwHseYoU4TMgjWsElS4qtEALQU5FJJTRM8
	 z04FGLHL0XbqtFRa9WYSAWzOe+vHgFuEcWAliqZ/O6zdH1Qz4WQ7NsA/IDL8KjStNwkfw
	 CCJqbGp9FBMm87g/rRnFxngcELmmDrzr4B//LYZagEhmZu69QDgowRl4LkU3IWZaIV4EL
	 RLLwCEbHK8bmZWtjrO2nvEVFiJhqEfW9CWQj9WKH+zM4zxL4BIkO3GHFeBpi91v+2HvTU
	 7keHsm3z18fwCwZO+kOu1nTobVOyyBm5vu+Sr5PQ2O+Ta2tFeNJXR40vwsGLxcDWVFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HhLm2d6W;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="4bH/HafF";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HhLm2d6W;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="4bH/HafF";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661FB606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 661FB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HhLm2d6W;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4bH/HafF;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HhLm2d6W;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4bH/HafF
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 63C4521EFE;
	Tue, 10 Nov 2026 12:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794312886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x5lhyeWppTmeVCGlG4TUa8XBfP0xo9dqljDJjmh0tBg=;
	b=HhLm2d6WOaEowFf+lsUkANYhFaK1ZQe0ijH5djJ8h6/9gKbCquDO5wmMDiHAPfJnpzgWmb
	Y/8siuCSGcEx+umUqFehsSFlqJLEIsQS3B8x80TlFuDUPVRA7TRyt2z3Xc89O+OCM2+AmO
	e0Vvq4039GbsKuu6Shx9GnMPQPseLo8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794312886;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x5lhyeWppTmeVCGlG4TUa8XBfP0xo9dqljDJjmh0tBg=;
	b=4bH/HafFA617tLEn+gF04fUTbZCJU2rOnbzLv2Fw89+q1C+ZNf0fBN+1QpI4Te26b3Q1uM
	FFfbnw0phxiLaKBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794312886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x5lhyeWppTmeVCGlG4TUa8XBfP0xo9dqljDJjmh0tBg=;
	b=HhLm2d6WOaEowFf+lsUkANYhFaK1ZQe0ijH5djJ8h6/9gKbCquDO5wmMDiHAPfJnpzgWmb
	Y/8siuCSGcEx+umUqFehsSFlqJLEIsQS3B8x80TlFuDUPVRA7TRyt2z3Xc89O+OCM2+AmO
	e0Vvq4039GbsKuu6Shx9GnMPQPseLo8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794312886;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x5lhyeWppTmeVCGlG4TUa8XBfP0xo9dqljDJjmh0tBg=;
	b=4bH/HafFA617tLEn+gF04fUTbZCJU2rOnbzLv2Fw89+q1C+ZNf0fBN+1QpI4Te26b3Q1uM
	FFfbnw0phxiLaKBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B76113479;
	Tue, 10 Nov 2026 12:14:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HuGhAbYK82onGQAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 10 Nov 2026 12:14:46 +0000
Message-ID: <4ff74c54-7478-4ea5-9e26-32101acd4556@suse.de>
Date: Tue, 10 Nov 2026 13:14:45 +0100
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
Subject: Re: [PATCH] nvmet: synchronize DH-CHAP secret removal
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>, hare@kernel.org,
 hch@lst.de, kbusch@kernel.org, kch@nvidia.com, sagi@grimberg.me
Cc: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org
References: <20261110075733.2578-1-sreekuttan2156239@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261110075733.2578-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-13.29 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lst.de,nvidia.com,grimberg.me];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Score: -13.29

On 11/10/26 8:57 AM, Sreeraj S Kurup wrote:
> The empty-secret path in nvmet_auth_set_key() modifies and frees
> host authentication secrets without holding nvmet_config_sem.
> 
> nvmet_setup_auth() accesses these fields under the read lock,
> allowing concurrent secret removal to cause a use-after-free.
> 
> Acquire nvmet_config_sem for writing while clearing the secrets
> to synchronize with authentication setup.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
> ---
>   drivers/nvme/target/auth.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/nvme/target/auth.c b/drivers/nvme/target/auth.c
> index ccba84b1344e..8fe521690ccd 100644
> --- a/drivers/nvme/target/auth.c
> +++ b/drivers/nvme/target/auth.c
> @@ -26,6 +26,7 @@ int nvmet_auth_set_key(struct nvmet_host *host, const char *secret,
>   	char *dhchap_secret;
>   
>   	if (!strlen(secret)) {
> +		down_write(&nvmet_config_sem);
>   		if (set_ctrl) {
>   			kfree(host->dhchap_ctrl_secret);
>   			host->dhchap_ctrl_secret = NULL;
> @@ -35,6 +36,7 @@ int nvmet_auth_set_key(struct nvmet_host *host, const char *secret,
>   			host->dhchap_secret = NULL;
>   			host->dhchap_key_hash = 0;
>   		}
> +		up_write(&nvmet_config_sem);
>   		return 0;
>   	}
>   	if (sscanf(secret, "DHHC-1:%hhd:%*s", &key_hash) != 1)

Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
