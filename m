Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51843F4DD0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789480013; cv=none; b=SO6I7u0rboMPUZQBFtw5NYVE+zTPK/8kiuP7YrqAlr6rs651dphbf4rwNFfKqH0Ks8iCktT0k6JOxKBMbR8FeoTfNsLTD1I4L82yfJk/214smIAVnq7Pa+AxiTbC5UxK5sK1sdsd5HcusfxZosk6UEX1e7owQit9qMNPeMjOAZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789480013; c=relaxed/simple;
	bh=UkVfNVIy7sENgVo7iJcaggTxO1qWFNozi+Zn81xR2PY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNZ6+s+/QLcx3trEfHSYin4T9Bk3v1UnDZwlZBBKBhcPEhPCf8XnRl+724D5y7Bx218Roz6PpeSrEct01iuafhnABWBYTu78P9XQE8j0MkedDap591PcRrYTjzINB7dR3OKUHwL+ezeMHaH1Sq/81Y4XAc1oPs8xgdqJW0libBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=AgV6t3hp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y6V3Zpeq; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="AgV6t3hp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y6V3Zpeq"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id B71531D00285;
	Tue, 15 Sep 2026 09:46:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Tue, 15 Sep 2026 09:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1789480008; x=
	1789566408; bh=hLr8f1y6OpCVlFZxNEDzkoNAdcjT5mP0qSfI00lGolU=; b=A
	gV6t3hpNgBBM/0P7KIfeQzhPefkDLArILyqAZJqtGPohuNmIb3pqNuebuH8TG5gw
	0ThVd119vrssfi7xWCMcw05Ik7AgphgpuroqZUacbs3fCnDjfuMukSDBpvBWWxkd
	X7Tvdm2cONPF8fZFdqmeF+0uhyl3LxxWZB2Z9+/iezqsHv8fUy8XtI7RwIzS2TaN
	+T1vX/KOpVTuK4yVUP1hXxPyKyO5zMzUOCrXb/bEga4qoabLbW4xSqxv5HwBMyzH
	SVNEbO7dkcUQJteu4Rt+mrJTjag9xNaA73pQMUme1Jvcu9Mi0WxiADR/lBS+i6FW
	lkM18/u1lRFDoK0vamKDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1789480008; x=1789566408; bh=hLr8f1y6OpCVlFZxNEDzkoNAdcjT5mP0qSf
	I00lGolU=; b=Y6V3ZpeqOBjgVPJH/XkT56SZbdl8JdJhFd4tJfQP9QtypVpFu1f
	H3813v8YcqcW5mUhHGguoEpEEkWvKsHV4fdzoZnCN3DEMC1AanEMkMVKVH0R03e+
	ReVK0RzLVbYatnBHR4tZTGbsfGuHBcGHLxmaM5gJPKA1gsmGs3gEwZwoFSEM7i71
	qmoiK+X8FsVYFxO7erFyU+/qtfeRKC/8Ujxtd/lmxgLPZG44D0IvjJRPSPqA+P1O
	zflPywY6+dUnU39iQ3635eVrrTuS6IuzH/6LTfyMjQItKvzhDeYI4PQn719xGpKJ
	bO9QE/qxZdl43lm1qUNtsZhU2+ihABXXdAA==
X-ME-Sender: <xms:R0ypau26tS0Z2ysNwy4NdcHNNF_oHWQ8sVS1MxPRn-lOT1epS8NJnw>
    <xme:R0ypaus_beJEOXTtUizhzPtohyw-FW-B-YZj-rxMI7RFyvoUELYws1XSWw4GIlFjB
    -JvHPUmbHXz_FywyUUPb8GGqybKSa6msC_FkxuafGXtFWU_wYY6Cvs>
X-ME-Received: <xmr:R0ypauTqzRU1qGNcZxhVWQbXyqzFbzO0plGh6sIIewVwvV-dWrkXEnPi8dY>
X-ME-Proxy-Cause: dmFkZTFbupHd3aPtCR4lfORY2OjlErP/qJYOfeuGegnVlxf0rTctNWhzELPFqv8qBN+p6r
    yyxTtWqHsC5sajM90RNnkSnExQFUiaZMFrvJQ847xQMm2JaIAvfn+54liTzjnHWYB3Fti5
    2aExYz/+zZi9zAPebVEG+nJ8INTDyYH+sLrYp/PBrRCwHqBu23kvk8KzpFTHNk5A/OqUk4
    prALBRulTyMaMnmpbfdaFoy7b41NCz79wnifsWIV9PRtY0z08Ly08SlZn1DmhZPII+jTas
    yhx+3SGKyJUHBRCV0If7frXa3bXFCsIDo1/Q1j+VsPu2PCNTGdmvBGBf8z9TdvPj8098px
    bgtwR0dRddnYAZZqsQ7Frq9NOue3hGoMPtP7y091EnqlMwB8wyNcCz1RbFYPeJj2B/SZol
    7Kf6hYqL0e9DpzjuPnaL3orOrbCY8+wcwf7GS4X3y/uRB0IORYQmBHvRrvWPjwFNPEXSvy
    8kAi/BdqohVycyThOG6AH9BYZGUoOqPbIyGrgUKh1WTSENfMoqsrP+S5C3Hez6LcSoqHbN
    sRN/47HLj+KTnB3r7akUX0iIeLmgjVo8O6B8ZZmQE3Tr1NLT/mTOj/cTFYZQWYt1sTwfF6
    nuoyqS2bxpYeC+h/Hm1YL9xsPGJ5ypDcONgocgb+Y+FhJ5QfH1Ytadyibt6g
X-ME-Proxy: <xmx:R0ypaoCnDV77kuVSf-GB3L815LrAKvYBeYyg6ul1gLYDBFSQqKWizA>
    <xmx:R0ypaowJNcS9gO8_zJPrxwCXpjsG-xQRYmj5T8BwKJLBb7UXHS_4-A>
    <xmx:R0ypaotZyEmAMv6TFmaYSAZEWvZHrxn8Gc-_yuUQbZCd1q3JU_EJMg>
    <xmx:R0ypahlNw4uqQNOviO7AQmnzgoEHaA5DbJt5COy8k96RnESsZawi1A>
    <xmx:SEyparZPtsrzqIUBofL2iNWKiDvgJIBndHuVqQeik1G1DpRa6ARUCQPK>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Sep 2026 09:46:47 -0400 (EDT)
Date: Tue, 15 Sep 2026 14:46:46 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	"Liam R . Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>
Subject: Re: [PATCH v2 08/12] mm/collapse: separate scanning a PTE table from
 collapsing it
Message-ID: <aqlL5s0iTz9HWwCk@thinkstation>
References: <20260910120238.2529819-1-kirill@shutemov.name>
 <20260910120238.2529819-9-kirill@shutemov.name>
 <1e91c48c-cfdf-4a40-bf1c-88d8e0295c5a@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e91c48c-cfdf-4a40-bf1c-88d8e0295c5a@linux.alibaba.com>

On Tue, Sep 15, 2026 at 07:09:06PM +0800, Baolin Wang wrote:
> > +	if (!file)
> > +		return mthp_collapse(mm, addr, cc->scan_referenced,
> > +				     cc->scan_unmapped, cc, cc->scan_orders);
> 
> You already record scan_referenced, scan_unmapped, and scan_orders in 'cc'.
> It looks like simply passing 'cc' as a parameter should be enough.

Fair enough. Will do in v3. The same applies to collapse_huge_page() one
level down.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
