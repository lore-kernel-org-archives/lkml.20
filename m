Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193761F94F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976036; cv=none; b=adrFAqVP+6z2KMufFo43wmC6uEyFdnhAg2f8ZTjnUsDdFQTo12zs6/14FxTBbd8ffp4HmwLkQixPMdOV1PhEODw3eO2zkFBj5GEE/Pw4x+G8dz8cVWVDQCMrS0pi3boI1mHmw0EoH4c4ZhyBPSlPcQzIg2/or/4D8GXM9eGaROI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976036; c=relaxed/simple;
	bh=XfSdxzmZWx4srzyl29mnMiw6iFLODHOQBwto2w+Mqfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FxkBzURkUSStGYj1jKtRsWDXfRPOA2j+2CmRoAnefabOgWWvPXYmvLcZywbCc8NcUs6HFytEc5Rbev1a+DgYfJEpsTYemnfKVMWTneLGh09PfOeOTcGqYb05FKoWr1siA4fZtQZAdS4Kw1nMVWAoBl1AfNnWHkIa5qwE04R40B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LlMFiP/1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Qqr3kZZL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UjRIBUvk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n35693Up; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LlMFiP/1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Qqr3kZZL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UjRIBUvk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n35693Up"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DCB901F793;
	Mon, 21 Sep 2026 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789976029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tg9cRM+4M2mivrssvF4ZICidxGAnybcojJhtY8m+yOY=;
	b=LlMFiP/1/FEhYj3hjR3TvoY/IlBJDFmFdwHtsCABtRXuB5PWQah4aIYxHSmsQtbthubWxr
	AcTrafh9Mt9JeURFs9KOxt5bc3Xy9Ek3dq4oQ05FitIG0HANqdLhaPw8G0fWhuud7htuhx
	ztXatEXpNbMcy/2szDyHKP0C+vhxGf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789976029;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tg9cRM+4M2mivrssvF4ZICidxGAnybcojJhtY8m+yOY=;
	b=Qqr3kZZLpBM6CTGW5xTPy0XpGh5+qug6ORDuD1XLDJTBEEzZiygNWNPM9Z4KEoTwul813M
	55hV7RQW798TJ2Cg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UjRIBUvk;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=n35693Up
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789976024; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tg9cRM+4M2mivrssvF4ZICidxGAnybcojJhtY8m+yOY=;
	b=UjRIBUvkhi1E/J3KV02WkwY/zFSEttH89a2AMm2yOUV7Ydj7pUEKjGwuSwl0T/J2GmCElw
	oX7VztseVNQpWB84d6uIMB0V4uhvJ0/y6Hi2UEPNU5K9G5f85M4wsER2ApnDPH0BjMgsPb
	yC9rSGMlFmSAf2lTjUKZlCCX66OqmZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789976024;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tg9cRM+4M2mivrssvF4ZICidxGAnybcojJhtY8m+yOY=;
	b=n35693Upk+cDIG5lz8kqRWh8Jlt7H8LTGQqMqujuAI9APAkNU9++ooaWoWELp4tYh9s/9y
	QmyOh5ZOAtdYocAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 57E1D1368D;
	Mon, 21 Sep 2026 07:33:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5LJeCdjdsGoPdgAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 21 Sep 2026 07:33:44 +0000
Message-ID: <a08ef541-fdaa-4d52-bde8-9d753c5b343a@suse.de>
Date: Mon, 21 Sep 2026 09:33:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] nvme-fc: start error recovery instead of aborting
 timed out IOs
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
 <20260918181614.3947933-13-mkhalfella@purestorage.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260918181614.3947933-13-mkhalfella@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DCB901F793
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,kernel.org,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,purestorage.com:email];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -4.51

On 9/18/26 8:14 PM, Mohamed Khalfella wrote:
> Aborts issued from the timeout handler run outside the FCCTRL_TERMIO
> window, so they are not counted in ctrl->iocnt and
> nvme_fc_delete_association() does not wait for them. The association
> can be torn down while the LLDD is still working on the abort.
> 
> Instead of aborting the timed out command, reset the controller like
> the other fabrics transports do. All aborts now happen in
> nvme_fc_delete_association(), where they are counted and waited for.
> 
> The new nvme_fc_start_ioerr_recovery() queues ioerr_work directly in
> CONNECTING (abort the IOs so the connect attempt fails) and in
> DELETING/DELETING_NOIO (tear down the association so the IOs the
> delete path is draining get completed - the timeout handler no longer
> aborts them, and a dead target would otherwise hang controller
> deletion). In all other states it moves the controller to RESETTING
> first. Connectivity loss, disconnect LS and IO errors now go through
> the same entry point.
> 
> With nvme_fc_timeout() no longer aborts timedout IOs the reset code
> in nvme_fc_reset_ctrl_work() needs to be updated to teardown the
> association before stopping the controller. This is important because
> nvme_stop_ctrl() waiting for ana_work or fw_act_work to be flushed can
> get stuck forever.
> 
> Link: https://lore.kernel.org/all/20250529214928.2112990-1-mkhalfella@purestorage.com/
> Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> ---
>   drivers/nvme/host/fc.c | 54 ++++++++++++++++++++++++++++--------------
>   1 file changed, 36 insertions(+), 18 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
