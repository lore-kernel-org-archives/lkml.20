Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032167;
	b=vVVBNB0t1m+S9dfo2H0EyEQd3TFAWM+YAW2mEA5u0Pniu3Jlk7SgzI7S6FnTlC+zB9vu
	 DwPUBwP2yxXeifDQEJ5w1m2xz0Q8HUPUmktnkoDmqzgS7UQjHmI/4rwkf8TAZ9/012VBe
	 a0pu9SGlzV4DL/7um85NDRcjx9EuVV6kNkyFAvXEg6jPnby4E+wAXyF6hP4Q/14m2BO5/
	 z8brwSMi8MTOK3X7acGWC0jDrRT2TURYn8xkTblM6tROAifhbEkeTHupz82uOGDh7MGoN
	 YJAig0bxtIbIXzPxDwQR5GPd09kRFaxRL1Q37Vd9X7+pXWlo4SkEimoDkmkOMhCSUAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=AWcgq0SRGHmPYqmIYgxQKM3GrS7glpdzaZ67Xr+DP3k=;
	b=EJPVyGwfjHWZZftICuB5gLy46I15dy/qppvFwzuAKVBIuzVwlyiC4ZfqTZC4V7YMS2e7
	 XowBaAzAR7Q+FQIWEWCIJWhthjpVL/O+jQOYbBXsIOAXp/4OSiSVu+vWPUgK3HDs1Yjmr
	 9s8Gseg9YXMgq5Ucx3f6U/Y5jJbQhk5RxiC84LugliczUiU393THgkN330RnzsUD3xmk/
	 87oTJcTIs4PavboxMW+ELy4olmg7w/na+iruonvy+z6dXICdumARy80+Q/CFgqeL4LLRa
	 mZkMtBEuNkUrrdy8F4qrqABhd9MHkc6ujZhrDo2BuFDIYQwtkwBhB3R89X2iAZR+hPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WX63UnUt;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39486606A33F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39486606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WX63UnUt
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1457073f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032166; x=1793636966; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AWcgq0SRGHmPYqmIYgxQKM3GrS7glpdzaZ67Xr+DP3k=;
        b=WX63UnUtP4teZOyxR7QOw1WdMpppqxGv8PhyLfRJThwJL+YOBiG05aJ4OgZmbf4Wu2
         wrip9w1oouy28UQ72wX52PItf697nqpChALu140S+kqu23ODWlnzIk5MnhJNesWt8kgr
         mkeqLg1QuJgl2lwvVenpgBPfXCR0OAy8kcCbwl9oXqSlxQzzucWvPbiDMBwacXNCawTH
         uyv7H6N+CzhcuihL3WmzgcMktSf726I78bl6FX5dbJmmDUJs/tsmhiTSGdU2WyBItg6E
         +aIEYp1lGG5IFJlMDVBwIZJx+xp5N4ZGxz9D0/GSNT/F/v94EbZJlNwwJUr6QrAbjnk0
         Y6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032166; x=1793636966;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWcgq0SRGHmPYqmIYgxQKM3GrS7glpdzaZ67Xr+DP3k=;
        b=fUA39DVQ5QIVJCnp+sV1ddH3cKNc6ESbgSRq+L7Z7+kV/h2fSEK7kAXyiT+6wPTDxR
         SEUl3f3O7ddBfZE71hItWUW4CObRiEP0NjLHCUFEGfk7nFP9N5ICQgChNT2xgzKUdVBh
         jwN3LKrHFxbkZLHw1DgFGGUsmh6t2yXmxGOvo3zGcyuPfCDPo8yvtbkQlQXUi/bMiJ0y
         yq7vAxk6BYZh+e0iwx6+1NIydLGvO5YsOQEtevEdGL+KS/Fp2vn1vQ1tEVXLSqoS3579
         64cYi96XFU2hUR/RiNmA7zJeBIxZO4U/IFSNQOmyHZ6UcL/ieFgLqcTjaVsF34l3ZH0k
         HX0g==
X-Forwarded-Encrypted: i=1; AKwUvBw19PRsYU1kuF+ARFSkIHvHRUmCTnNTJiZZ1ctImMAF6HdThDDCJ/NhKEh2yIUjQrLqUteFA38tRCkZqaM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLT2cJHGJOkk5eEbjNLMqW5SQ0nctINPly+IRKDppp4lLlTi4c4
	Hj2VMKrOGoRNn/0yz6KGZbu11XrtaValJxopbj6SYfPIIyRXvM9sCP1S5pXV7d0BwcE=
X-Gm-Gg: AYBFou3Ibk2cxbKwJr9Qe068lCNYEGn17pwBsjpqjL9rv1ZHPOWFWlM7gxpbNr8uixd
	DkMZdQMdIKPYOsl7HXD8RxVpMLZHiFUChdbuUynGKzSUSUhHCe9bUAEZPmrJ/EGcbua3wsuNZtV
	N3sDfM5bNVb03hhrMSveAmzA0e3rgz6dzzcyOntl0l8eHOHP6PHD7MsfcWDFr3y4iX1L/sO5q4Q
	CRe9vsD3E/oulDU1FPAMUYbQK7leBMwGqu5H+s0yIdRKsR1uTCUbJbK6r+z/5x+nGpzXTAeLfWQ
	/47fwr4hY2F3CacPWI1Nr/vWEnYdW6vZjYAs1IY4TcSk/3Cmvh7UkpVECTNze6q5KUmnYKU4dkm
	cuchWLhWwMwXrspIJBa15yBpgW5gJ1xypcb3bZGfB+xjcmVaYT9pB7G0GpIdTScYjTj8jcd+hl4
	3iT4LCvcxnybDCzi3EtQxZ0At2JoJHHO5Atxfi03ubPwsfHuYgL0OnR9UWczs6mbuUc/+AqyXwp
	tUZtfD0N7jkrSYUGlDvXZxsFc5+FcmybDx1V65V/ZGCzsky3IIcQra7m58tAkrYMobvrDnn6yv/
	/8J5Q13BAZKZyficWdn4w5wap4omSBkjJMCk6TL3llZi348aD++diJPyVrA2I4K4
X-Received: by 2002:a5d:64c4:0:b0:48e:2406:57d0 with SMTP id ffacd0b85a97d-48e3eb75f9dmr14086499f8f.19.1793032165725;
        Mon, 26 Oct 2026 09:29:25 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e542ed998sm2542825f8f.13.2026.10.26.09.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:25 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/22] gpio: fxl6408: Remove __maybe_unused annotations from of_device_id array
Date: Mon, 26 Oct 2026 17:28:13 +0100
Message-ID:  <3f4d5ee3d2569d20aaf929edd52e5f3bfa63318e.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=984; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=YIMiQUQhyiMHW5J8celUPNjx27FfZEhJJQnBL+5FhKI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+hIAoYU3+kgh8XYo69kiSBk+gjbRI6rh6gu 9CQJ1S7u1yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/oQAKCRCPgPtYfRL+ TkRfB/sHky9XSLJ3zmSCZrOV/tpl8Xj2oAEj3rkv49hNVTEo/HrNGfhfP92K0g9UyFuF3WFUMk0 zEGw3cPjfjEAkKwN8upyHr460cYifLxySKiIuLghu2kEttnGyy/bA9BJ1Qui4+MVWR7qNh0yU6I cHsAH4q7FGrwG9SYs9JOpuUPw3l/krCRRwoDgyxjwUwMPK/jeQb2yRJam7tNEpSzWUyGTtiIr36 yjrbRNIRyDvAjpo2t5lmHkzLebEk1hLRrOJNxrTqRKiBkAvmYJY8/LYOfYIT+ii4jVIxQX647sg 3plylp/ShANqJmpz8BxJcEdCfXmDZof8+1orab/ehS3jTxDi
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So the OF device-id array is always
used, thus the __maybe_unused marker serves no purpose and can be
dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-fxl6408.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 45b02d36e66f..8a7e70180efd 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -143,7 +143,7 @@ static int fxl6408_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(fxl6408_pm_ops, NULL, fxl6408_resume);
 
-static const __maybe_unused struct of_device_id fxl6408_dt_ids[] = {
+static const struct of_device_id fxl6408_dt_ids[] = {
 	{ .compatible = "fcs,fxl6408" },
 	{ }
 };
-- 
2.56.0.rc1

