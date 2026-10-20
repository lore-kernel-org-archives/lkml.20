Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483642;
	b=fUw4Uwb/KoabP38WdpD8KjotkDOirXRG1GND3IRjKupP3B49ZXwYa+Ypfm2E6WndT/u3
	 ab7VVXXpzkdvmvD/dUgnGYVNjOUwIq68RnbY6D0Hc+n7gLCZyuZnlWIOAZRwBDjXtdOhM
	 ATMP/772yZM+GLjF/03bmgMyFzcG8lXTSthc7CYhJCSMuFO0K9h/MbVxfnhwEv0kH82jc
	 KYmNuga15DMzN8kW/X4l0GNLcgbLZZryZM36WFlYuvt0TGARbbH52o8v51ff3GJPXMfWy
	 vLy//99Lqy1cWbmUC0HzKhYxJWOEXfwwgN+S/7yHOw8nEcEIWQLsMzGKyHuIcb+Sv0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7wI1NMCM00O0jYZhz10E6eemMehHVqt/3ZxelxBxGU0=;
	b=5QS/A29ZCt0kDu7niNrl5N+T87sn9yPx6IfuNVm6x8lZuNdBVZIu9Jwb/50DsMQQtwva
	 tSRlI9+RqEBTSCQxU5JymvA3A6q98hq2abcVOAz/+fRdF5CiGZo8hdxMcXey4VradfuGB
	 v9C4+pl7jFVidvZevihK0ZubhysAZTMzKVfsH2xA/U9YCbPQB86oMhG6OfgkDJ6gUnixy
	 J/gC5jFI0l0HXijRHxJzXxm8g+Ykv+0IirzRHT9PQBMM3Yh4CjUJ0XO/iErySPjBbPRmp
	 eD42HE5hB/vBmoGORREfrxFC2vb9NZY2L8M59RNF3fur74WgysNmBQlE+27SOPNn+mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EkrDqIcT;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982B0606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 982B0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EkrDqIcT
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a07025cce4so996407b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792483641; x=1793088441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7wI1NMCM00O0jYZhz10E6eemMehHVqt/3ZxelxBxGU0=;
        b=EkrDqIcTTrDWqkWArZVKTdcjvMPQRuQ1kE4WlnZtXI4djvIS0uONAfCGMepApz3TG+
         qt4bbfnDW+VwQouFpG2UMGvysvc8X1Y9E4xqp794vHR//3y51PGTUTTdSF53aBkbEuAO
         lRGfbWrdZ+47cMWammMoDjhEhvNfGaXv5kqtMSxcZ7dzLuQy6D0DoRRaQ9kvygPasdLm
         VchFNGEngOWoX+NNEhD7f4tNyWV1rpXK2TMJ4i7FlneGwEOy2wWEzC7OA9XJw2W5c1Sq
         bAqilhsd88CbOYgDsa9+qnFvLO163sZFpcBeJJfNHNgIRAOeG9mED3rqLug8I/VchgZF
         IAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483641; x=1793088441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7wI1NMCM00O0jYZhz10E6eemMehHVqt/3ZxelxBxGU0=;
        b=ABC9t3ROomZrC9nnLCsSCOxXFqwhIAvonmnrttbbHQiHar5GY2twPJva0EZ8wpME3P
         sNa6BoI/Jv+MJ8oNl5VfHZBitbYYWXP0+3Xu+9xs2KlPuuPHl4kne8LYwrKebswOu/Ce
         q4pKT/gXO21tls2Un3I9ZCgZNQw6jqtZLEWp1mfun1tuwL8+lm96PPnzuQ82EcQRbHVJ
         Ae4qbjit0owPXl3R2yOXO2dCD6ZHWDD2H2CMzeb1qIR3gc7SNfHhpYqcXcET/DkRk5Jv
         fQbit+7EdbwTYJKYHmT76cIkmMcMGXJizan3JEFjAb2xBprl9+YwNHbB61pUWWrRjOHn
         X1yA==
X-Forwarded-Encrypted: i=1; AKwUvBwhEUYY5Z5moaUZxXa5tqozwGHuT56R94y+29VOWhuThl0iQughWuOipCipF+nWokigw5OB3DAMnXm76Zg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIGbWacYvc5vWl2BD9QabrstieBeSodHgfYwnPtcqa0qR7y/M7
	Sxlx10q+vY9+JKTyC9UTZImyh31PV0uyQuBnVphgDaLutayhl5eazd3v
X-Gm-Gg: AYBFou3mTh/4okmjEzxsv/w2gbdZewn9lmFnKTQ/7x9+phu8tKECIMKsL2WXb+DfiNv
	+zWRvQ65MyaXwmJL7F9h4XZtG8N6WcBb5CzRP7Rc2A5xTy1KzaZMqlQWbpr+HfPBU2TkeAWbghY
	wiluDY/877SOasz3Moo7OG1HIv2/IRg3j0S8Z+Fqjk91SOa7oCS9KtdfrjMIPUBewQumThX8DC8
	17wl1TSN0rDdPKO/62Fn6E9oWTGmgt3v0GyXn0rfHBNXqbES9up15D5z7GLHQTnHfAUsH9E33k9
	mKLKn4/LrxEIXGwVs+0y7v5nMAdEyjPqCBVPPZiaA3SdegqIREpiEW8PJD36pB0fyeVxfE5reNZ
	sLB5l/KpEXj0f/W4r2yAAEklo434efN3miSWvIBIBMete3XNwOAdPasg+YZ17It7S7FxR/DItck
	90N/jVlCpah4byM+OFFH429seNS3S5SUCiayf/tgHYj1Tm77LYN21BgJZ3NmHh+9WqtLPHk0Ak7
	KBWsazJtp5iTj2XJkQ7jH7IpgJ9Jwjnx8irfRAoNMw=
X-Received: by 2002:aa7:8893:0:b0:881:b7d0:8dd5 with SMTP id d2e1a72fcca58-8a04be37f13mr8631677b3a.32.1792483640888;
        Tue, 20 Oct 2026 01:07:20 -0700 (PDT)
Received: from rigel.home.arpa (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58017244sm4571984b3a.47.2026.10.20.01.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:07:20 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: brgl@kernel.org,
	linusw@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] gpio: cdev: remove redundant direction check in linehandle set values
Date: Tue, 20 Oct 2026 16:06:46 +0800
Message-ID: <20261020080646.45985-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 92ac7de3175e ("gpiolib: don't allow setting values on input
lines"), direction checking is performed by gpiolib core code.
As part of that patch, the now redundant check was removed from uAPI v2
linereq_set_values(), but the corresponding check in uAPI v1 linehandle
set values was left. Remove it.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 6dc01f7ea838..bc1b45f50892 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -234,13 +234,6 @@ static long linehandle_ioctl(struct file *file, unsigned int cmd,
 
 		return 0;
 	case GPIOHANDLE_SET_LINE_VALUES_IOCTL:
-		/*
-		 * All line descriptors were created at once with the same
-		 * flags so just check if the first one is really output.
-		 */
-		if (!test_bit(GPIOD_FLAG_IS_OUT, &lh->descs[0]->flags))
-			return -EPERM;
-
 		if (copy_from_user(&ghd, ip, sizeof(ghd)))
 			return -EFAULT;
 

base-commit: 47f16cf7a6017212230985f6bc7f1b55b6d234d9
-- 
2.56.0

