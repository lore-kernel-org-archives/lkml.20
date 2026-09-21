Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A476B4A7CA6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002026; cv=none; b=BCkmU1HAGpkLzh1ZR1mhldAyHUnMp7kEcAd2Ki0r9P6HxKQYBo95y5qOxIuiE16wAXOQi+qhbS0xv7mUxbzuUDm45lel1Q1QLMsLUJGcobx2lKmDComzFh082Zq2ljFgpTfTG7QnJ+RmKeVPhHfo2AyVgSFVljkOLDPJnXzlnZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002026; c=relaxed/simple;
	bh=sfeh+fAXcNUx55aVgVAOuz3WGcvOq0K0LucQodbP2jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jB+l12Q2E/OIEeKdqRLOv0jW78UT+66FamkKB3CFDDmr4d7kv/uRIeyfbNV9AtJ803CzdUzdJdAGfDiYYA7svaewMAbXzwDQecz73stGt32c1YYri9wdAPbg7tTn3xh0De/7UL2NTwagICHFHQK4VJ1j/pvSJIBbqoklfCiONis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZvbjTYh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZvbjTYh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2091F00893;
	Mon, 21 Sep 2026 14:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790002023;
	bh=kmEsUEvY9vo2zaj1qCqnPiixs7yLoUz5iuxdnJ22dzs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XZvbjTYhHMYYLm5eZryPH0+GXR5XNmEMgeQMCPy79tnA6n+P5f4CcDTyQnt4dJkto
	 r+7dWlUrTZUruCEFkrdYRqfgrryNweCGyoS3uEbYCGDDYF12dPpKVfhxiyX0IKkc32
	 6sCF1bMHAl3m5tjQsau8dPeZdeT68CkcU+/ulfYl7AuORlXF5fmBX+WJH7wTSYtNKO
	 FeYi5cxWeXWmzKF/Lmmr8NGPq15bxbtIY/8dmxDI8/s+tuMQ2VJ0MVB3S7slT258mA
	 7wteppWFHsnd2xoU9oBuTlOirIaGCLhQ3kXhHOPIcAiQyCd0UaP1JsRJ9WwQhVdQiK
	 HyLMzG10qlNyw==
Message-ID: <198df371-4599-4e71-814c-b94bddd41254@kernel.org>
Date: Mon, 21 Sep 2026 16:46:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] arm64/mm: Convert pgtable READ_ONCE() as pxdp_get()
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260903060657.2717457-1-anshuman.khandual@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260903060657.2717457-1-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/3/26 08:06, Anshuman Khandual wrote:
> Route READ_ONCE() accesses on pgtable entries via level specific generic MM
> pxdp_get() helpers which platforms could then override when required. These
> accessors on arm64, will help in ensuring page table accesses are performed
> in an atomic manner while reading 128 bit page table entries later. But for
> now they just default to READ_ONCE(), thus preserving existing behaviour on
> current D64 translation.
> 
> This is similar to generic MM, where all atomic accesses have already been
> converted from READ_ONCE() into pgtable level specific accessors.
> 
> These are preparatory patches for D128 enablement, although standing their
> own for D64 translation as well. These patches are split from earlier D128
> V1 series. There are no functional changes here, and besides mm kselftests
> do not show any regression.
> 
> https://lore.kernel.org/linux-mm/20260729122452.3797443-1-anshuman.khandual@arm.com/
> 
> This series applies on v3.7-rc1 but after applying the following patches
> related to pgtable entry print standardization posted earlier.
> 
> https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/
> 
> https://lore.kernel.org/linux-mm/20260901065454.1906343-1-anshuman.khandual@arm.com/
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Linu Cherian <linu.cherian@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org
> 
> Anshuman Khandual (4):
>   arm64/mm: Convert READ_ONCE() as pmdp_get() while accessing PMD
>   arm64/mm: Convert READ_ONCE() as pudp_get() while accessing PUD
>   arm64/mm: Convert READ_ONCE() as p4dp_get() while accessing P4D
>   arm64/mm: Convert READ_ONCE() as pgdp_get() while accessing PGD
> 
>  arch/arm64/include/asm/pgtable.h |  6 ++--
>  arch/arm64/mm/fault.c            |  8 ++---
>  arch/arm64/mm/fixmap.c           |  6 ++--
>  arch/arm64/mm/hugetlbpage.c      | 10 +++---
>  arch/arm64/mm/kasan_init.c       | 18 +++++-----
>  arch/arm64/mm/mmu.c              | 60 ++++++++++++++++----------------
>  arch/arm64/mm/pageattr.c         |  8 ++---
>  arch/arm64/mm/trans_pgd.c        | 14 ++++----
>  8 files changed, 66 insertions(+), 64 deletions(-)
Skimmed the changes, purely mechanical changes, so looks good.

Consider spelling out in the patches "No functional change intended."

-- 
Cheers,

David
