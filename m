Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92282417BE9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246522; cv=pass; b=PSfybjJJ1bVL0dzc5jbBIpMM83oqj5c84kIpwdGKVGCnzTGS2eXHAoW6IkugnR9xxdC7iNAfgCUY9Op0hoxWsbqNAiJZxjKjY0peBdGJBt5yyxQEuk18fF8g3PRi7ra4/jDrSYwyEiiSQMNBLt/5GmCn5922PzdLXbKOZubFJ3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246522; c=relaxed/simple;
	bh=1V5c+Xe9oGDLQt1HYxyPbjCxVBThE6Iar3PjXwpu/SQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YLhcr0VU2/4CAak0j4tsfV4A89jr2L8VzRDSsg74nCUMRYAio9yi0Z0so+ONdnKyu8D6cI+fAHwgUyqOQN1jTyTocQ2uMnJV3IpUb1qx39MscDsJQIDo0IaBR3kjJf47sJiwU6HtpiMgv/1ipF64j4uqVTslz9cB0w041U9pHQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ChT9neEg; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ChT9neEg"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a6108734d5so133401a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:08:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788246514; cv=none;
        d=google.com; s=arc-20260327;
        b=A5Q21KspM6YssmPRXR7mpyxOboV4aMybJ5sordkXLDzGRjPBBw4n2FLTYGcBmFWGdO
         MITBmpViK6/F8QgQVc/VvZ9mchyP/fDDUT92yi9jQnlWikNpv2AefRX17lm9jbIUAOCs
         7sE7DgAfYdectg1Tq++T/n7BEGhnapDRYnVPlDesUDESWZBy7jj2zMHJ+SGUGAgfBdBk
         qf8FokWVyPeuipecw0IauM8+MJe35Bo4iDGhVEhp9gkGRwi7ZjMyNqeRwSmScCBAxVG4
         +bv+Ls1p6m8MxoR6WijjSy6e/Xj4mH5Dr2GN14wQ8aIIqOkIdg7yCUKeftZwa+VbJthh
         HIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MENEyb6n8ZqZ9853k/Vkeokm/Vdk4mPlZon6Y0g8sH8=;
        fh=H85kZzfgv0AKiEK2p1Rw0GU/dEiYI4jBm6PzUxP40os=;
        b=Go+Y328DnMQj/20SLNCWOb5gcSLjjl+upGpmhCcE9wQ9b7fozo9DPCP8tQcs7HbNyx
         O2gBRyVmRn5RcyqjFOyKYXQT2BNHCTR5YhK5HQ2hxCy+TLoCeXpGmVLjc572LrPJijF9
         4ea8lCySiZfm7vF0BQ4GQ180NmvGMIrBcIc5uiIqQ7kS7YnpYoYJ/WN/aIRNEyYuXad0
         G7pUIdltFOIS1k2q1Hcjd4K8RN8Phc6b+vRikoyFxlqqo309dMF9f7to+1WS7IJXnm0s
         CSSUUFFOKOhJAFQAdunsKJ0TU9MSQoYTfUMTu8W3ezRQUZJWchIrHV98V17URGZcH3TC
         GWbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246514; x=1788851314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MENEyb6n8ZqZ9853k/Vkeokm/Vdk4mPlZon6Y0g8sH8=;
        b=ChT9neEgTdBhJWjTO6tfYeFAyxMXrGsI39YCfvRBhCizGuieuqAVXGMFv4XwpFKJnY
         8XD/zSY8h18i92rNbP4KHHaAVJV7cDf2ipxhm58rhi3QBfhMf/5u9U8nvKxNqh5T18Js
         Hn3jPXrgJR8Jfuv5AjcsS38B+7TQECvdIzesEcxEs/Qn7yom4liBTgWXsuLUPGMjNgof
         /3zKemTEjoPEGPQbjB9bpEusnO46bRfD4rWrobDluV74Y+c9cl/ZfYOYcJRxBZmByKQO
         BqLDqHDpijbGd8t90InkxBocO22ymPZTMs6BzDBBekWenWfX41bkW4bRtfREBM2elY0b
         779Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246514; x=1788851314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MENEyb6n8ZqZ9853k/Vkeokm/Vdk4mPlZon6Y0g8sH8=;
        b=KEGeTt7jDHbHEQBkQ7kXGHZqSXZrKn1fnhOCeGm9xCQNOECF0w6uZr0vCRc5uiwoD+
         aWWuoAc22Wau0vK3hblgKVHAoAbkITtzrm13y06f0Z6dZc9aOkC4qX12NHyv3PGMj2td
         dZK3a3eupDn7bztSqWpSugg9ZXKF/ASSndZzqxc7tOR9ZOIlVW8EF5v0BzmF4Q3SWUi0
         H4i7rp1zPw5LFaqrk214a4q5n7mxieNZm+ezgwRFksOc8K4Bu2Do/LNhYqJ9M3lUYA9U
         z4i+rG5ZYIWDkULMyhR5CmWUSPKSp6u0BWxSbsQgfvcGihecv8LGRItQ+H25WTPNSeai
         4vqQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqo4Y77a7U7egy4qotsXkvK1juTAF6NSxT4xJQa4waJDWsEWDPFbsY6h37ifVksocjZFBMHUb2esUgRH14=@vger.kernel.org
X-Gm-Message-State: AFuF++kGCjOAWA4i3RmqyvOdaGHQNdW9/FfxpKc9rcAov+Ld9Lnmo0Oc
	7rRDu1qtSYNAsoJb7wcenoQm7ehFSkgb9zBuW1eUq6J9+0+4jJtjnFmekNx60hvM0aZShjNn/EN
	rLJUY6GlD4WeYNVOOhCq6SeKBDCEE498=
X-Gm-Gg: AR+sD11zQEN6QZI8zsFKgj5Cf6Lth0ZRhDqpXgxqkQ31i8H1cGvDvGI4nl4doeIZpXu
	DayOAWk/1GC9OxPCZKc+wJjRElxl0vkTMnFEtNb9dKq0byHgH5l31FtppXZavE0Wm7J3eo7sUVV
	/fFYR1L3zwy6abmzuGrDTCSg2rH13FKP5VQ5MD63bTa2UwbQQxgo9+5/z0eQi24Fc+ogtsTmAvj
	CYtfe9K8fI2jsduMWenPlFuDBUJiqXKqrGMnNPpdjKo26B5udD+rEGD2N78pWv/Zi2MwwgUSbpw
	TqktvKEu2qR3IN7+SL/kX1K4E6oXMqxd3ksRfRujnN0Cq9gjeuPOL1gNmlbKgL/rM9I9xShxteD
	j
X-Received: by 2002:a17:907:7248:b0:c25:8e53:45ca with SMTP id
 a640c23a62f3a-c25b3db6e81mr396140166b.21.1788246513480; Tue, 01 Sep 2026
 00:08:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804-mglru-fg-v1-0-4d8dad39dad6@tencent.com> <92DCEFFD13221261+20260828102344.1537874-1-zhaozhengzhuo@uniontech.com>
In-Reply-To: <92DCEFFD13221261+20260828102344.1537874-1-zhaozhengzhuo@uniontech.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Tue, 1 Sep 2026 15:07:55 +0800
X-Gm-Features: AcwNN1UupyN0AD-fXq1_KY0r6IzjdHMuvQYcOkrxn4W7Ns9-T-rwHKEWwBepA6U
Message-ID: <CAMgjq7C68N-0iiMze4Lw4C44iiHBhbskXN_P1Qu-KhvpaoCwLg@mail.gmail.com>
Subject: Re: [PATCH RFC 00/15] mm/mglru: frequency guided promotion (MGLRU-FG)
 and flag cleanup
To: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Muchun Song <muchun.song@linux.dev>, Qi Zheng <qi.zheng@linux.dev>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Nico Pache <nico.pache@linux.dev>, 
	Usama Arif <usama.arif@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SeongJae Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 6:26=E2=80=AFPM zhaozhengzhuo
<zhaozhengzhuo@uniontech.com> wrote:
>
> Hi Kairui,

Hi!

>
> Thanks for the MGLRU-FG series - it is a very interesting and
> well-written piece of work. I ported it locally and ran a subset of the
> benchmarks from your cover letter on our test VM. The results are
> positive and consistent with yours, so I wanted to share them as early
> feedback. I would be happy to test the next posted revision directly
> and provide a formal Tested-by tag then.

Thanks for the testing! Nice to see people testing and help verify the
performance, really good data. MGLRU-FG is supposed to be a generic
improvement based on better modeling and tracking of the access info
of folios, glad to see this can also be verified on your side. I'll
also try attach more test data in V2.

>
> Test environment
> ----------------
> - Host:    96 physical cores / 192 threads
> - Storage: VM images on a 4 TB Netac SATA SSD (no NVMe); VM disks
>            are virtio-backed image files on that SSD
> - VM:      96 vCPUs, 128 GiB RAM (KVM)
> - Baseline: mm-new @ a032d41a86cb
> - MGLRU-FG squashed into local commit 9fc6ff682d08
> - NOTE: the port additionally contains a local guard in
>   folio_inc_lru_refs() for non-LRU folios, so this is not an exact
>   bit-for-bit test of the posted series.
>
> 1. fio, Zipf 0.9 buffered 4 KiB random reads (all IO through the
>    page cache), 40 GiB total files, 16 jobs, 16 GiB memcg,
>    45 s ramp + 600 s run:
>
>                         run 1       run 2       run 3       median
>    CLRU                 797.64      796.74      800.21      797.64 MB/s
>    MGLRU before         766.88      273.75(*)   769.81      766.88 MB/s
>    MGLRU-FG             838.16      840.26      367.92(*)   838.16 MB/s
>
>    Median improvement over MGLRU before: +9.30% (cover letter: 11.1%).
>    The two marked runs entered an unexplained low-throughput state;
>    CLRU stayed at 797-800 MB/s, and a reboot restored MGLRU-before to
>    769.81 MB/s, so I kept the outliers visible rather than dropping
>    them. I am investigating whether this is related to MGLRU
>    history/state across hot switches.

Oh, usually I reboot the system rather than use runtime switch,
runtime switch is known to skew all the shadow and many other metrics
for MGLRU. But there is also another possibility: latency spikes in
MGLRU, e.g. aging, which we will fix later.

> 2. MongoDB 4.0.23 / YCSB 0.17.0 workload B
>    20 M records, 6 M operations, 48 threads, 16 GiB memcg, 8 GiB
>    WiredTiger cache:
>
>                         run 1       run 2       run 3       median
>    CLRU                 18695.72    18673.44    18438.05    18673.44 ops/=
s
>    MGLRU before         17517.69    16196.08    18180.28    17517.69 ops/=
s
>    MGLRU-FG             19871.70    19721.86    19321.00    19721.86 ops/=
s
>
>    MGLRU-FG improved median throughput by +12.58% (cover letter:
>    10.3%). Median read latency / p95 / p99 improved by 11.35% /
>    12.30% / 26.06%, respectively.
>    Caveat: the master DB was loaded with w=3D0 and stopped too soon, so
>    each run had about 22.7k READ NOT_FOUND results (~0.4% of reads).
>    Every variant was cloned from the same XFS reflink master, so I
>    think the relative result is still valid, but I will redo it with a
>    fully settled master.
>
> 3. SQLite hot lookup + cold grep stream (sqlite-grep test, 90,000 cold
>    files, 300 MiB memcg); median of run-medians for the hot lookup:
>
>    MGLRU before:         277.18 ms
>    MGLRU-FG:              13.74 ms   (-95.0%)
>
>    Eight of ten MGLRU-FG samples were about 13-14 ms, whereas most
>    MGLRU-before samples were 249-322 ms. Grep time itself changed by
>    only about +1%. Compared with MGLRU before, MGLRU-FG also reduced
>    file refaults by about 21%, direct scans by about 17.5%, and pgpgin
>    by about 15.1%. This was the clearest reproduction of the intended
>    protection against a one-shot cold stream evicting hot data.

Nice data from DB tests. I believe these gain are from the actual
imrpovement of LRU's ability to keeping the workingset and evict
less-frequently used folios.

> General observations
> --------------------
> - No memcg OOM kills, and no kernel BUG / Oops / Call Trace / panic in
>   dmesg across all completed runs.
> - Confirmed that folio_inc_lru_refs() is exercised at high frequency
>   under the fio workload.
> - make -j48 / 3 GiB memcg / disk-swap (CLRU side only) completed in
>   2h18m59.9s with 20.9M file refaults and 48.1M anon refaults, no OOM
>   kill. This VM builds about 13.4k objects and many modules, so its
>   absolute time is not comparable with the machine in the cover letter.
>   The before/after MGLRU sides are still running; I can send the
>   same-machine comparison separately.
>
> One thing I want to flag: my local port adds a guard in
> folio_inc_lru_refs() for non-LRU folios. I noticed that syzbot
> reported a WARNING in folio_inc_lru_refs() on this series
> ("!memcg && !mem_cgroup_disabled()" in the exit_mmap path). I am not
> sure whether the two are related, but if it helps, I can check whether
> my guard's trigger path matches that report.

It can encounter non-LRU folios, and raise an false warning. I'll
handle this better in V2. Non-LRU folios are totally fine and often
seen there, it just need to skip the gen part to avoid the WARN.

> Because this was a local port plus an additional guard, I am reporting
> these results without a Tested-by tag for now. I would be happy to test
> the next posted revision directly and provide a formal Tested-by then.
>
> Thanks and best regards,
> zhaozhengzhuo
> zhaozhengzhuo@uniontech.com

Thanks again! There are some work going on upstream, so I spent some
time on other items; I will post V2 Ccing you.
