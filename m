Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014123E6DF5;
	Mon, 14 Sep 2026 07:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372112; cv=none; b=oX42PUNnxaDlwWcmfGAUU7KH6zH+qVstjKFvdLb11P/YNPkTtwfoIVaJuSV587JNc9Ti31QYnqJfsfvdFC0JAnttUPqFuycZ9ImkN/NmiqolDFrK4u+qscwS24MgmAwcczpy9kVLdUxkWr5v6zrUANuhOBon/6cZu/f3SL7Jt2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372112; c=relaxed/simple;
	bh=zF4EYt/XlL1lzmM4JaV80Ba4IrqNPNrKdcvoxUVoiNk=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=CRPJdcbheAkPjjZt29ecWKvzn4dmVualw+aqRcInJQ8V2v7mKF8y1VPVAXPoD+WX0WvjPrJOulDarzhFUWALrRitoSTPVJPwT+kmBSBIVbcwtEnkQoocbgsmPzXF0z+UL9Wa7va0IAAmrxpiHr2S/ZRYjk1u5jL8CsEaI+5wDS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OPB4CoCS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OPB4CoCS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEDDD1F00893;
	Mon, 14 Sep 2026 07:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789372110;
	bh=RESuNQUKZgqmJNMbknpLT8POXLSUN+8DRhun9jrOVhk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=OPB4CoCSQXQMwjc4/kQbLp9oJw/ADZnF4xQX7WylqQDRXdOGfX6dzStIDgj3Sozsx
	 rwh3/JTdFukyIkZ/GTiHky3kVpGnxI3RsscJy9NPdEh5DqHzBn6BdodBmDWeVmfgv8
	 rnU8kAg1ifc7mk/ljWmNOoBt3mEn2qCV97Ww4fCOOqWWytl2DM4x02daXvgHof7TPZ
	 ZNU5WpkiVc8BliAonk+xAyWj9otZ3Hd8aP/wxVOEEqc9SOWf/1xC7Oy7TxyOb2do8Q
	 6XPx+f55fVSXQoS8wDI6jEbXM2ia1SwN41WnZ5oc2eA6/469ulUmlsPAsIgzmxOqFb
	 0oV+hP5RxrSQw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 03/11] mm/sparse-vmemmap: open-code
 init_compound_tail()
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Jonathan Corbet <corbet@lwn.net>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, 
 Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260911050228.58884-4-songmuchun@bytedance.com>
References: <20260911050228.58884-1-songmuchun@bytedance.com>
 <20260911050228.58884-4-songmuchun@bytedance.com>
Date: Mon, 14 Sep 2026 10:48:14 +0300
Message-Id: <178937209456.4188640.17384001721839433827.b4-review@b4>
X-Mailer: b4 0.17-dev

On Fri, 11 Sep 2026 13:02:20 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> init_compound_tail() is only used by vmemmap_shared_tail_page(), where
> the shared tail page setup intentionally passes NULL as the compound head.
> 
> Keeping this helper in mm/internal.h exposes that special case to the rest
> of the MM code and can make the NULL head argument look generally valid.
> Open-code the initialization at the only call site so the special-case use
> stays local to sparse vmemmap optimization.
> 
> [...]

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

