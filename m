Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691380;
	b=bt0+r9/a3auKf12qy+NaZEAANpFLllSuOqWlGZwFKVehqF7OuHLj/KdnDw0I6MHg2g9X
	 IiSjJppetNRhoKBDX0HPvhGGInStVMNdOjTV7diSwLhlB58NBhlYeT6CWe1EcQWGzhFYE
	 F/QoyAeyCQZQlKiJR5NsDB97JOIe+SwxgV5A/WuFm0yCrfNTieqFlTuIGItNlD3oSyY2k
	 rSTCgw2SZXx+CwBwS4gnawlUujzJxwNZ89/pY9hVw0GQi7hZkrfyRmnuWpgTDb2ri3X/3
	 J1Sj+XR6E0du8PfXr+DaGS2VJ28h1nPTGwu+zHlMotPInbhkRKUogSTHppoyHtQOMIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691380;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=DSC6JjlgRMyo/flGSFSpmhDsonj3okaZacamCAF3ma8=;
	b=U8vzmIJfaADnyS53WvAM/q4RMWquWQgVWiOuvrZ1e4yDTDxP9/1TJhiy1zaZJC8MQ1Yd
	 I49Aadcmb5EuU/Gkg4sYG595qqsHnqwWcRzNuIjbIvt/rjrIuPmLdjrO5rdSyekbuoVvt
	 eHe+EOwYo5tatrrZE21YvZ/lgE5ihPj6FZAwsn/mAVTZx+Dv1k+G6i4NRxe3huOSkV0qn
	 /ZTALW+dxX7a9fu9860OvvHqAyEhhtSeQEv+NCg5PLqFSIrXefJcMGeO6892n3JNCKKCV
	 zBIqZE9rFsda3g1C3sfdz3Ck6zHUSSBZTcd7jN3FtNPoTMEYv1/D+F+uYNqJTLHncYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=teQKTgiT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=x+CSolNF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="dByO6/K1";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SwYirdYi;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D844A606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D844A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=teQKTgiT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=x+CSolNF;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=dByO6/K1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SwYirdYi
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5F79F1F7BC;
	Tue,  3 Nov 2026 07:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793691378; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DSC6JjlgRMyo/flGSFSpmhDsonj3okaZacamCAF3ma8=;
	b=teQKTgiTXVz61sihesxNmCZOs1cENatcBQ5FMYX5VjeB90SyWRq5rz8wJWWh6KJxoVWZ+X
	cMdGhjqjhAjWhCt1ITqcQjaOTXH0xWYply3dr+nkDJmF/s2Tf//bypA3ujj/+u5QbfSJ5t
	lHj2iaSRP37c07AAu11Rg6rQSQ0LwjY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793691378;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DSC6JjlgRMyo/flGSFSpmhDsonj3okaZacamCAF3ma8=;
	b=x+CSolNFu7YNyZ3iA2/so7RF/wQLGFbl6tcQRLzdV3ClLoQIxMN8w0lNyGoVOTAZQKVNEW
	V6Pg6vApCNxOtMAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="dByO6/K1";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SwYirdYi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793691377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DSC6JjlgRMyo/flGSFSpmhDsonj3okaZacamCAF3ma8=;
	b=dByO6/K1piXRRs/K1SYRLJMeaYQ1oEfu4iz6kvQWK30dDamwDEEWfEL11G2pvZ0MM5nsVD
	sGy7C9q0HyvzuE2jEzEeO/R8d2HQZXkGGpEThUNhuVF6YPn9uEilcjh4a4XX+CC9HBbqLy
	Ml/2uGHhXcLj1LMMDXhwoxzHQ9YzM4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793691377;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DSC6JjlgRMyo/flGSFSpmhDsonj3okaZacamCAF3ma8=;
	b=SwYirdYio71KEO5Iy3jUVyc5mHPZ375bbcxcNN8+JaQbMtOg+oSgh8uKmjIm+CHoo6HCh7
	UWU2zsuvCwjyAtDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04A4C134B8;
	Tue,  3 Nov 2026 07:36:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hcbaLvCO6WqJUwAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 03 Nov 2026 07:36:16 +0000
Message-ID: <5deeca7b-8891-42b4-bcff-e8cc566409bb@suse.de>
Date: Tue, 3 Nov 2026 08:36:16 +0100
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
Subject: Re: [PATCH] nvmet: use appropriate types for authentication payload
 lengths
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>, hch@lst.de,
 sagi@grimberg.me, kch@nvidia.com
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261031075932.4345-1-sreekuttan2156239@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261031075932.4345-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5F79F1F7BC
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-13.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,lst.de,grimberg.me,nvidia.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email]
X-Spam-Score: -13.50

On 10/31/26 8:59 AM, Sreeraj S Kurup wrote:
> The authentication payload length is obtained as a u32 value from the
> NVMe command, but nvmet_auth_challenge() and nvmet_auth_success1()
> accept it as a signed int.
> 
> Use u32 for the payload length parameters in both functions to keep
> their types consistent with the value returned by
> nvmet_auth_receive_data_len() and avoid an unnecessary conversion
> from unsigned to signed.
> 
> Also, use size_t for data_size in nvmet_auth_challenge(), since the
> calculation includes sizeof(), which returns size_t. This avoids
> implicitly narrowing the calculated payload size to int.
> 
> These changes make the payload length handling consistent with the
> underlying types and avoid potential signedness and narrowing issues.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
> ---
>   drivers/nvme/target/fabrics-cmd-auth.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/nvme/target/fabrics-cmd-auth.c b/drivers/nvme/target/fabrics-cmd-auth.c
> index 70136f6c22e8..99caad6fb87f 100644
> --- a/drivers/nvme/target/fabrics-cmd-auth.c
> +++ b/drivers/nvme/target/fabrics-cmd-auth.c
> @@ -448,13 +448,13 @@ void nvmet_execute_auth_send(struct nvmet_req *req)
>   	nvmet_req_complete(req, status);
>   }
>   
> -static int nvmet_auth_challenge(struct nvmet_req *req, void *d, int al)
> +static int nvmet_auth_challenge(struct nvmet_req *req, void *d, u32 al)
>   {
>   	struct nvmf_auth_dhchap_challenge_data *data = d;
>   	struct nvmet_ctrl *ctrl = req->sq->ctrl;
>   	int ret = 0;
>   	int hash_len = nvme_auth_hmac_hash_len(ctrl->shash_id);
> -	int data_size = sizeof(*data) + hash_len;
> +	size_t data_size = sizeof(*data) + hash_len;
>   
>   	if (ctrl->dh_tfm)
>   		data_size += ctrl->dh_keysize;
> @@ -488,7 +488,7 @@ static int nvmet_auth_challenge(struct nvmet_req *req, void *d, int al)
>   	return ret;
>   }
>   
> -static int nvmet_auth_success1(struct nvmet_req *req, void *d, int al)
> +static int nvmet_auth_success1(struct nvmet_req *req, void *d, u32 al)
>   {
>   	struct nvmf_auth_dhchap_success1_data *data = d;
>   	struct nvmet_ctrl *ctrl = req->sq->ctrl;

Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
