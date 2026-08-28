Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EA638DC54
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939896; cv=none; b=Hs8eG8LSuhqqGr0oQvFJa6wx+OwlMBiZ5XwvED2UWZpBE1ZbCRW3KnvV+Tctz0+8EzOIrnuQFHKIPThiURxy4fov8nxpv2OskqLCbEpfrBbp6g7scg+eWHFwESs8crTnDbW7pQTeftH4+dNkBp8897uLexzOB0P6Hu6t3XE/52I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939896; c=relaxed/simple;
	bh=zzizNchr6WnEaWsbe0WIg1KOHaAgm5LlG9gDnfa/fI4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MeegX//oDthJDYFtJIB66zm5CA96aXR+N/VC+jUSXRLsaKijyIhAAV4C4k3nlrM1G0cDGa3vRo6CjzZPnOymkNv15O5E0fURmAMaw/6Fv4hXCVF9WtPWHkuiIR7/JtzlZj3vkOcWKKDUOTjZ+0rGWTKoaFf/F8rRbSCAEB8ZiSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=Hfv9UXjP; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="Hfv9UXjP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1787939888;
	bh=zzizNchr6WnEaWsbe0WIg1KOHaAgm5LlG9gDnfa/fI4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Hfv9UXjPmOUtgcQtvb1YSLWhrJEmRWTUDHoGn35sr22HLK99gkqUmrIQgnXIe74tf
	 c0ms1s+RL2mYKdzhKgzGn3fjvGc9NHIm3aGHQszNLp1xf8fTY9ZP3JGn6hiPTu9ui/
	 nNhN5IWcKtnHfyP3r9d88f8jc0Wnr1VqtKqIcHyA=
Received: by gentwo.org (Postfix, from userid 1003)
	id 4BCC14046D; Fri, 28 Aug 2026 10:58:08 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 4927B402A5;
	Fri, 28 Aug 2026 10:58:08 -0700 (PDT)
Date: Fri, 28 Aug 2026 10:58:08 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: artem.kuzin@huawei.com
cc: catalin.marinas@arm.com, akpm@linux-foundation.org, david@kernel.org, 
    ljs@kernel.org, vbabka@kernel.org, linux@armlinux.org.uk, will@kernel.org, 
    mark.rutland@arm.com, liam@infradead.org, rppt@kernel.org, 
    surenb@google.com, mhocko@suse.com, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    wangkefeng.wang@huawei.com, panov.nikita@huawei.com, 
    yang.shi@os.amperecomputing.com
Subject: Re: [RFC PATCH 00/18] mm: arm64: Add kernel replication feature
In-Reply-To: <20260827161158.3618409-1-panov.nikita@huawei.com>
Message-ID: <f47c0ab3-6d78-fcdc-b7c0-cd3a7b5c8276@gentwo.org>
References: <20260827161158.3618409-1-panov.nikita@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Aug 2026, Nikita Panov wrote:

> There were several prior submissions with some sort of replication
> for NUMA systems, including one from our side for the x86_64 platform.
> In the last couple years, several research articles related to solving
> locality issues on NUMA machines through replication emerged as well.

Thank you for this work. This aligns with our efforts to increase data
locality and the performance of local data access. Yang Shi has a patchset
that introduces similar code to be able to map partial virtual ranges
differently. His code may be more mature and I think these mechanisms can
be used in a straightforward way in future iterations of your patchset.

If we combine our efforts then I think we could be rapidly come to a clean
implementation that can be merged.

This is an obvious signficant performance improvement that can be readily
seen and that is why we have the variety of patchsets being proposed over
the years. As ARM64 matures and is run on machines with larger core counts
the urge to have this increases.


Please see Yang Shi's patches. We can provide resources to push this
functionality forward and have seen significant performance improvements
with earlier approaches like this. There is significant customer demand as
well.

https://lore.kernel.org/all/0344c559-1959-4531-9265-d5a5180eb7cd@arm.com/


