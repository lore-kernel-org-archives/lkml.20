Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173592;
	b=p4DZrZaG0xNMiMeS9/xRzrm/6ILT0nGEjCXk7YgY7wJ5wUmzDvWohb4QqhhOmDvJPr2I
	 XmQp8Z2HsyVh2SH67BgObZfu3CoWYSyWgydue7BKI45lW93f4NFvHmgI4JbXIz8mYce11
	 G647CHvQR97ogs6w7MFxlqyDFjuP6cnFhHAa3OBkhaqEHUd5bVvTn0NGNLWq59CCxIPLR
	 Oju84xYl2g/N1uk8cJ6NIXu7lidK7OUVg+DkD/troiGCPKV0yjsykCGoUp5d6ULONT29p
	 TfqCBoiqyMLrLK1uXmVXtbEmGK8cm50Z9W8EKlGbOrGoucWJVr+hKaP2KdL7vxTX3Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173592;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Score;
	bh=+PJnSNTrmxPeA9orCMWN5NCcF6tLy6nOdSExP0yLuh8=;
	b=MHIKXaOIv0661qKY+9rsQc11z+3Bdeh7NvKMtLe/Wo7Cayn7NiSweTFg7YCtpx/IG/3H
	 0BmnmeMhnl6NIlnwVeD7ey81Rb6JNlvSsUGys5l4JNbrQW7EVOZ03V9Y/dciLwzX5uz52
	 lWGo0H/2D29T7IsXVkUqEzXz5HKBq2iCW6xfGl6sdjqU2ii/2M+tfJNrswwDILEYj1qLn
	 cd9ZoADXbwAFefAee7j+vGlFotS7FpPR2+1EQLK1DBfanVsJlA36OKPQ9hcT668du3/Cy
	 dP5nYBOKf06bpMegoAonmp37ptZ78rF+tWW+GzN51TUrfLhBFWnmKAJ4SPDdvZkZhyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="pv/4dL8P";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EnI3bEkR;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="pv/4dL8P";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EnI3bEkR;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA1F606A31A;
	Wed, 28 Oct 2026 07:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BA1F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pv/4dL8P;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EnI3bEkR;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pv/4dL8P;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EnI3bEkR
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 24E3B21DE5;
	Wed, 28 Oct 2026 07:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793173590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+PJnSNTrmxPeA9orCMWN5NCcF6tLy6nOdSExP0yLuh8=;
	b=pv/4dL8PmjU1xzr1ZL1OjrLb/pKoOn7qiqmEWDyNGRUm89geEP/Jl9IBDqcx1RFg8/dbX+
	W4zYNhJQUBIyJ0VjjoQJS+CTDNzYPZMEcQC6MDsYP8kXjkwidrYTS+0vW8H8xiw0uG9DVf
	9Up66gVu+5Byeqyf8OaRwHiI6uSSQJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793173590;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+PJnSNTrmxPeA9orCMWN5NCcF6tLy6nOdSExP0yLuh8=;
	b=EnI3bEkR58T6f0F/S/gcyPejIy4YZWkgcbGLpGTlbzvs2NIJze8PTGfhnwRA2Hn4MuVfZA
	ZxrFy2SmqgL8j4Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793173590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+PJnSNTrmxPeA9orCMWN5NCcF6tLy6nOdSExP0yLuh8=;
	b=pv/4dL8PmjU1xzr1ZL1OjrLb/pKoOn7qiqmEWDyNGRUm89geEP/Jl9IBDqcx1RFg8/dbX+
	W4zYNhJQUBIyJ0VjjoQJS+CTDNzYPZMEcQC6MDsYP8kXjkwidrYTS+0vW8H8xiw0uG9DVf
	9Up66gVu+5Byeqyf8OaRwHiI6uSSQJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793173590;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+PJnSNTrmxPeA9orCMWN5NCcF6tLy6nOdSExP0yLuh8=;
	b=EnI3bEkR58T6f0F/S/gcyPejIy4YZWkgcbGLpGTlbzvs2NIJze8PTGfhnwRA2Hn4MuVfZA
	ZxrFy2SmqgL8j4Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A0D791321C;
	Wed, 28 Oct 2026 07:46:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4cfkF1Wo4WoiUwAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 28 Oct 2026 07:46:29 +0000
Message-ID: <f4f29df1-2daa-4093-9af5-9f4542ec0e58@suse.de>
Date: Wed, 28 Oct 2026 08:46:28 +0100
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
Subject: Re: [PATCH v2 1/2] nvmet-tcp: validate the TLS handshake timeout
To: Yingjie Wang <1075151112@qq.com>, linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
 kch@nvidia.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1793103202.git.1075151112@qq.com>
 <tencent_092ACB939828E092E004E81FE5F32E68CA05@qq.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <tencent_092ACB939828E092E004E81FE5F32E68CA05@qq.com>
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
	FREEMAIL_TO(0.00)[qq.com,lists.infradead.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[qq.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]
X-Spam-Score: -13.29

On 10/27/26 1:13 PM, Yingjie Wang wrote:
> tls_handshake_timeout is writable but stored as a signed int. Multiplying
> the value by MSEC_PER_SEC and HZ therefore uses signed arithmetic.
> 
> With HZ=1000, setting it to 2147484 overflows both multiplications. If
> the handshake request is accepted and remains pending, the timer wheel
> treats the jiffies delay as already expired and queues the timeout work
> on its next advance, while the handshake agent was given about 24.9
> days. Negative values such as -1 cause the same immediate kernel-side
> timeout.
> 
> Store the parameter as an unsigned int and reject values that cannot be
> represented both by tls_handshake_args::ta_timeout_ms and by a safe
> jiffies delay. Take one snapshot so a concurrent parameter update cannot
> give the handshake agent and delayed work different timeouts. Document
> the accepted range for built-in use.
> 
> Negative and oversized values now fail with -EINVAL. Keep zero valid,
> preserving the existing immediate-timeout behavior.
> 
> Fixes: 675b453e0241 ("nvmet-tcp: enable TLS handshake upcall")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yingjie Wang <1075151112@qq.com>
> ---
>   .../admin-guide/kernel-parameters.txt         |  5 ++++
>   drivers/nvme/target/tcp.c                     | 26 ++++++++++++++++---
>   2 files changed, 27 insertions(+), 4 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
