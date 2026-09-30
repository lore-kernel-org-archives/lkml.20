Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47B84FC8F1;
	Wed, 30 Sep 2026 15:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781190; cv=none; b=ENIACJxNrmSbWNqfKRzS4m8aAIXIphbMV/9cWxAZ8NGqDmUfeETZ1r9rGlRwWkgX5epBcze1GwDdutnILR755PMzCpGipi59nJk/zuxdZ90e3pGBD99e9087PzbLR2pJYEJuvKyCwioQFZYHPjbDXm7YDklfGB7sUa+nmvWItqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781190; c=relaxed/simple;
	bh=8hOdfVeO8+152V43moBjalksfRu9BZTZ/UwSBkHEa34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OfhWD9wVgM79mnCq5JeXkRJw1qiZAP12U5P0weF1E1eJMVln3ZS2nhvXba9yEjJ5a429MwL8gR8zcUd0RSSu9VXuCZbHKepy8XWpfDyQ8uTjti4ThbSRGARwk7zLIk3ikISEr619SFJ6KA8jt7SRRRtIk8CBf06ISM+74tyMZpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mrdRqwYd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mrdRqwYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790781167;
	bh=8hOdfVeO8+152V43moBjalksfRu9BZTZ/UwSBkHEa34=;
	h=From:To:Cc:Subject:Date:From;
	b=mrdRqwYdhim45pl+JV/YxBn4Xzx5Ka/ecDUgYj42T7mov6MENrN0V8XZEi9XSkoUY
	 rxlZDsPb1wIERJVxJarhrcsl8HVlMt/6rXmoqzXfNc1bpf/TDEICJ5u3k218XHKHmB
	 HA9BSOUNEs88z/m79P4eetNNwlvPc959jadHXHNytuj8hk6N+lUuPzVJZ+LDNofFs5
	 sVV1OnTgFC+PH1GzvWI1RUx8UYrZg8v1BvPNTL/aVZx8azFoY7ACXV2ginzfZDxqFO
	 soYRIq1PDg/6jVUCv3nqJneJV/SuahbcPkfZXNi5uvIFxSrc1WJZN89TU0SR3ZiocY
	 2OLzjPrIxqHJQ==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A1D2B17E0074;
	Wed, 30 Sep 2026 17:12:46 +0200 (CEST)
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
Subject: [PATCH v6 0/3] media: verisilicon: remove unused variant and code clean up
Date: Wed, 30 Sep 2026 17:12:38 +0200
Message-ID: <20260930151241.58233-1-benjamin.gaignard@collabora.com>
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

changes in v6:
- rework patch 1 commit message
- remove pw-bot tag from commit messsage 2

changes in v5:
- add more details in commit message
- add Conor Dooley accked-by tag

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
  media: verisilicon: Remove deprecated nxp,imx8mp-vpu variant
  media: dt-bindings: media: nxp, imx8mq-vpu: Remove nxp,imx8mq-vpu
  media: verisilicon: Remove useless internal fields

 .../bindings/media/nxp,imx8mq-vpu.yaml        |  10 +-
 drivers/media/platform/verisilicon/hantro.h   |  10 +-
 .../media/platform/verisilicon/hantro_drv.c   |  30 +----
 .../media/platform/verisilicon/hantro_hw.h    |   1 -
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 117 ------------------
 5 files changed, 11 insertions(+), 157 deletions(-)

-- 
2.53.0

