Received: from mta1.migadu.com (out-94.mta1.migadu.com [95.215.58.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC6444CF22
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787840188; cv=none; b=YkxIxMmA5RO0b6AsKf4DsUa6yXmtNyB0e8FJxcuRtF3cM7KX8+pAE6yTXQq0tWaLZd2iKryFgaRbfuOEyfIVdKaU3MKeMvI42RtFEideIFsxbr3FMKyQBPxjmN9/89uzbxcaAmK4Y5KHGO/yr8X1AFSvPV3ST1o0FkF99zD1KxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787840188; c=relaxed/simple;
	bh=TeY0K3rD+OSLUPSkBl4m0A05+bMcDxn+Od6P8j6lCUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F4puM4b2b5Ckbw3hUJdk5SoJ9US3VSxJi9YRuXOeYMhtjqEU8L6iY86p4nCPppR9eJ0gEKRkC6MvBkLjuFxgK0NdRbxm8ZVOOYWfUmRFs2EP3sXIfkMKz30uN5JqGcrDIXjXTIgK2B3NeceYWWRpbbt4MnEgcTHhWcRpTHsnFEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bs/hN+4e; arc=none smtp.client-ip=95.215.58.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bs/hN+4e"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=TeY0K3rD+OSLUPSkBl4m0A05+bMcDxn+Od6P8j6lCUI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787840183; v=1; x=1788444983;
 b=bs/hN+4ecLChxc8+pCEohy4JkP1yasCeDfIM1wVPPaxxU9nirCKteMUPcADPBehlvt5aNMLT
 soOL2oXkLd2dxFSr+bjsE1IheeXjRFw21tFXXGU+gmTs2y6XBujP4fH8RUWZNLwifejiAFG2+n3
 cK3jm4dDlrVZClt6zH9bKG30=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 52c19e7ae802778d;
	Thu, 27 Aug 2026 14:16:23 +0000
X-Mizu-Trace-ID: 52c19e7ae802778d
X-Migadu-Flow: FLOW_OUT
Message-ID: <1eda0282-f4b8-4914-a4fb-733d775d563f@linux.dev>
Date: Thu, 27 Aug 2026 15:16:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add myself as a THP reviewer
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20260827103435.1371882-1-kas@kernel.org>
Content-Language: en-US
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260827103435.1371882-1-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 27/08/2026 11:34, Kiryl Shutsemau (Meta) wrote:
> I have been working on transparent hugepages since 2012, starting with
> the huge zero page and file-backed THP.  A lot of the code that causes
> pain now traces back to me.  It is only fair if I share the review load
> for THP.
> 
> Add myself to the reviewer list so get_maintainer.pl puts me on Cc: as
> well.  It is also my commitment to be more active in reviewing this
> code.
> 
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1be7da9b6e2e..f5bb29ba41c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17264,6 +17264,7 @@ R:	Dev Jain <dev.jain@arm.com>
>  R:	Barry Song <baohua@kernel.org>
>  R:	Lance Yang <lance.yang@linux.dev>
>  R:	Usama Arif <usama.arif@linux.dev>
> +R:	Kiryl Shutsemau <kas@kernel.org>
>  L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org


Acked-by: Usama Arif <usama.arif@linux.dev>

