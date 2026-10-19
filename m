Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6EF48489C;
	Mon, 19 Oct 2026 08:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398050; cv=none; b=kH77godCRM8/QDmjmCa9oh+g+Ph5QebgBkGHLAFHjb0xAkuX91ePL5eoA8ZM90UwM4fNaBBeuQqSqjQwHNMls0o8NRbLA4YEreAhbwfV+fOpn6bpg3BHMpcJYcKIL3igt8N3aptOTkLmEMtM952JmUqcb7yhEDuWU+8pTLc6mn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398050; c=relaxed/simple;
	bh=5w0YpBqs5+s6qN4MDpqm4MrjTlg6ilb/1eh+kqwVs5w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BkgsxYHYoysbON96eVCcSX8HIHqd5WDT8KENKDxVZiNcc6YnYvQOioqxxuuH+oKBQoGLIg876ekGieLz2y4iQZRmjQv6qNw7z7dv/bGGGRmMnw8pkLhgPrF2TTvypvviz1b8Ab8Mw5VRHV2zAjcykHJpdgDEuFKn54kSPL9QX3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DtOhObF+; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DtOhObF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ng
	pgJumy5Ed57sdHAxKn+qo+ZhHh9hYnaPda4Jb+p4A=; b=DtOhObF+T2J+rolBrA
	/+sgOEt0+OA35fNfua59B3QGKK/+7okCRswSnhFba4sy9n7U8t5jR/TXVJAM5GpR
	LNatOBf78y0u7qdkUEZ1qnn6FcRGNvOEQLkiddq2529f8lQUv5ccmdXP2NwxA0/f
	SVYGO38hMe45pbMtRQXCLE7uI=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v2DL0tVqxMGKAw--.34321S2;
	Mon, 19 Oct 2026 16:20:28 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2 0/4] media: wave5: fix runtime PM error handling
Date: Mon, 19 Oct 2026 16:20:22 +0800
Message-Id: <20261019082026.1798945-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v2DL0tVqxMGKAw--.34321S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar4fZrWkZFW3Jw43uFWrGrg_yoW8Cw1rpr
	W5Wws0yrykJF97trs3Aw1xXFyft3yrGFW5Gr1ft347Z343Wr1FvrW2qa1jgF4DZFZ7Xa4q
	vw4jq343Cry0yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pREzuJUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQz3MmrV0swIOwAA3W

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

Jiale Yao (4):
  media: wave5: handle remaining decoder runtime resume failures
  media: wave5: use m2m buffer completion helper
  media: wave5: handle encoder runtime resume failures
  media: wave5: handle runtime resume failure when closing

---
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

 .../chips-media/wave5/wave5-vpu-dec.c         | 49 ++++++++++++++++---
 .../chips-media/wave5/wave5-vpu-enc.c         | 33 +++++++++++--
 .../platform/chips-media/wave5/wave5-vpuapi.c | 18 ++++++-
 3 files changed, 89 insertions(+), 11 deletions(-)

-- 
2.34.1

