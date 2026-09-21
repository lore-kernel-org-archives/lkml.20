Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCA8403EB5
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978298; cv=none; b=t66SyLrTQSotqw/5f9taT29hfDS2Urxfo8GzXqJeZsE3jfwTz+63rfuXms4xHnlaaVwqW2PwJ7gY7uIum0v6hqI3ljqd8iROSWFzZoo+UJyLIXpy0qLyzmY0QBg/11Im6GO2GPWZTs0/Xbvevsjo9/2YYxbL05HbTjJJfAiWDtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978298; c=relaxed/simple;
	bh=1yPaG8kfMl3GN8jCcIpl753j38BNL3y0m29pFyxL4N4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=anUrolUgau5Krm3M9J/Wz05i7rOqXY8AvHFtr2l5ln1mEk9PBfsbogfAoLg097fhNg8mzt+GA0d1fmb/cTFRQhX15Zy7772VCFHX46UUsv2tEYVzdh/4CJbORVaSlf8jsiBWbSzYylEF/2szCcv7TifWq+E/zUfqvI19VTNVmuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PkkUDnyP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PAEpvjOA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uVqm58us; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NuSGlHts; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PkkUDnyP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PAEpvjOA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uVqm58us";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NuSGlHts"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 27CE821B46;
	Mon, 21 Sep 2026 08:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789978291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHGtN+NDT7qEVbB4Du1rBX4rQS0jrXiWfCvKAMIyooY=;
	b=PkkUDnyPZHMdW/gRDQ7BBGLwikYey+dEyS6Lp7BRiPrx3Rp/Av+5lfPi/vCJo1n50JIZvN
	+0sARiaLjBJswTuldhXlppOtj6EK6AJMpXTh0VQIQydVMkiuwoujVl/lINfwh/FqmTbZQz
	VZx/jdhjCourjnjS0NkNrGsbQgU8PeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789978291;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHGtN+NDT7qEVbB4Du1rBX4rQS0jrXiWfCvKAMIyooY=;
	b=PAEpvjOA4hw6qF9UdHbEsKHWBGarWChAPaKXqnsH2OuIs3Ih9G6Go3v794qgBhwngI4Twr
	XvH0Kw0r0L6+3oCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789978287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHGtN+NDT7qEVbB4Du1rBX4rQS0jrXiWfCvKAMIyooY=;
	b=uVqm58usbB7/B0oCgnhakdGnX17h4nB0NM583/70T2MnLaYpi/26fd1BfRD5B1Uq6aPXk2
	5IchZZBwBhFY6L26kwbtBiXd7gyOTeH/Ja53mopkahvwEMNXGXmteBDhTj/Ubv6incKSmv
	PqVkR4wT6jf0WZWGqbwYzTwuNuqa4cE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789978287;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mHGtN+NDT7qEVbB4Du1rBX4rQS0jrXiWfCvKAMIyooY=;
	b=NuSGlHtsKgiBrXl/1ieV81WSUVdC/7RAWSVh7PEmako29hh5+6OMG1MGg7LvhyOTzzbYL3
	t5HYCpFhpO1hO9Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8893B1368D;
	Mon, 21 Sep 2026 08:11:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FY4IGK7msGqKHwAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 21 Sep 2026 08:11:26 +0000
Message-ID: <f7854f34-70af-476c-affc-c7e36d1352a5@suse.de>
Date: Mon, 21 Sep 2026 10:11:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/18] nvme-fc: Use CCR to recover controller that hits an
 error
From: Hannes Reinecke <hare@suse.de>
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
 <20260918181614.3947933-15-mkhalfella@purestorage.com>
 <6a2fddc2-0a32-4dc2-9642-efebe6934633@suse.de>
Content-Language: en-US
In-Reply-To: <6a2fddc2-0a32-4dc2-9642-efebe6934633@suse.de>
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,kernel.org,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,purestorage.com:email]

On 9/21/26 10:07 AM, Hannes Reinecke wrote:
> On 9/18/26 8:14 PM, Mohamed Khalfella wrote:
>> An alive nvme controller that hits an error now will move to FENCING
>> state instead of RESETTING state. ctrl->fencing_work attempts CCR to
>> terminate inflight IOs. Regardless of the success or failure of CCR
>> operation the controller is transitioned to RESETTING state to continue
>> error recovery process.
>>
>> Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
>> ---
>>   drivers/nvme/host/fc.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 42 insertions(+)
>>
[ .. ]
> 
> I would merge it with the previous patch as both are required to get FC
> error handling working properly.

Oh, just checked the remaining patches.
It's indeed better to keep this patch separate.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
