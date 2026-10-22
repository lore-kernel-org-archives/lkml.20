Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792685848;
	b=A6NTY7QzOfdmg5EqVKeyVhfmV0AXfU6OUvTgdlpTq32K1X+v63/A5lqlDqjr+3kfa7TM
	 37dnNViCrP3qR4Kpx2G4Ha2QMINJaBUnU17k1tJmGnct6wgWKfnN4XpUTq2db57vgwVMo
	 mlf2b/rbnKLACtD5PJmB3aE3iEKd7cHBl4NN2gxApIv9+4YB6UqNmo8qK3ulr0BVI3ICI
	 f0ZCe0RvBMNImw5Iv1jRN/XezRSmLwwpTRkiL/aSM4/a4JpEG/81bAl4G8UHa2odw9Pqt
	 R8Sg8sHUKPkFxANUmHeLkJMNbWFz9HsPro7DjH7shTXn6nmUkrrj+NxQHu6u5HZ1+xA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685848;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version;
	bh=IyQXzg39zcGXVA48J3R7gRO6wWY/tJYex92UT40JM0E=;
	b=niCh9bea+XsBCZ/6bZYdfpdUFyn3Wt5auDZE0+yRdsGkdsIvSVigDGvWxsuYcS782oRX
	 Uksy/xH21nauYBm/C+f2NudjZxVmp8Yh/sQHz6U4L3UvNQR8k3TLn43BgirMshv3PuyrH
	 2Risy5epOulS0SkBaek1tjovlKk6g645ScRFF9WgEWt1uk9sYTlmOcQIjQhpK19KGIpWa
	 kHaW7PxCiLimcsMT5WQJzSrw/+Iod/s5pOXbj82VVzuMAQT+CeNLn5szkXg/s87hOlNL+
	 MOG+pOXc6cv0Y3+PcGlDE6J3JGlvsvlHILGHP+pfOtgkY9hU3nLAcx0vb+1IBaH4+9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Y6dNdwcl;
	arc=fail smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A2A606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85A2A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=Y6dNdwcl
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEECR81252048
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:17:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=IyQXzg39zcGXVA48J3R7gRO6wWY/tJYex92UT
	40JM0E=; b=Y6dNdwclyk0/i6LRnL1e+MW2cAlqUM2jSFU0ZaoR8zK1gTZopY1H9
	cpvA2PyeXNqMF9HZZEl9UXagnMwVCF4wFlhCfVUs2ex90MWoCFEDRlGcrWRVTDSG
	7OOkWVY2C16cGqsyCepZdHcx19AqpmFApUeLOlXb2gZdbSDgF947juJPbUK7V4C9
	MjjMkPhrXTUUZAQzKnNecwDvXXnhV/4Ep+alwhAtboi2uOXvkQJUyIwLDeEPyhlG
	dStF645OnxisrGfh2wRNwFZLGvw3xfXoI4vd5yi8fO8EuU4Jj/I+as9ZC8oSoBGs
	6zTNWAo3ACC2ppuNs9lY7nl+mEUTaNtFw==
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hf9mx44dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:17:26 -0700 (PDT)
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6aff6a8ee69so1921357a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:17:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792685845; cv=none;
        d=google.com; s=arc-20260327;
        b=OmMnLvVi3ro4j7oFCjoLPoXRFzaIxGzAOnVAoGFl3kbmWIUKNTF9XwCkT/dew2IM9s
         a5FSrfdkOlACH/Cy675gMcY6kNfbHrIpJFNqVLPmKpQahK47sIyFWFUbh7P/mTgHRsfs
         SP1HGGvmiB3EmVSIfT+l6a9ZIMK7NXzB+9Z7k5qGDec8zzqLqs6Lx3n/gTsuobWKIJz1
         wo1jJec/SmRc6MzK6XWb54I3SN5HlUy+fd9QMH/xvUey0rETPDPUHlKSs9n5HOU6Wu8B
         Xo8suMK6lwJIc8OQePboBbMevApWh+YEeZmI0F1KF7MJwmnkWvxCuAuYJsywZdfGFQy4
         bIsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=Cpb/0IA0On2NJNCBdcYW0RNbxOlGLfZgdxVpyVTyu0g=;
        fh=oYlHG7WuP00GFy2u+0JGfI/MrKACpJ1qf6QzF8HEHvo=;
        b=FtfgEXHE9e9kbM9QtuDjiNZA74RXeA+Jh3dr5vGegZ45KcySFZFZ9pPwTjYRd5i/AE
         Wt6HxLVO2mRhnE6ENV+8hKKdcZPlcuZWJyrTd5z8e3RvvUChD164d4w6SBMcgPvD6HNW
         bR/DntPJMsrZ7QTObEhph4jCx8GdHq5dSaXg07LPP0mjccterm+X3WZhOrYqSvOvINOq
         mI81wT9n+R7o4VhN4IIFCzb9UgYFy7ppUvGMlhtZdjX5dZ7A/XENSHfa7D5FGBCzULTU
         SW8BB0ONFIyAbeZmoZHi0AZWXeWGeAnFIeIbf3iz8uRmMXc7cAyEo3ioQ6R/N2qaG4n7
         uHXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685845; x=1793290645;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cpb/0IA0On2NJNCBdcYW0RNbxOlGLfZgdxVpyVTyu0g=;
        b=Pw8J1jRxiYMHkJxb41oKJSnSxxQc7shw2nYr0G1DJYKKaT0jSJdbZy52eGYqyNenqn
         lViLyKqL5/u6ET/RttkkyhHXgYtyCvDY902W+ZDlAYSfOQ0gtumGAaXDNQnDOzIVC4Dy
         xrijGP8UfjLZ+G7R131w8Aq3Vi8xdlaT4jrNyH9YHXrmGDtVhtLGlCCO8AVxMRGm8ft3
         fAI07pfB2sOPeIsCS5tMk7MHG4x5sww/zFz8AnHSWnkJVec9NT00M8jwOus2jJ4V8Pbe
         PLdyeNjzCGgPDxFxQ1yaUj8KqUyuaFyE9P6SA+m2SneBlIgNtdRPFo2vQNNXacw3JKzj
         Anwg==
X-Forwarded-Encrypted: i=1; AKwUvBythgG2RnjOMOqUZZTV/qgDq4RurYlJlO987abSofmDEt2kCigY7mh+JKbCcYTz9tMfNpRXTyv3ox7+grQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0ba31x6DQYGLqEtJqCcYlCvk7PNsIlljF6A36yxmbxWE8mDOY
	BjcmK6Mony0lBsqL9Nf03OaF3GJshJq6gVCNg5S+WrBdE/1gBcNnFYnIWQoWoXHhArKeAhQnJ4y
	/CPZdUWQbbtwEWnw7HjNwjiVP+V6oBEMQC2s4GAphW8gqgBrMkKNj361SdGDn5g/m1IvFh+9GOc
	wFkrfy4o8qqIi/ARPYs7xCETCCEvtyBfPhHdx0/Zg=
X-Gm-Gg: AYBFou1j9COgNsf7oMYyBZWFyyZBZWQWRtYWQSWkc/9H4SBmCSwkE/ZZ3zsZVYwv/Cp
	+GCBBuku2pyjKhCsrc8eQPu24EjryHoWcu8V45oyTjKacalv4DYaFQWGSvrGG93VoTEXp48MGsp
	RzqnnddO8xix9D854mka3t1se7XO4t5cwuVO6AU7tHHNq6hIdhRtNPFINxIluhcrSj5IcQsnw5/
	9iOAnOk3tEzbxME5w==
X-Received: by 2002:a05:6402:1f82:b0:6b2:e2:d965 with SMTP id 4fb4d7f45d1cf-6b408edb704mr5472626a12.32.1792685844935;
        Thu, 22 Oct 2026 09:17:24 -0700 (PDT)
X-Received: by 2002:a05:6402:1f82:b0:6b2:e2:d965 with SMTP id
 4fb4d7f45d1cf-6b408edb704mr5472605a12.32.1792685844476; Thu, 22 Oct 2026
 09:17:24 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022145615.2184343-1-alex@ghiti.fr> <CAMgjq7AB4wUzmugV3n4mhWcYqMKmhoZJCDV2uUagFjZXjUUi3A@mail.gmail.com>
In-Reply-To: <CAMgjq7AB4wUzmugV3n4mhWcYqMKmhoZJCDV2uUagFjZXjUUi3A@mail.gmail.com>
From: Alexandre Ghiti <alexghiti@meta.com>
Date: Thu, 22 Oct 2026 18:17:12 +0200
X-Gm-Features: AclHuK9GI5erCWePRdYkEH9p2977EyYs_eI8jHBxOgH2AAL38mp76QLee7bxFts
Message-ID: <CAEmasaXz2GGoy4dyhbo9Em95Cnz6QL3u2fcnAa2=8pJOOJyH8g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] mm/swap: keep reclaim batches contiguous on swap
To: Kairui Song <ryncsn@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>,
        Barry Song <baohua@kernel.org>, Chris Li <chrisl@kernel.org>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>,
        Youngjun Park <youngjun.park@lge.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
        Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>,
        Lorenzo Stoakes <ljs@kernel.org>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: uT2LxZTWqga-7MFjbQ-p59R7neK9eY0N
X-Authority-Analysis: v=2.4 cv=G7iJgNk5 c=1 sm=1 tr=0 ts=6ada3716 cx=c_pps
 a=9KvDgq78n9V61H3VJbnhTw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=wpfVPzegXHpEFt3DAXn9:22
 a=pGLkceISAAAA:8 a=AosG1spRg9nRUDFPKwwA:9 a=QEXdDO2ut3YA:10
 a=j5kO0B45gQVIxiUYEfTy:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2NCBTYWx0ZWRfXxkzeCZLjWApO
 P4bqUwv16u5B01E4U7UOw6Uc/E9oMJXjASvTLIzIIhglwU0QQzxi3CyLzvGwFvSX8tsTOYjwag2
 I0MGSDLwBhPH18EiJhI/56obmZyZINo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2NCBTYWx0ZWRfX3wUu2VcNWxG2
 9pJfBBPfeGDuiVxEPhoufYI3XNQDDBRyAU0YRG99Vo8cyGE+zn7Ekg1R5Jmf4Fi+gkQh2SNdV/r
 I0iweHUNSwNj468VAOD82+Rg1Y5vF5w1wYEYM6VD804q6H+uDGb0tTQU133y7CGfmk93Xwr5R7E
 UarKrKtGfHIqOXTWdtHProNSE20ibaKe1DV80bMyFNxMcyAnx+JLuX2JURR/44SR2zh23clzyEz
 sUvi0InnrTh7pvQ/gH8/raWlPo1xaem253kST+/IvaGS7v1x7R1CIYSpNcYriWNlc4AS7ilPLXz
 JgK++cydtshRrF0CeOrvwo60dW5vBEXJ1wZXRc7WT9LeCSYRu7krtGfcalWas7uubknI/4Ple7Y
 dyHbtVI8obLc7CRSKDxas5QiSaYhi919LMLyJoL9OzTuxGwOT1NgHm0Sup/rlWe0O90hMBgzxo7
 R3nhRI+l9xpO9OTrXmw==
X-Proofpoint-ORIG-GUID: uT2LxZTWqga-7MFjbQ-p59R7neK9eY0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01

Hi Kairui,

On Thu, Oct 22, 2026 at 5:27=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> >
> On Thu, Oct 22, 2026 at 11:00=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> =
wrote:
> >
> > 7.3 regressed swap I/O: for the same swap volume, a workload that
> > rewrites swapped out memory sends many more requests to the device.
> > mysql/sysbench in a 256M memcg swapping to an NVMe partition, 7.3
> > compared to the previous version:
> >
> >   device read requests per transaction        +59%
> >   device write requests per transaction       +27%
> >   throughput, iocost off                      no change
> >   throughput, iocost on                       -19%
> >
> > Two commits interact:
> >
> > - Commit 9a42aed48421 ("mm, swap: prefer nonfull over free clusters"),
> >   in 6.18, makes order-0 allocations fill nonfull clusters before
> >   taking a free one.
> >
> > - Commit 3cedb745d354 ("mm: clarify the folio_free_swap() for
> >   do_swap_page()"), in 7.3, frees the swap slot on an exclusive write
> >   fault. 7.0 to 7.2 kept the slot, but only as a side effect of commit
> >   4b34f1d82c65 ("mm, swap: free the swap cache after folio is
> >   mapped").
> >
> > The freed slots leave holes in full clusters, which then go back on
> > the nonfull list. Reclaim allocates slots one folio at a time and
> > merges the writes afterwards, so a batch of LRU-adjacent folios gets
> > scattered over those holes and is written with many small requests.
> > Readahead later finds those pages scattered as well, and needs more
> > read requests to bring them back.
> >
> > I tried three fixes, which perform similarly:
> >
> > A. Revert 3cedb745d354. This keeps the slot on write fault, but undoes
> >    the intent of that commit and keeps swap space pinned under dirty
> >    pages.
> >
> > B. Below 50% swap usage, make order-0 allocations take a free cluster
> >    before a nonfull one. This is what the allocator already does, at
> >    any usage, on swap devices with discard enabled (swapon
> >    --discard=3Dpages). It is about five lines, but the threshold is
> >    arbitrary, it stops working as swap fills up, and it applies to
> >    every order-0 allocation, using up the free clusters that
> >    nonfull-first keeps for mTHP.
>
> Hi Alexandre,
>
> That's a interesting problem. I think the real problem is with commit
> 9a42aed48421 ("mm, swap: prefer nonfull over free clusters"), right?
>
> It's more like a balance between fragmentation and contiguity of small
> order allocation issue.
>
> Perhaps we should instead always scan the full clusters and revert
> that one commit? That commit was only following the idea of keeping
> the allocation more compacted for that series, it looked good at that
> time. Since fragmentation issues can be solved in other ways,
> contiguity seems to matter more for large physical swap devices.
>

Oh, okay. I thought reverting it wasn't an option given the good
numbers the patch provides.

What are the other fragmentation solutions you are referring to?

Thanks,

Alex
