Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614724;
	b=1b19eqTYaypIpoXAOtw2+L0EZkGeI1vPYdRkwh6/Nnv+eEqmgWgP/dBIUXhK9UVDlgsS
	 gtD5fw7AopSwi2hh/TaodHWhUs43pgON9z1DT6k3Eyxz/OAkOzgl3NOEKZLczMu5EewMA
	 zTURV5tM7Is6TxL0bBhkl6sLqNPjjh38nkHT3ryGF8ecOOTsz1ptiiVH8IzCwRHTUGWTN
	 AET+KgYW/Cka+8it+DyFT2ION0ukXgKFU3dnv25V1gKQVRQse2sU435RAiv/UzKxsSyAU
	 NHoc4uE/GzQi/nx8P0CN9pLFMLUkcWDNXhedQPjsFqeaJmfyM+vwt4WwGm5sqJqX97A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614724;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=ku4DJIFwnEffgpIG2A7qNoS3x38uJEQQ9sfHn3db+wA=;
	b=RrC3tPtGLtV+pSvsDljsCXLFlrchyL8W0k6J0d5XTPHSXIdM5UcceUhomnAqTFXFzsM8
	 Sgrn9yRsyaKObJS3OmoiHLZfkFv/Pi9oa1h52J0qcoTEB7tRV8V79TUw1E+C03rqjfAJW
	 dtNUGc0fDdO+xU26E5NE9ADhZdDun3/WachNGGIXeUnfnjIg5x90CbqDIBFAvrKNXFlFg
	 jJVaIXl5Ug9HYmBAYCDDCo/Z3U/0Z4GlTByr9CQOhlVRLEvnfSsXKVCE1a/5pZn6h1Ttu
	 lPerEiXk38CvasEcqTRVuUvej9BxTDuXtyhQbpYL6TXqf+tYtc/VgQZF/Wddsi5L1xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f5y8yjQQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FEF606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f5y8yjQQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8521F00A18;
	Mon,  2 Nov 2026 10:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614724;
	bh=ku4DJIFwnEffgpIG2A7qNoS3x38uJEQQ9sfHn3db+wA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=f5y8yjQQMwerAigcvpPDGNsDB3u1CJrfFpFBH2oKsWhJLCzrK6Yz0yoypJqXxpcEi
	 A2G1fUcOg1Rx9+v5IIaKoxNojTV07wC3i5zadzm4mKoPCGOUyddsDM5QkQouNFtMEF
	 esARtz/cC4x/0jw6TJzqro0ut+e3WfhMwgCnQlx861gZ0VzJJeI0ThV/5at2E4p1r+
	 Pnh3QQiAq1j8VYEFDoaGEPfXneX1AEVZrLldIsaXqBYFZTfWaAdbwuzoUsVkX7OIDq
	 GTJXeLrxt427G/Dmb4AXUhHH3TBl39ncxNfQtW15E9Mr637tK0erxlaBRoVidCVRCC
	 zIL8uCvOQpF/w==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 03/12] mm: hugetlb_vmemmap: simplify vmemmap head
 page handling
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
 James Houghton <jthoughton@google.com>, 
 David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102032525.3597743-4-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-4-songmuchun@bytedance.com>
Date: Mon, 02 Nov 2026 12:18:31 +0200
Message-Id: <179361471104.1337633.5678514723773021374.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Mon, 02 Nov 2026 11:25:16 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> The new head page is already tracked on the vmemmap page list before
> remapping starts.  Passing it separately gives the remap walker two
> ways to refer to the same page and unnecessarily complicates its
> interface.
> 
> Use the page list as the single handoff mechanism for the head page,
> removing the redundant state from the walker.
> 
> [...]

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

