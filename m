Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C0537C91B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729170; cv=none; b=TNMfrRw/rdcjaRo0vIKwqB5jUGsL+pYkk0en9NsrK9HA8SMTUxd95NA2ZvaFiecXnmVvmmPwGyN2ap5i67vWcD/Mv0O8th7h6nDaY1ga2R5LURQaQANr/WEsCTt/4w3SDh2F04BD23esVn+fSuii3pA3ymqfscrfiN7TvQTTr+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729170; c=relaxed/simple;
	bh=pbehMZcH1ZOISjRU1C9Ou348joiYZB5qFBUV9VIq6mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOyWZiE5qQh71WlXPCRnYmFUZx8vPGF1ucGNyNVPsPo8s41tKzy7nPOeJ3ztS8KBBVVXXsqT1QxpDkUWWRhzkgqiirlwpjpkOFS+tLp/OnrB8sMJb1nVm8UGH6vgZth/vPf599kVBjgcSbg+Teeo9/OaR1PAbskuQe7ijADqNTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EInWYjd3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lB1Oxv5N; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EwAOVwe/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2YsIelFU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EInWYjd3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lB1Oxv5N";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EwAOVwe/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2YsIelFU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 32D5A21DCD;
	Fri, 18 Sep 2026 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789729161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FOJeqwwdyN7Rfx+8KM2mx7P+agbiN1R3+YCRT68JAO0=;
	b=EInWYjd3wIEndLn+ncg16Kv+zlddW5yVr5w9o60XUCdtX5Px3RiLpGJDsi+LBxXg9RSSez
	OZY/ozOIu+8i5LiGvEpuVXP5GRwANhkMaMjJ52bh9bmHIzRvAHc5XPwgrpnqQe2s7C0Ps1
	BbLQEP0WupNyuvduH1sYaeLrW2oBI4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789729161;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FOJeqwwdyN7Rfx+8KM2mx7P+agbiN1R3+YCRT68JAO0=;
	b=lB1Oxv5N0Vp7QFFcxurhoN4s4UL7Q6CiABKWsjNecsKCkg0cdxPXAdS7G8iHxmF4kavJB4
	kI75+HmlGnYeOgAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="EwAOVwe/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2YsIelFU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789729157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FOJeqwwdyN7Rfx+8KM2mx7P+agbiN1R3+YCRT68JAO0=;
	b=EwAOVwe/O7Krjm024KAokp+SMBqLQdtVQduoVoqDau0C2i1pQ0T43em24ibX/ey5nHWrOK
	F7ad4ddfgKH2kQ5cqZWGU6j/UB1OEEBa7b+WMuBj/7GzI+rNPSPZg6cyq0M9IAH48MwFgA
	8g3qPAMWeSf9d4nCso1XFhc7nkfGQlM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789729157;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FOJeqwwdyN7Rfx+8KM2mx7P+agbiN1R3+YCRT68JAO0=;
	b=2YsIelFUwdq0AneCoq0ktLKn6yAxxvNR2JCTmxkx1MKbQyQXnBmOJT5wbQjqdqKsRGdLMP
	rMqjMjvAaSP11dAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F050133CF;
	Fri, 18 Sep 2026 10:59:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xIqhFoIZrWo6HAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 18 Sep 2026 10:59:14 +0000
Date: Fri, 18 Sep 2026 11:59:12 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Jann Horn <jannh@google.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Peter Xu <peterx@redhat.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] mm/vma: const-ify vma_assert_stabilised() and
 associated functions
Message-ID: <aq0ZTaEHTeGEgYCQ@pedro-suse.tail5790ac.ts.net>
References: <20260917-vma-is-faulted-v3-0-5c22314a72e7@kernel.org>
 <20260917-vma-is-faulted-v3-1-5c22314a72e7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-vma-is-faulted-v3-1-5c22314a72e7@kernel.org>
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 32D5A21DCD
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[41];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,google.com,infradead.org,kernel.org,linux.dev,nvidia.com,linux.alibaba.com,arm.com,suse.com,zte.com.cn,surriel.com,tencent.com,huaweicloud.com,gmail.com,lge.com,redhat.com,suse.de,intel.com,sk.com,gourry.net,kvack.org,vger.kernel.org];
	TAGGED_RCPT(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	R_RATELIMIT(0.00)[to_ip_from(RL89xh3ijk4gdpeanxbepagf1s)];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO

On Thu, Sep 17, 2026 at 08:47:41PM +0100, Lorenzo Stoakes (ARM) wrote:
> The vma pointers are not modified in any of these functions so make it
> official by const-ify them.
> 
> Propagate this throughout the call stack.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Pedro Falcato <pfalcato@suse.de> 

-- 
Pedro
