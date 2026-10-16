Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86355442372
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145134; cv=none; b=dBYIrpCfVMpG6S7Zr6R0Dj1pE0ijmMwpyoN/wsb4FTmheWV+c2EEDL3c/npXDYF/9Hx87XHs/NPsnj+Y7bmWMMBPOvIvuf0iDPd+aswBnM3N2v0GYqqE6frJnIEVbc5tmrqGcqcmQLlnL9RWSjfIqulD0l2johuezU0wc8JQBqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145134; c=relaxed/simple;
	bh=U6YvkR7iPbYwiCub92FwVXRch7ES2emzmKOVlTJm1dc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j5mTW4H1H2BsWg4iiTEMsX/ZM7igmDbdGYwuwQ+qju2OVOS+tynR9Imj/yGgOJxJ2cx+MEnuCvoAN180btA0JKnr2dkxTxVACIVKP/rb6gzF9E8ZSK1JiQA/9uPJUZGuJkn9wlgY4Gy4wrc85IhjPwE6tKcOW7Ie60yRp+uu298=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KnyZZhWm; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KnyZZhWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=yz
	u9as9I0DBRnU+Bhfx9T7kwfYL4tAySn/t+hZL67hs=; b=KnyZZhWmvU1tE75rpK
	I22NaDZv6HGyo3Xg/MGUpZ8vud53Tfg53H5oNL3GnP7Lw+V+iCtiyE2a2p9MXokx
	1GOHbktA3nqaWpueM3IFOx64oIK545RnKiWM3iGwNnS0IL88XmgbBgfkUo7+dj9w
	0SMYD7apDtbpu/Wa15Tkymky4=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3fxXj9tFqdQTxAQ--.15252S2;
	Fri, 16 Oct 2026 18:05:24 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 0/2] regulator: freeze delayed hardware access during suspend
Date: Fri, 16 Oct 2026 18:05:20 +0800
Message-Id: <20261016100522.2582557-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3fxXj9tFqdQTxAQ--.15252S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF4xtw43Wr1fXF1xKr4Durg_yoWfGwb_WF
	97GF97JwsrWFnrCa4SgFnFyryUC3y8WFW8Xa1ktrWIvry2yFW5GF13JrWfurWxXa1DGF9r
	Xw1Utr4fAr4SkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sR_fM3JUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzgQGQGrR9uTlrQAA3t

Deferred regulator disable and IRQ recovery callbacks can perform hardware
access after a caller-provided delay. Their current workqueues remain active
while devices are being suspended, allowing the callbacks to reach a
regulator after its backing bus has been suspended.

Move deferred disable to the freezable power-efficient workqueue. Move IRQ
helper callbacks to a freezable workqueue as well, while retaining the
high-priority property for users that request it. Each patch is independent
and can be applied separately.

Jiale Yao (2):
  regulator: core: freeze deferred disable work during suspend
  regulator: irq: freeze deferred hardware access during suspend

 drivers/regulator/core.c        |  3 ++-
 drivers/regulator/irq_helpers.c | 38 +++++++++++++++++++--------------
 2 files changed, 24 insertions(+), 17 deletions(-)

-- 
2.34.1

