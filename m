Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315928;
	b=ssnP+ynsroDB/xSM6htvN4K4U06yEBZmUNIYrl4gCjbg/LhFPJO9YUReOE2g2UwkbrSi
	 2sOJwh9uSScgf4QmdLQ2rVhlSPNCsC0m+xt5WvWP4oXLzpcWCMjg9IyDcJz6ug3ROs0wz
	 o+R9gTZcYcbpEjgCs++sXmsc+LMrEGBQT5TsBJvGSNfkdMC4kYOwrykfgIKiZXcqCPBRI
	 WQAHV3HH2fU0fihwsbsNHG5jpA6lApL8+Q9UOPwXGgRXPd83XwlcUUDM0RMSqnTWHp7qK
	 6J9mn9Ncwkh2CM7/pKOz7rCR4F0aBROsMgTl05R2n67+0zWtuuk8P7wcYYnuD2k8HoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315928;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Score;
	bh=SVc+CPW7zoLyGQ3H7jfE36yTV77ec3+3pCaUO3ZepOY=;
	b=nVKNzQH39PeJUhtsPL0s1WFmqCL0B/5nc6cxB2LoDNXxH6MRrNy6x/rojelwBgmAxG0I
	 ZCiM+OdMn1UocC9bHmyWcGKqMkgDrqfLTNM3GLLr2xOL0/6oKux/gQJzJtBnUJ3M/kfSi
	 yL96e9t/KLpczjhmyp1r6FndekepihGLZ/EnzlFzo+4YyOlQooX55l7vd5DFdslRpeDlW
	 TcFQBj7fGUlTRVsIFcGw25+R6nEwRww2GMDSEyV3xnr6qK8Azq3cG7a+DudN2dDD4KiwW
	 oGmc0xrjgh4210PBddxGliM95yUw+8+0+LQ0puEhdyD1/5iYf13avmt84Yb5FxR8Ilw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=q+LLrnRA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9mKtERTg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=q+LLrnRA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9mKtERTg;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FDB606E45B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29FDB606E45B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=q+LLrnRA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9mKtERTg;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=q+LLrnRA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=9mKtERTg
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4661321F55;
	Tue, 10 Nov 2026 13:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794315926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SVc+CPW7zoLyGQ3H7jfE36yTV77ec3+3pCaUO3ZepOY=;
	b=q+LLrnRAHGnMhsOAm2AR5PdVjDpVTcHVB1zUGLVl8XVF+10S7zFRJLhAhfuyqNj9jZSsPN
	7o7mhlD2DrGxcmSfMSVIlVY45YBZx6TBpvxBY1IB7x0xlGIkV8MAkMdknFdsN2DRjTzkJC
	v48EfLoUtaBxGibD894VNTXCIwe+uSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794315926;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SVc+CPW7zoLyGQ3H7jfE36yTV77ec3+3pCaUO3ZepOY=;
	b=9mKtERTg9o79kwEmyaZ0oloS/1w3HrCeLuFtvtWqQbmXXBp1t2/Vg+fhBFbpmX8Qoei8qz
	uWEvqABlY41p2lBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794315926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SVc+CPW7zoLyGQ3H7jfE36yTV77ec3+3pCaUO3ZepOY=;
	b=q+LLrnRAHGnMhsOAm2AR5PdVjDpVTcHVB1zUGLVl8XVF+10S7zFRJLhAhfuyqNj9jZSsPN
	7o7mhlD2DrGxcmSfMSVIlVY45YBZx6TBpvxBY1IB7x0xlGIkV8MAkMdknFdsN2DRjTzkJC
	v48EfLoUtaBxGibD894VNTXCIwe+uSg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794315926;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SVc+CPW7zoLyGQ3H7jfE36yTV77ec3+3pCaUO3ZepOY=;
	b=9mKtERTg9o79kwEmyaZ0oloS/1w3HrCeLuFtvtWqQbmXXBp1t2/Vg+fhBFbpmX8Qoei8qz
	uWEvqABlY41p2lBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 13A021339F;
	Tue, 10 Nov 2026 13:05:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FL9NNpUW82oVTQAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 10 Nov 2026 13:05:26 +0000
Message-ID: <2f0e8fe5-42b6-47d9-9bcd-c549544e099a@suse.de>
Date: Tue, 10 Nov 2026 14:05:25 +0100
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
Subject: Re: [PATCH v4] nvmet: clean up DH group state on initialization
 failure
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>, hare@kernel.org,
 hch@lst.de, kbusch@kernel.org, kch@nvidia.com, sagi@grimberg.me
Cc: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org
References: <20261110113502.3235-1-sreekuttan2156239@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261110113502.3235-1-sreekuttan2156239@gmail.com>
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
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,lst.de,nvidia.com,grimberg.me];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -13.29

On 11/10/26 12:35 PM, Sreeraj S Kurup wrote:
> nvmet_setup_dhgroup() leaves the DH transform and group ID
> initialized when private-key generation, public-key allocation,
> or public-key generation fails.
> 
> A subsequent invocation with the same DH group incorrectly
> returns success because the existing transform and group ID
> are treated as proof of successful initialization.
> 
> Release the transform and reset the group state on initialization
> failures so that subsequent attempts can properly retry setup.
> 
> Fixes: 7a277c37d352 ("nvmet-auth: Diffie-Hellman key exchange support")
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
> ---
> v4:
>   - Consolidate DH group error handling and clear stale key state
>     when switching DH groups.
> v3:
>   - Clear stale DH key state when crypto_alloc_kpp() fails during
>     re-authentication.
>   - Fix the error path when crypto_alloc_kpp() fails by returning
>     the allocation error instead of incorrectly reporting success.
> v2:
>   - Consolidate error handling in "nvmet_setup_dhgroup()" using
>     a shared cleanup label to avoid duplicated teardown code.
>   - Add Fixes trailer.
> 
>   drivers/nvme/target/auth.c | 67 +++++++++++++++++++++-----------------
>   1 file changed, 37 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/nvme/target/auth.c b/drivers/nvme/target/auth.c
> index ccba84b1344e..681459b5db3b 100644
> --- a/drivers/nvme/target/auth.c
> +++ b/drivers/nvme/target/auth.c
> @@ -76,8 +76,11 @@ int nvmet_setup_dhgroup(struct nvmet_ctrl *ctrl, u8 dhgroup_id)
>   			return 0;
>   		}
>   		crypto_free_kpp(ctrl->dh_tfm);
> +		kfree_sensitive(ctrl->dh_key);
>   		ctrl->dh_tfm = NULL;
>   		ctrl->dh_gid = 0;
> +		ctrl->dh_key = NULL;
> +		ctrl->dh_keysize = 0;
>   	}
>   
>   	if (dhgroup_id == NVME_AUTH_DHGROUP_NULL)
> @@ -95,38 +98,42 @@ int nvmet_setup_dhgroup(struct nvmet_ctrl *ctrl, u8 dhgroup_id)
>   			 __func__, ctrl->cntlid, dhgroup_id,
>   			 PTR_ERR(ctrl->dh_tfm));
>   		ret = PTR_ERR(ctrl->dh_tfm);
> -		ctrl->dh_tfm = NULL;
> -		ctrl->dh_gid = 0;
> -	} else {
> -		ctrl->dh_gid = dhgroup_id;
> -		pr_debug("%s: ctrl %d setup DH group %d\n",
> -			 __func__, ctrl->cntlid, ctrl->dh_gid);
> -		ret = nvme_auth_gen_privkey(ctrl->dh_tfm, ctrl->dh_gid);
> -		if (ret < 0) {
> -			pr_debug("%s: ctrl %d failed to generate private key, err %d\n",
> -				 __func__, ctrl->cntlid, ret);
> -			kfree_sensitive(ctrl->dh_key);
> -			ctrl->dh_key = NULL;
> -			return ret;
> -		}
> -		ctrl->dh_keysize = crypto_kpp_maxsize(ctrl->dh_tfm);
> -		kfree_sensitive(ctrl->dh_key);
> -		ctrl->dh_key = kzalloc(ctrl->dh_keysize, GFP_KERNEL);
> -		if (!ctrl->dh_key) {
> -			pr_warn("ctrl %d failed to allocate public key\n",
> -				ctrl->cntlid);
> -			return -ENOMEM;
> -		}
> -		ret = nvme_auth_gen_pubkey(ctrl->dh_tfm, ctrl->dh_key,
> -					   ctrl->dh_keysize);
> -		if (ret < 0) {
> -			pr_warn("ctrl %d failed to generate public key\n",
> -				ctrl->cntlid);
> -			kfree(ctrl->dh_key);
> -			ctrl->dh_key = NULL;
> -		}
> +		goto err;
> +	}
> +
> +	ctrl->dh_gid = dhgroup_id;
> +	pr_debug("%s: ctrl %d setup DH group %d\n",
> +		 __func__, ctrl->cntlid, ctrl->dh_gid);
> +	ret = nvme_auth_gen_privkey(ctrl->dh_tfm, ctrl->dh_gid);
> +	if (ret < 0) {
> +		pr_debug("%s: ctrl %d failed to generate private key, err %d\n",
> +			 __func__, ctrl->cntlid, ret);
> +		goto err;
> +	}
> +	ctrl->dh_keysize = crypto_kpp_maxsize(ctrl->dh_tfm);
> +	ctrl->dh_key = kzalloc(ctrl->dh_keysize, GFP_KERNEL);
> +	if (!ctrl->dh_key) {
> +		pr_warn("ctrl %d failed to allocate public key\n",
> +			ctrl->cntlid);
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +	ret = nvme_auth_gen_pubkey(ctrl->dh_tfm, ctrl->dh_key,
> +				   ctrl->dh_keysize);
> +	if (ret < 0) {
> +		pr_warn("ctrl %d failed to generate public key\n",
> +			ctrl->cntlid);
> +		goto err;
>   	}
>   
> +	return 0;
> +err:
> +	kfree_sensitive(ctrl->dh_key);
> +	ctrl->dh_key = NULL;
> +	crypto_free_kpp(ctrl->dh_tfm);
> +	ctrl->dh_tfm = NULL;
> +	ctrl->dh_gid = 0;
> +	ctrl->dh_keysize = 0;
>   	return ret;
>   }
>   

Still wonder if a helper wouldn't be better here.
But anyway.

Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
