Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EAB3264EA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994249; cv=none; b=FYeIBZbzTRCth2X1nWve0SVKVz3A/Jn+KGF1xtwRNqrUEPNY9F1RjYUP30OTnA1I06L7zQc9aGvPsPFfEumSESHMxYF6r1TK/W75wUl6FzTIPcQAy3q2J+3k1EuK6O6+59pL4X6D+mLJIyTGShYorjCCQltup4Hsbfu4frfQo9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994249; c=relaxed/simple;
	bh=5zJJDTtBx7gxSDjNQ6zIdhCvIGYD7nfdNzXtbiBw26c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EsAJt9rvn7iihZuV9MKGNla1eaMDVdlcRArIg3dd24TmyBW1y0W3Iw7zxRyYNS15dmAo9iteThc/JtcQTnnfQ0MIDeiEDfofEZa/5E2KWdLbq9k8miUYWGucDMVHqzdaJ1sra0gHh39RVkuadBfvg7soBD8eO311WKxWicHpMIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gFAmLR4w; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YFvTgXwX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xxFUxiE5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YX3veidR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gFAmLR4w";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YFvTgXwX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xxFUxiE5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YX3veidR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F06ED1F867;
	Mon, 21 Sep 2026 12:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789994242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kAg9NPlJt2MpHAUp0hpLq5UrfEHSrFeBB4CO8X0AOS0=;
	b=gFAmLR4wDnXo1rFAlRHnHtanHEXCKfK3iNLXFNGpklLlTepYPuKPUWgnkfq+d1m4Pq3hyQ
	9W8VCBTHfhfGKzl/znNNZuM5u6oNnWXznBWfyiiMrgJ2gntY0N3S3mRzs67V4QeX5y9GFr
	C3y6IujiJUyTUB0KmRBFE3/eLYkOdzA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789994242;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kAg9NPlJt2MpHAUp0hpLq5UrfEHSrFeBB4CO8X0AOS0=;
	b=YFvTgXwXs+Ns3Wqx5NmXBwpF6fwcEjev3CQVIPjPc7gjvcv1MXadGjC7Nlt/22pt8e4t62
	SV6Oicjcrj5PZ0CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789994237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kAg9NPlJt2MpHAUp0hpLq5UrfEHSrFeBB4CO8X0AOS0=;
	b=xxFUxiE5jJGnXwm/STloRTqZkVI0UxHKFA8tX/3T60ZoUgwHr84/HKUhatX8Zyo2Jk6xjC
	ae/hB2STPAMLGfFecL2F7sAJHVZs9bwnH8bO0tbuvbGqpEC/vHjgvVrGwItfhdH0qN3+Po
	U+D9mVwigx5PB5A0Zn1+lJMzGSWLI60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789994237;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kAg9NPlJt2MpHAUp0hpLq5UrfEHSrFeBB4CO8X0AOS0=;
	b=YX3veidRVwmp9+5VjGIAMLrwR+f5xSfbMJ+I2BMeToJzqSDbw2GsIWjkeiliFQpQlw1TT8
	vQy3OE3o8qC4G+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E1BE13793;
	Mon, 21 Sep 2026 12:37:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5mqFBf0ksWoWSQAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 21 Sep 2026 12:37:17 +0000
Message-ID: <97ae9b91-8ef4-41d3-9a52-2e96b23f909b@suse.de>
Date: Mon, 21 Sep 2026 14:37:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] nvme-tcp: parallelize I/O queue allocation and
 startup
To: Surabhi Gogte <sgogte@purestorage.com>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>
Cc: Solganik Alexander <sashas@lightbitslabs.com>,
 Roy Shterman <roys@lightbitslabs.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, mkhalfella@purestorage.com,
 randyj@purestorage.com, adailey@purestorage.com
References: <20260910202812.1642832-1-sgogte@purestorage.com>
 <20260910202812.1642832-4-sgogte@purestorage.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260910202812.1642832-4-sgogte@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email,purestorage.com:email]
X-Spam-Flag: NO

On 9/10/26 10:28 PM, Surabhi Gogte wrote:
> Similar to commit 2a8513091d2f ("nvme-rdma: parallelize I/O queue
> allocation and startup"), refactor nvme tcp I/O queue setup to use async
> API, combining allocation and startup into a single parallel operation
> per queue. This reduces connection and reconnection setup time when
> there are delays in establishing connections, which is especially
> important for high-core-count hosts.
> 
> Key changes:
> - Use async API to facilitate parallel calls for io queue setup.
> - Add nvme_tcp_queue_setup_ctx for propagating errors from async
>    workers.
> - Remove nvme_tcp_start_io_queues() and __nvme_tcp_alloc_io_queues();
>    their logic is folded into nvme_tcp_setup_io_queues() and
>    nvme_tcp_configure_io_queues().
> - Allocate the io tag set before the queues so that the queue range is
>    known, and only set up the reconnect grow case if the queue count
>    actually increased.
> - Serialize the cpu scan and claim in nvme_tcp_set_queue_io_cpu() with a
>    spinlock, as concurrent callers would otherwise select the same cpu.
>    The per-cpu counters no longer need to be atomics.
> 
> Testing on a 64-core host with 64 IO-queues shows nvme-tcp connection
> time reduced from 61ms to 11ms.
> 
> Signed-off-by: Surabhi Gogte <sgogte@purestorage.com>
> ---
>   drivers/nvme/host/tcp.c | 124 +++++++++++++++++++++++++---------------
>   1 file changed, 79 insertions(+), 45 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
