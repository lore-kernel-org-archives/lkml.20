Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668186;
	b=K2Y2d0RicO2aVZIcR3twz4BOywhnsVdwOpCR8gp5VZm8GPdTZDVwjGwZfT/vCCNoaAoj
	 Kne2c3g3Z6TN9VZLI/7uP8qUrfxJCwKu+vHoz/CLyFh/6msNiPQ5fzZKs5ljPbWf2MLl6
	 nUGrAVG2YkMYYeCvnN3FY4vfemXnj2dWKpUvhKWpC1J6xwoxwHWb6UzJdNZnt4pU2JDvP
	 9xajhLgwcX9V9wlu1cF5gtZKZKNEJCy8qGzt//VuhsNijTlUFrYMOC1plx0MPUMmoBB5v
	 /6YVxiQqRN3OsgbzkJBpop3b+RPCm/FXh6SmnEWWF9uSZfSDwoJ1Uw26Bi7UHPkAztg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668186;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wMJMVWej1L6FCi5Hz4CBSwtruLOk1VwtvbQEDP6Nv7Q=;
	b=gx/YqsxIDBJw5xjEs70yCVrT8Xv69muuqEzoN+Q7pnUc4dmg7YpNM8tPV+qtuvJ6VFl8
	 FBN6mLT3cYqIaveNS2Fc173oEtL5p4+V7vBejPJaKGjLMgKW0q1P56znWkPHmi2HtfqSa
	 nnSnYm9KAzWW7zc74gFKnQuT3t7PmrmEsCztPyt/XXxXyk2NARO2YjtMeLNWO3mZqO4YX
	 RfJESdXpu6wb8w/EiJtBZnpRImOSmjhIVIamypZYP8Re9XbfTK8G9F/q/cx9T6uJ3zfWH
	 jf/xaQOxl++v1YmmdMf/ytMil+ZYcwPjmR6icXhhI8kZR5RS+nFKKWajo+Uwp284o2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OdH3nXq0;
	arc=none smtp.remote-ip=95.215.58.220
Received: from mta1.migadu.com (out-220.mta1.migadu.com [95.215.58.220])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371FC606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 371FC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OdH3nXq0
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JebJ2KYviHzA7GxQlWkyQuYehYQ7NUFLaQJh1nE/Hmg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794668183; v=1; x=1795272983;
 b=OdH3nXq0emCtGNNnPX/+VFIGdil7rs+/GTA1OQqIsWnEq01L5OMKQjsa+S0dHUKh4nEb9S6y
 ZjoB4EtzZmwINmpT6QRMOKLRu8GEpVW0Y974yYn9JYegQf6ea1Wpvk+cR6RlwElXKTnY9iHw5ki
 W897c6kRKipLs02ORDTx4ynw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 12765da31f07e8bd;
	Sat, 14 Nov 2026 14:56:22 +0000
X-Mizu-Trace-ID: 12765da31f07e8bd
X-Migadu-Flow: FLOW_OUT
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: ljs@kernel.org
Cc: chengming.zhou@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	xu.xin@linux.dev
Subject: Re: [PATCH 2/2] mm/ksm: add initialization helpers for scan_get_next_rmap_item()
Date: Sat, 14 Nov 2026 22:56:16 +0800
Message-Id: <20261114145616.646190-1-xu.xin@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <avcZQNlZ7cisQAeG@gremlin>
References: <avcZQNlZ7cisQAeG@gremlin>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Thu, Nov 12, 2026 at 08:59:59PM +0800, Xu Xin (vivo) wrote:
> > Extract the new scan cycle detection (including draining per-CPU LRU
> > caches) and advancing the scan cursor to the first mm_slot into
> > scan_begin_new_cycle() and scan_get_first_mm().
> >
> > This keeps the exact execution order intact while making
> > scan_get_next_rmap_item() cleaner and easier to follow.
> >
> > No functional change intended.
> >
> > Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
> 
> Again, thanks for doing this! LGTM and:
> 
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Thanks.

>
> > +static struct ksm_mm_slot *scan_get_first_mm(void)
> > +{
> > +	struct ksm_mm_slot *mm_slot = ksm_scan.mm_slot;
> > +	struct mm_slot *slot;
> > +
> > +	spin_lock(&ksm_mmlist_lock);
> > +
> > +	slot = list_entry(mm_slot->slot.mm_node.next, struct mm_slot, mm_node);
> > +	mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
> > +	ksm_scan.mm_slot = mm_slot;
> > +
> > +	spin_unlock(&ksm_mmlist_lock);
> 
> NIT: optional, but this could be:
> 
> 	scoped_guard(mutex, &ksm_mmlist_lock) {
> 		slot = list_entry(mm_slot->slot.mm_node.next, struct mm_slot, mm_node);
> 		mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
> 		ksm_scan.mm_slot = mm_slot;
> 	}
> 
> 

Good idea, I will switch to scoped_guard.


