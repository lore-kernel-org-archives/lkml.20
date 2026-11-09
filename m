Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794208124;
	b=frlO2D7WwPby9Az23lIAUM6SR7xOD/4NAvGxY1QyztClpxPOrZLJj6UEGEim4wwqFwnM
	 YE+zAiXedSnIO/WMfEoFmLK6L7u9us+Z8QeCmL+x5gbwTqofAEidPIhIP9mnUF44OOAld
	 XVZpS3K3NpCYoKZbtboDq25mALYIaebrvC6I3ufCICRj2PF1tMHin+IJsMr+UbnjHEzjv
	 Palwlj86ePyXKQ8WXf3GnYLXRwZPDBxUpQyCpQvdXTAuCsSUihnRpwWk0b18q7pvDPrga
	 vYE+TME1tT1OGAXsfLWN8plsTRbuwGcmwl6mB2cGHFnH2eZbG/8JqesEyc86IUva9jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794208124;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=R60RtisWcqPaJsP3z5umkKLOFCDRWj8EeZj2DKpMtAQ=;
	b=MAN4VQETBcm7SZtIJaj6JsUe0dSEPgSZ+gaOvW1nEtuoOnzVwFoXpJ00xvSDAyKNaNNS
	 u5YVVY1NvSki5mGbnLoqJmjLA2YI5t6mV4PrVDAUT2esBoq09QhPpLByl134a3hBspklP
	 tYnYcvLjMU91uAU7oeX5e1ypQAOu8BUIWvpL3BDI0WjX/gdtc8bopOD8p9S4t4DVTed+S
	 isL+MkSjxTvzAkLRl0YI8ptKAyeEbrs00SwXNNsOrW1SkcNCClUj/MtchdjF/JH3AMkiL
	 8meogF4xAA6WUu2ojcU/G4IqX9T+87vc9ndrTYfaXph4nh5u5yonxEsfPp/ywHk9dcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b="qMT/iSQy";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0585606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 07:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=qMT/iSQy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E782B1F0089F;
	Mon,  9 Nov 2026 07:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794208123;
	bh=R60RtisWcqPaJsP3z5umkKLOFCDRWj8EeZj2DKpMtAQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=qMT/iSQysf11EbkSRNfEw5+UOG45cxeA4/obABZTaIw5jUZNkssXGGYgeRSJMbaYy
	 4E8KZZmnu6+b5WKd/WEV/xp+PLbFam/lUK9OTHuHSBpa5qP5AL4fflcKZd+3cWe9S8
	 lJqz1moFNyVTZFHsRQlHIuxUMxLy/q96EhQPpliE=
Date: Sun, 8 Nov 2026 23:08:42 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, urezki@gmail.com,
 linux-mm@kvack.org, baohua@kernel.org, dev.jain@arm.com,
 ryan.roberts@arm.com, anshuman.khandual@arm.com, david@kernel.org,
 rppt@kernel.org, leo.yan@arm.com, xueyuan.chen21@gmail.com,
 chleroy@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, ajd@linux.ibm.com, jiangwen6@xiaomi.com,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 00/10] mm/vmalloc: Speed up ioremap, vmalloc and
 vmap with contiguous memory
Message-Id: <20261108230842.3a77b9fe2d4bfc2a04b355a5@linux-foundation.org>
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  7 Nov 2026 21:49:43 +0800 Wen Jiang <jiangwenxiaomi@gmail.com> wrote:

> This patchset accelerates ioremap, vmalloc, and vmap when the memory is
> physically fully or partially contiguous.

Thanks.  This looks pretty mature and reviewed.  I'll add it to the
pipeline for linux-next testing.

Sashiko likes it.  I'm working on a different AI review setup which
finds different things.  Very slowly.  I'll let you know if anything
interesting pops out.

Do we have sufficient ARM review?

