Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198612;
	b=tsQH7b33l4AveDxROni/8VBZEnHv8/0YURH8I2800zDzMYMwNeK5U5GlSIJyfilkTeIS
	 c2qnDNPHACE43f5indui5fue5Bk7Zj+Y7KsuA2oNp2zLX+TS3ANDeWiMiD+i6NidX1WoE
	 tZvPrgnY+y0ML0n12Z/UsfIIjpxyFPRQmpA92mmUDhcHM6PBNhI9ULXiKPyyRUErHV++T
	 9AeZgeZpjfQKC6cPd5Z5WQhl4zd5qMGYeXf3aybrMtijYvOay0A4Urp9b5aOaD8s5D5DX
	 Oj9RIoVzEinZWqBP8te1mx0fxwnr0baCd7fvgJuqM3hpeS5fHXuEI9Fhu64gtFc0dpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198612;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id;
	bh=kKviTkak77ulmwwI7l/FFLltokotzZ9slH39nehkhIw=;
	b=2V/RB8wfBqC/c9WXTnc2fUzxegW+aSDQWdj4K/tRE+vjhLdsWDTZJMwXccX3OOIx8CJa
	 crEuu64vtDV3yRkXkFso8xdpOxsU3ZFkU8kbtTQPtuGoYNpUwtTyaUPAvgVqWaIqDetEV
	 1xou0ZMi9KDdTH8TXNMpGbo5vsQa8uqEr4AGJmtm0JZZyaOQKpu6bEoYMWFGfHYINg9gT
	 8Vd+6O9zo4fUgRdHXhvpQh4hgCDYiZQR3lY0vqpmVNfXYz7hE2lNVz5l1SpKnsRWsvIq5
	 jFNg4+/f+i8AH1ooM1VyKyXR/jLUbcyhfdcKKIjtXNVmXui9U7xVfN+McD8mKeDn42w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kmpvX+V+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MpeA+qEq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kmpvX+V+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MpeA+qEq;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E923B606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E923B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kmpvX+V+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MpeA+qEq;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=kmpvX+V+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MpeA+qEq
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2344D1F7A9;
	Wed, 28 Oct 2026 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793198610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKviTkak77ulmwwI7l/FFLltokotzZ9slH39nehkhIw=;
	b=kmpvX+V+BOfM+8cwWiL1eH3rJuDHf2AVKYCSUi4cqnT3rWdOVe6RxiagC2qmZZ9Olcag8Q
	/GwpJ7zSFOePzToIeQPVPXOHKTkzv+5WEi+1pVzAM7Dz1Opx358xyQCZAAIV3tX+Xm2HpQ
	7AuNBy0nZ6aYEfju1ElfxbR5I9Zq2vA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793198610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKviTkak77ulmwwI7l/FFLltokotzZ9slH39nehkhIw=;
	b=MpeA+qEqtG+3fI9uHAbEOYHQzZgIw7YL6LTq60d8WlWlRcWH7Vgae28OSFJ7UAXMo2yWXD
	9Nspg71uCOkc/OAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kmpvX+V+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MpeA+qEq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793198610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKviTkak77ulmwwI7l/FFLltokotzZ9slH39nehkhIw=;
	b=kmpvX+V+BOfM+8cwWiL1eH3rJuDHf2AVKYCSUi4cqnT3rWdOVe6RxiagC2qmZZ9Olcag8Q
	/GwpJ7zSFOePzToIeQPVPXOHKTkzv+5WEi+1pVzAM7Dz1Opx358xyQCZAAIV3tX+Xm2HpQ
	7AuNBy0nZ6aYEfju1ElfxbR5I9Zq2vA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793198610;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kKviTkak77ulmwwI7l/FFLltokotzZ9slH39nehkhIw=;
	b=MpeA+qEqtG+3fI9uHAbEOYHQzZgIw7YL6LTq60d8WlWlRcWH7Vgae28OSFJ7UAXMo2yWXD
	9Nspg71uCOkc/OAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF22213419;
	Wed, 28 Oct 2026 14:43:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CvXKJREK4mqHCQAAD6G6ig
	(envelope-from <hare@suse.de>); Wed, 28 Oct 2026 14:43:29 +0000
Message-ID: <22ef7c4d-2d79-42c9-929b-bb5726579425@suse.de>
Date: Wed, 28 Oct 2026 15:43:29 +0100
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
Subject: Re: [PATCH v3] nvme-tcp: fix NULL queue->ctrl dereference on
 reconnect
To: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>,
 linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
 hare@kernel.org, sgogte@purestorage.com, wagi@kernel.org,
 kanie@linux.alibaba.com, nilay@linux.ibm.com, linux-kernel@vger.kernel.org
References: <20261028143343.221936-1-christian.aurichzm@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20261028143343.221936-1-christian.aurichzm@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-12.00 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.00
X-Spam-Level: 
X-Rspamd-Queue-Id: 2344D1F7A9

On 10/28/26 3:33 PM, Christian Aurich Zanettini Martins wrote:
> Since commit 61b0ed3be81b ("nvme-tcp: parallelize I/O queue allocation
> and startup"), a reconnect that gets more I/O queues than before grows
> the tag set before the new queues are allocated. queue->ctrl is only
> set by nvme_tcp_alloc_queue(), so I/O submitted in between reaches
> nvme_tcp_queue_rq() on a queue that was never allocated and
> dereferences a NULL queue->ctrl:
> 
>    BUG: kernel NULL pointer dereference, address: 00000000000002ac
>    RIP: 0010:nvme_tcp_queue_rq+0x33/0x3b0
> 
> Add nvme_tcp_init_queue() for the queue fields that do not depend on
> the connection and call it for every queue when allocating the
> controller. Such requests are then requeued like on any other queue
> that is not live. send_mutex and io_work move there as well, and
> nvme_tcp_exit_queue() destroys the helper's mutexes when the controller
> is freed.
> 
> Fixes: 61b0ed3be81b ("nvme-tcp: parallelize I/O queue allocation and startup")
> Suggested-by: Keith Busch <kbusch@kernel.org>
> Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
> Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
> ---
> v3:
> - Add nvme_tcp_exit_queue() for the mutex_destroy() calls in
>    nvme_tcp_free_ctrl() (Hannes)
> - Keep Nilay's Reviewed-by, as the change is mechanical
> 
> v2:
> - Rebase on Guixin's v4 "nvme-tcp: Validate the queue state under the
>    queue lock in the address attribute" and move its queue_lock init
>    into the helper
> - Also move send_mutex and io_work into the helper, and destroy
>    send_mutex and pf_cache_lock next to queue_lock in
>    nvme_tcp_free_ctrl() (Keith)
> - Left in nvme_tcp_alloc_queue(): req_list and send_list, as resetting
>    them drops entries left over from the previous connection, and the
>    lockdep keys, which are per socket instance since commit 19bdb70c77d3
>    ("nvme-tcp: lockdep: use dynamic lockdep keys per socket instance")
> 
> Based on nvme-7.4 (9afc1b71d963) with "nvme-tcp: fix request PDU size
> when header digest is enabled" and Guixin's v4 on top. The last hunk
> assumes the conflict between those two in nvme_tcp_alloc_ctrl() is
> resolved by keeping both loop bodies and both comments. I can resend on
> top of nvme-7.4 once both are there.
> 
> Reproduced in QEMU with nvmet-tcp over loopback and
> CONFIG_NVME_MULTIPATH=n: connect with attr_qid_max=2, keep direct reads
> running on the CPUs that map to the new hw queues, then raise
> attr_qid_max to 4. Without the patch the host oopses as above by the
> second try; with v3, 8 of 8 tries go live, with and without lockdep.
> 30 resets under digest I/O, with a reader looping on the address
> attribute, also pass and are clean with lockdep.
> 
>   drivers/nvme/host/tcp.c | 64 ++++++++++++++++++++++-------------------
>   1 file changed, 35 insertions(+), 29 deletions(-)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
