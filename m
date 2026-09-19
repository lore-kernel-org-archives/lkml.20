Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC45831C567;
	Sat, 19 Sep 2026 12:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789820025; cv=none; b=aKp6IwzvxILx9epWebTHo1gmJEQe+T5v0pWrX2K11InPaF9CmZhhl+csHNatDifjVgLPMfyHQ1LF9L4fvrRNvzjGCgSW9yUKwcXYNMIvUWRaRU20XZbISDbOFB+Ctph6N1opWPt3EPWa/ptb3QIiQiqjPCuU/KqxttEwTUpUzCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789820025; c=relaxed/simple;
	bh=pL3fyVuofnOVFlE2yuOGktmpTNX1Ro7dj+nVlYbpXyI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K/WF9HypamgxfN/t+dTINWMogoJzaWFPF31oqyvyX97zGT0sa5XCZsDechHPsnsJF2fNmbmxI3JS93bin4nS+Yt5jAYHzCPkmOWFv7+HeUGZ0G5z5coHuU02Na1cAPbm+ojbq4hPR58RlN94ST+VNabLxrtg+WsRnT8yzauf0xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn; spf=pass smtp.mailfrom=tju.edu.cn; dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b=XEYIVNjO; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b="XEYIVNjO"
Received: from tju.edu.cn (gy-adaptive-ssl-proxy-1-entmail-virt204.gy.ntes [183.242.150.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4e5f6a4a6;
	Sat, 19 Sep 2026 20:13:33 +0800 (GMT+08:00)
From: Yibo Tan <lhfff@tju.edu.cn>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ASoC: amd: Fix borrowed ACPI codec device references
Date: Sat, 19 Sep 2026 20:13:16 +0800
Message-Id: <20260919121318.1618315-1-lhfff@tju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0b9960cd203a1kunmb5cccea33e6258
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZT09JVh5JTEtPTh4aGh5MT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSU9JVUpOS1VCWVdZFhoPEhUdFFlBWU9LSFVKS0lPT0
	9LVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=XEYIVNjON0xGlh6oUojvA02BVQLKI3IYYGmq+yCjpl5wo1O34ZjZCwvm4lLl3PHmhnyGzb3S0h+eVUqh8k+qR1rBXPc6fuIozaQM8WEZYvBrIfZEAQZQinFbl2MsTRLcnMP7UIx4m2OxcgdnLT7nW7vfUti4XQUx/PYE8u5+x80=; c=relaxed/relaxed; s=default; d=tju.edu.cn; v=1;
	bh=+p6cD8DWFji+GtU2roV++NhmJbaznn3fWdegAzpIJzk=;
	h=date:mime-version:subject:message-id:from;

Two AMD machine drivers obtain a borrowed physical device pointer from
acpi_get_first_physical_node() and later treat it as owned. The ES8336 driver
drops it on GPIO defer. The ACP3x driver drops it on private-data OOM and
otherwise stores it for later use.

The patches convert both sites to the newer owned helper. Their reference
scope differs: ES8336 uses the device only within late probe, while ACP3x
publishes the pointer and ties the credit to card-device devres teardown.

Both defects reproduce on current mainline with direct calls to the real
static callbacks and normal ACPI/device-core unregister. In both cases the
vulnerable arm reports a KASAN slab-use-after-free in device_del(), while the
corresponding patched arm preserves the injected error and teardown with no
KASAN, WARNING, Oops or panic.

The validation does not emulate a complete ASoC production pipeline and was
not run on physical AMD/Huawei hardware.

Assisted-by: LLM

Yibo Tan (2):
  ASoC: amd: acp-es8336: Use an owned codec device reference
  ASoC: amd: acp3x-es83xx: Keep an owned codec device reference

 sound/soc/amd/acp-es8336.c                    |  5 ++---
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 4 deletions(-)


base-commit: 0ed6f7f62318a581fe9698f8a4e98c7ca01160e4
-- 
2.39.5

