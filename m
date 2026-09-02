Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3812D3225
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 06:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329938; cv=none; b=ZLF6eu3p26tUdfr+50e+baan391kniHr/lhF0C7mf5T1FW1PIEiVs/9bg9e+e5Vz5OVVn8aEfAQ23D3L2OVzO9AxIdUNIQpgyKsMemkj5QdPEaADaFvQEhfnbBo+t/hXe45i6yNOADsNmkv0m/GOoGOe6hpLiAOB4RDWa3q1ZjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329938; c=relaxed/simple;
	bh=APfnU/bA2ay3vjOP+jKekWk0k8DX/vQamUlD70NrTIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TulJE3EGotZxlJxNZ+09C86McofAU/Eqno9qPZS89E0emfRQGjbdrP5c+ibqGYI41cmhwrqG/ezZlZiRPdFioZXPXzQoYLAIP8lSrAj0W/FYYdyGxswmib6rR1/on4bRlURTbH3nthp8EECWzqQm+XGpiUi33IleXlKjjTn/eSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=a7u2D5w0; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=T55IA0Xr; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=BTdVxGx5; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=eC5mQPtY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="a7u2D5w0";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="T55IA0Xr";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="BTdVxGx5";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="eC5mQPtY"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 67AD01FB11;
	Wed,  2 Sep 2026 06:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788329931;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6vQ0wuKJ0wuZz78ofCwTrej3/2yua4BbkXnwqBua61A=;
	b=a7u2D5w01dBUVwgqi22N69SE54Fh1Lc4Fk/llr6aIS1ZuU3GevZHqXWlQ3lDAmO7hbRT7T
	EcF45K4cxnZrg/sGAwdea+EIDm+DCDoYYm0gBrmNou1kEoqUfzzWE5vAHumhqDqSldXfvo
	ITUH0W4FCXUcRngzLFclOV+jpPsakuY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788329931;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6vQ0wuKJ0wuZz78ofCwTrej3/2yua4BbkXnwqBua61A=;
	b=T55IA0Xr5nMUiFdhzT2Xd2YWns17IoIH2GNe+0Ua15qXswJCByXHuUlJxNK40tsZRk/ziy
	NNe2fHNwCBakoTBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1788329927;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6vQ0wuKJ0wuZz78ofCwTrej3/2yua4BbkXnwqBua61A=;
	b=BTdVxGx5pfZMA6z1nsWWkotJDxUi70BKDbAf7cy2l4Of6tXJ3Fbvb+r9/rMo+IHPm47uqN
	UGBkTIu5+zQA1x/frMt2rnFt5Pdqh/qUgc0fmHLPXFtWv9FLlPqGXn/Yd4ORts4OTwhaeO
	XvVClG/2IFjCxR7ImS33gMypoIkoey8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1788329927;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6vQ0wuKJ0wuZz78ofCwTrej3/2yua4BbkXnwqBua61A=;
	b=eC5mQPtYVl0S7sJMfDU+7g7Y67e6FRLHwKwb1ODv2JGp97zd74LeYx8fPYlr+6p3ZS2+7m
	fAEplWEeBsQgPeBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B52D13736;
	Wed,  2 Sep 2026 06:18:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id pUmXCce/l2qsewAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 02 Sep 2026 06:18:47 +0000
Date: Wed, 2 Sep 2026 08:18:41 +0200
From: Petr Vorel <pvorel@suse.cz>
To: linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: Re: [PATCH v5 5/5] checkpatch: Skip kernel specific checks for
 userspace
Message-ID: <20260902061841.GC890950@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20260901105642.851234-1-pvorel@suse.cz>
 <20260901105642.851234-6-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901105642.851234-6-pvorel@suse.cz>
X-Spam-Level: 
X-Spam-Score: -2.00
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.00 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,canonical.com,perches.com,gmail.com,uniontech.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_EQ_FROM(0.00)[]

Hi all,

[ snip ]
>  # prefer usleep_range over udelay
> -		if ($line =~ /\budelay\s*\(\s*(\d+)\s*\)/) {
> +		if (!is_uapi($realfile) && $line =~ /\budelay\s*\(\s*(\d+)\s*\)/) {

>  			my $delay = $1;
>  			# ignore udelay's < 10, however
>  			if (! ($delay < 10) ) {
> @@ -6715,7 +6715,7 @@ sub process {
>  		}

>  # warn about unexpectedly long msleep's
> -		if ($line =~ /\bmsleep\s*\((\d+)\);/) {
> +		if (!is_uapi($realfile) && $line =~ /\bmsleep\s*\((\d+)\);/) {

I'm sorry for silly error to use 2x wrong function name (I need to pay more
attention what autocomplete actually fills when typing just is_u<Ctrl-N>).

Kind regards,
Petr
