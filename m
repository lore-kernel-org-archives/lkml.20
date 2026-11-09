Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243512;
	b=KTzXPExYNbmQd5nL209pzSfmOKCv8IEVul9sAr//JYZfqACIqNMu4Z0NfV8wxQ74aCcW
	 rXnXuJcpaXTgqhV3Ode9l8BEe+gPWLZyo4mqnmzp8jOpLJ96NeE8xM4+1jiexzACDjqBA
	 VerIcj1pJ518DNmy/P7oMTjHnc5wuue6pV3EV0M3mLAWZBojPjUNwjSFlBVcpub8SRbyR
	 VcjiGq6HM5epzj8LW9k2LQ8D4Fv2A+bKP1Ej8176P3KQPcv1iWykLIJ/a5rBo3uN+MrkB
	 QV/4TIGEPqIVLtt3+4o7uE5EYuqez8hFuzNF/z+zP3wI5rl7lIpqPqqd2kp5Y9NNicg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uSv5FaWike0kmhQ2+P3ysE2aCmLM2123k0sFqlEhOLY=;
	b=Sn+RnxCm2YuwUuAXeJQ8g/ZojNR2kdPMThlXJARY/GLVi/iPlPwQXKBwDtl/A26QwojH
	 CIaNAmWwgkVnUnJbLG5T/vWhTovtGRTmL+CQ05lxpIPv6xibzp8RBWAMEP/Eztg9ed+l5
	 tYWYKv+fDL8al773t5qfvYz2d/Q7mpRFCtm8XuQmUiL9C1+6r0MTZnrZ8zPlctTEhR1Du
	 cIfTUR0/eQ8aXAknmCOeaYHGKKc2MtFj6ctqLxPsZXAqLmg/BGzv7exSRACtreJxg8X+G
	 ffd4Km/v+4RmfzE9mJU8Gr1BV9ttgXdsFCKQPr0StjsKy8ZYOAPxklBcFKAOCBVxUFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZDB0kSfQ;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1975B606EE9C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:58:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1975B606EE9C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZDB0kSfQ
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so472537a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243511; x=1794848311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uSv5FaWike0kmhQ2+P3ysE2aCmLM2123k0sFqlEhOLY=;
        b=ZDB0kSfQ4Rb8KMSTfuDH8rxKIm/OX6PjsF5lAxXuJxzywjAAPP1hcK9zA6JZPn3bHC
         F++r7/GuWwCYIOZAtqpDWeO7YU+0iNomAfVTq9H76mywaYXz+2JQdlrcc9I3J8wS8tU5
         MJkWdhWuBAKDHqNlcrfpT89Tw3KX3Yyq4Y+4bn/Ne6e/2Ab+fXFVPZT1IX0SAeP3zbtS
         YQL9hCELIk8t1yzz3zn6Imd6OW50VRdZQvZtw61iV5DwTpQn9pV5gxbPqLEPws4U07Vd
         4VCm1y3fgMnxyhWa5VZQNP6wCIyEtPyRtRnm7Q4ejy0S1uf6PcuPT29/vH+KK7T5YLhL
         bSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243511; x=1794848311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uSv5FaWike0kmhQ2+P3ysE2aCmLM2123k0sFqlEhOLY=;
        b=JMva9EPdaS4x3EJaiSdwkZTYS9OJMRFEhCSu4Ah4YaC6xmjxN1CrTLJ5OHuQ2JnHEq
         Zv/p4h+DDYbKVLr/iF5AucrKT1Bjfo3m5BbKXvInY2RmBGJJM7ZyJ96Pg7BXdnKemPL4
         X50darVMvtudr4JzBLU5u9cNi5SjD4jd5fA8sX7Ne3P7GFT8VaG/Y5YYWNWyaw68RhU9
         K3fE4YRNO0saI+Cr6QSEU876K3UqOqsmuUpo0hN7mnMrIROGOOO8hQSLbdpvyEt7H4zW
         iJZwXmQG4N/f1JfI2hOOmADDN47xqjXemXSZB98Uffdzob4odMLz4QHVuy3GGNkuju6w
         wLZA==
X-Forwarded-Encrypted: i=1; AL+hErGbAhDuWWY5j+cbHlahX40Vs4LTeKa2JQJLTLdSo4RPUzC++e7/J9uHHzPAKmWc9Xp5Fftp5wqrIpbmIhg=@vger.kernel.org
X-Gm-Message-State: APuU4Z++txZELcm/MaB6CVrCnbpzlA/Ly/kirEafYJapxnRk7eadyRTf
	gOf4ADS6I4BiITTA1b5a1Jb9oq6l786ElBAbY9qO478wnY6yJ8MG8e14
X-Gm-Gg: AYBFou0H1EkYIEO3Ie1KadT+6GGD932AFrCtSJ248pF0SpECLZUq9idY3tW/EIL1PyN
	H2Ae8UJhs9dPVoPqP3BnzSZ/4eCiJ1IYUd5/GNVw6pDUFD2nh+ip/H2jWA4so6nMaxmL+Yf75ag
	5lSf1mk/UNjSTIPdrhs1MrcdGAc3PfuD9xX8MCSdZwePk9ENS7jJEGrLECfFYyIfl5ssTyPoFNo
	cVXjouQT22Pwg6LoGVctE0EXvSyTYTvPCz3zu8r5/jHo8nMWdpIldfoZAMntw8Jy8gVb5gylM2S
	feMcF3XVr4fyWzyDoZFC/xfB/lUa2hIvBCVn+79lKiU8Yi6X5TTMQDS10g7oBUyIf+vPacBTDpW
	h+64P5MlckiPsxksxCDDLrQXbFLlHBInEB3MqYzvEuSDX1Djyg213rbsi8x+pIrMkQ58H+79kix
	mbTrI7MV9w47WghXzFjo3mHlxI/eTHsMIN6b6VLrhDQ5uqAid37zQtDlVKSGbqanQ0EdxUzOyab
	KRbv63/RUx/2sU1QmJKQWX6LUImzhqWiLJhjlen/pues1/sJm8vCSIO0Ao+1b+pKwkZgz5eB5M7
	WePeQf5HMuY/LzxidNqOTIeNVo9glbxiU1xv/jyKd6ztMA2CLj7nSUrOZK0vxJX0qMZScb83jjQ
	pBFLu
X-Received: by 2002:a17:90b:4a47:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3b166cd4924mr207833a91.19.1794243511464;
        Mon, 09 Nov 2026 08:58:31 -0800 (PST)
Received: from debian.ari ([152.56.156.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16779cf05sm138766a91.3.2026.11.09.08.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:58:30 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com
Subject: [PATCH v6 08/11] iio: adc: ti-ads1015: use devm_mutex_init()
Date: Mon,  9 Nov 2026 22:28:02 +0530
Message-Id: <20261109165805.31160-3-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261109165805.31160-1-architanant5@gmail.com>
References: <20261109165805.31160-1-architanant5@gmail.com>
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

Convert mutex_init() to devm_mutex_init(). This ensures that the
mutex is automatically destroyed when the device is unbound, and
simplifies error handling.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 1924c1b2abeea..a65da3742bec2 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -970,7 +970,9 @@ static int ads1015_probe(struct i2c_client *client)
 	data = iio_priv(indio_dev);
 	i2c_set_clientdata(client, indio_dev);
 
-	mutex_init(&data->lock);
+	ret = devm_mutex_init(dev, &data->lock);
+	if (ret)
+		return ret;
 
 	indio_dev->name = ADS1015_DRV_NAME;
 	indio_dev->modes = INDIO_DIRECT_MODE;
-- 
2.39.5

