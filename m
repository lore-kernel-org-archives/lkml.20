Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810721;
	b=2JY134LgJexVi+srHd6qq+v4iPgZ8ZRVngdVwukSd4H8QaNJ4tQ+tc1N3y/Si3MVP4FH
	 j3agpe6WpENas35Fj66PBAtcH9VocDnIenyhn72SzLuY1uSDv8pSXwpmUvsorHrEghI8m
	 TxIOygpm1LsVJIzqwJ5JiZGfPKdzpH8zx8m/Ab3IqmTOsD6X+5kXa31Vz4Sc4lVvGbgpM
	 2pL+cEHShrdkzpDvAQL/8ud5OyTWupjEpK4HxBeLXo4C/wz0PJ9CgsAxqp/jjLqtpZc4+
	 4szjxI9ZwLe7OnXqgm5SE284a+me62x4XXyo4i7HB2yAtHfJPTF4vPyEFDjZQ8V7uzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810721;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=ioTYCRpsdPcbTSJZk4mDPBcdY2/qy2/XBMlvoeyfMWM=;
	b=hO5qVM+rAUs/b+Y2ljpdd6zI0JiqBp9ZXgp0RIRQV3ZZ21Z6q43HvwVmKjsveB9D7Mk5
	 Z+jPk4gEY/phzyhQUFK5JfLBBvFshu0yKyH43m+6z0u/wjvO6bfoM41TkUBiSL3mweDqK
	 utrieSwUREvcJdcf5nsVYde9pCNY0Du1UWCHbIRKB9HT7vGTZHFkoVhMKs9U4z8alkESu
	 JzFIO+am2HJj68zJTthb6a+cBrXz5XBqaiG3cgRs31W+KiU25QSaq0g5vvVJyzx7rDl8h
	 iKx/Xzl4s5XdcH8AbeJAzDtSqGkXKh8qV+6H7JF6gqqbzOS/qT6QLNPTa6zEZ89wS6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=Dy6WGaZl;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7BA606A335;
	Mon, 16 Nov 2026 06:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF7BA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=Dy6WGaZl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1794810652;
	bh=ioTYCRpsdPcbTSJZk4mDPBcdY2/qy2/XBMlvoeyfMWM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Dy6WGaZl1Rmt7ozsywLXZPzlE5or1xQfn+4z6VrB9fpAEIqroSyG/xkSpengvG9O9
	 TeMmJN0j4vMbz8GcH+3vG3PBZehOu/L9zH7xQ2yGgLPEpvpLW+Ymmqfk618QFvMKBy
	 mpEk8mrvX1xSJ53MfkUmkjXymd4lIQZY6xAcOQYg=
X-QQ-mid: esmtpsz19t1794810636ta9b17180
X-QQ-Originating-IP: /0q7kZoOm52E2x4jdY88mdor5eXx/J4YOfhJlig5uUQ=
Received: from PEC004119 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 16 Nov 2026 14:30:33 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 18099315989899643878
EX-QQ-RecipientCnt: 11
From: Haowen Tu <tuhaowen@uniontech.com>
To: broonie@kernel.org
Cc: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Tu <tuhaowen@uniontech.com>
Subject: [PATCH] ASoC: pcm3168a: Disable runtime PM on component registration failure
Date: Mon, 16 Nov 2026 14:30:32 +0800
Message-ID: <D6339FDC262A33B1+20261116063032.3348732-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.50.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Nx5J06Esz7r7xWIpUAKISEjT2muxRdrtul4rl3gxtMZgfZ1qbjEAVe+/
	MTb46RaP6cPfoiPTG7YBUwpU3k/xKsnyGouSlXjoN8mVy7LMJEjhfCD4H/jlmMM7T3RuO+F
	rpEhhVkCrktwBLXWQ2r2I7aVJq9MdFFbbCNQ/WJ9jUQLSnZ1ZW+aAi6CBHkQ5Nv2MldUF36
	MPHC8I7O6USjP4JsWBxYSj4sHvJyoZuw5cXNYBFHChfJxUOOFvqn+PrweccqqTB3Tl59rhh
	9w2NXoHoPybijgwPZJflyskH9lpXcBMhmNydYmpiyYZ96ZCNgRTHT4SZgGDHUaGwtc23May
	UJMW8f2aUTjsSHfH8siJDUJhNkwMZwamLeeu18sf8H3VpTW744WA01G8cbaTiPzfM7Ivdqb
	90h/L5xV0l5D7RaIpQzxEKuPQEOVyiSGlkTgrMdJ7yINy1ZeUirslnrg3Oi7dEJXbt3AJRS
	OIp2cLem7laVIgf82e4dlpeIdjoUIQ15sQHy8pSrd6/wUgS16ea8Z/X2jIvL2vPC0IPewuy
	0WlEpbXC3vKZ53/2/XFXdQ+z4UYHD4Nsi3vS+IQwOmeD15CG8wQk6lloVCPggb1kl5vEbDS
	JC0vZxbOfpTBYkuaS9u8XmqGayA6C7EFlbcgr3E4ncgYh8SBCnXJoyroHynuQf5LLk1MX5g
	Uwwum4SB1Xzkk6WAJcRAT1EueKkJKPqx8893fxAbIOlmKBkj4THgMx3SR3SNXkO1upevGE5
	DTKjX+bKex0kkMvxz7lKkHX8vodteA2canIQsUZEHbVBZ2W6MgRGiwUzUyKUavaz0+UjBF4
	39nqqyROLh6e1rwfw4bQavaQ2sCQKjGBgf8+xb17xrgU5vgZXEICtZyGo84sIETeoSFqN9y
	ctU/lk5bobb1D2x8dMXOq7U24nhAqGpIoRnPodvHxSyyK3tiFFPyCgNV6tPMvqkD4g2MuJt
	xGbwL7YcLM1N2FR0P9Yoe4OqSMAO4tDs25ggm4mlLty6ubyMuGeF9+4v5L5Dk4nLukylBc9
	H0GUKmBK8WHMhApMlzON3nJ9q5flq+XWk3eWTOMmT6EjNcAUIOhddrDdZdof4=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

pcm3168a_probe() enables runtime PM before registering the ASoC component.
If component registration fails, the error path disables the supplies and
clock but leaves runtime PM enabled.

The remove callback is not called after a failed probe, so its
pm_runtime_disable() cannot balance the enable. Runtime PM remains
enabled after the probe resources are released, and a subsequent probe
can encounter an unbalanced pm_runtime_enable().

Disable runtime PM before unwinding the supplies and clock on component
registration failure.

Fixes: a9b17a638af5 ("ASoC: pcm3168a: Add driver for pcm3168a codec")
Signed-off-by: Haowen Tu <tuhaowen@uniontech.com>
---
 sound/soc/codecs/pcm3168a.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 11fd948ecd27..ca0ef9f36658 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -802,6 +802,7 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 					      ARRAY_SIZE(pcm3168a->dai_drv));
 	if (ret) {
 		dev_err(dev, "failed to register component: %d\n", ret);
+		pm_runtime_disable(dev);
 		goto err_regulator;
 	}
 
-- 
2.50.1

