Received: from outbound.st.icloud.com (st-2002j-snip4-8.eps.apple.com [57.103.78.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFA43B4E9B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.78.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915534; cv=none; b=uIHXQu2wkWTYgqM9wzpjIz/lZDczRT/j0oAi7mJaPT13MasKdxhHkLJAihXzfnLzojatXKwW0Q8RuWvBIiBVz0G4d4WTM6LVpQ4sKsbg4A1+CNiUFRllFngUAHIa588Oh+iBKXLKMq9E2FUK87rfv+i1WGgPaylvbOvb/nP2CRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915534; c=relaxed/simple;
	bh=AsvbBtxervJP818LmBihbnvH9bRpVuwH9X9ID1dIQWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Re7dujJ5cwneKNnGTdpRZmP4c4Am+/xw1EzvD0mi+R81Vxv0+SZtNRazu9AZw9w7denQsYQQKNxacXc16SgrGkpbp3/4G0Yx7s10ogulEP3+yfEfxmWpU8mmnk1u6RTEshKowRY4T8t961ISMLTdzAxbbszfM9j5YL5oaqi+IwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=nIPqigKL; arc=none smtp.client-ip=57.103.78.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="nIPqigKL"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-3 (Postfix) with ESMTPS id 344C918002BD;
	Sun, 20 Sep 2026 14:45:26 +0000 (UTC)
X-ICL-RepId: 01a0bf47-77a6-78de-8eca-d7697cdaaf52
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhKB0MGWQReCEsEQwFbEhVdRUkERxtXAlQXXQZSEnIZWhRcGFNFUR9UWFUJCgJRHFYNV0NUBF9QSxsOXwZLWhVVFw4CQh9QH0wWV0NEHxwZWhRcGFNFUR9UWEMZRVZpQQtPHV0ZWxxCZFhXCQoCURxWDVdDVARfUFQRV1ALWQJCD0gKXwdaBkQMSQJDA1kFQw1VAkBNAkIAXApeAlkAVwl5EVABWB5WXloXXlMXH0sAXEVaDlsERxQ=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789915532; x=1792507532; bh=RxHtGSc7sBrwC1443xmi5wE1JI2HFVWqMFdo7O6u9fY=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=nIPqigKLd8cdmGn8MUuIdcq6ENQk44lYiLYkxbsxBSfMskkMwd6/JYTE/gzvojxBAIolIIxysQOXHWJoDukOIDIe6dlltMD7YNIBoMkgZzDGtWy1uH9svoZtYcnkBKio4RVOR+4XCsrSBe6RS0jEGOby3x8MleepGu7EMCunBiugb3ZpPxiCwLePFPceFYADIuptxTloA4n0XN5FoZzJGvt44m/HxZIcSTGM3uvCVkCQe2hjmZ7jixgKoK7RtSMSVTopyPfe5GEQhGMWwFaPnIC+YGy9VZ8N2Dd1q0UqbHflecLrw+ugo8cisvaCUXaZ9wGLmbN54xWoIAzl7nq7+Q==
Received: from BRUZZHANG-MC1.tencent.com (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-3 (Postfix) with ESMTPSA id 2028B18002A6;
	Sun, 20 Sep 2026 14:45:18 +0000 (UTC)
From: Zhang Peng <zippermonkey@icloud.com>
To: Barry Song <baohua@kernel.org>
Cc: Zhang Peng <zippermonkey@icloud.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	"Liam R. Howlett" <liam@infradead.org>,
	Kairui Song <kasong@tencent.com>,
	Zhang Peng <bruzzhang@tencent.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/5] mm/vmscan: extract folio_free() from shrink_folio_list()
Date: Sun, 20 Sep 2026 22:45:10 +0800
Message-ID: <20260920144511.42734-1-zippermonkey@icloud.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To:  <CAGsJ_4ykbJKVqEv6uGNKZaQhtV1UxxV-MWt7D1jx6SpdMN+cqA@mail.gmail.com>
References: <20260720-batch-tlb-flush-v5-0-db943a0d0d6b@icloud.com> <20260720-batch-tlb-flush-v5-2-db943a0d0d6b@icloud.com> <CAGsJ_4ykbJKVqEv6uGNKZaQhtV1UxxV-MWt7D1jx6SpdMN+cqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxNSBTYWx0ZWRfXy7WlkPKHEr07
 5Dco4+tckHFjWNgNgzUcG8oMbGRdIVZh9LPBBuK+TmHWiaBtlvc1sQLiHt8TWu1uQKqzK/976ke
 mBstUBiuOhrZU8rCgTTAZQUGA+xEUvDwr0J/r4/vroRqcwE0R8KKCW1hLlYxsviqfoMPSw9HweU
 s2Df9xKYKPd2su0dH8nQJEhVvrYiEhvrYswrs9fzPlcNLFlhfdvauX3ajkD0T4fouz7vRflG9Aw
 XoWMi64z391CjFwOcDNODownEwME5p2JQESlJd2/77T3VAHKMbHErEl0rrgh+/KbsJnIAnVNBq/
 tkFd3z64Aks/PcFQqalesZQD8mZOJBH5gJLYGvK7vwnSqJStIl6W2Hk1uYDYek=
X-Proofpoint-ORIG-GUID: 0TaXmJjLpvPMCBYN83AUXrikMXBsu2OO
X-Proofpoint-GUID: 0TaXmJjLpvPMCBYN83AUXrikMXBsu2OO
X-Authority-Info-Out: v=2.4 cv=M5dA6iws c=1 sm=1 tr=0 ts=6aaff18a
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=YE32fvk_ji8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=v3ZZPjhaAAAA:8 a=B3MVPceRnCuek0yWCJMA:9 a=QEXdDO2ut3YA:10
 a=J82S1U87d15UFHHUFZS8:22 a=kKg27zqgtulLWh45kPDF:22
X-JNJ: AAAAAAABL0GJCfIt2pPvy3p3Gu6vzsVjH7inZhi/raMfFADJDQvEsKNN33JmyG9TtC4Gt85wnw1JYit9GXcdAhQ7xnIBgVNou5u+cWR4+B3fRTyW6X5VorGKnfklQbvsm+0CJ6DotMAq+LgWPTYWd3vUU7vnRRehhiDNHYGw/1VARjtmy/x8J0TicSY1ei4H+3Y3H6Tr5tlGLEwP0gh0sQZqBrd5OQc+la2SDBJVbMLOPYR3sSVzgX/vyOtNjRUzsqcpFdGNoDHeN6nhyLClX2Ib6Y/gfb4xppVOVGSjoi3feaI9fe23UnJF/4QmfL4gg0kc/HksYznLemupa4Xih+pQ3UI3dmY7YiRLII0j5rO8Ri35YUWJTRXOdcRgaiEUIpGRTvRfO/FQTPJDcn2RWz3pDUjAEKa3AcINE4YvbTACZUKg292m3UV1n6Jt9DosaBJ7ljfSKxLaVq7Mi5Pm6YwV31njEdvdl4BcrIbXRdDb/+mul5QBokZZfhP2ZZiQqgqXK6mzMB0ovS5ShQLaJrBAT5Cvb87nLyPBefW6J3dH3sziM8W2dWmLdf7PwG/yvK1z/fX9ksm7XfWk8uRwbAyUVtsfiGfZLpMCIOrZEOtOMX9zu0m4KiK6fmbM6LhHEg1BjmFmNVmy9IyHHQMoZrAszjU2izA7MlxsfDD7tkYMwzx/T9RwGrYpFzhHevJzqrsgDwIJ6KCe8JYlx+zPXNKl4Wrxn9KJKmXV6RagjYI4NkF53LUgPcQt0hb6bAfuCDjx4RgxrClbnJn6ugymJDwgKKHTNKeBaSFPpq02apLCq5IpNek/yo4NQIVncy/Fny7JruoB2ceq1BOwYTLoBU0/AtXeylEPEzvm+kRqRr6a7ECstUbVJAamp9QdDKPWn6nR+721tj8tAEY2CqEmEWCcFpWBylizxsoorcZe3Ib/gwNJ74DsPdiP1XZUX/oBy5bCHMMEV1eOw/f67ZVX+jXYMmmyYNK
 XZuTYTvTqnQoXssdIYoRuyuSVZ587aYzaJLQ5O8Jk1WizzsYppTID8n4lmrirwOREKjLxRUC7w0Tk5jlmoeA3zZuDBQ8eIdXWFNOxDa/E+5gX9TPOzTJfgIA66YmfvcQAaY8m3atZ5OPMBM4X0Pv1ufCS4bLSHw1EBnbnpr93RM0FzStDMCQZ6FtPuu0GQvh8R0KtEfJXIGD5utMojX8vOVSGZpUym0qCKWT6crPqYfEJGUtmTZw1wLh48eqV3r0uYLvYqNkTJ+n1O+TskeKaBdhl/J3LECn0JbREpAi7EIQffgoirLjyfpyplFRkWWKQiNopVxm9a4l2YmIC1eWUlt2vMrravy8WE2vFmvuuo9ZO1xLea73x8QAHZUEmR1HVatworoPXPKniTWxEftFBBxKV2dI08Ope+/UQ06pNq1JdZxwQ53OGJiwjyG8eINyZ1NkAbj27Ad9wUrHC+hy+Muvs7N0jLkrFL+oJ1aBuTNIz82QpIhtghA+1RWLMmqvEO9egrTBc0pICZQiiN1bCTkGxu+M+OOzUXTsc+egU

[Resending this one on its own - my first attempt accidentally sent
all four replies concatenated into a single mail, see
https://lore.kernel.org/all/20260920143816.39827-1-zippermonkey@icloud.com/
Sorry for the noise.]

On Fri, Aug 14, 2026 at 5:40 AM Barry Song <baohua@kernel.org> wrote:
>
> Could we avoid hiding the activate semantics inside
> folio_try_reclaim_free()? It makes the logic harder to read and
> can be confusing.
>
> Could we pull this out so that the three possible outcomes are
> explicit?
>
> 1. activate
> 2. keep
> 3. free
[...]
> I mean, this is confusing because an activated folio ends up in the
> "keep" path. Can we make the activation semantics explicit at the
> outer level?

Agreed, and thanks - the bool return was the root of it. The helper
now returns exactly the three outcomes you listed, and the caller,
not the helper, decides what to do with each:

	enum folio_reclaim_result {
		FOLIO_RECLAIM_KEEP,
		FOLIO_RECLAIM_ACTIVATE,
		FOLIO_RECLAIM_SUCCESS,
	};

	switch (folio_try_reclaim_free(folio, &free_folios, sc,
				       &nr_reclaimed)) {
	case FOLIO_RECLAIM_ACTIVATE:
		goto activate_locked;
	case FOLIO_RECLAIM_KEEP:
		goto keep_locked;
	case FOLIO_RECLAIM_SUCCESS:
		continue;
	}

So there is no longer a folio_activate_locked() call inside the
helper at all, and an activated folio no longer disappears into the
"keep" path.

The patch has been respun on that basis and posted in a cleanup-only
series, see my reply on 5/5.

Thanks
Zhang Peng
