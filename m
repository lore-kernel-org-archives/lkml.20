Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813551;
	b=LZsqVeAWfg940VCNCK8dUgBVit0ekTRZYZiaHD96J+muDYgUnkg0P2cuG4/vq/UW1muX
	 LdVugc6uuLuYztrIQuH96ORUTJS7hlgh7L3ZZVksqCf3Q2QaqZG5texsdM33UqhEONdri
	 lQUdymDlpNGKNucJ+qrjuD01O7Jr453X8nuBBeNYCAgz1i2WY/kNQrYF9LrGDjoktO5m8
	 xQpcoI2r4OEwNVyMFFpiUHlsm5+4KxIRXE/cBMPHqYN0VhlxnpVPUHRLhOTPPKlnPU+yP
	 9xVzKPSi3Vb0PXkup/JZzCt4TL6cvPc2WSU7XA+TSGmc3FbzV6AGp6sby4hn9q2U/tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813551;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=GbNtju+o0uux9IaqmBzvyORtPq+a0YBPTD717MEyDSo=;
	b=ZdepIKL0XXkiySl68zlN+Uxq32qK6O/5hqZhVeVRBZZZUjbwpLzDJ/UL2d8IuShk9bqX
	 68GLcpJa9dEZwiZHo61qK+qQBw0GK2PsDPM2Aa96oUid/5ou6KmDwbw+Gy2k+8GS7yxck
	 HdiDtVgf2Ighg3AncPXOWbefNnqDMVV52SAa3xmF28/6YrvVVhZsJmIu1mfJxcylVc5FX
	 sRjUZpN7EfRXfPnUM6vuh97o823pen/XceFSbpn+8EVr8wRgBRXICaKzvKEBBmZetVjYK
	 PTDt33b3OgHR/jhsk82kyIyvOOiI2WMTBkfGouvs+Hi98hwMPKVLAk/1MhWu00d2ylg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1LH7sFGt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=11YCh5eK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1LH7sFGt;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=11YCh5eK;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2937606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2937606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1LH7sFGt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=11YCh5eK;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1LH7sFGt;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=11YCh5eK
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 92EFC1FCE7;
	Mon, 16 Nov 2026 07:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794813548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GbNtju+o0uux9IaqmBzvyORtPq+a0YBPTD717MEyDSo=;
	b=1LH7sFGtdX5QsPMffQF9fIbnVXEN7IBeSIsCpLHDj5BDXTDQS8oOWENK9kzod3yP4ZZtUb
	Kl1ULGDR00usiPz8o8Bjfo+aNBgEiOiBMGmcl93KvJp51jsDs0hGrZ2uUyWVy5ELYvEPVN
	fD9msYx/jfKzzzFwPg+yG6+uU1FjmlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794813548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GbNtju+o0uux9IaqmBzvyORtPq+a0YBPTD717MEyDSo=;
	b=11YCh5eKBBaiXxiHApuCLJsOjAyVBqIg+eBEjgXzPO3Dfx2tzyW2oTAXHcnSjukMDS0qPm
	HG8kEiB0MJydB1Ag==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1LH7sFGt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=11YCh5eK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794813548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GbNtju+o0uux9IaqmBzvyORtPq+a0YBPTD717MEyDSo=;
	b=1LH7sFGtdX5QsPMffQF9fIbnVXEN7IBeSIsCpLHDj5BDXTDQS8oOWENK9kzod3yP4ZZtUb
	Kl1ULGDR00usiPz8o8Bjfo+aNBgEiOiBMGmcl93KvJp51jsDs0hGrZ2uUyWVy5ELYvEPVN
	fD9msYx/jfKzzzFwPg+yG6+uU1FjmlI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794813548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GbNtju+o0uux9IaqmBzvyORtPq+a0YBPTD717MEyDSo=;
	b=11YCh5eKBBaiXxiHApuCLJsOjAyVBqIg+eBEjgXzPO3Dfx2tzyW2oTAXHcnSjukMDS0qPm
	HG8kEiB0MJydB1Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1BFBE13408;
	Mon, 16 Nov 2026 07:19:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DkOiOGuu+mrdHgAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 16 Nov 2026 07:19:08 +0000
Message-ID: <c543f2ab-266d-40c7-8443-2292331276ea@suse.de>
Date: Mon, 16 Nov 2026 08:19:07 +0100
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
Subject: Re: [PATCH v7 11/17] nvme-rdma: Use CCR to recover controller that
 hits an error
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
 <20261114030454.2836543-12-mkhalfella@purestorage.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261114030454.2836543-12-mkhalfella@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-13.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim,purestorage.com:email];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,kernel.org,nvidia.com,purestorage.com,suse.de,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[purestorage.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -13.50
X-Spam-Level: 
X-Rspamd-Queue-Id: 92EFC1FCE7

On 11/14/26 4:04 AM, Mohamed Khalfella wrote:
> A LIVE controller that hits an error now moves to FENCING instead of
> RESETTING. ctrl->fencing_work attempts CCR to terminate inflight IOs.
> Regardless of the success or failure of the CCR operation, the
> controller then moves to RESETTING to continue error recovery.
> 
> A request that times out while the controller is FENCING is not
> completed. Its timer is rearmed, since inflight requests must not be
> retried before the fence is over. nvme_rdma_stop_ctrl() flushes
> fencing_work, so deleting a controller that is fencing waits for the
> fence to finish.
> 
> Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> ---
>   drivers/nvme/host/rdma.c | 39 ++++++++++++++++++++++++++++++++++-----
>   1 file changed, 34 insertions(+), 5 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
