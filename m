Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C5040587A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978232; cv=none; b=ewoETFhD93kZ10J25lbW+llbaXOvUdjnRVHRtIe23LhR4x8b3bkZLVCdYSg86JLvOoBF2Q01lRE/Sm4YEwj1mvINilNNg+Wc4EKqKnDlND05GGTpPVyhgPw3Lyu/6+xlYXNANuSXegE1rIHh5U/CUOfRWzHlOzDVKogSD4RijxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978232; c=relaxed/simple;
	bh=7ombCP0C1aSEvz084UO2SyWK/ILvfNSTRSKGab8EfGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XArkH6b26NUr5Rrp4XZH3tDkTsnd2unHC7Tj99AFhCKC3I3XMCScxD5gYCORPMvI2CO0VYr+xGRxFqTPEaObV+63I9bq+Tcbf0TzBVnsAJXv37s4tjPifhjC6N830VcGPUxqZUu78OU16S5rGewdHS1pTxSgAKRnsIPrn7/PNNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2LsdN6No; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fC5utse7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b39Q3DIg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9VDiOOQd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2LsdN6No";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fC5utse7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b39Q3DIg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9VDiOOQd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D131C1F7DB;
	Mon, 21 Sep 2026 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789978225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wq8GkXu52IjXpfx96S39S/uyZjL4l1Evpo4NpUflPXk=;
	b=2LsdN6NoVX7CAUCNgVoxNtPuOibq2LixlO8aMRK0/8sk7DcNeEYXVo+08VXoewOC5h9L6z
	VRAFYZByK6ccB1DWLJ0eOWWewHYjpayd6ed3Bks8jWJSZjvzL2kj2gzlj4AhTNVhjCpPry
	7ptBc6xsCccIgvXdoIUnuGRvVhycnGE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789978225;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wq8GkXu52IjXpfx96S39S/uyZjL4l1Evpo4NpUflPXk=;
	b=fC5utse749tdAtoBGt1n5SoTDpU75wEuqrfvI3xNHIpGjBzUyIEo8lyHNYSljI+Xg8XMBm
	My73ccebgvkH/5DQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789978220; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wq8GkXu52IjXpfx96S39S/uyZjL4l1Evpo4NpUflPXk=;
	b=b39Q3DIgO5LAvfTzhxuO4FpBGDxhfgfDu6iS0eiltCzU/lVb1CpWX2MFXhq+cPYWIC90Of
	2YpsHkzc5NW274iXQp/Lf3fmwnVYRFBnto6gg3Myd7WbJJ6MO0u9+Lje9bCoWLvVaKYVJ3
	W6SYq4VOgBFzyECNhXF5odiCJhZQtqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789978220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wq8GkXu52IjXpfx96S39S/uyZjL4l1Evpo4NpUflPXk=;
	b=9VDiOOQd6mtGhs/tOdWgTqvkoo0EqmVUwtQXnjL99r37Cs9+GxsJa/4/5x6pa/v1/aZW7U
	lTaZq2MmAiuuNJCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94C6A1368D;
	Mon, 21 Sep 2026 08:10:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ztH+GWvmsGqOHgAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 21 Sep 2026 08:10:19 +0000
Message-ID: <90913716-f86c-4f9c-b9de-82ff81e760b1@suse.de>
Date: Mon, 21 Sep 2026 10:10:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/18] nvme-fc: Hold inflight requests while in FENCING
 state
To: Mohamed Khalfella <mkhalfella@purestorage.com>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: Justin Tee <justin.tee@broadcom.com>,
 Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
 Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
 Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>,
 Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260918181614.3947933-1-mkhalfella@purestorage.com>
 <20260918181614.3947933-16-mkhalfella@purestorage.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260918181614.3947933-16-mkhalfella@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -4.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,kernel.org,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[purestorage.com:email,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On 9/18/26 8:14 PM, Mohamed Khalfella wrote:
> With the association torn down at the start of nvme_fc_fencing_work(),
> canceling the held requests inside nvme_fc_delete_association() would
> complete them at fence START, letting them fail over to other paths
> before CCR/CQT guarantees the target can no longer execute the original
> commands - defeating the hold this patch introduces.
> 
> Split nvme_fc_delete_association() into __nvme_fc_teardown_association()
> (LLDD-facing teardown, no request completion) and
> nvme_fc_flush_held_requests() (cancel tagsets + unquiesce queues).
> nvme_fc_fencing_work() now runs only the teardown half up front and
> flushes the held requests on the FENCING -> FENCED transition. The
> queues stay quiesced across the fence so nothing new reaches the dead
> association.
> 
> Update nvme_fc_fcpio_done() to not complete aborted requests or requests
> with transport errors. Held requests cannot be forced out mid-fence by
> the block layer, nvme_fc_timeout() always returns BLK_EH_RESET_TIMER and
> nvme_fc_start_ioerr_recovery() is a no-op in FENCING state. Every held
> op is FCPOP_STATE_COMPLETE before the fence starts (aborts drained,
> synchronize_rcu() done), so the flush never touches the LLDD.
> 
> Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> ---
>   drivers/nvme/host/fc.c | 116 +++++++++++++++++++++++++++++++++--------
>   1 file changed, 94 insertions(+), 22 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
