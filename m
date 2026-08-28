Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74C23A63F3
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 06:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787898883; cv=none; b=B+FklH5Qjc7hu0U83h7cdcRFwaabBdYff5Avqe07LMXuYQK/LzD/J/1u0Zumoa+iD8uUPdqylwg6Edyq6mo431HTgDNca3EsCGVLMTvlnp6DC84VmkBIWWs+ITq/EiIK4tPhQY7Bt9rkBIEAhX65sIKfAht+iwfaeNVzz1oVtAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787898883; c=relaxed/simple;
	bh=FMaNbvp1G9GRptR0f2XwUG1KxVE7mzl6TVTU9xfny/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ml4yoiU+UA74sBj0kfKcd2kmubKXsHsfJWdUdtayGJ87t2xnOFWf3/s1gMPrmvCrvWc7xCMZYdFc7UxBXrbjvIRlr1BcnnR7Qj++oXvzCGC6iUZuQ7BdDBgnhQQm1ShMjEbpnomCD7WWdRsaWY+yMFFAx5cFfP0YYKJy3NgdfoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ekib347V; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ekib347V"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caced6038eso7135645ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787898882; x=1788503682; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C1F/vttu+vhSUybmlNoSvxhrUsq1hJOcWYGb6fs+h+w=;
        b=Ekib347V0z0gsOtLQXuph0CZeWZqzaBp3mxvjKt72zoKdz/MWfapoz/fXIkZVxz7hY
         5EEHrfytokWdpn3o8RdqMwMdqAW/sKPTNyzUbOgfDfr6bnEm0UTFu3psXxOh68QuuVir
         4uWOaY3R6MACLWyNT9A1DMbLID+hlbQ6/1w4Mw1LqhGEGcdOjE1zMgABl1o66caZF4sb
         44k+4UoJUyeIY97V0n+SSND4xn2VS6MGh6CyalaTSmzbQROp1LJmvDmcEAh+r5FAzj05
         T5SZ4KnATUsr3ahzJS8A8hMS3ZeK8Ho+H1ePXEIu4QAqCeNPC6W3aBre8qCGaq0kiruM
         wCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787898882; x=1788503682;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C1F/vttu+vhSUybmlNoSvxhrUsq1hJOcWYGb6fs+h+w=;
        b=sBlqcalzT1pNh5oJOQybRbyG3rywh83p3py3XKXvXMvw7QzeqrbpOd3HYUrJmQzlA2
         gOqAcKyae1a84Dhkw56H8ucMm65GCpxSKj+fIPVob1H/mAoiVz2B/qtR+eIWIz8CODm7
         BK15h+Eoyq+9OG/3uR9CEXFhj9GzWUcd7TCNPMCtd7yeRGMNWalfJ1C3tykFefGGQLFc
         nMo6mKHOgkRMBwdrcp401FDXmgOu9F1KvZiFVvz/5uBuDuhFiljLqK8Dx+agytLtnioW
         pNwyuXUDNqFkzB9MnWAfyGJojNYvdT7Ed2/v6IRgLmqU78JIoXNdbiMpUe5etPt7Vc0g
         6uHA==
X-Forwarded-Encrypted: i=1; AHgh+RpBcysdfDU0puMOl+6wlM+E8iJLFPkfPFJ5VW/Wm9TKaDCDslCrn6kSGLg2QDoaoTI5r9XmohO5wnL2Kqk=@vger.kernel.org
X-Gm-Message-State: AFuF++nbMpHHwifxmuTYw6zW+r+giw8kHs9S4MnlpbxrTyuuMKec8UWr
	46a+xg+xY8IlU5VMKppAdjhNRrBXAyZnjVwi3RS8n6nXfHLc5nkIL5nv
X-Gm-Gg: AR+sD13xTryqae8W5iHqpnFI/MqdpRPWtohhDPHeTJ8Y3KVhuxoNv5a8+hTcSG/fIYy
	NQNvRQPAsUgGTd4bvcguaNJUsasoiHRVI+ewjsQR7CYOK/rpT/5/csVQ7EkbyrFFLbDANE8RKY7
	l9XDxXExr+qJIQqFAb38Qn1zDsVeI/xyT5mhYwQqPZ8ovTNtuHqrtQeoP81ZCvTfCV2KJbSiudq
	MaJOfHdP1ztoCpnxQ00Im28M/SYR29FdO5XQTMFjAF8pYNZoVxS+dqZyb1b/Es9i4HjcmAT+kYN
	ojOmrXQW1qIhH7Fm1WvVcXoaRJDCBnqo+lRJ0TxMFEszA3WIGD2DibGwsUOoe1AfkZJRp3SmXVJ
	RbJKnvUprf31NwQzjO9/OrR1cfIahMg3u2wY+9OuOekqaHDIXehCK2qRtRK2VJxND1xci0MJ+9Q
	WvNLdi3Eoq50Anrabh429iqiUCeDwLf2sJQBAHKB6fGCsoueEZSeALHFsgiuwPk3UZ6a1sNdgUS
	AI=
X-Received: by 2002:a17:903:32d2:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2d74cc74a80mr48204205ad.3.1787898881596;
        Thu, 27 Aug 2026 23:34:41 -0700 (PDT)
Received: from localhost.localdomain ([240e:b8f:1df9:a600:c693:b19f:ada0:748])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598b068esm2546405ad.70.2026.08.27.23.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 23:34:40 -0700 (PDT)
Date: Fri, 28 Aug 2026 14:34:31 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
Message-ID: <4836208f-a84a-42ca-aa74-bede23d7de41@gmail.com>
References: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>
 <ao7Nr_FALfP7cTY5@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ao7Nr_FALfP7cTY5@gremlin>

On Wed, Aug 26, 2026 at 12:31:09PM +0100, Lorenzo Stoakes (ARM) wrote:
> Since it's 2026 :) I asked Claude to look at my time as THP co-maintainer:
>
> 	~107,000 words of review across 948 emails (in 279 distinct
> 	threads), counting only prose you actually wrote — quoted text,
> 	signatures and attribution lines stripped. That's a full novel's
> 	worth of review commentary.
>
> 	Along the way you handed out 194 Reviewed-by and 15 Acked-by tags,
> 	and your longest single review was 2,404 words (mTHP collapse
> 	support, v12 — the khugepaged/mTHP collapse saga accounts for most
> 	of your top-10 longest reviews).
>
> 	Estimated review time: roughly 300–500 hours, centred around ~400
> 	(i.e. ~7 hours/week for 14 months).
>
> 	1,615 THP-related emails in the window: 948 reviews of others'
> 	work, 278 replies on your own THP-touching series threads (~31k
> 	more words responding to review), 382 patch emails, and a handful
> 	of MAINTAINERS bits. Busiest months: March 2026 (131 review
> 	emails), June 2026 (113), August 2026 (111); quietest was December
> 	2025 (5).
>
> Think I can be happy with that!

Thank you very much for your hard work. Over the past two years, THP has
been extremely busy, especially with the addition of mTHP-related
features, which required a great deal of time and effort from the
maintainer. In my main role at my company, I am also responsible for THP
and memory reclaim functionality, so I fully understand how demanding
your work has been. Once again, thank you for all your hard work.

I also am relatively familiar with the implementation of THP. If David
is interested in my R: or need some features implemented, feel free to
let me know. I'm willing to help out and reduce the pressure on the
maintainers.

--
Cheers,
Vernon
