Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315775;
	b=JBU+4m0X2tMCBhwQGnHGhKnZXa514CBrvYvoIXRgIj1cpzWz4Ny2Jo8WvZ0G1pOOtY3S
	 TTN6O6hNKDf/sk8uve/nnhkFOin20sXUi4OLqmE1sTknRHhXYMVMjbnhUYgb8mPbaRS/d
	 pyUmOH0wqjmuaCqIfnZnOG1f79RG6JqaxJvFztNeggvQeCKk5Gbip8kCMqPmUfzwQ97xO
	 3hB05vBPJvcRTEoWDYqwGupGwbhV2vcZslGnvVjDoFXPo/OmMpXyBxUzf1994UwjxSl1q
	 o3ZpXKNldxn5vafBCDvrjFCwNcmK1DiPvr8TUMOUyzIUBGi0ISZ8UfL8AjJHw3A6Fbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315775;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Score;
	bh=Ghl34wq1FtNUPiIhhVNQsPvTyYStJNLS7xbQDw74B5w=;
	b=1aLRJnxjsh0NqgIDwAHTM0QU3q5sAEEqOUJwYlk22yLOMdNZN9KTJNealuDvFpN8cnjV
	 nnj+u7JXCw+MKsQlmarfTT8sSzN83XADMMqJy9PL0sn8568GwPXZTxImSKGU6z+Q6Ntko
	 zaSiLZ/f3x3KlU+B7GFW0x+/zGhDMtRkrKyPdvuCm4eeMEas3Fwaqq/htXZSzGE6zsbR/
	 JWDdmiU/wq4ZSNSN0tMK1yUmgoQdhCgVZ1QvFn697W528jfELt4LL+/Dv59RfOd4DmyGo
	 b2cViEppTJ/DY2z7ZLRm+zrKsBVxeenRK4LUZeCJltXvPRoR3M2CRx1JAR0lGwSL1DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RtpxTKTH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Zx6uh58w;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RtpxTKTH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Zx6uh58w;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018C3606ED6F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 018C3606ED6F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RtpxTKTH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Zx6uh58w;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RtpxTKTH;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Zx6uh58w
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 362331F458;
	Tue, 10 Nov 2026 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794315773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ghl34wq1FtNUPiIhhVNQsPvTyYStJNLS7xbQDw74B5w=;
	b=RtpxTKTHgtiC40dwWI6SrYO03JXnh3WgpzIj4HwAwNJj8Ln2GcBWQBbLNM5KFZ4W/djg/9
	olbIXaQZbtIpoMOw4g5DWjnPHfBrne92q4YWD5vFGwyMdQwlTOrpTBjgFSo35HQzoe7xVA
	nhBAh4zWf6OoBjTIQf0ZGxKmMBCaC80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794315773;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ghl34wq1FtNUPiIhhVNQsPvTyYStJNLS7xbQDw74B5w=;
	b=Zx6uh58w7OGwRG9wTjMOaw7uGfBvHw/NcBCNI/o10SqVWoS4zCZ2/znUH+1MUofYqTMK6x
	qM9nEqw3rKyIUwAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794315773; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ghl34wq1FtNUPiIhhVNQsPvTyYStJNLS7xbQDw74B5w=;
	b=RtpxTKTHgtiC40dwWI6SrYO03JXnh3WgpzIj4HwAwNJj8Ln2GcBWQBbLNM5KFZ4W/djg/9
	olbIXaQZbtIpoMOw4g5DWjnPHfBrne92q4YWD5vFGwyMdQwlTOrpTBjgFSo35HQzoe7xVA
	nhBAh4zWf6OoBjTIQf0ZGxKmMBCaC80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794315773;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ghl34wq1FtNUPiIhhVNQsPvTyYStJNLS7xbQDw74B5w=;
	b=Zx6uh58w7OGwRG9wTjMOaw7uGfBvHw/NcBCNI/o10SqVWoS4zCZ2/znUH+1MUofYqTMK6x
	qM9nEqw3rKyIUwAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB8A71339F;
	Tue, 10 Nov 2026 13:02:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jIacLPwV82qLSgAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 10 Nov 2026 13:02:52 +0000
Message-ID: <739b20b7-6921-4b37-8712-433ba19e5b84@suse.de>
Date: Tue, 10 Nov 2026 14:02:52 +0100
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
Subject: Re: [PATCH] nvmet: clean up DH group state on initialization failure
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>, hare@kernel.org,
 hch@lst.de, kbusch@kernel.org, kch@nvidia.com, sagi@grimberg.me
Cc: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org
References: <20261110084832.3508-1-sreekuttan2156239@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261110084832.3508-1-sreekuttan2156239@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.29

On 11/10/26 9:48 AM, Sreeraj S Kurup wrote:
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
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
> ---
>   drivers/nvme/target/auth.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/nvme/target/auth.c b/drivers/nvme/target/auth.c
> index ccba84b1344e..7733d50de708 100644
> --- a/drivers/nvme/target/auth.c
> +++ b/drivers/nvme/target/auth.c
> @@ -105,6 +105,10 @@ int nvmet_setup_dhgroup(struct nvmet_ctrl *ctrl, u8 dhgroup_id)
>   		if (ret < 0) {
>   			pr_debug("%s: ctrl %d failed to generate private key, err %d\n",
>   				 __func__, ctrl->cntlid, ret);
> +			crypto_free_kpp(ctrl->dh_tfm);
> +			ctrl->dh_tfm = NULL;
> +			ctrl->dh_gid = 0;
> +			ctrl->dh_keysize = 0;
>   			kfree_sensitive(ctrl->dh_key);
>   			ctrl->dh_key = NULL;
>   			return ret;
> @@ -115,6 +119,10 @@ int nvmet_setup_dhgroup(struct nvmet_ctrl *ctrl, u8 dhgroup_id)
>   		if (!ctrl->dh_key) {
>   			pr_warn("ctrl %d failed to allocate public key\n",
>   				ctrl->cntlid);
> +			crypto_free_kpp(ctrl->dh_tfm);
> +			ctrl->dh_tfm = NULL;
> +			ctrl->dh_gid = 0;
> +			ctrl->dh_keysize = 0;
>   			return -ENOMEM;
>   		}
>   		ret = nvme_auth_gen_pubkey(ctrl->dh_tfm, ctrl->dh_key,
> @@ -122,8 +130,12 @@ int nvmet_setup_dhgroup(struct nvmet_ctrl *ctrl, u8 dhgroup_id)
>   		if (ret < 0) {
>   			pr_warn("ctrl %d failed to generate public key\n",
>   				ctrl->cntlid);
> -			kfree(ctrl->dh_key);
> +			kfree_sensitive(ctrl->dh_key);
>   			ctrl->dh_key = NULL;
> +			crypto_free_kpp(ctrl->dh_tfm);
> +			ctrl->dh_tfm = NULL;
> +			ctrl->dh_gid = 0;
> +			ctrl->dh_keysize = 0;
>   		}
>   	}
>   

Can't we make this a helper?

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
