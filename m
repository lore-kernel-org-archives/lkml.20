Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322E154704C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 04:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790484255; cv=none; b=OlB08KVu24hop1YJJLfekW3H/Fs+fn7guySNwo+pCn61h90WlKvPuV+LUnDBHb/mrB9JZNd6KWkQxMsSdbDNIbpKfK/BFRORhgmUThJflfDRVsVKkJpyNaYi5iJhK1PrpSJMHafn/oRkk7Y3umWNHG3hYAYxauViJb5ZWT1aon0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790484255; c=relaxed/simple;
	bh=xIBj+P6YoziWSVvKVG/e+5hFF3kbO/sYahvisr6mERo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OV+Mk5/L+USmVFrJcUwf2mOX+vbOaMWf44RroTX68v/nxEhv0qO4ikhgqWFjibGDjC9QjSQYz+E74q2dFcYt0Pyz4vgbz68THBZ95q5ixc0rgNriDcVXDatNYzWPyNXrnf3Z1z+ivAIYT3nHgX0/e7r/vrI1n+SYUdnvnVJdr/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=0RLMbiNb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gq/6/kpT; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="0RLMbiNb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gq/6/kpT"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 9A1571D0007E;
	Sun, 27 Sep 2026 00:44:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 27 Sep 2026 00:44:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1790484251; x=1790570651; bh=noIfjlPv0R
	uqJ6jgTkGc8yOn6ANLSAGbMTHe2+8Mzpc=; b=0RLMbiNbo+HIlJh56FSbVGvO9/
	WyRRD0wr5ezL/KRo9UE3XRoJK6vSwLO9IXIZ0zoNZBvOd78CoGKSHHoghfJVoaEt
	vRBoYcwMaZtQoi8L6gkm7BcevwCDfr3JLWbITPckBMh+FkY0gA0o4vUFPq+mvfdM
	D1C4BsQYVRE0CRTikgjUBk42iGwtVHzg3l2KpWdGdhH+agNesXtb127vE8PvfKur
	00oMNHleHRe+/d0saf1o00v6RkIoZZ2I18gNWCX2N/9T/H8fspAmDJuY7Ku44jZ4
	GYom1ebBCXZGdHlPhb5ZYMQTiyBhstDWqdO6mEVsXNSR410WrV5xUt4OF7HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790484251; x=1790570651; bh=noIfjlPv0RuqJ6jgTkGc8yOn6ANLSAGbMTH
	e2+8Mzpc=; b=gq/6/kpT9RQRaQp90gRB5FnjjR4NMAjlW223Dqv5vWFfxjMCjX5
	HuDmCrZ25kjJeQaA8uKGkU958z+1zouLQQ9Yi2dV7qjdShGW2f6jwT5IWh2Q7S9w
	GXWlZXD9z85/cS64bWcsHPX2BhrTvcN3DgSGSjC8mb7/p/nxzxfKWIybOmtg2t1q
	KNInO0XoxXYzfE3JGTDtV72wwa9aP4aKg2kS0B0bCnZqRLOIiDQNyuPQZfDTpcIk
	B+Js4v9XMjMJVBVPC7srBVbncQliZ8RAAEQVtl7BgzRWE55qd+IQ10OXGiaWtuWi
	3Ln2W3Af5ZQx/8YYaOFY98wl6cn/lgP/qtg==
X-ME-Sender: <xms:G5-4alReKM5JhnROnaOPqgtIvww1qmQAabS1Pjh8ehfS32t9Ci3vBg>
    <xme:G5-4asvqOQF8tlONYvU8jQj0tudezpit0xxmVboBpS6XXmLojxKGXwzA0HtNhpvQW
    4vNjMWeU5atmPQfv641i3XiVcheEeFJdUK1nqeHg-Y1V8eCFG1XvZ5B>
X-ME-Received: <xmr:G5-4aibYhfXjpORUdww-l1n_7KYYUH5rYqO8fC9sfDXkcOQ5hYGwNp5zLpBp_Py93pmvYHg5emTwz0zVNpPiQZ_dLYjNkJCC9Wh1CzF8q6Dx4Q>
X-ME-Proxy-Cause: dmFkZTGT9Y4A1GdT+6fMUFHYnDWd8gPYGJzWV9x2Xkback747Jx/6kkAp5IvyZ7LRh9h7p
    3F8LEwHbwF4Dj2Fl8r1R9S8SWUmiydQONm1huQqT9OzQxue92wF6o5EXtKtDf97ytvOIh0
    3waxy6aDCY2SOcsXzCB+zgKbkLAO/ggmRGWnttl5a7k6gdl8G0bw802oGHYS5bEzIyrCs6
    WXy9PMwisFjaQzeW4it40QScyr3g6AMew6Wvlg8URfzO9dRPu5KGqShoRdDQ7hIdi1ZksK
    mFUGuwnYSu/f58abXlXPaktHijAjyVzIi6m9wUQ3lPNsJi4aCagf636tl1tPI9AvdqFCeC
    wTghlNYJX4WgH1pulD1FRHt0Roh8tPCWGSjEuONZ1G0fgoMJjYdnYGLpBQye7q/jrZCUCp
    GHsjUvtB7grJIkVxPcztd4YD6TTsMvTdxFsoRG4NFlmHklMh7n46Rabo2kaRs/svQ3XMoY
    +PPnt2AeSQSZFEEe8RtyQw+VfsV7xNdeUN3DpcLEnoaOC+/x+pmizonKrQ423hTgndc4SD
    xLmvuqU8yrnkdxuxj3DGSODC/tbjzRvCuowmRONoXN1tZKrhyG6xvu4HLWo/4F7dsXW6Zj
    gddDlQgfE2gogQC7sO9lDNPc0lPP19CoK/Rdq1Dth3GQ85n2hTvgAnYcY+tw
X-ME-Proxy: <xmx:G5-4apsXz56jXZ6oJrbk8zzDjTdKx1TjguYpz9j7k6T6KcC0maRpaw>
    <xmx:G5-4asEB27UD9s2PslqZbVJjwNA5-7Ovtp0fZzZDUdCe52F12AQ0CQ>
    <xmx:G5-4aswckd_Z1d_FXJAVHLC1BWmCkYrfYUb9rS4upJl4PlI1tjLchA>
    <xmx:G5-4ajiTNjlsKr7dTkPLECyVoboGNdUL-TNxOoX0ryxh0XyrY04NMg>
    <xmx:G5-4apGwvcCe89owUabr8gSaclDlSwb3ovCPib6ywtnOz6M_RY914lC_>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Sep 2026 00:44:10 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] firewire: core/ohci: misc fixes for transaction cancellation
Date: Sun, 27 Sep 2026 13:44:05 +0900
Message-ID: <20260927044407.65497-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series includes the misc fixes for the transaction cancellation.

Takashi Sakamoto (2):
  firewire: ohci: remove unnecessary branch for timestamping when
    cancelling transaction request packets
  firewire: ohci: run work immediately when re-enabled in packet
    cancellation

 drivers/firewire/core-transaction.c | 17 ++++++-----------
 drivers/firewire/ohci.c             |  2 +-
 2 files changed, 7 insertions(+), 12 deletions(-)


base-commit: cc43480ac04cf909387d8b722f7491905ef7a7c3
-- 
2.53.0

