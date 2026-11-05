Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878670;
	b=xnDPfakBirX6xnE912o0TPSK9UReoi4y9UHf8TAPogfjv125MmbaUCES04Z3n0xUSKKd
	 cqk38Y75v55AoaqS7tBBFGJ3T0Q8jUrL5D46ufK6Aj5en2GTTePXd5Rt1uerCVlzFY8RT
	 wB5QegLIo3F7rYPj9gneM5oI/FQ38A8VhyjM9SGItF8e/N9qVTyEa2BmhQ0JyQEw/X8Qq
	 FPRBBANXxTreSvsf+mLzKuINQzDCe2yMM3866gJ3+3YYY4POnoUu5j629OT8f2a30Sn2t
	 XYYFBq/8QRmPIoT/oXTDUwMsa3J66cjGWvBr6HMcXEKWw8fsao1XZEvyxILLbycTJKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878670;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=bjo5ToMs5cE4fDuDOvd5YxsZhokCc6fb7N8+ZiF0Jsw=;
	b=knvjm3vPIx9QUgnP6HKGbFjAvEDj7ASW8qVg0xH9WsS0pmE7/oPSpHM4BhiLRH7QhjGs
	 d63LrM54RGslZnjVaoIw+ltSdKhENNm5fXz3c0r97JLv4jy8c7+b2a/ZcIL/6HXWws/La
	 cKchkzf+nMIp5TZ2XCYJd6ocv5K/gVUwXK8Xk3ZtmoKy1GxavweqPoYXKiEoo7qF/J1Qd
	 lgyzqmeQZNZ2sTMDsv78xxD5wgzOVtmYCAj8UZ6oH5Hi64xHJqUHNle69/B5TCo9m+mme
	 m50nN3VUFNP01FMBF+LXN4w7if412O0lCYFgR/qnD+Llb7r59a/oQ1LkTNDw+RD4XeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nm6f7pAc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5YjXWal6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YiDhcdUU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Pw0UcpJf;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F20606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5F20606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nm6f7pAc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5YjXWal6;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=YiDhcdUU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Pw0UcpJf
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CA7C721FAE;
	Thu,  5 Nov 2026 11:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793878668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bjo5ToMs5cE4fDuDOvd5YxsZhokCc6fb7N8+ZiF0Jsw=;
	b=nm6f7pAcewHGaA4dnrGaq6djWoIyg/KwjizKiNYEqXZDCJKhwjl9ccnGCrgUMmTavz4CL2
	++9PEG1lccQnw4y2b5E48TmmuD7GJ94ULNAjTUUQTi60hHZ4ad5JxRgYNUyIqYwn4fNYeR
	VPNEIM7yL59gA34/5G/eOw23VD+sixk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793878668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bjo5ToMs5cE4fDuDOvd5YxsZhokCc6fb7N8+ZiF0Jsw=;
	b=5YjXWal6urwbExGc3mbQkoIG/rakv493Bym/30L4bWfvdouQbXVruSqx0810KNzqqx5L2h
	bMH2zoUdq7UB0xCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YiDhcdUU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Pw0UcpJf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793878667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bjo5ToMs5cE4fDuDOvd5YxsZhokCc6fb7N8+ZiF0Jsw=;
	b=YiDhcdUUA5iz/xtqvq9Swa89TtvVgQJfitWZgBc3l9YBN89EsC17t82GSu+7u4WX5XVfiA
	mgFKD2qGvur29ZhdlXaTYNfsQVSkcsvGBG+OYLuyCvd3Rf/P40Rp4cv26QGch5KQdZRaEt
	h+D7TQPbrJDCC3UkV/R+ksxZ2assmBQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793878667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bjo5ToMs5cE4fDuDOvd5YxsZhokCc6fb7N8+ZiF0Jsw=;
	b=Pw0UcpJfQddpPq+fNgyVZucgtJv8gc/9f0lV2IfTz9NO+ZsuLG+CB75082Lh43vPFub98O
	incrKZySM2mHSFAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7990134F4;
	Thu,  5 Nov 2026 11:37:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VJcRJYpq7GrlcQAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 05 Nov 2026 11:37:46 +0000
Date: Thu, 5 Nov 2026 11:37:45 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	riel@surriel.com, liam@infradead.org, vbabka@kernel.org, harry@kernel.org, 
	jannh@google.com, lance.yang@linux.dev, qi.zheng@linux.dev, ayushr@modal.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: synchronize with PTE table reclaim for all folio
 sizes
Message-ID: <auxqWxUfRVvxnk_n@pedro-suse.tail5790ac.ts.net>
References: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
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
In-Reply-To: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
X-Rspamd-Queue-Id: CA7C721FAE
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-13.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -13.51

On Thu, Nov 05, 2026 at 10:56:28AM +0800, Baolin Wang wrote:
> Similar to commit 243cf1f67b36 ("mm: memory: fix truncation removing mapped
> folios"), the '!pmd_present()' check in page_vma_mapped_walk() can also race
> with concurrent page table reclamation via zap_empty_pte_table().
> 
> page_vma_mapped_walk() is used by many functions including try_to_unmap(),
> try_to_migrate(), folio_mkclean(), pfn_mkclean_range(), remove_migration_ptes(),
> page_mapped_in_vma(), and mapping_wrprotect_range(). Except for try_to_unmap()
> and try_to_migrate(), the other callers do not perform post-walk accounting
> checks, so the race has no observable impact on them.
> 
> For migration, the race can cause unnecessary retries. For reclaim via
> try_to_unmap(), the race can cause failure to reclaim a folio that is in
> fact already unmapped (as shown below), which may lead to unexpected OOM
> or increased refaults.

This is very handwavy. Do you have numbers? Does this actually make sense?

-- 
Pedro
