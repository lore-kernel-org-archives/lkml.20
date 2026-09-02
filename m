Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214AE2F7F1F;
	Wed,  2 Sep 2026 07:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788333659; cv=none; b=r/BPDuNZ8SRliJ8K5ulCM5eUS/xOKOJpun3FpgHaFR2zA8n0AkrY4+VD15fOWyHvncXftOTqWU85sJVZJgThWlW0nmwCcMx0FIjyz1hdYRQNFVUauDrDY5vOpmGLx3wcLSRujbrTJN5ekG7LS35+pFrJ6NS26YqbdiTPFW1IFc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788333659; c=relaxed/simple;
	bh=tjFmfarM9v9sAIrXZ0xArA2SboQ7AD3e+jl3B2KWaGc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C9sjE+pRho2DsjQqxeIB1qjGsYQmcjm+ehCGRz9IyZShSffnndNKczY6qQS/h2b6SXMDtLwpCeGHIHwh9KFNNPnYNx7t79ajQHzIydQKvhLULsFvpI296TAN7Potu/yeW+clOrjcvwbmjy6+dx2yL5GZSeRdP8/5NTzlCt1cXwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=B/frepmS; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="B/frepmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bh
	DOIHJggUdkLLBuiSDIqPVPddjKrpyzOmqgx5DF35g=; b=B/frepmSHFUFIIOnXO
	dohkz5Zd9FoE2+dNRk64NrSnX7ytEM4JLhQSOCB8A3fomSul2siO5cRQdXrOzmzv
	ji1OeeJwoBU9nbyPITsVlctxcP6ORsX+2WeVaB1Sehflew2Fe8sCWlG4lWZnm/zZ
	lY+s7J2p7b6suiOwsJ3V3RlB8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgBnP6UuzpdqMkg2NQ--.54267S2;
	Wed, 02 Sep 2026 15:20:15 +0800 (CST)
From: wangdich9700@163.com
To: srini@kernel.org,
	broonie@kernel.org,
	tiwai@suse.com,
	wangdich9700@163.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng@kylinos.cn
Subject: [PATCH 0/3] ASoC: qcom: misc fixes for LPASS driver
Date: Wed,  2 Sep 2026 15:19:40 +0800
Message-Id: <20260902071943.522194-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgBnP6UuzpdqMkg2NQ--.54267S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr47Zr1UXFW5tr4fGF47CFg_yoWftwbE9a
	s2934rury7uFW3Aa18JrWjvw1vkr4fuFy7C39FqryxtryUArn8GF1DtFsa9F95ZFsYva1x
	G3y5Kry7W34fXjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_hiS3UUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbC5w8-jmqXzi+kdAAA3V

From: wangdicheng <wangdicheng@kylinos.cn>

A few small fixes for the Qualcomm LPASS ASoC driver:

  - Fix "LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0" case ranges
    that only matched VA_TX0, so VA_TX1..VA_TX8 hit the default case.
    In lpass-cdc-dma.c the va_mem0 clock was also not prepared for
    those DAIs.

  - Fix a misleading error message in lpass-hdmi.c that reported an
    invalid bit width when an unsupported sample rate was given.

  - Fix stray double spaces and blank lines.

wangdicheng (3):
  ASoC: qcom: fix assorted whitespace issues
  ASoC: qcom: lpass-hdmi: fix invalid rate error message
  ASoC: qcom: fix VA CDC DMA DAI range handling

 sound/soc/qcom/common.c         |  1 -
 sound/soc/qcom/lpass-cdc-dma.c  | 10 +++++-----
 sound/soc/qcom/lpass-cpu.c      |  2 +-
 sound/soc/qcom/lpass-hdmi.c     |  5 ++---
 sound/soc/qcom/lpass-platform.c |  6 +++---
 sound/soc/qcom/sdw.c            |  3 +--
 6 files changed, 12 insertions(+), 15 deletions(-)

-- 
2.25.1

