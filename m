Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB9641687B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385653; cv=none; b=q23Vv4IFxRq8bb/C5CHAcwDvfK0JMrrLTQBuEz5U866LYJ5Ftbxxs1GwO2TnOc+vTlJkTxEtIFeGdDbuo9gZmMTyk2aU5iAv9O4Mk1otycrCdMf2Ru4p0tLsK2xF0H4QkGKdzE6DvH70OshqNDERYCjnu208ISK9vu61xFGpSuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385653; c=relaxed/simple;
	bh=6rHqfPRVXM+LLp3unhH8dg3JH3eqPv3ym+pu/Fv2+VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AHOW/hCSHt7QafssoW00kfdZa6kOtHv9VyAINjt5+LtmLBDhWS0fIQFFJaBYZ2BrXqOITDmaWt0IPTfaLA8hbF/ltaDO/bNa6ylh0J1ekDVB4f3MYUDK0ilSVNvZPh3QViP3nM1L02ZpGWZhtu5ymPGV1MDbE0Sx2Am7MyO/FYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8NkRWWc; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8NkRWWc"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f0135fso16360205ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789385651; x=1789990451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zluWgUEfiwqdpafmPuw47cpG+Z5oAjBePu1fe1afIYk=;
        b=K8NkRWWcBbcJ5fXLQmVgLxj0C1P8anNZXVq4ZwPn9+kkwWeKxqKpLAjJzuqRGbHZ9j
         8dqObnH/49RTdU3KwSaq44RSiItuTH4vi8luQAYuVR1Efnhjngn52s0d/3yLtHXmyB8L
         y8m02/4GoI9UrSleiaYdalc0X00KlTbtNNU9BjobtV0BC5q0e2d1cY2K6HceW4XKtxBB
         K/edb5RJfhb/BbSjgzLhkqeuhv/zPp4SbcgIBuFJqo96bALvpXjZrQ73sQ+l+NCmn5pJ
         uSBpE/ZRHYsrKc8KhvnU9QvoThRYsUj/ZqV47zvEVntMgPuNQ7QdQwgLBvM40GbkVJ1N
         gxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385651; x=1789990451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zluWgUEfiwqdpafmPuw47cpG+Z5oAjBePu1fe1afIYk=;
        b=tZaih25/NLcqd4j/gVWqt4MOw5e9F8h9Q5tYnciWcya/L1JJsKOnlFQxbBBXaPRTEk
         Q3dTt5DqwPKe4XF9gvgiOZ9s4//ncFe+YCkdKwxEhvszHeXv+SZvHzEZhkCanUMgGrVr
         L5I1uU/elMvmsWrLs4sIkwgYAPZ1zuMVthWlKfjlIFbop7EacKd4LIbSm/FmSaEhBM9A
         feE1rfobyu6g5rmSCkOF1pZjkKWkGfGseccNJi54TlUoWgPeri6hJL5CFnh+wYcDpsr5
         ei8yjr3gGvBCWYymzDmHqDZy+1gXQWOp3EajNYbSMHUM1vyes5yPOvkqTUP04Owd5fgs
         D7CQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0hJ56PCyC99ajvc6+jlgwQJ6rmQwVQsvLp18UzVQZM5jVBkKEX0hghN+JWTAMU4OwPaUVAKOZWRDRpj8=@vger.kernel.org
X-Gm-Message-State: AFuF++mdD0fro3Zq7Fshryf/Af5WXgpQKKcdjSlOSYpuRAypoov5BJcI
	XOM8zZPWod9NYxylKhYOCP+2/IcrAnDA3TyfmH+DLIDYdVxgpNoSwmD1
X-Gm-Gg: AYBFou0G6MdrgmEuwntOI9Oebtg5TS7+TqJ/L5tkPk2xnlxBey+R4/qSqRvhiA7RJI+
	QaPTdBJfe6/8k6QqYQ6wXO+Ss+UEJfpuiUf7kvl/zDz8r1i8KWue97yokKoxVDgxoByQJ5liMb6
	fp8UtME2VBTAWU3UVlJONo5VbvIPwsK7lQ30dXjoC1Vg05PKmMmZdremp0vj2MV1tb2SuykK8xq
	cu+a/V8GJadgOV99CyIgN4T0eYQAawGVuaSHu32Bn04vfe6mkJHy0S+J3xMnB1wItiXlIO0afD1
	/+OL+G7iLutdyY0xWaYv13LHJEhxPS2KfRt8TLh8E0XjR3KHVKXINhL9IXNnHiziwrZQTtS4vn+
	AdXmWW18+U1xRaf1HYE6qQMIS918A63A18aZVY9Q6Ng+rH8P2BVPUY9miK81OWoKJM94E9qXs6f
	YziRgPKx1djCPtTKX0cckYFrUcFDr8SPZXFum+xlwQ+obkgJ4FPhrWVmqv52zm28LmqU7/7NUuv
	CJQ2DetPu0dXb3ZghKQYrwyW5XtfRIu8osOitFl
X-Received: by 2002:a17:902:e88c:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2dd6c5cbdb1mr41439185ad.3.1789385650870;
        Mon, 14 Sep 2026 04:34:10 -0700 (PDT)
Received: from localhost.localdomain (vmi2317699.contaboserver.net. [85.239.239.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfd8c84sm46512045ad.62.2026.09.14.04.34.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 04:34:09 -0700 (PDT)
From: Lian Wang <lianux.mm@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>,
	"Barry Song (Xiaomi)" <baohua@kernel.org>,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
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
Date: Mon, 14 Sep 2026 19:33:47 +0800
Message-ID: <20260914113353.94964-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aejtfpBUu7gNV6Tk@cmpxchg.org>
References: <20260422021842.78495-1-baohua@kernel.org> <aejtfpBUu7gNV6Tk@cmpxchg.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Lian Wang (ProcessMission)" <lianux.mm@gmail.com>

Hi Johannes, Barry, Baolin, Kairui, everyone,

We revisited the thread and Johannes's earlier analysis on the kswapd/kcompactd
handoff. We agree that a single static `compact_gap()` cannot represent
hundreds or thousands of concurrent higher-order requests. In such workloads,
repeated kswapd wakeups often reflect real unsatisfied demand, and stopping
kswapd too early can shift the burden to direct reclaim and direct compaction.

At the same time, related reclaim issues are still appearing in several
environments:

  - Barry observed order-3 network allocations causing persistent kswapd
    activity and device heating on phones, even though requesters can fall back
    quickly to order-0.
  - Baolin and Kairui have seen similar fragmentation-driven reclaim behavior
    on servers.
  - We have reproduced on PCs and VMs that order-0 memory and total available
    memory can remain plentiful while order-3 blocks are scarce, yet kswapd
    consumes substantial CPU and runs heavy reclaim/scan loops. We have not yet
    reproduced this consistently on our server systems.

There is a useful parallel in Johannes's production work on reclaim storms in
defrag_mode:

https://lore.kernel.org/20260626182215.1107966-1-hannes@cmpxchg.org/

The allocation paths differ, but both threads expose a similar feedback problem:
reclaim may report progress in the number of freed pages, while not making useful
allocation progress for the order, migratetype, or fallback intent that triggered
it.

> The compaction gap is sized for a single allocation, but
> kswapd/kcompactd are a shared resource for potentially hundreds or
> thousands of incoming requests.

We share this concern and do not want to replace the existing incremental
pipeline with one fixed value. We would like to separate two possibilities:

  1. One high-order kswapd wakeup overshoots `compact_gap()` substantially
     before `sc->order` is reset and kcompactd is woken.
  2. Each wakeup makes bounded progress, and the total overhead comes from
     repeated wakeups after best-effort callers have already fallen back to
     order-0.

For the first case, limiting the high-order reclaim scan or per-wakeup reclaim
budget when order-0 watermarks are already satisfied may preserve the repeated-
wakeup pipeline while avoiding a large single-pass overshoot. For the second,
we may need stronger accounting of outstanding higher-order demand, instead of
treating every repeated best-effort attempt as a request that still needs
background progress.

Would it make sense to align on a common, parameterized reproducer and trace set
before choosing between changing `pgdat_balanced()`, bounding the high-order
reclaim budget, or improving demand accounting? A useful matrix could cover:

  - best-effort order-3 allocation with immediate order-0 fallback;
  - sustained and concurrent THP or pageblock-order demand;
  - default mode and defrag_mode;
  - phone, PC/VM, and NUMA server environments.

We can share our reproducer and the PC/VM traces, and adapt the workload to
collect per-wakeup `nr_to_reclaim`, `nr_reclaimed`, `nr_scanned`, order reset,
kcompactd activity, allocation success, and fallback path details. It would be
very helpful if Barry, Baolin, Kairui, and Johannes can tell us which parts of
this matrix and which counters best represent the phone and server cases. Then
we can compare scenarios with aligned measurements and work toward a solution that
does not trade mobile reclaim storms for server direct-reclaim/compaction storms.

Thanks,
Lian
