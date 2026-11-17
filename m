Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926989;
	b=yCagqC/6JmqZKRTrrdrI1Ho4jbnjGxmTVfCE92/yV0AkQjvg7wN43ZdX7cCvutMAwV0w
	 atGndKtv8OD1zNmrsqedMUlp+DnhCkj9Z31pR0jWifI/2KTJ63aH7htak0KjcenrFBMUr
	 Itxp1Iy40HTCDJTFN+jKlTHhYjpy+R5W8Hv4IiF4lDUzqNvPjLu1x/l4Ls6sKpg3naxbE
	 8AWumGj5h+uVKLf86ZOhXSo787aXh6HXtFPaIHhPNqU5wkIrSqTPsNxfoeDBP3v2v3331
	 PJdYkdS88Pfk8vayJymkl4aMlWClcmvohrA1qz5hJvESrK6cM76VrwsbOwskfr15ihA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926989;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=k5JLa5z2ao/Jo+dDNfS00rpTQJ1m455hXn2lMaEG8+o=;
	b=Fpo4/V2XhXDGJAsVGUqqx2lFgRWCXiIJCTyBPT6Qc1WXjEGa0BsT9KNbLIdcz7j0e2FA
	 1T0QPOiqvkltyypE/xBDEy7NfcK4Shph7jxRXGF0lY7GVuHpINu7WHhlGyi8ceOQCqgAw
	 STAs9/2ANsoN2Ss96mLIldp/adNdmAVGzM8gP2YM6XksyhspfeKpkCwEUfIKwkEAkQEh5
	 7C4rRrZmffx+xiQ3OE8G7WHgcJLFhsBfYVWvr/zkN/X+NIXpRlqZ8POUHRgRXcIPC79le
	 T5sSp08toxoBzYkYHz8byr5r+CTdnwdrm4oatCYJgGIhC8ZDRTaCLScgiRdGGITus7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b="sHjl0k/S";
	arc=none smtp.remote-ip=158.69.130.18
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99E4606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D99E4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=sHjl0k/S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=smtpout1; t=1794926987;
	bh=k5JLa5z2ao/Jo+dDNfS00rpTQJ1m455hXn2lMaEG8+o=;
	h=From:To:Cc:Subject:Date:From;
	b=sHjl0k/SqidiT00X2yUFZjuCIlTUVwZAfka2xLygJBTkMJD7GndljP0bKFP21poXV
	 SkgwqW7uG/XgzkX2/swdsbbSCqxF9CS81H9/zcq2tXunYLlcEq5Y8iSVO6BtHrCyHw
	 eR6Gj7mV0/wJ5Rz3J9Pp1nGwxtXlPQP5c1OOlI58H+VxI5N6Qb5wBx8O2TG8IVtCEM
	 tAm36YBDk0Nyes7F13Zyq3/zsjVQE28vBuzCXFPPxkMWr0St2P4FB6Dn+zOZvj2yO0
	 RKs5Ol4r1bHXl/zT2pPhIPZXM9ihmTWuLBtIp5qqWHDOXYF3uf7AE6zoxd5Bti8Tzl
	 +lzuwdqvyuYDw==
Received: from thinkos.internal.efficios.com (mtl.efficios.com [216.120.195.104])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4jTSLg6LyKzRZS;
	Tue, 17 Nov 2026 09:49:47 -0500 (EST)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: juri.lelli@redhat.com,
	peterz@infradead.org,
	mingo@redhat.com,
	vincent.guittot@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	luca.abeni@santannapisa.it
Subject: [PATCH 0/2] sched/deadline: fix the 0-lag time and extra_bw accounting
Date: Tue, 17 Nov 2026 09:49:43 -0500
Message-Id: <cover.1794926626.git.mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
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

Hi Juri, Peter,

These two fixes are the ones that v7 of "sched/deadline: bandwidth
accounting fixes and selftests" announced under "Found, left for
separate patches" [1]. Both bugs are in upstream code. The Sashiko
review of v6 found them.

The fixes:

 1  Compute the 0-lag time on 128 bits. A task with a period of a few
    seconds then no longer keeps its bandwidth seconds too long.
 2  Spread extra_bw over the active CPUs only, in the two places that
    still count the whole span. SCHED_FLAG_RECLAIM tasks then reclaim
    their share.

Patch 1 applies on tip sched/urgent alone, and is marked for stable.
Patch 2 needs patch 4 of v7, which makes __dl_add() and __dl_sub()
accept 0 CPUs: dl_bw_cpus() can return 0. So this series is based on
v7.

Testing
=======

Patch 1 has a reproducer, which its message describes. It fails on tip
in 6 tries of 6, and passes with the patch in 6 of 6. Patch 2 was found
by reading. extra_bw is not visible from user space, so I have no
reproducer for it.

The 112 cases of the v7 selftests pass with both patches, in the 19
QEMU guests that the v7 cover letter lists. No kernel warning is
logged. Each patch builds alone, and checkpatch is clean.

How this was developed
======================

An LLM coding assistant wrote these patches and their messages, under
my direction and review. A reproducer that stops failing shows that the
symptom goes away. It does not show that the fix is the one you would
have written.

[1] https://lore.kernel.org/all/cover.1794922146.git.mathieu.desnoyers@efficios.com/

Mathieu Desnoyers (2):
  sched/deadline: Fix an overflow of the 0-lag time with long periods
  sched/deadline: Count only active CPUs when spreading extra_bw

 kernel/sched/deadline.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)


base-commit: ec6f6731538e0d45872eb279fdeb477bed152d6f
prerequisite-patch-id: 5e2478ffdfb7583751bf44bdf87fb930bc23551b
prerequisite-patch-id: d5e5ef986ff2d9bc39a87b56e96a2acbd3158687
prerequisite-patch-id: 99e47f80396008ee2b2576157d37842481ce52d2
prerequisite-patch-id: a10824f98c11a4c902dad55cab3ec03b3dbe2c8a
prerequisite-patch-id: 6a944081caf562b37b617f6a763fb9c5e93b7671
prerequisite-patch-id: 16acf1d18f01d20310d6db767dfbec2f072e0372
prerequisite-patch-id: e1946bb015a7b14ed4e2cd0421e5e30b0c7afdda
prerequisite-patch-id: 4daf48a89779fbd8c8bc5fc1d7a7d6df9bca2d9d
prerequisite-patch-id: 069eafdf81a30c046a1a54638a2716d3f7d5b15c
prerequisite-patch-id: f8b34127a06e7503c069fb08e275574569aa1663
prerequisite-patch-id: 867205dd61f1097dba3faa6648243622e0a57112
prerequisite-patch-id: 00e953bbec4bd21e5d5ff6e218ca02ec3d77189f
prerequisite-patch-id: fb69a0665dc38ca9022cc2bd75234a90e2035b7f
prerequisite-patch-id: e5b851fc06511b47520dbbd96a7823cb28e83904
prerequisite-patch-id: 6e7ce0551aae3d1e5cdffcb79a9dfad9572d171e
prerequisite-patch-id: 8574b50d81a09ec6091e42d65338adcab2986d71
prerequisite-patch-id: cf098d7617ec51026a60140b231640a73a67be83
prerequisite-patch-id: b4ace4d6fbffab1d45765c86650ca535c4bade7e
prerequisite-patch-id: f6b9bef6e53a08be446fd431a8d6790470c74234
prerequisite-patch-id: 1aa25df96d60d30f549c71fdfba5589cb239928f
prerequisite-patch-id: 3f22a07ea1846d81570daafd00db92f077a6703e
prerequisite-patch-id: e1dd6913718da692992ed4c0304e56b93195327e
prerequisite-patch-id: 42ce74717bea531db1419582c647401d4edd497a
prerequisite-patch-id: a005df845d96a168895545d1ee2e003b353fbf98
prerequisite-patch-id: 7db308c051f710d98bdd1f661be5b9fa33120760
prerequisite-patch-id: ecd0fc0d0327f8eef27f504a92696c0e38622ce6
prerequisite-patch-id: 0b15882cde9c46c6a8bdd6f9d66b00b1b9669749
prerequisite-patch-id: 90bd9e96aa9b038296989ea3ceb3588b98c4dc8a
prerequisite-patch-id: 28aa2285131a249c03ec360b8ee95f427314c9ba
prerequisite-patch-id: 3d3525d4572c00db7586a2b863c9e918a0eb0c15
prerequisite-patch-id: 73b7bf5a66a4b43ebc393b7a77ec59cf92c6f944
prerequisite-patch-id: 9b860d340021441081e605651f409c46769501f2
prerequisite-patch-id: ab0784c824416be573685aac9c771dd4da6b15ca
prerequisite-patch-id: 2349b9f4fe6ec67608d52fb4ce3ae8b42d4e7471
prerequisite-patch-id: 1c864890d70c38372dc4ae9326e41b794e163ab8
prerequisite-patch-id: 3ba4159520b960e8059ccec735876cfeceaad5f4
prerequisite-patch-id: d38384e0b7d043a3556ee02fb09316a6227038da
prerequisite-patch-id: 72c83e4083d683436569565488149534319d065a
prerequisite-patch-id: 727a8041cecc638f8051ad069b7606515c1739c4
prerequisite-patch-id: d5fa12141d48e70e41d8fe3637facdb25f97d698
-- 
2.47.3

