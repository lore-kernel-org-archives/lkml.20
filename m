Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793556194;
	b=weNCSrOUZPQSGt4keqHaoqNdtJxLWE0d3qY9Va2eBnjAMrZjlHBrHSL0LXDsZDv4438N
	 EvZGQrNg7Crj1LTTKSGnW4ch57akWFxKVWzugA9ZZyZk7oyn8EbaLnzU1riiY5S7eSwDu
	 lbW1F3BhycG4kVbIpOCXP6XPR4ssZxHclhWe6ZiPD2KRJu0QpLAc0Q77vsfJ7aKz9IZbK
	 bwBKOmKKcCsD57Rx0IEdTS9/iwNGDhNVWGvtUxEhTPHl18lt86x3nR7GTpFOHhUuYva7D
	 36HTigWHbwjzZTtfMBGnMxM2n1EfF32gWpiW+sLzJbVxJFehuGtF2QouZsehNe1Tk4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793556194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=E2KNNLNC1SGWQPktfWAC0fctv/qW21YYnE3QrHE9Xgw=;
	b=p8HpoI75fo0vZI1w/v4NDhT5Vu0/bcHQDkcgIJfMIQETUp72Qsb37zXvzymNqbzvbz6J
	 GRo1yE3s+mRxZQK9x4phoAhEJzhiq8QW1nQGeHXqz2NTaNp8a0Aos6mYL7utup+La/j6k
	 24K+jT+hHm4VP7MVCFycHNCCOi0UGq9uR63fHt8dvUoYjBOqrO/KO3XXw4v0661/eGAfR
	 nnWhE4fDdDZHXzi26d3mmdnzLOkYK5bngIa49Fq1O0ujsTLTlkSj+drAqCIqJ35XoIz9f
	 /WrYnLboiXiBBb5t5PBscWjD+LF/5CLXBoJL4iPFAZ0bdDJV8HUVnmmsVcKYcoYTZLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F+qEgBzg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6D0606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 18:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB6D0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F+qEgBzg
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b4e814214aso2311264a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 10:03:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793556192; cv=none;
        d=google.com; s=arc-20260327;
        b=HrM7pexOvRhy0c2PC9BXPQyaLBYhXONGvXe2m/thySH7iaxMM0kpHWFxFOCXWj+Vzh
         yVxWhQRykLXNGee1/X4QDseZaTU4IAiHXfgRXsDLXPSz8JINvbNihAYfkp34rwpmAn2k
         cou0owutQGGzmdPOI0lw6MwMC3zXHG78lR7hMxdwoEH7CbCJr5tOTeg3+YLuWG4HGW7c
         5ZEWNhAvpgGQdOG1jZI8ja0eQ+Nz9QnQAwyb0Hf5b/TQMZOpxA86pcCSc+T0FT8pCygT
         2n3qKP9GKbMi5i/7geRbQ/2rO7aSgDN0XYApQCQ2gJNWKgE18lG7qtHWmKd85Rw0oqua
         IGUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E2KNNLNC1SGWQPktfWAC0fctv/qW21YYnE3QrHE9Xgw=;
        fh=xzjoAmC29yhMIGrcZ9Vc386cCse2jspqsTJmYr8550M=;
        b=FijmnC3D7TWf2XHgqTJh170iNEauJtXT+PvqtWHPTx0WXiCY1asYifbe9/YR/YIBTD
         o8drfvC4lNWEqbWnu5ItXIZwg7/0di1YaLrC33+QRJ3dpBXIhVPHPU3tzmXPvN8SUY18
         pk0qN9JDG4iwwQRHjtq0KJTY0GHk06mFV4wLuHlo/TGNphdwYLlnO79Xw/dqv/qxmgK9
         FvpeFqMR3MCiBb0F92Luv4WmL6beYEFRTj7oPQMpWJOazgjbvGdOmEuHohKgaXq4of4E
         7XWT25n5/tADrFb4hk4XgsjehkWk2c48/fvVCvEmuL00dXvv1pKnToWUEjoRQkUpAm1P
         lxlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793556192; x=1794160992; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E2KNNLNC1SGWQPktfWAC0fctv/qW21YYnE3QrHE9Xgw=;
        b=F+qEgBzgL7NJu22ebqu1eIEMouIufRjFJJatu+R3QPmx0ByjGEVDdmm8l3a13pH4AH
         s2Zw2sEDeVNUwBzz7xkqmtdVbGstv7GjIaCC9EbiMeH7kUIamjzQxvLAEHSd+OSJYzm3
         fX7l2+gl5YBYZQ2knnXu6thn468CCAZpOCJlEQYSJ+1rPN0DopXxmVQzXZKGyEg2XQJ3
         PHj/alIHw75UBD5Djr0ehRlJxwTsd0kVMVw9JirOPuP0XeQB7MrI17Q1B7gtjZpr2lCH
         xYIlWWSs7CC7D3Ev7m1+hlU5gSZKcbA9b227gqmonBUNEPRBwn+t6n+H8Ij8agazvT4v
         ClCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793556192; x=1794160992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2KNNLNC1SGWQPktfWAC0fctv/qW21YYnE3QrHE9Xgw=;
        b=jw0yOVl1YqBpGJxe3UTrJBb0sxyoU1M6bmwFYkdaIQLkcySdX2t/efoDXV81ilncPr
         E8VJ4uGYrS9ObUt9naoQh06U/7VjIx9XBJlTiDAvk2jj2W/V0UdmvasBZkdGnHjfImp6
         wCDONfZK0oyyPWh6t1Taq4FbT7uuww6/t3gE1qwulwQmtcYyJrWdttpKkOY0uLU+HFQi
         RJkbIWPOliRjIa6kgDMDdptJJ8HbSBQX/O+QvHQYRFVcRYSW4DeILFghp871mnW+JtpN
         2zfpcEkIq7kRX9c032TIr28ej+iHP/LhGzGn616p188bJa8FXZVtZDmeJQ7v9+krUQz6
         YW6A==
X-Forwarded-Encrypted: i=1; AKwUvBzeSiF8pNjb5fwogKSd6O/afTbNWqskGJ9/UbswlRZjz1nhX5IjVvMaMLfYoKocgCQwNMNrHNCnuSXos7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fXjtMCM+Cs2fiO2klWb5nkoGF7wSx0rQ9yvtF8MfBQ7J0NYk9
	NJXC0aEM8fsEJk03bvWcAD+bB80EhHayyC1+f60lm4nY1jWqM7gQoh4th1XK42C6jysCz5fWOhu
	Z4Vq94T2MKeo/FVras5VbDRTsZJQWoWw=
X-Gm-Gg: AYBFou0siqrOBiSx6v9JPcHJhh4LfMdakZY1jvdYbxBZEqudpR7wUt0/h7IHIAPFT4Z
	A0A4GGJma7oJO2BxEchBTS0YbTavBOAhT5JhDmu48E7io3el3NeJfi/1FDb6qZg3RF6SwndARuH
	Aeingmzezr+DaHQIko1L6ZBA2XT/PuOzkvl5o3JMmKBNl7S1+MG3ji4WEQR5PzebAbPwAO2QSKU
	dgz+jW+leDr450HaPLpxUxqkPh7TeciqABd+EZ3kbeKqgxl1UAB9a2oF8hsHDgwh7RbXYNCKhiV
	M+TeTWf83E5nxcJSG7suVvaU5aCqRImESVO0NwPZe3yw6Ye2cFCX/FEqZ9+aF+/4wc6fHvIrin9
	545cLeUYNjJ0n5Yrts7XoabdvGPM6lg/1+Eopv0I8rXjRFOR1JDhevnDzrFNzgRJLfT2zOvQ=
X-Received: by 2002:a05:6402:a50b:10b0:6b4:27a:38f7 with SMTP id
 4fb4d7f45d1cf-6b4d46841c0mr3680555a12.22.1793556191678; Sun, 01 Nov 2026
 10:03:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101160427.85701-1-maxmuzaf@gmail.com>
In-Reply-To: <20261101160427.85701-1-maxmuzaf@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 2 Nov 2026 02:02:33 +0800
X-Gm-Features: AclHuK-mBCMSO3NX7Gmc3L4MrGwIlRmJA-dre9im5G-WapDPHEKVriJE5cMlVMk
Message-ID: <CAMgjq7AEf_cJsLw4fxs7m5ntYPW9mjCOC_-w5j6ihk8F=xLRWA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] mm/mglru: MADV_RANDOM page cache never ages and
 thrashes the oldest generation
To: Maxim Muzafarov <maxmuzaf@gmail.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Yu Zhao <yuzhao@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 12:04=E2=80=AFAM Maxim Muzafarov <maxmuzaf@gmail.com=
> wrote:
>
> Hi,

Hello Maxim!

> It looks like I've stumbled upon an awkward behaviour. When MGLRU is

You are not alone, I encountered same issue too :)

> enabled, page cache faulted in through an MADV_RANDOM mapping goes into
> the oldest generation, and the refaults land there at the same rate as
> well. In my tests bpftrace shows the generations stay at seq 0-3, with
> no aging attempts and no new generations during the workload run, and
> /sys/kernel/debug/lru_gen_full shows for generation seq 0 15758245
> pages evicted and 15580028 pages refaulted, which is 98.87%.
>
> At the same time, a file read through a normal mmap lands one
> generation higher and none of its pages are evicted. It stays cached
> until the end of the workload, and the randomly read working set
> shrinks. With lru_gen disabled, the CLRU evicts the file
> instead, and throughput recovers 20-30 seconds after the file was read.
> I would expect the same behaviour for MGLRU.
>
> I first saw this slowdown on a single-node OpenSearch 3.6 (Lucene 10.4)
> HNSW vector search workload [1]. The node had about 2.8 GiB of page
> cache for a 2.9 GiB index, and Lucene maps the .vec and .vex files with
> MADV_RANDOM. Kernel 7.2.10-200.fc44.aarch64.
>
> Search latency and throughput on a single-node OpenSearch:
>
>                          MGLRU on   MGLRU off
>   p50, ms                   286.0        73.6
>   p90, ms                   512.1       135.6
>   p99, ms                   687.0       191.0
>   queries/s                  27.4        87.1
>
> Disk reads, same runs:
>
>                          MGLRU on   MGLRU off
>   major faults/query         1484         325
>   disk reads/query           1484         325
>   read size, KiB              4.0         4.0
>   disk read, GiB/run        509.6       111.5
>
> This is clearly visible on the page cache chart [2], where "blue" are
> page cache pages mapped into at least one process's address space and
> "orange" the rest of the page cache.
>
> Then I reproduced it with a synthetic HNSW-like query script in python,
> and later with fio alone, on 7.2.10-200.fc44.aarch64, 7.2.14, 7.2.14
> with the MGLRU-FG v4 series [3][4], and on mainline v7.3-rc7.

The missing piece here is refault distance. Both MGLRU and CLRU ignore
hotness on eviction for vma_has_recency() =3D=3D false case, however, CLRU
still has refault distance protection, while MGLRU doesn't.

I observed a similar issue, which disappeared after we added refault
distance for MGLRU.

There is an early version of FG that have it:
https://lore.kernel.org/linux-mm/20260502-mglru-fg-v1-0-913619b014d9@tencen=
t.com/

See this patch, it too long so I have to split it out and dropped it
for later version:
https://lore.kernel.org/linux-mm/20260502-mglru-fg-v1-30-913619b014d9@tence=
nt.com/

This code snip:
+ /* Set refault as active. */
+ if (distance < total / 2) {
+ folio_set_active(folio);

I may change it to something like
folio_set_lru_refs(LRU_REFS_WORKINGSET) later for non in-fault case
cause this kind of break FG for other cases.

That way, even a random folio will be put to the head directly instead
of keep thrasing on tail. And placing on head or newer gen will trigger agi=
ng.

I think I got the problem right? I'll run your benchmark too a bit
later, still tweaking it for some other issues. The refault distance
part needs some rebasing and tweaking as it will have chemical
reactions with many other MGLRU components and it may not work as
expected yet (I also need to use it for an MRU fallback, because, in
theory a pure random case may benifit more from fallback to MRU
stragegy, but your case is a hybrid of hot random and cold non-random,
so a bit tricky to get it right)...

(And we may also loose lru_gen_in_fault for refault case? Not sure...)

But I think we are getting there :), and your report is a really nice case!
