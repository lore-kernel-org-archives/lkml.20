Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747703;
	b=NrECZRPDqepKngQrgwKzCJPrw6KqAN8MvMZ+Sis/Fls2tVVe0OArhebGV9hSLfr51Bz3
	 QIhC+n4xMELcAr5G2+8MCKYCBIki7hgf2z3UMlUxbXVVQhpAyu+ibLLfhWv1sTs9OfO/v
	 B6Myf70P8xNgr/kl+/wpz0jCai9nIs82efmNSUo1YbY/vbS3bVzd2wtjbbLNn6kereWjL
	 B1mTwUpn/YNytYQ1iUUlDPQqvtE0WzHIWieSp2mCkCcpYTojb4HGKolXelJR+suNK4MI5
	 SqEiUmJjrqbq2nkpvkrdBATPjhqhitlehSLPnIjFhCdpmdbtl8wscaleUpEytr2Z5jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747703;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=1kUdvkeqy8T3wmVDTDAZa58eC+mhNO8rJNXura96AHk=;
	b=rx5Em2dclcX4gIxuKXLmgExoTE6MMKsXe68MONyUtvY/Ol3+RqF5ESArLSMiEoRT7OHk
	 nJCR4WfDqCut/opzLNqwRKYoUi/ivnbrm8MG+WX9qsVxv/J5bQraAcaB9spfTeUr7SYsJ
	 ZgcyMtC0N9zkSoxvK5TBZYUqBEL3P3ATiqBRaIf8a3bwnlI/lOloVkVGRKVcvkywzfOt/
	 J+scfsMxmUKD+lPw1cqFBkz7c94eLb3ZNCvuk4Ig3OShyR1E2s/sbz4Hu5XuntJxFbXRG
	 /SdU1qoV40QXKRhyazYiQ0xPbe7YVaSgiCwTqcL0QxPijXfXRvQF1NSfy7Gm8b5eq+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pyCEdGCr;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18EA606A32A;
	Fri, 23 Oct 2026 09:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B18EA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pyCEdGCr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=1k
	Udvkeqy8T3wmVDTDAZa58eC+mhNO8rJNXura96AHk=; b=pyCEdGCrepAbObIWLX
	xH7kCAWanKGJbSfO39/P4XMrFVRBRN0vUxMLy2wPpqJwavEQQL/MlNGl5NdySsqM
	+zuajzbPvHx7diEjtGOe/FE0NoUDYKoszB1iBNqxCiFrjv/HrAIZvUBeYOFShxQI
	Wl3o3UG4qBf6YOYDKfGPVXcrU=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3KHOkKNtqXHGqBQ--.1363S2;
	Fri, 23 Oct 2026 17:28:06 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] media: wave5: fix runtime PM error handling
Date: Fri, 23 Oct 2026 17:27:59 +0800
Message-Id: <20261023092804.673980-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:PCgvCgD3KHOkKNtqXHGqBQ--.1363S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw4DKr1DJw47Jr4xWry7GFg_yoW5XF15pr
	W5Ww4ayrWkJFn2yrs3Aw17XFyfA3yrGay5Gr1Sya47Z343Wr1SvrWIqa1jgF4DX3ZaqasF
	vw4UX34fWF1FyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UQBM_UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgbE-mrbKKbM6QAA3o

The Wave5 decoder, encoder, and close paths assume that
pm_runtime_resume_and_get() always succeeds. Runtime resume can fail while
enabling the VPU clocks, after which firmware commands can access unavailable
registers and cleanup paths can drop references that were not acquired.

Check runtime resume results before hardware access. On errors from callbacks
that cannot return an error, return queued buffers and complete the active
job. When closing an instance, still release host-side resources and return
-EIO so the common release path completes instance cleanup.

media-next already checks the decoder destination queue resume result, but
uses vb2_buffer_done() instead of the mem2mem completion helper. This series
keeps the remaining decoder resume fixes separate from that interface fix.

Changes in v4:
- Fail both decoder queues and stop the instance when runtime resume fails in
  device_run(), preventing repeated scheduling of the same job.
- Add the Fixes tag and Brandon Brnich's Tested-by tag to patch 2.
- Add Jackson Lee's Reviewed-by tag to the close-path patch.

Changes in v3:
- Move the encoder STOP state transition before runtime resume in
  stop_streaming(), so a resume failure cannot leave the instance in
  PIC_RUN.
- Factor decoder host-resource cleanup into a helper and return -EIO
  directly after resume failure, avoiding an unheld mutex unlock and an
  unmatched runtime PM put.
- Add Jackson Lee's Reviewed-by tag to the encoder patch.
- Keep the m2m buffer completion helper patch unchanged.

Changes in v2:
- Rebase on media-next.
- Split the decoder changes: fix the remaining unchecked resume results
  separately from the existing destination-buffer completion path.
- Use v4l2_m2m_buf_done() for the destination-buffer completion path.
- Stop the encoder and fail both queues on a runtime resume failure to
  prevent the mem2mem scheduler from repeatedly running a failed job.
- Rebase the close-path cleanup on the already accepted runtime PM
  reference leak fix.
- Drop v1 patch 4 because its runtime PM reference leak fix is already
  accepted upstream.

Jiale Yao (4):
  media: wave5: handle remaining decoder runtime resume failures
  media: wave5: use m2m buffer completion helper
  media: wave5: handle encoder runtime resume failures
  media: wave5: handle runtime resume failure when closing

 .../chips-media/wave5/wave5-vpu-dec.c         | 57 +++++++++++++++++--
 .../chips-media/wave5/wave5-vpu-enc.c         | 35 ++++++++++--
 .../platform/chips-media/wave5/wave5-vpuapi.c | 47 +++++++++------
 3 files changed, 111 insertions(+), 28 deletions(-)


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.34.1

