Received: from mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978143AE1B4
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787748223; cv=none; b=DzLJfIpI3C0pSVKms5AmtbEQcabqQQT1qXAkBUg2EukWk1ahlM9G3AoSSr37QLhZwydtncVoabja+xi91q2K1fRmFThdpE+jeX3xOML/37OHOTaku76pgfDRtcoLY0VZQiz8WsVcz6PWfVFBDoc+8kozJyJzVRKRMYxErEo1cU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787748223; c=relaxed/simple;
	bh=dRZqnAdU/1gz1hPYT2CpYwf16xguN/jACTpU56xyZJU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dzeXKiVgTSO9zi3HPFQ64bhgERaXJ6KyEn40S7d2DqZ6t99O9c4YI2PZVLoJXTCZPYtozEHaxycnYgXGXtKCaqCpcU5bv9fuX2EfNDChinV40mp8rn/AGfmPVv6yYA2t0A4XLmy30DBsZaMp59BrldyP2Wz96tQww05MFRv1w4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BdiMhhlj; arc=none smtp.client-ip=91.218.175.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BdiMhhlj"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dRZqnAdU/1gz1hPYT2CpYwf16xguN/jACTpU56xyZJU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787748217; v=1; x=1788353017;
 b=BdiMhhljcCTuhMF2lWgsYLB9YHmlpx2Tg43KPf+hGqWLGbMsl59lkq+dHTzdVf3H1pkEGe7M
 MvwqUQxQRC3fpwgBmMt8KLOa5a0c3IUmRru02n0QPVm9ZulsWCRp6BdfVD3jiscDmO3jnoTzX3G
 EWRYKnXuyWPZN49FWakwQfeI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: from localhost (2602:fce1:44f:115e::)
	by smtp.migadu.com with ESMTPS id a185f76d2de5e8a4;
	Wed, 26 Aug 2026 12:43:27 +0000
X-Mizu-Trace-ID: a185f76d2de5e8a4
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
Date: Wed, 26 Aug 2026 20:43:16 +0800
Message-Id: <20260826124316.80455-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <ao7Nr_FALfP7cTY5@gremlin>
References: <ao7Nr_FALfP7cTY5@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Wed, Aug 26, 2026 at 12:31:09PM +0100, Lorenzo Stoakes (ARM) wrote:
>Since it's 2026 :) I asked Claude to look at my time as THP co-maintainer:
>
>	~107,000 words of review across 948 emails (in 279 distinct
>	threads), counting only prose you actually wrote — quoted text,
>	signatures and attribution lines stripped. That's a full novel's
>	worth of review commentary.
>
>	Along the way you handed out 194 Reviewed-by and 15 Acked-by tags,
>	and your longest single review was 2,404 words (mTHP collapse
>	support, v12 — the khugepaged/mTHP collapse saga accounts for most
>	of your top-10 longest reviews).
>
>	Estimated review time: roughly 300–500 hours, centred around ~400
>	(i.e. ~7 hours/week for 14 months).
>
>	1,615 THP-related emails in the window: 948 reviews of others'
>	work, 278 replies on your own THP-touching series threads (~31k
>	more words responding to review), 382 patch emails, and a handful
>	of MAINTAINERS bits. Busiest months: March 2026 (131 review
>	emails), June 2026 (113), August 2026 (111); quietest was December
>	2025 (5).
>
>Think I can be happy with that!

Aw, man ... I totally get needing to step back, but we can't let you
disappear from THP that easily :) You've put a crazy amount of time
into it, and your reviews and judgment have made a massive difference.
We'd miss you badly.

Could we talk you into staying on as a reviewer for now? Zero pressure to
keep up with everything or carry the maintainer load. Just hang around,
jump in whenever you feel like it, and come straight back as a maintainer
whenever life gives you the room.

Seriously, Lorenzo, THP still needs you. Please stick around!

Thanks, Lance
