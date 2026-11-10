Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317091;
	b=QtWJHYliK5xisp56sXtrhkOWdfTutcbe/oIQFN9dgeo46ODopYzILuG1zNWeVc3GLt8/
	 gAwvAxy9gU/CEC30sxmk+suOwkLlfbtq0ZXYLGFHjmYWIIClFBGaJwcEnZMJblONQIc5y
	 EQJ9Nour6Ep+naNTRwBRSuQCujeV70ElNUGiRfcUPRcxkT/ib3fKVMvgpSfXrYQdl7hve
	 7p4xfwtxSKMzYpTaoxu1pAcrxZ4RmiwDw2oiDSUOCnHO8iGxlnK2JEBCB/eifsApwlg1/
	 F8NTN7PL1jbXmWSFohacT1kqKnJX6TpJ5j6EvDYqEZAmzxpkIW/y/nieTy7jSztW1XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317091;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:
	 X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=8HkfiwGNy2h7VeZMKNE/o6dSFsK+MzSs49/WS0gcf3A=;
	b=DjTuIP1bcktCfH8Q01bB9Kbq7+fKKQPtlX06Rmt75vZxsabKGX5AkUZHhd2Y60ma0NSZ
	 AyIYopXOLNNSEc32ACULfqElfer4MMSwmpSvQH6XS187MyVbXhP1EX/kd0U+meWKRB7vl
	 y7kMXXGmgUugFylykgLFpY/W8WA06HwD/Fb+sgNv1TnfQYcF2C9QRBfPqZ6H0Qfkpx8VW
	 62XQkQLtXnKexP7y43G3Gci1JozUCs6nORcomD1FQhFE1o+R2IxZ0tnUXFurRu+B1eiCY
	 fGZajlyOCYODdAIxpZyphjhO9gxV4AtDLsBTKp4DlsF7ChseuYFcTwu9HDIhJbEAMWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=suse.cz;
	spf=pass smtp.mailfrom=suse.cz;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=RqZJjzBR;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JgjUJKcZ;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=RqZJjzBR;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JgjUJKcZ;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745E5606B6F5
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:24:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 745E5606B6F5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=RqZJjzBR;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JgjUJKcZ;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=RqZJjzBR;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JgjUJKcZ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6FEBE1F461;
	Tue, 10 Nov 2026 13:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1794317087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8HkfiwGNy2h7VeZMKNE/o6dSFsK+MzSs49/WS0gcf3A=;
	b=RqZJjzBRXHmZoMBPjEiE3WT01aRZ/OsmITyAMxxKw8xvZZyvNr2kJ/e0xFzVS85K0WiGy+
	mW9htD7ENQi8qPtdLVTzGth2Ttjo/v4Et3fKWqo2pYi7g3XZZlZKRJMtyEyv/L4jbRMtB7
	mjcdCJuqugDfvaMVuKOf4bqCmLSDmtg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1794317087;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8HkfiwGNy2h7VeZMKNE/o6dSFsK+MzSs49/WS0gcf3A=;
	b=JgjUJKcZPkETAY/mDBsmrsHYgG0IQSgp1VW8dkwMBAwx4/wfIoHB85E/zN711HE557mXge
	sn902A1XjKAZ/BAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=RqZJjzBR;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=JgjUJKcZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1794317087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8HkfiwGNy2h7VeZMKNE/o6dSFsK+MzSs49/WS0gcf3A=;
	b=RqZJjzBRXHmZoMBPjEiE3WT01aRZ/OsmITyAMxxKw8xvZZyvNr2kJ/e0xFzVS85K0WiGy+
	mW9htD7ENQi8qPtdLVTzGth2Ttjo/v4Et3fKWqo2pYi7g3XZZlZKRJMtyEyv/L4jbRMtB7
	mjcdCJuqugDfvaMVuKOf4bqCmLSDmtg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1794317087;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8HkfiwGNy2h7VeZMKNE/o6dSFsK+MzSs49/WS0gcf3A=;
	b=JgjUJKcZPkETAY/mDBsmrsHYgG0IQSgp1VW8dkwMBAwx4/wfIoHB85E/zN711HE557mXge
	sn902A1XjKAZ/BAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 485581339F;
	Tue, 10 Nov 2026 13:24:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HPpGCR8b82p2YQAAD6G6ig
	(envelope-from <jack@suse.cz>); Tue, 10 Nov 2026 13:24:47 +0000
Received: by quack.suse.cz (Postfix, from userid 1000)
	id CB15322505; Tue, 10 Nov 2026 14:24:46 +0100 (CET)
Date: Tue, 10 Nov 2026 14:24:46 +0100
From: Jan Kara <jack@suse.cz>
To: n3rd <18670333770@163.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Jan Kara <jack@suse.cz>, "security@kernel.org" <security@kernel.org>
Subject: Re: [SECURITY] nstree: listns() ns_id=U64_MAX pagination cursor
 wraparound
Message-ID: <ien7y3bwd2f5ebikb4zg7b6mryoeeq6ckotryssbul56tteppn@v2kl7edlyufx>
References: <3b4dd66c.bc0b3.1a1c580229e.Coremail.18670333770@163.com>
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
In-Reply-To: <3b4dd66c.bc0b3.1a1c580229e.Coremail.18670333770@163.com>
X-Rspamd-Queue-Id: 6FEBE1F461
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-13.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.01

On Tue 10-11-26 20:47:51, n3rd wrote:
> I am reporting a security bug in the Linux kernel.
> 
> 1. Affected kernel versions
> Linux v7.3-rc7 (mainline, built and tested as 7.3.0-rc7 on a KASAN
> kernel) is affected and was reproduced twice. For the other versions I
> rely on a static comparison rather than on my own runs: kernel/nstree.c
> has the git blob hash 831f279d174a32c95953189aa7d9d3dd0ff11a38 in v7.2.9,
> v7.3-rc6 and v7.3-rc7, and the three affected statements sit at the same
> lines in all three. v7.2.9 and later v7.2 stable releases, and v7.3-rc6,
> are therefore affected as well, but I did not boot those kernels myself.
> Earlier versions were not tested or bisected. There is no upstream fix as
> of v7.3-rc7.

Please always verify your reports against linux-next before wasting
everybody's time. This one was fixed by 2a1887000e2d ("listns: don't wrap
around with a U64_MAX cursor").

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
