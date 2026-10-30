Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356156;
	b=x6Eg88UWOuiVGsulsVj4p0t0Qe6xXwkTdGVKKfNanOGLwCYToF4QpSAIWK4wwUxCeUKo
	 6gMutsENhEc+8eK29YXFvXyv5roAWKihPFJfcptBRlVJSVChBsnRh+pwyRKGoJ6PcPid5
	 tT9/V3Sv3GTkZ/bKiBdArFuriBN2KfgWpkIyYnHIn8VmqPUUKXrlr6+0M+IxEiRy+eMKS
	 EP64gdx08zRXrAyrB7zbN+Avg6pbO/TIodQzmH94eC/QFZ9bcvWmvhsvdXO++CSc0NySR
	 KmTYCZxtSqZ/AeUjvyHdrcCYCuc7l1tK3I4EgzClx19qSMOMtq6OeKAJOgUUEAI2eHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356156;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=vhkrKRzVq61WO+VDqVg4XCpohR1qz7EtQY5/jU1KiBY=;
	b=iaI2XAg+RonosDHWHJCb7XfYVhr5yPkryaQa37jOnpO/OEqgnLB+qRNlA6A+dhCyPcPT
	 ioMy/4eh3Yyzmk3HIK/PuwWjupkGvqaaJiNa40cHzyNphNP1Kj/B8P+jwQsOd3kP6jSvj
	 YEsLCd3YoVv3vArHkW2wkhwaOfP/FH3vKcfSAZshtNqxbCAGIGO6HbOKi39xJ45mRh1oK
	 RV/B9AnEsb8y4Ug/T/TEAMRhevAYQfMFZ9BL5I9MqHdo/1Nwm0wgaKM7veVeh4C/moJ16
	 mpOuzMPo/zf6NPAvOqRtA3HM759xXw8fd+M4Z+40IBJnt52NsjgNNDOvRyvYF2OAB4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1gZBGSiZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wCq4yPoU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1gZBGSiZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wCq4yPoU;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FAC606A335
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72FAC606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1gZBGSiZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wCq4yPoU;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1gZBGSiZ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=wCq4yPoU
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BD1151F387;
	Fri, 30 Oct 2026 10:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793356153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vhkrKRzVq61WO+VDqVg4XCpohR1qz7EtQY5/jU1KiBY=;
	b=1gZBGSiZtG3aW1MBmsV6bRh3u5lHn3dbugJKnlOYNLHbThRxhfmejBdRlq37JNilnicy18
	pw4FBESxfN32fnyXdQ3pMTLvGSSsT+vT5Q1T4HlDu1KS1f0ejZdryBqU0uQq7SrKMa38Qp
	qzQYh4rJwU/3ku8MPMDzgWSVIUnA4EU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793356153;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vhkrKRzVq61WO+VDqVg4XCpohR1qz7EtQY5/jU1KiBY=;
	b=wCq4yPoUvWnZjn854ow7phJW7TgLunTMAQP0p84sbGGpA33ZGEi1MRKaCYgqO5zsVOcn0Q
	VZ5LkI9k+zVXghDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793356153; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vhkrKRzVq61WO+VDqVg4XCpohR1qz7EtQY5/jU1KiBY=;
	b=1gZBGSiZtG3aW1MBmsV6bRh3u5lHn3dbugJKnlOYNLHbThRxhfmejBdRlq37JNilnicy18
	pw4FBESxfN32fnyXdQ3pMTLvGSSsT+vT5Q1T4HlDu1KS1f0ejZdryBqU0uQq7SrKMa38Qp
	qzQYh4rJwU/3ku8MPMDzgWSVIUnA4EU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793356153;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vhkrKRzVq61WO+VDqVg4XCpohR1qz7EtQY5/jU1KiBY=;
	b=wCq4yPoUvWnZjn854ow7phJW7TgLunTMAQP0p84sbGGpA33ZGEi1MRKaCYgqO5zsVOcn0Q
	VZ5LkI9k+zVXghDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 82EF713419;
	Fri, 30 Oct 2026 10:29:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PAdlF3lx5GoHHQAAD6G6ig
	(envelope-from <dwagner@suse.de>); Fri, 30 Oct 2026 10:29:13 +0000
Date: Fri, 30 Oct 2026 11:29:12 +0100
From: Daniel Wagner <dwagner@suse.de>
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Justin Tee <justin.tee@broadcom.com>, Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, 
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>, 
	Chaitanya Kulkarni <kch@nvidia.com>, James Smart <jsmart833426@gmail.com>, 
	Randy Jennings <randyj@purestorage.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 15/18] nvme-fc: Hold inflight requests while in
 FENCING state
Message-ID: <45d52d19-dbfc-49b9-a445-a8fb9e69abef@flourine.local>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-16-mkhalfella@purestorage.com>
 <d9563967-9ddb-4cd7-9149-d1f37522e1fa@flourine.local>
 <20261021212357.GZ2931-mkhalfella@purestorage.com>
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
In-Reply-To: <20261021212357.GZ2931-mkhalfella@purestorage.com>
X-Spamd-Result: default: False [-13.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,kernel.dk,lst.de,grimberg.me,broadcom.com,gmail.com,nvidia.com,purestorage.com,lists.infradead.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.30
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, Oct 21, 2026 at 02:23:57PM -0700, Mohamed Khalfella wrote:
> Adding new FCPOP_STATE_HELD will result in a more invasive change and it
> will result in nvme-fc no using nvme_cancel_tagset(). My intent with
> this change is to bring nvme-fc closer to other transport and only
> cancel inflight requests. synchronize_rcu() is a simpler in this case.

I am totally against introducing yet another synchronization method. Fix
it properly.
