Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760415;
	b=hOtow2TLtqvHUIVNPlxNAkgVqrIVv1zIVR96gGOOo+70FVsLALv8EDh2jQmLaixpY6CO
	 kRzMiijftZQAzj1VltneFroXxQa/ibsEAcMuZmPNPj8Ac0kKwTIlLpgk/doXurUVOaAgo
	 S5+0TgHpNOlNljh3wBp4OC+WNP9hZ7bfwfUAzAQaxlFPnMNQo6GcYDoFEhVV9y0g5SbF3
	 Mh8FaLLvJFe+hJDpJH5iIxcmLGtS0ShErsGue/fT82a1BaHmRBL/6yfCcAVO082wwSQwS
	 ySGDLQtGxDG1Ffoh/6fW7aY1r1xqyt+oPzBhTbGDckERRMolvadQqB3y2mtFxlBdw+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760415;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=CGkjdIfQ2kWLFqSVO3nPKYQIl8t6u+ZHR5jt0u0MANQ=;
	b=hF/aMuR8hwBPfbe8vANJp8G46he6I0+THJ6AupOMQ8v/5Ma166Vl3SVUxkPFcBos7Mxg
	 lPSHom2S//2IBt8qdtj/fT3IKxRqkbWJ9spuKqD7iVyM3c95oYp6eiaf1iDKncZAwg/hw
	 U6YZpqh6dwW4sM5JJtlDDItOquJTTNzyhhikOdYWPTUUm8eXhjf3lrVUaCcQSNfqENXyx
	 A5zU8VwYI27Rnw77mt82HNx58Bu9oJypcQ9VBjGU6sPBn9NxFc5Bxh5uMDmmvOX89D7lc
	 eT4lJYPDbU9b4acu9C6lVtZvbXki5v76BDSjq27LZQ2Qgom+QKQQWOzDq7VP1C4ZIFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nbN2jT0b;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qmfmHZTn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nbN2jT0b;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qmfmHZTn;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B66606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9B66606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nbN2jT0b;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qmfmHZTn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nbN2jT0b;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=qmfmHZTn
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2A0361F785;
	Fri, 23 Oct 2026 13:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792760413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CGkjdIfQ2kWLFqSVO3nPKYQIl8t6u+ZHR5jt0u0MANQ=;
	b=nbN2jT0bJ+1hEWNmQMV68E0bK59uevv3wh0s4HgOA6Z77CrVn7bBKopcNV6FBOhOjBxmAK
	LSQ6mg5Bx/3cn7tFcuwqP8sn3EesbXT/md+yTtFq8JYXM5NxG6yvZzzpy6t6nNZ6QbT9Lp
	k5Wu/hMJcRI0+VCPD3cMO2Vj0Jx0rss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792760413;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CGkjdIfQ2kWLFqSVO3nPKYQIl8t6u+ZHR5jt0u0MANQ=;
	b=qmfmHZTnKLgVSgw3CxWFYZZGj6k5bDwHfjuEOGcYuLMqYbdEaU8j9h5cJCy02vJqHx0RVm
	PU1Kqb1ZznCr4kBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792760413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CGkjdIfQ2kWLFqSVO3nPKYQIl8t6u+ZHR5jt0u0MANQ=;
	b=nbN2jT0bJ+1hEWNmQMV68E0bK59uevv3wh0s4HgOA6Z77CrVn7bBKopcNV6FBOhOjBxmAK
	LSQ6mg5Bx/3cn7tFcuwqP8sn3EesbXT/md+yTtFq8JYXM5NxG6yvZzzpy6t6nNZ6QbT9Lp
	k5Wu/hMJcRI0+VCPD3cMO2Vj0Jx0rss=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792760413;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CGkjdIfQ2kWLFqSVO3nPKYQIl8t6u+ZHR5jt0u0MANQ=;
	b=qmfmHZTnKLgVSgw3CxWFYZZGj6k5bDwHfjuEOGcYuLMqYbdEaU8j9h5cJCy02vJqHx0RVm
	PU1Kqb1ZznCr4kBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5915B133F3;
	Fri, 23 Oct 2026 13:00:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GRe3C1xa22oBKwAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 23 Oct 2026 13:00:12 +0000
Date: Fri, 23 Oct 2026 14:00:10 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Jann Horn <jannh@google.com>, 
	David Hildenbrand <david@kernel.org>, Jakub Matena <matenajakub@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] mremap() fails VMA expansion when VM_MIXEDMAP is set
Message-ID: <attZIKD7GfoNeqbg@pedro-suse.tail5790ac.ts.net>
References: <20261023023106.515365-1-luizcap@redhat.com>
 <8c53e58c-f7d2-4e98-8d03-7ff1163c1159@kernel.org>
 <9544f4ce-f5d1-498b-91ed-906b37122e31@redhat.com>
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
In-Reply-To: <9544f4ce-f5d1-498b-91ed-906b37122e31@redhat.com>
X-Spamd-Result: default: False [-13.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,infradead.org,google.com,gmail.com,kvack.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, Oct 23, 2026 at 08:13:56AM -0400, Luiz Capitulino wrote:
> 
> 
> On 10/23/26 3:16 AM, Vlastimil Babka (SUSE) wrote:
> > On 10/23/26 04:31, Luiz Capitulino wrote:
> > > Growing a VM_MIXEDMAP VMA with mremap(), with or without MREMAP_MAYMOVE, fails
> > > with -ENOMEM when the address range after the VMA is free.
> > > 
> > > This regression was introduced in v6.1 by commit ca3d76b0aa80 ("mm: add merging
> > > after mremap resize"). This commit changed mremap() to use vma_merge() instead
> > > of vma_adjust() for the expansion case. However, vma_merge() returns NULL for
> > > a VMA that has any of the VM_SPECIAL flags set.
> > 
> > Hi,
> > 
> > 6.1 was a rather long time ago. How was it discovered just now? I.e. what
> > use case broke by the change and prompted creating the reproducer?
> 
> The use-case that broke was an application running on an older kernel
> and accessing a GPFS volume/FS. I was told that GPFS sets VM_MIXEDMAP on

So the application is growing a file VMA with mremap?

> a VMA because it inserts pages in the process address space with
> vm_insert_page(). I then asked an LLM to check if there was anything in

FWIW this is really odd for a filesystem to do. I see we have two filesystems
upstream (at least in 7.3) that do this; that is, cramfs and FUSE DAX. This is
arguably weird and should be fixed. Perhaps the VM side isn't giving
filesystems the right flag here.

-- 
Pedro
