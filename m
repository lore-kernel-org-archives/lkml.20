Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501151;
	b=KTGqq06fIzhGNfRVWpprNKU+TwivBvFmld9KWsC/auSE4+wK9pctob1lgeuQ8mV2fsmA
	 MvvlMHFHRqK256uIsGT2VdJAfJF/jjzHY5H/Gz+a7k6fDBPEfvLhYQ9uZ2RIrxrHe0jd1
	 FpZaN80AgMaBRsd63MLQqHIjstC4Rn1afL7lnC8Dk+LxB1MvqV1SDPXTI1niPntVHjpAv
	 A+WH0/aH/ptFf/a1NuGzJCsw0Jh1t5Cy1wdeF7LPLx3VMaZ9LR/NsB1Fg8p/8ncR1zvlD
	 qkmBVjOGiREwed9s19LyMOCuAt2/tSjiVn0Psjd9tTO2qU2QLhQfMKEvTf5kueEPkjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501151;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Rspamd-Action:X-Spam-Score:X-Spam-Flag:X-Spamd-Result:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Server;
	bh=tWrNx4AAhmtdf03HJHhKfo46RSKRGBnuyAOARsq5cY8=;
	b=vs/nd88vBCIimOnWA3zlB2kGVUIC3Pp1JE3cKk81MM3bIxjyorqfbGUFU300LvNAd+OG
	 H0PeoLj9YYuJfgQK8H+u9R07cfTpX2laPsMqYA0CIFbNtmslqBLNkDV6vg+TfnwEN63Pa
	 j+gn9dNk1Zcgv9ZI/Gw81b5LQ0n2AXRAfx9fP8pnjH6mKnc1JvEZO0tP9Z/pVkE8XJDRU
	 Zn75ZopLj4NwIloqcr6mB/kbKMYqr9SCcH0OrQ/6EI/Zqsbaoip0v32JxOK9HiKecYGvv
	 2emwK/7wqUBy8m6LKuw5vEkNb2DLy40FajYswag3BlfyVYBEQdU3FVA6WeM2RwU3bWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="oD0OusU/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YBzrWBxa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="oD0OusU/";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YBzrWBxa;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3B3606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A3B3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oD0OusU/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YBzrWBxa;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=oD0OusU/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YBzrWBxa
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4EC081F7C6;
	Tue, 20 Oct 2026 12:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792501149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tWrNx4AAhmtdf03HJHhKfo46RSKRGBnuyAOARsq5cY8=;
	b=oD0OusU/SLaseFS8AHwHSHVA1Ceraj2IBUuPq8xmW8ZTpbaKaXK56j2IWABFk0tccHgOrf
	hHM3TvNacyZb1h+VO6eBri7heWQuI5uLwtMYZbVEeT7AGXNlX+TNPo483+nT3UvcRVYKw5
	FHB9NYD/+6xMqpg+pCY6pUgmmeN3yVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792501149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tWrNx4AAhmtdf03HJHhKfo46RSKRGBnuyAOARsq5cY8=;
	b=YBzrWBxaFnvVyogimX1fBadiLdUNY3z4/dYxqcp5Ax12o1vMJITBkr0+3xwDix6uY6/EBu
	EQRbJ1hzxoqXzeCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="oD0OusU/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YBzrWBxa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792501149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tWrNx4AAhmtdf03HJHhKfo46RSKRGBnuyAOARsq5cY8=;
	b=oD0OusU/SLaseFS8AHwHSHVA1Ceraj2IBUuPq8xmW8ZTpbaKaXK56j2IWABFk0tccHgOrf
	hHM3TvNacyZb1h+VO6eBri7heWQuI5uLwtMYZbVEeT7AGXNlX+TNPo483+nT3UvcRVYKw5
	FHB9NYD/+6xMqpg+pCY6pUgmmeN3yVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792501149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tWrNx4AAhmtdf03HJHhKfo46RSKRGBnuyAOARsq5cY8=;
	b=YBzrWBxaFnvVyogimX1fBadiLdUNY3z4/dYxqcp5Ax12o1vMJITBkr0+3xwDix6uY6/EBu
	EQRbJ1hzxoqXzeCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12665136CC;
	Tue, 20 Oct 2026 12:59:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qfazN5xl12rnXgAAD6G6ig
	(envelope-from <dwagner@suse.de>); Tue, 20 Oct 2026 12:59:09 +0000
Date: Tue, 20 Oct 2026 14:59:04 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Justin Tee <justin.tee@broadcom.com>, Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
	Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
	Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6 02/18] nvmet/debugfs: Export controller CIU and CIRN
 via debugfs
Message-ID: <a3852ed1-4b6d-44e7-b4de-bc1c6a3b635b@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-3-mkhalfella@purestorage.com>
 <179241127352.3544975.2554197788837860779.b4-reply@b4>
 <20261019190106.GK2931-mkhalfella@purestorage.com>
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
In-Reply-To: <20261019190106.GK2931-mkhalfella@purestorage.com>
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org,suse.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Queue-Id: 4EC081F7C6
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Mon, Oct 19, 2026 at 12:01:06PM -0700, Mohamed Khalfella wrote:
> On Mon 2026-10-19 14:01:13 +0200, Daniel Wagner wrote:
> > On 2026-09-20 11:28 -0700, Mohamed Khalfella wrote:
> > > Export ctrl->ciu and ctrl->cirn as debugfs files under controller
> > > debugfs directory.
> > 
> > Could you add the 'why' part to the commit message?
> 
> target# grep . /sys/kernel/debug/nvmet/mysubsystem/ctrl1/{ciu,cirn}
> /sys/kernel/debug/nvmet/mysubsystem/ctrl1/ciu:57
> /sys/kernel/debug/nvmet/mysubsystem/ctrl1/cirn:42541d24813bb536
> target#
> 
> host# grep . /sys/class/nvme/nvme0/{cntlid,cirn,ciu}
> /sys/class/nvme/nvme0/cntlid:1
> /sys/class/nvme/nvme0/cirn:42541d24813bb536
> /sys/class/nvme/nvme0/ciu:57
> host# nvme admin-passthru \
>   --opcode 0x38 \
>   --cdw10=$(( 0x1 | 0x57<<16 )) \
>   --cdw12=$(( 0x42541d24813bb536 & 0xffffffff )) \
>   --cdw13=$(( ( 0x42541d24813bb536 >> 32 ) & 0xffffffff )) \
>   /dev/nvme1
> Admin Command Vendor Specific is Success and result: 0x00000000
> host#

In the meantime, nvme-cli learned to dump those values as well. I'm not
sure if it's worth adding these just for this use case.


