Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F70C3624B7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787839651; cv=none; b=rNLnunFTDDSpN8RhyLRKaTCa2yKnurW3gZHDoZc8p5t0ZqLzksXjmig9c8o1T3G2tvpjkr08ClyNvMucUAPBw8EwSdtn1OKlOO9Qr8Esy7X+kxXbwbGCb00KAtP+ZlouDmpdT2OZd+Ftv4EshdAUNlyMEQfULhspy6mk6fDCs5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787839651; c=relaxed/simple;
	bh=DBe+ks6LuMS+i8Hvjt+7dsyDZ6OEmAb4dySMK9DOWNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEpeSzuXXzxhhwBTDwZ8UMkmpWRZEhfk4YczL+ymnAppIcdi/jvVtPVIwE39jaLZ7tFA9OpHyQaCIABJgOyB16op04BLxkL30j18jjFWlAQqBm1liOeFAtLd5xRmhpeJtXiHpVMRgwpOMrB0E60vad2R5DdsPf15HadrLmSIMpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=k+WVhfAH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Up7ccU1j; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="k+WVhfAH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Up7ccU1j"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4BBD71400151;
	Thu, 27 Aug 2026 10:07:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 27 Aug 2026 10:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787839633; x=
	1787926033; bh=G3Dh2o/3HyrcxPByYeYJukS7fILq/peuiJJwPWAvDzQ=; b=k
	+WVhfAHo2YaBEPZMooT2RGIZUpcB1FWU2F9wSfnw7MRC4jTgs9qn5VDe3OuNJ4Dj
	fS+Vw3YdZoxuLFk52Y2G6cfXQLTE366IVCjrzlVOHaG/lVjLoSfuli0aOR1tJk3l
	LAETQmeP7bYOaLiymSWtFk5WXteVzqd1xzpeN/0/xPX9qXZeA8+ZPF62EzSD6gmm
	lmJwxEYdzGlld6QDJIAEkHK6mRgf82xRKs0b8dcT7NCwO7nXswXhF+Qqax7z3qSV
	OUH/0G4G5eLFi+9P16Uy/pc4YC+Ouu++VUflnxV+N20DysZ3Z8mV4h7uq43vVsXo
	DY0v7xf2nPyUCwGeT7t7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787839633; x=1787926033; bh=G3Dh2o/3HyrcxPByYeYJukS7fILq/peuiJJ
	wPWAvDzQ=; b=Up7ccU1jT9GuRd+iGBKZ2+hUH3YHU35EP+BAtvBZntcL/xyTz5U
	0X91OB2BiFiKMBYUJ68X+hjHM57ntLqW/q6SOUQDm09+jW+udxYbStk2lCBw6BWx
	jh4FwpP+/MJD1t03tNVghVH8jv0U2Io4EmC6+TDB3JddVstzg4ttxIJCugPCe7Is
	nF2cDNVjTA8egC0OTfk025BpiDauey1IPPD5Hpt1/k1Y3Mvl+l2iw8/tyJ3Xwr2I
	fFI+5cTQewhfL7zyVhVhh6IDeZTWemLiupaxCNGZbYifKu+v8qVNb/uepQvuLitm
	wJcKqMJsdpLoSmSUwu9dLyir9bC5ZgDfbsQ==
X-ME-Sender: <xms:j0SQatZREgDKupZ6e-QiI8qPyZLTUVn_MDtJgaFlhpoJIl3XFGAnrg>
    <xme:j0SQamxCDWZU1nm8SrPjh4NyrxoTGnwttWx7zWxCf78hFXYd0uuBZBg_lJeuyxjqi
    AVTlWy0HlJ-4Necs0EK1HVqz4YPIMTFXgS7MZ1S-gNCEi1FPQ2Rqkk>
X-ME-Received: <xmr:j0SQapNRdTp99qK8rpvfxeAGVLUpaSzaTS9wcqrAChpex0QGgmaYbTofE0U>
X-ME-Proxy-Cause: dmFkZTFGSW/RJfX5fFLiJJB5xonRRzVd46tFbFtZOtPw0QpDPCnI5vfoNCDg0AQK4EaV3w
    6GfGtBxca2h0U4zuEcIoGCk3U2UUI8Udn3EpP4OXFa0hB8BMDqQeZ5idZ8pZFAKqjG0QoU
    BLTJOcH1ViutYOCUhUny/Ca+Ry8gP9QT6/7XhX9q1pHvOPGGPgZrn3alTue2quOKF3x9B7
    pjjpFerKzliWyeFmKmU4r3eZG4uGomhOD4g59ZDLXyD0L39QPG+2lXkCPhTmgGacfqwlqt
    8HieHcppXor1VEzneMl15UHX1u1FF/m7aO0tg+KPti97apdJLSZiHwRXR6hXJNYJKLYOaB
    8FSwVCXbuYkDkY2CnkT5ho8Oxp9reXyVTpZxzLLbsO+VZ8GWwbZdIrYqC0166pJ1iDRt8u
    VmeXqVVsbq8gWBxinQOq0Jif6pgnFtK17BhAuCwvNDvjIXlJ1fMtMbWnzEhRV7Zq1PG8S4
    RLiAN9YDw0797axKORICyddaeWUM2/UhOyjf+OnB4kP1VspcwtbxQkmidGyWiJ4pKnaqZ2
    0QU6XeZmFZ0IC/PD072C8qNfv+zE35hV4Mg1TVHH3pXU9LnnXnKXBgdxAHQrkbcvi1+Ses
    wxvZV310nAUqJvdsiINUF9t/VOZXtsWebKqTRdJbaTQqVEHM+LYvaAI7k7wg
X-ME-Proxy: <xmx:j0SQaux4goRFOqWJjSufhN5OUvxxmwz1NJL8WuxvRF1V0zC1bTZy-g>
    <xmx:j0SQarCNNAcIciXtLnLi06MrZG3QWyAHE93vWm0bvddUksdCQT3bog>
    <xmx:j0SQapOjsbQBzNitLv8HTOlQEQQTIS6B2PVJADRC7xz-W4yKJppDeg>
    <xmx:j0SQasZNuxNbWpoOubRdWp8xFFZF-e0tH8c4ysDKcG3QQd4rt01sTw>
    <xmx:kUSQarhEO7Zqa5q-8mUjV6gui5X0-wd3vjcxXTeOSmwKaiS6FSmIFGy->
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Aug 2026 10:07:10 -0400 (EDT)
Date: Thu, 27 Aug 2026 15:07:10 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Lance Yang <lance.yang@linux.dev>
Cc: david@kernel.org, baolin.wang@linux.alibaba.com, 
	pedrodemargomes@gmail.com, akpm@linux-foundation.org, ljs@kernel.org, ziy@nvidia.com, 
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	baohua@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH mm-stable] mm/khugepaged: avoid unnecessary checking for
 swap entries when collapsing a mTHP
Message-ID: <apBB01VBbmV28gWP@thinkstation>
References: <d02405a5-1d0d-49d5-9056-1a34ccdeef10@kernel.org>
 <20260827121151.7837-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827121151.7837-1-lance.yang@linux.dev>

On Thu, Aug 27, 2026 at 08:11:51PM +0800, Lance Yang wrote:
> For the candidate above, the loop only reads its PTEs and returns
> SCAN_SUCCEED. Pedro's bitmap lets mthp_collapse() determine that upfront
> and skip the walk.
> 
> Emm ... as I asked before[1], any numbers showing how much the extra scan
> costs?

With the win being only some scan cost, I don't think it is going to be
measurable.

It can open a path to future work. For example, we could find fully
populated mTHP windows in a PMD that is not eligible for collapse
because unmapped > max_ptes_swap. Right now we just give up on the whole
PMD in such cases.

But there are more wins to gain there. Just saying :P

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
