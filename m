Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8B644CF29
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777317; cv=none; b=TLaNAel69VHM0P3gUD12+bVgF6rjRCaz+DIUTlkffLq4N3VcTUMHxUt/8WAnUwAbkuU0ornavI17L/eolrjyaKC5W39G1G7l9Ao02CjHLF67KLYhN/1jo2u823G2ExQ531MYzqe2xdTrPFVqIWi8/AOioZ9YE6+y0sp+s38AV+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777317; c=relaxed/simple;
	bh=2NVS1Pw3OP8vOL5GOb0w8VmeOWe9K+SQ+FUO2lmLe34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmV05mmQaLQZadQX2Cs2nxRT6lmagdF7EwKt69pQnNn3OZs4NijEahPuOTUbpswxWzXXXcuAUEv8/YXlpXlx/clrQwkn9Ok/FL1T+2cbkB6l2dPDOODEV1aY7uZo3yVsdzql+7TY1O4hC2+banMFcWO1XPwDXJoy/sTBx6c6vJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=b1uah6aU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FAi5ogCV; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="b1uah6aU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FAi5ogCV"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 9A685EC00C0;
	Mon,  7 Sep 2026 06:35:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Mon, 07 Sep 2026 06:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788777314; x=
	1788863714; bh=ImLko0Vy0Vqaouw2yrFcv4DJIAkzPp3+Ge+yup0WtWg=; b=b
	1uah6aUNicvt+3rBBTJ806TtNgJuWYqZQPO9VxBm3TIa+yJv+714JFutj99d6sHN
	srBTlFpK2mIBR06bCnzG+8dh4WRtK73TyS90lO9Se3yrP6kja7AdzZ09zc3FzbLP
	XjVXow9u6TWSrjlco+zjSs38Dzw3/Bcx7HK1qcpWMLzFsKcOWj8YYyao5sl34Dyc
	bCPDUIDeUen8BMUzkxwu7ckkz3/nAx1JK1d8gmHKRlx3ftFKqUH+KkPKWqU1BrNr
	DVzS8eVXT/vKMnwHWLrbMq0Cz9VZehW46tlrnuPvN0SHzID+OINAVnXdNYRub6c/
	wijuMiLQ4T/0ZTMupzjKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788777314; x=1788863714; bh=ImLko0Vy0Vqaouw2yrFcv4DJIAkzPp3+Ge+
	yup0WtWg=; b=FAi5ogCVP314cbX84SzUSg3F5ZOyhJdX8Bto0z8pxyq1h976ysJ
	pz1EtrMXecqCyQKobwUiO7po9mkjLnJGVVAIAbX58whNg7iRwf41zebF/VGB+kip
	3AF0kkJT3PNSmIg2yGs5c6UkCbvIBXkGx31fQNTt5mmJeXeKu+riQgsJeYSeZNlL
	OSrIO6+ecNnuozXqLqbCot/5xW54a0KtbbPRdeLyfaU8dQHNzynPFYtIdVIG32mY
	M3Jigs+IX5/2QKzwwla2zjZlZyNAakZIwFliODoRfAezXwpB/hNeZydwI/dA1rh1
	GBM77Bx6Kr4ZJze7U83pTZmURlGFomKU+Fg==
X-ME-Sender: <xms:YZOeauEfWUtOlRt5oAnnZXMa3QwsI1kqeeFx06C5cBcAXKJUf2MEXA>
    <xme:YZOeas9zovbf4ih4igYBzd8eA7dm4alW1C3ik8TpS6Amo9h1yzpHv92b5axNPuTlr
    TunrZuB5wuSu-orKQpYkLpijBgoPxaA1V7SnzUukrHF66yaX9zBRpI>
X-ME-Received: <xmr:YZOeavjaQwsLfPP4pawxD2ciI1T-3wNE58MqDovEcGNDex8j0p23SFO24kw>
X-ME-Proxy-Cause: dmFkZTGJUNMrCEZ9rdNsZ6eSnav3TPgdBrPIG14gk5KcPfoZCixrZC7VxjQ3pqAPd3r9yJ
    QdQAhzxAWfnHG6wfV296DnJZZhqxU0gGlS2hFKQ+ps2WoFi2kstAw+HPdHqaYbXqXyVRE6
    KZITkv1ptpZzUXTByv/e0S/97HV2QOTiSsagH+ARdQuZ8mr5J6LGmK2kxQsd4FX4JAM/mv
    V+jJEBYxqYRsaGPSlgIzj1+quAbi1oiOhifDQ+MBeRxPkjgG53U6XiiDZIbiV9UFPoztmA
    sxOFh8uJQ/KUlJq1PEmSmL/F3b/y+ZK62njUVBMO9TcbvmF/V7VeEYwnZcm0T60SBxrJWh
    XhEfkrIqIWnILQYzgGubbi3FEPtCMd/M0nDHwZ7U4d4XlzB6v0D6zT3vDLLwY2DqAFASUb
    wJuH8Zg31WQXPqPqrxvjAqMuI81doSaPYdAhbD5QOHBYFcsVdbFg/4iktoPOMatwh3QMaw
    P9/YXv+JKPvqGCgLfxFWxRx1w/EJpFenPkZ4EtdnCV0TS8gcjJ/d7o1vytPEBC5P1tBrC7
    k3QqwynGoXE7ZyOVhVuFBoUs94Fzvwim23vaC3LD1dsHsrwwnAHmPrUJBrcmfgIg4uiak4
    kSmcdvqCji7RNeLgaLaKbSkUy025eEuoeUftzMU8RgQibxfknCrXStYkRNJg
X-ME-Proxy: <xmx:YZOeagTYZoFmMnXYxKyxTc9WR9Q-p9sBWsgBDO1vLeWP-BBdfR6TmA>
    <xmx:YZOeasBJdSRFIG5fldVmtJS-FyoE3KSf_ofosOSAbNEJgSv_mbSWkQ>
    <xmx:YZOeaq9nwka9V-qH5dzQixLee9JALigwhvP90aYhgtbalpQ8RGRZfQ>
    <xmx:YZOeam2qHyzLK-MiZHbJFNLZwx8ykJzIMrKSA55w2DUb8-q4SawlPA>
    <xmx:YpOeapqcGNIbYPBLwAx-y5_559HsuR6YW8H47ZpP0AEn-Y-uQ9Vg9iGy>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 06:35:12 -0400 (EDT)
Date: Mon, 7 Sep 2026 11:35:11 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Baolin Wang <baolin.wang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, "Liam R . Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH 03/12] mm/khugepaged: rename mthp_present_ptes bitmap to
 eligible_ptes
Message-ID: <ap6SjrGDia7AfB7k@thinkstation>
References: <cover.1788533997.git.kas@kernel.org>
 <aeed00c71bab856afb18c12c8e9b904f82185942.1788533997.git.kas@kernel.org>
 <273e167f-32b7-49f0-8589-5883a4ec2d99@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <273e167f-32b7-49f0-8589-5883a4ec2d99@linux.alibaba.com>

On Mon, Sep 07, 2026 at 03:54:19PM +0800, Baolin Wang wrote:
> Should also update the following comments: s/occupied/accepted as a collapse
> source ?

Yes.  v2 renames nr_occupied_ptes to nr_eligible_ptes as Zi asked and
rewrites that paragraph in the same terms, so the comment, the bitmap
and the count all say eligible.

> "
>  * For each of these, we determine how many PTE entries are occupied in the
>  * range of PTE entries we propose to collapse, then we compare this to a
>  * threshold number of PTE entries which would need to be occupied for a
>  * collapse to be permitted at that order (accounting for max_ptes_none).
> "
> 
> With that and Zi's comments addressed,
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Thanks you, both.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
