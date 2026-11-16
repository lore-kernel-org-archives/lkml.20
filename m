Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794814730;
	b=c53eewuSSlMYSP4ZGhAW9TM9o151YdeI/XBA8yBaFImYP8DrKjLXgWFJp0Xkqos7G9fs
	 sHeoTc3W3R/lTxoWeWSgY3x0cP9Xi0RqDBqVltuQT+UkQgk8cpZmSs2Ew8siS/mUd0o5Q
	 8FW/Sh5cLYW6XC76c0rh7RelntSWQeJSCIlV36QJO0aVi8HdRTyYO41Ko8+9hX6BimAj/
	 u0HsNMISD16ObPCMe1WmqnCmHYeVFJoSX9CBIMsYu9+tSY42kUGaDzFHiIWH1dmiu8qxM
	 1bQ2NpmPdPsDSzqjt9VPB34VwZS6M3blAbVkNsEaRT13z4nTE7e89tL/jtZ91ouO0kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794814730;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Score;
	bh=zZmXLBv2SE8smt4ibe6ROyBZVESDWUHzTn/j6advAGk=;
	b=cRy6goNgffJWWydUNxuMwDm9sTqrQMH8dQg9ugvumumJyeJpmMzIvWcSK2Gx8EdhPjcN
	 7wj7ymODNvauIdZ1+dYzYMPfcCiJigJe6+Q7BZM5ehCaqjJCv0ADse43OS4wHyr2uiYC8
	 2HIAdASybV3pYi8+mECmf4KN78ZgmsQyBVoJ4GFzPDrLXJ2jVqtloYVPHX27UUH+HiZeK
	 LIjMBSt1twxYqTftP97aL3inomYwHyCxxBBPTvnx1JcznVF6zb3uJFDuzKXVWitkTTSSv
	 oSqTEbbceL1ZXhzmJ44yYTIoWBVgWg3dH8UMB1oo2A2uWTF7oL/Ze4roaXBFiqSbpqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=p7M2++Wt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="f/UGNQvS";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="bHL/yrAc";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=H3wpifoo;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD611606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:38:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD611606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=p7M2++Wt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=f/UGNQvS;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bHL/yrAc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=H3wpifoo
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EE6D02222D;
	Mon, 16 Nov 2026 07:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794814728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZmXLBv2SE8smt4ibe6ROyBZVESDWUHzTn/j6advAGk=;
	b=p7M2++WtRlYfqeXK3QMXCq31pL0sZrl5V93SsUuO7MsRWD1LfWEygzljfImAhUihiu6/GP
	Qy6UUVtqx4WNThF4sWJkvI0+Ys0RBvkUlFaDLeqMr8RlSw9nWVpJ62aWLBHEwf8CTnvlUk
	hXPH6IlqC+abRm1hYitiEfTXej/RBbs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794814728;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZmXLBv2SE8smt4ibe6ROyBZVESDWUHzTn/j6advAGk=;
	b=f/UGNQvSz9XWqeZySBa8OcucY6x/YP8EWgLvntqwxCRfW+KAjhJ9BxOgV3A8YJMSPNENzt
	QdjwrZxUZrcmZBBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794814727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZmXLBv2SE8smt4ibe6ROyBZVESDWUHzTn/j6advAGk=;
	b=bHL/yrAco6yPxag2Tl1k26zZ0PbMrkp6Q/LGv1Na/KuiE4hwKi8dIy4h03WLQTASxwD3xL
	hNTYQmZLCJjBiSgXZTvTwbgGwi7OdSmVr0Hzj84l+8DjKiECPz3fmRVQFuIJ97Q1nl8ox+
	Qm0ke8I0UtTDBkU9+2wbttbdxb0Eh4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794814727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZmXLBv2SE8smt4ibe6ROyBZVESDWUHzTn/j6advAGk=;
	b=H3wpifooAX3wceqQ8Xas1R4ppbzumIX5XggxuKdZSgr5KjUpKf6VmuI40AbnPUzUnln5p8
	73xGOOc5cnIMrgBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C63D134B8;
	Mon, 16 Nov 2026 07:38:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6D+ECwez+mqFMwAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 16 Nov 2026 07:38:47 +0000
Message-ID: <dffcc1da-0740-4d75-8b81-6a91c034253f@suse.de>
Date: Mon, 16 Nov 2026 08:38:46 +0100
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
Subject: Re: [PATCH v7 14/17] nvme-fc: Use CCR to recover controller that hits
 an error
To: Mohamed Khalfella <mkhalfella@purestorage.com>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
 Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
 Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>,
 Randy Jennings <randyj@purestorage.com>, Daniel Wagner <dwagner@suse.de>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261114030454.2836543-1-mkhalfella@purestorage.com>
 <20261114030454.2836543-15-mkhalfella@purestorage.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261114030454.2836543-15-mkhalfella@purestorage.com>
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
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,broadcom.com,kernel.org,nvidia.com,purestorage.com,suse.de,lists.infradead.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,purestorage.com:email,suse.de:email]
X-Spam-Score: -13.29

On 11/14/26 4:04 AM, Mohamed Khalfella wrote:
> A LIVE controller that hits an error now moves to FENCING instead of
> RESETTING. ctrl->fencing_work attempts CCR to terminate inflight IOs.
> Regardless of the success or failure of the CCR operation, the
> controller then moves to RESETTING to continue error recovery.
> 
> nvme_fc_fencing_work() tears down the association before fencing so
> the LLDD can finish unregistering the remoteport/localport. With this
> patch alone that still completes the inflight requests at the start of
> the fence, which matches the behavior before this series. The next
> patch holds them until fencing has finished.
> 
> Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> ---
>   drivers/nvme/host/fc.c | 69 ++++++++++++++++++++++++++++++++++++------
>   1 file changed, 59 insertions(+), 10 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
