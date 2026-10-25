Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792914968;
	b=t/wqllYQ6Kaa7p5cnjymL/mMKTFOzJb66fui5KMgoxJFGXvYoPryKPaLU6ATeKRxheBU
	 1ozVHUWec0r41FRI5t4UGvX0rupNCfSk1NVlrQmm7XQzmMG9vAsp6pMqxGnWF9Shcv+n6
	 Gksd0pB98HNn+iL2niQwqGjsrrREbjd/diynGCtVpGg2yjYnXmxCNCvoezURJEBbX+Qj+
	 gob7IIfnMe5s9jfd5yxv+LYxg+5CHX3XFP1PxBPyvMN+Noh5rAJETJOUjoBGfLpCLpW0N
	 yDjoXxKLvTwMzQW2nAt1dUy8YYTUevUCASnqLhi07fymO5+e7YdbRV2eXQVuerisvPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792914968;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=8vuioqtyAPdFatOqsn8H/YkmLHVaseFEIZlaklLFbf4=;
	b=VRbbHMJ7uZIq0waNq8MZpSc+egzDsegGh15Nv30QagOOBBryKq1cOE5G60xJW/cUBH8p
	 wZrFhk5ZvDHEsPXuIMWIqHkLrF0x//cVs8VDM3bi5rncOQTu+ZcAhSsbiw2Zy5kpj9po5
	 a8/YqDPimyCq9E7JGl13v8WZZ4aLdoG01kpc9i3JH94otREo2IrqiCFPPu59WWEHRcONN
	 uvMSS8RxpzOnIS1aheVxQrF0DQ27X8zjqeFaKo31XUQVGMO7Tvtv9wuYv9dRUP1oPjVZ6
	 RaWy2x2CpCz8UXw3FNwkNgtibvEstkbDP3eVTDejuVKiuS91r8OmYOdNRw8PpDyVlUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=L2PlHMml;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VbQdv9PP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=L2PlHMml;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VbQdv9PP;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FBA606A321;
	Sun, 25 Oct 2026 07:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68FBA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=L2PlHMml;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VbQdv9PP;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=L2PlHMml;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VbQdv9PP
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7DF5A2240C;
	Sun, 25 Oct 2026 07:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792914965; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vuioqtyAPdFatOqsn8H/YkmLHVaseFEIZlaklLFbf4=;
	b=L2PlHMmlAbl+dAZ6/Ka8mcXxXFO0ITM2UZH+b20yVAwwd82rTUVk502XA3AM1BwUIeBxQY
	SYRx1tYbNgh62g2rONcffo5t+QhbqC7zFrMmmMMoYssBZMBetqymCn5h9OxzMALcsz8Dos
	wepcQ9RSIMC9ps3UHc+BZ7qvtZ9xmFs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792914965;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vuioqtyAPdFatOqsn8H/YkmLHVaseFEIZlaklLFbf4=;
	b=VbQdv9PP2KfUMavCP+5tYSfDuhg75MohPAAPsn7RF7/XBGkn/KR0ak4FIcADC1q70l6VCk
	IgCLh1W5pVv9GkDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792914965; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vuioqtyAPdFatOqsn8H/YkmLHVaseFEIZlaklLFbf4=;
	b=L2PlHMmlAbl+dAZ6/Ka8mcXxXFO0ITM2UZH+b20yVAwwd82rTUVk502XA3AM1BwUIeBxQY
	SYRx1tYbNgh62g2rONcffo5t+QhbqC7zFrMmmMMoYssBZMBetqymCn5h9OxzMALcsz8Dos
	wepcQ9RSIMC9ps3UHc+BZ7qvtZ9xmFs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792914965;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vuioqtyAPdFatOqsn8H/YkmLHVaseFEIZlaklLFbf4=;
	b=VbQdv9PP2KfUMavCP+5tYSfDuhg75MohPAAPsn7RF7/XBGkn/KR0ak4FIcADC1q70l6VCk
	IgCLh1W5pVv9GkDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01B1E133A7;
	Sun, 25 Oct 2026 07:56:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1Fb/MRS23Wp+bwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 25 Oct 2026 07:56:04 +0000
Date: Sun, 25 Oct 2026 08:56:04 +0100
Message-ID: <87o6ci6wob.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: ump: Drain sequencer callbacks before freeing their client
In-Reply-To: <pm-pmb-00625126b81966d1bf1d-v2-915f6bbabe1fd458c3ab@gmail.com>
References: <pm-pmb-00625126b81966d1bf1d-v2-915f6bbabe1fd458c3ab@gmail.com>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Sat, 24 Oct 2026 10:02:47 +0200,
Cen Zhang wrote:
> 
> seq_ump_client_free() cancels group_notify_work while the endpoint still
> publishes seq_ops and seq_client. A received Function Block update can
> enter the sequencer callback after cancellation and queue the work again.
> Even disabling the work cannot protect a callback that already loaded
> seq_client and then resumes after the client has been freed.
> 
> A USB UMP endpoint can continue receiving while its sequencer binding
> is removed. The following order uses the same endpoint and client:
> 
>   Sequencer binding removal             UMP input completion
>   -------------------------             --------------------
>   cancel_work_sync()
>                                         load seq_ops and seq_client
>   delete sequencer client
>   clear endpoint binding
>   kfree(client)
>                                         schedule group_notify_work
>                                         read client->seq_client
> 
> Cover all calls through seq_ops with SRCU in the UMP core. Withdraw the
> operations pointer and wait for those callbacks before canceling work
> and deleting the client. No producer can then queue work after the final
> cancellation, and both the client and callback code remain available
> until the last in-flight callback returns.
> 
> Publish seq_ops with release/acquire ordering so the separately stored
> seq_client is initialized before any callback uses it. Use SRCU because
> sequencer notification delivery can sleep; no callback needs to change
> its existing execution context or allocation behavior.
> 
> Fixes: 4a16a3af0571 ("ALSA: seq: ump: Handle FB info update")
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied now.  Thanks.


Takashi
