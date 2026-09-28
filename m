Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308D03B8BBB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600247; cv=none; b=oDPrUsCa9T3+56NxjCx4dM3Bb+uGAZUPJUwzTyt3/xc8g32X1MZR5ccorMrKPt+IIYmsZs6BmyV1FprjB6LiJeIVsbLpzvzCEyA+AUSl1iLlkveumrgII+jvxWXvwd35p4mgxm4cQLGaidcW6jkcBWTE8So7TTPUTH4r0AKvBkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600247; c=relaxed/simple;
	bh=wJGfx5ZysiTIMgfd7k0V1oxyzwx1W30e7kO8pomAr8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MsA+5sBAk5znF/IyBpauG/1QLdCP1lGEYi31CoazWCUkLYe9cdPFyMfE6cuZ9COKrxyOyFwqeRDlAgY/x3VZr7wWsaTZD7AVfg0iHvUzGC2o4rlvwXk1CrbsrrbJDSRPsP9fG5DR9QpTL+lvIejr9r1tPFrL1gC3oqU4q7a7sSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=Hx+T5+Uw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rH7bMQs+; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="Hx+T5+Uw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rH7bMQs+"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 455BE14000F3;
	Mon, 28 Sep 2026 08:57:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Mon, 28 Sep 2026 08:57:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790600244; x=
	1790686644; bh=V7S9fGyx1tc1FD/rcMM9Qh+9J9x2woKyIqZiboU4EEo=; b=H
	x+T5+UwL3ZvdLzdEcZOewVTkQyWCeHy8BCjYovXmmhazHpA/5zxV2KVMbIuxcPP5
	mAyPYCBnzpuY1JxM1R6UUt7PjwSoygzUnsCs29YA9jHK+m9LuiqZHolBey322zHv
	Ga0NQ6zjuK35ty2d9w48wWtR74QK7m+TDURaCczN/IziFJzTc3qYMyTIqzdcorsd
	tzzy6qIGOU2T2bIyRDAaUtaLwd+OCelxZPNNeeY4BiCjokaDniY0KvyK8pnT8D0T
	u9W/CVwZyPf9Pc5c718dwR4/+G8cT4wnbpGLazfv/sJ/O2NQN8FkjsXoBIDgWpML
	n/ccBsclTQKNkdjV8/hCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790600244; x=1790686644; bh=V
	7S9fGyx1tc1FD/rcMM9Qh+9J9x2woKyIqZiboU4EEo=; b=rH7bMQs+WOTFmGNuH
	nmLEpchPVh3aerquK/T3jc2QaNcle0VlQzXteaaZstF263VKPyZ++jPYaSRYoPXA
	iu0+zWOtohYi++FpJQaLT8so6Lkx0M9U41dQmDd63k7sQRlXqcvECGlEGjLsEVzc
	9L5pVW7cKYjnzN7cRaptCa0QP+t+doUounzxpRRicMm7oAN3o3i7I4P5P8aV77ws
	LX2ccEVDi7zdwkCv8RuDDQHlNBtCn7mYo2HzXnRgRiJTO7KVVLgFTUDtn97mi1GS
	ERd1u0IxsJ75Hk8fT/x26zmN9GsPbYCe2h7/QA584Wn1DiYWqzDEAWt8oJH0h21a
	HlDHQ==
X-ME-Sender: <xms:NGS6arr1_lRcjN9-meFiBdADL0ILiiMEO5XJdgBSB-WItZmmVcfmTA>
    <xme:NGS6ajkFpjwJw1uAWeFnsuHyGbWzuPhhJAUNkgcfjRnaxNQwe1UAu8FpZtDQjSJfH
    KwQ8vOkxTwu0XTTpIH8Ref8lz18Nlmr87gxUpW5lcxMbAhSiVk7phem>
X-ME-Received: <xmr:NGS6avzssyPaDPYSX6buDJpgylgwlXwAG5u-UOuL-jBMIIVBD9Bp0ll1_bUmGcjo4nn85Jl3liVRlWGCrjPiTMl_IJ-ij68KYWmqyVmXVpkK6PM>
X-ME-Proxy-Cause: dmFkZTEYPQEAqe7gPFHjplnO60tfuhjhLdOmqwPZBkw/sSX3x33K2ucn9ekowdHZ8vN8Ce
    YG5E3bsJ1R8Ji+09oOAUkFItFE58O4sD/8UfqKzqOHSTlT/QJ2ZZ/+lfSG8WUwpRWVEFxC
    +A25lxNWJTBn3Lf6y78WP9m8S0fo8FFZLSIi0lbmp1xWWT465YZxl4JH88g9yVS/HqC/Ks
    eOUF5UiIk9KzXfA9VNpGLTq1vgq3O7bPrwmvHF5vnJNGYLYqUl/PJ1LWyByERcUanUfe4K
    +FHR+Gqq3U4x537MgadHpxXMimkv35U/ETJ3HWHvviY/8f25uMv+qzDxmQgW+ETy0Z+Rd8
    FC9vshFkGaZ40EuKebZRh3ADmx6VOdWUZpqTJN3ciS7A3oEBdST29nSIEjl0+wDl5Aw1g4
    73mKi6ulPqbC0iHzTKMy4JGr64BCLBxh6GSZMDSIbjNrME/AK3CtH0PxeRhHiFRAwZWAAR
    eyif+bgWIe77NdKYR8MaOS3WdzgFRTBmdCtRqsh91Phn1H57cjmdVdhziWnFEGu6w0Wdl9
    e+FbYTp7pwjrkOKJUkpSatIa3vofROlpE1cVkeZq5NmJBOggA8ol92uEDxpcHy5oPiCwR+
    TdveZForh4y4CNW26+Xp2sW3qs9H1BskrU+fVufHGDguxFb1on630Kh06QWA
X-ME-Proxy: <xmx:NGS6ark6bnhyVAcXfM17EItXKCw10cG2IXxyZcPwNRR8g0pEkPMDLw>
    <xmx:NGS6aofp0btI7M4gVJzBHHu3rjC1794TEYRTDYbcUeaZrbuqAFDQrQ>
    <xmx:NGS6ahqwdZx4wgIyV7i3PVcmz7fVdIK6z0a1v1cVJ0v18LhWCzBw4w>
    <xmx:NGS6am5fyXLbwPnF7I4bkKgo-Viv5dpOHcBGZOqKKnmBxqxjuwVS8w>
    <xmx:NGS6aqfbnqtts73mxcXy9ef9VeaFdVEgQCMuvFfxRVU9PcmtBCZnNu0O>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Sep 2026 08:57:23 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] firewire: core: use kzalloc_flex() to allocate structure with quadlet array
Date: Mon, 28 Sep 2026 21:57:15 +0900
Message-ID: <20260928125718.50974-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260928125718.50974-1-o-takashi@sakamocchi.jp>
References: <20260928125718.50974-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fw_core_handle_request() is now called in process context, so GFP_KERNEL
is available. The fw_request structure has a trailing flexible array
member of quadlets to store packet data. Use kzalloc_flex() to allocate
the structure together with storage for the flexible array member.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 7450eb0ac3cd..b4fccabb8fb2 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -894,8 +894,8 @@ static struct fw_request *allocate_request(struct fw_card *card,
 		return NULL;
 	}
 
-	request = kmalloc(sizeof(*request) + length, GFP_ATOMIC);
-	if (request == NULL)
+	request = kzalloc_flex(*request, data, DIV_ROUND_UP(length, sizeof(u32)));
+	if (!request)
 		return NULL;
 	kref_init(&request->kref);
 
-- 
2.53.0

