Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565557;
	b=YvgwP/BRNhIRPdVmE8Sj/esnZu6rjYcS1v5L0lux5hzdq1cv1ewzUGeO2K8/RY6NUXCD
	 +J4MRr/8W4o4nzqx+5pWsS8vTdhxJbuifcLk2pE4lO5g6cy3l5ewZDyXkHKms4r4gF2r8
	 cLIOSw4+CBR2aCtZ4g3AWlguvlL4zg6Tu00NRdP6kbJm+wVwM262bYlXmtU13FefHXnIc
	 F0iGbYweG7rjqHInpFCqoAQrXwaEpzq2GHCdQC6S+tDuoO+6wxtKssrrFcqmF6+jYVgdZ
	 Vu20FdvDv7T34jskXSRA1ddPrI3HamLcXxH4Y70icg42/1EOMXcBeyF9b6prRzOdJAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565557;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:
	 X-Spam-Level:X-Spam-Flag;
	bh=HaLYJhSTkNjizIEyz4raXHjkF7Mcm54Yi7yMX0V+C2E=;
	b=qOyZblTK2AqCPobd/UONitr0xtc8M79E6wVUo5q7IbRo0cmG/doAZjgjZ8s0myJeJYCg
	 wqr1Jq+LCEcXzeXIaqfJTnGIB/Ox/b5BwQ2VI8r3Jg+2mekQwepKIQUwBzf0uQ6nCv9NO
	 OQndpGPKem3rD5RgKTU2d6Pj1Ri+KcjiaGtOMczQrXYqYcgLkacDLY+dLmC43ZqmlhSpw
	 POhkELaVBUx/MkFJ9J5SbSG0MNhhMuJBF7qvFIKcXW4gzI+EdM4i58d2sfWoz1da2ujmD
	 vWlnSEsB6MNOv9wzuB6B6xy5Kt5kew+wEa76WZ7MpAue0UHTeu0sMh5Oy3NLI33gBQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="g7S0/80V";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=md2KzU+L;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="g7S0/80V";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=md2KzU+L;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3929606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3929606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g7S0/80V;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=md2KzU+L;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g7S0/80V;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=md2KzU+L
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C60EA1F898;
	Fri, 13 Nov 2026 10:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794565554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HaLYJhSTkNjizIEyz4raXHjkF7Mcm54Yi7yMX0V+C2E=;
	b=g7S0/80VzZencT3Cmkq3Ge9GYEW6SXD9GZeEm3rtmKUaC5+8+vR5qAaKL2lLijFAlsQoN3
	LXrw0ORrpWZyv6lT7+bCvWJG+NFx+fsXjcfOr6O690L50GpOhbGGuVNj1BCA8ZxcztBjbm
	Vzfps28vThQ6avsmclyT73ADLqJaUnY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794565554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HaLYJhSTkNjizIEyz4raXHjkF7Mcm54Yi7yMX0V+C2E=;
	b=md2KzU+LupZw3MTmIIGbP9ew/wibziYPKrhMbFAzAlOYxP6xZJtfKFwVWxCxw4EzO9gmqH
	fzZrVVqmnzf1HMDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794565554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HaLYJhSTkNjizIEyz4raXHjkF7Mcm54Yi7yMX0V+C2E=;
	b=g7S0/80VzZencT3Cmkq3Ge9GYEW6SXD9GZeEm3rtmKUaC5+8+vR5qAaKL2lLijFAlsQoN3
	LXrw0ORrpWZyv6lT7+bCvWJG+NFx+fsXjcfOr6O690L50GpOhbGGuVNj1BCA8ZxcztBjbm
	Vzfps28vThQ6avsmclyT73ADLqJaUnY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794565554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HaLYJhSTkNjizIEyz4raXHjkF7Mcm54Yi7yMX0V+C2E=;
	b=md2KzU+LupZw3MTmIIGbP9ew/wibziYPKrhMbFAzAlOYxP6xZJtfKFwVWxCxw4EzO9gmqH
	fzZrVVqmnzf1HMDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 779D0134C3;
	Fri, 13 Nov 2026 10:25:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id crkoE7Ll9mrKfQAAD6G6ig
	(envelope-from <hare@suse.de>); Fri, 13 Nov 2026 10:25:54 +0000
Message-ID: <aead1f29-eb58-4e44-b4f6-a8dfa7d7c193@suse.de>
Date: Fri, 13 Nov 2026 11:25:53 +0100
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
Subject: Re: [PATCH] nvmet: clamp the last ANA group index against the real
 array size
To: Yuehong Wu <wuyuehong@cmss.chinamobile.com>,
 linux-nvme@lists.infradead.org
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>, Keith Busch <kbusch@kernel.org>,
 Maurizio Lombardi <mlombard@redhat.com>,
 Mohamed Khalfella <mkhalfella@purestorage.com>,
 Nitesh Shetty <nj.shetty@samsung.com>, Randy Dunlap <rdunlap@infradead.org>,
 Aurelien Aptel <aaptel@nvidia.com>, Nilay Shroff <nilay@linux.ibm.com>,
 Jesse Taube <jtaubepe@redhat.com>, Rongzheng Wang <testwrzwrz@gmail.com>,
 Kees Cook <kees@kernel.org>, Rosen Penev <rosenp@gmail.com>,
 Guixin Liu <kanie@linux.alibaba.com>, Qing Zhang <diasyzhang@tencent.com>,
 Eric Biggers <ebiggers@kernel.org>, Julian Sun <sunjunchao@bytedance.com>,
 Yu Zhang <yuz08559@gmail.com>, linux-kernel@vger.kernel.org
References: <20261106-nvmet-ana-grpid-1-yuehongwu@cmss.chinamobile.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261106-nvmet-ana-grpid-1-yuehongwu@cmss.chinamobile.com>
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
	RCPT_COUNT_TWELVE(0.00)[22];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lst.de,grimberg.me,nvidia.com,kernel.org,redhat.com,purestorage.com,samsung.com,infradead.org,linux.ibm.com,gmail.com,linux.alibaba.com,tencent.com,bytedance.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,chinamobile.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.29
X-Spam-Level: 
X-Spam-Flag: NO

On 11/6/26 7:40 AM, Yuehong Wu wrote:
> NVMET_MAX_ANAGRPS is the highest valid ANA group id, not the size of
> nvmet_ana_group_enabled[]: the array has NVMET_MAX_ANAGRPS + 1 entries
> and the controller advertises anagrpmax == NVMET_MAX_ANAGRPS.  Both
> array_index_nospec() calls however pass NVMET_MAX_ANAGRPS as the size,
> so for the last group the mask is 0 and the index quietly becomes 0:
> 
>   - nvmet_ana_groups_make_group() increments enabled[0] while the group
>     keeps grpid == 128, so the later nvmet_ana_group_release() decrements
>     enabled[128], which underflows to 0xffffffff.  The ANA log page then
>     reports group 128 as inaccessible forever even though the configfs
>     group no longer exists, and the increment on enabled[0] is never
>     undone.
> 
>   - nvmet_ns_ana_grpid_store() accepts 128, stores 0 in ns->anagrpid and
>     returns success, so the namespace silently stays in the default ANA
>     group instead of the one the user asked for.
> 
> Both failures are silent, and they change what the target reports in its
> ANA log page, which is what a host uses to select paths.
> 
> Pass the real array size in both calls, so the masking is kept but the
> last group is no longer folded onto index 0.
> 
> Fixes: 20dc66f2d76b ("nvme: prevent potential spectre v1 gadget")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yuehong Wu <wuyuehong@cmss.chinamobile.com>
> ---
> Verified with nvme-loop in QEMU/KVM on 7.3.0-next-20261027, with two
> kernels built from the same tree and differing only in these two lines
> (no instrumentation):
> 
>   - before the patch, a group created as ports/1/ana_groups/128 is absent
>     from the ANA log page (ngrps=1) even though configfs accepted it, and
>     it is reported as expected afterwards (ngrps=2, group 128 optimized);
>   - 128 written to a namespace ana_grpid reads back as 0 before the patch
>     and as 128 after it, and the namespace is accounted to group 128;
>   - removing the group again adds a phantom group 128 (state inaccessible,
>     0 namespaces) to the ANA log page before the patch, and leaves no
>     trace after it, even when creating and removing it repeatedly.
> 
>   drivers/nvme/target/configfs.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
> index 8aea64d..48d3f68 100644
> --- a/drivers/nvme/target/configfs.c
> +++ b/drivers/nvme/target/configfs.c
> @@ -701,7 +701,7 @@ static ssize_t nvmet_ns_ana_grpid_store(struct config_item *item,
>   
>   	down_write(&nvmet_ana_sem);
>   	oldgrpid = ns->anagrpid;
> -	newgrpid = array_index_nospec(newgrpid, NVMET_MAX_ANAGRPS);
> +	newgrpid = array_index_nospec(newgrpid, NVMET_MAX_ANAGRPS + 1);
>   	nvmet_ana_group_enabled[newgrpid]++;
>   	ns->anagrpid = newgrpid;
>   	nvmet_ana_group_enabled[oldgrpid]--;
> @@ -2074,7 +2074,7 @@ static struct config_group *nvmet_ana_groups_make_group(
>   	grp->grpid = grpid;
>   
>   	down_write(&nvmet_ana_sem);
> -	grpid = array_index_nospec(grpid, NVMET_MAX_ANAGRPS);
> +	grpid = array_index_nospec(grpid, NVMET_MAX_ANAGRPS + 1);
>   	nvmet_ana_group_enabled[grpid]++;
>   	up_write(&nvmet_ana_sem);
>   
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
