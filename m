Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595772;
	b=oUJrzw0R3F2O8gglTmsCUw4Y+hXzCD0UWW/oemfFtEZimoosGpGBANxtzwPCDymNPnG9
	 8GZgx4ritGKiCsDAYhWX0IoyiVufuIyY1bSsHWCPozBK3hVeX410D/y9lTyXa6qAn4Cuy
	 LSj2FsAEtR2ngO/ic422VNCEaPgCrGKpf9FAJwrmieNXqsMJ6zNgzHKObEk3nW0RM0FMG
	 zvYnZlmK9o1XuT6JjLXfLYEh6Ceke5OquLh4hKrJE5DXp3YCeecEybbSYKdmX816fANaq
	 dQa0jIPqO/8ONivn9/SxrWVsRQTmS3knGaE+qhCi38VcpYyPqQ03JlGhk8tUjB+pBFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595772;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=EdLAwwrbIiB00DtkHeGjZXAWesudShxBxM4tqB2XkkM=;
	b=Bi2XTzK81iZPDjTonYNFeCcUTwyu1Apxfy5x0uiXqVqjoo4IHl3btqWfl9dbEOBc/D0t
	 QTvXQMdMn+vE3FLclFN3p04oXvYebYdhVzjYHsMYCNu3wdcZmp2nNvLJGYPPJKtg3aa8K
	 7vLSuAXhtrR+5ZFv2eFmyfY4DqiRSrJ7UfBjjGOpqWp8qKtbpNm//0kEmazRlXAwd6B7u
	 l2ulpRrQR7P6Craw92jCDwytydJPpWobCcww9+2/Z6vrWtxPYMvIIYT95wM63UWxC/oRP
	 QQJTWbeScSitfbnpc3oA2K2JReHSsUN2kC0TYqBpZ0kXWO0rUovJgm0Ck3VVRy5KZlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KGAEC+RE;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF146606A320;
	Wed, 21 Oct 2026 15:16:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF146606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KGAEC+RE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ed
	LAwwrbIiB00DtkHeGjZXAWesudShxBxM4tqB2XkkM=; b=KGAEC+REQp2jXHPN2u
	sGPCFxsbkt13LAm4YNpE/Vfy/sQZH/IKcdC8C/5Ckxf6hFaB/pxlk0yzYpaRTVL3
	sQUAFPjt+tQ/wFUXztEzwv8wBFnjVhFOhS0Iu48To4y9pH3BKoDizYbCOBKHq1qs
	IIyy48Rf1o7KewlhI+OGbn/Kk=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDn93cq19hqoFfvBQ--.50052S2;
	Wed, 21 Oct 2026 23:15:55 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] media: wave5: fix runtime PM error handling
Date: Wed, 21 Oct 2026 23:15:47 +0800
Message-Id: <20261021151552.428590-1-yaojiale02@163.com>
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
X-CM-TRANSID:_____wDn93cq19hqoFfvBQ--.50052S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4fZrWkZFW3Jw43uFWrGrg_yoW5Jr48pr
	W5Ww4akrykJFn2yrs3Aw17Xa4fJ3y8Gay5Gr1SyasrZ343Wr1SvrW0qa1jgF1DXF9aqa4q
	vw4Ut343uF10yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UHpBfUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8AvQC2rY1ytjqwAA3m

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

 .../chips-media/wave5/wave5-vpu-dec.c         | 49 ++++++++++++++++---
 .../chips-media/wave5/wave5-vpu-enc.c         | 35 +++++++++++--
 .../platform/chips-media/wave5/wave5-vpuapi.c | 47 +++++++++++-------
 3 files changed, 103 insertions(+), 28 deletions(-)


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.34.1

