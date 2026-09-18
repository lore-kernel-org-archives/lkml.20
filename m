Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20EF30B53E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789735217; cv=none; b=DOi/KO+Rz2hUIRAIjE2WITNU0o6PEIDKgsqoCrbcW2zWO/NDIKQn1fOLg8WMCqELyd5MuqTl2VXhm/NopFTmaGK+o8IEr8BgqwEN/8eZhv0EgBczMbktJduGwujzRMBS4R7vCMEOiilB9E+K/68HZHVXG7aXzxccncVf2rvUaGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789735217; c=relaxed/simple;
	bh=O5rMLuc5w3Ln6W/EZCTCl2ZF6g4jdM/LWF/7SYJ4l7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdEreTFoetvZF/QzEqOslowvUfDehYWbhJUKP+bCZBIPXSOWLVZ8lrWtZ/NPFDRQNWgGhxGl3y5dFfIC5Ga88lrRGriafaz8f+otdheibF0My0b98wY2UVwG80O+lHhnbrRtYoD87T08O70txz3tzLLbKLza7VeXAva56z6l5bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ePAluRwd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=timBM+bS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CFEc+DX7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sWb1hUom; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ePAluRwd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="timBM+bS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CFEc+DX7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sWb1hUom"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6CF841FFFA;
	Fri, 18 Sep 2026 12:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789735209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VBIVTqQhbW9GkWkLw6tXoBpdra51UNuriIkEvcJiyds=;
	b=ePAluRwdZrzW7izXIwcVz760jFmSfuOXshE5mGcOcWAozWskiRHHnAg7xbCn1ZIbPyTFNu
	iPygsevUI9tDBSHwpzK0B+swkqm2fQ9ZMWTKXCUi6txs3CavTKssi1gohSgoqDxCQL90Ji
	1x/wNXNTNtBEHf5DtYRJ/fq8/AYbU1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789735209;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VBIVTqQhbW9GkWkLw6tXoBpdra51UNuriIkEvcJiyds=;
	b=timBM+bSWKHBlO27cNXopOH7pQIYDuBMrGBnUDDwf1Z/gcAfAkg12Sgs7+59bchHChTvY7
	5xAEOl8Cz9XjD/BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789735205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VBIVTqQhbW9GkWkLw6tXoBpdra51UNuriIkEvcJiyds=;
	b=CFEc+DX7S/mbXLxGzGeVtEU2/zMIZHVhL5nPH+lT6uOGTpEsaii8lH3AzVZQKn3ggnKItq
	SPzu0/qn4woahHV/kGm628PDL58kT8Jq1uGB4Bwrw2XWYcF/Sl2ZUnyCTv0MMh3VLZg5By
	6dYGLZmmF6mcC6+QAcCK/32pkysVVrM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789735205;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VBIVTqQhbW9GkWkLw6tXoBpdra51UNuriIkEvcJiyds=;
	b=sWb1hUom0CreOKzGoyRm0fiarkdRfcVVkA6epuqNz0U2S60lWbCfVGBdkSZwkYOHu8B+ln
	JyC9za0AuuN2TcAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE51013927;
	Fri, 18 Sep 2026 12:40:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mGsaJyQxrWpbCgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 18 Sep 2026 12:40:04 +0000
Date: Fri, 18 Sep 2026 13:40:03 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: Constify arguments in default pxdp_get()
Message-ID: <aq0wyECZk4D96O40@pedro-suse.lan>
References: <20260918064928.793742-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918064928.793742-1-anshuman.khandual@arm.com>
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spam-Flag: NO
X-Spamd-Result: default: False [0.70 / 50.00];
	ABUSE_SURBL(5.00)[linux-foundation.org:email];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kvack.org:email,arm.com:email,linux-foundation.org:email,imap1.dmz-prg2.suse.org:helo]

On Fri, Sep 18, 2026 at 12:19:28PM +0530, Anshuman Khandual wrote:
> Generic MM default pxdp_get() helpers fetch the values contained in pgtable
> entries via READ_ONCE() without modifying them. Just make their arguments
> explicitly 'const' for some additional protection.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

https://lore.kernel.org/linux-mm/20260803164400.531199-1-pfalcato@suse.de/

I'll respin my series, since it addresses every architecture.

(apologies for not doing it yet this merge window, but it has been hectic
downstream)

-- 
Pedro
