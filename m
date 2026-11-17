Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884226;
	b=RgQ0dW29mZ457vUCPxYcSPMyg4AmqWMytJeXJsERxtFd7AJ1pJmen7YxdX7zo++Z6qIs
	 YS+Sg/zXx4qTuQ+A2OJ9WNDY5HWyDKaR+b05XvMexNSCasRrbHAzbgGdpP1M8GjOycfz9
	 0bgIWQHuc0J7YJt2GZgEuxw9aFJF9XWxT3J0elGv4jeweOIbscOIewINmOyAdKiYnDprO
	 xm6O7NgbcQ+jn0K4gpv9fM9X0+gATTgjLovkv3VtzdMTSsIxw7B/D/9iQavuN9OI2cgPg
	 xgoUJK9uJnmFUHpaGJvK/ctrvSctP7LqxBcKMoIGYKQx2MbLtbrNWUwmfF8XTEkR1CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884226;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:To:
	 Cc:X-Mailer;
	bh=H+W8VLD35JYBchsjwLqIneI/2/pBJGvyqvo7Y3mgx4s=;
	b=cfVNsPE9rAWOhjCUYDWf4jZ3ViYxNSxUM5pMKv9QBZA8MHB9eKdAJQjESeA1u4LoZgfI
	 I7GDJjUgfKsdmCG56DqnROisCfMHESVc7x94LXf9Slgkmv4waZocXh+PemuN47v2+8+T/
	 pK8ojIwtAzBQXtFiZe98+ins+IZqT7uTglYauSpMK2vTmetQV7NWF0b40/aRC1F0ICoQO
	 qi2AkA06QrDrzDS3z5R9ToI/R7cctj/DT9Jk2ePLixQxLVkmV8C3jIzbxKKRWEi2raHGL
	 3N+MBZC8q7DpxKNOELkzBvHpKUCgKzWcvAQDaQYlDjccFDdFNeUjxUS/bNSRirKjcgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=orLaJ21c;
	arc=none smtp.remote-ip=95.215.58.37
Received: from mta1.migadu.com (out-37.mta1.migadu.com [95.215.58.37])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3733606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3733606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=orLaJ21c
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pjmw2DXdHjzYOG43hIsqQG79giXui/V+G7YocSUZJKg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794884223; v=1; x=1795489023;
 b=orLaJ21cPqSABAN0uzdThRdVKQv8D8ujNrnsj8bpb1Ej6+Ds1sbJlcTDQP/nPM5rOEpYccad
 Gd263W8sV/PvSO3EwkFEHCq5QISH9pC22SqvBfR0v3NkddGXm3b7O7wMvatjaqFW7hxOzwfXeU4
 mLth8m7gKlriKyeHXIrhp928=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3c523f9f826b9f15;
	Tue, 17 Nov 2026 02:57:03 +0000
X-Mizu-Trace-ID: 3c523f9f826b9f15
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Subject: [PATCH v3 0/2] block: make changing to the current I/O scheduler
 cheap again
Date: Mon, 16 Nov 2026 21:56:53 -0500
Message-Id: <20261116-bug-block-elevator-unchanged-v3-0-cb4dda2dadf4@linux.dev>
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
X-B4-Tracking: v=1; b=H4sIAHbC+2oC/43NwQ6CMAwG4FchO1vDCgJ68j2Mh0ELLJLNbLJgC
 O/uwAs37e1v/n6dhWen2YtLMgvHQXttTQzZIRFNr0zHoClmgSkWMg7UYwf1YJsH8MBBvayD0Xy
 rBKpoCKksJGWViMTTcaunjb/dY+61jwfv7VuQ6/ZPOEhI4VRl8lzVlDPK66DNOB2Jg1jhgHss/
 4HhiinZckkltirdY8uyfAC4d341FQEAAA==
To: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>, 
 Ming Lei <tom.leiming@gmail.com>, Nilay Shroff <nilay@linux.ibm.com>, 
 Hannes Reinecke <hare@suse.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>, Christoph Hellwig <hch@lst.de>
X-Mailer: b4 0.13.0

Writing the scheduler a queue already uses to queue/scheduler takes
about 10 ms and freezes the queue, which stalls I/O on live disks every
time a udev rule or tuning tool sets the scheduler unconditionally.

Patch 1 stops requesting a "none-iosched" module on every write of
"none". Patch 2 returns before freezing the queue when the elevator
wouldn't change.

On a null_blk disk (median of 20 writes, all kernels measured in the
same run):

  operation                   base (ms)  patch 1 (ms)  patch 1+2 (ms)
  none -> none                    13.10          9.11            0.08
  mq-deadline -> mq-deadline      10.95          9.05            0.08
  mq-deadline -> none             13.00          7.97            6.03

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
V2 -> V3:
- Point Fixes in patch 2 at the commit that added the freeze, as
  Christoph pointed out
- Add Christoph's Reviewed-by to patch 2
- Rebase onto v7.4-rc2-1025-g666539eecdf4

V1 -> V2:
- Keep the elevator check under the freeze and note the race in the
  comment, as Christoph suggested
- Say "change" instead of "rewrite" in the cover letter subject
- Rebase onto v7.4-rc2-470-g7e1392a42ea2 and update the numbers from a
  new run

v2: https://lore.kernel.org/r/20261114-bug-block-elevator-unchanged-v2-0-5a1fe7d72fa0@linux.dev
v1: https://lore.kernel.org/r/20261111-bug-block-elevator-unchanged-v1-0-583198bd4e21@linux.dev

---
Qiliang Yuan (2):
      block: don't request a module for the none elevator
      block: return early when the elevator doesn't change

 block/elevator.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
---
base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
change-id: 20261111-bug-block-elevator-unchanged-a6cd2d761d38

Best regards,
-- 
Qiliang Yuan <qiliang.yuan@linux.dev>

