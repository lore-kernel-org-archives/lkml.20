Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793461087;
	b=uc5NQJnCaGSoct+/f7HuIYziCmYYkvLKK8ANG5l/Tk1Tw2ySBmLB+/ME//NxLSEov3/A
	 NgjPnaGKGKI7YFYqR0UksGCdWE7r6DQAYZiIQ4CDT3Y2tWG+h6hRrS7EoS0YSAkGPXfRG
	 /gZTHblgSljUSGWiQI7Dp0cp9BKNOTbrC19XVi9PTsh8KFIcxHzkrImdI/fNwRxJVIP80
	 CjVhg8VtWXibmjcs2u4CTxgUU589H3g7IuzLhzaePRg2npOgTpd4XBW02Rv/AK77yTqFV
	 drgplmcj2cxSahBrQ9i/NTMMSHzqu9+y5NnNTvfN3d2P1N0VkQdTkidyP1NAe3MqY0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793461087;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=diNAf6h+Pd+TkICn1Vt4zAMlz5ZYX2XEYpfx5jDI+YM=;
	b=uD6uLbn71D8Z7rSKz49H5jG7YoTzjgrcIlNW8w+u4g25FRUE9WbGqIx/ONwO3pJ0ubaD
	 eJkjeYM0EE1o+KaiDibdePXnXcljsLPbYjXD4KQRqm858BIciYEE34HYlUTY2+lK7wOYp
	 qNGY1+zuCKESfdEVKVZQ/iE5tAzcztfP85h5rWSH4kLylaVCN43wQ3JQBeJmcaqSUGR9Q
	 Nlz6vBaci50sqZlwkHBGq6jBfk6cT/aUuSLL125UKqoQQLvt+kPrwcIeKuYw6RQsyxIKj
	 PJtZXEa2ZBE0QzkFqVmmxxHZU5w9QCRI3qkZwbhPoj+BVFxLDf6nOOH/ntrqyqp1NBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zdkWpLRc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BqvhjCwj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zdkWpLRc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BqvhjCwj;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F19606A31A;
	Sat, 31 Oct 2026 15:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0F19606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zdkWpLRc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BqvhjCwj;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zdkWpLRc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BqvhjCwj
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D7A7A1F749;
	Sat, 31 Oct 2026 15:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793461084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=diNAf6h+Pd+TkICn1Vt4zAMlz5ZYX2XEYpfx5jDI+YM=;
	b=zdkWpLRcygdn5aJx5zB6qskHhB0lOvDpMSV3Prb38rMdLkrf6+lPkBe9isXiIuAxyRVPZm
	FzGGlHZM9xyjhaw0hbWoktX12cTs0VKjJbxfzmwH5FLpeLcKIMzsYl1Ld4jgmth0VFL1/+
	PINKeeqVhmILjN/BlvN/RvLdEoORFBk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793461084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=diNAf6h+Pd+TkICn1Vt4zAMlz5ZYX2XEYpfx5jDI+YM=;
	b=BqvhjCwjx1jpbSFcb4l5XMIxpzJypi1SNfduPETJn8881LSwux/OKwQivb6hN67YOgaPaf
	cfooHHGwk5h3uPCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793461084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=diNAf6h+Pd+TkICn1Vt4zAMlz5ZYX2XEYpfx5jDI+YM=;
	b=zdkWpLRcygdn5aJx5zB6qskHhB0lOvDpMSV3Prb38rMdLkrf6+lPkBe9isXiIuAxyRVPZm
	FzGGlHZM9xyjhaw0hbWoktX12cTs0VKjJbxfzmwH5FLpeLcKIMzsYl1Ld4jgmth0VFL1/+
	PINKeeqVhmILjN/BlvN/RvLdEoORFBk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793461084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=diNAf6h+Pd+TkICn1Vt4zAMlz5ZYX2XEYpfx5jDI+YM=;
	b=BqvhjCwjx1jpbSFcb4l5XMIxpzJypi1SNfduPETJn8881LSwux/OKwQivb6hN67YOgaPaf
	cfooHHGwk5h3uPCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 881B413432;
	Sat, 31 Oct 2026 15:38:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9bpfF1wL5mo6FwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 31 Oct 2026 15:38:04 +0000
Date: Sat, 31 Oct 2026 16:38:04 +0100
Message-ID: <87ecd5swwz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sasha Levin <sashal@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Zhao Dongdong <zhaodongdong@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/core: Fix double free on stream page allocation failure
In-Reply-To: <20261028144443.992569-1-sashal@kernel.org>
References: <20261028144443.992569-1-sashal@kernel.org>
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
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 28 Oct 2026 15:44:43 +0100,
Sasha Levin wrote:
> 
> Since commit f16eaa38ea64 ("ALSA: hda/core: add cleanup in
> snd_hdac_bus_alloc_stream_pages()"), snd_hdac_bus_alloc_stream_pages()
> frees the BDL and position buffers it has already allocated when a
> later allocation fails.  snd_dma_free_pages() doesn't clear dmab->area,
> so the freed buffers still look allocated to
> snd_hdac_bus_free_stream_pages(), which the HDA controller drivers call
> from their destructors, and they are freed a second time when the
> device is removed.
> 
> With fault injection failing the CORB/RIRB buffer allocation of
> snd-hda-intel on a QEMU ich9-intel-hda, unbinding the device then
> crashes:
> 
>   page dumped because: VM_BUG_ON_PAGE(page_ref_count(page) == 0)
>   kernel BUG at include/linux/mm.h:1986!
>   Call Trace:
>    ___free_pages+0x9b/0xa0
>    free_pages_exact+0xa5/0xd0
>    snd_hdac_bus_free_stream_pages+0x43/0xb0 [snd_hda_core]
>    azx_free+0xb3/0x1b0 [snd_hda_intel]
>    azx_dev_free+0xd/0x20 [snd_hda_intel]
> 
> Clear the buffer pointers after freeing them in the error path.
> 
> Fixes: f16eaa38ea64 ("ALSA: hda/core: add cleanup in snd_hdac_bus_alloc_stream_pages()")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Applied now.  Thanks.


Takashi
