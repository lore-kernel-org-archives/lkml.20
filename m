Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510120;
	b=tSLDqPcNVwO0BmLZMiBErxbY2CUrLNe0IAgvfW/YluAZ/6xANMbEJoKdTL3o6KhaQFrX
	 7rHu5KrrhJweKZJFAeAIzkN+XYNIagdCUvK26ai+g+0jubV2YCwNqhovgEdKkIHUWgu25
	 lvBr1ugEadx5uL7LJkzUxgeJeEvwtW1Z1PNPeo721jIOeah1XFiF7fKJ7mN/oQqSFIPei
	 1/9BsaM4Ne7E8U93taY4j2jAyNQMrvJsZZkRHmNH0MW3gRVQWeQ4up7CDz/d3BoSvyhq+
	 JxD8RazJAvuz6K2RZqMgKwnVSERjLCWgusxMRF5uSVCdft6nD726LQDtDgXOAQvTgnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510120;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=TD9v898UX3qF2ylvN4koKehtQeTz/HyOzZO9+Yk87D8=;
	b=cnXsjFwCKfm+cewx5+KTd7/u9gki0cqyjt0QEPUjjFU7QNZ4ha6xA5lGcVPwGQSp3iX6
	 7XYALi33Ui9/5ls7f6bl2E9Y0/qj26tMzuARWNCOkWrbU9cJV4J7TeRsAKvcIl5YXqPj0
	 kJJHGDjnF/98IoQLP5I+vqboESmjLGIZoTCc/H/4AfR29YHA+xRDumrADyesHudoGs6jz
	 li6EA7HZWgbmkoW9ClMGQNoMF7994QGpT0XJRmlYqHXOnEC2X5VNi2a4UrmDDmhfmFoo8
	 liJtCU1NjEGqKOzwgw839+cYnwZG1eCAwLPd6wBcHDKodYftlyTlZ7VuE8FWoLwsibw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1bpAITcC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=W6xma5eb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1bpAITcC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=W6xma5eb;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859AA60A2633
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 859AA60A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1bpAITcC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=W6xma5eb;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1bpAITcC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=W6xma5eb
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CA2BC21BD4;
	Tue, 20 Oct 2026 15:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792510117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TD9v898UX3qF2ylvN4koKehtQeTz/HyOzZO9+Yk87D8=;
	b=1bpAITcCb5f898dun/BD8wIgbqpZueKF+RIkk1lSsH7YSXbtgB81M8OqBTuUBImXNUAigH
	wVvaNVb0ikxAy3YF8LmkebHeEO13guL9G6cMW5FNwOCtIo79lT9d1uMz/SVXJn/ieB9Gxq
	ruQGY2HgVypvGlT6tkmCGXH6CHxiWqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792510117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TD9v898UX3qF2ylvN4koKehtQeTz/HyOzZO9+Yk87D8=;
	b=W6xma5ebx8od1FAK84AMNC3VmK9clUwX5y5sBCHcfO6t9oyZYXq5UjzWX+eC1rh6iVqEdj
	q2C6ZWNqUvBUX7Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792510117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TD9v898UX3qF2ylvN4koKehtQeTz/HyOzZO9+Yk87D8=;
	b=1bpAITcCb5f898dun/BD8wIgbqpZueKF+RIkk1lSsH7YSXbtgB81M8OqBTuUBImXNUAigH
	wVvaNVb0ikxAy3YF8LmkebHeEO13guL9G6cMW5FNwOCtIo79lT9d1uMz/SVXJn/ieB9Gxq
	ruQGY2HgVypvGlT6tkmCGXH6CHxiWqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792510117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TD9v898UX3qF2ylvN4koKehtQeTz/HyOzZO9+Yk87D8=;
	b=W6xma5ebx8od1FAK84AMNC3VmK9clUwX5y5sBCHcfO6t9oyZYXq5UjzWX+eC1rh6iVqEdj
	q2C6ZWNqUvBUX7Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94139136C6;
	Tue, 20 Oct 2026 15:28:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G/wkHKWI12rmfQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 20 Oct 2026 15:28:37 +0000
Date: Tue, 20 Oct 2026 17:28:32 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Saravanan D <saravanand@crusoe.ai>
Cc: linux-nvme@lists.infradead.org, kbusch@kernel.org, hch@lst.de, 
	sagi@grimberg.me, axboe@kernel.dk, nilay@linux.ibm.com, sgogte@purestorage.com, 
	hare@kernel.org, linux-kernel@vger.kernel.org, iyamahata@crusoe.ai, 
	kiyer@crusoe.ai, ganbalagane@crusoe.ai, sjpark@crusoe.ai
Subject: Re: [PATCH v5 2/2] nvme-tcp: allow setting per-queue io_cpu through
 sysfs
Message-ID: <0ee4d281-61b4-458e-92c6-7fff3e50c0ec@flourine.local>
References: <20261018010059.83120-1-saravanand@crusoe.ai>
 <20261018010059.83120-3-saravanand@crusoe.ai>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018010059.83120-3-saravanand@crusoe.ai>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sat, Oct 17, 2026 at 06:00:59PM -0700, Saravanan D wrote:
> nvme_tcp_set_queue_io_cpu() picks each queue's io_cpu at connect time
> as the least loaded CPU in the queue's blk-mq map group, and all socket
> work runs there for the connection's lifetime. This decision falls
> short when the host partitions its CPUs after connect time. On a 384
> cpu multi tenant host with 128 queue controllers, blk-mq folds three
> CPUs into every map group, some groups straddle two tenants' cpusets,
> and 9% of nvme_tcp_io_work executions ran outside the submitting VM's
> cpuset, seen by the neighbor as steal time.
> 
> Expose the io_cpu in each I/O queue's directory
> 
>   /sys/class/nvme/nvmeX/queues/<qid>/io_cpu
> 
> so a control plane that owns CPU placement can set it directly instead
> of relying on the driver's heuristic. The attribute accepts a decimal
> cpu number, -1 or "unbound". A user assignment, unbound included, is
> marked in the queue flags, persists across reconnects and is never
> reselected by the driver. The read-only managed attribute reports 1
> while io_cpu is driver managed and 0 once the user assigned it. The
> accounting of nvme_tcp_cpu_queues applies regardless of who set the
> io_cpu.
> 
> A queue's directory is added when the queue is allocated and removed
> when it is freed, before the queue is torn down, so a sysfs store
> never runs on a freed queue. The queues directory is created before
> the I/O queues are set up in parallel. All io_cpu writes, from sysfs
> and from the driver, serialize with the accounting under
> nvme_tcp_cpu_queues_lock, while the I/O paths read io_cpu locklessly.
> The queue stop now clears NVME_TCP_Q_IO_CPU_SET under that lock, since
> a sysfs store may move io_cpu in between.
> 
> nvme_tcp_free_queue() now clears NVME_TCP_Q_IO_CPU_SET and drops its
> count, because a queue can still be counted when it is freed. A sysfs
> store may have run after the queue stop, or the connect may have
> failed, and the setup error path frees such a queue without calling
> nvme_tcp_stop_queue(), where the count is normally dropped.
 
This looks good, just trying to wrap my head around with isolcpu (yeah,
doing a bit of work in that area makes me a paranoid).

I think it make sense to allow that the user can change queue CPU
pinning during runtime even with isolcpu enabled. And then the question
is should this be connected to cgroups?
