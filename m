Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com [209.85.128.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A567E519DFF
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790033240; cv=none; b=llhoa7evy1EhQtiWeeFhGPN1LT5FAcNlSWJrcNmdwajhCK6pEut+POARdscN5NdP14Qbr4B6gye8z9wmkoObg15meHsKJCfUCPd6n0qPt6Wzx3g9MZb2CD+UL6zFgKzZU8XygnawWYE/WYPUWpMNpa4ohyS6IFi4yfvH1fLstSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790033240; c=relaxed/simple;
	bh=czAjCe0E3xr4magWMxN1T8TeMonrHLztf0yCazp8M9s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dMCgy06j128YVmYPwRkxpQuGgsAn0mwbJY6winPBe7uo2dA4NN1w81fA2mlaasEJGcRxiMUlf6uKORil+5qu/5m7/hEbOOUbCOwe6WTqh4naRjL1hI+rPtZUwddn1h9QgE8VRTgfkKC2BTtZhPMR4ezyI/BSW7/hXe1sA3Lq7lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=everpuredata.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=d6qnj8vU; arc=none smtp.client-ip=209.85.128.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="d6qnj8vU"
Received: by mail-wm1-f100.google.com with SMTP id 5b1f17b1804b1-49e79690442so24122785e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1790033224; x=1790638024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=va/vFiItRvpug1hTbx6eo1iSM5BSyMyaF3MlvXV7MJM=;
        b=d6qnj8vUV4D1RWvwV4t7gV5M2Mz5amFyFmurtEIzTmrmzKyooGqwzcCz/yGllTDeiV
         eJiQHtI96RuEHXkmdIpJ9L3/HIC+Vjn+hNML8LBm0Al0fvmEGca4VKhj63uaE7nhcAAU
         Y0fgQftURw9n1KpgXA9+hEJZ3qCRH+9qhHGG0pbYdaL7Hpb2db3pOfbKPY1QDlGeeZzS
         9sb96Gg15c/XTV49cog7anpziMlejEJapciA7Hf9wBlu6wWo9YvNmnBuZRyuFilbM8df
         bOX+/Ud1eTdjFwM/Lm/nTe8xs6aQGLKtLrCUMwu6Wlc4U8TM8FM1D7eupFeu5lmfEWx0
         v2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790033224; x=1790638024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=va/vFiItRvpug1hTbx6eo1iSM5BSyMyaF3MlvXV7MJM=;
        b=qosDUqG+uG+wD9V3w8sMFp4KZ6VzYQFeB48aOgGXQgj8qJV9msPNRNMZiZXYXd71fF
         NK6aCHS+bZfcoQF5SzhIC84kapKfmsCdOGT/T9Uipwy7yd3pljqFlSZx5r0kNj3GHIlk
         9P48z3Ru/m0sZjuoUXz9S8t6/N1mo2YmUU+zNsqBsvx9GOEpkVCCJaHIydp7+qSh5BX1
         ZHiD2X1Ms/PS7jersRtYZ0BDkqpSE6S2nvAx30vpTNHWSlDzJkrrqE/Zn9m+6HvK0H6L
         xhD7yee/uSWYMcVK1p9SoW5iHjHXYQJUf2TPTC9PHS4TS8o735EzIvJOq9mSiGsaLMtk
         KoDw==
X-Forwarded-Encrypted: i=1; AKwUvBwjmLqNTjlQcpNOJoX5aN4K3dSE9D3AdbKEVOmKWvGF5sUpiyAJO6Z7/cm98YOl8A3F4q2LZHJfz465UKQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kjVjz9t804fA/h0wYXomPzWlzXlLOep9kCL0Sv6t5US5F17YiY
	r+0DeUQtQzc4F8hCKfy6yGrcxVkFig/2lUyZ6JBkgL5VE74WnnM1Q7owZm22dDIFHbD05WH1oZL
	MLqQubyZmCiY/p3928Eg96yhm5Hnujg6FTVKH
X-Gm-Gg: AYBFou0GbgDQ9fDH1aJ/ZIiuHAjrll9MsLMy4hipXLxFm+dU5Rfg1vIQIoyn7b8VkDa
	p3toJ8+nd/mDMIx6uRkMH+eUrX84B8z0iGodsYaHsQb9Txxzuc3iQoFFLi15WZr/7IpeVJpALyh
	8OBc0O6EtEMrnM054SUdE7+NHsY2ICJpgECam+pW0KGivKS5Pcvpv8pAbL0l3RLoNsadxPWzwbA
	DzQzmbhbnVnFQOaBNv6XOM2USlir9l+MhIbIZ5TclwCGRVhyhJ9F2aOHJUHa0gFV2nippm1S6e2
	Z5waHYimeSFPRKwnIUeyc9+aNVChyeI62cfJ9+DdUqpb14m+dmj1K2tvtsW3G5zhh2ZYhquHLGE
	wFPUBeHmmNy5pwdIwVL1OG/U02Ma1aLUsRhcgNhM=
X-Received: by 2002:a05:600c:a085:b0:49d:25b0:cc60 with SMTP id 5b1f17b1804b1-49fc5747f7bmr184458765e9.29.1790033224386;
        Mon, 21 Sep 2026 16:27:04 -0700 (PDT)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.129])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-49fd8a7d9dcsm4178095e9.6.2026.09.21.16.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:27:04 -0700 (PDT)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id A366F3417FF;
	Mon, 21 Sep 2026 16:27:02 -0700 (PDT)
From: Tim Menninger <tmenninger@everpuredata.com>
To: Harry Yoo <harry@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-mm@kvack.org,
	Chuck Lever <cel@kernel.org>,
	linux-nfs@vger.kernel.org,
	Jon Curley <jcurley@everpuredata.com>,
	Eric Badger <ebadger@everpuredata.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [SLUB] nfs_page cmpxchg_double_fail and perf lock perturbation on dual-socket NFS/RDMA
Date: Mon, 21 Sep 2026 23:27:02 +0000
Message-Id: <20260921232702.486161-1-tmenninger@everpuredata.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <arFNKeseUHBvdRCA@thinkstation>
References: <arFNKeseUHBvdRCA@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Did any of that change with slab_nomerge?

No. The large change in the SLUB counters still reproduced with
slab_nomerge when using perf lock record. For example:

                         uninstrumented       perf lock record
    unpinned/node0
      free_fastpath          75,366,487          646,378,908
      free_slowpath          41,594,255          259,704,037

    node0/node0
      free_fastpath         119,705,541          440,896,371
      free_slowpath               6,344            6,679,339

    unpinned/balanced
      free_fastpath          59,404,047          384,715,890
      free_slowpath          60,602,379          324,936,304

> ... unless perf lock was writing data to an NFS filesystem?

It was not. The perf data file was on the local root filesystem:

    $ df -T linux-mm/
    Filesystem                        Type
    /dev/mapper/ubuntu--vg-ubuntu--lv ext4

> You can use the BPF version of perf lock to check lock contention like
> below. (it only work with 'contention' subcommand.)
>
> $ sudo perf lock con -ab sleep 10
>
> or
>
> $ sudo perf lock con -ab -E 5 sleep 10

I reran the three placement cases using the BPF version, aggregating
by lock address:

    sudo perf lock con -abl -E 5 -- sleep 10

I ran only perf lock and mpstat concurrently.

The BPF version is substantially less disruptive. Comparing adjacent
10-second uninstrumented and instrumented windows:

                         uninstrumented       BPF perf lock

    unpinned/node0
      throughput            45.5 GB/s             43-44 GB/s
      free_fastpath          76,217,260        118,511,381
      free_slowpath          39,962,005         22,717,811
      cmpxchg_double_fail         9,299              9,587
      system idle               22.74%             10.61%

    node0/node0
      throughput            46.5 GB/s             46.5 GB/s
      free_fastpath         119,739,790        148,686,356
      free_slowpath               5,686              8,791
      cmpxchg_double_fail         1,483              3,170
      system idle               83.33%             82.42%

    unpinned/balanced
      throughput            46.5 GB/s             46.5 GB/s
      free_fastpath          59,341,738         92,824,030
      free_slowpath          60,000,396         60,658,896
      cmpxchg_double_fail         1,742             23,772
      system idle               68.27%             50.03%

The per-lock-address BPF results are also quite different from the
perf lock record results:

    unpinned/node0:
      contended    total wait    avg wait     address
      8,345,025     12.27 min     88.23 us    ff3ad60e50e85100

    node0/node0:
      contended    total wait    avg wait     address
      6,461,976     30.70 sec      4.75 us    ff3ad58ecf36ac80

    unpinned/balanced:
      contended    total wait    avg wait     address
      6,592,568      6.50 min     59.18 us    ff3ad60e50e85100
        143,397    666.98 ms       4.65 us    ff3ad58ecf36ac80

perf identifies these as kmem_cache_node spinlocks.
