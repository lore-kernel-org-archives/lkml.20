Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489137;
	b=xydIbD5OUpTXOe9U0DQEhb5cMiEzewxsIgoe8W/yd/FaD80gxggNKk7UeEhLTLH+VGFM
	 +jeNhda4fY+5HxSVm7HSF+Sj3ZCVyY40ajNdE0gz0deyvOp7EmxVL/ACWmSaj8Obllxht
	 +2JpM1BUh9CqZ5D+m9umsT8QFv8QTg2dWR5CXDljcYzSqvVgNLlp8KxslIAp4zLFvmcO9
	 6JRG8XAzk3aX/SQJZI9zg8a7GuMppZ+RtX41sf0qnc1DDWPf/ZpOVN0pPonG57VbpYKzt
	 rFJE5qS9vb5bSscmMDckrBZEPmsE56Pzn3ISDHGE+udGX2YQvoEJZxy+9tUf9wCpESg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489137;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=TksXlMVZXRpHlnAwSWhbl1BTy5EqD5EPHWFrlK+U+co=;
	b=vsU9H/NzVPoP03dde9O1Nf97/5EsIh8xqr6gsj43BiX9U4x9E2xVrposihACnmSuLmke
	 IGkJ3ILwdVU09Iku0ndCQdUpn/ZtTZAQrVscj7PyMvh59n7n57EcZm/IrCLTzb3ho8jui
	 dRLnLppONJNfSyroT7fztdLFJzwgdlKk8Gl57Wf+EEaLeRdu76yQ2KI8FYKZyf7s7iASG
	 jFBhjlOqkVUIhJ+XXnzNTF1SN5+o7n9gEWkVGz7rO3ul0xyaNhQYyxIl8OldSLfC+ZLL/
	 Rlrv9G6iIxFrDxj6K7Tqbe4zLoqoOxB2EjmDVFwIWVw+t8W6a1VuPbuevmiosIDYaNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=J6QUpRF1;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4A9606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD4A9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=J6QUpRF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Tk
	sXlMVZXRpHlnAwSWhbl1BTy5EqD5EPHWFrlK+U+co=; b=J6QUpRF1SX7f4nS5et
	3F66bvy2i9ahCAslj/onOhZXSJPxpDCBYObeEA6AQ9aRR49DsMY2RdxpTk1kMd6m
	Qnj0TyC5AcBlgd74YY5+fapPLNMqKdsu4Qz8vCRFTnWs1ALbyVStQYxNAvuGDfNW
	fyldoJGGpPTz9s+rOAzgpKTNc=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD3_4ImNtdqupV5Aw--.29320S2;
	Tue, 20 Oct 2026 17:36:40 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Huang Shijie <b32955@freescale.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 0/3] bus: reject devices without platform match data
Date: Tue, 20 Oct 2026 17:36:32 +0800
Message-Id: <20261020093637.1654161-1-yaojiale02@163.com>
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
X-CM-TRANSID:PCgvCgD3_4ImNtdqupV5Aw--.29320S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw47Cw1fXFWxWr47Cry7GFg_yoW3tFc_uF
	Z3XrnrX34IgryUG3WrArsFyrW3CFWxWrykZr47t3yfX3yUZr15Jr4qq3yrC39rWFWqqFn8
	Grn8Zr4Yvwn7ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU80tC3UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzggoYmrXNiil+gAA3w

Platform driver_override can bind a device to a platform driver without
matching its OF table. The match-data helpers then return NULL.

The i.MX AIPSTZ and WEIM drivers dereference the missing data during
probe. The STM32 RIFSC driver stores it for later dereference through
its debugfs configuration dump. Add checks before each first use so
these drivers reject unsupported devices instead of dereferencing NULL.

Each change is independent and can be applied separately.

Jiale Yao (3):
  bus: imx-aipstz: reject devices without match data
  bus: imx-weim: reject devices without match data
  bus: stm32-rifsc: reject debugfs setup without match data

 drivers/bus/imx-aipstz.c  | 2 ++
 drivers/bus/imx-weim.c    | 6 +++++-
 drivers/bus/stm32_rifsc.c | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.34.1

