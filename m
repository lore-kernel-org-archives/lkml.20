Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793064828;
	b=GFN9xr7aC3iOyjiMNF3X9n2h628bMuBnCUAWOdaiMQ0uHMuk6I/CU8Gazc2q5UBebpVZ
	 C4iEc9N6ER1355KmSOWAMNcbzYhDRUm8XJ6lWB4dWGeVZLIu1NKtFnvq7fu1gzomPJ2/T
	 Nuf2D4mKT05P217Zscb6AJY6J5Ygvh9N2T+5uIcYaZwh/TUmLx5TMplYGi2Uy7Fvk4tkS
	 M0J78wT7FiN7xStu6WYhMdkxME/S7P9TTYfXqt6bYUdiDlsvAboaQEUhs/79EVPiOVGEY
	 LsYnCS3hptLJ/KI3I28zfWn1Eok3R67EjYUuhEK2h1T06IvHN8vWGCP+qny3OF0JbYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793064828;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:In-Reply-To:References:Date:Message-ID:User-Agent:
	 MIME-Version:Content-Type;
	bh=AUKkIWQs2ewX67X4mBGfWX1vbhCjN0R0JPL42QDM2II=;
	b=Yxtop+c5Aa58ntwvjte6FEdXb4XK9kBMV/+EfZX7Ax11D0swrPXdHfhy3e0otykc8C/2
	 FXpQms5n1CvfYVRIWFcd92Kj2Altg04/Tu0p1LFVg5IRWWRWV0ET+efiUxbdKICoja3dG
	 sdr312BOWlA7F5jb3xrHMPsM0ZIKyGid4u1JiohpOGGdCcy+lHMHkcQyYn86xj60n6ign
	 seVahg767RwRsn7vv1hyW3qvFOifgQdf0bPjXVegxxSe2hhFYjTXpECZgTidbYqEgxGEx
	 jgyC4LcqPCjWUvD1OajUlVJ5A96XF3WdxhdA2x03GuKwL5+Osu51AKj4hLukWd+11Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=jWGlMGJf;
	arc=none smtp.remote-ip=115.124.30.99
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B716606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B716606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=jWGlMGJf
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793064825; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=AUKkIWQs2ewX67X4mBGfWX1vbhCjN0R0JPL42QDM2II=;
	b=jWGlMGJfVyBuvWwPaNdFM3O06dwDDM+uI5E+RwrIIVoKmRBM1GsTuwo8VU9rqzr6VhDfA8DC9hcBTqbD407pNWdRS3hcoEY3ug9lgwnKfsKCk52EOLKDfPU3+SXse2PgkWeEhHyatWqu9iI7m4hPvJcUCs/txwNqvK3xhPr0V+o=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R901e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=ying.huang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XDc-YUR_1793064822;
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0XDc-YUR_1793064822 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 Oct 2026 09:33:43 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: "Garg, Shivank" <shivankg@amd.com>
Cc: "xiangzao@linux.alibaba.com" <xiangzao@linux.alibaba.com>,
  "rppt@kernel.org" <rppt@kernel.org>,  "wangkefeng.wang@huawei.com"
 <wangkefeng.wang@huawei.com>,  "chengkaitao@kylinos.cn"
 <chengkaitao@kylinos.cn>,  "vbabka@kernel.org" <vbabka@kernel.org>,
  "david@kernel.org" <david@kernel.org>,  "akpm@linux-foundation.org"
 <akpm@linux-foundation.org>,  "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,  "surenb@google.com" <surenb@google.com>,
  "linux-mm@kvack.org" <linux-mm@kvack.org>,  "muchun.song@linux.dev"
 <muchun.song@linux.dev>,  "ziy@nvidia.com" <ziy@nvidia.com>,
  "nao.horiguchi@gmail.com" <nao.horiguchi@gmail.com>,
  "liam@infradead.org" <liam@infradead.org>,  "linmiaohe@huawei.com"
 <linmiaohe@huawei.com>,  "mhocko@suse.com" <mhocko@suse.com>,
  "kaitao.cheng@linux.dev" <kaitao.cheng@linux.dev>,
  "tujinjiang@huawei.com" <tujinjiang@huawei.com>,
  "mgorman@techsingularity.net" <mgorman@techsingularity.net>,
  "ljs@kernel.org" <ljs@kernel.org>
Subject: Re: [PATCH] mm/highmem: refuse to copy hwpoisoned folios in the
 !copy_mc fallbacks
In-Reply-To: <2b2abc8718f1462f475d816437cdf65284698548.camel@amd.com> (Shivank
	Garg's message of "Mon, 26 Oct 2026 12:17:56 +0000")
References: <20261026025724.1430747-1-xiangzao@linux.alibaba.com>
	<87pkww7lnl.fsf@DESKTOP-5N7EMDA>
	<2b2abc8718f1462f475d816437cdf65284698548.camel@amd.com>
Date: Tue, 27 Oct 2026 09:33:41 +0800
Message-ID: <87h5i86i6i.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

"Garg, Shivank" <shivankg@amd.com> writes:

> On Mon, 2026-10-26 at 19:21 +0800, Huang, Ying wrote:
>> Yuanhe Shu <xiangzao@linux.alibaba.com> writes:
>> 
>> > Where copy_mc_to_kernel is defined, copy_mc_user_highpage() and
>> > copy_mc_highpage() stop at a hardware error during the copy, report
>> > the not-copied bytes and queue the source page for memory_failure().
>> > The !copy_mc fallbacks return 0 after a plain copy instead.  With
>> > PG_hwpoison set while the data stays readable - software-injected
>> > poison (MADV_HWPOISON, the debugfs corrupt-pfn injector) or a
>> > transient hardware error - there is no fault to recover from: the
>> > copy completes, the destination folio carries no poison marker, and
>> > the poison is consumed silently, the same poison consumption
>> > commit 841a8bfcbad9 ("mm: prevent poison consumption when splitting
>> > THP") refused to risk on the split path.
>> 
>> As far as I know, software-injected poison is used for debugging only ,
>> so I don't think it's that important.  Hardware poison state in DDR is
>> sticky; that is, even a transient hardware error will cause a permanent
>> hardware poison state until a reset.
>> 
>> Therefore, the primary value of this patch should be to reduce machine
>> checks (and panics) during memory copies.  If so, we should place the
>> check code before copying.
>> 
>> > Check the source folio with folio_contain_hwpoisoned_page() in both
>> > fallbacks and return PAGE_SIZE, the not-copied-bytes convention of
>> > the real copy_mc paths, so the callers take their existing error
>> > paths: the COW and fork paths fail with -EHWPOISON, KSM and
>> > khugepaged abort, and folio_mc_copy() propagates to the migration
>> > core, where this composes with the separate migration-side checks.
>> > On archs with copy_mc this code does not compile.
>> > 
>> > The check runs after the copy: a check before it would leave open
>> > the window between itself and the copy.  A flag set before or during
>> > the copy is caught, whatever state the data is in.  A late software
>> > injection cannot have corrupted the completed copy, and a synchronous
>> > hardware error takes an arch without copy_mc down at the access; the
>> > residue no flag check, before or after, can catch is corruption whose
>> > hardware report lands after the last check.  Closing that would need
>> > architecture support, as discussed.
>> > 
>> > The fallbacks do not queue memory_failure() on refusal: the flag is
>> > already set, and memory failure either knows about the page or has
>> > abandoned it.
>> > 
>> > Suggested-by: "Huang, Ying" <ying.huang@linux.alibaba.com>
>> > Suggested-by: Kaitao Cheng <kaitao.cheng@linux.dev>
>> > Assisted-by: LLM
>> > Signed-off-by: Yuanhe Shu <xiangzao@linux.alibaba.com>
>> > Link: https://lore.kernel.org/r/877bjowf9i.fsf@DESKTOP-5N7EMDA/
>> > ---
>> >  include/linux/highmem.h | 9 +++++++++
>> >  1 file changed, 9 insertions(+)
>> > 
>> > diff --git a/include/linux/highmem.h b/include/linux/highmem.h
>> > index d7aac9de1c8a..f90f0c6204a4 100644
>> > --- a/include/linux/highmem.h
>> > +++ b/include/linux/highmem.h
>> > @@ -474,12 +474,21 @@ static inline int copy_mc_user_highpage(struct page *to, struct page *from,
>> >  					unsigned long vaddr, struct vm_area_struct *vma)
>> >  {
>> >  	copy_user_highpage(to, from, vaddr, vma);
>> > +	/*
>> > +	 * The flag can be set while the copy runs, so check after it;
>> > +	 * a flag landing later can no longer have corrupted this copy.
>> > +	 */
>> > +	if (folio_contain_hwpoisoned_page(page_folio(from)))
>> > +		return PAGE_SIZE;
>> 
>> Why not just use PageHWPoison()?
>
> This will miss out on hugetlb folios I think. is_page_hwpoison() is more
> appropriate as it covers hugetlb cases as well.

Yes, that is better.  Thanks for pointing that out.

---
Best Regards,
Huang, Ying
