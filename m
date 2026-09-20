Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8164E3E8C4C
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789893429; cv=none; b=AD2TmjUTLTGZIU+kqsIlhpJ6/bW/aD/yeID1jvdJwDRY1p3jf6V8wnfUNkzk4xTRa090JXCrgNJgblZ2ty3extP4r2bnHQ7m8Csly91BjLJujDXhE0r3Ix8gRmtZHAyZ9wq8MBhF9BHY55nNHMsfZ1CcY53xjB17zMGlnVfj/ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789893429; c=relaxed/simple;
	bh=OsfgV4jxXGe/NAuZwnKSljG7RJhELVEka4LNpPFVlnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEIB+0sguG+HbtrX+qvBnUMq5ZRejmiXGMGFLJ11ZqOOa5KMdL0z5LyEmGha1D03AIyMN1kpUZjpOCUBtqvKuArrvlvONHrKj4GPWg/I7PHAflHeURFnCztpJ4Sq9NI9Y7XVFgB4O8l05JdgLvYNbolLDdlcT2ClzkdzLzWUv9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=gfW4+TpX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=asyFT8hy; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="gfW4+TpX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="asyFT8hy"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CF52E7A00C5;
	Sun, 20 Sep 2026 04:37:07 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sun, 20 Sep 2026 04:37:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789893427; x=
	1789979827; bh=nJ1QZDwHfr5CJTb/SqmjVqviS64f6JXgQnZDwspoS+4=; b=g
	fW4+TpXgTwtC2Bhlkl7Z7/hAFJHovl537nuHJxlV1SPctbg3iBUSlnWEn5b+Vjaf
	5SO+v+2aHbgQVQcGPa9jv1EjH9Qw5MxdzIF40zdI7TYdTIFRQYPgcPF+MWY8r0gi
	+sijNHOLq7GN5DO//+VWOce67oxlDW/GMUsxb4yqCqe31015cdRdlYQJhI2eWWvE
	vIWXQlwQBFocUv61n2sTngVLUCx69KjtfiqOLVMVCDegLvXMwR7A8YRQU/NpAjo3
	T0F/NKQ0uOli89aMl7sWHnYpN+rEd+i3tS9Kz05hu547m59mW253YOTVp1kCkbSi
	vqoD5EiCZo0m/1jSva0bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789893427; x=1789979827; bh=n
	J1QZDwHfr5CJTb/SqmjVqviS64f6JXgQnZDwspoS+4=; b=asyFT8hyKbnYyxW7Z
	FRYpVd8Mw0gC2LL/fBsuAnjSz60nlzQZA0+Z29etYywQlYEEZ2LwgziAhB1WJlmg
	XhJpuBr3/eO7EbpYeeOA/WvTguk0uvzZZVrmKvHVBN0IMb4pH7fiCmFf7w5Cj73X
	13pVKijumjTgQsCNtWHiHAQ/xFw+psU4jnr/1BtxNEtC4QDuBxz/JsAtJkxYBkIK
	Jwy9GbAsgkm2B0UxH2vPyipvoikMqU9b3/VR5VoVSmfBdRfIYlq7o/cJbEnATYKn
	5oUzthnxoGOd/QtLq9N+gkif1DbL95YH6FxcegTJ/pNY2TvvbKnXvWMiLVvU1BQk
	w6Gtg==
X-ME-Sender: <xms:M5uvah-tvnpSONDeeQTF36cBMuKZ8QKg_BB7QUaZylzIm8HsxweK5Q>
    <xme:M5uvajrZJzVx_KcvUojit_ahh0paCxaguEiDgN76tOQqiyLpbA-4ifj7tu7Zc_N3c
    CxjdkFguTh7qidAMtST3rwETwkh37DyYwaeYVDqY27AxyzS_DE66UE>
X-ME-Received: <xmr:M5uvamkXYOYENk5tXHypAkxBLAGgbm-pKlh-hLbaZeQTT4lmRuGudVevv9WDMsB3531Oyh_bcdprxG6-gkEiGgq4_ebiutyHZIJ08lYlZDgoDg>
X-ME-Proxy-Cause: dmFkZTGDk/LFpyNUjatZXtdF1Ol4AzGXx/XJJ00P2lEzdhwaC2OHMWKjSTTwzDV54eA+X9
    hZWqO2Pt/aL/IC2w3tQSr/WTF4eOkuQx9cqr/0YQjP0U9qRxKTeqqjpjHmtjKI87XBl9+k
    lkd5l3xFN7T6QNoFdRqVZKYZ1HWzIwBUYfdAsZeZatUOA0ZPe1QtaXNtpb/kZMyNG2cCW0
    AkYYFkNOpR9jWdo4iKO92TpJWkC9Ldvc/R2dYRYBWP9D0fI6R6CxUwbd23p5Y6XPLXkugf
    TZapV8K2F20wWYZVer0gd5Qw3eZniou/ncwHg8BB5HxRPprNSXyj1Vu1JJpcJt8AGbY0Mg
    vQmYihobsT+/7iCwFjPQVf7Q0R7OP8CmJCTpOBEIeNu5/QU7jLmDeoEhEHFBNRd7cf7Gw0
    jco8y4a3butMl7UcQuRBsVXZw3hkS8jniJcMhn0/pwKTJToRi2uQCV9rju4Mn6QjXq76U/
    7rE2LE7a7XAt4xttbZZvK57LSFjcMqN6WiIlH0xC3Qnml6OBRlq54Cf44Q8mM1gY6zMVxQ
    pkmKN++wUEnes7OxznqBTyTREpoL+wzOr5stAIANluaa7UdbSCHnfYcjmKaVuUkmh6vPTj
    21zGtujn3Ovc/okxHYvppicNqu8HQLASEY6opnAmv4IZYFh4u9u8uB9dMR+A
X-ME-Proxy: <xmx:M5uvaiI5VqyI-wmJiceOp3I3ET3T5mdZHL09_j95o94SQzbLpguHUg>
    <xmx:M5uvajyS99pgcRZvtZtV9Xt9LwRykJCs2x43AhDyum-WMFR8Gg0-7g>
    <xmx:M5uvaisj7TGwNbiNqui7ZB7g7Ke3ubsC34TQ-wE1HRNRdlUNfKMEHA>
    <xmx:M5uvaqujsjl7nKSiDpGpupprb3rH4xdgRDauiGukg8Vf2Pp_nSQ7MA>
    <xmx:M5uvavTjL1QDStGuf4BRQDMMiaRJUvnxiLpI4SLXNWVvqOm9vJUYObH4>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 04:37:06 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] firewire: cdev: use GFP_KERNEL in address handler
Date: Sun, 20 Sep 2026 17:36:57 +0900
Message-ID: <20260920083659.191855-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920083659.191855-1-o-takashi@sakamocchi.jp>
References: <20260920083659.191855-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The callback for the address handler is now guaranteed to be invoked in
process context. In the cdev layer, GFP_ATOMIC is still used for memory
allocation in the address handler.

Use GFP_KERNEL instead.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-cdev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
index 3dd8ea1991b0..625792b6ab71 100644
--- a/drivers/firewire/core-cdev.c
+++ b/drivers/firewire/core-cdev.c
@@ -777,8 +777,8 @@ static void handle_request(struct fw_card *card, struct fw_request *request,
 	if (is_fcp)
 		fw_request_get(request);
 
-	r = kmalloc_obj(*r, GFP_ATOMIC);
-	e = kmalloc_obj(*e, GFP_ATOMIC);
+	r = kmalloc_obj(*r);
+	e = kmalloc_obj(*e);
 	if (r == NULL || e == NULL)
 		goto failed;
 
@@ -789,7 +789,7 @@ static void handle_request(struct fw_card *card, struct fw_request *request,
 	r->length  = length;
 
 	r->resource.release = release_request;
-	ret = add_client_resource(handler->client, &r->resource, GFP_ATOMIC);
+	ret = add_client_resource(handler->client, &r->resource, GFP_KERNEL);
 	if (ret < 0)
 		goto failed;
 
-- 
2.53.0

