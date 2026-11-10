Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316007;
	b=UUQqueTfmdn82FTbYIsrrmoq8tBdmRh4YzaWJGTpt+wF4vlKBak9YlDWMkGJXZyiQAgd
	 Y2SSyANUhUzGoOTtZ1IjsJ52zYff0PVGvXyHjCifAzaZtLd61L31Chn6VPLle84EPc6By
	 hmZmIeI/dG80vGVczkbHdYro745aYTae6A/E9XFiaU6etsMuZ2Vgqk+T3iR3IfP2/iY9C
	 rVn2TO3ftW3lKs5xI/vkC0irTaXNFVrooZsa83ZXfEplhlML+4sEViPPRoSnbY+phWmWL
	 pLfFFDStv7EK2/qltTzlBfC0JyUXx7KfKtNmubhxtIjwjaQ0vEoioFezujDp3LhypCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316007;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:
	 X-Spam-Level:X-Spam-Flag;
	bh=G0gFrTol3JHvOSBxRDipQZTJIRgF+SciwUJkiGxDaik=;
	b=SXyFOi4fM8EDEkGMyKWfV/OTOCXLD7x3C4r3hTBAee2Ib8hJvebf4lA6hM6nEuh1SQLV
	 A2kjp4ZSMOwEaP7MHlTWo8NVSLW9k8eowOPH5zY9gd4Z3DCjAQA9yipkD1lDcpQZNSMbR
	 4TFw2epR0AlnezQh+irhwMinNGoc/w395lNjTDX/SsSHZC7f2G2+7K0SS00u+R6TZJVwe
	 DWDllkYXnYW1eyo9rflHx4ZEHH7lFXah24dPWuxfy58rRlRa9EeLTw6meNfs2Wo/LRqS/
	 1s/VSVF/tvAVpyLmJlKZ58WfYfLYdloZXDPkCKsKEv80MOn4Stbf8HOkPgtkJSTbAhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hbFZtOe8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Q99gpGJZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=F290I41H;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VoW0kdOp;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDBD606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CDBD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=hbFZtOe8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Q99gpGJZ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=F290I41H;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VoW0kdOp
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A6911F7DD;
	Tue, 10 Nov 2026 13:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794316004; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G0gFrTol3JHvOSBxRDipQZTJIRgF+SciwUJkiGxDaik=;
	b=hbFZtOe8SJy8FNXLt9bXvS/K3jrJhuRrdEHwmeg9wAabLvFMN4a3Hjggz/UET4OaMlBJol
	Vd/9CzsinlDBoLphrEhPXNQ+B5rNHkPbvaygwNRLXnlJG01jshusEgHz2fCcNEcYd3A48R
	sFb8MkHdTntD8IkDFlrHc0x1bNF/ca0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794316004;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G0gFrTol3JHvOSBxRDipQZTJIRgF+SciwUJkiGxDaik=;
	b=Q99gpGJZ//vFta9sXfYY+RtFkkf4Gt1pYfPCITD4K3GgymlOXP/k9sObOTCuv9WVSoCfS4
	UlkLll6kyNtN8hAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794316003; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G0gFrTol3JHvOSBxRDipQZTJIRgF+SciwUJkiGxDaik=;
	b=F290I41HBBaxuUMHcHl8pmgbhybuccfPTSd/nr2uqmwVyMP4opJHHQssJlJL2Ls0hytwh9
	cMnVDM8cXTdtyX0l4ka9+4V9e8Rln1s8+qy7md1x8JqYBipcu3/zJnjV5WE6h8qGPdgMak
	KEyZxK4I1KFxXIin2JYoXl0P7PSpxk8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794316003;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G0gFrTol3JHvOSBxRDipQZTJIRgF+SciwUJkiGxDaik=;
	b=VoW0kdOpCxxLDz9umW8IpbG87bIyTf8YTYlfUpnTgfcPKHwGheDzBL5pc11+gNfQg+ErHF
	KtA3CL5NdxIivpCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4892B1339F;
	Tue, 10 Nov 2026 13:06:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mD4mCeMW82oCTwAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 10 Nov 2026 13:06:43 +0000
Message-ID: <18db3394-8a02-4578-881c-aece94688c9c@suse.de>
Date: Tue, 10 Nov 2026 14:06:42 +0100
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
Subject: Re: [PATCH v8 1/2] nvme: add per-queue sysfs directories
To: Saravanan D <saravanand@crusoe.ai>, linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, axboe@kernel.dk,
 nilay@linux.ibm.com, dwagner@suse.de, sgogte@purestorage.com,
 hare@kernel.org, linux-kernel@vger.kernel.org, iyamahata@crusoe.ai,
 kiyer@crusoe.ai, ganbalagane@crusoe.ai, sjpark@crusoe.ai, bchen@crusoe.ai
References: <cover.1794015622.git.saravanand@crusoe.ai>
 <ce12f1742ea7f8699d85666e4d9d8a2a9d77c90e.1794015622.git.saravanand@crusoe.ai>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <ce12f1742ea7f8699d85666e4d9d8a2a9d77c90e.1794015622.git.saravanand@crusoe.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-13.29 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[crusoe.ai:email,suse.de:email,imap1.dmz-prg2.suse.org:helo,grimberg.me:email]
X-Spam-Score: -13.29
X-Spam-Level: 
X-Spam-Flag: NO

On 11/7/26 10:53 AM, Saravanan D wrote:
> Per I/O queue transport state, such as the nvme-tcp io_cpu, has
> nowhere to live in sysfs, since the core has no directory for
> individual queues.
> 
> Add helpers that create the controller's queues directory and add or
> remove one directory per queue
> 
>    /sys/class/nvme/nvmeX/queues/<qid>/
> 
> carrying the attributes a transport sets in the new queue_attr_groups
> member of struct nvme_ctrl_ops. For such transports nvme_add_ctrl()
> creates the queues directory. It holds a reference on the controller
> device, so nvme_uninit_ctrl() deletes it before deleting the device,
> after the transport has removed the queue directories.
> 
> The transport adds a queue's directory when it sets the queue up and
> removes it when it frees the queue, so the directories follow the
> queues across reconnects and changes in the queue count. The core
> allocates each queue directory and its release frees only that
> allocation. Removal waits for running attribute callbacks, so the
> transport may tear the queue down once it returns.
> 
> Suggested-by: Sagi Grimberg <sagi@grimberg.me>
> Link: https://lore.kernel.org/linux-nvme/13c160d0-0657-47ce-9a16-58d348267ab0@grimberg.me/
> Assisted-by: Claude:claude-opus-5-5 [Claude Code]
> Signed-off-by: Saravanan D <saravanand@crusoe.ai>
> ---
>   drivers/nvme/host/core.c  | 12 ++++++
>   drivers/nvme/host/nvme.h  | 25 +++++++++++
>   drivers/nvme/host/sysfs.c | 90 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 127 insertions(+)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
