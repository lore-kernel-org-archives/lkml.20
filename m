Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192761;
	b=HMWOqnl2GXkju5KhBsZ7Zs2rRO3AcVavIaLqf0AueqUlVK3Wdzk/lFdar6pUoz+x9N4Q
	 LWDCBzR4PdHSxwqBglfdRJMqawuy3B937q+dMglsm0piXViHAaNKwGsQLgbQQ9JKPw6EP
	 YP2rqPsGAFAqILZyC02K8FM0w/u9eI8P3y0MR23lHZ7Ud1KvwCK38NKrZmFcPPppRRSaI
	 uW0/Pb54HfoT72OLZslnfL6BoczgEss80SBadbJjt4HHk/TDlkbfuTfET0ZtLkPuXbh+W
	 LRZgk9tdh4FpJBM1tIFvxiQROFWvxVUxsrOCo+vfoOPpODF9rEDlmGIebPEfJY8KBpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192761;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=zQ37RfglzdINqejwc5JbxUwWcf6fyXiPnEVqkiyj9wE=;
	b=WG3620XhC4JcPRZZflwye2zT1Wj+1ahGYIreoMo01fDQD/DaKkcbSPXlTu5bLO6cW7sZ
	 BNdCtOCUrQ27wyNDzyHFJpx/BeNt+SfFA6Hy7Bc1Lb5sm90kfTUHrHbVqos9mCOfN26/N
	 jJiV4k2n4l+lP3fvuzAudGPbwn404aV2Wlwq7SSGxi/4g2JleZC3fP89tFsAiTeQcj8ph
	 bEKRL44xdfUjLPBLCNU7LmWZxee3of1yiM2TW3teQhONgjHR408otY+F5q72gyqJJjMjM
	 EEL2qqITnq6IxqC0YULo8gG8gw2FMpo9HEc5JafUTYPg2y8MrFoh0D6AhmlQ64ecrhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l+qjavsJ;
	arc=none smtp.remote-ip=91.218.175.193
Received: from mta0.migadu.com (out-193.mta0.migadu.com [91.218.175.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D331606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D331606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l+qjavsJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8ZJqLauaB75tCQkdQ/iL1btTWlyXZvR89RMo3Rbmqm0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793192757; v=1; x=1793797557;
 b=l+qjavsJub2Qwlt0kiwwZUKHqTD07Hrdeuj+5NMf5+2n5KY9kWiqdYvKqjB1Y8y/Qf4wAPYS
 jKTevQ5+bxWUgn5piUbQllcX7GvwLshacXL4NgQuibsfSwaaceXRoyKQ+9gtP3IvW1gDjcTJVtE
 pUGFwBfMZyDVBNIdj9tza0n4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 70cb52b1da55fe0c;
	Wed, 28 Oct 2026 13:05:57 +0000
X-Mizu-Trace-ID: 70cb52b1da55fe0c
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH] mm/sparse: simplify the vmemmap alignment check
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261028121129.39916-1-kaitao.cheng@linux.dev>
Date: Wed, 28 Oct 2026 21:05:40 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Transfer-Encoding: quoted-printable
Message-Id: <66E340E5-B2D2-4DB9-AE01-4F98C3182B06@linux.dev>
References: <20261028121129.39916-1-kaitao.cheng@linux.dev>
To: Kaitao Cheng <kaitao.cheng@linux.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 28, 2026, at 20:11, Kaitao Cheng <kaitao.cheng@linux.dev> =
wrote:
>=20
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>=20
> sparse_init() is called only once during boot, and the vmemmap =
alignment
> check is outside any loop, so VM_WARN_ON_ONCE() provides no benefit =
over
> VM_WARN_ON() here.

Yes.

>=20
> Use VM_WARN_ON() and fold compound_info_has_mask() into its condition,
> preserving short-circuit evaluation.
>=20
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---
> mm/sparse.c | 6 ++----
> 1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/mm/sparse.c b/mm/sparse.c
> index 6acb628c8a73..248bee2d39b9 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -277,10 +277,8 @@ static void __init sparse_metadata_init(void)
>  */
> void __init sparse_init(void)
> {
> - 	if (compound_info_has_mask()) {
> - 		VM_WARN_ON_ONCE(!IS_ALIGNED((unsigned long) =
pfn_to_page(0),
> -    				MAX_FOLIO_VMEMMAP_ALIGN));
> - 	}
> + 	VM_WARN_ON(compound_info_has_mask() && !IS_ALIGNED(

We usually don't end with "(=E2=80=9C. At least I rarely see that in the =
existing code.
We can break the line after &&.

Thanks,
Muchun

> +   		(unsigned long)pfn_to_page(0), =
MAX_FOLIO_VMEMMAP_ALIGN));
>=20
> sparse_metadata_init();
> sparse_init_subsection_map();
> --=20
> 2.53.0
>=20

