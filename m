Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.183
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622557;
	b=HR9seoE4lqXUa4Y3uB+EBiEv5QMHBwIHcOXPB7mO5IN1C4nO5PnvIf82MsKrqJd7zknn
	 izejrwamVcS+UZgx4McbJ3IiPxErbmaqcpKDriG/tAFNDhUlIITyFNSgyUEEluWwYN2yb
	 E6a24X596Xyjp9VSgx2/sm1zx8J+PzsWvR/+cWHPH1I/RQMPZPh2OyM9/Wg5IBS/qrp7E
	 eWLQfo89fKVJPw7A1jCMyw37ad5SKuJaNxlAdou5ixVVjAqRGeOwqEnhTfz7FzB3dk4qS
	 kYdfvJk9++XFpegwnYeyVVcQEsURcWrLQZv7T/JtcA8KLrTVQB0JlLXSJkPCpVYPiMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622557;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=i5jpm5CuS5hMQjKmVnNP27jSTbTcYAnxBrA5dk6se5s=;
	b=1uRn1TyjULWZkW2AKM83+BBekZLTiQhrizTnV/RLcitXAyVkNuegTk3KOgeLNhFeDXtk
	 FzTxv2ZeQrqtTgph7BqcQOgER9O1dyLHD0Os4NwHZc40wX/OZ/q+FSI8I50amO8dT8Drz
	 QGvZcO3mFMUCXMaGs7E21Q30pGCO+Tbz2nMnejIcqQf990UHn70FaFTdGDbDswrDrYXht
	 hmKmhuupUsT1sm2ru4UbNY/k3YxYk7RU0rSvAL0GO4dmyPkrq0W3sfPkFfRWeB29v7XJU
	 JveP37R8c1HKfZz47vKwp9U+jYvJ4qcDVADvuRBZ5HUYbFRkJ7dwM3tU1/PSt2cGBhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="N4f8/RAK";
	arc=none smtp.remote-ip=91.218.175.183
Received: from mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CB2606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3CB2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=N4f8/RAK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=lBOQhpowAzDqo4yhRDS5YU2BDNuirwHB1ryB/ebjSfs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793622554; v=1; x=1794227354;
 b=N4f8/RAKVKgzDj0sMXRI2wKidp6iBEGTLilMDBxNotEE13jbz5JJ+Cm33bVE8fAzU2hNd27h
 SItOAxujigfetZnAsyMS49nOaoaLVuXcj7qgfQDUuNka0MJtX84jfK2PYN99A1FJmyYZru/t0I3
 nwh6USvqx0lIj0ME8kNrINcQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 1b3ff97483b36a93;
	Mon, 02 Nov 2026 12:29:14 +0000
X-Mizu-Trace-ID: 1b3ff97483b36a93
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 02/12] mm: hugetlb_vmemmap: unify
 VMEMMAP_{SPLIT,REMAP}_NO_TLB_FLUSH
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <179361471103.1337633.14353990207430443405.b4-review@b4>
Date: Mon, 2 Nov 2026 20:28:56 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Lance Yang <lance.yang@linux.dev>,
 James Houghton <jthoughton@google.com>,
 David Hildenbrand <david@kernel.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B5E261FB-D532-48A2-801C-C8E4F86D7C1F@linux.dev>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-3-songmuchun@bytedance.com>
 <179361471103.1337633.14353990207430443405.b4-review@b4>
To: Mike Rapoport <rppt@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 2, 2026, at 18:18, Mike Rapoport <rppt@kernel.org> wrote:
>=20
> Hi Muchun,

Hi,

I didn't realized that I'm not using a plain text in my last mail.
It=E2=80=99s my email client's fault. Let me email it again.

>=20
>> VMEMMAP_SPLIT_NO_TLB_FLUSH and VMEMMAP_REMAP_NO_TLB_FLUSH do not
>> describe fully independent choices. A split-only walk can defer the
>> PMD-split flush to a later global flush, and a remap-only walk can
>> defer the final remap flush. However, when a PMD split is followed
>> by PTE remapping, the split flush must happen before the PTEs are
>> changed, because stale large-page translations must not overlap with
>> new small-page translations that map different physical pages.
>>=20
>> Replace the two flags with a single VMEMMAP_DEFER_TLB_FLUSH flag. The
>> new name reflects that only safely batchable flushes are deferred. =
Keep
>> split-only walks able to defer the flush, but force the split flush
>> whenever a remap_pte callback is present. Callers that batch HVO work
>> can still defer the final remap flush and issue their own global =
flush.
>>=20
>> Current callers keep the same flushing behavior.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> Reviewed-by: Lance Yang <lance.yang@linux.dev>
>> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
>> ---
>> v2:
>> - Rename the unified flag to VMEMMAP_DEFER_TLB_FLUSH and update its
>>  comment (suggested by Qi Zheng)
>> - Update the commit message for the new flag name
>> - Collect Reviewed-by from Lance Yang and Qi Zheng
>> ---
>> mm/hugetlb_vmemmap.c | 23 +++++++++++++----------
>> 1 file changed, 13 insertions(+), 10 deletions(-)
>>=20
>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>> index 4b73d6ec8dcea..63e899cfaac3a 100644
>> --- a/mm/hugetlb_vmemmap.c
>> +++ b/mm/hugetlb_vmemmap.c
>> @@ -42,10 +42,8 @@ struct vmemmap_remap_walk {
>> struct list_head *vmemmap_pages;
>>=20
>>=20
>> -/* Skip the TLB flush when we split the PMD */
>> -#define VMEMMAP_SPLIT_NO_TLB_FLUSH BIT(0)
>> -/* Skip the TLB flush when we remap the PTE */
>> -#define VMEMMAP_REMAP_NO_TLB_FLUSH BIT(1)
>> +/* Defer safely batchable TLB flushes to the caller. */
>> +#define VMEMMAP_DEFER_TLB_FLUSH BIT(0)
>> unsigned long flags;
>> };
>>=20
>> @@ -85,7 +83,12 @@ static int vmemmap_split_pmd(pmd_t *pmd, struct =
page *head, unsigned long start,
>> 		/* Make pte visible before pmd. See comment in =
pmd_install(). */
>> 		smp_wmb();
>> 		pmd_populate_kernel(&init_mm, pmd, pgtable);
>> -		if (!(walk->flags & VMEMMAP_SPLIT_NO_TLB_FLUSH))
>> +		/*
>> + 		 * Modern MMUs allow overlapping TLB entries with =
different mapping
>> + 		 * granularities only if they map the same physical =
address. So
>> + 		 * remapping must not proceed without first flushing the =
TLB.
>=20
> Are we certain that *all* modern MMUs for *all* architecures that=20
> support hugetlb are fine with skipping TLB flush after a split?

I think this is the case on architectures that currently enable
ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP. Of course, the point I want to
further clarify is that the "skip" action here is not really a skip,
but rather a "defer"=E2=80=94the TLB is subsequently flushed in a single =
batch.

Thanks for your review.

Muchun.

>=20
> AFAIU, x86::set_memory always flushes TLBs after a large leaf is =
split.
>=20
> --=20
> Sincerely yours,
> Mike.


