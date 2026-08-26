Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6F23D0BED
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787775617; cv=none; b=foeezxCpRnnb7+rX+KIRAf9KSnSnPOEY2mScBtAxWFBRFuQT9JbRCFEc+HaLx7aCyMqWQEnVXCAt4aAwxNiw5pIw2d2l2x25AEsMUn15UVBfDH5c5ubObZVTCrdjurSTzlvB30z1/uNvQ1nJRjMB68mIBCDTm27BiJxzoQ36cSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787775617; c=relaxed/simple;
	bh=CZHSDnbBZpPDnRSXts72mzhg+0oBlzl3V+dKme0lZS4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mCRqUkuGG2JVpjYbJzTj0ucrq9zJgKbMC7Usv6/KaLkcMl4TLuh5b9LdzhNEjQVyFmu7AB4vkJrgxRAW/08t5xTW0aPSjqGMTrsR6cWSbiDcVqIxcIXgrcKTMprpC4KJppvwfMp8XnTT+PCr3gCdffB/4YwHV7kGK4mTeBLnXco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=aNgePfoD; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="aNgePfoD"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e6b5737bb2so2093767a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1787775615; x=1788380415; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3SS8NdWOZaZQ+a58FcYy/bIg3Kan2uF8Exlc19qObVc=;
        b=aNgePfoDCXEeDEL0yNVoE4ear876xbbEKM8podI//5/hf9IVwNfzeO3JUb+hTJGnB4
         KK+BsDVT0lVKyD5qq/Y7s/ROyXbE3nOS6rdmDYmi+fVALTpfv2AemFE2NHR1ciMBO9Rt
         QWWf3ozbG/pEx7KCE9tt3kb80AbBD7xtbckCURCQKi+BVC6NvTJjd0/tgvmYGB/g++U1
         3At167BBKLzQor39Kn8h2i9Ux3NfMGthWU17DOayNZcVLv+cdIbxN369QLHBv/oK+O8v
         tsv+snfc3MjO59lG8feC1EING6nplp3pwz0vRVV3TKXW54scuXGlCluNl1u2nbAF9wN/
         qn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787775615; x=1788380415;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3SS8NdWOZaZQ+a58FcYy/bIg3Kan2uF8Exlc19qObVc=;
        b=H20aR1zD/WDlX9MxzQkNmHadtxPVl0wO2uZO7xRNWRm1H8tB4A7oVPXkmzM5csbJbp
         mGgg4pmmuDmwu/U7ovpZ0hzBLXMjuxVRFus/2EMQcWqNHa7E7nb2271X9yIcC868Je0m
         LXZmQG/VeeKIpBo2zoetoY0KNJzsWw5sYX8RZKvL3H0WvLeUdebOVSp4IvcezSFzwndg
         8ErJIvC65wUtKjpkCBOVMVFw+Nf9EgbgyazeqZk2vaVSDhYHs6lgq4sFSL9FK9MemRKF
         Pm6WhLj8h+SQ4Bj9iglLSs/m5dDEy+V41my/N3FLJUjm8fB1gBYXKtSWw5+Y47nlsqpQ
         b2FA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9jLypltnC0f5aNJAyTI8gI9l9tlcQOslyc5cge3CX5LOAWAdBXub1gGjoaPwjDdFA5bs8qdluxzS/vIA=@vger.kernel.org
X-Gm-Message-State: AFuF++k1OutzvkoCw2fWa/8+h2wMUlOzzQ5UtB1OoNHLIv9yKdoe2gxg
	DEzwFQA8Cr20xi/CABZlH9paZL3GwNOiCArmERg6ysU9smA8NwvYdM6nG2RZxGRvS+4=
X-Gm-Gg: AR+sD13Q3sO7k5G3S5pT/1zOa+d9ey+gr4NuB9E30oiy28hr/ibSM9qyQbbgPkt594z
	gTW9aJIfvEyQCAjegEaUsu1UGoefsBgfGuBCzwUYUcUKAFIKGXxTAM7GQlm5nEN1BbgY7e+kdI7
	3L2NAf47UMkXhZMu98HMSMJQOIu8M7GYt4/RPNkX0taVKvvb/Fp2EXHgHi88LalGsWBKvrOFEuo
	w5b0jE+KXlGWFY+RSoHi7xT53GiqIpjQ8En9OQLwROPuxzhz0QvdzREtoWFdSXbrVWhRDFpaALK
	8MqiXRsoCql1SbA54BmF6qtdMYqsRd9Bvg7JSen+zQmjXjbTXOIsfkGNIOWvh6BCqLFnomvJkzh
	5S1AqrSx0kOwAYKOfU/j+ZdXVtktwt/bzBRyaY5IbImXLUK/W0yyv0jJ4YKmrsnD9oxTdOmv4e8
	KEUurbr7m9Ut7lzV2YGzUakHHyAYbdnukGmG2YPMNMMGr+1gOWpA==
X-Received: by 2002:a05:6830:6af3:b0:7e9:c72e:e5d6 with SMTP id 46e09a7af769-7f4c4e7e246mr10511847a34.14.1787775614745;
        Wed, 26 Aug 2026 13:20:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:bac6:bf21:2e46::49c:30])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f4c83d09d1sm2474928a34.14.2026.08.26.13.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 13:20:14 -0700 (PDT)
From: Chris J Arges <carges@cloudflare.com>
Subject: [PATCH RFC net-next 0/3] net: hash uncached route lists by device
Date: Wed, 26 Aug 2026 15:20:06 -0500
Message-Id: <20260826-hash-bucket-route-lists-v1-0-fa9b9f30eb74@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHZKj2oC/yWMQQrCMBBFr1Jm7UCMqMWt4AHciotmOppRSSUzk
 ULp3U11+T7/vQmUs7DCoZkg80dUhlRhvWqAYpfujNJXBu/8zrXeYew0Yij0ZMM8FGN8iZpiaIn
 8nqjfbgiq/c58k/FXvsD5dFy2VJ3Eo8H1f9ASHky29GGev2V02nmMAAAA
X-Change-ID: 20260820-hash-bucket-route-lists-b8cc27ccd53c
To: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com, 
 Chris J Arges <carges@cloudflare.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1787775612; l=4076;
 i=carges@cloudflare.com; h=from:subject:message-id;
 bh=CZHSDnbBZpPDnRSXts72mzhg+0oBlzl3V+dKme0lZS4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgaxY1IIT5oTohBZJmhnVgJo2HsM7Sv
 9I0LdJCgpeGX6gAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIpSwm5r5x7nr512VdfZgxLR2mKeMLhZfMOVWARaaxIsQaaY3M0xR/i1bU/pns6gKtU3XON5XTh
 6nUK5wnJdmwg=
X-Developer-Key: i=carges@cloudflare.com; a=openssh;
 fpr=SHA256:Cun99EBiH0EV7wvmfTBF9eDrld2NJx+aD4ScWZ45Q5M

We have observed hung tasks blocked on rtnl_mutex while network namespaces
were being removed. The namespaces contained many network devices, and the
host had accumulated a large population of entries on the global per-CPU
uncached route lists. A perf profile collected during one incident
attributed most of the cleanup worker's samples to rt_flush_dev():

```
99.92% kworker/u384:3-  worker_thread
  `-88.71% process_one_work
      `-81.02% cleanup_net
          `-81.00% unregister_netdevice_many_notify
              `-79.42% notifier_call_chain
                  `-78.05% fib_netdev_event
                      `-77.92% rt_flush_dev
```

For each device, rt_flush_dev() visits every possible CPU and scans the
global uncached route population while its caller holds rtnl_mutex. If N is
the number of devices, C the number of possible CPUs, and R the number of
uncached routes, the cost is O(N * (C + R)).

During namespace cleanup, other processes that issue RTNETLINK operations
requiring the RTNL lock can stall until cleanup releases the lock.

A minimal reproducer is available here:
https://github.com/arges/linux-reproducers/tree/main/rtnl-flush-storm

This series replaces each per-CPU uncached route list with 64 buckets keyed
by the route's network device. IPv6 routes need additional handling because
dst.dev and rt6i_idev->dev can refer to different devices. Such routes use
a separate per-CPU list that is visited in addition to the device's hash
bucket. Routes whose device references are equal use only the hash bucket.

I measured user-visible RTNL latency on a 192-CPU x86-64 host. The test
added approximately 80,000 uncached routes across 256 devices simulating a
distribution we saw in production with 6 devices having 4k to 20k routes,
and all others holding ~100 routes. The devices being removed owned none
of these routes.

During asynchronous namespace cleanup, the test repeatedly sends an
idempotent RTM_NEWLINK request that requires RTNL. It then records the
worst request-to-acknowledgment latency in each observation window.

For an actual six-device unregister batch, median latency fell from 12.010
ms to 3.785 ms, a 68.5% reduction. At 36 devices, median latency fell by
69.5%. In a 256-device stress case, median latency fell by 75.8%.

I measured end-to-end route insertion cost separately on the same machine.
The test inserted 100,000 routes per round for 30 rounds after three
warmups, while pinned to one CPU. Median insertion cost was 2,069.9 ns/op
without hashing and 2,066.6 ns/op with hashing. This test found no
measurable insertion regression.

The hash approach adds no per-route fields. On x86-64, the tables add
approximately 3 KiB per possible CPU. The 64 buckets balance fixed per-CPU
memory cost while reducing collisions.

I also tested an approach where I batched the uncached-route flushes across
each device unregister batch. At 6 devices, hashing had lower median
latency. At 36 devices and above, batching performed better. This approach
seemed riskier in that it required changing core netdevice notifier
behavior. Therefore, this series proposes using the hashing approach.

Patch 1 hashes IPv4 uncached routes by network device.
Patch 2 applies the hashing design to IPv6 and handles routes whose device
references differ.
Patch 3 adds a selftest for the IPv6 case.

Signed-off-by: Chris J Arges <carges@cloudflare.com>
---
Chris J Arges (3):
      ipv4: hash uncached routes by device
      ipv6: hash uncached routes by device
      selftests: net: cover IPv6 uncached route device mismatch

 net/ipv4/route.c                              |  36 +++++++--
 net/ipv6/route.c                              | 102 +++++++++++++++++---------
 tools/testing/selftests/net/vrf-xfrm-tests.sh |  35 +++++++++
 3 files changed, 133 insertions(+), 40 deletions(-)
---
base-commit: 91ec2035134982b98fab0609a9fd8480e8217dc1
change-id: 20260820-hash-bucket-route-lists-b8cc27ccd53c

Best regards,
--  
Chris J Arges <carges@cloudflare.com>

