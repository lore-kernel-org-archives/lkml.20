Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A19C466AE5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777683; cv=none; b=qo2ObqO1HevcVYRvhl1gX9eq05e0o5eLLxwHGBtPnf8dmYUxZbxBJd6dqBpZ4uIbSe3hLR0EVeXQAPnqcBEmjgPiXqgsXQWrDbfdi0jG0sWokrsPtpIpxY1wa+zN8vRwfop2eH2pTqGlxKFNAJb66OTbNPAbKRKWl/+V3LyKgWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777683; c=relaxed/simple;
	bh=9M6YdGTmzlIA84AI0WAzE6Z1/R51o1JQ3fNRMizWvJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVs24tVpSuuodcoaJECGaUtS3Y9c2B/pv6uGsZ2kBlm5c4aOCENCbpxwlsHbVW9z0NCKfLeANa2Yt/BPHxZdM5a1D3LYyjWROAkw3Z36Fy+XW2rthVIzOnmElFhH8E8Nht33Z4WBz/OnkjEg0BkO1lYqgZRiK1chF6m4GtjgYiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=X/LntpxO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KJiR8X1i; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="X/LntpxO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KJiR8X1i"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2464F1400067;
	Mon,  7 Sep 2026 06:41:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 07 Sep 2026 06:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788777681; x=
	1788864081; bh=1jD860aYnoDzzTEnpbBDK2GJND4YZ6QB5STId18Bk54=; b=X
	/LntpxOyNtorVCir5bQm1OJHT5P5LZEDNcxMxx0lYxptKQiGcmarOPkSDBjiIhDE
	sgRvqJGB/7MMgZynNfwIwPdes6HkOAxu6/205e9JSDaRrX6evBbpHk52TbCM51eG
	JmnIYRV+iSa8miEGx7kE/CeTaMw7zsnrLrnVMW81/TVGdN1YHWdcJc3HHfQlTjQb
	afZwnePWsn0Qe4jCdvt+GYwLazciszx/bNO6QuZa3sjAfcshj5fd+UwRsvwfzgwg
	utoaqkOatrReUwfAWEulepVmOJJaffCDpHEQMJQgMM7KJpAqkmHrBPpXvlmogICO
	kq6Pg+J9w4G2HPhOLoz3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788777681; x=1788864081; bh=1jD860aYnoDzzTEnpbBDK2GJND4YZ6QB5ST
	Id18Bk54=; b=KJiR8X1iWATJ1XU7NDFWEOTKYaasTfiqK/H6RiqUMw+ALi95AvC
	kckukTbozf3Hx40vBalUOil0iNx8WamDvqV0gP+Q6RUbXxg9Nm7fV24zC3HRqrij
	oTGoA4QBGQ1NemVnqhAQ2gSXg6tQuY4VTkGO7P0PFzNHdkE+zqXCTvZrQpyrW0p9
	Nt1/hfUgWuB1acGenleAg8sg1j1vdg0ScC1H34ggexKm3bym8RPiK8cx9DHmSd4+
	cEJ6esD1HXAgl56YPPm3F5UJ3BTHkv1zqsPvf7b1JGUWKrYbdUvHjpbmOIHgsBMV
	BfjqO4xuvf6XYIWheG+o8zzAKjTWXnYi9aQ==
X-ME-Sender: <xms:0JSeaidWHaHz5m6VOVDvZqXur6F75V16mRVA83UhhtSEW0yaoPr7ZA>
    <xme:0JSeap1zeIDhmFFgoaWyTWPbnWL6bfCfEUt_hvE771PV9TdY4t8E8Rp3ZTcurBMpw
    ZLLxjUkMey_7QVH5SbuNpzziXH91F6EdppuhOXvTIG16sU_XgE9M9k>
X-ME-Received: <xmr:0JSeaq7ZHHW0066zNGuLLRssmb4goMIp89Eosxe9cVIJ-vWhKaEJi3DyFKw>
X-ME-Proxy-Cause: dmFkZTE7xOBBvL/1OD9pECi3KCdAnpNQ7xJGV1gqKh8LGh9lBNniwXdMjixNdKGF3Rjiz6
    CifmFleIX1zDNXXqXFb1kCy4yWhc+a5/oNU/hl7flkrPaYBo8uDuggQub2vrdfM0SlTk7N
    iHc/CEZyhuvz3qNxoRQW3OwuWlT0fFltXwHfwm+gfLrRv6iKPMXIJc9B23QURUJTKjHR2E
    gIQ6cM3sh1TNQ2fZpmbT6Z3NGu/BprrhWiWC6dzFFtCqyqbZ8rNSxSA5NQ/5sPG3JNfmQ0
    9omRcS4KXSyO5NN4x3a3mm2XgmJ+tbvh0D95oHxRGr8PhyHIVUSMqLpcDIIsHzwxefE3PX
    6PY02GFyH0T9JvrTn51Do9taVYrZBCm6YhDaxxKJGKIJHB8QTPnFwMHEbEeTaeXDB21mTO
    fJeAbQP4eXU1/oO058LL5PDXFpQ7Z5IHOCCGx79hTDqOd2c1JC4EfnVoWV0g4EcvjhDDLT
    uKvUIxPgR7URTdz7HYH3o7szAh3V3RlF7NRNUt8JM9rkUs9Os6L3ezTL1Z5gZzgvw/siFw
    3qZWRxc3n+zDgp5ZfGNC1GfSkhtjPwoZY6sewrxdV0ki+lhmH/2H6Ss52C6sScbpi6rcVO
    YMSUHrRvoyuT/XohWXow330iBKYVmgQWwK2/t6rEJmVOte9HFJrffmTGTKxA
X-ME-Proxy: <xmx:0JSeaoLPait2-XP6nhI_IijMlpaLibVgtTkn4tHFJ5AwQERm4UcnTQ>
    <xmx:0JSeambeqIStzhPBjLE-bio5-2JBQU1mqYgyYYIijYB9cElZX-5SKA>
    <xmx:0JSeal3WTZHFK_a8hhtuI7_HaOYsXXvdc3GG9HmgQzByVXz19kV5xg>
    <xmx:0JSeaoMeVhtRi855EJsLkGCvkh49baMiYPRb520XuBft3g7WvDzSBw>
    <xmx:0ZSeatAm7wR4H7wutSb_QHhyKnBpzssyw3vUZHeSD-qP0ALiUjJ6q22x>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Sep 2026 06:41:19 -0400 (EDT)
Date: Mon, 7 Sep 2026 11:41:19 +0100
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R . Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>
Subject: Re: [PATCH 04/12] mm/collapse: add collapse.h for the collapse
 interface
Message-ID: <ap6UoT0h_Br97gX0@thinkstation>
References: <cover.1788533997.git.kas@kernel.org>
 <ec5230f43af7153e18aed02c6ee38f010106d8e8.1788533997.git.kas@kernel.org>
 <DL717O23OZOA.2UYSFURHZH0H2@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DL717O23OZOA.2UYSFURHZH0H2@nvidia.com>

On Fri, Sep 04, 2026 at 10:36:58PM -0400, Zi Yan wrote:
> Are you planning to clean up scan_result? SCAN_SCAN_ABORT sounds funny,
> SCAN_ANY_PROCESS means nothing, SCAN_COPY_MC might better be
> COLLAPSE_COPY_MC.

I was not, but it is on my list now.  Not as part of this series: the
rename touches every result site and the tracepoint's EM() table, and
this patch only moves the enum.

> Anyway, for this patch,
> 
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks!

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
