Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEBF245020
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700313; cv=none; b=eQtrtz3SOZ0+ctMWa4WbhMbfu0ZIMWyd2z5BP1enktUswxsPzCXBauBJOOGR5lwM3zvRRXQgJO6PyfrBMtu/I4z6drxCDp3vZoDYTFSTXD7iOxV6lRpNfqTRwVwG6YQBS6n1mU0E5rVFukTupqTaXYXfqTwxBM29sVl0oC+BniY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700313; c=relaxed/simple;
	bh=sQBOe7v+eZYsBMp5Nx6kLQjGq8BpZGgFzkOUNvWBG3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hRROaYFqtInHCeQdr+10x70IeuqUIHiL34Lx5hqHqGkhy669jzFCW9sz0mHhMawJ8dKQN2EiyQrzUkrsB4DvUqcgAZsecUwmeI7MbYbXyFsW/CGYPt9y/mJXiElcsUTJcTSo3ebv1LstRZZyORLr8ZdIuhU1fFKeN0ZmHz2dt9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=KMrL1/op; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VxWqbURv; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="KMrL1/op";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VxWqbURv"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2B6B21400094
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:31:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 11 Oct 2026 02:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm2; t=1791700310; x=1791786710; bh=G/a4hkpw3e
	lgsIHsduy0p+bKpIFNGJFeX00fxs/ijlM=; b=KMrL1/opbREIph6ra57DvcfauC
	7wAuFL2uGRVKgdIdhScbME0nJabFulN/efmlK7vX1zHtpxmgeDU5qeP1cN2355/9
	dI/IwIVsaFEqbbkHWJHcAfdn0fbGlfr5q0vRRBvWXjeoPHUc/A7+ihRtbELNnEZ8
	LP87ZDwA5EaJuFlD6lJKhnxLHwTxHUjuVtb+UABDRBCy/Ota79jm8Y7iIMtuDWCf
	HL/rwiLtI5vGIrwfSSI6WhHI1gJ6TGyLaQhLSRxirs1JO7nkhebG4zWKY9ZXeH4k
	mHwySEhXmaS+se7B9jfjSAYrWTEWcOi8P4JsLijP4xzuXYA2DWrXG/CvfmCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1791700310; x=1791786710; bh=G/a4hkpw3elgsIHsduy0p+bKpIFNGJFeX00
	fxs/ijlM=; b=VxWqbURvOuqI176YwzWLfwJ1b7Is6JCO1DMjI6NkCr1daIfVKGg
	i9Gbj02Y1IiocMUbMTiVZnA0iN0P9eIY5YhdTXECnQmk9ivN5hI4raaVRLo9KeT/
	0arYxB70wG/YY/HSIAJ2uykXI2dtGa1Gs4dd8KXg1YPBdYVdWpNZjAGnDscdC5Kv
	keDKusUBGfx0fS+wUxT7O6DWTpn4ifbO68CZUj8xc6Ba4eddhDTANVxsZZ+p+VI6
	4BH6VPjgPUj33mf+cAKykrKdeMA9h98ZLc73pSiZV+7JRK1vLflXyNsGVGZCqdj2
	EYOHgRkapAJrvDt1XfDvEWEfjm0y+ayrnUQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791700310; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Y+smwN9+iLsb0nbzGE8d5ScfOIayGyTglDT065JZHAeqgpG
	hlve4oPyvh95olRGTHl//OMbAfbR355nnkkVJWWQd75Tv2h/YCQ1tcJAqqL5VgHg
	Uq4hIPGM4xUtqWpS2aQ/NpYwTF1g9rgkDKTm9ebQ/ZYVkR+k7jzJbvi+zaJ0eARR
	HdcsW59skf3SAiy8eK69uiohdmv6pCLSitIzvfTGWLdNqCgHdTmQk2DHn/Ex0emv
	jZAmsfh88cZTcYU19dvA66QaILzS43N/N5Jfb+6TgGu8yBNtB61hJUGKHo1X88wQ
	5E+4/4zmbCTEJbSNAbxjNHe10GdI2uOp/NM9k3w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:aCGF+9rehShSD2uEZ3OShqARboZj4fS65O9BT2lEaYc=:sQBOe7v+eZYsBMp5Nx6kLQjGq8BpZGgFzkOUNvWBG3A=;
X-ME-Sender: <xms:Vi3Lagf4T0N0AxGxluG1IW2s0DPhgFq-Y6I_EOqwpj5CTAMHeOV7Cw>
    <xme:Vi3LagIuMWL5VTviKKC2fGwgn8t08ZiOafvuMJ1xC2s7UZ3_uyOfasLIBfXSS6acX
    gyPp1npe8r_LDjxIAl3EJS3YLM-ey9n53vF6yIHxggXc5Jq1DpHFT0>
X-ME-Received: <xmr:Vi3LapHg5A3ytT_7b7-nPdeJFduKhfSaRH8Qr1PDKHkBtsHVLZYurbgz9FRPdhEJbH5l-353EPrwHXFbaRv41oOpZESkhp00XQSq2wJaF58UyjM>
X-ME-Proxy-Cause: dmFkZTEh2gf+w/WcXN8+TfkN5d13Tv6IhRjVzu1zL/Ruwz3d0XjJZwfNnVM7Jm4R8Yfe5y
    Np2OKi+0ULkioZrFZvaNVVi/5njTCjO5zMCWI/PNQXvmW9y+tMXj7JZ5Jz6VpfbHgPQygn
    hXT1jCpJ8q2aSOVC47biMA3+rx4VSX/Yl3eJon+ZJpn/NSjkB4SD0fkifshWXii706Sq1F
    dKe5ugiik7V9KxaCEkuaE+px3oPcPm4ahSRX1a7XwJnJxQTmMjhM8j+QoLESJTE1286p81
    Ni7YtQWVvnZFunARm/5Lc+NEvcyzFUfNMQJngqCuWWg5bQwvPT2EnMaDiXjQmJpbFsGfnG
    SoQF5opDZGAvb6rmJ1gWgFLXQOwTtsb3rAFI0Id7I/3hOPpplhm8Ef5sRRfz9fr2DeMpW3
    GeVOlK7eJZVa4/354YAdtTOzivp2C7OPxSG/VHDwBlm9jd19RQpITZPDgZZb2B3avo7BEb
    teW2WyMJabZWm4kY7757Mdjz8jib8rd3s8Yoh4Nim21rmSRF8ZQae5/P8PY3ht/MKvEFdl
    sMlhAgH8pZLtqsNg6EIyA2bUxwseH3VhYQ+81/AHZo/yezxWIwuOCdaQPWXDLeoYryt5ec
    Ly38HWNwhuIWItbKJVSZm0y8XmgVYgEpHSjtSYZC2+XhoakFrNBsgx28Natg
X-ME-Proxy: <xmx:Vi3LairPee1gg_L1UfBGI8DwnL3tE_3FHSsmydnZXeMFJLQQmwfkeg>
    <xmx:Vi3LaqSjSc8H0kFeZsABBW6rProEqsrIH51eLA1wcJLE_xQiSvuIqA>
    <xmx:Vi3LanP8YTDevsX9RgNEBNfGKOAPhYTffAQfqQlAK7H_z88l5J2Zqw>
    <xmx:Vi3LalPXCUvNbRKbbmjHzy4vEsbrJJPgdk16CP8ishEx5VDIgVMUkw>
    <xmx:Vi3LahyEIzsYutGD_kmSXDChZndDUH1Ova0_uwA9oZMmYQEd6LRQNwJr>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Oct 2026 02:31:49 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] firewire: core: make execution context assumptions explicit for transaction layer
Date: Sun, 11 Oct 2026 15:31:40 +0900
Message-ID: <20261011063146.497455-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series is take 3 of the previous series[1].

Recent code changes have guaranteed the execution contexts of several
functions in the transaction layer. Based on this, this series adds
might_sleep() calls where appropriate. It also adds context analysis
annotations and lockdep checks for several locks to document the expected
locking context and help detect incorrect locking behavior.

Chanes from v2:
* Switch from sparse to Compiler-based context analysis assisted by Thread
  Safety Analysis in LLVM/Clang v23 or later.

[1][PATCH v2 0/5] firewire: core: make execution context assumptions explicit
https://lore.kernel.org/lkml/20261009121048.282982-1-o-takashi@sakamocchi.jp/


Takashi Sakamoto (6):
  firewire: core: add might_sleep() checks to transaction layer
  firewire: core: enable context analysis for transaction layer
  firewire: core: use context analysis annotations and lockdep checks
    for transactions lock
  firewire: core: use context analysis annotations and lockdep checks
    for split timeout lock
  firewire: core: use context analysis annotations and lockdep checks
    for topology map lock
  firewire: core: narrow the card lock scope when accessing node_id

 drivers/firewire/Makefile           |  2 +
 drivers/firewire/core-topology.c    |  3 +
 drivers/firewire/core-transaction.c | 97 +++++++++++++++++++++++------
 include/linux/firewire.h            | 16 ++---
 4 files changed, 91 insertions(+), 27 deletions(-)


base-commit: a8cf19ce243bf2cd0d338823fa79cd927e34b830
-- 
2.53.0

