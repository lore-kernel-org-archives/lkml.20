Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24023F7869
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787745882; cv=none; b=LenYQ0OC2HF1313s8LwG1Vhmz7tHVIMk8w088JXkg0Jfc09WMyoEBEQcYBIMNqqdKcfehMYrKhLDzvGsLT4dTtKFQcR8NlSS187FlhFICZUjsHrkdmfepnSnvoYR8g5spK2DN81w2N8xPx34aT2gdzEf8+KNVolGLJgKPMwJqw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787745882; c=relaxed/simple;
	bh=BeLDqK3e5iPxOZ26WAZ8CTZATQ3AvTW8MmFzK007g/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDg4qrlLXcQcX/PQ01pqxRXUQck1k4tsv346Aa/X1J0gfgTqAddoohN1TFfQxyzgH0IJBkmVO+PMIx1Fl9QKuq0wS4120ld/K88DKej0uQxU7yJ3J0Hr7U06BA+PyjfduGn0QXMpwVQ6TgGs4sQwMeNf04Qvpv7T7ntK2zEIDdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=NIc52T8r; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AHOiTX7k; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="NIc52T8r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AHOiTX7k"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 955C41400098;
	Wed, 26 Aug 2026 08:04:35 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 26 Aug 2026 08:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787745875; x=
	1787832275; bh=mzGx8XU/Zb9y0rwHGsJjP5RQ/DyXPYcvJQsbfsNfH1M=; b=N
	Ic52T8rogd3+LQVpiihprD6MenoQoiweO8cqR3/VnhyZWn7r0SK2oWcdICwtykYF
	DAdDPlM69S0G8HtFhuDX1HB8Mkna/TOzhWjPMd6HOgPEUzlyw2D55fiTxYCmFVLU
	Fk5tWW3zmPUs2bDedm7t379cNttcDdbzHOhJ/m6l837YTr86D6iGxIDR+G5iL04W
	FPGoUsdpksGXRvPpHEOwenlzpwYf5UAOXJF4muigKxIjXWZxLCJ6C53NUhrW/Xyf
	TiZwinL+IhuqOWBkBkrbpzZIfdEFy/hUCevkmE/8rglb6OYoLmdXfRpPbxw5FATe
	COdZWpA1yGsssjjA+xr5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1787745875; x=1787832275; bh=mzGx8XU/Zb9y0rwHGsJjP5RQ/DyXPYcvJQs
	bfsNfH1M=; b=AHOiTX7kMU/wFMBDUqaI8KP2GM94iHw+g04gwlVJOe3+jeoORIu
	wGrGRnlrgRynS3PmC8hXkcCr/rmvbVDSCx9fDOdKO7ExjwBY5nQzArcZnANuoEJM
	rVQOK1vdfNMkDkZExkGYdP5A9vUmJgqXuxtDiJ4UCSy8Dj0LXKFo+t1j/dTQqpM9
	zNe40Jkp905syGPOa6ksBSOiYaz/1r44OVpB4tN31T7z30IpCrwo5fgxqw+tA0Pt
	1EaeME0Q1Y3OHnXqfJwmMba4XJEPZoUsxQcseicTg5gt/WZTkSwsm3Z28WLTt6ew
	E+3Ae4ylyuArxRDa/yOXOH5cvNjY+3CSCQg==
X-ME-Sender: <xms:UtaOanwP03jS72WpEvYdhU2M3sKm-sSCnxFqcjpaeSUxWkY3q0aUww>
    <xme:UtaOamxXDpg_UumB4fBNI_LwNtr-cVh87fET9eREpABl8Ucl4TCXCaDGwaWRjrlmD
    voUQ4Lkz_syCh-WvJOLkPa-h-iPJBVoDlucPI8pd0Kl6K7HIzdfgw>
X-ME-Received: <xmr:UtaOanZX2mm_WoofYNscAlXdghVaph84EE-bk-bWiB5Y2KVccoayDUOaeDo>
X-ME-Proxy-Cause: dmFkZTGaDSKkUm0bE0bL6Wmom+eIuygXvU7ds0QHNuYpR+VGQom2lcF81zbRwOMA441d+a
    bPc+WnC0WBrnJXdQuimTvciOyud0siMW76OxtZX+qXX9JO3xt6/5f6fGvGgViO4DxyfX2u
    fpEA97amC3rjxqu/OIxVog+CMQCrVVKr87A1vtcsckuxeMgX5ZqqTGnJjAWJ2oX78mXQS8
    xjhtBR+/Ugka/oGNIOOHQS7xSTwzT5cqlFZ7v3L8sc+wkxvAoRx+hIwny73kKuUJRQJYHX
    Y1dBtAV6m6y5My1C/MM1YOPMIIky1gj/kvxDosbOnxH3DeahI3ul7TfEWxkA2Ar+zvL7Mm
    YOkrkka6KnkJ/w1LEHBczaAsba8N0dgoJgAMJFIROSoE2wwRE9zvqKgtW4evRu+IrWOQ8z
    e8Z5C0ISGUfrBqpcAg9uV7HbDVbzg75AlFuT9jt181LYLGJW6AP887CfXFM41+VYFSP+Qc
    6e4wPgkuuJOFRB2eHbLsV186ZxMeBR5ZZERxrl4rzIjxrrEIba1mhI5Z1FXhPjkr282Ow7
    IH+qlgQFXTif+WMUTPEK9mLf6W4XaZ1Mq6d/V2U7VpIuemhz5UFfzFyUwvCJTBgH8jSPgA
    h2rzdr5vVAjzkSCHa5tc5ZpLYdozYI+Tw8mtV3ITQqi3VyeT4fSh17VLguLQ
X-ME-Proxy: <xmx:UtaOavlKBIF1WV7dv1vFn85dYew-SgsuiQoO37-JOWyCYerkvTTa6g>
    <xmx:UtaOakGDadNpDplLRDbygMzuwTC9pxr4hj0v857G17F9iLLY_7OXsg>
    <xmx:UtaOauib6GqVPwntMrTG06J5XVelPgvu2N14XkwckbyZ1vVmg8IYWg>
    <xmx:UtaOaum7t0-x2fRceqmuFFT1iHa8zItESPcGc4mR-7UpFFzo1FkyyA>
    <xmx:U9aOaudvRDi7kkRgvUEIOweAKYfwydJNeWkNxYq98GLp8rGTXdYsH14I>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Aug 2026 08:04:33 -0400 (EDT)
Date: Wed, 26 Aug 2026 13:04:32 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
Message-ID: <ao7S-wjzcMIgM3s-@thinkstation>
References: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>

On Wed, Aug 26, 2026 at 10:56:39AM +0100, Lorenzo Stoakes (ARM) wrote:
> Unfortunately my workload is such that I simply no longer have the time to
> give THP the focus that it deserves.

Ouch.

I guess my 57-patch series did help the situation :/ Sorry about that.

It would be only fair if I share review load for THP. I will try to be
more active on review.

David, I can send patch if you are interested in my R:. I know thing or
two about THP and can be useful there.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
