Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794932915;
	b=KX9Vx/xcdyc2xQbBHDXmkf2EEHb49Z0iShtCl597NJCQItKpXZgFMO0kUYx+37fShns5
	 WGN0cmFoeNUbvyoGnLpLuvzGRCmmmEwuYv+VirvFT+9Fud4cG2Qv4bEmBwcyucrregJyY
	 sNTTvU+CvHZmX6cLYnOB0j22y0Yr/Cf1lDn2ORC54sZQ3r4/+wFVhSErKQW9IxB24XFOl
	 /LW4tMo2ZWKbEjXOHbbTCLWDzrQ85YgEzUoVjqh6hcPcWI92mQGus0VZv2/pWZOAFwwjT
	 R/dXf1RIs6VFF2x5icmvYjFPlHIwtDXx/BNSg33fJu6fMq4bMW5Ojh+29JM5qhlfufg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=kYRKqypZGpF5DQTuLNtjlb+FmX8c92duuQBB1ElK0Kk=;
	b=dIV022tB0ibC4oyzb2FA9FnPo+zDztTNcKorTvDFX7N9sdgKn9ElZXaOXqri/yojOHc9
	 hIay3W97BXiHKSWauCbTr3EkyUEAnJFDHPVK6Ns+FK7bxRpqZhIZbes2SntaHvgtQG0LB
	 W3N6tskWyZxJE/gvWwpdoag4jGQxXDNX65syMzVvN2v1f3HGUWC+xTyCS1bhXNgk8R66V
	 Nwv28WdEFDwFp8hGJq5jqbASYhN7FG3j7PNRAMi0ByZ6URng8PkPdmJ/vZZuRcoxxrO2/
	 J7QOr2MdU5uS2EC9VmOQ8bgJB6Y4nDXCt9tt/rp+7HVptpeWXfaPVsWXJ7hRFiUpWow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfP0xof6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091AE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 091AE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfP0xof6
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso779648266b.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:28:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794932913; cv=none;
        d=google.com; s=arc-20260327;
        b=FfUHX50XUjFCr0UcJUePoVUjt60h5IZOwtmDB9CFknpDJtuWYTnZFpm35JjiSQV2Sd
         QJ3+oYytxfyjcFj64lwBpx6S0qNnOCCat65pvQjMbMfKnRaDvCE6B+cfFkZ1D/eezQfX
         2FlUW42WjQdFVr6wbcU7YKPbrdQZC/yExqsCvWjUPgMek4pFIwFvNiNfAanbtd/wEbXz
         CMOhlwa8FhAplEpdzock4XZsdNfzbiogW4lnfhoZYATNUYt72qQpn6bUC9S43Pfvooia
         pTuq6Ppa9BkJVTasicH9UMwnJVV/zTy6V+QfZ+tCz2UDJJ1hr03FNEH1EEBR43MXUFeQ
         R2hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kYRKqypZGpF5DQTuLNtjlb+FmX8c92duuQBB1ElK0Kk=;
        fh=/JSV/0/2fkQDBfMHGQSCTg9aGcZ09+R0wktc6iK/NvY=;
        b=cEzvEypQgMprHd+WxhTP1ih+LH38jwxUfd5sBUf6tzKqMfBwFfRR+VntcFRdGCpWJb
         8tBq0tnzsR+9B5wMoB3cf7a49BunhbbDAA3poLehzBRg1dyCGF5p4c7EfqgOb1vAGf/l
         1t0hS8ZaewDBBQZYZS4irL51un/CfHNRwjHEeInMVhidb87BCIhfDFSgO1akckdUXIZG
         WggNef+t4qT520gMQiMOmbNcI4W9Y3uvVAtUCtbFmketbanK067WJ5MA5/HRMVyfK0tw
         eKzs7kXpX9yXNOaGE3fpblchcetWOy/9skydFV6cFY04wqa88yBHaFYBV8Ai7kvzmldG
         l0xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794932913; x=1795537713; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYRKqypZGpF5DQTuLNtjlb+FmX8c92duuQBB1ElK0Kk=;
        b=OfP0xof6YK1asdxfrUD1dG50FS9bJu/Z8/BgcIjXyE+nTDbwrhOGy/+JenF4o8eIZQ
         Lafawl9ujymTC11OiT+vBBCmEH1TBi7zTpT+nCQlCje3gdPNWR3qwbUWvUxXO2CXhi0s
         L530dg1ysXVgze9DuGgJZ0wAucGSIf2J4Tlp3bOMnpUNS7OYfV+CwMwdZkz9EIqaGkHA
         r48JfDi0PWp+4kG66s4SG7ANuCb9mENiih6GGrDbJRbs1BMrytt6GwNHHNM39k9cNJa4
         fkNXFp8DS3mfmei4kZT8C6w8GSd4H2FmRNjphYxbONpO/SYRfwl5QTz6H5BX1NxaFs63
         SCHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794932913; x=1795537713;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kYRKqypZGpF5DQTuLNtjlb+FmX8c92duuQBB1ElK0Kk=;
        b=z2vlAsgQVyIpf0PQEEGtfoQlpUbX/n6WZZNjA5z0cq5j4nMswIjtIuTNkLYpXmapAY
         HoKgWCpsz2/ME1FWw6ywmw1MWfhMGlHMalNfBteFuJjRcLhbhk0tTNEHMCbEdgBUzYrx
         upy3By6sGlxLhlVo1QHfKq9mbrx7tmbPHZdZmkIQAzcmQjDsI19abkcHBDRTcJrQ0SE9
         UWOqeCBO/OnBqOAIedusekUvzMApAC4nzgHfgj3wMDw3Ctd9vvt/3CbwYRIMAF1gg0x2
         P0mygJq48568JnVqL8GU/OMia5BbkTTg+f0KngC/xYiFB9xdIZf+AdfI2ZNY/qHWHJ/t
         NUFw==
X-Forwarded-Encrypted: i=1; AL+hErFovArrauW+OAKPrC1AOFiTEju+6uYR5vdxJgo3OmO9Z2yXxty9mm7tQkjDPXcIyNhi/Uk+xi8odZ16TlI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pyfkDqrtoRySCghX44xdJAEY9uHuCnvHVqxuzI2z3koYH8K2F
	Gp3W3i8l/n79YI/I11wHN9hwPiyFwrPgkobaMWYYt+S3sUD2c3jgpt7/ott0tPjDscBIikRlPd7
	mCquqJjw5SbevhzbrAwto3QCttte2+M4=
X-Gm-Gg: AYBFou1hlEy5MhgHLrVpxTDOioiWMXcMXxOJVIhxDriuFsc9QkUNv6ygUQi+HXHDHjX
	3bsFoQxsfXg0L+k7lC5uG/bECJu6Vomp1K+NsfP6lCXCBO4PIb7jYOHiAkYf9QWpLACt0vlLm5v
	7kFuv87+Xqb/6aB4VjAMgMmTsFQr8c5RtAJdIrmQmtbJabJlbUqEIZOlxcc+AqKIXAgwQwY2qnG
	p3Gw8OsMfNVN8b+9wCGwqbP0O0vS0Uu6SmLrlNB8P38s4g/Yrj76r9AZlOqTI7tTXby24jTGPRd
	rgmH+yxvT4R7uYGUgMa51+d56McQtvkuY3h7qL+YrxETkuIJDptrASyrel8q9IkZBPbfzvGhKFb
	DuOpsOykCZ7QEUuZmjbi+aOVDx0BGss2JQheBw0WQTlxp+GJyOR2PtmupeLn8Slgh1Xe6Mw==
X-Received: by 2002:a17:907:3d05:b0:c41:8e21:4d5a with SMTP id
 a640c23a62f3a-c5096110e80mr1270381766b.5.1794932908726; Tue, 17 Nov 2026
 08:28:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116110122.309748-1-nakixii@gmail.com>
In-Reply-To: <20261116110122.309748-1-nakixii@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 18 Nov 2026 00:27:51 +0800
X-Gm-Features: AclHuK8jFoB078UJjX-4oMtgMSTNWJhLa3LQu5nrN5DX53PjZ0PRScBUeflPjVU
Message-ID: <CAMgjq7B=F7grQqhUP1wGPG5uYHL44QNS023Lg4Zw0ycQEr_C0A@mail.gmail.com>
Subject: Re: [RFC PATCH 00/16] mm: add in-memory compression of reclaimed pages
To: nakixii <nakixii@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Yosry Ahmed <yosry@kernel.org>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Barry Song <baohua@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Mike Rapoport <rppt@kernel.org>, Peter Xu <peterx@redhat.com>, 
	Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi nakixii,

Thanks for sharing this, I do like new ideas on memory compression /
eviction :-D. However, this approach is wrong in many ways.

Posting a mega-sized chunk of LLM generated unreviewable code is not
helpful for anyone. And it's based on a rather old kernel, considering the
parts you are trying to work on have changed significantly since then.
It also lacks a convincing realistic workload, e.g. almost nothing is
measured under sustained memory pressure.

I think you can start by describing the problem and goal clearly instead.

> This is a proof of concept, posted to ask whether the approach is worth
> pursuing. It is not meant for merging. The series is based on Linux
> 6.12.23, not on mm-unstable, and has not been ported to the swap-table
> and zpool changes that have landed since. If there is interest, the
> next version will be rebased onto mm-unstable.

But anyway I took a look at the series (also with help of LLM :P),
IIUC, the main goal is to cut down the intermediate layers for better
swap performance.

Then basing on 6.12 is a bad start, those updates you ignored already
achieved that, or are focusing on and getting close: Zpool layer is
removed; Swap table & cluster allocator removed the Xarray layer and
multiple synchronization layers and reduced contention and overhead;
we are also flattening the zsmalloc handlers, and many more are being
done step by step. You can check recent git log and upstream mails for
the updates on these parts.

So in mainline, the win you measured is no longer there.

I asked an AI agent to try this out yesterday and it reported this today
(256M anon, all paged out, 20k random single page faults, page-cluster=0,
best of 3, canary filtered, same compressor on both sides):

                        pageout us/page   p50        p99
  6.12.23 memcomp lz4         1.11        0.96 us     1.63 us
  6.12.23 zram lz4            1.31        1.13 us     7.75 us
  7.4-rc1  zram lz4           1.13        1.04 us     2.42 us

  6.12.23 memcomp zstd        4.15        2.42 us     3.21 us
  7.4-rc1  zram zstd          4.92        2.63 us     4.08 us
  7.4-rc1  zswap zstd         4.89        2.58 us     4.04 us

Against a 6.12 baseline your point reproduces (7.75 -> 1.63 us). But for
mainline the p50 / avg are close to identical, and the p99 is only 26-33%
better instead of the 2x you measured; considering the ongoing
optimizations I'm pretty sure mainline will bypass that without bloating
up the LOC, or while reducing it.

And I think there is a major misunderstanding here: you didn't bypass
swap, you just re-invented it. And there is no "direct memorey
compression", everything goes through a page fault, unless you have
some fancy hardware support like CRAM.

So TLDR: the 46K LOC for an ambiguous performance gain is really not a
good idea, it is basically a poorman's reimplementation of swap with many
essential parts stripped to be fast (broken OOM handling, no cgroup
control, many statistics and counters missing), and still not really
fast. So don't reinvent wheels.

One thing to keep though: patch 1 (UFFDIO_MOVE exclusivity) seem
valid? And it has a Fixes tag, so please double check and send
it on its own and maybe we can review it :-)

Anyway, still thanks for sharing this - a good reminder that everyone is
chasing every nanosecond of swap performance :).

Thanks.
