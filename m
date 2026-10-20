Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499253;
	b=DQZW7+z6SDYoal2YdoEHfptXyjpzZ7tAJ7/dnhFh2gD5ckQX9OIea66V03IkCY6zO4Qy
	 ghvBTfdYYYhl5BqPceYG5bkgeqwi51wv9ZGVMx7JWpBQJHP7h4MV+cyxoUenBKumR4mFN
	 GYCvva9gfe+8BJhhpAnBtbWhDbyVfKB28E+h6CNgIdnqoaFqUGe1hNTpAe+niV/daRLUz
	 TtX0foN6Mt9N/a6d0gRRjVH2M8IdYwM4VgeeTOWBspAfHSsgnEWYdHf4X1s/46tIWioTh
	 K5XynIkuTTWbrgOX/YFoMP+F+x7QdhkZ798+AmgYxfGK62MDOPcEfNQ9AXfJOosabtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=datZWh14WO+4vzm/A7OIElTb2FmU2wSjN+th3EqRvGM=;
	b=BqEDp0Nzz9tMwJMVNMgATRUFLmloWk8D9TU9RXdcRhh3cxnQWJfaHRFOdfW6TzbSHhGW
	 W40JaH0Xt0d+cfaUZd9/9QFp7ygcla0oxenu+p9dzDFFD8V13JXgsytkZa6V4EOsj2cg6
	 4p83i1hMQa9WytJrnXSb8a4ovAVPkI/RaP7bCA387ty/odon7W8E3whBXXaIcVtNt2F/k
	 YJtN7qUx47V8B25+Gklq4bFTjsVJCPPU8qvVeJIFkKYjVxjOdmu1vVqdxQatsdOpkBdj2
	 7BE1VJR389Os0vmK5Vw/cjeNauV7Nm3F3T+O7XnJrRSw0SVdrcFlE9/oORHpwJDxw7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D8LIp5jX;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102FD606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:27:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 102FD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D8LIp5jX
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4956869750eso25177895e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792499251; x=1793104051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=datZWh14WO+4vzm/A7OIElTb2FmU2wSjN+th3EqRvGM=;
        b=D8LIp5jXKn3Kxmp2zc+NNJP9naLAUQRgmWigq4I8Tm9iK6aeAFrsk79CI1kL8BWI+x
         bLytbuKF3L5rfZaKaQ06oLGsc6uRjTvjYsnA+dTMkH3840qasLMxwSWRRDYhNqUvV3+E
         G/TSO8zrSG4PUsvr+7o2LLdK5SLaIWKXISzP0Gu7HZC+gHm8SIj2fSHnyQFgZ/mTavx1
         ELGoKOMp3VTFpwrlNlAdQgiS9W82FzS+JulnHgMP5Xz8itZn66iZp62nzbls/iustRqV
         gZBNu7s+jkRYjxDvYt5HeIksHgCqpMs14gvYt1H3hEQXPbIEW0yAs+8ZWV4iTm7RSjUM
         NX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499251; x=1793104051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=datZWh14WO+4vzm/A7OIElTb2FmU2wSjN+th3EqRvGM=;
        b=KkuNcHBUc7zlGAsOgoaCwDnCBZn96HB9No1RnoCxe7EnWZT8EwKp6Vxab+uHLoJfPP
         Yh+ghe2onYM5oCxweReCFY5QPH8gDse+yYBv2mEmB1tOkRRdY8Il5rYCLV1cu2SljZgQ
         3zL4TFS7nBus2p2zGopLYzWXk1sRsoBLpIKaF/tajWGWYpU0hV0XbI7Hp8DYmPaniwzE
         dRfxqauTpvqZdZ/fZ8M6WQbz3PhV+8CJWdeAos7+5xiSu4pm54blC8p3Hn3iMqeU//pE
         6NOS8R8nvawfRFfKouTBa1V/TeqdJrM+/I+3jK/wqwpkRvv9qQQJBXRY1xWLEXlRrG3j
         QvKw==
X-Forwarded-Encrypted: i=1; AKwUvBwif51w6lMis9E7xS2k3lSezBD4Zgw2uq1zaDgoZQY3qW1s9c9fZkKNvgF7vmCvEhAWAVDbi0y6L6lIsnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8mX/xLR/QUPR08zhXuoep8gIbme229SsmWyw2f1TJoizEtdnR
	5tW8fqtNrpcRWhcBW4oO90v5iqmHlE799cngtJhLtmGMk8Sj2JcNZNV9
X-Gm-Gg: AYBFou1jd/FxmXtUTj9zoaGshQ00bl9a6OzBVaR7dhTi8smEqspXk2SdgsiaPtRxca2
	j9rIHltSk8swph00wNmNXPkCvtW2URwh2lKhjW9j4r0aroSgBZw60bMxQekWGK4hM7pQ9d6NSAl
	NlAkvJW69iPKBpQ76GIniqeRe4WwjiEqId4QqHWDQ46jNmndWag54S5w0Mo5D++7KAQJkeErezC
	AxbDYh3kOFXpJhdaBGeoiKieSBN74Yco8Ew/mZuRnl0xM7in/iCMdQeKvBWgdrPg0mnGw2p4XhG
	Y9VeQBq2LkLpPlf7Pwm/g7bAq4tFYheB/qL9fLrxSAekgWdQNVOVehHhANWzzQtaf+RIKQU8rQx
	FIQfYNQnWgpYnkW527Nfq6AwO62dJc3BhnIh3OSeUjO9b8YTBpfxdf5gV4Gy1F2638mUqV3pr17
	uwBZ6XVDkltpzNh2SsF84UUujW7YQp96P8yirx+9CT2o2gtfZmpfsgP6t3YGTwZd7wfw==
X-Received: by 2002:a05:600c:1d0a:b0:4a1:f377:5c6e with SMTP id 5b1f17b1804b1-4a1f4172b01mr47842795e9.7.1792499251128;
        Tue, 20 Oct 2026 05:27:31 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d817f8dsm5617092f8f.23.2026.10.20.05.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:27:30 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-input@vger.kernel.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Input: goodix - sync the irq controller while starting firmware
Date: Tue, 20 Oct 2026 14:26:48 +0200
Message-ID: <20261020122712.526797-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
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

On the Lenovo Tab E7 TB-7104F which has a Goodix GT-912F touch screen,
the touch screen fails to come online after loading firmware, producing
the error "Error reading 1 bytes from 0x8041: -6".

Comparing the upstream code with the Android stock sources a call to
goodix_int_sync is required between the upload of the firmware and the
watchdog restart. With this change the touchscreen is correctly detected
and working.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Relevant bit of the stock source driver at [1].

Credits for noticing the issue and finding its cause go to matemiller992
on the postmarketOS forums, I cannot provide tags as he wants to stay
anonymous.

[1] https://github.com/lscorcia/linux-lenovo-tb7104f/blob/2dad69c9f28611ac6d3db2f1ee11b480a60d83ee/kernel-4.4/drivers/input/touchscreen/mediatek/gt912_p98996/gt9xx_driver.c#L1529

 drivers/input/touchscreen/goodix_fwupload.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/input/touchscreen/goodix_fwupload.c b/drivers/input/touchscreen/goodix_fwupload.c
index 5ae9a109ba0d..01e7705ef515 100644
--- a/drivers/input/touchscreen/goodix_fwupload.c
+++ b/drivers/input/touchscreen/goodix_fwupload.c
@@ -155,6 +155,7 @@ static int goodix_enter_upload_mode(struct i2c_client *client)
 
 static int goodix_start_firmware(struct i2c_client *client)
 {
+	struct goodix_ts_data *ts = i2c_get_clientdata(client);
 	int error;
 	u8 val;
 
@@ -168,6 +169,10 @@ static int goodix_start_firmware(struct i2c_client *client)
 	if (error)
 		return error;
 
+	error = goodix_int_sync(ts);
+	if (error)
+		return error;
+
 	error = goodix_i2c_read(client, GOODIX_REG_SW_WDT, &val, 1);
 	if (error)
 		return error;
-- 
2.43.0

