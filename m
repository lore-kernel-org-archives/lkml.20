Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790428;
	b=FhVJQ1ZtdAii/5wYDDM8240nMjONtCuhwBSy/h22REBu+PhD9jXeZ300Rj0JkHf12syH
	 ynnlezOz3ndRkQVw38/mg/8uZF/rNRfPFiHAqyPpvib60JaXDOIVp8xNc4OgPykueeEa4
	 SkSdFJ5GTJLDK4xUGWiuCOCQTdyEdnH5stuIioJL310GEMwXoAmPp9cGYL6baR0BBOig1
	 MMc4k1CSKcA8Wck9Nvir98DZb2DaTiZPvXfPzQuX/oBQGCCL6iZI0JexGMglyhaIWNdfA
	 G4zPK9AEiPr26OIDoN+08y39OsbZy+1Gjg/UTxxRFWGyDr/EGOpajhdtfjZINDMeMTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790428;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=4d6wA3vxHnyiaccvvRFg3MmHydefrlcpFn4MY6KT/xk=;
	b=a36BbQeW+LBfhIOvari/MzOGcBSbS3RNSxSLFlh1LGO/Od5CBS1beIlwBgMSXN/3UKp0
	 nb+s/kSpLi0ZbQnjtfUXD/ew160Fk0FO+cSp5s30ays+RXi13ZAcIeqV6+ayTwnbH2/si
	 MuedLJyDBrX+um2jOdtAdCkq29sO3ci8ns2iavru2pBx3Bg9OEscHgqr/1dkvo+Lsq3KC
	 rh5NRKNjCRlhcd6RfdN9Gdz6H53okgWqk4kzNpgDimYWyQTyW7bf2nc2q063lhiFmkWPl
	 IPIGN1Vtql0clq6mTOPRGS+WmVaLfsIAiU09q3XLI/LzBCBwDrTPgyovXgjvPGWH/Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ASgKkr5c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5269A606A338
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ASgKkr5c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5771F000C1;
	Wed,  4 Nov 2026 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793790428;
	bh=4d6wA3vxHnyiaccvvRFg3MmHydefrlcpFn4MY6KT/xk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ASgKkr5c8Jwki2bMhb0nB2JvgvmPhtdOfN9BJmvuUhPe42D0TyWNERtR/objACkFN
	 ro/rRW242zVNXpW0JVlBrjTNAeaeg9x6dvmSjhWuwROLvKEBWvQafeA9NXjrgOhNvu
	 l76TbHCLv/JbElvbSlQBjsVQghaRM2pUWAmdeWfZjsZzkCpuFkjTJAspPW8JTcZYk/
	 rq6Ubrt/RyezyV+tTAzdJcmRiYXRPP2dU4W5lx2pUmew/iyltwIAsjSN0SzUrmGgvr
	 hRKbEGwTHLHwneEwKakp7cOxCK9FV021KGwvbtrH+4x/YkncsK5Cm7aqlewcn/1nFZ
	 yPAts5ELjsSuA==
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
Subject: Re: [PATCH v3 04/12] mm: hugetlb_vmemmap: generalize vmemmap page
 allocation
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
 James Houghton <jthoughton@google.com>, 
 David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104023510.260766-5-songmuchun@bytedance.com>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-5-songmuchun@bytedance.com>
Date: Wed, 04 Nov 2026 13:06:58 +0200
Message-Id: <179379041864.1868318.5211459990803925675.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Wed, 04 Nov 2026 10:35:02 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> Vmemmap page allocation is currently tied to restoring a virtual range
> and assumes an empty destination list.  These constraints prevent it from
> being reused when pages are requested independently of a vmemmap range or
> appended to an existing list.
> 
> Generalize the allocator and give it an all-or-nothing list contract so
> the restore and optimization paths can share the same allocation policy.
> This also allows HVO head-page allocation to fail gracefully under memory
> pressure without triggering the OOM killer.
> 
> [...]

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

