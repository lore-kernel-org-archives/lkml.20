Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A096452940C
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069100; cv=none; b=SRkhVvQfNEzbh0ff5zgh7WqbKN6+9QzzV4tFjJjPbrwhmHDonKC2s/dL1PetWCh0XELBjJxwxw2jF4glvwLAK1HgU9ROfAz6i+PExavilFQgvlGIelNJH1JMJ1X6Y0yCqNAK2cHqSsGH8tpbcUvEDxM0sfEsk7d3jwbzoiID2dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069100; c=relaxed/simple;
	bh=B5LshDEKm0jU3A11335HynP+4H6qHzfZ5f0/J5BRDbg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=cEHibFvEaXzlYfInY4eHKVoLPsJZjGOzkJzpSqpOV8kuoHi0VLZpwGbN1DAMHJKwROwc53xkOs8MJUDK7heS6s8fpOKiQPqfd5ywvTba9me3hZFnaMvRer3USC6tCjc+saP48LEYObIqJLkhCUCGxJ/OeQdjhxL6eRq7B3tNM+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eSUcEurD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0l+1dFyZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eSUcEurD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0l+1dFyZ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eSUcEurD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0l+1dFyZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eSUcEurD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0l+1dFyZ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 98EE41FF48;
	Thu, 15 Oct 2026 12:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792069096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WB/B2ugoNFP1dpwe4GDp3tkiqdKw621FuvrbzLouDRE=;
	b=eSUcEurDDSngNxBaZh3xHICSQX1j8usVTwaXX/4hkU1Rjk4DcsX0cx+kxW5dK3MWnOfeBC
	4SSl9zXVfI4dkAtTr0u1lZlaMbYsYg19El9hgogpjYxTFH0qNJsK9Uwv1Y5bZes35/BihS
	aUmXOvvWlN3iYQjMJKua0v4iWINn6oM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792069096;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WB/B2ugoNFP1dpwe4GDp3tkiqdKw621FuvrbzLouDRE=;
	b=0l+1dFyZLrKW6GxbYWJ+X7WINbdIRg3pfBxifgWU6w0HbfC4BYN5VK6AWfYfXV7Pcp1ER1
	EVlhnIpkoWU50oDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792069096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WB/B2ugoNFP1dpwe4GDp3tkiqdKw621FuvrbzLouDRE=;
	b=eSUcEurDDSngNxBaZh3xHICSQX1j8usVTwaXX/4hkU1Rjk4DcsX0cx+kxW5dK3MWnOfeBC
	4SSl9zXVfI4dkAtTr0u1lZlaMbYsYg19El9hgogpjYxTFH0qNJsK9Uwv1Y5bZes35/BihS
	aUmXOvvWlN3iYQjMJKua0v4iWINn6oM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792069096;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WB/B2ugoNFP1dpwe4GDp3tkiqdKw621FuvrbzLouDRE=;
	b=0l+1dFyZLrKW6GxbYWJ+X7WINbdIRg3pfBxifgWU6w0HbfC4BYN5VK6AWfYfXV7Pcp1ER1
	EVlhnIpkoWU50oDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AAF8113782;
	Thu, 15 Oct 2026 12:58:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v+DWHeXN0GryNAAAD6G6ig
	(envelope-from <dwagner@suse.de>); Thu, 15 Oct 2026 12:58:14 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 01/18] nvmet: Rapid Path Failure Recovery set
 controller identify fields
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Justin Tee <justin.tee@broadcom.com>, 
 Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
 Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
 Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
 Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260920182936.2317916-2-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-2-mkhalfella@purestorage.com>
Date: Thu, 15 Oct 2026 14:58:04 +0200
Message-Id: <179206908475.1897932.6636243827945983905.b4-review@b4>
X-Mailer: b4 0.16.0
X-Spam-Flag: NO
X-Spam-Score: -3.80
X-Spam-Level: 
X-Spamd-Result: default: False [-3.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org,suse.de];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]

>   maximum number of in-progress controller reset operations. CCRL is
>   hardcoded to 4 as recommended by TP8028.

The spec says at least 4. 

> @@ -1695,6 +1699,11 @@ struct nvmet_ctrl *nvmet_alloc_ctrl(struct nvmet_alloc_ctrl_args *args)
>  	}
>  	ctrl->cntlid = ret;
>  
> +	if (!nvmet_is_disc_subsys(ctrl->subsys)) {
> +		ctrl->ciu = get_random_u8() ? : 1;
> +		ctrl->cirn = get_random_u64();

While get_random_u64 is very unlikely to return 0, it still possible, thus

   get_random_u64() ? : 1;

would be the safe choice. Besides this nitpicking:

Reviewed-by: Daniel Wagner <dwagner@suse.de>

-- 
Daniel Wagner <wagi@kernel.org>
