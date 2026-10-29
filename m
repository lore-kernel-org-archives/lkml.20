Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793276850;
	b=HUzfW5v97lSoVuDhR9RI0pv/+NPPzNxUgIg1s7R5mylM1v/kfkLzGQwDdSyV0Lsj5sch
	 dudFC/0TP2VdzeYjnxgER9CoMlbxM62LzJjV94zgdOempMCAci9alCFDe3j3hb0ES71IH
	 3nBrpcDhusD0Ng8eqWcn9Wfnc+yHx9SNzAongwAvaKlMsx828bO3XXQUmuulvm8fT4ZmU
	 19fK7T5t9r1Hgp0C33UxjFDs837ZorvV+u+lvy3gZskxsYX2rH88Ewqwj9WbpKy+f7473
	 4C3em8x9t4sOQf03x0GUZslwSbJWArclJwXzxhAQ86qZ+81+pBBONo09QGSbxVaJGIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793276850;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=nAi38oDFP76CAkZTKfTnMRaPWxkhX57roj58CzJcb5w=;
	b=nacfWRmiocuYgTg/U54cwcjJWMIBUXIHMAjKz6BlZyv2mttenOoQwXqxJCUI8iZDS/Mi
	 bcY1D2xBHxUewmIPq9RK3OR6Qe7PM17HX9ybrUGR9P24fFzMzGEsZAm1nAI7ooAzICgCb
	 0wRu8RUEeaIOT3G5d19xmFFcZWchBh7wXC5xDbG29x9dB+qhuygASqAKZ4R9SfN1HrPnY
	 wJWNrtvjKqbxfp22gkccVZrhIYjxljl9fLS+SD1p5EZX+mnLCE4QDemkSS5e8A2nCyU4s
	 /jYryVQXbZ6jYmDPe3l7Z0pRedZFKrru2Diemq3/y+PXLVYpw14dFyBKTawEjpSrM4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SFIIHyzx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830C2606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SFIIHyzx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B471F031E3;
	Thu, 29 Oct 2026 12:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793276850;
	bh=nAi38oDFP76CAkZTKfTnMRaPWxkhX57roj58CzJcb5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SFIIHyzxcPwhs42rWmTPn4ykZNkWEkrCoddjCAjOFxs5zLHSidCZgvaP9L4ZngdpQ
	 GFu2Yd2ZZNq78VHkABoHyg2y7Mq5cQTqtPW1cD+1kubEQN5dHEP+RwWCUqe8Q9S7o3
	 sFNwaas2hXTCIzQ/3hmjVZGIK/Yh5P/veJ8q8nN3BcWoaveEu9D6M8qULInT3IE3p/
	 ZzMkdhx6AkLazxKGWBvNz1hWdAwHpspA69LZJeHIgTLWYUpBcxjEfLsPlh08/ic6mA
	 mDXMSZSmNwWtC2/ko+9JvPAhlA7yBfwpup2nXcHxxTN47KiBfcwTMIzpZEecSrcVfj
	 HUZWX5uXr50+w==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id 13580198003A;
	Thu, 29 Oct 2026 08:27:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 29 Oct 2026 08:27:27 -0400
X-ME-Sender: <xms:rTvjarzwywjEjar7Mt_OyMWq6UW3-vjrV-PTwOnk-DHqc7KzFu_6Pg>
    <xme:rTvjajsv2wlC9eqWjv70wTcXnB743VNGDp9L2F6rQ04jOq6l1oe1uUoKqxAKvlbnb
    tCT4lZDnF-5dAX8TnsGCsutkPpXhc_aicyLdobpP4pJmEpm-2GproLI>
X-ME-Received: <xmr:rTvjaqxh5Kc1tu7o5vaw3wgfgB2JBtg5JTCiBU2E1bDWEMdzraQhf9JQgak>
X-ME-Proxy-Cause: dmFkZTE5B5/2wy/nW1OFB+CZ7Y+pP/zumq35zbaEYOek3IM3be5kjPml9FiEI9wEM1jNQn
    66RdhojvUW55Dx2BnSMHL3H4cTTa2ZgY3CMeKe9qVIUt96GpJ5DS39An2tyb5y1ezFCMWO
    C3cIeaP2mUrQT+dMOwdjAJqmarhyTJNtcAWXTZ8q1eZIzwkbX3axu2Dpi3dr+0vbzTJ4KN
    M9mNGSlVSWIpojb7gtvoOfwvQT/ZVd+omkWUadmGcD349l0GKA3Z8DA+TkTZ8FEuV7xbCO
    pCC7eJ5pF3UCYpWwrgGCFRh+RcwnRaLmeeWGla4wJozIhGeDLgbdlz5SBorQQr24uYSDa+
    B9Tm1/m/AT54fyJzVbw193d0xYAPrAsxjWVOuSnXmpvuwcChvrWFcWnIwqPzkyN5DkyWjv
    4ICYY9JeLOAM98WEMUESsP/OmGilWUW1bILaBYrFN3oBw7J/yopenCGgQLt+dlMK2AFU/E
    eVbamYEgO1eW62+yllod0lsPs1rKiLcqAZWaaflztHmzgT2TH1Kv5ogg7UCf722w4s2bzS
    ViAzt1ykhJivLBChtRX47gCkNjaJfEPR6phq2/k0gEI/tUv7k44L6gVKHoGEYYlrsD1eEQ
    +LCk3lIy1eaYj+nleQIYd+vUmdhJDLkLLgSPeoK+u09Rc9NGUPtiJzsfsENg
X-ME-Proxy: <xmx:rTvjajd1xvSaopur4XQIHDw42kxaMUcEZlm7-uOZGDSAle0uXEqMnw>
    <xmx:rTvjag3LOj5FGpB0XKfhVBrffrTwd_fVfU6T8njGy2xnGvdKe08gIQ>
    <xmx:rTvjasspO909yfCDAsKVYm9rvbGu0aBSJQUUjVsfD0Ub88u_TrWcYQ>
    <xmx:rTvjas8So1Fg21YsmrhpvnR9l2CfUsleJmX2kPUnNv5C-wZ2Df3XnA>
    <xmx:rTvjagSjOuRSqet80xz00EZT4UMabbgR1eKzwCGUonWupFdLj3QV6gPA>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Oct 2026 08:27:24 -0400 (EDT)
Date: Thu, 29 Oct 2026 12:27:23 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/2] mm/cma: accept memory of CMA areas reserved with
 memblock_reserve()
Message-ID: <auM6lKGAeUI26jCj@thinkstation>
References: <20261029-cma-multi-v1-0-2cbced8b5cb7@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-cma-multi-v1-0-2cbced8b5cb7@kernel.org>

On Thu, Oct 29, 2026 at 12:18:36PM +0200, Mike Rapoport (Microsoft) wrote:
> Pages of allocated CMA areas are released to the buddy allocator with
> __free_pages(), which does not check for unaccepted memory.
> 
> This usually works because memblock accepts the memory it allocates.
> 
> However, multi-range CMA areas, used by hugetlb_cma, and fixed CMA areas
> requested with cma=<size>@<base> are reserved with memblock_reserve() and
> their memory is never accepted.

It feels like memblock_reserve() abuse, no?

crashkernel=size@base already uses memblock_phys_alloc_range() for this.
Should the fixed and multi-range CMA paths go through the allocation API
as well.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
