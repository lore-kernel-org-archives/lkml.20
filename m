Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705989;
	b=DNwn3sqZAwcLZLwht0krpfwGphbpZcZYynrOH+udvRAB6SGXLGZuyEZGwinABBhr/+mE
	 enFeWye2iOdMnaqO1xPgCXsjaR0Xoh6xT6k8iBnQqi1nD7FtfKZGwZSIwZq/zDFEIKkdV
	 cKpyxWkNrju0xv9imdeu9YvmOC8k4pZ0Jtj1tmB96Xp/4oJyGxSccB/+9saRqypwpithG
	 qUFp3+TMghd6+4/MD1g6YfM+ELJk/jF2ObeTVIXpv8A8/+yHDA5UiVceEaxyiJDQ2mn0A
	 MCI7RZyAoZyy3doTdkSNRUpOo5A/NEd+NPWNFgcefLQn0jBA3g8Ufhgh0IP2I/c0hAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WLgiRTVFXC9pKpiC92G9eY2w9buDYyNgClWHvbR/q6U=;
	b=cBSrXqThR76UWmgw9nvva0IOzZbTgl94S+3ZD0M6Tn+zySTP1LnujyXml5kdjij8w1sG
	 6v+l+aIGpDrTpK+AKex6wryeTaksnvuxeEwX4tyuDo+Tdkl+zBaZVqyg8b40EIBw5M3bu
	 9BOznFkhyJWwr9Pt4mpOqLeGKA/sctgPCFdPoDk3EcWpUBpQ45tsJF69IeOQvwo6//Yum
	 ZlPwVGKYNP+ovnaNDm+dsF0GsyGU04WG3y49MLqSYU3cnxmWOqeOpQXLKQLDDV3Id59GB
	 KS8mxHA0OZNUEuINxHT5oWXYIw1XpRR6CP+YatoJRgXBjIUzRC7vNPoP73SOUB0g/pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aULPacGa;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C723606A338
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C723606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aULPacGa
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15943c9c005so275890c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792705988; x=1793310788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WLgiRTVFXC9pKpiC92G9eY2w9buDYyNgClWHvbR/q6U=;
        b=aULPacGan9SbyeH4kk70Wz/etwECX8Yshlkq/AIkaTXU/jfM7Q2dtCEEeDll9Lo4WQ
         6jt7dMBPLXLaUOVIA4FcVrgniOhFHK1tAGft8PlC0JDeBctwHI4ZSOfQl56UBXWUhr30
         JWZoS7zvAfNnvzJFH8mzMUbcpSbTiFj2i+wp1j/k6Qhp0XuPlg/p2+v0iyi1fy91I4tH
         RC5EVOjfQsWZf6TCeAW/gUkW1Fo/MLZ0j9zSk4jt1tKSUzn8Nfx75/KjIB8iFyu6yWiQ
         GFBcK/R7faUkfe5BKM+PnUtfh8eJRjfXyawJl5IKbURXajsbEcgl44vN0azrIdA2YOpd
         EeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705988; x=1793310788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLgiRTVFXC9pKpiC92G9eY2w9buDYyNgClWHvbR/q6U=;
        b=ECmOJq9UWSYD9ORFW7FCZQ53Ow1TJJ6P3KbIUwx2eLW4G8vzmlT6dp8l2kiJ7SMuwI
         YjFStezXZVaHEvf7Yk0kNPxVclnVABt29TBOBpNYJGxTpGg18BiCoJi6CjpgYD/RJcxW
         guB/rij8KKkkO6iLhnX8TX4fdQNjfb6cnfvIMsetlHNd0JhWbgcZC7ox1KRxu7VeIPMx
         enwVp8rR4kwrAHXjUDUzPiEK7yWvS/HLgZCE5JKwCbhQhDbAGIELW8pstWEg80qIsR2a
         3FtPS8ofRAOI8JFPecH3LAjbYoNi8o1DbL5ZUW/WuwqcZjvlprGLXVllNo7mWymY8V6w
         eAgQ==
X-Forwarded-Encrypted: i=1; AKwUvByiVa2xwOZTEgoU+pghACt1NWP3KpEZzcOcnCKsv+pPESZ8Sr34686vZmiLZMxBLf7XVRMv07K6McJAy/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjxf7CoWTScAc1LTjfvQMC/LwqUTUTQ/wjiuttMU537zbcTMvU
	tgCw2DcXpPq6zK634Q4rYCJPVkbeMGvgEcKsGTMkH6Dad8LOYuA5lhdEz0J3CQ==
X-Gm-Gg: AYBFou3CyjHzu5N5OUt5ZD5VraY5pFO5KifEAVbqg83AdyhSn4Iv3J1TieOf7qz4jde
	vb4vVto8DOsjPnDNHGEPafiLhMrad85/rggxY55GcfousiQSRxPzgNs6pvwbCeC+JVX7LbB/j78
	PtUn6kLB/4baJqCGZqpYZ8x6mYiYG9C4OeRL8jVcUCm6G1ySqPgTvV/NF/cqyXx8y2HEH1lw6H3
	XVbcUvU92Vgtcn76S3VYwl3FkpZLNorSnPMPXT74DS+K16jTN7e4s2fyIFpoBpRjaNq7+0QIzLn
	g9zAXPKTGUqcR6Rva3X1TJ7SX7nqLsYoDFtJTLG1edNoEiu4K+1yXsn75b/qvlWFdED1UdgOHFH
	4V5cLGarQBK2gGtw2HF6mGFyIkYb//IpWBSVBhPk04i0kfNWZvjY84+Vr6G/gk7c7nPOsG1m466
	jFsyAjmuuWtq08YU96TZTn88ltYSVfmKFJA32WfzPYLZ7gkK+HjF3Ycr1veRrgnimb0O/GWvN4u
	ghFSbgwj7ahL9zZqqoDXKflA+xgNUED+ai/1rvRf1Y8GEG25QSv4z60tW8ms44dzi+MRPO71+uQ
	QJWlUGps1z4Cy1STPFoJt6wHdp22Kyiu6ntSKMwQW24X
X-Received: by 2002:a05:7022:ec88:b0:143:868a:20c1 with SMTP id a92af1059eb24-195c74c4f06mr770405c88.46.1792705988425;
        Thu, 22 Oct 2026 14:53:08 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ec82eabfsm1110403c88.19.2026.10.22.14.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:53:07 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 22 Oct 2026 14:52:45 -0700
Subject: [PATCH v3 1/5] gpiolib: of: remove redundant IS_ENABLED check in
 of_find_mt2701_gpio()
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-gpiolib-of-v3-1-42c3b6439fba@gmail.com>
References: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
In-Reply-To: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

The entire of_find_mt2701_gpio() function as well as its entry in the
of_find_gpio_quirks table are already conditional on
IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448). Remove the redundant inner
check.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index f36e4b171fa7..03ce98baf68e 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -629,9 +629,6 @@ static struct gpio_desc *of_find_mt2701_gpio(struct device_node *np,
 	struct gpio_desc *desc;
 	const char *legacy_id;
 
-	if (!IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448))
-		return ERR_PTR(-ENOENT);
-
 	if (!of_device_is_compatible(np, "mediatek,mt2701-cs42448-machine"))
 		return ERR_PTR(-ENOENT);
 

-- 
2.56.0.257.gf7497c7d27-goog

