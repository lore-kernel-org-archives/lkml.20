Received: from mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF5A1C6FF5
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 01:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788141073; cv=none; b=MmrZYxv7xVtx0iDkNGPz83EHz3vhco5fgPu9SSsKerv8+vuL7BIoWjYpkpGX/e9e2NH8230U+A9Se+j/F5uvjsZO+GpFNFFy9fJlZvFSfQkZxBLCM4H5VmWmhctTwRAj8wTT4A/dOFQd0QT6EZutxJtttzIEp5Ty0l7L3E3t6+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788141073; c=relaxed/simple;
	bh=o3jG3s/ZBRjIh/mnuaTmfuX6JWJtAs9w/d7YV3bxp9A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=r58Xjfad9QlF/uAC4h3Y5xk9EH7vnHVjWLyeNQMCxEWoFkWtAIbh9Fgf/zwe+Z0BvjCKOgpV2Alb8ijI8auGe9SsRBhY7+vq1cws7s+iZOAnKBrygnFZfWJuef1MLodH/9gGANtZ8KGi8RY/jSABtxCN9m7dPYqya6dp6179DJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oEK1OY2r; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oEK1OY2r"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=o3jG3s/ZBRjIh/mnuaTmfuX6JWJtAs9w/d7YV3bxp9A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788141068; v=1; x=1788745868;
 b=oEK1OY2rpuExpPHnMNSpJWmylkt1jedRLK8NxXfHN913ewJq2DgkrG6LLUr4S+ff0qPr01+K
 UdV0Ofyeryi08KV2hADWq1ZcDElTMQdj6n5qlGgHZxUcZCuwwEdts2rzTYWQBpTI2Age+AKeErU
 PHV2l3n0LemDehT3Vn6dC1Mc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f5ee061fcf6cf2c6;
	Mon, 31 Aug 2026 01:51:08 +0000
X-Mizu-Trace-ID: f5ee061fcf6cf2c6
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Subject: [PATCH net v6 0/2] bonding: fix TLB load-tracking overflow on
 high-speed NICs
Date: Mon, 31 Aug 2026 09:50:58 +0800
Message-Id: <20260831-bond_overflow-v6-0-ffb0ed1f7268@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XOTW7DIBAF4KtErEs1gPlJVr1HFVWYGRrUCCoc0
 USR717kblx7+Wb0vZknm6gmmtjp8GSVWppSyT2YlwMLF58/iSfsmUmQBhwYPpaMH6VRjdfyw30
 w3njr0Hhg3XxXium+9L2zTDd27sNLmm6lPpYbTSyrvzoBm7omuODhGKM8ojXWwtvX45pymV5DX
 qqaXPNhy2XnqCJp5zwKY3dcrbnbcsWBE2gccAwyotvxYcXl7vmhcwd69ICK4mh2XK+53nLdufU
 OAEkoFcU/Ps/zL8qQTlusAQAA
X-Change-ID: 20260806-bond_overflow-ac6a6a78d6a0
To: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

The bonding TLB (Transmit Load Balancing) mode tracks per-slave and
per-client transmit byte counts in u32 fields. At sustained throughput
above ~3.2 Gbit/s over the 10-second rebalance interval these counters
wrap, causing compute_gap() to produce incorrect gap values and
mis-select transmit slaves. Such speeds are routine on modern NICs
under heavy traffic.

This two-patch series fixes the overflow by widening the relevant
fields to u64.

Patch 1 converts the unbalanced_load counter to per-cpu state as a
preparatory step. The counter sits in the transmit hot path, so
converting it to per-cpu before widening avoids introducing cross-CPU
synchronization overhead for a u64. Also use a prev_total_unbalanced
to store the previous total load to avoid reset per-cpu data.

Patch 2 widens tx_bytes, load_history, load, and the per-cpu
unbalanced_load tx_bytes from u32 to u64. It adds u64_stats_sync
protection for the per-cpu counter to prevent tearing on 32-bit
architectures, and reworks compute_gap() to use s64 arithmetic with
READ_ONCE() on slave->speed.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
Changes in v6:
- Do not return fixed value for unknown speed logic, we need load balance
  even NIC speed is UNKNOWN (sashiko)
- Link to v5: https://lore.kernel.org/r/20260825-bond_overflow-v5-0-7a800de133f1@kylinos.cn

Changes in v5:
- use s64 as the return value for compute_gap, so we can compute the
  difference when NICs are overload. (Nikolay Aleksandrov)
- Link to v4: https://lore.kernel.org/r/20260820-bond_overflow-v4-0-805ba0d3efb6@kylinos.cn

Changes in v4:
- move per-cpu allocation to tlb_initialize/tlb_deinitialize (Nikolay Aleksandrov)
- use an extra prev_total_unbalanced to avoid reset per-cpu data (Nikolay Aleksandrov)
- Link to v3: https://lore.kernel.org/r/20260818-bond_overflow-v3-0-e05d4dbc2fd8@kylinos.cn

Changes in v3:
- Add a preparatory patch to convert unbalanced_load to per-cpu first
- widens tlb counters to u64 and add helpers to prevent tearing on 32-bit
- Link to v2: https://lore.kernel.org/r/20260814-bond_overflow-v2-1-d3fe588ad167@kylinos.cn

Changes in v2:
- update comment description, including AI-detected info.
- fix tx_bytes/load type detected by sashiko
- cast SPEED_UNKNOWN to 0 before shift, detected by sashiko
- Link to v1: https://lore.kernel.org/r/20260810-bond_overflow-v1-1-c9ff29d76770@kylinos.cn

---
Hangbin Liu (2):
      bonding: convert unbalanced_load to per-cpu state
      bonding: fix u32 overflow in compute_gap()

 drivers/net/bonding/bond_alb.c | 63 +++++++++++++++++++++++++++++++++++-------
 include/net/bond_alb.h         | 14 +++++++---
 2 files changed, 63 insertions(+), 14 deletions(-)
---
base-commit: a8455260b2e9c024d1872ac1c094793d55a7e537
change-id: 20260806-bond_overflow-ac6a6a78d6a0

Best regards,
-- 
Hangbin Liu <liuhangbin@kylinos.cn>

