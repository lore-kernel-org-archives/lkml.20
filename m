Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794202050;
	b=ox0lyv4D0bCSZVfumb+InGrh0P9z7o4sKCxTgljHtmy/WikexzbwOdJarU9BV0I45ux1
	 iMzBPTve86jSrwd83KEJ58RuiKXB9lZ8kJDwTz0xoGk9WuBUOSPodXDXrccSa+O7DmNX4
	 yIEe1OtktUCQWCSPOV4L+Xf05WwK4KZrRES//fqn6k7WaAwEspktDwi/cvUpom1ZeL88M
	 jHlowKeE6WbwcrAOMFrtNAsMwOEnuBeWQXuaGlODKoE4zu8DeCl/fElNuiEuu2kA9bvDR
	 lvLKDmrEfaR0qn3xH/+80ua0tlzVTGbrXnSoQIMd/yjOBYN87OtZftUURfCHNOQbK8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202050;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LG1zeG/FAVWOYlqtmLmw2tMQraUdVSd/sMBgbfFTC7c=;
	b=z7y1lHTpfZGpmPQNuiSwnbTczcPD9t8WKKiZ7DqJs8nUQ6miVbCPvP6wRhq+/hRxAfOB
	 XOvZLyWlgbzIvG/T50gba/XDHLXxL1Tr35Ye/9NUgv/e3m8FUBbBTusHgjSwn9qWbJ79V
	 kflhMP/o8TSfhgyXiUJy/rJ4++oBnPY/6JG52UTQ0VdM4M4zGLm3Dn5x7zqwq13p1kAax
	 2YTsXa2dXpc68bSfaRMFnM9pa8kL9CCVMHHigU3/SlDEVm67vJizRi2FqWjqD1acsS3Qk
	 lXHBCqTtdsgQDd2KjIgECa4Q3j1FjaAhTyJgIL1MLk4MP1KPMf/XbaS114HJqikpMRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="u/sm3hVH";
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A148A606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A148A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=u/sm3hVH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=u/sm3hVHsIY7j7xtk4fqcT79pyDFhJzz1y7EduPO7aO5ujUVZlK5UFYgBIBrzFoOvqJLvUQfr0WTN
	 rO3hsu7pAXT89FYRzm7h1tqEqQZejZzBeSKX6KsQlL+m0H53iceFool/RIoNndMHXXBmVjJYqUALvN
	 wDvJSjamnSY8a/v0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af159b7776-9caf6;
	Mon, 09 Nov 2026 13:27:27 +0800 (CST)
X-RM-TRANSID:2ee16af159b7776-9caf6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af159bcc11-82633;
	Mon, 09 Nov 2026 13:27:27 +0800 (CST)
X-RM-TRANSID:2ee86af159bcc11-82633
From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	michal.simek@amd.com,
	linux-kernel@vger.kernel.org,
	Zhao Feng <zhaofeng2@cmss.chinamobile.com>
Subject: [PATCH 0/2] mtd: rawnand: fix GPIO CS descriptor leaks
Date: Mon,  9 Nov 2026 13:27:22 +0800
Message-ID: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

Two related fixes for GPIO chip-select descriptor leaks in the raw
NAND core helper and its in-tree user, the Arasan controller driver:

- patch 1 rolls back the already-acquired GPIO descriptors when
  rawnand_dt_parse_gpio_cs() fails midway through the cs-gpios array;
- patch 2 releases the parsed CS array on the arasan probe error
  paths (invalid DT layout and anfc_chips_init() failure), factoring
  the remove-time gpiod_put() loop into a shared helper.

Both issues date back to the gpio-cs support merged in 2021 and are
still present in current master.  Not runtime-tested (no hardware).

Zhao Feng (2):
  mtd: rawnand: fix GPIO descriptor leak in rawnand_dt_parse_gpio_cs()
  mtd: rawnand: arasan: fix GPIO CS leak on probe error paths

 drivers/mtd/nand/raw/arasan-nand-controller.c | 26 +++++++++++++++----
 drivers/mtd/nand/raw/nand_base.c              | 12 +++++++---
 2 files changed, 27 insertions(+), 11 deletions(-)

-- 
2.39.2



