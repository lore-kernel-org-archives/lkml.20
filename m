Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F193A5421
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 04:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790484256; cv=none; b=FCV+IoeMy4E8pZgRvkrvrq0g92N+gUfZfzErIifENie6h75AiPUyI9VC2p9jSkAORDhj03vLNFjUckKtZBAynZHIXVkL33D2gcPN6dGvBNUq3Ykq3OTeUlhVwxh0tYTuQAkITBMG7yoDn20pl8FDsfY+p5Fk7o0qBkd08W9tze0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790484256; c=relaxed/simple;
	bh=M7qvfatcCuv00haAgnBudd7b/o9HnKAY+PbbJNfET/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=odckgzQzQ4JQOu9n4uCW9GnLTYupoMLinNucbph49bbBYMUml+0CXqh1AVwP5AxwCtPbXMovT6SYkMmJlb0wCbU/CfmRbm+e3gf2oSHpAqhSN4CFO6Oz7F0TXY/mLfFZEF9u+Xebsh/JpVX4xEYpvLHRLJt0eSRLevvRYkYlc7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=VOCBofeA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ezlxlbKg; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="VOCBofeA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ezlxlbKg"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 775A91D00084;
	Sun, 27 Sep 2026 00:44:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 27 Sep 2026 00:44:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790484254; x=
	1790570654; bh=cN17wx/tYY3A7nLvFg9YbSUakAbeUscfElur3IKxdXg=; b=V
	OCBofeANNoxvFeZPhCehwlspQ28arFIWwWeRRe13sOuIv7DfNeTZ1jYV/j62pjvL
	NLNbgFII+6n3nhHamkbMsuZiA+OjF09eOJZ7+c7aASak3tco+m5WpOwLzOQZl5LE
	CgBEsoDpiGwXGVDh7VsSdgxntMFSMm3n4fq8l0UknufYxdeMXl1EMcUnhFHBtSyO
	FOPEVOLNmQfejov5v30wVlRMCJQxS8xSC0C9AWTiTwE1Oaesc8eFBqHAbVYKAEjk
	RxHj52N8nyN2ueyj0jFalWoiWdpPIY5+25bKWbdHxU/2Hs7ixroWDvABP75t7zFJ
	anEbiz3/njCsnlSjuXNIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790484254; x=1790570654; bh=c
	N17wx/tYY3A7nLvFg9YbSUakAbeUscfElur3IKxdXg=; b=ezlxlbKgjmDyxxczY
	qjAgjwPt7eFuRLRsaSjh3i3giQHGds+EgHRbFZHxtPYG0n0xSb1oCaTJWlyVvRaG
	4Pn520qWLqwKTNz9xzcpc2M0GTiBzva3zKieoVoKsLsJfQBf1ptCXCTVbf6/IrmZ
	8WBJ3ndpzWGJO7cJ8qGb+u6zwfDhOBVV/l6gWVnQooEnRt4Muz6Zj5zZxkf2Yvja
	+R0QGC/LvqoM8GclhmAHQW278FLW9dbD0ngDaDj5si7JOAyncjATbJBrphNmkmVx
	HNSNxYVGIdrl4IXZvAvNt+FSzAh5uQsxEnkgW4Wd/RP3JZjwrypTfCIBVz88cYrz
	6Xenw==
X-ME-Sender: <xms:Hp-4aqBZ-w9AA_jPcoyeaEVXyWVADL2gfTrEvmCOh3jwISqHXOJQ-w>
    <xme:Hp-4aicy5ScJcKS6akSkV3r5-MHZwyDP5zlEvSib4_Fzpz0xYiENB65TlPtTMSRn0
    v2ucVzGI_G7TLoKP1ALvvyuFOxttsxghUmhmUn4VMNN2U2AHRU6JkU>
X-ME-Received: <xmr:Hp-4alLiX99ez87OglKY3R2ZQLAA2U5cSAQ1_imFN_s8olOi_N6StEvC9dZ6m8MCYP5xqjL-05VRRdQtqYD06xLl6OvbC9_00CzU3expuOh3Gg>
X-ME-Proxy-Cause: dmFkZTEnlIJ2mn+EkWbNnwf1fHveJ2wzKokm+zLmsGVU9hPfRZjH9y2xwzjljRNVRnOJnL
    9l0YotNdNVkKsujYo1vwEF3gssM7TP2tsbvagwR0DQLnE5kO+imWpB6feprhg2gqzt4TaC
    2AsGV93vOOH9CCt6zI8lgPBEZKGUsu/HTR2HQH9aSC7os0XYr7wWoYhz0mB6/qvOBmgXFd
    NQ3YXFB+frqabGD+NiScWd+GEiOv0wWKOy8CxQMxtdZXCHcffKPyFrQKDsXdhmqv++NLBK
    4pD3KgmemG/iMaBchgnKzoNkyMrRzez7RFFziAdtspBHKnSJuh4PW0bkFgbyCT/c49KbKE
    44F7903n989PVPvb44ZR/ebPWuIrklFtBr+YOxz4b5gxLfOCkF2sFyMgAfHUkXleLyW4yc
    Zc6UOnOxkXBeEOq24tk/J7LjYgoHjU0GwFUEgJeMGTMYAiCFpvItLuBz1HmpLQx5R/RPSd
    dzPv8H3afGsMNLdCopKLoOwJl0p+wnFG9qEtYZCafKMw1AW6uOw/McKjjEJVNMR9U4lqYK
    tvdOk15rh8goFC0QH1bt/C3c0faX0aACLaCFx4N71BCMf3TLaBZAx/Rw1nICirmfhxnh+H
    BRc78YI4ZR6a51zHLiWCw11IHDOtgNBUvFAFsusSKERhssI+9ZLkR90TW79A
X-ME-Proxy: <xmx:Hp-4alf0WJ4psxEcZ099wvMRQ2PjNMZeiDZilrTF8fVGN66Vx_SO_g>
    <xmx:Hp-4as3lLuX_dszJ21ythifMOEZY3DurW9fimP1Rtuoty3hxDNAQbA>
    <xmx:Hp-4auj9OwjZdfSSvcEvTXq_neHRfUPRmrDUZZ-cPo5ZUwnlQOUFww>
    <xmx:Hp-4aiSUB95sOg5yXaFGvMaZOmgBmxQVAImBxf0C2De1eX2ApGmUGQ>
    <xmx:Hp-4aj2X5svWqOBxD-tMWrnHLMldiA9loE-f0dDu1TD3a_TGuaY-ZFQK>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Sep 2026 00:44:13 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] firewire: ohci: run work immediately when re-enabled in packet cancellation
Date: Sun, 27 Sep 2026 13:44:07 +0900
Message-ID: <20260927044407.65497-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927044407.65497-1-o-takashi@sakamocchi.jp>
References: <20260927044407.65497-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During packet cancellation, the work item for the AT request context is
disabled. As a result, packets for request subactions are not processed
by the work item even if they finished, since the work item can not be
scheduled from hardIRQ handling.

Run the work item immediately after re-enabling it.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 710640b759e4..df53efec0b0a 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -2676,7 +2676,7 @@ static int ohci_cancel_packet(struct fw_card *card, struct fw_packet *packet)
 	packet->callback(packet, &ohci->card, packet->ack);
 	ret = 0;
  out:
-	enable_work(&ctx->work);
+	enable_and_queue_work(card->async_wq, &ctx->work);
 
 	return ret;
 }
-- 
2.53.0

