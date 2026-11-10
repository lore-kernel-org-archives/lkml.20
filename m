Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347751;
	b=oSRznK6vInBk0vDdGrGziq4XmwbdMxuIM68eua6gqQBz0xLzRAuP2o2gYxH1UULstG3d
	 zgosrkwGqna9+E+v3fuUjlQmO21Wdu+CUdZitK1oa/YF/nIFAPaw8SGE3ezIp8KRAKpEx
	 v4EikDeKWXP8NONEeK+yE7nUaEQRfvaC9HaxCcyvwxXqixI4FH6nqH7+PuvXqG37I5qrW
	 inFopL6fuC2/+fa1auApn1qNbkvRC+HDeOv0DDrGBggLx60RQMIjYVw3KGRQdc2QBFx92
	 dG0G74MBWNByMuxqulGqLRyvllFc/zv4YgFaKoDgS4CMHzbeHm8Z3yiPS12apUz/7Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=Deb+vUk9umqS3aVt48smxAj2eQ6juTzTMYV5l066V5E=;
	b=Rlx+tPObTScuaLznSKLQNSycYxxuy7+IbBgkEG4yKX5PJsAw/Zj2Hgp9aUo7cXsOyFQH
	 yk7MY4GVZLXyQGZMhYUBpGwaBfGpfImLdIjnBdyMsUrmqv6afU0D+WVM+hfLnJc7O/N7b
	 PtKg3qILpMNwFr0GtAWmNk1XhDAvVq5LpMImKXYPomVrlXjZCYHY5BNtKABTHVVBwWAkZ
	 cr/xTYl1Br+5apKNFC/+7iadCR1o6mXPkp3tas9lqtAaP33H+2u02Obo6ziblLQzkRbiW
	 H18tpERzbsxt8/H0blFz6AUguRj45KWtzYZs62nGmKJlGZTL+vx4J2y+5P31HNy8uKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Om1i6sM2;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA47606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FA47606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Om1i6sM2
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so22559185e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347750; x=1794952550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Deb+vUk9umqS3aVt48smxAj2eQ6juTzTMYV5l066V5E=;
        b=Om1i6sM2dm/7I61l/JVv89WQRgySTY5j4Gk+8soUbcjBtdnYUlcLP0Bp3Uu8lQbzH5
         CBu0Eb9CUtvxMp9QZBV+d98K3fyoz4Sx4ItS4L7FQ6fFzlCU/lfIKx4nfPT9Ak7wtuQF
         cL5Nh4X6Sv/RVZJy7vrK2gtw8RZLgkii2PdktarcHcTQ0BxNtRC0tFn9m9DHu4mGRcer
         ZCpTEuGFOp3Rq454sSQ/giHQKjzvl9ZCvmkn7Id4o7Wqk023wfPjJ21h7zQuW3/in6Nf
         jvYw/Yw8th8WN3IcMUqqu3KVif0c8OYODksgGRgP/bJaKW7OD4UmdzPhgD5NBSudmUg7
         ulUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347750; x=1794952550;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Deb+vUk9umqS3aVt48smxAj2eQ6juTzTMYV5l066V5E=;
        b=2qwjye/ngEEeKEXSZ1zrZK1NhNI7ujAA9j4bVdRiRgR4285HeqI+keTboMtT44vzRY
         Do6JnkdVBJyqVC/wOco3ToDOZiZA6xsGkgXWRl+E+PzYT6iUfyga/uM4qU37Lq1ijZs4
         3dr39lmIsdtl9Lo6B1dajGbIAcXOZf/8NoXY6e7yqroqfnc4iIUiuD5TGJGNakmDVfI0
         LMKiIO0WZCxDw89LtBY4fnPX1U99P3Kaw7LDbGxATsmesDe6878lBy6b7UfyR9GXnW88
         qKrgUP9DXKL6FAWaFX6ar99SZdePYfJWGsxFV9nbJNzGd//fZc/00MPMtCMhUU94/run
         xaTA==
X-Forwarded-Encrypted: i=1; AL+hErGbtHSAD7ilbProifyITvsHgB2dURc/UL1SgOFxIEHe1tJTcSFUNHg7hjuXX76TMQuNcKd8XjfNIaxGKHA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JN04eZWMAmlleUez4/YI59tAEKvK3TvP1HytAhNBXB/MT3XjK
	WDp99p7/LvYTJKzQXRe6utWHEBeAno46ItgEfMz+YhLcJ0l6zxYqRhs8yalgiyVcE6Q=
X-Gm-Gg: AYBFou0gAp7NTAPIhSvizI8u1qe9jyZBS0C3sEJh7iMdhRtJR6jwpSdTrc58/6TW03G
	DWfbLgPiX4e7yRAMc7TIBxFs3xIH7MWoXWCzO4zwy328LMOUviMSbdpZOcvkxJ2FVFJvtwyEKSL
	oNHvuTp81+SiGHHeB+hGka8oKiwvPLlu3pN5wkQyq0sNzSbO8hRirVwrSeG1AQEM9ARGUDssNYv
	REpSBCRHL8+bZZZYPGw9+kj7lrBd9T61i+2HrtHj+C686XoECUSCC54WE7iSpztauMPwqWK3JzB
	8UKxI4Yu0yNd0mrgBneExqt1At3M9fGHDFiJEmQjuKej9gfzhqm+GzC47/v3V7bRyGUt+394Nq4
	a3oJtUGeZcAcGoark0m8YU8uWjBGbw72cr2mkfn98047zx3JMgB0Ct8G8t9TQsfTmVqvOXeq1K2
	L2tZxJ0GnFiaauMFDk7I/d9Sr8F3pETu19TYdDep0JHaQV3TR8Bq5YX/eMi8YoTU0Ka+N/22/oH
	PZuoAP/1jhTtzOC/x+HGbq8edAfd8zDDr0KKz0Dtc4kLRWYdfMsjQE4ONLcMQfxDBtpKFlxr0zS
	M4wS9MK32dDSMqRaeMoU2FkY1e9yYOdI8Q==
X-Received: by 2002:a05:600c:3ca2:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4ba0935dbf1mr6324345e9.9.1794347749735;
        Tue, 10 Nov 2026 13:55:49 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01d9df5csm109091985e9.0.2026.11.10.13.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:55:48 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	mfd@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 02/20] mfd: bcm2835-pm: Drop unused header
Date: Tue, 10 Nov 2026 22:54:27 +0100
Message-ID:  <c3dbfde231fd08ec74b875026bd820987934f620.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=865; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=UdHoeNWC/wFvkdmLuQarAQl9dCSespRdlpxDjltm++I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq85KXl1OBAGE23elaJ3Rm+dDA0IlB3w1RSbdY+ 43FtWNovUqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSlwAKCRCPgPtYfRL+ Tk3gB/4rjRvfTFLDwOwuaM8jz3V2FahhT+hj3EGqSUhPRPVY8DhvhnoGuBfwkEu5Dp2fvKFBjUA PGsBBpPjWf+Y93zL2Gs7GA8yxo9a+Ljp8tjD2QeNaiTht7AgUSwWa5AXDavdKJhDxWEiQ9DZOUv WkaXrjSkHBs97VS35AH0wYV19gbLycmKAYp/Uo7ffHSnqJxn+E+Ef6yz5tzvjIxzsAPyaPWKqC4 2GdVeNIbY72nbJqmrPQfxz6hhF9R1es5kz+IXcGyePWxGD8NSVM8nPFcZuiG1Sr0vMvPzN7SDrb 3sTc4pcDkCPLLetAg1TmAlTJ63wSusk5hpGgKhwQsbiA2ivG
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

<linux/mfd/bcm2835-pm.h> doesn't use any symbols provided by
<linux/regmap.h>, and neither does any of its users (i.e.
drivers/mfd/bcm2835-pm.c, drivers/pmdomain/bcm/bcm2835-power.c,
drivers/watchdog/bcm2835_wdt.c).

So the header is unused and can be dropped.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/mfd/bcm2835-pm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/mfd/bcm2835-pm.h b/include/linux/mfd/bcm2835-pm.h
index f70a810c55f7..12bb6bc2c07f 100644
--- a/include/linux/mfd/bcm2835-pm.h
+++ b/include/linux/mfd/bcm2835-pm.h
@@ -3,8 +3,6 @@
 #ifndef BCM2835_MFD_PM_H
 #define BCM2835_MFD_PM_H
 
-#include <linux/regmap.h>
-
 struct bcm2835_pm {
 	struct device *dev;
 	void __iomem *base;
-- 
2.56.0.rc1

