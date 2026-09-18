Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1215B206
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731127; cv=none; b=HyuzMBI3T5dO7K9pohckaNjsD77Islw8IR8eGO5U0UfJahudYP2sL/Kkf5phhHqREfP+irY642a6uwzclCZkgjcoj8nX400S4crtBalgROsF9VvQaXz/8x/EMAgfk+A4iM0tqPVZ5Jw0iUWErJ4UHutoqOxSSXBeXkv4phxhknE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731127; c=relaxed/simple;
	bh=Cl35MNCELM6Ycb5GIrlJros8Uv+l/+Eeznqjrc9Ickw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyZLePxSgiBfdPyAym9ujP0WThc5XgT7bMJGVsf1oeYl/upZBt0H18bsX8yU09Qf0NMgMeuOb9JBoZBQTqT9F67SRevMExLK/05ApxodPnOGFKbQrIjvBP0nlx4fltD6jFvjDhp/SdlNOpxYG1sftys5K4BtAn2dG4x8TffPGO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=msnhd0UY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NqStikK9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JSEofGrj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6L1HpnEf; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="msnhd0UY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NqStikK9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JSEofGrj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6L1HpnEf"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0A2A11F750;
	Fri, 18 Sep 2026 11:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789731119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=16VPl1VnEWjYKKn2b0VatZqqKxwtk4sxaC4QgUhEMps=;
	b=msnhd0UY7XBEygV4zpJsichyutt/FvkLNxgEaqVvEAaQXcsXno9pCujTVafi/y3lyO05Dh
	oS5/2ggGU2z7GO+Yof2bvqs6EaR0AKEqrcijU73wlSJoU3rMlYvf5lkPhS9iWwS3Z44L9x
	CPjGXgH04gxrYVKTUw/lJe8JH2zOnhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789731119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=16VPl1VnEWjYKKn2b0VatZqqKxwtk4sxaC4QgUhEMps=;
	b=NqStikK9HHMaMzU7DdZCQp1NuHC0eodVh8h2ldxDgLs/oJJd3P97j2IlFNgj+lU50eeQL/
	/kLJKLw4mucl9TAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789731115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=16VPl1VnEWjYKKn2b0VatZqqKxwtk4sxaC4QgUhEMps=;
	b=JSEofGrj3K9xy5rBCGR9RM03EUSv9MIirWaPUIpsV/6o2Y1SsdnlZNBDJ2Eo4xvkV5qLFw
	3yfQ/t3DdCk2iEaj9LqCHJItMDbrQ1KQGOdSe1rKt62d0LR9eGQi1ZHDIYZ+tAaVlvgg3C
	Uabfd84mA9jNlMFcxmBzl2thku7n9dk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789731115;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=16VPl1VnEWjYKKn2b0VatZqqKxwtk4sxaC4QgUhEMps=;
	b=6L1HpnEfyUGSKDuZfIBN9LnhkSHDYxk3ds3mBJ2Tt9oF/tcDxaw+DLCa8E1rc44JodXLgY
	3axm0IQ24XIzPbBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E45F133CF;
	Fri, 18 Sep 2026 11:31:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k0nRDighrWpEQAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 18 Sep 2026 11:31:52 +0000
Date: Fri, 18 Sep 2026 12:31:50 +0100
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
Subject: Re: [PATCH v3 3/3] mm: update comments to refer to anon rmap rather
 than anon_vma
Message-ID: <aq0dInU5aaJN_eMa@pedro-suse.lan>
References: <20260917-vma-is-faulted-v3-0-5c22314a72e7@kernel.org>
 <20260917-vma-is-faulted-v3-3-5c22314a72e7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-vma-is-faulted-v3-3-5c22314a72e7@kernel.org>
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	R_RATELIMIT(0.00)[to_ip_from(RL8d8xedm6iu8o66torxsk6bwd)];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,google.com,infradead.org,kernel.org,linux.dev,nvidia.com,linux.alibaba.com,arm.com,suse.com,zte.com.cn,surriel.com,tencent.com,huaweicloud.com,gmail.com,lge.com,redhat.com,suse.de,intel.com,sk.com,gourry.net,kvack.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email]
X-Spam-Flag: NO

On Thu, Sep 17, 2026 at 08:47:43PM +0100, Lorenzo Stoakes (ARM) wrote:
> Now that vma_has_anon_rmap() abstracts whether a VMA has an anonymous
> reverse mapping, remove references to anon_vma and instead reference the
> anon rmap.

Hmm, I guess this is where we figure out if "drop the anon rmap" or "insert the
anon rmap" or "iterate anon rmaps" makes sense, language wise.

Wouldn't the rmap be the map itself (e.g the current cursed
anon-vma-anon-vma-chain structure, or in the Glorious Future your remap
tracking tree)?


> 
> The anon_vma is an implementation detail and should be treated as such.
> 
> Do not update mm/rmap.c which implements the anon_vma mechanism as it is
> reasonable to directly reference it there.
> 
> No functional change intended.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Anyway, you're the native speaker here, so I'll let you decide:

Acked-by: Pedro Falcato <pfalcato@suse.de>

Thank you for the series!

-- 
Pedro
