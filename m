Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098236;
	b=MCnxPpS7hZ0rNlbA6CDIGBSW4YqQcbwBnIbOZbXPDkcBxPsSOVe95VBlbtUApqqURvsZ
	 8wLut2meCIWUzZbeE1S2x+S5dDtRB68TON8B2Rz0f4McKbqzL3hM1VhIVckLnD7ZUgrGm
	 3ydmf8vRvifQCT9BEh9OEctCPB3bqtoK1tBOdsTfQH12RiKR8iopINoHn9t//3XELbk0M
	 O8Pjxyf8d5llMcvoLyXGclxF/4qY/pEMHDMbU6NM1oSQmkEMWeK7kfpG+02EbrZ9HKV1q
	 y36Gt69NTigaj/D0gpHVcZ1uv8xau2gmsbtX8egzGto4mFX7KmaPK5OxeVF7PmADPwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=KYicqebf9EjrinyN51JvCt3VsTjS8J0EC5zey8IGKsU=;
	b=u1ES6wRw//Zg7MTJvrJ3qNHYYAnwiZna/+xou6MH8/YHAhTd2oYSSntLjPEtAD393YP9
	 sT3JsoD0uFXLqNHEkXas2BeT9+IZfZ9/g4XifsEPmNEY9tWHjfCpkvQaxPEzTpEYzoanR
	 qAv/wwpNWdYqa2USSzL8ypC3wTUwL7PRNO3hfYsQKpF7nZPtYDfZgb8d4uYcnXfupI5f8
	 YAMf4l3AyxRhZcQI3DKdimDUIwB5XezhzfdmfVfSFhUS8dPhZd/+Hgj0U5YEOrVCDVoGC
	 V3Qxq25Qv5N4XZ1k9aUWsgrNW44EmXphM9nptxQ1ggdG50e75xILG9X3sp1b1nxFhtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TAe0XraH;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAD960A2628
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BAD960A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TAe0XraH
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3602945f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098234; x=1793703034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KYicqebf9EjrinyN51JvCt3VsTjS8J0EC5zey8IGKsU=;
        b=TAe0XraHeo/hpQoegSgKVK18eP4n28NIa1xj9jqmb/FMj8bXltCoyIwpmQUAJbh+MI
         kYWFFnzN8RNi3w9SBOIYOhKBP5B02UYZ7HJSzWVOgBSk63H3G+BtCuEGI30HWBhoipV1
         gpXDSJZvvEvuVCaTkwHbmZbNPSC2Ozb2zLfIAdCT0kb5vjOeIYFVP+IPdngkz9flR1Ae
         GhxtF4tts45UlVuAay3rErWFIE2a0dN2QsST+evKKP37Mt4pp23woqIQOpgeSReEni5C
         wcPLZv2oLk4tAUm7ixI+MqhS3lo9U3zIt2nrK1dOglMpZXC+gbiNxmlO7Wr8+gANoMu/
         F1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098234; x=1793703034;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYicqebf9EjrinyN51JvCt3VsTjS8J0EC5zey8IGKsU=;
        b=hY0EQWJROUYMutkvo8w88qQ5hk7zkaFNkNJ+NeFnRl3ESWqjzFQqNkDSPIEf0+M6Oq
         lPC+V/6tajuunl/0kGpZkdk/goM0upD11XEEBVCYF4+eOP7530wk+rZ3NRmxWQEIbn9c
         i7yZYO5KLEQKlRwPFaiJd986QhuSf8U39TnHIQtRW4Ft7VWYY8f4p19RqrGJAJ0nxmqK
         Z2Et4WKedvu7lsDt9v6VJJYWk5nN9JDTcnFaX+gtS7YGcdDMsy4gIRaMsg6+5o9RQLPP
         m5yyFQDV8UvL2H9XyWpEproNJ2aK7LokkoChZ2JCq0GW5LMG33UgTlm1Z2Vwsn4TBNeZ
         depA==
X-Forwarded-Encrypted: i=1; AKwUvBy07w2O/LXnZYi/mu+4BtXUuOa+x4PSuKfsCSGFa5ZF4o+iTmnC3HyfSGlZNPJVnt7izd8xdliKXWE3NgI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLx1lL0tzIiwHwVOa9WDYCsKW+hd1jZYMrGIJjE+hBhAeS+WKVu
	6VSQy1MHA3N1+uLwA5uiuKNrziDfSed2f5K+W9uW6M/GZwwHn6WurDBU8Ee8K0/7bww=
X-Gm-Gg: AYBFou26CPLiopv0h/i5JP0q4YfJk+V8UDxzcazrB/qgUJKu/SrVQ1V3VwhguCJTe1G
	VoRbwqThKlj2LXy0lZK+uwJ3LQWLu3smXjVK9hq67AKNyaelNkrC+oHVQwMs1L02+Z7X/Mu8r9v
	LETIFuglqWGTpPG24EM1ouOHsJhhgXQcs2K2kZR4LqUq71zjgpRCrXI0ctog1xe6NdEVVOeCG4P
	rVhL/hEBjLXxYjqi3fLdovps0QCAcnEuHuYk2P5f3jwrKMlPVZTEwyIAkWzWk/qvzsWXSs2B+ml
	GTNWRKqP2+2MgEgKB/c1uCW7+Ewh9bi51ar5YzSA+LlKgP2xJ5shoF6W18tdopwtqBp1uRvWNdd
	BJCI93jfE5Ux0baTIEwn5mrV4/jBMnQaC4H+WSv8FX3m/2CY0chFRiTK+DoEKXqhsM4xtL3L4J4
	EGue/yLUtxY/cMnr+PLne/kC4LGtYrxsK65d8DAQvqEA6+svbIjGk0wNpvG/ad1mP6xq6z4WAPt
	JQwsROTwjtsEO1NxlgnBs8efO5aqjdiOOotARJLB1t2VqQDLmp74UCIk2T+YcvUEcBNhup3qBtD
	uP+elrRJi8iyJ74ii8rUfl+Hc3IP4c3Y2wa17sVFY9MLC6/+FFm757+vExt0ujOc
X-Received: by 2002:a05:6000:25fc:b0:48a:fb1c:c2a1 with SMTP id ffacd0b85a97d-48e3eb946b0mr17431195f8f.47.1793098234650;
        Tue, 27 Oct 2026 03:50:34 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3eb8f387sm21810301f8f.4.2026.10.27.03.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:34 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 10/23] gpio: pxa: Add missing platform module annotations
Date: Tue, 27 Oct 2026 11:48:47 +0100
Message-ID:  <c5a23e1dfa25307d4c4605278f3922e39d25579d.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=836; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=0N+lDmQgRDGBU1BCwydX6YgET7LObGjwfjhS8sLguR0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IGwtHuGroERSBcGC91nedVJAu5uU5IHfc0C7 kgT8qtNFriJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBsAAKCRCPgPtYfRL+ ThCCB/913FFk4g9QGCuPgFmwjg73gNT6Ilij3/UT+I0Hged+Kx2+UUheR3Sh1BUZ792x8sZ+OFX 6/OXgWWtVZGX/E4PiUDligBrWeD8EEZ4WprAQhdjcFPWrY5ztfzPGSaasbLYkQRaM57jviXANd1 L3vOqhoZST4s90PTZIJyYWOrd4j6WuY3VJmZ4Oyf9AFOWDOUc3Hc6VTHc2rfyFhlbQYV/iMjh+p rvsINQ1NQRM0/uOUI53pBOT1Arz3VfMrZNzPA8EBjA/sXJJn/17CuStFx3/AZYDY+uTEp3u/QpJ sDXApOo+WaN8m6+9MH2pPZuRXJ3MFVgU4e4vCbpopkHi+1Fg
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using a platform device id table is
supposed to declare that in the module's metadata. Add this information
for the gpio-pxa driver that failed to declare this.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-pxa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index fa2087acc025..d241fd4c3d31 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -719,6 +719,7 @@ static const struct platform_device_id gpio_id_table[] = {
 	{ .name = "pxa1928-gpio",	.driver_data = (unsigned long)&pxa1928_id },
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, gpio_id_table);
 
 static struct platform_driver pxa_gpio_driver = {
 	.probe		= pxa_gpio_probe,
-- 
2.56.0.rc1

