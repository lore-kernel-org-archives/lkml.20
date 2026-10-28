Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188654;
	b=R3Cl6SgppH6KmJEvSpJnFteGWz6C9xBPjypnBBbVLEiT9e/D59bCTNd5lhsSuYGtpuG5
	 i6N+izSDIh+n56QuksHBXRL2gbNwTNJeQvXlvEIW+OZAb55JMHD89RjZpTOawnPKt7/2o
	 fM6YZDHnYm1NtRsEKj36PcCURIvSVzoIUSS6FdQOnOTWgGxzXYZkToPQCKvT32kRdRxRY
	 9xf5T+9gem0GymqbiYljMVb1CfYfCh3UZKK1fPkGWGOqzc5So2++dXplcpSmis6ltjG/u
	 8ksY19eb7a/mw/d/j8FP4YXmhqB5VaUCLlXLbr+XWi4CqQv0AV1Yqw0J0Cgyu6iZnUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188654;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=EUWmyH0L3M1rdBOiDGe7PflzUNySgm/d4or5r8adSxw=;
	b=uKkof+lV3EqNa7/FCQtA8C3q1y0LohnCS4TOFWxUg8yzzpz7jmzuuHOfUbhww958laaw
	 nb6y7lJxG2LcVrPkZQbBDW9m5RfNpMrY2eRi3dEyq0fUsvesHf4lLzwJocAOECdhoC4QP
	 eykhsNmSMn4zOh9/C5SOY3JipLazssxVCdnIjlQcU2OCXLzLFw8u4eUBP7d2cuMSoqXW8
	 2EqBCAWLVmYACYB8vOmyBQjJ51rykkVxlRMdvEFctPMGrLDHZDg7umf5lTa07Q4F9uFrS
	 ErptLHfYFxTBYE+IwTocNTRCv0nibtoXUeJYln8IqMcQsgx3qRm4qB7siaKqJeuS5AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=D30ramIb;
	arc=none smtp.remote-ip=203.205.221.221
Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B13C606A320;
	Wed, 28 Oct 2026 11:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B13C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=D30ramIb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793188644; bh=EUWmyH0L3M1rdBOiDGe7PflzUNySgm/d4or5r8adSxw=;
	h=From:To:Cc:Subject:Date;
	b=D30ramIbEEL9kQRJdtPDmcp0oT+cVZ5u2KgTIX13sevS6ZbOef5KXjIRpglo4jqyr
	 KH1PBmel0CMcSikudZ7Ls4O/EiUCe4HFuz53SzOOsrKbPScrs4ewfyzU9isiXL9IMk
	 Fb0eSJaV3SFsrBe+65mzyHKW2V377xahTixabjmU=
Received: from kernel-lab.tail5e91bb.ts.net ([2409:8950:57d:63:7875:da97:7462:bbd3])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id E54BDCF4; Wed, 28 Oct 2026 19:57:20 +0800
X-QQ-mid: xmsmtpt1793188640tna7ungbm
Message-ID: <tencent_8B4F08A2DD4BB093ED7FAECFFD20272B3C07@qq.com>
X-QQ-XMAILINFO: NZRRnjJGoaJhS44706EhUqftyAdPe1qMAnqQWIHtxtjft8PNtxqNEVP4CucgYg
	 4hRKUhow7VPlmAMn7yKU9nBwrkzlc1j6SOLu/6JHN/vm6QrZMQSrSzgODx7Mx6oeHVq7DVwfrQFd
	 iH35gyI0PENb+vTshtYJ2HkmGqHamSaB+vgsAcjozmkGB1E4BMhZIvgA4QunV9bHYDF0HXSULVWu
	 QTZUKSPYiitGIZNTLfVES8Jm6fwx66rs4TqaJonCUMJTzISeeg3ASVzmlziJG43hItx95Gykj0hu
	 xO/QCL1QJhkPUWQeGKb7t+19bHqVqAOz4dy19q9Kq0dE7+OTDuOm78uo7BdIr6riR8YHIkyC644D
	 +UVD/cW+mH2lkQHzHEoOYtkAaiJ8ui+Ewl7yXM66TXP8ngAB0BOrkQmtZt7rSkr6hvlSpgEVThZJ
	 Cj2K7iOqzWWehch7toNoh5Mk9Clct+adluSUqgRdBw8flghjusT41HHDmODj8Ymvw4/sv4wSOis8
	 BWJHgRkm9y8B7Pwtztk64UtD3zEn1b+vET8PqAWTw8gfi/e3ZRVfqKRnFokz8C8/bhHUROExzU1u
	 XIsn22J6/v1oJnhXKHtijkYDATbUJcIeonGB8RWXaF5FmhPgailXIxo4HvtTPfmWLHzz5T7o36Z0
	 s0h2E/WyF8w3a4N51Krq0/5JS6bSw6d3thWRB5hqU0N4bN9PQgXxkgK0jTk3XLKooaxEZp5uENvy
	 XfANxUL1rXKRdTpxNgbfSzYeaHJ4WOCOZp9+xzHCWTi19cX26UHh3XzwWARB5oZoVSVVARhc5o7S
	 ASsBdL642qvYouDC1TM5er6S5OWMlElSk+nIi38hy/Gaxjzu5YUv5f0fHYdfiQ69PtCPfUEjEjNa
	 TbRz59S6tklGN4HQhUF8in1BT0tpk88WKyuq5yo3+eKA92Of2/go/XCo1NCosABf+L3RFH/0cm6G
	 NeKSfSe6z1BTGbLqI3XJ+Tbnaz3zttlQ0RAKYn5J1YrtFrUf0KsqmCS4MlMY2ISE9IXjBGWQoPaD
	 SnnXJJT5YIKoaN2Sd7Bo3Fb83vViSbCucb1bnwGRjolRW1GvTTWwg9fV38goKcEJTj/w1cm/NXrD
	 AqrS8q
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Yingjie Wang <1075151112@qq.com>
To: linux-nvme@lists.infradead.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	hare@suse.de,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] nvme-tcp: validate TLS handshake timeout parameters
Date: Wed, 28 Oct 2026 19:57:18 +0800
X-OQ-MSGID: <cover.1793188633.git.1075151112@qq.com>
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

The NVMe/TCP host and target expose writable tls_handshake_timeout
parameters as signed integers. Both paths multiply the value by
MSEC_PER_SEC and HZ before converting the results to unsigned timeout
types. Large positive and negative values can therefore give the
handshake agent and the kernel different, unintended timeouts.

On an HZ=1000 kernel, setting the parameter to 2147484 overflows both
multiplications. On the target, an accepted pending request can queue the
timeout work on the next timer-wheel advance while the handshake agent
was given about 24.9 days. On the host, schedule_timeout() can report a
wrong timeout value with a stack dump and fail the handshake immediately.

Make each parameter unsigned and reject values that do not fit both the
handshake agent's millisecond field and a safe jiffies delay. Read the
parameter once per handshake so the two timeout mechanisms use the same
value. Also keep the host completion-wait result in a long: a successful
wait can return more than INT_MAX remaining jiffies for an accepted
timeout.

The exact v3 series was built as a complete x86-64 kernel. Both changed
objects also built with W=1 for x86-64 and i386, and the i386 objects had
no 64-bit division helper dependency.

On an x86-64 HZ=1000 KASAN/UBSAN QEMU guest, both parameters rejected -1
and 4294968 without changing the current value, accepted 0, 4294967 and
the former overflow trigger, and exercised the target listener and host
/dev/nvme-fabrics paths without a kernel diagnostic. The expected
handshake failure was -ESRCH because tlshd was deliberately not running.

A focused in-kernel completion test used an already completed completion
and a 2147484-second timeout. The wait returned 2147484000 remaining
jiffies, greater than INT_MAX, and the v3 result mapping returned success.

Changes since v2:
- clarify which documented timeout belongs to the NVMe/TCP host and
  target, as suggested by Randy Dunlap;
- add Hannes Reinecke's Reviewed-by tags to both patches;
- rebase from aaedcff90148 to nvme-7.4 commit 9afc1b71d963.

v2: https://lists.infradead.org/pipermail/linux-nvme/2026-October/066922.html
Documentation review: https://lists.infradead.org/pipermail/linux-nvme/2026-October/066933.html
Target review: https://lists.infradead.org/pipermail/linux-nvme/2026-October/066956.html
Host review: https://lists.infradead.org/pipermail/linux-nvme/2026-October/066957.html

Yingjie Wang (2):
  nvmet-tcp: validate the TLS handshake timeout
  nvme-tcp: validate the TLS handshake timeout

 .../admin-guide/kernel-parameters.txt         | 10 ++++++
 drivers/nvme/host/tcp.c                       | 34 ++++++++++++++-----
 drivers/nvme/target/tcp.c                     | 26 +++++++++++---
 3 files changed, 58 insertions(+), 12 deletions(-)


base-commit: 9afc1b71d963090e2f2aa5b2f390957823ae943b
-- 
2.43.0

