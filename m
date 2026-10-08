Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7622330D3E8
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 07:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443242; cv=none; b=aImBjOwDCUTwLaTGn+GfZhO+8SVfjhzljc0b0zGzrunDin4u8i7eLVWZKAqQ7YgQTyIXCI97zBTR3Q2gCMuaBITuLxwL82EVtHg2pfQwTKN8JXH6iTWfR3/DKsSH4UyWV2+rd5waM6mB52cK+Gf2Yjge0fFet4nu4lonql1i+TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443242; c=relaxed/simple;
	bh=+LYfGfNbEhJrO8TwYGVq82QUevdS50sGk31etSR8dKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S6pypPMAlagwmFDfXTAfEURV/fWyUa5Pejm6PVXDn9DR4PUaBdRENlp7y0vvEjY5MNGMMf/ggOx2CyYIbY56+/FDBq7zAumSXYaNa+TDYvN2xRoUqb7IyqDloC7xChy3wEgXGQeqiX95FwGIifbqb4RvxVu8GXOJUaE5LahpUFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pttfKnLC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GQkTiTsS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pttfKnLC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GQkTiTsS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pttfKnLC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GQkTiTsS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pttfKnLC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GQkTiTsS"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1BBDC1F786;
	Thu,  8 Oct 2026 07:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791443238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GwjPw1mZUywYnKuWFhbnJ8X46JLzymUOdUflsOOTtw4=;
	b=pttfKnLCpk8vXshpeOFF21/8arvxxZE+LBWUTfS0mYL07v3Zx//9YMCP58V/CI2J+AiPlY
	iki1O4AVlMAHlmPyQDf7lAwKh5plPax8W9e7oPnSFCNw6QbLonW6SXXsxJFZy1yXnrhO+3
	SNH3Zf16Gkp5PhgkEt67c9/+il5/4zI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791443238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GwjPw1mZUywYnKuWFhbnJ8X46JLzymUOdUflsOOTtw4=;
	b=GQkTiTsS+E456gCn6w3l9jIdqyxk5qAGvskqcWRcv3iXKLFz8aIO/mfEdaDKzSX3Fb3U22
	Y79oTlqmHoJ8KEDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pttfKnLC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GQkTiTsS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791443238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GwjPw1mZUywYnKuWFhbnJ8X46JLzymUOdUflsOOTtw4=;
	b=pttfKnLCpk8vXshpeOFF21/8arvxxZE+LBWUTfS0mYL07v3Zx//9YMCP58V/CI2J+AiPlY
	iki1O4AVlMAHlmPyQDf7lAwKh5plPax8W9e7oPnSFCNw6QbLonW6SXXsxJFZy1yXnrhO+3
	SNH3Zf16Gkp5PhgkEt67c9/+il5/4zI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791443238;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GwjPw1mZUywYnKuWFhbnJ8X46JLzymUOdUflsOOTtw4=;
	b=GQkTiTsS+E456gCn6w3l9jIdqyxk5qAGvskqcWRcv3iXKLFz8aIO/mfEdaDKzSX3Fb3U22
	Y79oTlqmHoJ8KEDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1E8713354;
	Thu,  8 Oct 2026 07:07:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cx66JCVBx2qjZAAAD6G6ig
	(envelope-from <hare@suse.de>); Thu, 08 Oct 2026 07:07:17 +0000
Message-ID: <0632ec1e-dcd3-42f9-bd0c-a809a6f6db09@suse.de>
Date: Thu, 8 Oct 2026 09:07:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme: auth: validate DHCHAP secret before stopping
 authentication
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>,
 linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, kbusch@kernel.org, axboe@kernel.dk,
 hch@lst.de, sagi@grimberg.me
References: <0602191a-81ce-4f8a-90d0-b47ba2bc36ac@suse.de>
 <20261003125115.2523-1-sreekuttan2156239@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261003125115.2523-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.50 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Score: -4.50
X-Spam-Level: 
X-Rspamd-Queue-Id: 1BBDC1F786

On 10/3/26 2:51 PM, Sreeraj S Kurup wrote:
> Hi Hannes,
> 
> Yes, I agree that stopping the currently running authentication when the admin
> requests a new one is intentional.
> 
> The issue I was pointing out is slightly different: if the new key is invalid,
 > we never actually get to the point where the new authentication can be
 > started again. "nvme_auth_stop()" has already stopped the existing
 > authentication, and the parser returns an error before the restart
 > path is reached.>
> So the question is whether writing an invalid replacement key should
 > leave the previous authentication stopped, or whether the key should
 > first be parsed/validated and only then replace the existing
 > authentication state.>
> If the intended semantics are that an invalid key write should not
 > disturb an already running authentication, then moving the validation
 > before "nvme_auth_stop()" would make the operation effectively
 > transactional:>
> validate new key
>      -> error: leave existing authentication unchanged
>      -> success: stop old authentication and start with new key
> 
> If, however, the intended semantics are that any attempted replacement
 > stops the existing authentication even when the replacement is
 > invalid, then I agree that the current behaviour is intentional and
 > the patch doesn't fix a bug.>
Hmm. Actually, I'm not sure. Both sides have something going for it.
Stopping the transaction first follows the perceived will of the admin
to start a new authentication. And that will is arguably independent
on the question as to whether the new key is valid.
But at the same time one cannot start a new authentication if the key
is invalid.

So I don't know. Let me think.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
