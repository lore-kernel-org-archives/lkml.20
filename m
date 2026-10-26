Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014484;
	b=C+cOfUzz4ZBUEQVMMsx5j7c6NwtJK3rQgDx26PySxbCi6GUCtVHwpIMVOmE+Q8S0QQr3
	 3mmpm77VM40k4p2lPXVl9bGWkhalZM5P3TqxoJI0AbsLPxUZCfGn6YzGU/58xtZH0mKjo
	 uWAL1Nx4AyelhHCDiqIgN658h1BKRf4Gv5XUM1NY4E54Ht7+mIoPRLlaDcYfDbvgdzHuJ
	 r+vZpsFf1DS3CJA4ywxiLpO9SS0B+hAqqrc2IrDgCDCTZ8q1lXs9waACNFSpgZ7585vjb
	 rZoCx4uf07GHBGo/R6KQDqEqdyND4hBfC0QqLcmGxDYzJjIlS8AzUqehpTLzAMGnLUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014484;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=7Zp+M2l9qEe8wFeHsJF1HClM39hdMYJZfLcSJHn+m0g=;
	b=A7qcEO7iO5LocyXtICDwIwRI6VaKQy4Fj48NR9c9M3Xg0eKprMAVJqnDSyCFf+2iJqRe
	 PBBxxs1aYjj1QKLRH4MzdxYKpxseLFTx9O26neynchhaBsClLQDbZPsiuSS4DEsMDSxAl
	 sQBld7zFnvT9VZwfiIX9JnyQRekLVV/rCgcGMvXcOlS+h4nMHUJ121PY/M0NSBO9+rHTo
	 UZGfbu/g+nqJJKYvP0MrB8gUIb2YFdi3jVwLKEPNaPMSIV1GvhPZYYEYS1p892NleBOOd
	 gTsk7AUj8VdPdnMcgK8JC2/iQ0o32gxl1DLtEGDEd1cqbJZgQqMHLu6azEkdBfGiXKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=suse.cz;
	spf=pass smtp.mailfrom=suse.cz;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=B0nEkdJG;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1qPUsceX;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=B0nEkdJG;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1qPUsceX;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0CD606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:34:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C0CD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=B0nEkdJG;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1qPUsceX;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=B0nEkdJG;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1qPUsceX
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B208721EC7;
	Mon, 26 Oct 2026 11:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1793014481;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Zp+M2l9qEe8wFeHsJF1HClM39hdMYJZfLcSJHn+m0g=;
	b=B0nEkdJGGdGpbA4vcmvri4kbY+Ri1As4ein9GR7hTrTD3LLgl/+MGFrW4djtNfIgUMdx4Z
	JL6J7KkDXGjpxgawn8zFASy+Zd0eXUiRUhdmyBlLkYFV3p7boj4P4DfuhOuJoQE+hJw8JG
	ScbPA6IoNkg7ANnhqLtkNfivqOa7sX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1793014481;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Zp+M2l9qEe8wFeHsJF1HClM39hdMYJZfLcSJHn+m0g=;
	b=1qPUsceXMwt24BcYYeuT1gg9AqVIAdLcuDYKOqkU45f3Edqc17hXtVShnuQ7/3BIPBQ7ZU
	3FhSoaGacddO7pAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1793014481;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Zp+M2l9qEe8wFeHsJF1HClM39hdMYJZfLcSJHn+m0g=;
	b=B0nEkdJGGdGpbA4vcmvri4kbY+Ri1As4ein9GR7hTrTD3LLgl/+MGFrW4djtNfIgUMdx4Z
	JL6J7KkDXGjpxgawn8zFASy+Zd0eXUiRUhdmyBlLkYFV3p7boj4P4DfuhOuJoQE+hJw8JG
	ScbPA6IoNkg7ANnhqLtkNfivqOa7sX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1793014481;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Zp+M2l9qEe8wFeHsJF1HClM39hdMYJZfLcSJHn+m0g=;
	b=1qPUsceXMwt24BcYYeuT1gg9AqVIAdLcuDYKOqkU45f3Edqc17hXtVShnuQ7/3BIPBQ7ZU
	3FhSoaGacddO7pAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D8BA413408;
	Mon, 26 Oct 2026 11:34:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vfQOK9A632qbfAAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Mon, 26 Oct 2026 11:34:40 +0000
Date: Mon, 26 Oct 2026 12:34:24 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] MAINTAINERS: Update Andrea Cervesato's email
 for LTP
Message-ID: <20261026113424.GA544805@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <20261026-acer_maintainers-v2-1-4cf0f350fdf1@linux.dev>
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
In-Reply-To: <20261026-acer_maintainers-v2-1-4cf0f350fdf1@linux.dev>
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.50 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,imap1.dmz-prg2.suse.org:helo];
	REPLYTO_EQ_FROM(0.00)[]
X-Spam-Score: -12.50

Hi Andrea,

> I'm not working for SUSE anymore and I will use linux.dev email to
> develop and maintain Linux Test Project. Also update .mailmap.

Acked-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr
