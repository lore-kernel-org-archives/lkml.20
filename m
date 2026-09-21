Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA2C30F819
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 07:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974309; cv=none; b=SfXQkmtlzcwxkDzUG9HkyNcl4fUhHd+FCq4d8aHwLlz67oSYjlIjHDNI9VU6AUPF0v8ucSAGV8Ku/sZRbpeJeSq4nPrvfNW4sQMfVJCzDP0Hq1KsrS/i7YPrkp1VVTxaDswbFT1AN/CXWHnINAV7+9qih2aTyfMmL+weU9t4JkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974309; c=relaxed/simple;
	bh=wEjqi2AtQw7WHVs8yI/RI1/nFJxVCIMs4KwYqX7p46M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hwm2orYXZT559+8P0vkTqB3x5yN3wAaRsC3lh9ywZvQXlRgZDB15CFC1s70tOW4KfVJWl/xtqB4P2iQIjK8HQLIG+ZTrzpuc8o3DPEyXX9uONh6iqs8rnmpZgOWP41DI1lzLhfYoFuVtyyWhvztImZn4aDNr9jJDyIU9RyfiXp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NmatIp+/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DyJLhsAD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O1S/kZZE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rIbE3XUP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NmatIp+/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DyJLhsAD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O1S/kZZE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rIbE3XUP"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6E25221BB2;
	Mon, 21 Sep 2026 07:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789974301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gxKOYiwnSGccIXUUVnXis4FJuJJCk61rKpucnc5dxhU=;
	b=NmatIp+/fBnuk7Pe7A+/d9hlhCjv9vAunkYLJSbuw1mtOz46g2r79qYApD1o4URjlaVRhv
	3NTJN/rDo5DmXLix0ujtfNsof+ooMgMlKSzZXC4VR3FMg1BnxYJlbmR9qy0Bh5l5Fs3mv6
	rTERMNnTsIgi+Rff1jKea6YzX45Tc9c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789974301;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gxKOYiwnSGccIXUUVnXis4FJuJJCk61rKpucnc5dxhU=;
	b=DyJLhsADhOAIO8d7AdjSDYeP6cxrNaY7GYMNFJwvCoogVBNkpnFp4z0TcxTKLcVcf3iTU4
	tLOdLbXsTaUREoCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789974297; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gxKOYiwnSGccIXUUVnXis4FJuJJCk61rKpucnc5dxhU=;
	b=O1S/kZZE8fE7L6g5NJi8rmvHG7uo0xQm8izAC37+lyHiWeSCEnKugHZByVxxlF1QxtBexJ
	ebgJx41s4teK15kqXvI1VVALdpIssCNHFJzLgGZCBqp7yJF5MorRIxv1XIvdS26GiH7uUG
	9ZEvGJA7w+U9fR78Aquy4jjv4ivaEP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789974297;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gxKOYiwnSGccIXUUVnXis4FJuJJCk61rKpucnc5dxhU=;
	b=rIbE3XUPT/NYRlfmYy+CCNaAzmb+tbdNiovE8NSpmsCtZhDzrxQBMVJZPCX4H6V3ohOPEz
	wYkdVwzbWtXekiDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D461013793;
	Mon, 21 Sep 2026 07:04:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Qb3sIxjXsGp7VwAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 21 Sep 2026 07:04:56 +0000
Message-ID: <88046cf7-8c6c-45a2-aabe-68a8c9fff6a8@suse.de>
Date: Mon, 21 Sep 2026 09:04:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/18] nvme: Implement cross-controller reset recovery
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
 <20260918181614.3947933-9-mkhalfella@purestorage.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20260918181614.3947933-9-mkhalfella@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,kernel.org,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On 9/18/26 8:14 PM, Mohamed Khalfella wrote:
> A host that has more than one path connecting to an nvme subsystem
> typically has an nvme controller associated with every path. This is
> mostly applicable to nvmeof. If one path goes down, inflight IOs on that
> path should not be retried immediately on another path because this
> could lead to data corruption as described in TP4129. TP8028 defines
> cross-controller reset mechanism that can be used by host to terminate
> IOs on the failed path using one of the remaining healthy paths. Only
> after IOs are terminated, or long enough time passes as defined by
> TP4129, inflight IOs should be retried on another path. Implement core
> cross-controller reset shared logic to be used by the transports.
> 
> Signed-off-by: Mohamed Khalfella <mkhalfella@purestorage.com>
> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
> ---
>   drivers/nvme/host/constants.c |   1 +
>   drivers/nvme/host/core.c      | 152 ++++++++++++++++++++++++++++++++++
>   drivers/nvme/host/nvme.h      |  10 +++
>   3 files changed, 163 insertions(+)
> 
Reviewed-by: Hannes Reinecke <hare@kernel.org>

Cheers,

Hannes
-- 
Dr. Hannes Reinecke                  Kernel Storage Architect
hare@suse.de                                +49 911 74053 688
SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
