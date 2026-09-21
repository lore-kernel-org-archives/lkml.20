Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB9A327204
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789960781; cv=none; b=YSZRcqkvvh/khrJwlyPrdHfbPDs72J/i+MCgeTDuq4GZivuGoKRscTOXaguDoV3MVzdS641ydK8rRneH2hCg8kHQPfTH91ijluSmTQduafAfRPIT1Ld2yDqM7mOkWFZsb++6EfoYkO0/zq8Ouya8kdfi4fRkSfAmTWmPYzHkUEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789960781; c=relaxed/simple;
	bh=vG+b7uUrrZZ1dKEaVRF9ZS8jpXJrVMS2o1f4mrpGbkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GvnRBriU+2UuQIBnI644xgBCwEXoxajLJTRNPrn+Eb4hLpOaSEcRgQrWtsDJVqyElGQemfdBsLugC01ChFz7AEs3Om8/UFRvAkIj506O3vAEbt4agnfXxufSPnY4xRQ7tQrG5H+0hHws7xLj8zBhguLk/Ekk1Kr37ukT5zVggQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=GY58S80L; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XVN5KdRQ; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="GY58S80L";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XVN5KdRQ"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8CB1C14000EE;
	Sun, 20 Sep 2026 23:19:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 20 Sep 2026 23:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789960778; x=
	1790047178; bh=7m9I0Ngy8V1GFZX6yxe0c/I+uj9r+qy29sHS1jouhp8=; b=G
	Y58S80LTMyB2gDYbenrJP0jNbbPCk0XSiNYCR7p/AUfgaETnt3kAeQkkMuyZo2z7
	cyENd8iLbshlagphUzAm96Y5BZ75B4tSBhbD+1YMkDviLHAr20s9saYiwTz1Vc+B
	X9NFD2S1aGBTZLe5szMZjTZGOJDanOppZ0iKiWur74vq6GhYtk2OSNtGG651hjrc
	zG65LbW8z0sDxj+ChuZ5y7mbW/pSDxbR8ERoUYxHB5/howgu5DP6iXtg82Gr9Bi4
	5XjfRh2BWu7KmNpg29Q77ctalXR75XJDcBlRrcesIXmlreFT9EJNp3LVj6EeyhA9
	hq2qKmJROPgsW80/bVflw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789960778; x=1790047178; bh=7
	m9I0Ngy8V1GFZX6yxe0c/I+uj9r+qy29sHS1jouhp8=; b=XVN5KdRQTczL48ejY
	x6E7c12ggSfFwdIb60KuQIuF0FW79jWujNRxkGU6WRgEhIHYSjHKKcuqaq4MPSPM
	cfQqg0pr1rC0lcE1xu5z15H4oaO9KTGaY20fiF/zABGjFNUqKHvAeEQ+mejljcZN
	71S+hnRJftMNttJrZ91qQEQexKBqE3GUl66aE7nj/dI68Sh2R2e/UWcUY4KpcGH3
	MGmgyr8sIulAl5SDl6L6twvT7/wS09NvqxrEHPRpLmtu23XUA6KNME7bMNUEM9ir
	MMVCpN8okwv/VeBtm1ifXlBhHRNwYH3M/Jd6Hj4GUuEu0FhovYVRx1fctKy0EcnZ
	w8mKg==
X-ME-Sender: <xms:SqKwagY374-uYPJLFjLskOn1ZJ6EdCjdlbAKZC3y3Vmu_CYhvIm_KA>
    <xme:SqKwapUarElxcfZJeCEUbdJRJ1pwkOC2Yg_kprfRyLXCHnhd_C0cqh06L-pASIERz
    Ez1YlEDLCjJTnaAWWwSdOx13eHlSP3YFsIvOVJZVurT-Qe0pi7Pycaf>
X-ME-Received: <xmr:SqKwaiitS58rKJ0GKVLs1h-vlemI8s9vcSaNbDIQx0D_nxAg38WeuSP6v3mr_-8xFsduKaCx205pmXtYhj7YmL5Bqxe2gwsEaMkXLxeEIBHrXA>
X-ME-Proxy-Cause: dmFkZTG4HxcRk5U6N4ypSfJUTdx+6umR7TSQ4g44xSCYOl+LSsOjyHLREsxOw5gpDWjGze
    ssZLXb8NQxBJAfAUzYHAbyvWaRwsq40mDR3QglpIIDOh4aDtOIlzcZNB62z4mDymKjq8jd
    UAw+qD5Fd6CAYTpex4syY5GNMZvis2cXIcCo2nhBw5bybLWSYdtPnUCp36inipJE76ak20
    d1oH1q9KObfdYrwOh4VrMfNbrg6I9B2GUYo2Bcgfzs4yTgdISuPHc8sFeR8xscqwDa+lNM
    zTDlL6JavrPbKQ8tH66oqgOWzXA9BieBgfS/eaXHh+GlACm+XjjsELkq75QnzOipCwA3qu
    Z9fhmmM/mcQX/r/ym9pfBLISOgVMcy0pCONDvLCpswYJrI0ZtoG3QOO7kl9NruNV5wxNHK
    OhvVe4pgcziHqspLjS3C8jfGSFHh4UBiAIXhGSE4BVgfRf0o/O62ToErMfNoa7AbT+dZxv
    H17H6e+ENq04veNkqDPQnlFppggwna4hwt97+vMpCyjftoJFFImD7+GYBgiIOxYcEyQYt2
    WEvP6aGHdjDlA4AdYkddCRXayOJGwRjCZZxf2NmnyCWTDcjJybWyocDXLYi+uqzvOginAx
    ByETO/rnDoohj22hBgYabm03PQossoM3a6sGt2+w4JQzfizp0YNqdEPuuZEA
X-ME-Proxy: <xmx:SqKwanWVQr8-lgSn0fqtepjROSachpLXUCvQVuShhRNek-BhQWrOhA>
    <xmx:SqKwapNzEVsI1NBDFs-wE9ucmieuB11XGsH0cmIk4qG9N2cjHvpDbw>
    <xmx:SqKwajY_mitsvKF7jNgqgNNYepZzjqNjfGsPpdAHfi3VgDqjvBWg0w>
    <xmx:SqKwalp2vXMmVY4JIN1JRgT2_uQXqDr9Br5nAwjBstqy41jpGod0UQ>
    <xmx:SqKwalO4z_aI84Mlth4hx-5pLSulm7sEzsMBwW2drEZwu_IUMsTeyKnz>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 23:19:37 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] firewire: core: update kerneldoc for fw_send_request() and its variants
Date: Mon, 21 Sep 2026 12:19:31 +0900
Message-ID: <20260921031931.287429-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921031931.287429-1-o-takashi@sakamocchi.jp>
References: <20260921031931.287429-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some error paths invoke the transaction callback in process context using
a workqueue. All transaction callbacks are now invoked in process context.

Update kerneldoc to reflect this behavior.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c |  4 ++--
 include/linux/firewire.h            | 10 ++++------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index e59b347ff248..8ef04d84011b 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -374,8 +374,8 @@ __must_hold(&card->transactions.lock)
  *
  * In case of request types without payload, @data is NULL and @length is 0.
  *
- * After the transaction is completed successfully or unsuccessfully, the
- * @callback will be called.  Among its parameters is the response code which
+ * After the transaction is completed successfully or unsuccessfully, the @callback will be called
+ * in process context.  Among its parameters is the response code which
  * is either one of the rcodes per IEEE 1394 or, in case of internal errors,
  * the firewire-core specific %RCODE_SEND_ERROR.  The other firewire-core
  * specific rcodes (%RCODE_CANCELLED, %RCODE_BUSY, %RCODE_GENERATION,
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index a3a3a9ec1b21..eebadebe5936 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -419,9 +419,8 @@ void __fw_send_request(struct fw_card *card, struct fw_transaction *t, int tcode
  * A variation of __fw_send_request() to generate callback for response subaction without time
  * stamp.
  *
- * The callback is invoked in the workqueue context in most cases. However, if an error is detected
- * before queueing or the destination address refers to the local node, it is invoked in the
- * current context instead.
+ * After the transaction is completed successfully or unsuccessfully, the @callback will be called
+ * in process context.
  */
 static inline void fw_send_request(struct fw_card *card, struct fw_transaction *t, int tcode,
 				   int destination_id, int generation, int speed,
@@ -452,9 +451,8 @@ static inline void fw_send_request(struct fw_card *card, struct fw_transaction *
  *
  * A variation of __fw_send_request() to generate callback for response subaction with time stamp.
  *
- * The callback is invoked in the workqueue context in most cases. However, if an error is detected
- * before queueing or the destination address refers to the local node, it is invoked in the current
- * context instead.
+ * After the transaction is completed successfully or unsuccessfully, the @callback will be called
+ * in process context.
  */
 static inline void fw_send_request_with_tstamp(struct fw_card *card, struct fw_transaction *t,
 	int tcode, int destination_id, int generation, int speed, unsigned long long offset,
-- 
2.53.0

