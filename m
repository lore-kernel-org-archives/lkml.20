Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BAD4DA9CC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791969644; cv=none; b=G31BMtmaQX1gMhsYfcF7ZwXIQBGAdKWQtiWLXIu5t3nUPoze8N3PKgHPyznId0eTpQ4QEfp9OG+BtZLSOEzovwlDHa2Gt3FHgxK5G49+QTBYv/WV9AP9B5rnGKunr3UaeZC/IBukLXpNtMANjyxCM0ZXrdJYgFezPf7uKWNNajw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791969644; c=relaxed/simple;
	bh=t9l4cf/ejDslJkLGB4fjTNcS7dre+IaaCm+V3SX9DNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Sg5yswhn/2fryg3fC1yUm/Laa79UotTBvZoC52RavMopT1orfFQs59J5HlbpR5+QlNPEx9qSx/TW50kvesQm1qF014fOsa1eUQhWtAAuCvADSJQlSSc4KfNEDLVXC6AC/QsEsQrF5vqAiujrpNDfi4tHa990GViTAmb67NOINXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=FGpaBhX3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="FGpaBhX3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a020e65269so25089925e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791969639; x=1792574439; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DbipYcdBzgikA0RA56wnTn7ugEMIxXdTA2zCuwUQ6uU=;
        b=FGpaBhX3QlXA8peWmQG5CavJ4WGoqMukjpJBRR+9oSvET/AgiZTqB20Ptg9vtNGDJt
         UoWm69CladyDKPJ22Hlhp0+fmNEmY/eBgb/AohufCRojjAp9TJVCyyq9KrQwDB6jKQ9z
         M26i7iCQCDtgvk92Tvz37zz9IELqnEThd0A555k2sk0lwrjhrdupzq4zsmpseoRG/IJ/
         4f4oRfnHh7l8X/OttNTu50cpjwzk7zVnaBlVwWv2YwKbeRwkCGdZR31TvMT0lAPafXJD
         p0eDPsQrsgdGB2xCJFxbm3+AmZ+E26VOcZj9YNyosD/aUQPVr3wbin05wnZKkROm7qpL
         D1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969639; x=1792574439;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DbipYcdBzgikA0RA56wnTn7ugEMIxXdTA2zCuwUQ6uU=;
        b=B5hGshtCXG+qJkOUcjU5wiBK8DqJ4z+8Q5E9lAYOIMLON/ssE1BZRZNyhzvqkZz7r5
         lXm5odVD+TRTyd6+X3IZOWfzz3r6s3i/P3g4OFK1rcmz0x/kxlVEe5Lc9Npes/u1xH2i
         LElCnvHjdqXuskM/BN4WoMJUc8XUcIC/wLJiJ3WKPevPZbp4S+0z3YBFeO+zdm8URFKT
         nXQv0t8mWB5mVPHGGjj7CSpCLlhAs+MLfgi+BzshoWwCZcDohAGR/tXnhQbcBB8l1vXN
         BmEWhSL+1WQ3tUwU5SzG+hybVLUTYkPFlKfq1Gvilg5HiDFDstN8eVlG7ukTwb9WyowI
         lM8Q==
X-Forwarded-Encrypted: i=1; AKwUvByYbqCLmWNjtTxHbRVO+4EXON1W9Ho52i1May+o8092hN0/GkfW+R1H08n53t6nE12nbFnYtanBGGMwZMU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLETSr7gMHqbnBNQ6myUvGOLGqrG5kIBwExlkyiC8E3oan8csY
	jEz8mJoZ2sRac1oyfzwsZmX4RARW2F3Css04gJSZQKQaZS5p1FQn/SF5Ad0YgD3uOy8=
X-Gm-Gg: AYBFou0A77j0H8fXFgbbZ3mJ9DSBGESuxkWI2SeKzcQIlURTPhQJu2h66bB5aUjgPuG
	hBXTYH3td2FO+euhvYq9YAi230QN3cA5TXoqX8pRS6S3dU5ow2dVU4h79hnHS4kludCOLIf8uZo
	VYOBsX2I3sdgVg3tEWaesjrk/v8rn4q60Bcg3DfqtRA07JTSOKqjRk8RzdEjnEyVDjeW9xiWhUF
	fbFDfx949AUpsufhCXEZCnOcuQy6eQj/vDWsFRYUSwIKiwcr8vKhIwM53WGalweoUA8B08tw16O
	vby2GetK/4oV2oYfb6c1zbO8/DMWzCYQOOWnwCmmy47iNTy84Bs9YN8yaoPszCJoVRWH+11QBuZ
	6aZgggBietUgncbrTLsKBIs1bucovTUmGgnr2wAQ/VrEoQqNkRa9K1jziPAJpmS/ieAS7x3alqE
	3QbCwKLjhk6IWoPknTbMssDOhHpRHBTlMpzJXeN7G2GqOJCfgOs8xmAWh1DBzw8/WZAqN51frT6
	UG+QrDmU6M5ZuxAgd17XEiaZ49sfmHSafTPNchuNpUC3PXrfQ==
X-Received: by 2002:a05:600c:c0c6:b0:4a1:96cd:2f6b with SMTP id 5b1f17b1804b1-4a196cd31fbmr189516745e9.2.1791969639499;
        Wed, 14 Oct 2026 02:20:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0ab4e8csm9983503f8f.23.2026.10.14.02.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:20:39 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 10:19:54 +0100
Subject: [PATCH] media: pwm-ir-tx: Correct timer calculation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-rc-pwm-ir-tx-v1-1-1ae862427fd2@raspberrypi.com>
X-B4-Tracking: v=1; b=H4sIADlJz2oC/x3MPQqAMAxA4atIZgO24u9VxKHUqBlaSyoqSO9uc
 fyG916IJEwRxuIFoYsjHz5DlQXY3fiNkJds0JVuVaVqdLSwQbEYbocseD44dMpqQ71dmxpyGIR
 Wfv7pNKf0AUIQuPpkAAAA
To: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Thomas Gleixner <tglx@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

Commit 44d7fb8acdf8 ("media: pwm-ir-tx: Avoid direct access to
hrtimer clockbase") converted a loop conditional from
               now = timer->base->get_time();
       } while (hrtimer_get_expires_tv64(timer) < now);
to
       while (hrtimer_expires_remaining(timer) > 0);

hrtimer_expires_remaining returns (expires - now), so the
change has inverted the condition.

Convert back to follow the original pattern, but using the
proper API call.

Fixes: 44d7fb8acdf8 ("media: pwm-ir-tx: Avoid direct access to hrtimer clockbase")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Reported via https://github.com/raspberrypi/linux/issues/7678
---
 drivers/media/rc/pwm-ir-tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/pwm-ir-tx.c b/drivers/media/rc/pwm-ir-tx.c
index 047472dc9244..bffdda489950 100644
--- a/drivers/media/rc/pwm-ir-tx.c
+++ b/drivers/media/rc/pwm-ir-tx.c
@@ -138,7 +138,7 @@ static enum hrtimer_restart pwm_ir_timer(struct hrtimer *timer)
 		hrtimer_add_expires_ns(timer, ns);
 
 		pwm_ir->txbuf_index++;
-	} while (hrtimer_expires_remaining(timer) > 0);
+	} while (hrtimer_get_expires(timer) < hrtimer_cb_get_time(timer));
 
 	return HRTIMER_RESTART;
 }

---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20261013-media-rc-pwm-ir-tx-971c2ae8cf53

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

