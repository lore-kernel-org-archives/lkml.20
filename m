Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CC84AD4AE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361639; cv=pass; b=LTAW6EBUXqa7DSN6I/S2XfwXnHZ1vEAXA7zAHPfOGkUrTSMAuo6T4WTCztRUDb3LFgEnMujcE1RUwBIy7xFi0+yB9LwTzXTre4MZzh7AwI0JAHS5XbCkNI4AS8pM0LqCwJsNZ2Cs+eadE8dsmP5sTWMfkBWEeRAq0a4njFpD2vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361639; c=relaxed/simple;
	bh=FiNejKGRyiUCwe8R1xxJKX2+wQwmNmn+OzfcvY/4MWg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ULNE+Kb1znYRsiV14CjJfPOtaD2j8Iz32Dkr2kCXxAwcgrzONVC/cAHdOi7zSl3bLalRZDxKpSVpTbFh97tZ00ysxLH74MdCEkeCWLNCH0OfXdWQfJOfEkNTRC6ewY+mfsG5y5QqkFRDMTri4wdneTIo4pKVpjyjPSqanXOO99I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CufmY5sY; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CufmY5sY"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe5so193555366b.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361635; cv=none;
        d=google.com; s=arc-20260327;
        b=qQvNhjKFA2Czb5XC030UjJ7qqLH9IAKdvqHfAbYfvbHDQvfUtyoHVWb7ghgAzSs+W2
         1TqCvPApW8VFUeGwBrrN+H3siGKHFKk6CaUMpqrqkMqbLjhIDiPen1vX7r3LCVsicBvI
         V49nGgwfkQLam3DMKVU/f8Tc7z5LjcGi+2QZgpqQXlg9pvNN5yXFc8ydMSjXTkKnPfrm
         qWQpgZR4zxbVxpLFeAes5aJNxTW+AwdBqkEQaQVpPYbGngoUf3gCW9Gmu3Jo7aulPHzP
         XGLPbqEDHVu1AIAjUnY1CEq4bwW7XaAUyUgxUqEqq9Ke31iaauMLAE2YoIMZZ6DEgXNc
         n6TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NhrI3eqIB0Kaock84/1UscB/KDuXvfgtiOh5Tg0ePhk=;
        fh=OCxuGeD0POL1x9ogQqVICuZxUAz1WsKc+ZQdkg/LPoc=;
        b=b1DSBH0kNSh8Eubm5iMtmNAjpiLTgtNcl3MwTk/SGE+mfM/amexQWxwWG03p3vf72D
         qRFS0A2iVUNV7ZOfFefNVs4I1kRwB5dxscv48Z7Mr+Fh2+KK4ZX5Fp7xnCx+gi6ulZVR
         T+L+GDEuOBKgYiBzzGSN0uwlVqhS/VyzqVA8qa1xOF/1xCUmaEfiNYMowEcjjZTaiaYe
         cLF5vbl6cYb9dzzuxuCayCtC0k6JXCXpBSxlWI99hWATRyjU4mlaYFqV8W4LnudsZlQP
         CEKXecYnVxNcUvHmqbEvW/FuV6Ywi+/5Kyie7u6n1Tbm/p0sKaA06TVHYg9IQjASY5Og
         5TzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361635; x=1790966435; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NhrI3eqIB0Kaock84/1UscB/KDuXvfgtiOh5Tg0ePhk=;
        b=CufmY5sYnj+7bUq02ubUVBiyAQQNpytHXusGXiCFXpbMngNdieVfRvs7hVU7UlAgPR
         dj1XMq7g3UCkXrkw0LHb3SnhRTrC/IiqYobSeSdNVZa/UHRPgfjNN2ToElGdTEqRky+r
         xxatY2Y1ZIMi7xEHsQcgjCJdRoKdfAyp4NOoD5F3ypgRNzroI5Lqwo2w8sfXU8hoGUOU
         y3NuDyEYZUIyNOZR1YizYfQjhGqIvRx1BLPiH7ddHaxxY5HT2GLR6MC2F8aFqaYBSaQd
         2ZKYQb2FUV7I/VeUucetQzxA3sJOlfZAx0lLcg/7Ux02YS7g4LLhFwjkEA/OSZDtV9EA
         3HNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361635; x=1790966435;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NhrI3eqIB0Kaock84/1UscB/KDuXvfgtiOh5Tg0ePhk=;
        b=rTY0xznjbkuJEtPdNWBRz5KXh0e6tF8yBer8D5tAZYW6mtDkj1uyCsHQOJ1LSSgo0k
         bSpjAORaAI/TYvbW/YVWq4+sf4eDzUt8EV9DG7q6OQCwQjBDtIefQ4hIaplA4L/D+ZlH
         WIq59H2Mu1/oDvbZfVWUZFkFdYVYDzz+r6WRR3wFJnNokhmrdfd9ON3Y+g/ugv5a2JAT
         plAAStN+YcvndNYbFhe8F+rygzHb+JbwGW0HfLaOl37gwwI736+SulRQzM2dxT9GN/h0
         ZUxTHSjnJZlMvZzjsBsw66BjWT6EYQ5qZ9UvyXwwLrUkLi7i1x3q4qSU1a+uvZ9jMN63
         49Aw==
X-Forwarded-Encrypted: i=1; AKwUvByFP+8ZCz77WtNj7ZNu8c4ixCFYJ2YZfQ4RlJKrf7nIL5Amo9hFCEFhbAAhSCRYUHZ/ad+ZL27VgVgH8M4=@vger.kernel.org
X-Gm-Message-State: AFuF++l/6Oa8aO38+ec4IpHi/JGeVKf+MZqOrHuO8ZcZ+ov8uiLjxtEo
	ZKpjj9ZXuu3mSGed8bn84BKfCJGkKSQX6dBIf4NEIckLtsN+Sp3klgxiSPAxB/m8mWJrrGliPqa
	rmSrUvdxG0GMc9bsEhWhCRJmg/7+I2A==
X-Gm-Gg: AYBFou2flM9VA6Yyy2sh43tCTYX0mYBDQEO0nwxipCV98CKJwIZ8Ew2mU5GSlQpc4JL
	s1J8GKUWQsvoDMtxs1FyKsCVTmjElSH2ig6U4lMtfI4KBkm8UJcQ/cFUYyLmdM1m5X1NDtRVq2g
	xIWi425Kynnbi6Dm5xpfMJgSIUGVxo+wiGqu6eBLV3NgNO9yeFP+qEgGy03F3AdwFvVMNCI6rn8
	wc7E2A0WlyrmvcC9Z2fABZellbXxpsARknonD9SGEIn3YnUCaxIy2doIz8eHOCT9n6qkz38q3hB
	C+6FX1oyWkkWIuY1VDjbcLzu7ObQIXuymcE8ewcReeO/LO/Tkt/ihQA4ZNS08hSpmx09KcY3Apr
	lcnZuPfKEJ4ABNwlYEOPj5b7xW0sv2hiDfYtHoyzuiiszqgFgXoXG7UuGX3ly4TMh
X-Received: by 2002:a17:907:c49a:b0:c25:68c2:7b94 with SMTP id
 a640c23a62f3a-c2ac2374dfamr590694466b.8.1790361635379; Fri, 25 Sep 2026
 11:40:35 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 11:40:33 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 13:40:08 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Fri, 25 Sep 2026 11:40:33 -0700
X-Gm-Features: AclHuK-JxneS-0asoCU3ZT5yM4k7_2whDc5-gQBYj97HQ2HfJZC4wvnWIgixeeE
Message-ID: <CAGEsz8E4t-Gk9AEN6UTSZT4ncCSKCLsXtEEBYTLpVw-d=BdDOg@mail.gmail.com>
Subject: [PATCH v2] media: ti: cal: drain WDMA IRQ before freeing contexts
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

cal_remove() unregisters the video devices but does not release their vb2
queues. An active stream can therefore keep WDMA IRQs enabled while the
contexts are freed. The managed IRQ is released only after .remove()
returns, so a handler already in flight can access a freed context through
cal->ctx[i].

Use vb2_video_unregister_device() to release each queue and stop any active
stream while the IRQ is still available for DMA stop completion. Then
release the managed IRQ explicitly before destroying the contexts, which
synchronizes any in-flight handler before the context memory is freed.
Drain the IRQ on the probe error path before destroying partially created
contexts too.

Fixes: 343e89a792a5 ("[media] media: ti-vpe: Add CAL v4l2 camera
capture driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Resend the unchanged diff without mail client line wrapping.

 drivers/media/platform/ti/cal/cal-video.c |  2 +-
 drivers/media/platform/ti/cal/cal.c       | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti/cal/cal-video.c
b/drivers/media/platform/ti/cal/cal-video.c
index d40e24ab1127..0310dba0c810 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -1036,7 +1036,7 @@ void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
 	ctx_dbg(1, ctx, "unregistering %s\n",
 		video_device_node_name(&ctx->vdev));

-	video_unregister_device(&ctx->vdev);
+	vb2_video_unregister_device(&ctx->vdev);
 }

 int cal_ctx_v4l2_init(struct cal_ctx *ctx)
diff --git a/drivers/media/platform/ti/cal/cal.c
b/drivers/media/platform/ti/cal/cal.c
index b7e77b6b8950..d332a05facce 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -1151,7 +1151,6 @@ static int cal_probe(struct platform_device *pdev)
 	bool connected = false;
 	unsigned int i;
 	int ret;
-	int irq;

 	cal = devm_kzalloc(&pdev->dev, sizeof(*cal), GFP_KERNEL);
 	if (!cal)
@@ -1186,9 +1185,9 @@ static int cal_probe(struct platform_device *pdev)
 	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
 		cal->res->name, &cal->res->start, &cal->res->end);

-	irq = platform_get_irq(pdev, 0);
-	cal_dbg(1, cal, "got irq# %d\n", irq);
-	ret = devm_request_irq(&pdev->dev, irq, cal_irq, 0, CAL_MODULE_NAME,
+	cal->irq = platform_get_irq(pdev, 0);
+	cal_dbg(1, cal, "got irq# %d\n", cal->irq);
+	ret = devm_request_irq(&pdev->dev, cal->irq, cal_irq, 0, CAL_MODULE_NAME,
 			       cal);
 	if (ret)
 		return ret;
@@ -1268,6 +1267,8 @@ static int cal_probe(struct platform_device *pdev)
 	return 0;

 error_context:
+	devm_free_irq(&pdev->dev, cal->irq, cal);
+
 	for (i = 0; i < cal->num_contexts; i++)
 		cal_ctx_destroy(cal->ctx[i]);

@@ -1298,6 +1299,8 @@ static void cal_remove(struct platform_device *pdev)
 	for (i = 0; i < cal->data->num_csi2_phy; i++)
 		cal_camerarx_disable(cal->phy[i]);

+	devm_free_irq(&pdev->dev, cal->irq, cal);
+
 	for (i = 0; i < cal->num_contexts; i++)
 		cal_ctx_destroy(cal->ctx[i]);

-- 
2.53.0
