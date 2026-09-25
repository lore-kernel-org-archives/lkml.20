Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A01380FC5;
	Fri, 25 Sep 2026 09:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328618; cv=none; b=YM2Kr76ihp8mn5ZyEuRY5j31fV4/vWNoCR/pUUfwBRZltUg9XzyCBC2kdmGJXJhRUxzM1Gs7NIGpRwnhfBD4vVIIw+QcoSMVv3k/BJP+KW3Zi8Gpnmyz29GACOqILDHR1mEZXDKdzJwFKFlDRp6zE/82+2p3lyN9YFvB0P7+fYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328618; c=relaxed/simple;
	bh=g3nrC5Hw9jgNRup7k/tM1/WqiMGxiMWQpDC2dt7DJAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0L7VBUNftWEUIqKmrl/QLtlRNUIRdn8GoWoI5Gk0CgY2WoaEHSV11kvWTYE61WMP/ySfLdcl3ANdDHtWPJQxSsQw6itGsugRoaDiRRJ2TxfvFldlJ7wTt3NdRY2Lhgii7VJmbk4tcyqsNezwKMesWqvygZcvCU1PH4Z1pNmHkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LIZpXuor; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YYj+ps7p; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0iWht0XA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nXwbGPLd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LIZpXuor";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YYj+ps7p";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0iWht0XA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nXwbGPLd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6A8941FDB7;
	Fri, 25 Sep 2026 09:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790328608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7DNPXosQ5PMTHUQPUS2XT2Xek0NwWlf6db2Zg55jw5c=;
	b=LIZpXuor/6ALFxUm/0eu2sdhROgYJ4m2odMtrXl/+l0q8EqrcQ4ub9OdT4u8Nk5e5R3IyG
	LzObSRqakU8rbEEuqfGg2Z7n3kPcwDUHIFjp7o3LPQDPzY8qdRCvNWjZVMXjeCS/j89MQ3
	hXdhwoTDN5isCup29DHqh28dFivXhWI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790328608;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7DNPXosQ5PMTHUQPUS2XT2Xek0NwWlf6db2Zg55jw5c=;
	b=YYj+ps7p7WcSRv8sGznNn+ajkSPwZerKFvgbMoQvRDovQFquuU7u68p9UmjcDrNJxcMBxA
	IS4YZAosjB3/ALBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0iWht0XA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=nXwbGPLd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790328604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7DNPXosQ5PMTHUQPUS2XT2Xek0NwWlf6db2Zg55jw5c=;
	b=0iWht0XA3j1FjXkBrSg037OLc1WqbKqUd3orx8bUJ4ow82T9DS7fR6z12jg8D9YCcYj354
	wenyF4uuVR4neCP/fNTPNnna3Be2aTMQaVE7q6Fhkc55opTRx8QQ4K2YvkNyqi1GwJGoml
	rC374FkfoKc6EYUXCZr1SkWGRdzps44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790328604;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7DNPXosQ5PMTHUQPUS2XT2Xek0NwWlf6db2Zg55jw5c=;
	b=nXwbGPLdD5z9mFA4iXuq1g7meU4HxbibGTNkGfKbRwSiLir2HfzlGoMWxI04o66htXhrRI
	oIKdS7fclPfgIxAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D9DC213432;
	Fri, 25 Sep 2026 09:30:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hw0RKRs/tmoCKgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 25 Sep 2026 09:30:03 +0000
Date: Fri, 25 Sep 2026 10:30:02 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: cve@kernel.org, linux-kernel@vger.kernel.org
Cc: linux-cve-announce@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@kernel.org>, Steffen Klassert <steffen.klassert@secunet.com>
Subject: Re: CVE-2026-93105: esp: do not unref managed frag pages in
 esp_ssg_unref()
Message-ID: <arY-pm8tfEzTjEI5@pedro-suse.tail5790ac.ts.net>
References: <2026091746-CVE-2026-93105-78df@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026091746-CVE-2026-93105-78df@gregkh>
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 6A8941FDB7
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,secunet.com:email,cve.org:url,pedro-suse.tail5790ac.ts.net:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -5.51

On Thu, Sep 17, 2026 at 05:16:22PM +0100, Greg Kroah-Hartman wrote:
> From: Greg Kroah-Hartman <gregkh@kernel.org>
> 
> Description
> ===========
> 
> In the Linux kernel, the following vulnerability has been resolved:
> 
> esp: do not unref managed frag pages in esp_ssg_unref()
> 
> esp_ssg_unref() releases the page references held on the source
> scatterlist after the AEAD operation completes.  It calls
> skb_page_unref() on every frag page for an out-of-place transform
> (req->src != req->dst), and in the error path of esp_output_tail()
> (already_unref == true) on the request's own scatterlist.
> 
> This is wrong when the skb carries managed frags
> (SKBFL_MANAGED_FRAG_REFS).  Managed frags are owned by a zerocopy ubuf
> and the skb does not hold a per-frag page reference; io_uring SEND_ZC
> with a registered buffer attaches the bvec pages this way via
> io_sg_from_iter().  The rest of the stack honours this invariant:
> skb_release_data() skips the per-frag unref when SKBFL_MANAGED_FRAG_REFS
> is set, and skb_zcopy_managed() is the guard used at the other unref
> sites.
> 
> esp_ssg_unref() is missing that guard, so for a managed-frag skb it
> drops a page reference the skb never acquired.  This can underflow the
> page reference count and free a page that is still in use.
> 
> Guard the function with skb_zcopy_managed() so both unref paths are
> skipped for managed-frag skbs, matching skb_release_data().
> 
> The Linux kernel CVE team has assigned CVE-2026-93105 to this issue.
> 
> 
> Affected and fixed versions
> ===========================
> 
> 	Issue introduced in 4.11 with commit cac2661c53f35cbe651bef9b07026a5a05ab8ce0 and fixed in 7.2.6 with commit 26b6b14c7a0368e317a1e9fb5144ebe6f8d495cf
> 	Issue introduced in 4.11 with commit cac2661c53f35cbe651bef9b07026a5a05ab8ce0 and fixed in 7.3-rc1 with commit 21697720ff43b8dfa25b8e8d9ca7f56f4597fc80
> 
> Please see https://www.kernel.org for a full list of currently supported
> kernel versions by the kernel community.
> 
> Unaffected versions might change over time as fixes are backported to
> older supported kernel versions.  The official CVE entry at
> 	https://cve.org/CVERecord/?id=CVE-2026-93105
> will be updated if fixes are backported, please check that for the most
> up to date information about this issue.
> 

I think this CVE needs to be rejected.

commit 0fda52de8bbd4ca9a852c8a7ef6536cf82bd71fd
Author: Steffen Klassert <steffen.klassert@secunet.com>
Date:   Mon Aug 17 07:17:58 2026 +0200

    Revert "esp: do not unref managed frag pages in esp_ssg_unref()"
    
    This reverts commit 21697720ff43b8dfa25b8e8d9ca7f56f4597fc80.
    
    The patch does not fix the issue completely, so revert for
    now and wait for an updated version.
    
    Signed-off-by: Steffen Klassert <steffen.klassert@secunet.com>


-- 
Pedro
