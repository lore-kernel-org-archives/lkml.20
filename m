Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872390;
	b=tG6o+xQ9KXt3KdUZeLm+s54cqyk6OXzASu0VYZZBKRPVTuX9L52Ol3l8gnDNEU1637DR
	 vVMCcJm44dZvuhwfhR3a9aYthDpF636ntNYLZusIWFPqU2Z+2FhDqaP+IsjRZsNIMVic/
	 B8nUFN0yXBeU14OWmyHG4Vn+zScNnRKJo4HLBmFqyC/nQrF7E+9vjTA7FCpd3iYylzXNT
	 BDVrfG0FlDMQoCOXHFtZnErV66LL1ciub0glK6RmUb2us2ZNJ3AuvWdmxUvNQx+GMamlu
	 M58P7nRLLmQ3wyX1tVYb6R+Wnt7WNK+gMOZssvsaAf0G9vENvZTPCl5Ul9hXvbo42CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872390;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aFffXURD64Y45svN0+A+/kAHMGgDt4bDmohfFFHf6vQ=;
	b=kjlp/aaChVEvnxl1qjfszTabRrAfzkKoYSxtaN6aoDOdtH5MLNFp2/EtIsVhjTaa45ww
	 j45H6xczfEfd8k3mh6GsFBUD0LdLwz+eMgnMl4mbDTHiwGHlWSwrPjndrVwi2AGNCorqd
	 HBXQm2l1XIT2Hvt3MmlWdA4gXYzWuIfVzJP5gvZt2bnc4fzT45rg1fkTWYRA9vjukuH52
	 WNP6coo1n3SRh4BbQBHeRN60ASUz+63yNIMiyTR40NkLQmtHviSlHDaHZ/+ct9qADSa5C
	 /6C0qQdat4NGWfAZWmXkZRPrk1MLNPYEQNEsB8CxhS5mT5Qb+6ewIAyaz3fgMhrQBFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=E8PRhFRF;
	arc=none smtp.remote-ip=115.124.30.124
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3588606D833
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3588606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=E8PRhFRF
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793872384; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=aFffXURD64Y45svN0+A+/kAHMGgDt4bDmohfFFHf6vQ=;
	b=E8PRhFRF5CfhT37+GXGLMWy/5jJMjPyirI0g9+3WQ5xxbQ27gO3boNtGGXQTrqR9TTJY6lf0pAmNWi2P+nAKQBdfi+QGV45SFbiN/3cWfJKzrBSOqgZid3MOLMKVfMG7bWWhFCHFlpwifG+e/0jg+fr2IgNJ20U/nfNG3dL2iDQ=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0XE8JNoa_1793872372;
Received: from x31l07246.sqa.na131.tbsite.net(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XE8JNoa_1793872372 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Nov 2026 17:53:03 +0800
From: Weilin Tong <tongweilin@linux.alibaba.com>
To: catalin.marinas@arm.com,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] mm: kmemleak: avoid long RCU read-side sections in reports
Date: Thu,  5 Nov 2026 17:52:48 +0800
Message-ID: <cover.1793871596.git.tongweilin@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
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

Reading a kmemleak report can traverse all tracked objects in one
RCU read-side section and cause a stall.

Serialize disable-time cleanup with clear operations and report readers,
then use kmemleak_cond_resched() in both report traversal loops to let RCU
progress safely during long reads.

QEMU/KVM tests on mm-stable 6628e7d4c6b25:
* With 134 million real allocations and no injected delay, continuous
  RCU sections fell from 23.11-23.38 s to 126-972 us. Total reading took
  23.11-23.38 s before and 23.67-24.09 s after. Neither kernel stalled.
* With identical 300 us per-node delays, only kernels without patch 2
  stalled. Patch 1 eliminated overlapping cleanup entry.
* Under lazy/full preemption, 560 concurrent-removal cases, 20 deleted-chain
  cases and debugfs read checks passed with KASAN, lockdep and DEBUG_LIST.

Weilin Tong (2):
  mm: kmemleak: serialize disable-time cleanup
  mm: kmemleak: reschedule while reading reports

 mm/kmemleak.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
