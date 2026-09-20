Received: from outbound.pv.icloud.com (pv-2002l-snip4-6.eps.apple.com [57.103.64.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C0C2D738F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789915657; cv=none; b=QKGrWtYGlkF7T5PZt8U6SpL9j2fbtcS+44uciGsmN6hZ4Gv0iIx3TJ6uyFmHL898TRL5u/Iv5IygPZTaZSyMgf4NcBVymebYVB8YpL0K3gTUiA2VvI0vbjNnSXw2NxarwghOBaW48nXR2jviIdhRv1AM/bWMdLmL3coWf9i//Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789915657; c=relaxed/simple;
	bh=/JkcBH1+wbKRy3ZGp5VZFSV/QYJaJAk8NyGPR8Dw5cE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ecZnHl5cCnNdijSs6lQ4p0+A6+wYx9XMMIY9cYeCG7CrAdo9BR7A7beONg9cfK9CT97kqkT2t8+oMIBPT4eVNl44K7UxmK/+trm1TTNLVpM42b/mqEPFZ2f0g3fTShNmHr53IqJ/gv3WWI3pxUVgXFpo1BJsro5wgCdtp6K/X8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=v9Bb3LD+; arc=none smtp.client-ip=57.103.64.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="v9Bb3LD+"
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-3 (Postfix) with ESMTPS id 217051800236;
	Sun, 20 Sep 2026 14:47:30 +0000 (UTC)
X-ICL-RepId: 01a0bf49-5bd6-7fb5-8a26-8f6f2eca0ab1
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhKB0MGWQReCEsEQwFbEhVdRUkERxtXAlQXXQZSEnIZWhRcGFNFUR9UWFUJCgJRHFYNV0NUBF9QSxsOXwZLWhVVFw4CQh9QH0wWV0NHHRwZWhRcGFNFUR9UWEMZRVZpQQtPHV0ZWxxCZFhXCQoCURxWDVdDVARfUFQRV1ALWQJCD0gKXwdaBkQOSQRDA1gEQgtVAkBNAkIAXApeAlkAVwl5EVABWB5WXloXXlMXH0sAXEVaDlsERxQ=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1789915655; x=1792507655; bh=XGBEthCp7AYhQq4Iu5r57dtDW5NjXYdTS74nYmFJLPA=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=v9Bb3LD+TnJGFv6ItNxWWNGNYfF0Uwjvf03l5yT2gvmsf/8RgFwWzm4pxqpQAH5okawiLLhL7YUPd5QNA6RnluMUlEikmKegGjpbNkEMCEafuuT8MVsCEMAG+l+otps6j5DlGiWRIQSf8h9VUYb6qAUtNEH46mMIXb5tboEcdS8UHH3BCYScCgdderfXQzCrQMncpvTJxGDIX4OH7lwLPa6fL5Xr4ntOzbCqiQkCz69Da8p2xup0HWzg/GmeJyUXsJs5CHKb1R9Je+js8mS0wSgxJZ9TCr9C1v83wfVSbz08vVIzkbwYa2Gc+Sw+bTJJ+FYhp18zw3yUBocndO+Vyg==
Received: from BRUZZHANG-MC1.tencent.com (unknown [17.156.192.29])
	by p00-icloudmta-asmtp-us-west-1a-100-percent-3 (Postfix) with ESMTPSA id D7B9B1800302;
	Sun, 20 Sep 2026 14:47:23 +0000 (UTC)
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
Subject: Re: [PATCH v5 5/5] mm/vmscan: flush TLB for every 31 folios evictions
Date: Sun, 20 Sep 2026 22:47:14 +0800
Message-ID: <20260920144717.43622-1-zippermonkey@icloud.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To:  <CAGsJ_4wrQRGjqavMzWgi2+PrRr1ztf4QRZEb6HKm02OF8nEBUQ@mail.gmail.com>
References: <20260720-batch-tlb-flush-v5-0-db943a0d0d6b@icloud.com> <20260720-batch-tlb-flush-v5-5-db943a0d0d6b@icloud.com> <CAGsJ_4wrQRGjqavMzWgi2+PrRr1ztf4QRZEb6HKm02OF8nEBUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=K8sv3iWI c=1 sm=1 tr=0 ts=6aaff205
 cx=c_apl:c_pps:t_out a=aW9mcIavGNWWFvFFKOxBSA==:117
 a=aW9mcIavGNWWFvFFKOxBSA==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=x7bEGLp0ZPQA:10 a=YE32fvk_ji8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=v3ZZPjhaAAAA:8 a=GvQkQWPkAAAA:8 a=d8zy1PgHqa5D0lzE5hsA:9
 a=QEXdDO2ut3YA:10 a=J82S1U87d15UFHHUFZS8:22 a=kKg27zqgtulLWh45kPDF:22
X-Proofpoint-ORIG-GUID: Q81NMmtKSXNwrhk0b8AE8ion5_v4U2r6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxNiBTYWx0ZWRfX2fcTERIUmG39
 YlN2dYg1xwmj++IlqZJHGhKoPQ12t/GjbEfvi1nVncEi/vYIzqzRWfZZfbTLF5xact+1dOmfkEL
 IOhZf0s+AojSM07FIWK0FNAYlbaWxbnDX66OuE7S3iNgvulYpcA/BWBHWe2u6ctwf2DHhM87fWj
 jsJ15hGJI8whC9NDVAW6PoP3V+eC+WQ1GqftjPl2VLGSq2Cd0oOqIDpjujXjG0lXBLduy/yIssW
 pfOMTmg1HjFx72K+VB3yQfNwh0gW0MzuD7ISH5TKvTHjGxT1aKjmysKBMfOhcJ5wujNvj8KmMUJ
 YeNY+Xrnl92OA3kbcUrsOkT8iWzx6zg/eviu1PjzDum+Ar6w55QxxP1gBAaxe8=
X-Proofpoint-GUID: Q81NMmtKSXNwrhk0b8AE8ion5_v4U2r6
X-JNJ: AAAAAAABflP+VvU0bVkD6NYGBv6aQPZJ2lo78qa0Hiru5ViahMp1D9TpJ8WI+LFKxCvReFex3EcTZ4Vs/qLxUZIR63RQT1/6QAmEsqpmfzWah2/aEswL1C+PRIdipzigqgI+tGD++XvvdU6+UUH5cBwRxbb9ahwAdN3ItGxKuN6dMv/EtSVTnTgB+oj8+AE5VnT/RN8YOnu/SopL/11V4UsP33OukS5JI5YWlan9y/6kbfqrw9Sa0zvW2IknH9tEVEcKDIchV/QYdpCcmHrMLSggUJ91ySco3w97mv0F+Y/TOy4CFAGydj+O2A8VDs7maABqZtIc+Y/0qibsAtvMhD1UafQRT07K1mt6ybTYvhPYVm9tf1OJ/BX/sboGaniT9tICYxTkZnBderLZa/juiZjT7tq7neanRVLD4XE4Q8Km3YvrYRs8bqLP96PCPT57XHF6Mh4A2Un8Fr1XvXi3CaUxVyMAp1KoOoCHndSxQNVhLZ2Z4VNlW9pUthxhEwHTOK2pUfdjdt+FPeUEGHjATxea72PJelR3dHgZczf6kyGal1gn3XTrjWRvvwzL8J704bpo1YFrbbblSItTgAIIVPn2xht8nRnbD3nvi5ccZqoeslendlAUw/a5///CC5gmSpyIdb3cV2DQo/6ls+8hcB79NrusahmCbjyCpuTUzKNGH2g1YAD02J8p6pf8PEmPWBrdCvSppwXFopKyWplPudvC1spyGp8cy4xwm7jqYD2oiU5EjBqzxtNF50jHurIc9Yz0rNf7CTK/8HhOsQ1eIjp4h23RlGStuH2ZYH2Mi2crhFl8N3MYhmL0OmT8B1tAwTfZKcYzg7jlCSQFpn+BJRYGx2i200JMGBbp/8xxxt1yhPuXczwzOSFNS9WdZNJozXm4O1G41lKkTb2qn9FO9C2O7QNPK5+WAJx4eM1T78FPyyFgzjsS+jze04B2CBZtJm/3HSE8pEXJf1hA5J2lUWRWYW9U7Sp
 EsQ83PKI2v2HGMdxFMnpzZdy3eFsEV+3DB7XazYZeLjq34SxmcsYf7gOaJUW/IdfjcSB4Pj0wxsFrAtzNxHHte8RGKGwzAoqC+VrSfFZlAgcxEKxluTa+bcBMMLqUjnPP4cNNbTtI+vKhvJvL9IhMfb6fb1d6ex1JkwTAxmuCbBXx0Is/GStOinfAKT4lUlAPiB5dw78JI+/7taexmKgyqIk0A39971JBGboSC0QD5BEzXkmIlB9h7O2WUmHDpB45Z4KvhGXC5Ipz0w8vh8T1x+NOmgtcyaMFK3Z5DdgZq/i7Fw5tcwme+gp4kBC/kxRgt81jHgfUO8Z88KpBAqpzwz+SKuUHJSuK5rKjhg9rXupo/18CAuE+Dr1okxVBRtDkcg5VnWyV07phuW89hc9Bx9ioGHaX+yGbFOPXJYbyHEdy86Qk8lSk2KeNKnIl7IEiBdFNKTevVVgQy/+IhwcMUbhJfSozv+LI46s/kYkRpb2kx8UHgjfr0+U=

[Resending this one on its own - my first attempt accidentally sent
all four replies concatenated into a single mail, see
https://lore.kernel.org/all/20260920143816.39827-1-zippermonkey@icloud.com/
Sorry for the noise.]

On Fri, Aug 14, 2026 at 5:58 AM Barry Song <baohua@kernel.org> wrote:
>
> Yes, I think batching the dirty flush is a great idea. I can clearly
> see that IPIs for dirty flushes (smp_call) on x86 take up a
> significant part of the flame graph when building the kernel in a
> memcg, so I think this is something we should pursue. Could we
> revisit this patch after we clean up the previous ones?

Sounds good, and thanks for confirming the workload - useful to know
the dirty-flush IPIs show up that clearly in a memcg kernel build.

I've split the series accordingly. The four cleanup patches, with the
explicit-outcome rework you asked for in 2/5 and 3/5, are posted on
their own as:

  [PATCH 0/4] mm/vmscan: refactor shrink_folio_list()
  https://lore.kernel.org/all/20260920-vmscan-refactor-v1-0-ec04d71cb761@tencent.com/

No functional change intended there. I'll repost the TLB batching on
top once that has settled.

Thanks
Zhang Peng
