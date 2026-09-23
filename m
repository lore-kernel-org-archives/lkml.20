Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8499429028;
	Wed, 23 Sep 2026 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154198; cv=none; b=bBZTF6qhDeNU2eFJucBllMamFVxYKuM6q4P/HVMIfl+zY2l8Ioc9e8pkjYJcJnqnjQFzsvzZgN5bLxiaSECMYGneRmohcPtn6mNOUxQt6a435x8lbcGsT24xVtS2oBY4CWyXf8RXAPOk16Fp2Weou5VhncY/Gc84Bw5HR/Zvwqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154198; c=relaxed/simple;
	bh=ELuyAkQgxdFhKJt4yeIbM3DoiWg1n7T0T6wH0WdkcJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TStNnFouc0RCSwNEbNywYE4MsZLU6LhvuLAkRhmsB0FRP6DgChIkcdrd9wYWyWb4XqUuIJqO1ogWkQDjROOdLw/XQb3qUgW6c05TgenYrr/wn1aB/+DJV4LxTYUYaGOAXzIh2lIFEjshMITyBCutvf5Z4FzZU6nV7rp/65TQgbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QfuOjIhC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QfuOjIhC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790154192;
	bh=ELuyAkQgxdFhKJt4yeIbM3DoiWg1n7T0T6wH0WdkcJ8=;
	h=From:To:Cc:Subject:Date:From;
	b=QfuOjIhCOMGnDcbq82IpoZzvW9kkbfm5pGTLiCBKjrMgouZnJY4+lYmotkPNfagLW
	 Ii4E1GK78crXuRdq7qA7eWJYZGmcNEKO5w1J+gS35ijjLlRuu6uuPK9YMNPGrKVljB
	 fqczpKG/LRDD9D0Fo6q9/veYUc4lUhZkrqkPCbTV5Y03MYJKC9+OZ5ih/ygnIrUnCz
	 nO8XLrWmCL+iRLS5OTPknrXymhsHyyGPKiORKauS1ShpoA6LlPZroNxtzgq0sS6KKi
	 mbEq0ielNCIWJO0FQFk6O0gmtRy7T6F2RaTGAP4EyAQpguf/fpQVxSPsiToAlw484r
	 1tXpAXmnytHQQ==
Received: from benjamin-XPS-13-9310 (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E7F217E03D5;
	Wed, 23 Sep 2026 11:03:12 +0200 (CEST)
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
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 0/2] Remove unused variant and code clean up
Date: Wed, 23 Sep 2026 11:03:05 +0200
Message-ID: <20260923090307.49959-1-benjamin.gaignard@collabora.com>
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

Benjamin Gaignard (2):
  media: verisilicon: Remove deprecated variant
  media: verisilicon: Remove useless internal fields

 .../bindings/media/nxp,imx8mq-vpu.yaml        |  2 -
 drivers/media/platform/verisilicon/hantro.h   |  8 +--
 .../media/platform/verisilicon/hantro_drv.c   | 21 ++-----
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 60 -------------------
 4 files changed, 7 insertions(+), 84 deletions(-)

-- 
2.53.0

