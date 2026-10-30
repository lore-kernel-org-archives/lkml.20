Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352112;
	b=wy3WyCh4veP3wzqsNtVH/HzkJ0/z646cZRxq7ozqj7DDG3DGjIdlpaufDpe0qQ/uKoCw
	 1Xojw55O9e6HyGXgKKlNjBrKcl9fb6SMQOrDZBKg/T/dL7Ud18581ocDfScbDKYf/U6O3
	 kSSZYuewwK48ddOt4kJo9ci39zKBdJ1vvJ3DTQ9eWSEFipS0ys5D1m3GU+KqcQrhzmg/u
	 fxP6xllf/+QMwslgRYkKCl3BLwJJ6uvM0bDcRBXCHvmlr3Xg4PwRqcyMZzMQyg9yxkPaS
	 dRaIHisipT2zBNHed6Y9jIazN0e4h8j5gV0X0n0vm7EUzNAbL6KYEE39sMGA0qvJS2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352112;
	h=DMARC-Filter:DKIM-Signature:Cc:Mime-Version:X-Original-From:Received:
	 X-Lms-Return-Path:Subject:To:From:Date:Content-Transfer-Encoding:
	 Message-Id:X-Mailer:Content-Type;
	bh=Rl7hUBDgjTnfIzu7sgeiF6Xol7EVQjp53Fwucyf1OiU=;
	b=2r6pfMX9Y3DUOFpwSqX2qLS1tUXCkrabSYjcwu/IZlymbndtYNbtfTQ/iDkXIRiScHpO
	 sqvTaefyYBam1EwOCsHGr5BALRbGGc7gPk0GL/Kuj2Ypft0DG4qUZNxAkyB652GutQRZa
	 4BkAjiLbCU5LPTxK4JSvM+Ga+W4mcNiOS8OpWKbm5xiD9vXvJW4WUlxa4xgpNATmH1ZzF
	 0n8pVIodZ8bSQRVGFqOWhTnUtsRfrrgqtGv1kGf+WdN0fMrzZ5N7Ps0RAfB16dZP/zerH
	 z7al4l/gkVC+uxhqFbTNukDft8CSx5OdJURavuGcykhwkrODBilvLraiAJSF7RjH5hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=fnnas.com;
	spf=pass smtp.mailfrom=fnnas.com;
	dkim=pass header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=tHmb8EHc;
	arc=none smtp.remote-ip=209.127.231.39
Received: from va-2-39.ptr.blmpb.com (va-2-39.ptr.blmpb.com [209.127.231.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D56606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19D56606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fnnas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=tHmb8EHc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1793352099;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Rl7hUBDgjTnfIzu7sgeiF6Xol7EVQjp53Fwucyf1OiU=;
 b=tHmb8EHcMOdKeS7aGcNQCVubSQTdoA+rLY9d4aytqaqTliKX0mxD0ig6WojFNAlj56eBqj
 EoYqVvK5AnMa4xcZVOXEtKo1q1xKTTdvyJDF/z69ZVop7eYyUEjkcuGGFbMaktAgbT1wBH
 J2+GLngdBwigGMDViusimvDeEACMAkT7Ht1YfQ926yc0/Mvmu1GEtEJiVeoiQqBpWVyCdX
 xf8nGZeEeProxQoSL/RHXCjjMKjow2G/yivqnm80bYBtvboa0d8vQvYsg92/PHPvqGpmfb
 UsalmSdoxhhmXdtwPKTXgaOEoTSLDH1frslQwfkRwpHkSFUB4yhT1s7T8W12FA==
Cc: <stable@vger.kernel.org>, <yukuai@fygo.io>, <chencheng@fnnas.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Original-From: chencheng@fnnas.com
Received: from fedora ([183.34.162.132]) by smtp.feishu.cn with ESMTPS; Fri, 30 Oct 2026 17:21:36 +0800
X-Lms-Return-Path: <lba+26ae461a1+f67f4c+vger.kernel.org+chencheng@fnnas.com>
Subject: [PATCH 0/2] dm snapshot: fix discards spilling into the next COW chunk
To: <dm-devel@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<agk@redhat.com>, <snitzer@kernel.org>, <mpatocka@redhat.com>, 
	<bmarzins@redhat.com>
From: "Chen Cheng" <chencheng@fnnas.com>
Date: Fri, 30 Oct 2026 17:21:27 +0800
Content-Transfer-Encoding: 7bit
Message-Id: <20261030092129.1671254-1-chencheng@fnnas.com>
X-Mailer: git-send-email 2.56.0
Content-Type: text/plain; charset=UTF-8

From: Chen Cheng <chencheng@fnnas.com>

Hi,

dm only splits discards at a chunk boundary for targets that ask for
it with ti->max_discard_granularity, and dm-snapshot never did.

So a discard can arrive starting in the middle of a chunk, or covering
several chunks at once.

zero_exception() zeroes the COW chunk using bio->bi_iter.bi_sector, which
remap_exception() has already turned into "COW chunk start + offset
inside the chunk".  The zeroing window is shifted by that offset, so the
head of the chunk we were asked to discard keeps its old data, and the
tail spills into the next COW chunk, which belongs to a different
exception.

Patch 1 sets ti->max_discard_granularity, so dm hands dm-snapshot
discards that are split on chunk boundaries.

Patch 2 makes io_overlaps_chunk() also require the discard to start on
a chunk boundary, and completes the discards that don't cover a whole
chunk with bio_endio() instead of sending them to the COW device.

Thanks,
Chen Cheng

Chen Cheng (2):
  dm snapshot: split discards on chunk boundaries
  dm snapshot: fix discard writing into the next COW chunk

 drivers/md/dm-snap.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

-- 
2.56.0
