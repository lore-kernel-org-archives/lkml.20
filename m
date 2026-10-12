Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984F2472543
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797427; cv=none; b=Wlk6kIHpbLZLW5T4STO25SDN7EOAAzElaoELA6wj1DVncYAiFw/j/21dfzRipNit60OxKA6VbqXYUVpWvVgVEPpSxLIRW9yz+GwX8NhivZRqE5Hb8pQGtsFDgIqB+Aq5dS09HB9WRj7FMy0/e5TexBjwcnQQ2SBbxVyGfUxle2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797427; c=relaxed/simple;
	bh=mGNy9GPysmGs1RHCzbQ5IFad2Re5EqYrnz+M7d6mYZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdtSL2FX/AHkvvSaCtJdqctp5FWx3D8AencP4ZsUHj0BipmXFZhnFSV/hwuMlp03wtQjma9W8svt54OVXOj445veMXvr/XtBIFdj/+y9pCruzpYG4exkvtWlLhyPYblTmjn+0078LFULX6LSXioKIf/D9UMwK4WNehtWlQRfFLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ck0OmmrM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JNBs9TL2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ck0OmmrM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JNBs9TL2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ck0OmmrM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JNBs9TL2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ck0OmmrM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JNBs9TL2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 636AE21D96;
	Mon, 12 Oct 2026 09:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791797424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=03+1hE3bYRORO4eEcekQVbtkmb0CZBJTIiQ8tV3eKNQ=;
	b=ck0OmmrMLlgOGjvTuDIo1I9UCObSW/6NnH7zTFEfbUxpJjRvKT9YL/JGPMrJgt7iIssA+F
	WO6Uh3r0pHc3NpfEPDfsoLgggPySdTsg1k+t9IXR8JJroCPZ+U5MzI51Yamlkh/kWGG5rE
	IRKWig5k+ohyk5tKsrZ1B0o4aWkYf3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791797424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=03+1hE3bYRORO4eEcekQVbtkmb0CZBJTIiQ8tV3eKNQ=;
	b=JNBs9TL2lnJx9XsxPTXDQStwr3Aefo4jv/Rm3FrBfpjsWNVo36kJDuiCnjeNG1ByRLuiIX
	XuJkisd4CdjAV9Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791797424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=03+1hE3bYRORO4eEcekQVbtkmb0CZBJTIiQ8tV3eKNQ=;
	b=ck0OmmrMLlgOGjvTuDIo1I9UCObSW/6NnH7zTFEfbUxpJjRvKT9YL/JGPMrJgt7iIssA+F
	WO6Uh3r0pHc3NpfEPDfsoLgggPySdTsg1k+t9IXR8JJroCPZ+U5MzI51Yamlkh/kWGG5rE
	IRKWig5k+ohyk5tKsrZ1B0o4aWkYf3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791797424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=03+1hE3bYRORO4eEcekQVbtkmb0CZBJTIiQ8tV3eKNQ=;
	b=JNBs9TL2lnJx9XsxPTXDQStwr3Aefo4jv/Rm3FrBfpjsWNVo36kJDuiCnjeNG1ByRLuiIX
	XuJkisd4CdjAV9Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B3CC13314;
	Mon, 12 Oct 2026 09:30:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P7LSA7CozGrGagAAD6G6ig
	(envelope-from <dwagner@suse.de>); Mon, 12 Oct 2026 09:30:24 +0000
Date: Mon, 12 Oct 2026 11:30:19 +0200
From: Daniel Wagner <dwagner@suse.de>
To: Palla Raghunath <raghunathpalla.0209@gmail.com>
Cc: Justin Tee <justin.tee@broadcom.com>, 
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, Paul Ely <paul.ely@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, 
	Keith Busch <kbusch@kernel.org>, Hannes Reinecke <hare@suse.de>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Brigham Campbell <me@brighamcampbell.com>, linux-kernel-mentees@lists.linux.dev, 
	syzbot+da94a51633758d13bd63@syzkaller.appspotmail.com
Subject: Re: [PATCH] nvmet-fc: don't drop the last assoc reference in
 nvmet_fc_delete_ctrl()
Message-ID: <b32efbb3-7700-4da0-96a5-ec828f471578@flourine.local>
References: <20261008191848.47066-1-raghunathpalla.0209@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008191848.47066-1-raghunathpalla.0209@gmail.com>
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[da94a51633758d13bd63];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,lst.de,grimberg.me,nvidia.com,kernel.org,suse.de,lists.infradead.org,vger.kernel.org,brighamcampbell.com,lists.linux.dev,syzkaller.appspotmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email]

On Thu, Oct 08, 2026 at 08:18:48PM +0100, Palla Raghunath wrote:
> syzbot hit a recursive locking report on subsys->lock when a subsystem
> is unlinked from an FC port.
> 
> nvmet_port_del_ctrls() holds subsys->lock while it calls ->delete_ctrl()
> for each controller. nvmet_fc_delete_ctrl() grabs a reference on the
> association, queues del_work and then drops the reference. If del_work
> gets to run to completion before that put, ours is the last reference.
> Freeing the assoc tears down the queues, the last nvmet_cq_put() drops
> the last ctrl reference, and nvmet_ctrl_free() goes for subsys->lock
> again:
> 
>   WARNING: possible recursive locking detected
>   ...
>    nvmet_ctrl_free+0xa6/0x8e0 drivers/nvme/target/core.c:1766
>    nvmet_cq_put+0x158/0x200 drivers/nvme/target/core.c:848
>    nvmet_fc_target_assoc_free+0x418/0x2220 drivers/nvme/target/fc.c:1173
>    nvmet_fc_delete_ctrl+0x717/0x7e0 drivers/nvme/target/fc.c:1581
>    nvmet_port_del_ctrls+0xfb/0x150 drivers/nvme/target/core.c:311
>    nvmet_port_subsys_drop_link+0x1e8/0x310 drivers/nvme/target/configfs.c:1119
> 
> It's a real hang, not only a lockdep warning. I reproduced it with
> fcloop by putting an msleep() before the put: rm on the configfs link
> gets stuck in D state for good.
> 
> I don't think we need that reference at all.

Yes, you are correct. The reference does not protect from del_work
getting scheduled. Indeed this is buggy and your fix looks correct.

Thanks!

Reviewed-by: Daniel Wagner <dwagner@suse.de>
