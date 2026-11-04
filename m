Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811016;
	b=s+YysrKaFPZOUxasbiB+FLB8JU0+75RWUdi4DYZzKAaEwK1s4Ejf1esauZB/alWf2evC
	 T/ZZjahRX/4LrL79Se1J0iaDz6DVw3u/rVNO4NHxt05os+k8S5SmpnkyxcvJJhQDumQ3m
	 MtbwcGoqivvyJP4b1BXI482VLmLLJGjaSNgK1FEEaZqrbnlZpRh9tHtW2AickwWS4Fz+K
	 6n4fVR5RrAJ24+rWTDsCp6H3pLGTeIvwctiP2ksEZ5EiB8z6tjNzMiYRk6L3JV/qmOdDR
	 TgjGrOOC6HOz5yHXvmcrcMBCkJEvZoPM66QNoUrpx/0Ndwlns0qqeriBYoyMiTgslLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811016;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=ZclUos6zhiP0jw7ZtxiOvkyNi6042C1+3TQ0krAy9mA=;
	b=IXHcBfjKXxjT5ctHPoQ+lpffhCqiVDyjMwpj+fLn5l35P5AYpXH4wxqpTchSpZ6OJs95
	 FFTIxP6eUYdu5zxCJvlsBolpTlIoTos25z5PBdUOYcfRY6fV9Ml9RwL80xiNK+KwuXOTJ
	 nWyLnjquWuHfIuWxZjUIMF4c9LJNNIVpCUpSzxShLkCAYPbBcW0UBsGXdwbmtKajiYnlB
	 pxGol0JwOLk0ghoAW064HrS9PQ4HB0AdUQvDVdJsNhJpeFulh7W9VPSq8zJkHz+GzDMdT
	 ecIRdqxHdraa2UZb15MDN7mi/rOxJIxok3oK5orIS73Y55wQWttIvVafYnVmiBifvVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R8CZWTpF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE07606EE8E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R8CZWTpF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF50E1F00A15;
	Wed,  4 Nov 2026 16:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793811016;
	bh=ZclUos6zhiP0jw7ZtxiOvkyNi6042C1+3TQ0krAy9mA=;
	h=From:Subject:Date:To:Cc;
	b=R8CZWTpFONfM8ysslHzZ230/S602fbk70oVCVRgZ/TvuOMeIQ7GI6vD87SIXI1mYQ
	 75iazJNg8/NLR9QBUP6Gsh1zib6hm0MCVmcPWkc6vw8AN2/G/sbDJW0SiBMR1FkBUq
	 o9ns2ushtc82dC8yPgrVyBoUTjBudAw//+BKY3NsXznyntZ/xrPyz3TYRMfLiBTuqP
	 DCmw77YRG5DScGSdnyc4fXIyGEjj/5KxcF1lLv1FcPQIdTblIBwgTJ0vhqrALjkeZ2
	 4UftRGr3Z5YeUBFQRB3YeSCLBIty49O0QBe5EkBpLRNKxqoHiz5VPfTvNiKdAAswH7
	 FNtyq+p0022Qw==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH v2 0/3] kho: fix bootmem sizing
Date: Wed, 04 Nov 2026 18:50:08 +0200
Message-Id: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OQQ6CMBBFr0K6dpSWAurKexgWBQYYkdZMkaiEu
 0tx7/L9P/PyZ+GRCb04R7NgnMiTsyuoXSSqztgWgeqVhYpVJmWcQN85KJ0bBxzA04dsC2mdGax
 1bpROxPr4YGzotUmvxY/9s7xhNQZTuCiNRyjZ2KoLkWNqyR4G40fk0HfkR8fvbdUkg+fvgElCD
 Do1Jtfx6dgk+tIjW7zvHbeiWJblC3yt8dTnAAAA
X-Change-ID: 20261103-kho-bootmem-sizing-5d6aed47a243
To: Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>, 
 Kexin Liu <liukexin@kylinos.cn>, Sourabh Jain <sourabhjain@linux.ibm.com>, 
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-Mailer: b4 0.16.1-dev

There were several reports about issues with KHO bootmem sizing.

The bootmem areas are sized from overlapping views of the memory reserved
in memblock, so on NUMA systems memory allocated on a node is accounted
twice and with CONFIG_NUMA=n the lowmem and the global areas are accounted
once again in the area of node 0. Besides, the lowmem and the global areas
are reserved even when they are empty.

The first patch makes kexec walk the bootmem areas in address order.
Otherwise kexec on arm64 may fail if a small area at the top of the memory
is the first in the list, and with smaller bootmem areas this becomes more
likely.

The second patch skips empty bootmem areas and the third one makes the
lowmem, per-node and global areas cover separate parts of the reserved
memory.

---
Changes in v2:
- add a patch that walks bootmem areas in address order
- update kho_bootmem_cnt directly in kho_reserve_bootmem_area() (Pratyush)
- don't reserve the lowmem area if ARCH_LOW_ADDRESS_LIMIT covers all
  memory (Pratyush)
- extend the comment above bootmem_size_update() (Pratyush)
- Link to v1: https://patch.msgid.link/20261103-kho-bootmem-sizing-v1-0-45aa74098f34@kernel.org

---
Mike Rapoport (Microsoft) (3):
      kho: walk bootmem areas in address order
      kho: skip zero-sized lowmem and global bootmem areas
      kho: fix bootmem sizing

 kernel/liveupdate/kexec_handover.c | 212 ++++++++++++++++++++++---------------
 1 file changed, 128 insertions(+), 84 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-kho-bootmem-sizing-5d6aed47a243

--
Sincerely yours,
Mike.

