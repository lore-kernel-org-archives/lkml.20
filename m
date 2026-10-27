Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793132987;
	b=hljyMo6Y1tGv++cYEc0GwHmQp4N0RHpwLTHL3TAaeDVtAs3K04ATfTMQJ3BQGohNtgbE
	 S45/jm6m9hxa6N49r4e5wLH29VKo3BcD2X6oSokEzku9ZpyGFKKjuRAffKRsCeD+36vxO
	 g/sdObtm7RvT91k916iX2tTY88XAPpljZ3Qdam8IBDsxGKNEuPSUzlaE4XMMXAT7xQbYl
	 I9rykNoMHMMN2hjME5/hLcIORGFCDj0YeSXStIfmu6ML1rQffCdMX7foSoyK/M4jvB4QN
	 fWz/LQQQ5KNzJNGvp+KU8DdXNqZIMYdx/rcEPdlKVBmEldKQ//1qSnKD7GeuaXgSQjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793132987;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hikT6HiFEb7otKpDa6+mXcWacBARRsW7oX81J7dlVJE=;
	b=OFOIjznHSmlR6BIj4M5+0L/hLj0OJbsw6sWdQTXcgAVmy3kUtDpIP2iqMx8YufCSXuPd
	 rZRBChiLWuNNYr1dQ3InxMYUjqx+sBss+f9gM9UOKTDH8TjS7LCEDF4qQ6Zey4aa3vKaN
	 vda2vHMrWABAQ8lSIw80mleHoHSavYv9J/Dzk0yE9nEzL4ESielZMQ480BVUm0YTS+Ege
	 1dkWO3IdQKYBZr5MiniTQMhYIL/rY54h49ii3BsebetcLbOjihmb9GYh9mr/d3voMBY1j
	 /lrt9eODnki/K3hr72n6VjByaKn6osMWKK5qH+RZZrEded6Szd/B6/tVi+EBoSp+0rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ib3hhQTH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A372606A337;
	Tue, 27 Oct 2026 20:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ib3hhQTH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793132987;
	b=SdNrlTOI9XgiZrVQmy2aNlXLPRDDdPFwhcnv5e/Ou87YAXzGY/WLiAeweZmM2UY15skS
	 gTrGRuIs39R41CWjTg00aGEW0xlgkU490WqMKgM+ugDSObwi+Sq9FPXA9dIJNGBg4MBuU
	 u+wGQNiRZ42BEoXBZTIR35/49sN5jJ6AOWjcOkpUbcGHqswvpRqGVtrHMFnqNGeHEhGvX
	 9FV++rklnfwTaZIGmzejInRguQnwNrp6dIT1Iad3FpQvO1Vt8p0WrWaX0aJVOM4aQc1FM
	 3VxXaP/xF6V30flCzD7F+EvhNzoPtTCGVz3Fx/R+tuiMiVlTdjgOK7vmJHDpO67SEdw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793132987;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hikT6HiFEb7otKpDa6+mXcWacBARRsW7oX81J7dlVJE=;
	b=zGcKfI9AnQLUxwwCuuv8XAX+hNpg0PETSOLwk2/J6OOP7CnU4r0cOFgoRQGXA5tG4WwC
	 YVZS0Ul0UjrCFRNorSy2AvK+rZn5t85siBk7GUHhlg7+1sQSXIBbtKRtEUSD/JYv8GcO4
	 oEj3u7/cFF4sIPd9nJbQ8d8J/EZMjW2rWIXPAK8/O52WFpegjUP9Vgw4s/8nC9Cq9Z0Dc
	 xI92oMkd0kbPssSDte3jjFoZronTGni83LMuDp0wLRO/UHK3TBDY6gwLpxZV+SIpCpnst
	 4/KzUrm95H3vXBdEPYJN7JSjakhuvo/MInuUcg3Z2Hj4taqXwWpfU+SNaGMGeicboDQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A726B1F01829;
	Tue, 27 Oct 2026 20:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793132987;
	bh=hikT6HiFEb7otKpDa6+mXcWacBARRsW7oX81J7dlVJE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ib3hhQTHFLK94HiqF+B7eUmSw5bk+A4U4HtTpWPVR3g20mFBaNan0j2xraZ6oSpg0
	 KDeLXjtfoy6DSa3m5BuC/fX24YQ2p4Dg8ilM9zuD4ANRjeWc0RBfqau33OzsgyRylk
	 Mh0t6YUQ63cZVJzyJLQLuQQ8VkztVzlnET3epdJeo7w9cXA08U99UEX8/ITTyisoSi
	 Xj2D97vpmRqlanhfQzajUjmTl5PwLgFmUa1otgHfr4ZWWouxEI8B8qXXpI9TzBdoqe
	 iclo0mUk7ZYdROM+DFwgfCAnAtfSuxYsxyIoyYRQZx9zQncC+dEuPx3erMy/1btHIG
	 k9WRkttmLGWWw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2F4E245221;
	Tue, 27 Oct 2026 20:29:46 +0000 (UTC)
From: Marco Ziliani via B4 Relay <devnull+rylos78.gmail.com@kernel.org>
Date: Tue, 27 Oct 2026 21:29:47 +0100
Subject: [PATCH 3/3] media: i2c: ov5693: Use autosuspend when stopping the
 stream
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-ov5693-fixes-v1-3-3c8ab1ae104d@gmail.com>
References: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
In-Reply-To: <20261027-ov5693-fixes-v1-0-3c8ab1ae104d@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, 
 Simon Kruse <simon0x+git@proton.me>, "D. Manresa" <dmanresa@gmail.com>, 
 linux-kernel@vger.kernel.org, Marco Ziliani <rylos78@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793132984; l=1849;
 i=rylos78@gmail.com; s=20261027; h=from:subject:message-id;
 bh=MYKsyD0NZ6WLk/QqygH2Wd+qTYlOlgxa6tvnmewfJPU=;
 b=7Cmu3nt7sesvcZYUUEEW/4sywPGxNI7gz09CEeAH9dQ4m2URhNbJ4SWum/4UnFknzoSrqbWPx
 ZyOOX6OqivRAokHVOT1Q9uRg868k27pQ4ejnzURCRu2biGGLVAw3VBH
X-Developer-Key: i=rylos78@gmail.com; a=ed25519;
 pk=nXCfiK5yExPZCMp+lfKif3gdXkfjkUK2qk7bDW+ixMo=
X-Endpoint-Received: by B4 Relay for rylos78@gmail.com/20261027 with
 auth_id=1333
X-Original-From: Marco Ziliani <rylos78@gmail.com>
Reply-To: rylos78@gmail.com
Content-Transfer-Encoding: 7bit

From: Marco Ziliani <rylos78@gmail.com>

The driver enables runtime PM autosuspend with a 1 second delay at
probe, but drops the usage count at stream stop with pm_runtime_put(),
which doesn't update the device's last busy time. The autosuspend
delay is then counted from the runtime resume at stream start rather
than from stream stop, so after any stream longer than the delay the
sensor is powered off right away.

Use pm_runtime_put_autosuspend(), which marks the device busy, so that
the delay counts from stream stop as intended, and a following stream
started within it doesn't power the sensor up from scratch again. With
the mode now programmed on every stream start, keeping the sensor
powered between streams no longer leaves it in a stale mode.

On a Surface Pro 9 (IPU6) with autosuspend_delay_ms set to 3000, the
sensor suspended 1-2 ms after a 5 s stream stopped; with this change,
3.7 s after it, i.e. the delay plus the autosuspend timer slack. On a
Surface Pro 5 (IPU3) with the default 1 s delay, the sensor suspended
as soon as a 2 s stream stopped; with this change, 1.1 s after it.

Fixes: 89aef879cb53 ("media: i2c: Add support for ov5693 sensor")
Reported-by: D. Manresa <dmanresa@gmail.com>
Closes: https://github.com/linux-surface/kernel/pull/181#issuecomment-6436016335
Signed-off-by: Marco Ziliani <rylos78@gmail.com>
---
 drivers/media/i2c/ov5693.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index ca0968498..ef5e7285c 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1070,7 +1070,7 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
 		goto err_power_down;
 
 	if (!enable)
-		pm_runtime_put(ov5693->dev);
+		pm_runtime_put_autosuspend(ov5693->dev);
 
 	return 0;
 err_power_down:

-- 
2.56.0


