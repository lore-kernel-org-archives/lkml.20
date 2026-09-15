Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF902339872
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440644; cv=none; b=Yhn9xPmjspaG4jiwXqz8F21Sgv4SaAeNAO2ynxfAWcpR2xO0cVsoKMJPDGmkHrSIxsxEGwrjdL4/zvOMGTsE+gKzZKVbeu2cSMDM5IajFZsm1TKIjxB84RhQXM5oIEAWD9YNaYjbZ6r4pORFz6NTkdbDdt1wk6C/bcp5Qr6jKIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440644; c=relaxed/simple;
	bh=HOg8zb5hEQNGB2Y2L+KYpsavjAxBVy/llWk4dWXYFJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rcw1txJfCsavahOolQRZ9CkuXZl3NyPNCq03o0gIZHetG9Zg+A8U3ozhjIQ/wUM5v/hwdf61/Uq3mgEM8gBWbqwldLAQQJRA8dRnxhXqE6nvNvMIeqwDbMR4ZgP+7zB9VdEf+VFu87DIF0D+DUoDEXKb+pI7O40BUPDzS4ylWMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMc6xZxX; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMc6xZxX"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8692be1cda4so3366328b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789440642; x=1790045442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opmE15Ezj7D6sPRc2lGbWMcP8W6cvhTlzz53Mdzz0Gc=;
        b=nMc6xZxXVIHsQcPU2XUc7OxzWXRvozDSYstQr6eEnPrSHqWbDyW8HfRnrLd24sRK/+
         3NO9Z9gBHJfR10NH49lUgfFn9/8ttlvGClxpGhtv/oWPk1HcJm1vwpzpoAw/gRfkXRcx
         7fNJHx6t48sIwQVSah5UkIOPl6rEiw6+r6aud9z73foae659yExiJMUlS0aAuMVZDoBY
         sjHSpHI9bYEgM0lFYfzzeTpKO9V1qldvAvMSvuRQY0bzGRfDgDpWiN2z/TfnVFa11g12
         6TEVKjXUwaLuWYU/Vlw7+gIiP9hPJakfGNqqhyqN1ywsOsyhp8w2gdKRHHMjy/RvSNSo
         YFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789440642; x=1790045442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=opmE15Ezj7D6sPRc2lGbWMcP8W6cvhTlzz53Mdzz0Gc=;
        b=zElE3pqLJMpoubxOsXc3Xyn8pvzEHEtKEWWcQf7caDhS0pan8HiXaR73RvFw+p9bQ9
         P+M2FGFexD5t4Tc9Nxasop7jBG9LeA+onuZTnr8AMLso83UD1c0T/Ftza4lBuLqvvTp6
         Nbi3G5JrsqAJRWqyeHDDPPfYNXp2rCljsTiQlLROjqfqNRSv9QXyDssF5CjsSc8QIyhz
         Zpp5QxBACqnj86BlX7W+FQcPZQJC4QVuUqpkMyUuKPvgjImoE9p7Vhpt0pzJ2gkLINRu
         6ebxwYLjtZYc6GuZK8PadHns7Pl9OaOEOR7XOz+ozwQMJS3NfNojb6q2H2prj+4TLXbM
         V5Bg==
X-Forwarded-Encrypted: i=1; AKwUvBwq2GUWKCofLN3MRgHj/cPLqcPUH6RZ+LIlxk/iT+2G6U46mWntWFw71dlBjq1+UkOQtqqA+vZIVwwqmpo=@vger.kernel.org
X-Gm-Message-State: AFuF++nmTV6qa5L1FUlz3ZoBeTgL7OUk9rGmQef3xqiB+SMN/oi/pPEN
	T/IMwafcs+QbWpOfmkB5a6lpOyMQhPw/jNxpGRnfU0cMwCdClkzpIpv1
X-Gm-Gg: AYBFou1BGZkUrVy5laQirSbldXF8IHAs1hivcQocP4Gzm2ji8ByU8mV4gd/DwGFBPHe
	1927RHH5/nKXhUqD/jgokt6s7s897WAVfTBHph2ANfxbmoIc6yMmEbvAYHBQWv6QROqJmrYRk25
	z35+IkrcgAq/MEESNl4FvI8l9d9xkFHXdrdPo+GpjXZ8HaK2MRTBhnkKtleEMHt1djKaMpMoxSl
	EGRaldkoc6hy32wfnd/0tL0uEZGLNL6fTHALdzNrgmOIsM1gWMz/Z+y/vYci6lBk3/0Q2nc9upT
	EUvrZjlt8fJMkgl/MYjFpL5CqwYzLsPZbEEzjZgOvrr/bsQSV/QLse720kD4omUyVxiYE1/uljm
	byEfEzI2JSRV7VY253bBk0VQPJTac9V+POi00qZpNsbVhgOXb+qeH9Ew0YpJscrlr9E2kQ9K5bb
	/c3KSlaO85aquyKtTLM/OxSorWmSX/g0z3rOzNqJhEgx7b21R72HfqgyrarPDQZ0FZMrgbvmYLU
	ihSombOxKSMFZv1uCOcnw4BtzgLli93UmmDYeOy
X-Received: by 2002:a05:6a00:e8e:b0:848:2e3c:9955 with SMTP id d2e1a72fcca58-86f833446f1mr10734859b3a.4.1789440641733;
        Mon, 14 Sep 2026 19:50:41 -0700 (PDT)
Received: from localhost.localdomain (vmi2317699.contaboserver.net. [85.239.239.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a2c1542sm5484353b3a.55.2026.09.14.19.50.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 19:50:41 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	"Barry Song (Xiaomi)" <baohua@kernel.org>,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Wang Lian <wanglian@kylinos.cn>,
	Kunwu Chan <chentao@kylinos.cn>,
	liz2nku@gmail.com,
	xueyuan.chen21@gmail.com
Subject: Re: [RFC PATCH v2] mm: Improve pgdat_balanced() to avoid over-reclamation for higher-order allocation
Date: Tue, 15 Sep 2026 10:50:12 +0800
Message-ID: <20260915025022.2061-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <1abcc4cf-fc84-4dcc-947f-8733df44e625@linux.alibaba.com>
References: <20260422021842.78495-1-baohua@kernel.org> <aejtfpBUu7gNV6Tk@cmpxchg.org> <20260914113353.94964-1-lianux.mm@gmail.com> <1abcc4cf-fc84-4dcc-947f-8733df44e625@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>

Hi Baolin,

Thanks, this gives us a concrete server-side reproducer. We can set up the
fragmented-memory test with one workload requesting THP and another periodically
accessing file folios through fio. We will keep free memory sufficient for
order-0 allocations so that the test isolates fragmentation-driven reclaim,
then measure fio latency and throughput together with kswapd reclaim, kcompactd
activity, direct reclaim/compaction, and THP allocation success.

We previously reproduced the kswapd CPU and reclaim behavior that motivated
Barry's proposal, but we have not yet measured the benefit or possible
regressions of the patch itself. As Johannes pointed out earlier, limiting
high-order reclaim too aggressively can regress sustained or concurrent huge
page requests by moving more work into direct reclaim and compaction. Therefore,
when testing Barry's patch, we would like to cover both the fio interference
case you described and concurrent higher-order allocation pressure.

Let's also wait for Johannes's thoughts, especially on whether bounding
`sc->nr_to_reclaim` should be combined with better accounting of outstanding
higher-order demand. In parallel, we can align the test matrix around:

  - best-effort order-3 network allocations with immediate order-0 fallback
    on phones;
  - order-3 scarcity with sufficient free memory and repeated kswapd wakeups
    on PCs and VMs;
  - fragmented THP allocations competing with file-folio I/O on servers.

We can run the baseline and Barry's patch with the same reclaim, compaction,
allocation-success, CPU, and workload-latency measurements. This should help us
unify the design discussion and avoid optimizing the phone, PC, or server case
at the expense of the others.

Thanks,
Lian

On Tue, 15 Sep 2026 10:30:50 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:

> In such fragmentation scenarios, I don't think we should reclaim a large
> number of file folios, instead we should wake up kcompactd to perform
> defragmentation. So in theory, I prefer Barry's earlier proposal to
> adjust 'sc->nr_to_reclaim' [2]. But let's see what Johannes thinks.
>
> Based on our problem, I think we can setup a simple test scenario: one
> workload tries to allocate THP under fragmentation (and free memory was
> sufficient now), while another fio workload accesses file folios
> periodically. In this scenario, kswapd's reclaim should not affect the
> fio workload's performance.
>
> [2]
> https://lore.kernel.org/all/CAGsJ_4x9vkv2G7d-gANf8kqUJVxQh_P9=AJxr98LFUgQeOTqow@mail.gmail.com/
