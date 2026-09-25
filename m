Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D7C47887F;
	Fri, 25 Sep 2026 08:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326324; cv=none; b=B+8o0jDFmFSGvnvGofiXaxy3D0BTK44unwbiQTMHlNi7JJ/dqJLjLKnF9JxiHzPQT6Y9vP6WobLtHFEJyM/tCEO0RoS1xP5E2RSv5vOqy5spwnjqif0fH9b1w7yaMriV0n3vud0u7GNrZuN7Px9sykdI2bXNX+MU6ioLwxdhR+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326324; c=relaxed/simple;
	bh=0ww6mYNLdL0BcAvD2/pYjaJdM/Z/4qussweK6HJ34hA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UAoSYEzrIjCxx2zakTTUMiKhxxq1GjLt3AxX3+T1no/VKxZE4eiDjsqKyk1ofceZO7A6hcBt+s4vfKCb9F2NlY+xBqkXzGXaT+zHeeZl5jfdW9kMw4LfeLzgD9T2uhGNW1z7Jcq9LiYpzxJicFfEAsnHpVp6ivv0qDTt++zUVik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pQqjLsGz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pQqjLsGz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790326317;
	bh=0ww6mYNLdL0BcAvD2/pYjaJdM/Z/4qussweK6HJ34hA=;
	h=From:To:Cc:Subject:Date:From;
	b=pQqjLsGzUjLdS4pEd6D+E96QGLgNTZZ4wLp6Dpxz3I45a+0elNWCyLSP32UfUz6SS
	 BJEi2ZqBnEo7dqgvCmBlgMkGd5G1eHKofPRL+GlGqaQl3eBEu28TTdB/o6rgKj/KiD
	 I8yesRrXAE9PIL1bY+o0/JiK42fa/NU0u5vLElfoR7YQrqUSa6cv1vObegB3YRyg3s
	 QrJhfnS/aDpT9Rd2WvEbuqqRGe96EvL0KRogGVR00AuSNd5H4OEOqTQkk/WUo4aUwM
	 Jd4KQEDb/Qjt+nBab9gJMzNmTxXLVsrP8vFwwzKovxh6FkgaHHsHtTPRT8qpovFPyO
	 73kHFMWlD/qYg==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 621FE17E09D6;
	Fri, 25 Sep 2026 10:51:57 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v4 0/3] media: verisilicon: remove unused variant and code clean up
Date: Fri, 25 Sep 2026 10:51:49 +0200
Message-ID: <20260925085152.41852-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"nxp,imx8mq-vpu" variant has been tagged as deprecated since 4 years
now. This series remove it and make some context's fields useless so
remove them too.

changes in v4:
- rework commits messages
- add r-b tag

changes in v3:
- remove more dead code

changes in v2:
- have a separate patch for documentation
- fix dt-bindings
- rebased on v7.3-rc1


Benjamin Gaignard (3):
  media: verisilicon: Remove deprecated variant
  media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
  media: verisilicon: Remove useless internal fields

 .../bindings/media/nxp,imx8mq-vpu.yaml        |  10 +-
 drivers/media/platform/verisilicon/hantro.h   |   9 +-
 .../media/platform/verisilicon/hantro_drv.c   |  30 +----
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 105 ------------------
 4 files changed, 11 insertions(+), 143 deletions(-)

-- 
2.53.0

