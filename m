Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3143ED5DA
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896728; cv=none; b=dVomCZwvlPG00cl6Ff1fLp3ynurEakVlvYkqiHE1Hmet/oDWxyzOw9L3CcxHhA/nInCPiTfGwqf4lEFbJEfbZz2HQEsx4Dpt2ZkRMkCBrJOLaW0hpuWEzljOHQSPYoFJp3uL45GcMQ4CH06946LLUsqGa2Lw18eQLoKqnGaxg1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896728; c=relaxed/simple;
	bh=L0EmNB+T24JPK5ArViBPd9yjY6LfiTkUU+W0mIolNpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KI9VzK95KZZv9oCwZwmrd8ZKjdYjAM48VWd4HJ/8S08Ha6NkIR+4zr8mT1KZqTcNpAG49/jNwLabH069nq+6hsvgHRwaPi0sjoDG+e0X7A5Gm+XtqXgP37QJQcApXDR5EJy/zthslc4sabLpMGtOsvKJvf8QX94Axnlax9CpexU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSufOInx; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSufOInx"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso2082578a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789896719; x=1790501519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8atFdaYK5/9ZUhclkm6dEsdH9+hosS1PWpgu4tx2p6E=;
        b=iSufOInxLt+iwEUhz4JtVDNUaUggir4n5uKEdv2XQI37KKfxfD+HDjkIlUpyYVB30v
         32UlBCEeAHNOSaBG/YM/3s6FwrRDiX0Nxt4X88rak+culj+pYuedjmKbSi6Uv5VO1hF2
         lOmHEoZmoaZ6Qsl2BmrUHJZ1fe6NAD9C4YG8iGxwTKUzlBIjJ/k5h4FEqu+xVZCrtOEZ
         qZV+YjWTHoafqy88xN2UVN8ihDD5BnTQvMn+F3VUuzetEe/P9JsYhmylKPMOxs8DKYC7
         C/Zeupqcs2syepLtecRWRIUvSI/sTufAx59d02E7PPurHNTsq0eo0UG0lIx9JbTwS2H6
         j4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896719; x=1790501519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8atFdaYK5/9ZUhclkm6dEsdH9+hosS1PWpgu4tx2p6E=;
        b=RWU5RV+yRAnJnOsIA01IlKGU7FwAZl0sykSWKXzy8F9mlHZuPpCzEmcmTD//v0BCnA
         QTT0ZS+0RpO7g6QsiipQA+2yIiaded63/ygrPZ9bgeGWbH0ZmAe7YtX3etbi0sv8kRYz
         fbTI/FcQDFV94CsA0WVVxE8zdQ6T5NspPLdRjKMGv3q6ikrzCa7eqAFG1kOii7vAYU9t
         hDFD9WpJeo2Aa3p8lAZxQcnJCqvL2Dmb6FLX3xL2D9S93F5jx1mX9revhosJGuuIQ58E
         94TMLl2MPmDzmGeIXpX8W89a/aZmpV3Toq4ZA5IQ85JJgaBFWH0ESKs+tqvCOGz6H2gb
         7EdA==
X-Forwarded-Encrypted: i=1; AKwUvBzlKhN0T6bCSW/I5HbfrN8m5o/Vp0f4mcYaANzYoLd4dLTUJbHC+TOufNrucWkmEBKBtrL0fsaEl6miMVs=@vger.kernel.org
X-Gm-Message-State: AFuF++mHnu5p7MovrKd7SnCOhv9woIkkBj9YIF/1Jsork/KLxrK8quN0
	0S33VbYYIIC96BHj20Mofb7fQWwKiEsPpljot3p9u2945stY1LxzRvo=
X-Gm-Gg: AYBFou07gjqv/mvv09ndwvNN9cMfWrp3x7ycns1smjPFQjva1Y21WfJM0hjR0DCMJ2d
	HES0vi2K3VRTzj71wxv1//fKfj+W6fFkiAMjXGwx6fRJuCX2Anjjaj4r/r1znVrxcP2LxbWdgpu
	Et9l8cmxWJrQVtSrztmGDUU1HF23dc28vVAbmVFrDivol1jgobhQE1hRxSRgQFDLnbGb0O7HyHY
	6GiSuJOJu2wz1mz2T1lClb16sk1qRLGdmw88WS1B0gR/g0XAZoQH0vSyW/aeiWJ/3hP5+ACdDLP
	ItoWrZSLs+Nf973ayy3vcf6bUs7QXuQkgw2Je3ciFU7UxBwWFX/pH7VK1AZvu86KOYjCbawyoic
	8p3TPN/Ypd12Hdx4UcUYyBOh5Q9AHQ9Ted+pcT3YBb2B1ukc9A5C9dEdUUPU1gOTN8otceoTyLA
	iCOTKiCKQ/gs3GX46PJcubyEY+oMemdL2zpg6Ot3Pg+emDTFNP91cKeEXmxA4zk5NjZrfI+IqjN
	syyEtYwhMr2b1qhnfAXWfaorHk8+3y8ZQ0HylU=
X-Received: by 2002:a17:90a:4cc7:b0:3a0:22bd:6ef0 with SMTP id 98e67ed59e1d1-3a022bd85efmr3299579a91.30.1789896719162;
        Sun, 20 Sep 2026 02:31:59 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:e0d6:4b87:c472:c9ae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6fb75539sm8093503a91.3.2026.09.20.02.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:31:58 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH bpf 0/2] bpf: fix per-cpu initialization of a BPF_F_CPU created hash element
Date: Sun, 20 Sep 2026 18:31:51 +0900
Message-ID: <20260920093153.439743-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A BPF_F_CPU update that creates a [lru_]percpu_hash element writes the
named CPU's slot and leaves the others holding the values of whatever
element was recycled into it, so a lookup of the new key returns a
deleted key's per-cpu values.

Patch 1 zero-fills the other CPUs.  Patch 2 adds the selftest: the
existing cpu_flag subtests always prime a key with BPF_F_ALL_CPUS
first, so the element always exists by the time the flag is used and
the create path is not covered today.

Tested on x86_64 under QEMU/KVM, 4 vCPUs, on bpf/master a11212910cf0,
configured from the selftests' own fragments (config, config.vm,
config.x86_64):

  test_progs -t percpu_alloc,map_init,htab_update,htab_mem,for_each,
    map_kptr,map_ptr,map_in_map,lru_bug,map_lookup_percpu_elem,
    map_percpu_stats,batch_map_ops,htab_reuse,timer,task_work

  without patch 1   31/112 PASSED, 0 SKIPPED, 1/3 FAILED
  with patch 1      32/115 PASSED, 0 SKIPPED, 0/0 FAILED

The three failures are the new subtests, one per allocation mode:

  #304/18  percpu_alloc/cpu_flag_create_percpu_hash:FAIL
  #304/19  percpu_alloc/cpu_flag_create_percpu_hash_malloc:FAIL
  #304/20  percpu_alloc/cpu_flag_create_lru_percpu_hash:FAIL
  test_percpu_map_cpu_flag_create:FAIL:value on specified cpu
    unexpected value on specified cpu: actual 3735929054 != expected 0

3735929054 is 0xdeadc0de, the value the deleted key left behind.  The
BPF_F_NO_PREALLOC case reproduces as reliably as the preallocated ones:
five runs of each arm, five failures without the patch and five passes
with it.

Donggeun Yoo (2):
  bpf: Zero-fill other CPUs when BPF_F_CPU creates a per-cpu hash
    element
  selftests/bpf: Test per-cpu initialization of a BPF_F_CPU created
    element

 kernel/bpf/hashtab.c                          |  6 +-
 .../selftests/bpf/prog_tests/percpu_alloc.c   | 74 +++++++++++++++++++
 2 files changed, 77 insertions(+), 3 deletions(-)

-- 
2.53.0

