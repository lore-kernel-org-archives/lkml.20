Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.242
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093758;
	b=SHxund1oso5Y5ax8kqB2Prg0RwOWfQ9vPeyIp20792wWeMatDGqoZJkGyf1J/GXQoT4X
	 qRVG8D4pu0V2oCdTVNwHccT0jP5/LqnFLR4hZvPAlRJESTnwGykJrHMWpEevBkFIJoW7W
	 F184KquLL+hF04phcV4P4ijp3gll0v/hPKBi1I/uN8NKLcIpIzKJvzaJIq+I2A6a1aqwY
	 TtSQpAOcou+4Z2gnm1v2BGGFtQ6B9H5Qtp1Q0GmO3eGU0KoAhLVxYzqa8u3LpxKfAZkZt
	 mIfdQz04HT+xUAvMo4/BI7k7TrWvxv5XJj70EvcHIrDXig8xgzFd5+GU2mS6ZAahwrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093758;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=lxV7GHFbCpH33c+sUjwQ4RqgTOdSUkKKj20dfYYLSeQ=;
	b=0czlVIWG79QaYy8ZDRNAtP9ym9bmNFdYpkfaJ6IvEWSVzK5qIdeHhzyoArdEQPafzc5I
	 35y0f0ra5qtyjQ3WcmTUghip1rbU4MnGYjU7aI9bXE2cgTZwulaPhvevzVdDazbUL0o8t
	 ITsnLvB3mQS9CrHT1d5LWTgrAU4zsH+jSqfgmdV2rjHf4RYjgbofps/hYRmxgZrhKC72s
	 7ZxQtAET1dJn+yfKCcMDui6NQHNv6UGt1vskkSqmH4d7pda2TFMJgm4zmKuzQnctZXaKN
	 uZjK9zpOZtKSHw3hnrMGGEbvMX8qX67CbkT32pziGEasRYBLJYeO/NCN4nhDqrnusVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Ed9vJqa5;
	arc=none smtp.remote-ip=203.205.221.242
Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51413606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51413606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Ed9vJqa5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793093755; bh=lxV7GHFbCpH33c+sUjwQ4RqgTOdSUkKKj20dfYYLSeQ=;
	h=From:To:Cc:Subject:Date;
	b=Ed9vJqa5zQnRxbX3kekbRhcbMFoWo4vMZyP/2pKVMuaVLN1w74aqJFysB3NcMDSZr
	 CZ/5Rn9htsKOkhKxKaDgh0tfA5O76NMmeTwyfiW0Ax7WantZYFbOdb1Ly/t7jXCITp
	 r56UPEqe5Rkn5/KLYc2ti4GhbjCizNEHLzOggOZg=
Received: from kernel-lab.tail5e91bb.ts.net ([2409:8950:57d:63:2e7f:4b13:c1e3:e391])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 8F4896E6; Tue, 27 Oct 2026 17:35:52 +0800
X-QQ-mid: xmsmtpt1793093752trufkse1y
Message-ID: <tencent_4FCBC113A5FF944F82A007AB2D4F06A2EF07@qq.com>
X-QQ-XMAILINFO: ODafEzNm5ExjYYe6KoXUxWHyIWa19hvUZ2cc+4pA+ZCfPqGBZtNIidvd7N1+qo
	 8Wk48bSNRy0Kj3ymxLhg8feigJiBunUBYH9xVBhFJE2TAHPiaKUp6Wgp1FC8MZW/l2ttur6LVJ3A
	 hlGw2CRLtUgaQMDLOixDlYLipBvAKj4kBBcK9mYPiroqYk4lsd80wrhXkmshcVP7B165u2bnlHhH
	 V7UoAcV/idtgD3Psb/QKZmjf7FkicC6CQBBYUYjgtOcBs+ZSgM29eR4ll+cJQJfENWLWwUHG1pE/
	 zw7m3m5z7C3M9uMTO1/vYgSJM3iUbeOnW8Jn39Z73T9hem9X6ukBNq3GqxyNRx9+kIvMBrqjBerX
	 T68DM11wXyup0JBMb48A6s7sgmdCSmJTdv/KKdcMMiSL0VgBeP54TBEqeftbTRXoc1ebMf+e4k5u
	 VrWWV5yDIqrxS8u2GjnGVAiC8Y4bBoB0bmZeoX0L254jFTMEr++DZzC59F/qtyna6CgiXIw9IBvL
	 T395I7woPbM84TXSzWQ3sjJXOusVmlVTAuwhWLPFIhZABbJQDUZOOTf9KH+epSqOUisszVbppyRX
	 q/c0lRdMJr1yW/yvShcLCTgXRvRZNC7sG0Y4NrMG+RyRWUpYo9algr4h30zvjQg/Lrrc9khdwH+k
	 yl2FzoyR9HZs6jycLl1UCVNeaAWLBZwD1Aux0+BpjARc3q0ipsPDk7888jE9R/NgkjVLHayRPUyF
	 r92Hgfcalv5rDGgiOR5/Hh4oRS+p3ofHgO1iYtw5I9d5A9bvTBTWpYb7Kekrb4axAbPtlYjilr2k
	 IOEMOjfpUje6lsAzoIvJoZquvSqeBbhLUQfTVoYZtX87QVMFgZGAnUJdXtWGwOJjBu0YLC6TpRdh
	 vI15umGcnDaB6AgjLeUh4yr7496FKQ6zh4TmGt7FS2PujqSoZik1WJ7vPsePhuovZ61YL4t+tCVX
	 EO6QxY1HQo4T5s/mR25oFx6kco9n1qKHMgDreuWFBbl7Cy0fjZOUZP05uessp/RdpgeEJM4S/bYr
	 pkYmshwqQ1ic1IrIIKfrpCOX0m6iDepDGiQNtihxjV9DXdOMc6owgu4VkzNHM=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Yingjie Wang <1075151112@qq.com>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	hare@suse.de,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] nvme-tcp: validate TLS handshake timeout parameters
Date: Tue, 27 Oct 2026 17:35:50 +0800
X-OQ-MSGID: <20261027093552.3934437-1-1075151112@qq.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NVMe/TCP host and target each expose a writable
tls_handshake_timeout parameter. Both parameters are signed integers, and
both paths multiply their value by MSEC_PER_SEC and HZ before converting
the results to unsigned timeout types. Large positive and negative values
can therefore give the handshake agent and the kernel different, unintended
timeouts.

On an HZ=1000 kernel, setting the parameter to 2147484 produced a signed
integer overflow in a real target TLS connection. A real host connection
through /dev/nvme-fabrics produced overflows at both host conversion sites.

Make each parameter unsigned and reject values that do not fit both the
handshake agent's millisecond field and a safe jiffies delay. Read the
parameter once per handshake so a concurrent update cannot give the two
timeout mechanisms different values. The patches are otherwise independent.

The exact series was tested on an x86-64 HZ=1000 KASAN/UBSAN kernel. Both
parameters rejected -1 and 4294968 without changing the current value,
accepted 4294967 and the former overflow trigger, and exercised the target
listener and host /dev/nvme-fabrics paths without a UBSAN, KASAN, warning,
BUG, or oops. The expected handshake failure was -ESRCH because tlshd was
deliberately not running.

Both changed objects also built with W=1 for x86-64 and i386. The i386
objects had no __divdi3 or __udivdi3 dependency. Arithmetic boundary checks
covered HZ values 100, 250, 300, 1000, and 1024.

AI-assisted analysis was used to trace the timeout arithmetic and prepare the
initial changes. I reviewed the final diff and the test evidence above.

Yingjie Wang (2):
  nvmet-tcp: validate the TLS handshake timeout
  nvme-tcp: validate the TLS handshake timeout

 drivers/nvme/host/tcp.c   | 25 +++++++++++++++++++++----
 drivers/nvme/target/tcp.c | 26 ++++++++++++++++++++++----
 2 files changed, 43 insertions(+), 8 deletions(-)


base-commit: aaedcff9014876387504a8b92d227766cb95015c
-- 
2.43.0

