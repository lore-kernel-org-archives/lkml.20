Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAB0480954
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 12:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351971; cv=none; b=WGo6h6xhMOXqPfs6GWGKirXd15KNyFVtigW0o/dVZnyGb2nk+asq1CFIEoESTiZ4Py/0gC4O3yqmd5WxxeeP1l0S6Y4VdXAbb7dmP/lU9iJFuKu1wFqGTi107d02ZvPXHKI/neIxa5RtKdve9TEfWh8qXtutShHQ7H4gnAisrvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351971; c=relaxed/simple;
	bh=imuMOK/eyYbeGMISXVXwtYBPiN8nwD+6OWNa6EXcnuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p98LQ0B9xA0g+iOalt9tjdwRQd+YdBnkww7+11X7M2fZwLUFG+WBf5FUNVy0quuwR2V60OzmAsG841JEs/2yT/iRtTEgAz5kvg6jLiOVa8WxqAL7vPi2MvOqBmFHQTzIz8spW3QgQTgsGyqS0WVI0/dHRD/wHukYUfr7AmTTpdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x1Q6Tggc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3durs7Te; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=15LelkYh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qXLs1ktp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x1Q6Tggc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3durs7Te";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="15LelkYh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qXLs1ktp"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 72DD821BB8;
	Wed,  2 Sep 2026 12:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788351963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72wmxbqaTQSd4Gp56E8IKCIL1P/wg2sKYEhljEbcwmk=;
	b=x1Q6TggcPtez2lMc9t1LJxDfCFOroZzUPuE215pcy3bgD2jsC37ZpYg4P13H4o/f5wzFIm
	HSU5ScbS/XeyJffItdex38NWzGJSfwiTaPTS1lkieWvEBkUi86ccDJVBeURwNfahRw+mat
	D4BbQnth94hZLTU2EcHt4j3SpZ231sM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788351963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72wmxbqaTQSd4Gp56E8IKCIL1P/wg2sKYEhljEbcwmk=;
	b=3durs7Te3aKAet7Jjsj4xs6oNNc0jHuTtEvxdqihoOhy2u1nODy8wyWCScAUrE5Bmu1CmP
	6KKsFvsxjZYRG+Aw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=15LelkYh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qXLs1ktp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788351959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72wmxbqaTQSd4Gp56E8IKCIL1P/wg2sKYEhljEbcwmk=;
	b=15LelkYhGFxoxKG40ubqTifGBsBkpTlf4Iiv0cN9eWMdXd314rrLcQCI+/tvWZGjcQsnDz
	dhZo2y66uqir3aNVJ3TImyFFgx40HUJls2F0ceilgYo2cktUai+lRm7FYo1WbmI5w25osC
	SjGOAaEEAW+amBQsHJP44d6mZGtDU5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788351959;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=72wmxbqaTQSd4Gp56E8IKCIL1P/wg2sKYEhljEbcwmk=;
	b=qXLs1ktpcsphdNzSyYz5f2yVT3+2ck4Wc3VpSdApALk2BBvu2YFZw3GOiiKQCymwMYWS9c
	5mU9W8b/qTWn+TCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4F53D136E6;
	Wed,  2 Sep 2026 12:25:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uZYNENYVmGplFwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Wed, 02 Sep 2026 12:25:58 +0000
Date: Wed, 2 Sep 2026 13:25:56 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Eli Billauer <eli.billauer@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, 
	David Laight <david.laight.linux@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brad Warrum <bwarrum@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michal Simek <michal.simek@amd.com>, Ritu Agarwal <rituagar@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] char: xillybus: replace __get_free_pages() with
 kmalloc()
Message-ID: <apgTKYKSBzbdDJZa@pedro-suse>
References: <20260830-char-misc-v1-0-05e2ce44f291@kernel.org>
 <20260830-char-misc-v1-2-05e2ce44f291@kernel.org>
 <f6001085-9234-4025-ff34-6cc4a66c293a@outbound.gmail.com>
 <20260831123937.32255a49@pumpkin>
 <apaF1HUtJnstuUN4@kernel.org>
 <1729fb06-6beb-f8ef-3e71-47fc3f00345d@outbound.gmail.com>
 <apcPg_y-HsMki7we@kernel.org>
 <9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a3d6a08-339c-3315-cc81-46907d0836ad@outbound.gmail.com>
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 72DD821BB8
X-Spamd-Result: default: False [-2.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,arndb.de,linux.ibm.com,linuxfoundation.org,amd.com,linux-foundation.org,infradead.org,lists.infradead.org,vger.kernel.org,kvack.org,lists.ozlabs.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.51

On Wed, Sep 02, 2026 at 01:41:54PM +0200, Eli Billauer wrote:
> On 01/09/2026 19:46, Mike Rapoport wrote:
> > > * Does vmalloc() guarantee that non-pageable physical RAM is allocated when
> > > it returns?
> > It's not pageable in the sense of demand paging. Some architectures lazily
> > synchronize vmalloc page tables and this can cause page faults that will
> > take care of the page table synchronization.
> > 
> 
> Thanks for this clarification.
> 
> This sounds like a showstopper to me. Immediately after the allocation of
> these buffers, data from the USB device can arrive at 400 MB/s. If the data
> flow is throttled as a result of handling page faults while trying to write

Note that these page faults are supposed to be uncommon in nature. They will
only happen in architectures where the top-level page tables are not
pre-populated, and when they weren't populated before. On a 64-bit architecture
that would be something like every 512 GiB of address space :)

> the data to these buffers, this could lead to an overflow in the USB
> device's own RAM buffers. This is because the USB device is an FPGA, where
> RAM is an expensive resource.
> 
> So using vmalloc() may result in a malfunction in the data transport where
> the __get_free_pages() would have been successful. This outweighs the
> benefit of a somewhat higher probability of success in allocating very large
> buffers, and surely the improved aesthetics of the kernel code.
> 
> Regards,
>    Eli
> 

-- 
Pedro
