Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0D9385D72;
	Sat,  3 Oct 2026 08:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791014956; cv=none; b=BB/VQf3IpsyKEhW9bcKrEgo/BvdVPQUKgdq5Z3/eoXqwNanmz7lMriA1tVXYnnn/21aWPaAthf2jFfEJTmTBJujTiJvTDmnttIiUBRrUvhIFIkLVjqk42gVKetTIjXJ7auHtmv0vN6WroPheItMvL/BHuNmePIUSmS+a9mWcyRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791014956; c=relaxed/simple;
	bh=AO6OeQe35cMmm1V5HfDkuj7zGE20gej0tFJxBUmVmcE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WemB65lXpcYVmKl2vS8DKdWN9Q+l7Y6fs3flulc0dIvR8SdDULhBLlj4JCveJpQtnVo9KVQaQZli1hL10DRUsUb/ZVENnphkoZ7UMfUPSgOPFCjwNqYFMaHX4gxv1lCgSbBuENWXCJ4rgFpp8WXYfj8lFJ+APHtfxB8FY3D+EQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=l14TCs4U; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="l14TCs4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=8G
	hKk2nTq2RR688LYuSyOOQ+tucJk5s5BfYKhzx1QEs=; b=l14TCs4UKZg/C8LLmH
	+mkr5oraw1U1Jibb45VxkqCbNQFwu+9MEqmDgm68e2rU4rVUqiziXQICD8cwvXJd
	mgQ7ts2VM7Eu05+mPOB6f4vnckbeSsDvykN+Y9al66dXBCivezPnvbExO4eb1LDg
	CCgTQO9Pz8B0oisDV8RFQwf2c=
Received: from pc.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAXUUoWuMBqJEyNCg--.37657S2;
	Sat, 03 Oct 2026 16:08:54 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/4] media: wave5: fix runtime PM error handling
Date: Sat,  3 Oct 2026 16:08:48 +0800
Message-Id: <20261003080853.430099-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgAXUUoWuMBqJEyNCg--.37657S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw4UtFWrWrWxKr15CF1rWFg_yoWkuFX_Wr
	Z5Kry7Wr1DJa1DGay7t3ZIyFWjgFWkurW8AF4jv3W2qFyjyrZxGF1Ykrn5Aw1UWw4Yv3s8
	KrnIvFy8ArZrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRRiF4DUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7xf9OGrAuBdNdQAA3A

The Wave5 decoder, encoder, and close paths assume that
pm_runtime_resume_and_get() always succeeds. Runtime resume can fail while
enabling the VPU clocks, after which firmware commands can access unavailable
registers and cleanup paths can drop references that were not acquired.

The encoder close path also calls pm_runtime_resume_and_get() instead of
pm_runtime_put_sync() on three errors, leaking an additional reference on
each failure.

Check runtime resume results before hardware access, preserve the required
buffer and job cleanup in callbacks that cannot return errors, and correct
the encoder close error-path reference handling.

Jiale Yao (4):
  media: wave5: handle decoder runtime resume failures
  media: wave5: handle encoder runtime resume failures
  media: wave5: handle runtime resume failure when closing
  media: wave5: release runtime PM reference on encoder close errors

 .../chips-media/wave5/wave5-vpu-dec.c         | 55 +++++++++++++++++--
 .../chips-media/wave5/wave5-vpu-enc.c         | 25 ++++++++-
 .../platform/chips-media/wave5/wave5-vpuapi.c | 14 +++--
 3 files changed, 80 insertions(+), 14 deletions(-)

-- 
2.34.1

