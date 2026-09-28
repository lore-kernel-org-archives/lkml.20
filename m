Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC6740A954
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790581670; cv=none; b=KgOVMEchR9s3Tv2Kv3n9aml//gT6SKgRTXDPkJJjaS/K+q4Zch5GX1YJyS9SWN6Y0EGQclGtl1IVEmR8XY5yvkgd6vW7IX4XW5qgsa+xrnFffKpsmNRs4/Gm+k+fiCOaR6zEgyp87fdc3paiDmbX8tWmG87ZZzr+gRHYIAeRTIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790581670; c=relaxed/simple;
	bh=fiMLttTfalhCTAYlHNGOdhisfxhBpO88GtQc6y2H3dE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uhH32AXV9YFSB4mw0uzB3TNaLnnTBXcnrJenA2lkh0AWjAov77NWO+dc0W5u7iHj4EqTXmVriWK+ZnpBYAfEBQEOpSMgElmoVyWXRlzt8IBD4NVeJu4v2FWWYXiPi+WoP0rfVWrFFypd/B+aLb6fT+MstRLNvPeIRY1DvaQGMcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyuUziL5; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyuUziL5"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso19195635e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790581667; x=1791186467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAmEOBD3v0bnVlYcFrfguXtEbxOwMvuvxDB7riQNPhw=;
        b=UyuUziL53Jh/NI9XmkFhvmTFCgjoO+za1rYZaWX2Cdvs3jGYeb0OuWUgjcWT67UurX
         //4solEEw9Dx0wC0r/NkVD+mbfS/LOXu2ATiwdvH0wy7bLgRpoQu0/9CYjkrJ5/xa1XD
         1JDCIRpPj5N/scpn884kLEnJWyA5Cbgxi3MQoi03K8k0Q5smPURG+NUjTGkSw2bwXn4q
         +xUFnO+PWdyi9PO5n2L23vchOfS862XF2H+WAjyJHJD+DPaWa39QmpGei0ARfsjP1Nb+
         yHaM6U2782UhxQWZ+vxkNjEvkr6iAzjjkCVhIBDSvUrzu36OO//VQr04USajcyMnLC8z
         Puxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790581667; x=1791186467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wAmEOBD3v0bnVlYcFrfguXtEbxOwMvuvxDB7riQNPhw=;
        b=O/6Jdivt7TQejUT0n9btes6n5MyIuTFsmeaURGXDubs3Cej/Kdq05pRbaIGTWkN9qc
         rQFlp2YeH99jgcNuGG4dQEnQd0l06xqt/GUY9UStUsEI+lyiIQ9ENu0XKJ24tA0e2Nxt
         SBICx0KKJDwNOorfcV/WnM80nrhTqUHno3JjD7uH8q24gfzgi8tGpce4WpriHgWXUuxo
         hGPtXDUxy/A8Hn5zFBJYLv6icwwzp1tTY6/YzcLmU2ze0iJ+00LKY6tEeArJBmEz+x6D
         M/IwtXmyM5Ed0c3msm1kegNa2bhJBrnldL+Tt3QXXUNUgaBlzr1q/7antQ34zjfZZdGP
         MX4g==
X-Forwarded-Encrypted: i=1; AKwUvBz3OX4dIrDiH+HtT/HZUs3EyYXwEBz+rgFMV0KLgcQb+8WqIYeWyDulyVBzmSw6IKmJ/Nr8yHQ2x5dWVUc=@vger.kernel.org
X-Gm-Message-State: AFuF++mfOoRLG9hNEJnZdnj2AKkUHs/ilfvYl2RhunV8OeH4VbBsP1y4
	A0JVwGZwcGvxD6cSSxvUBIGubq7U+JwdH/YFkMrU9esDtlxWTTLBG121
X-Gm-Gg: AYBFou0UJUh7SeF6qzIS+xrSHpG+2LgbeqA9mW6t9BJWOgY3wBgFz4oRlfY2mq/XlHp
	oeIzE/QvTwQkVBQBcuIgnFumVpbNLeCxu1HPr9M7Nr16FsEjjjXYoks+KcEmWnwqO/gABnPSl5r
	itbxyB7KvSVZPylrn6utYLjH4GMJ81Q2nFuNB4quFSk7HByIJ13MC7DUpJU0Shr3MIh0qQsmgC/
	USuot+GLihz6t7+UASpKSwA8W7rvyC7CJAvNrZCEQkSV+EKO4A8zrIbJA2luocLlIRU/FWeYaKr
	YCYW2G5j+a6KqETdQMn/q5ALTAWzkez65fDdE3bqYtmh7bLsW/Deu2exV0VGstQ3qPVznJl1mMd
	JYkJ6NbcX49kFsddbk2xV4OI0P4xYEDAOK9qnLD/Zpt/nQY9geTzg8IwRctFTCD2NCLlrDYtzs7
	QiaDu4Eh3pJ1fCO3cx4BZgfJWdp1H2PekWuRFpv/6F6b/sSqrmvxiLyeuS6z6b4BifQ5NkHmBt3
	SfaykpjcbI7tsGmrVPKzbNafMy4KfpIYAh0V9xGZoznAXg1eIZ/yj2ANg==
X-Received: by 2002:a05:600c:8b71:b0:4a0:328:43df with SMTP id 5b1f17b1804b1-4a0032847fcmr36162805e9.21.1790581666994;
        Mon, 28 Sep 2026 00:47:46 -0700 (PDT)
Received: from localhost.localdomain (host-081.salzburg-online.at. [213.153.56.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64ef3asm25817668f8f.30.2026.09.28.00.47.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 00:47:46 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: s.nawrocki@samsung.com,
	alim.akhtar@samsung.com
Cc: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus.Elfring@web.de,
	stable@vger.kernel.org
Subject: [PATCH v2] media: exynos4-is: Fix a race between s_stream(0) and the interrupt handler
Date: Mon, 28 Sep 2026 09:47:44 +0200
Message-ID: <20260928074744.23378-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260923083729.64831-1-ginger.jzllee@gmail.com>
References: <20260923083729.64831-1-ginger.jzllee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fimc_lite_subdev_s_stream(on = 0) sets ST_FLITE_OFF outside of the
fimc->slock protected region, and only then stops the capture in the
hardware.  flite_irq_handler() runs under fimc->slock and clears
ST_FLITE_OFF, so an interrupt can be handled in between: the handler finds
ST_FLITE_OFF already set, clears it and wakes up fimc->irq_queue before the
capture has actually been stopped.  The wait_event_timeout() right after it
then returns immediately and the driver continues as if the capture had
stopped.

Set ST_FLITE_OFF in the same critical section that stops the capture, as
fimc_lite_stop_capture() already does.

Fixes: 6319d6a002be ("[media] fimc-lite: Add ISP FIFO output support")
Cc: stable@vger.kernel.org
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
v2:
 - Fixes: expanded to 12 hex digits, as the media CI asks (the commit it
   points at is unchanged)
 - Cc: stable@vger.kernel.org added; the bug goes back to a commit that is in
   stable releases
 - commit message rewrapped to 75 columns
---
 drivers/media/platform/samsung/exynos4-is/fimc-lite.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite.c
@@ -1209,9 +1209,8 @@ static int fimc_lite_subdev_s_stream(struct v4l2_subde
 			spin_unlock_irqrestore(&fimc->slock, flags);
 		}
 	} else {
-		set_bit(ST_FLITE_OFF, &fimc->state);
-
 		spin_lock_irqsave(&fimc->slock, flags);
+		set_bit(ST_FLITE_OFF, &fimc->state);
 		flite_hw_capture_stop(fimc);
 		spin_unlock_irqrestore(&fimc->slock, flags);
 
-- 
2.43.0

