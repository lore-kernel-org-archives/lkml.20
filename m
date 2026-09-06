Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768223B5319;
	Sun,  6 Sep 2026 03:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666176; cv=none; b=WJwkFXZlw3UGQ5qVw7jykIm5d9r7T8Lh3k7Xmbc51EP12DtdcpGw5uYh0PQOC26gW9IbA4E0eGJYIdIBBCB2WrWGDtV+OsknPhQ99LR1hHC83Arba1bDOBbf4rEZHrwt5fepsotYUhhddgl3aKQIDFZ4jCS6/j60Ofz3bW96vOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666176; c=relaxed/simple;
	bh=XxEkSWtGahgcNelruYk9TkoDzG7UJt1S4urDB64x81s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MNnmi5QZMeTs/+N56WcX2EyQ+pXT1T/LZDnQptkXtfKk/2MK2dsNL+nn+OG9kAeBFipe+Q4Ee3JNF5DSKhVUt/nfM+O6GsXJ7RD4KzHFigmgrZXGh0YoEJMz7JggTULNqYJuS24j4FOpj6S4F6O4Zz/LVRR10JYf89hEUoCYVYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GI0o08ph; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GI0o08ph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=In
	g9viFHlRqC3Evxp/NzyPpubp0ZutARSR7Ccr1pqjQ=; b=GI0o08phrfwgP1xdgY
	A1ckuDpbCRYIhLktON7VBDOqRO0DloOwqIs7OEj+rZu6la+2gUxMijroHe/6+gUo
	3iE7fWVdu77UmU59yaKZvN8xsLGOmonMCfKsZkg3jPZky712xlfG7EPreCsFeZcE
	e4EWFxPrQ9UuP64XH52lj43Iw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDXHxcb4Zxq8PnERA--.33810S2;
	Sun, 06 Sep 2026 11:42:20 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Yang <yangxiaohua@everest-semi.com>,
	Zhu Ning <zhuning0077@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>,
	Nick Li <nick.li@foursemi.com>
Subject: [PATCH 0/4] ASoC: report additional component restore failures
Date: Sun,  6 Sep 2026 11:42:13 +0800
Message-ID: <20260906034217.85696-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDXHxcb4Zxq8PnERA--.33810S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKryUWr45Ww47XF4ftrWDJwb_yoWkJFg_ua
	4vk398Jr42gF47CFy7Wrn0vayDurWxCry5AF1vga17Jr1xJrn8Ga17Xr1rur1UZF4xt345
	trn7t34xJw4S9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb8pnJUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxRxBCmqc4RxNjwAA3b

The three Everest resume callbacks ignore status reads before branching on
their output and then discard later restore failures. The FS210x helper marks
its cache dirty but publishes is_inited even when replay fails.

Check the fallible operations that delimit each restore transaction and
return before publishing dependent IRQ or software state. Commit
951af101c730 ("ASoC: report component resume callback errors") reports these
callback results while retaining ASoC's best-effort deferred resume behavior.

The issues were found by our static-analysis tool and manually reviewed.

Pengpeng Hou (4):
  ASoC: es8326: report resume restore errors
  ASoC: es8375: report resume restore errors
  ASoC: es8389: report resume restore errors
  ASoC: fs210x: report register restore errors

 sound/soc/codecs/es8326.c | 20 +++++++++++++++-----
 sound/soc/codecs/es8375.c | 18 +++++++++++-------
 sound/soc/codecs/es8389.c | 20 ++++++++++++++------
 sound/soc/codecs/fs210x.c |  5 +++--
 4 files changed, 43 insertions(+), 20 deletions(-)

-- 
2.50.1 (Apple Git-155)

