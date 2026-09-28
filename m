Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E20D2E8B83
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600246; cv=none; b=BwkUvpnDRtDEWYJojaSwooclcGWl2p3eRU5CfzwLeVM5AP/zRznKVaSMFJM/bUjT8iryL6gStpoDMrrDE8TaWPyMSSk/fwpr5uK0W6orSf8fAtyTuZJa7NRlGMd7ITYqWE95ZvHbfE9zJ1IyGpVyqd2/jmd0ewVGah8CV6+QkUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600246; c=relaxed/simple;
	bh=pEnM63URlGB1/0FCz7WS+9gD2v1DPQ2mwk67fTlGtnA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n8TD83fD2vWOkzGs3GVfq4BH05XOoELwKV0wp/CjA8ZfQuMGE4wolgIJSK2HeXmTjehA9NozHK3BRTdbCXBTpRdhk0W9uEXNQCt2PQK3WJ59QyQQlHrok9n9MLgDDQ+cNonMaCZj+dkXZWAZV7RRhiE0JaVN0EmUZmFZv2h40UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=qj49Hhk+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=loEjg041; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="qj49Hhk+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="loEjg041"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EA95A14000B2;
	Mon, 28 Sep 2026 08:57:22 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 28 Sep 2026 08:57:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1790600242; x=1790686642; bh=nKmdbqweQD
	lMb4yUB3zJ/3kbqMhk0JAOvss9IvIsNV4=; b=qj49Hhk+cnHcpMtaQNXDKFry3H
	DXg4vwKxFOp+khGq97JBZZ9Z0zygjhgtohyFB1tkTrDkeDrI/9qDPP+RXsLeI8G+
	1zLllto9f4HFS04zI/32TntCUSdqxDbmLEud6cfgRKPM3oTGKeMS/Sg15MGqtanR
	Q+0jeDbp9QYZX+Iyy8lYYmqSoetHi4tT1BrDVQSOlJIpPCHMPNjKNdKjamscyPKk
	ATECft7R/H6p8oePEtp7AGFByGbU+BFJwXFeobYKjmccg8uU5Y/LySkNucXzokHd
	tZEm3HyUE/63vB/GrGcfX+y7Et7t1aPFxTr7/DEPqPP5f6Gzt9Y6X6ear7Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790600242; x=1790686642; bh=nKmdbqweQDlMb4yUB3zJ/3kbqMhk0JAOvss
	9IvIsNV4=; b=loEjg041FKKBPKdfkN8nKfELMfFyf+0bpt0bHwvqiQrj3gRDIT2
	0WX9LO7myM65xPjPTr90S24HSVMxeT/G6d7KnCGIDQ6frJOdcEquPZgTXNlPbieC
	+qIl8zLnsHfPhzWapqR0hs6o2NConVZVxJGvosIfxfV7QjzgNcF57/d+hTTVCcax
	gvV4ZUS4e9QZOBRkkkXLcC7i0Neib5j2ePMTGIDSaMkdwYB0+NFtaUD6rQZhUhWZ
	iKvveEhAmxDzEcjGn2naGuIxmpS0XMnO9m+hNAXPPHBpqu44dRi17kdrjFOy4xxz
	imDVubKTPB3xT4hnzlq0JH2e1tCuPRBqiYA==
X-ME-Sender: <xms:MmS6aiJKiTUWAjmijnIgyON4E1rVpepq47VDtBfKonAgUlAwATZedQ>
    <xme:MmS6aoFlQR9mrasnoiZolXWLGUxuvV7S04hhU9UTIaKHtEsDSqgP11ZHWgh7J1dVU
    R7Eh6gRTVAzWG9UQFQSOQaNP45_SHeEBzExZT-OgreJxUuyr6z_eRM>
X-ME-Received: <xmr:MmS6aqSbvGpahMNmaPEc_MCHq2ZfD5wfVDlt2jZ4gcS7-E4olpKWOuMj34ZyrsmGvwev969A9uGVUUodLJD3_gFwssewWn3Hkyy-YENxrqQRfhU>
X-ME-Proxy-Cause: dmFkZTEf6xhhPuxRUmsWRBOw+QJGnDaN7mHbrO3chHQvBjRvJ722kOn3N8E0mzJ4hlkba2
    y4tDI4E8ki1RU9zaX9nJudgVdkSi4cgtHNKdSBnjtGOkobcX6CqapYCOXN5vS1nl7NToc/
    Cruzc/erfS0/RfCEcO4CsRb1GpM721oyDrzivaysIupCF4WMNqOv0VaH0JHFfKdZvP4peO
    KytEmys0xXE0Yj7u+Az/vW2wTwhEcP477v35DF0tG7uwavyqKI2K/oRGjEs//FrR6r52hK
    YtCS9139UV2cfhMW/RI3O4U0ALxRlMnLcTFleCIWkH+DiU3/iL8FDeJaYXLQTl/tf2RREp
    75fkF0jh1TilGDYwP4qsOcOb/QHuG0L2/ruQB3RmgfBs0Dvf+BSNTgxrPs6czZDiplcbZD
    9EnrfDsGimeSq6istc7WjMEIITvNy1PZkMzX8lh9no9KNE+qtS+ZHjorg1TMZxhQIbiDeR
    kb+jhXtY8+x2MBDQfeJLgq37bqFrrALa5e6wY8SEoJiFgW5NaEvWIRx3PRPaFM5y8hBz3m
    3406cwIdjTRlmwqkI+dyHuyGjMsWNYVHm5Ym+QFeqWHC7f09E3k1vq7OFvTXSd0HUKscP0
    Wo7QVRbJ3mBbfXLS6MPJCIThXaRabyB7vVbzKo9c70JjBPaHH/LvaxQtYwTg
X-ME-Proxy: <xmx:MmS6akGI6zbHBa1_Ai0KsIBFC0_uZ_dERdU1Y7RVCKF2P2ekd37a2A>
    <xmx:MmS6am8cNNQ2GK0cblDyhW16y9vJ4z8hrsfXNUAl3KxlOT3bM4zX4Q>
    <xmx:MmS6auLM4VWWxg1OIKa39ngL2iDueVduV3imfdkn9nKDovgwvM8vEA>
    <xmx:MmS6apZQDYCNFevkNAG9_TpAVHH9GsL_07a2pWwPl12dvOT8sUzIvQ>
    <xmx:MmS6ak_xjdDGEpGy9gQA6M9KZ6QD1rDMmMIMqcVsRPKFfRBljhEKnmHd>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 08:57:21 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] firewire: core/cdev: use kzalloc_flex() to allocate structure with flexible array
Date: Mon, 28 Sep 2026 21:57:14 +0900
Message-ID: <20260928125718.50974-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Some structures are defined with a trailing flexible array member to store
data. kmalloc_flex() and its variants are useful for allocating these
structures.

This series replaces kmalloc() with kzalloc_flex() where appropriate.

Takashi Sakamoto (3):
  firewire: core: use kzalloc_flex() to allocate structure with quadlet
    array
  firewire: cdev: use kzalloc_flex() to allocate structure with quadlet
    array
  firewire: cdev: use kzalloc_flex() to allocate structure with byte
    array

 drivers/firewire/core-cdev.c        | 11 ++++++-----
 drivers/firewire/core-transaction.c |  4 ++--
 2 files changed, 8 insertions(+), 7 deletions(-)


base-commit: a781263c292e7bda50812ba2347459e8ce9d778b
-- 
2.53.0

