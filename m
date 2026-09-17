Received: from mail-ed1-f97.google.com (mail-ed1-f97.google.com [209.85.208.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C295AA67B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789662338; cv=none; b=bcmxhn2qOlVGVuFEW5HgyYJ9LWiXy6H7oD24UeC+HaVNDmofjns3RM4OTLHlHKqPLr4GB1Z19DVBLdzCxm1pMDBc64F+5pQRxsLkLgD5LScpuPoymYjozPwn6623EOyjtV75x6A7kwPrZcEZCYkgoM7OM713mtEf2KXn68G2z/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789662338; c=relaxed/simple;
	bh=rtvmHSWXSmxkuH2d1GtpV9D/iH6hOVoLVjJ/X0LT4VU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kaCDiQIznXIoHGr+bJzQ1GDb7Y8UBblgY9XJE+GPgSrGcn88Hux/r9e8zJ4u0obsPij6aDYz6jLciU2Gxb3uglw4+hhBon7T3QfgLq5W/oDlbjnsTd0N1IX/rgo4ZhGlX++VHPOi47CDMF0mfw7lTjROkySHjFtP4NYPWOeBODA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=everpuredata.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=rc2gdHiX; arc=none smtp.client-ip=209.85.208.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="rc2gdHiX"
Received: by mail-ed1-f97.google.com with SMTP id 4fb4d7f45d1cf-6a9bd4db6ccso346800a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1789662335; x=1790267135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cI+xjeNHVNst3t+SGlRsF85lt+goiabsbiUNU03nAKw=;
        b=rc2gdHiXG4kPrPnZgypirmqXT1nL4csf38j8bCQRkSOXcFYvWHfcmvpsfwvpE0TvAu
         eSiyLspLJKF8dPj1SLT+SPQHqqUmRYthPb5aVVo3bCr3PSR4foQbbCuCdzryl3AhDluW
         uDziRHpEWKlm3yIGJfHd4YvA4fMjvk8rSJnNe68lUxo8fNQBhVeMet0vD83DxU1dPNMF
         tfX2wDujjO5CDwd5uEH5aq3BklBmPh1v+c0ormFfRhN65hIDjbkiLPZMnxt1rOpsPW0R
         DRNUNL7buAGH+XTD/nO88Jvk61QwIa+TFTvgcjbBRkOWVs+V8veoNLr3LodiV97m8O2F
         harA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662335; x=1790267135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cI+xjeNHVNst3t+SGlRsF85lt+goiabsbiUNU03nAKw=;
        b=K1FIHdyiAUZVHI9UN18uiSuvOZ7HMI7h6ZJJ6gQk5/6FSVjjPdXU9e9pkKvxBNRKRY
         TPZbhKuolW3K0yHcQeB9cDjZ3+55oJuovu1XOR4jrolPAgNLRh2kWRMB/3FamJagCE48
         TyJdUgNuAnzCk+DNwktW94BUkIMQFW5VNoyblEvgdLaahQSaAeYC3RPkSqwIlHtbWu0n
         IwinLDg+MZpVkc6iMu8QDuhmlgcaN3BYJsLIZnZN8GHJJbyizxJKi1E9pzxzLU58Rll8
         RrWaqiMb+gG+6eHUqMX6HR6ffYxFeoHla/ajbOCdZMmwo4OsszpJHSsan7H2TZb2vfC2
         NXwQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOefRNl/PqgNU5DbHO6W90STxyzKaxjK7OyLoZjfi1e9ZcbeLPykjGilREXbyzxf93Huwo1HPrXK1a/rM=@vger.kernel.org
X-Gm-Message-State: AFuF++kGnKoMjWqU1OdOK7d+dJh3ZZ8rcjLZMxUzBktJEADAEOqenaqR
	4ZinHx6b5qXCVEbvvhC6NdtRQRjDkE9Zw0zdLJX249ZypJZknaNMH2YCf3VRlYLX4ACMejZuI5H
	cJefVn0mD1XUx66fkOSxFWdCki+af5XC6qE6+
X-Gm-Gg: AYBFou1FsRsX/4xx1k4r5BVtUxjN+CXmKQdFIL84hz6gfrtRXG9B8fy94c2eqOt8tUI
	T7a0ptynWzAsJkAdLHvYG9IGLHsFm9y0ip1ZxFXSrw6vLW+1U+UppAtGOmfEw9C9tKKlVMBJ+4f
	qIvA7W5OuV0tQvlMtoGGSroZoXwXF4TK58DfzC3m67kZSvaPSxPNgtXwBjGluSqYPEl71Of1KCr
	LVT7OKvyrYA7HYpYjGkcgwvD0y1AVoQTZQkLnWIQ2MI/99jGdCPwcnx88PB4UG4gkVswgOpWvYi
	nHEN4YX7K3JVvYY9Yw8egaOPtTpXmfEG/vT4KKRDyh8MgTirlCo3AKgwtC24pTbDPDG/zMQ2SlB
	k3OZIaGMzgxAJ+JCXZO4XmfTSdN2oSmbIXb17LFk=
X-Received: by 2002:a05:6402:24d4:b0:6a7:ee54:f897 with SMTP id 4fb4d7f45d1cf-6aa2244349emr4232275a12.27.1789662334673;
        Thu, 17 Sep 2026 09:25:34 -0700 (PDT)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.128])
        by smtp-relay.gmail.com with ESMTPS id 4fb4d7f45d1cf-6aa1cf65559sm2670116a12.0.2026.09.17.09.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 09:25:34 -0700 (PDT)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 1A53034014B;
	Thu, 17 Sep 2026 09:25:33 -0700 (PDT)
From: Tim Menninger <tmenninger@everpuredata.com>
To: Harry Yoo <harry@kernel.org>
Cc: linux-mm@kvack.org,
	Chuck Lever <cel@kernel.org>,
	linux-nfs@vger.kernel.org,
	Jon Curley <jcurley@everpuredata.com>,
	Eric Badger <ebadger@everpuredata.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [SLUB] nfs_page cmpxchg_double_fail and perf lock perturbation on dual-socket NFS/RDMA
Date: Thu, 17 Sep 2026 16:25:33 +0000
Message-Id: <20260917162533.600472-1-tmenninger@everpuredata.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aqvy8NqRRRmUlxjR@thinkstation>
References: <aqvy8NqRRRmUlxjR@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It reproduces with slab_nomerge.

I booted the same kernel with:

    $ cat /proc/cmdline
    ... slab_nomerge ...

Uninstrumented throughput remains in the high-45 to low-46 GB/s
range, as before. During perf lock it was around 30 GB/s in these
runs, versus roughly 25 GB/s previously.

The dominant lock measurements are essentially unchanged:

                         default             slab_nomerge
    unpinned/node0
      contentions        4,782,839             4,858,759
      total wait          14.39 min             14.26 min
      average wait       180.47 us             176.13 us

    node0/node0
      contentions        4,582,012             4,686,729
      total wait          14.13 min             14.34 min
      average wait       185.05 us             183.53 us

    unpinned/balanced
      contentions        4,572,196             4,544,677
      total wait          12.81 min             12.56 min
      average wait       168.14 us             165.84 us

The uninstrumented cmpxchg_double_fail deltas were:

                         default     slab_nomerge
    unpinned/node0          7,471          8,892
    node0/node0               713            457
    unpinned/balanced       1,503          1,504

The CPU-utilization change while perf lock is active also remains.
System-wide %idle for uninstrumented/instrumented windows was:

                           default                  slab_nomerge
                       uninstr.   instr.         uninstr.   instr.
    unpinned/node0      31.46%    3.60%           23.02%    2.15%
    node0/node0         84.26%   12.07%           84.62%   11.85%
    unpinned/balanced   66.86%   14.83%           66.58%   14.78%

Thanks,
Tim
