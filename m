Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA8358FD2D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655541; cv=none; b=EjL74TIrO1O+64eKFrNvCN1V+AcM1ybkKE7yLc1rFpj/qYyO8cTrOgpiX/ATI1Cw6KOE7TyDuNlEIe+6kgQnHmHzZfM/H087AleRiFBKXID7zgfMtqNl8InxjJTKlfi2w9lIBPS6ipubgjJzzBOTuEy/vSzTEXa8Wp/d8DLDWIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655541; c=relaxed/simple;
	bh=KTC24rDVpPzqokC0m2kS4a1IUb/8rsp+wM1+qPf+ytM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2MhqOdjomzHSFiLBi6Sw4TTKdCeXUPbrMsC6Nwl4Tv9tp8oVW6QbNiu5y08QVUBjbMOaM/avm2ZrEnvwQX7We1RpgG4AQFn52FiFeplnUBVl43KZR+L0LwHFHxE2lSGWHt83dO0KWM1bsfQCf856rnvZ9djtosDNK+ghcsuXSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QjpiprcR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QjpiprcR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482671F00893;
	Thu, 17 Sep 2026 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789655540;
	bh=5jl05X/VB2n88uxND/5yjViHDY91tVPj4RXTflzReqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QjpiprcRqK3vCH4f4Etr8j638WmWy3VWyLBFZ724HWdTnUmUym27GROQOwWT9FVzF
	 d0qfaPGf99hEXcqjW4QeoCsyxsFMgG4WgVbeN/UPDOXXDXxW4xIGz2U2JKjqBhW7Ui
	 HrTE00kOTY7dl/86w75OHxE/joksE1TT4Iy1ZETiImJR9nRxAdzGd3HGuM1IcxOWNB
	 esxkPNu196OlhF9Akcj6/1sEuvMIB+AH6iof6oZYN0R5cZYn91N5sHxLrg2LC5MLmD
	 3x2gjfrlU36lit6F5EI3oMELGVIbwm/j4FJcM0Go0yRwRiH17NkrzuzXZKdp+iBHgR
	 QIbum1OmeN8EQ==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id D24E3198005A;
	Thu, 17 Sep 2026 10:32:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 17 Sep 2026 10:32:17 -0400
X-ME-Sender: <xms:7_mrakqOox-1DH90pxvy9rxQZ4HGBwW5qZjVtl9mFXq9p7N0V6lA8g>
    <xme:7_mramIYihn0xemjLPVSce-Sv-zF45ROyjeqCfZAemVagJtygloKr9a0euudsaL-n
    R-0BV6QLnGM2Cqec9p5NLe8cLmbb7ODT9LpOwROCwBt3n_vFAKRMNI>
X-ME-Received: <xmr:7_mravMkvU9BqVVKgyQZH9i99gxe9jAx-4QuRTf82fM5G4o_fwMZtMl0TbQ>
X-ME-Proxy-Cause: dmFkZTFbhvfv6QAxTKLX7KYLpUU6bYLQl9nD8TDfhuzlXvIEAstW1SJyoWTvfI54B/0oCp
    WrISYsacht0e+cZUNFLJhLNg/aQQGP9H4iKU7tXJROYipt8RGAKqklntwqu2rlbUszx//x
    6CXVk0VCsfdLLoCuotdaw+OD6+xHO9iMzDT91daJqo8GKzOp36j0AZIXyXk7+AElXzoGmI
    8Z8cneQVNE4FQh7S/R6PNAioI7nQgGwZxNr3VD2BjfGfcLVc6C2s0ZOW/IXvFeJYeBLS+E
    q3dnZlMQTM0hDyA5GYSvaaCp/mthujNxyjGWuZ4NwjBE1p8jbKJTn8t8RB2DtL+FfcdWi/
    fZbjvuf+15ZSrVTu1N21l1c+DnHqqfIeO/V/x7dLJaCvY9c3xTlZZmvYXoytqWr0Ad7sqZ
    c0SmFKB2hzftKYY9UVOKEbA11CUqe9KjluTeDcltspGgP7Y3mlZK0Oa7CDKiwHf30ILBdY
    deu/+BpjQZuk7885gubB8sH9Tuwx8DuzdYPKIObNUrdCsKyBnXW2FdblRZy/cv0pPYered
    ukGtBxhEo9dkvvXlgOLiewL9VbsDGBIby+HIqxZMZKFWrHV6frGCi8KG6UiiOIv++tRrLL
    dkmctRz4OJO64A2OMJckjLWSsV4AqOm8XVADFf7metkvGzkxxQnGqZ7HndzA
X-ME-Proxy: <xmx:7_mrapriRuN2AvBtTMqFElIZB2NMUC5cCSPp4d2Y6FS8KgOgr9du1g>
    <xmx:7_mrapEdlzmZca9jhprMtb3YVbYaRC5IKyiCHMOOsxgm2kg03CLJCQ>
    <xmx:7_mramKY5GfguctbBD7FsDKjDa-8_vrYJsHIRO2qPMhRJjwbLq6hPg>
    <xmx:7_mramiG2X0Wanrk3goNhv_lrKSuBFlcTwveHu-D0I5mXkGhvJVawA>
    <xmx:7_mrao4CBEeLlGjcS0PXjgic62T4IEGwKeftYYtdE_1UIfBI70BBPdBX>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Sep 2026 10:32:14 -0400 (EDT)
Date: Thu, 17 Sep 2026 15:32:13 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] mm/huge_memory: disallow raw PMD mappings of the
 huge zero page
Message-ID: <aqv5r6Ar0vyKXa_x@thinkstation>
References: <20260917121010.60966-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917121010.60966-1-lance.yang@linux.dev>

On Thu, Sep 17, 2026 at 08:10:10PM +0800, Lance Yang wrote:
> vm_mixed_zeropage_allowed() validates zeropage insertion into
> VM_MIXEDMAP VMAs. No in-tree user needs to insert the huge zero page
> through vmf_insert_pfn_pmd().
> 
> Return VM_FAULT_SIGBUS if vmf_insert_pfn_pmd() is asked to map it.
> 
> Link: https://lore.kernel.org/linux-mm/f76beaf8-351a-4b22-b362-a945a5e1af6a@kernel.org/
> Suggested-by: Kiryl Shutsemau <kas@kernel.org>
> Suggested-by: David Hildenbrand <david@kernel.org>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>

The patch looks fine, but don't we want to cover the same for non-huge
zero page in vmf_insert_pfn_prot()?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
