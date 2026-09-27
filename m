Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D687A3A2E00
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790480634; cv=none; b=AuvMtg5Fq/0PXlCri27qr4zgONgITVW3sebyCfPPxEqGiC0Q2YOrxVPhU8Mq9u5fgRtBQurmlJF7z2TD5dLhDIVyuBEIgd75VaVsKMoXCXeZD4xy7a4qg7Xe2mZgDlNoaGYvxghbAvN5CHjVv2Z48g3SwpWuxspYWzj/IWqT7aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790480634; c=relaxed/simple;
	bh=mLY9D3mLLGQDdbM6u/u6Z1Ge4JGERc1BaspuSb/ZpXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H9kwgHVSY5s6F7SGBt1JQui9gX87eaPwoAjJl/bcUr0VNj7PS6OGBBZF+gZmlihwWes0lxI4q6A/Hvndd5S6ypZ1riBu+B10eLZmc7dzFxr+ablYuM8fsuMD9Q6UjmxEbIfxxfWEaTl0hZ3sOyWm3lBq7XE99WKpT4Qwz4MA3Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=6J+bjYTo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=d5G7+uiK; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="6J+bjYTo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="d5G7+uiK"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2F8867A008D;
	Sat, 26 Sep 2026 23:43:52 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sat, 26 Sep 2026 23:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1790480632; x=
	1790567032; bh=0AGNuy8WUC53hYdBVTUVDDH3E3IsmIQ1R7i75HCGRvQ=; b=6
	J+bjYToJAnzgXAmrXjHAEGqkyHWpgfcpAioju5Ctni9PoTGXflXEb8edw+NNrQht
	yRPDBkZzcRhnRgtTu5OeOa876d+jZTaHXuShGJrLwDsotoJPWAfQQZtAGFTSHZCV
	IZHNncKNpvZdc2BgPc8OmNfd0o9HP5N4mLyEZ1RzxuQ4hTeBqX/eAA9DIGjnbaTU
	OeFhZ923Wp4d79UTFMBzl/pfRQQSGxwMPy+HCuxWel+1D7bNZVaoZU3FEZoL2SyH
	jApSUnQ+L2oa5edsv2TvdgZ4EWRSQhv1FlBcg6D/CniyKEfxAdCRXJXUTDNSR5Zs
	mixr/zGtInR/RnB4MB9UA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790480632; x=1790567032; bh=0
	AGNuy8WUC53hYdBVTUVDDH3E3IsmIQ1R7i75HCGRvQ=; b=d5G7+uiKYOT9rJeEf
	kv0lPOoQI84YddpHmZSftVb/VFhmgc7FOdSOpBfMbKt1PdOEZLuGacCS9OeWN/KH
	wAzb+/ySmWS8h8FXPxd47gNbc8m0csZxUQ28OdZh/IMW7tDeoC25MaGRk3kdChna
	SCZ5DONgKNESyT6A23EtYkDrBHV1Fra72wXgpMoq1O3unlfeQQFk5eLESUTTiya2
	tWifzU2QFQLQiLGb6HDoxbe1B3lqnwJLMspPQr9qlZLD/xxlkSDf6VKLAVYVaPLM
	B0210MO01fwgUnyIBAjRDbMVN/+mZ+3imjfZX70JYwJrXlpp6ohCCkQtXMND6tX2
	8YDOA==
X-ME-Sender: <xms:95C4ame1uGGdzMF9f4T5JuIay53bV0ZdI3i91ugh2krQahUgEH_rwg>
    <xme:95C4auIPbkMC9BRzjwdNwd7Bzgng7j03uvXs9rxjdexYER0GkeG-lyxhI2WerwJYw
    kLsxatZjPSEaErb5DDwGgMyRrqg8ARgA38wtDTnxVELhADmblNdc3w2>
X-ME-Received: <xmr:95C4avFMQCJx4jVB8xBtZ2TzVRMBSVuFYHbDLZ_UpdDuQJRq8ZHciExXrnY1qpxwA6I28qXTtIyRg8cmFqJHKyQe7aXqrin0IzNqWhqxOXZ-eQ>
X-ME-Proxy-Cause: dmFkZTG4lT+eM/OUaCtoOYl/DyUmH6k9tq2VXzXC6mU+ZYl7CZZM+W0Br08Wif/3GBhDGp
    Em4hgAA9CUxyaNCqjaf/KtpIj1FEra4TRF29/NV/1S/y8EdHxPX88wYIaOiyDaa9NsBS5F
    +kvM1s44usrbRXVosvr7ETxX9g93L4NxUaiU6cXY08Lahq8sSjR6uinvDlZx12z/3pYizG
    V9zoLoiI3hYwl80Vv2me32vNfTt8/rRjnCTmT0nnPtU/WmBF9G8s8gMxryfkaCaDrerzaa
    bG5jinsMyQMBeDmNJGPF/S+Q9VsUgSIiUjYX/kygT771dTS82A003V47AUYrh8PeGKXPo5
    ls/fmd5ykY7m31ctY5Eik6t5jW4zezSahq/51P7EvdjXQSFgCTN7G6EevJmgy1J6UN3qQL
    yAkwk32egJoJyLRlfHDIO24rGM9DmJrca4j/S+HYazGhKMIRav6GvFZUySIzsJMAwgYFUd
    uAz4gbAxTeYFS4xI5hnG01FfShnCt1rG4uMN8RoZ0ZvZPLif79PZVhqSp8kjb0qh+qD8eb
    fZzVWQlesfuGN107V1dFNlzbJUhPxSteUGOyAZs7cw+9fMRauYUeXMGWsAks0Mj5Ajxezq
    qYONEHHttjgirVcEyN84thc9IEELnqGe6CTsUoGNa8xhuEZN3Ui4BWvXBKlA
X-ME-Proxy: <xmx:95C4ago0ReQ8vU8XBFAJqAFsGeEEEGvAcFHnST1PoqjaiA_yLzuydg>
    <xmx:95C4agTXBN_E8cec8rT-8SMHRH8PeGX69GtRttHFdBNAxGdYYEKEiQ>
    <xmx:95C4alMcv6-x7_PewpCqtCUg1q4QNq_-qk24c6bzDxLfZbE0EQYp_w>
    <xmx:95C4arOp09LEzVTAhsYODUX_cBoHVViaRt34-TfpfnEaVwP_aamT8A>
    <xmx:-JC4anz08mfYOMIg4Tm0FypwqhWEWA5bX9obyzAKZ6THjwzt5LHYRD55>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Sep 2026 23:43:50 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] firewire: cdev: use xchg() to exchange pointer value
Date: Sun, 27 Sep 2026 12:43:42 +0900
Message-ID: <20260927034343.28076-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927034343.28076-1-o-takashi@sakamocchi.jp>
References: <20260927034343.28076-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xchg() is useful for exchanging a pointer and returning the old value,
even when atomicity is not required.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 9a539de9b0a1..73a940d40b39 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -1357,8 +1357,7 @@ static void iso_resource_auto_work(struct work_struct *work)
 	u64 reset_jiffies = client->device->card->reset_jiffies;
 	int current_generation = client->device->generation;
 
-	int resource_generation = r->generation;
-	r->generation = current_generation;
+	int resource_generation = xchg(&r->generation, current_generation); // But no need to be atomic.
 
 	scoped_guard(spinlock_irq, &client->lock)
 		todo = r->todo;
@@ -1388,8 +1387,7 @@ static void iso_resource_auto_work(struct work_struct *work)
 
 	if (todo == ISO_RES_AUTO_DEALLOC) {
 		free = true;
-		e = r->e_dealloc;
-		r->e_dealloc = NULL;
+		e = xchg(&r->e_dealloc, NULL); // But no need to be atomic.
 	} else {
 		free = false;
 
@@ -1417,8 +1415,7 @@ static void iso_resource_auto_work(struct work_struct *work)
 				return;
 
 			// Notify the userspace client of the failure through a deallocation event.
-			e = r->e_dealloc;
-			r->e_dealloc = NULL;
+			e = xchg(&r->e_dealloc, NULL); // But no need to be atomic.
 		} else {
 			// Transit from allocation to reallocation, except if the client requested
 			// deallocation in the meantime.
@@ -1428,8 +1425,7 @@ static void iso_resource_auto_work(struct work_struct *work)
 			if (channel >= 0)
 				r->params.channels_mask = BIT_ULL(channel);
 
-			e = r->e_alloc;
-			r->e_alloc = NULL;
+			e = xchg(&r->e_alloc, NULL); // But no need to be atomic.
 		}
 	}
 
-- 
2.53.0

