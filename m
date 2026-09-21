Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65601DF98F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974456; cv=none; b=QxFPkb+77OaYI+HzhgwyYkIYE6MAMha+jItG04EqFBAWHbkZNdJ3t1Wm5K0g6CUHfGSzy8b85A/iqKl8lhb/3XBLfE+oaKM+Rj6mFWpvBMOI41MlIOWY91dy3AA62Rdkw6cdPLKXiAs11dczKJbIeJUmBHGQp0SP1ZCP82AGEHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974456; c=relaxed/simple;
	bh=1XusipKEArw6LiaZekx6zlNd70HR2ziFzMX/hZTtA4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hw61BQeqYxYFmbqjS6zqodCnbsQAbaCWg0jaleedmLEbFkg/jOVLNM+JBY5XIbFz/bkb1RPClq9oSFRMSyqcgnJIeaksMPmKYOK84u/YO128bFVrIkNLM96MJcxXT59ma1MuzZ8/cH8RfuBKyBBLLELFZrRLwSp9iSPGanEcCMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rQ0So+yM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f7WfZG8u; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eEhQrdn1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=94rUgrK9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rQ0So+yM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f7WfZG8u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eEhQrdn1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="94rUgrK9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A2D751F795;
	Mon, 21 Sep 2026 07:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789974448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5oINzfdj0Aaw8N3SdtMc2I3Ojy8YxehYDPbjFveq0k=;
	b=rQ0So+yMPkLnZaEK8cpF4OiNKm+PCIcBVZI7UwonedMkUc1tYQkDqZFi2/bJh9RcLWf26K
	tY4igW1F99Rs7oBpEK4PwWdKeHVDpjOexWwdmfU7kHtnEWmXQRX78fBkF8CRvB/wQXp2ta
	Swq4OMPMdy4kk2iU3qBfrqvn1fsj3ys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789974448;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5oINzfdj0Aaw8N3SdtMc2I3Ojy8YxehYDPbjFveq0k=;
	b=f7WfZG8ulHnttr70BfGo/FlnCVXAoczi7jHehw+4sSa52SB60bE3expBSwvpojq5Cv980I
	M8mjkEGyl8JNw9AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eEhQrdn1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=94rUgrK9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789974444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5oINzfdj0Aaw8N3SdtMc2I3Ojy8YxehYDPbjFveq0k=;
	b=eEhQrdn1LaqU979j1KGC54j2TGz3ufhTs35+xEtquUv/PwXFHvfN4+HN4Z8gjUHYSgr1NL
	4RZPVsHcZXdVPgqIoSWlPcEjOhb0VPI7BY0RqlbiwZKqpuG7TLdNk2joFu4FQhHXnX59EU
	B+JbFoFGaXpMa77nCpK9beWVx/muXRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789974444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5oINzfdj0Aaw8N3SdtMc2I3Ojy8YxehYDPbjFveq0k=;
	b=94rUgrK9fo4qhr9Qw/ZvCjoWEVo/roT3M0Om4vM+W6T7f8gYyPZruLgkMXsu7CMapJAB4Y
	yd4PpBcheQecBlAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 273CA13793;
	Mon, 21 Sep 2026 07:07:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FyhCAKzXsGrPWQAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 21 Sep 2026 07:07:24 +0000
Message-ID: <0d787bb1-33c4-46ba-a246-208b1e0ea865@suse.de>
Date: Mon, 21 Sep 2026 09:07:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/18] nvme-tcp: Use CCR to recover controller that hits
 an error
To: Mohamed Khalfella <mkhalfella@purestorage.com>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
 Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
 Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>,
 Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260918181614.3947933-1-mkhalfella@purestorage.com>
 <20260918181614.3947933-11-mkhalfella@purestorage.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260918181614.3947933-11-mkhalfella@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A2D751F795
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
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,broadcom.com,kernel.org,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,purestorage.com:email];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -4.51

On 9/18/26 8:14 PM, Mohamed Khalfella wrote:
> An alive nvme controller that hits an error now will move to FENCING
> state instead of RESETTING state. ctrl->fencing_work attempts CCR to
> terminate inflight IOs. Regardless of the success or failure of CCR
> operation the controller is transitioned to RESETTING state to continue
> error recovery process.
> 
> Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> ---
>   drivers/nvme/host/tcp.c | 29 ++++++++++++++++++++++++++++-
>   1 file changed, 28 insertions(+), 1 deletion(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
