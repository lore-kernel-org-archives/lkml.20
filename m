Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB926490BF2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432801; cv=none; b=GRcve91EBy34OiwpkccVEDPbinL1vU3TzbUmR7kqyNQTRfqFK7hpAx6HkhdvEatv0BkyK6baI3xOslC3sDsSUZn1bkPVntBK12SvcaWQYoSDd8Jt3lCOpdLhCo8BqIlGb7aoPgz59szF/x9cOiabxuoc6NH15stnCEwMdrrkTxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432801; c=relaxed/simple;
	bh=K5/5a8tz01vve08ekdabKuDGn37Py/ouODSDMzhNlSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERmEKFWjniPUy/Jbxu9BzLxlVfTFdBQ0YIC+0pdSvHSBFo41TdoYrUerf9ZBOLWqtva4gzWsC6uEOYwy+MYZImRAGTcKaOHaUhhf4jpLPQrt3Rhnio3ZPmhLUvKFN69MmbaMSFxx/4EqDqfw6ppsd9y6B7dVXPcNBpsqF06oAwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=vNtKS3sR; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=lhWElenk; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=OYTRYWJL; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=qTm9WZjb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="vNtKS3sR";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="lhWElenk";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="OYTRYWJL";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="qTm9WZjb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 80DC921CF5;
	Thu,  3 Sep 2026 10:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788432793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6bT2W1NJX2HLlcsptLyaoYCmw7rdef1LdiLQlhEHcBY=;
	b=vNtKS3sRLXHYQxumqU5HKH6Ghvsim6rCmdfwt9kTvh52eSeAiTBl/QTDIlXrHz7PNGWqu+
	sCXtS4AqPONvn0ALOGZfMLq5DKONdKWjX2vt3EJJsu+Q5RmR+XykKYCEXnhwNPsJlf4A8B
	EKIm2EcZRdkdFBytmH3rz2OpUhtcYUs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788432793;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6bT2W1NJX2HLlcsptLyaoYCmw7rdef1LdiLQlhEHcBY=;
	b=lhWElenkV/DcqzzICeqLAT74fT2LzmS0uE2O2kwjzKRy5ZQ/7MX3AQ7zji4E2DoVWnZ0om
	sidYnGrOtddYaoCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=OYTRYWJL;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=qTm9WZjb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788432789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6bT2W1NJX2HLlcsptLyaoYCmw7rdef1LdiLQlhEHcBY=;
	b=OYTRYWJL1u/OsiAtw238oHOT4uUXejETj7JQ0Dxb5Dxalb7mdxhxy5eVq6dNOK5dzyGAIa
	5gtTWr13VRdCIcsu8iDYlud3o3qpU28XxZt5sbL/5zpWVTBtx++lNpRLWmPkLMSOnQ7wWR
	OW4xSJjJorNe+Qnm2v3poE8VdnE0cRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788432789;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6bT2W1NJX2HLlcsptLyaoYCmw7rdef1LdiLQlhEHcBY=;
	b=qTm9WZjbZs6VZIWW6B+F/Whikik8m6OHZppZwqyO6VcvgMp+sLsxfpoHitq9nA4hRL/TT2
	RtFQOqzcTG7293DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 621BB136E6;
	Thu,  3 Sep 2026 10:53:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RnvnF5VRmWouOgAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 03 Sep 2026 10:53:09 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id EF9C0A13AC; Thu, 03 Sep 2026 12:53:04 +0200 (CEST)
Date: Thu, 3 Sep 2026 12:53:04 +0200
From: Jan Kara <jack@suse.cz>
To: CJ <firefly0158@163.com>
Cc: jack@suse.com, linux-kernel@vger.kernel.org, 
	syzbot+61564e5023b7229ec85d@syzkaller.appspotmail.com
Subject: Re: [BUG] udf: possible use-after-free in udf_close_lvid
Message-ID: <xxp4ckrjkhch6fjccjic62jm4cejqudp5yiokoqd2sl37pukrm@nxi3ijmxzrny>
References: <451669fc.58e2.1a0661e7329.Coremail.firefly0158@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <451669fc.58e2.1a0661e7329.Coremail.firefly0158@163.com>
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 80DC921CF5
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TAGGED_RCPT(0.00)[61564e5023b7229ec85d];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,syzkaller.appspot.com:url,suse.com:email]
X-Spam-Flag: NO
X-Spam-Score: -2.51

Hello!

On Thu 03-09-26 15:14:26, CJ wrote:
> I am reporting that use-after-free in udf_close_lvid appears to remain
> reproducible with a migrated syzkaller reproducer on Linux 7.2-rc3. The
> tested HEAD commit is a13c140cc289c0b7b3770bce5b3ad42ab35074aa.

You can try with linux-next. I have queued one UDF fix for incorrect LVID
handling.

> The reproducer mounts and unmounts a crafted UDF image, reaching
> udf_put_super() and udf_close_lvid() during superblock teardown.

I'm sorry but I don't have capacity to address all these "maliciously
corrupted image causes issues" bugs and I'm even less willing to run random
code fetched from pastebin.com. If the report is from official syzbot
instance, I might have a look on time-permitting basis. BTW the syzbot
report you reference below has long been fixed so that's a different bug
(although a similar backtrace).

								Honza

> The target run faults in udf_close_lvid(), while the structurally matching
> archived report identifies a use-after-free write in the same function and
> teardown path.
> 
> 
> This looks like lifetime or teardown ordering around the logical volume
> integrity descriptor, allowing udf_close_lvid() to access storage that has
> already been released.
> 
> 
> This issue was previously reported at:
> 
> 
> https://syzkaller.appspot.com/bug?extid=61564e5023b7229ec85d
> 
> 
> Reproducer:
> 
> 
> syz reproducer:https://pastebin.com/raw/TS2t3YbZ
> 
> 
> console output: https://pastebin.com/raw/F3Kw8uUb
> kernel config: https://pastebin.com/raw/8dTgtKu5
> 
> 
> Kernel:
> 
> 
> HEAD commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> git tree: torvalds/linux
> kernel version: 7.2.0-rc3 #1 PREEMPT(full)
> tested tag: v7.2-rc3
> 
> 
> Let me know if you need more details or testing.
> 
> 
> Best regards
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
