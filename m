Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8703E8C70
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 18:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188822; cv=none; b=qRFQPTQE2GuHWw+r8sI5iw2xe7D8tWxiT+pYYc4P93JSgOtGI2+2qvobJOlfXdFhO0eGO4ANBjLa8fMpPqP7wn+klE53vxDGl9GIuc7DhhBNl+flGYcKgIurfobnwRgzTd6T8FTaF+8l6Y5YTdZLd2kB/6B1aGFGfyljih1imas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188822; c=relaxed/simple;
	bh=+kKmRSHAFbZ610bwi6FiHGuRD8TJDim0w7kTnt9xnMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F1TpiyqHltotIGhH45HX3+ziSCR1E62SjE/ml8JtJanHF6Aqvn3sA5qa5tC+mvnLP7GamL/pifrjMExkv5QeVkoEZH4RKm3gQzOsBylVZ2PDdPIi8J/oJaAmfga0K+V3I0OlvCv6WJg6bel/rkXQa6P7/5fU0TZmytsXU2J2nM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuWuHzEd; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuWuHzEd"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so2325965a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188811; x=1790793611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqyJbHjr6LcXcdK9aE9i3DnVIewwpBEVNVy5+on1Af0=;
        b=BuWuHzEdLM2OZnGyyxcIbp+db9SDVEWxH2CbJIMhiH/PQT5BatdaLXMw+6o39iz2o5
         BkjibZbPjMK+SHKHVs3tWgeaJOX6hY8a9CzEcZdplW3353m3MWG3rfauVIIiYpUoYHLl
         hqUfQnGhlR9tlY4ijP/b81RWTTkw7kMeVwtH8CWry7w6KBtB251zKwn75gRUJBYEyzBj
         KySZbG7DDK5ZNZy/3iuzKmibkb9kwfwq3lufDtflYYF3A0y1GvbTYpbKZeRM+avLiCnT
         HyVAIY7KSEWKOS06eH4g+uSL/0AzSsoTD6MLpFBx70bVEbtTPbI5nLELyFThYdkcgonZ
         c3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188811; x=1790793611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqyJbHjr6LcXcdK9aE9i3DnVIewwpBEVNVy5+on1Af0=;
        b=zhIW7JHfkJ7Ytu2Wkhjlu5Pnly2yoH3YaYE4sD76jYZd9vCcio6hywu8gSKixS5M2T
         BjFFXLgMmObKsaKvN93Fd2B222JQMUZInw/O4tjeTbV4mCLDmkel7X13MtFk5DYv9rpb
         xgXQs7O8Gg7hjmEfNsaSuZq/OersbNkox5jm3EhztYg49ikdoEtScoulcExi4dPzwOzT
         6saSCT/Pk5/tF5EJ2ANxQmrdOZzlHp5mfd+1RHY8pI6mN2CxfI1sZpvoHcBB+nWoLJjO
         uaQhOc1ujhmIBFAH19kPDcoC6DDxAUQhD23OPL0wjUj3H7tgIakysDI/gq7mVg1RsaCk
         9bCw==
X-Forwarded-Encrypted: i=1; AKwUvByOUfJVtgtet0YJ07i1pqoRIusw0DKF0kKbqg5TBulWq94sHq8MLacbdeYvpWjgU/kU/OWBh4dIWMttokM=@vger.kernel.org
X-Gm-Message-State: AFuF++lYQaSNhm8zjwPm7hZC+h7kamsbdYrdIrQyswsFHcBc7SJRiYVI
	Do3OVhhL40adiyTk9NZnXIc7Z/c8+JA7QhAn7cPSiFoKui4/T4HhsZWi
X-Gm-Gg: AYBFou1viqX+PYh7XLBKNQ33ppbVbnZnpJ7/8VQZkYzpN3kYv9dKsGHMvyqRW8iYO/J
	Zm1Y0yEPcQhI6LC1S1Cqo6ubA3fBchf0Pm3LPFd8kcna9OmMb/yv6YZLvKm1qats42z1YcLlia8
	gJUBxi4YJ/D3r+15gN6JZY5uamxZSn8x9aL/blS7qk8yNUWUTieUdegRqUfsoKtKmI0pAVE6pyK
	KH3aCrRqdgQssOQu8G+/Cg3oIK1GVWITPOcoc55GI+VKiMUDGaEgZFh+v+nMneJnjLrNdt7SoW2
	pJJZ63tCfBmghV3KYyjJCD7ZTk8+7lfy1GnDZsC3oFfi0+I8HCzItpq4o/M6BknqVx1iyp0YxMy
	GQmrStWxNsc8BI5vgj3Gfj/35M9k8lwTxiF+RLyK1Qdz51OiaJ1jzqJj63Qh3/sX3b+f88DDwJm
	z7mQz0dlh9SHJr5Ete89dGG/8c2SqMXtf3AF49FQc1RpEIsmdtDA1dKG8xUzyualYHGX48+0jTy
	lnke5g8pBrRF0rMCwGlxFOUpQsc1pWnaN6VLf4HIQweqpj4UMww73ZAl4tS0IeCmyJLJA==
X-Received: by 2002:a17:907:3cc1:b0:c26:19de:9acf with SMTP id a640c23a62f3a-c2ac2338f7cmr4037366b.39.1790188811203;
        Wed, 23 Sep 2026 11:40:11 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae33faf4sm173417566b.3.2026.09.23.11.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:40:10 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: netdev@vger.kernel.org
Cc: sgarzare@redhat.com,
	bobbyeshleman@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH net-next v2 0/2] vsock: receive queue hint for io_uring
Date: Wed, 23 Sep 2026 19:40:06 +0100
Message-ID: <20260923184008.153541-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AF_VSOCK stream receives never fill msghdr.msg_inq. io_uring initialises the
hint to -1 and treats that as "unknown", so it cannot set
IORING_CQE_F_SOCK_NONEMPTY, and it speculatively retries a multishot receive
after every completion, including when the queue is already empty.

Patch 1 fills the hint at the common exit of __vsock_connectible_recvmsg(),
reusing vsock_stream_has_data(), the transport callback that SIOCINQ already
uses. Following tcp_inq_hint(), it reports a terminal hint of 1 once the
connection is finished, so the caller still performs the receive that
observes EOF. Patch 2 adds selftest coverage.

Numbers come from a ping-pong over vsock loopback using io_uring multishot
receive, 4 KiB messages, the queue drained between messages, with kernel
receives counted by a kprobe. The baseline is the same tree with patch 1
reverted:

  entries per delivered message   1.97 -> 1.00       (5000 messages)
  receiver CPU time, median       1.640s -> 1.587s   (-3.2%)
  receiver wall time, median      3.260s -> 3.183s   (-2.4%)

Timing is 25 runs of 50000 messages per kernel; CPU gives Mann-Whitney
p=0.006, wall time does not separate from noise (p=0.12), as expected for a
latency-bound workload.

The hint is gated to SOCK_STREAM; seqpacket is untouched. SO_INQ and SCM_INQ
are deliberately left out: they need their own per-socket state and
ancillary-message semantics, and a byte-count contract would have to account
for transports reporting less than the whole queue. That can follow.

Testing: built and run under virtme-ng on loopback, where the new cases pass
and vsock_test still passes 41 of 41 with a clean dmesg. Other transports
were reviewed but not tested. Hyper-V reports the current packet rather than
the whole queue and can return -EIO; an undercount only understates what is
readable, and a negative result reports -1, the same "unknown" value io_uring
presets.

Changes in v2:
- vsock: rename the helper to vsock_stream_inq_hint(), fold the NULL
  transport check into the finished check, drop the int cast, assign
  msg_inq directly, and document why only SOCK_STREAM reports a hint
  (Stefano)
- vsock/test: move expect_res() to util.c, add uring to the SOCK_NONEMPTY
  helper name, skip instead of failing when SIOCINQ is not supported, and
  drop the redundant final barrier of the EOF test (Stefano)
- vsock/test: queue two chunks before arming the multishot receive and
  check SOCK_NONEMPTY is set on the first completion and clear on the
  second, so the test fails without patch 1 (Bobby)
- v1: https://lore.kernel.org/netdev/20260920194710.1114748-1-devnexen@gmail.com/

David Carlier (2):
  vsock: report pending receive data to io_uring
  vsock/test: cover receive queue hints

 net/vmw_vsock/af_vsock.c               |  35 +++
 tools/testing/vsock/util.c             |   9 +
 tools/testing/vsock/util.h             |   1 +
 tools/testing/vsock/vsock_uring_test.c | 391 +++++++++++++++++++++++++
 4 files changed, 436 insertions(+)


base-commit: cea851523034d83dc61d882b1a6a3ad273480f7b
-- 
2.55.0

