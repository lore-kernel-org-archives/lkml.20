Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572336;
	b=ONMLChNyTI3fzatD/Uun2flMiOLu3OgzYzvnKqB1/iCkNgcyrb+YdqcsomChirTe3ByL
	 HpTOzyqhMQX7c2p2R4N4tg1HvW5G27ZcQ28XBpP/8lpfEuExe7oToIPGVIPoFSAqhkd+w
	 fMQS1XPOfVsBB7ukZ/qxG3Q43vgwLfFLEDYCgMDm2/focIheGmcDUS+yjPNUsQ3gYGS/u
	 BNoBUnuwVZvypue3FQ+mr4iFs/341hmZLelpxNgMWQRgwwy0egaMuJntkImNA6H9e2ZA9
	 b3jcV2rZfLYVfnvAXASIjj02ykO9/u8HvO95S68qYZk6qEjnN1AP439q2iOGR1mjEyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yd3r5u89C1nws23u6cOazWo8yNsN7RjySlD0iOTIu7A=;
	b=yuNCy1KvJSNQad0C83CwdNUCqG94XqhceEgGctlj8n/iYdf0v85wnba69QdhykWt1cO7
	 gDqS49Ussxjt3X3QN88iBjlzI9lSYqsl46TdAwJQB745DIPiJSNF84atU1b13o3ogsCBC
	 12xtDg7ehckzkFPwZZ29eTXFALwH8dYLH9LfW31H7wktembcipMEuLRivp7Bz4ikFCz3r
	 MuV0Wpp+Sn+WrpWeK1kXz6IbQBvmATYIX4ENokJcDRISP7kdx1g+WSUv/xWiRPlrkmYF6
	 S8oK+iGPJjzZr8Gz2VS2pFPaLJSghCHemppgpvSQQbpgOON2dl/cVGDa73LsfAqP7Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW9P8zX1;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F1360A2609
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F1360A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zW9P8zX1
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1360535f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793572334; x=1794177134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yd3r5u89C1nws23u6cOazWo8yNsN7RjySlD0iOTIu7A=;
        b=zW9P8zX1pyVYSD4pHtoyQqAB1LmdPRCjqQLIg52jVIf3fgn60J/7tOUBGr+ag5Yd6s
         baq/9Lpmo9PfiMBz2ViKFVi9ndYN8lrf3wdExJCIMts1DVt8vhx62cqltMT8ALu3nYiT
         /HhtyYrEzxRHYwPGJG6toDse3CSuJFcZz1EBcTyf1OjOmjVgeuHmY1F55UzdEdsTT2U/
         pmilsUD7H6e1qFBmOfJvLbC6Hyp6+hORitDMmr4lYCTOZn9dgepgIdySCjQPwnXQmKVD
         qTjzmRDBwCtq778/S7sbo0PHJnGmgdg6biPJ9I7nN4hHSkFPlr4z4X31UImnJ/P8mY9E
         Rt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793572334; x=1794177134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yd3r5u89C1nws23u6cOazWo8yNsN7RjySlD0iOTIu7A=;
        b=QTDER8rNgKmGi54yJUWs0MY1QWO0l214F+XpYTOFSsPmGqVQyTwvhYQhnvmfPvZqZ9
         Q3hageEBf/MzujhTDx33iJDMCEDKcT0P6eMGu+PgZd+pqqwT3MMYNy4mse9zAvinpJNn
         CDsN2CXSIvzRyL3uVXdOlctmkpsnZ1wOwP37YswUXSp7D/uloeTWrMZ09xSHFNBLDAHb
         6fHAzTZBawFLqIGOeeI0SO/JxF/o994JGumgGsXiFbLtmTqD+EOUXELaCqFY21fOlnma
         Ti9Sc5hUdj39bjTOpd1PXXC2KbiYPCf1gFpAYYKPUqyMWb+FQAdAIpft+g/LpYWgXq3v
         bdlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxS5a4EPT7tR/xgrpjqZZNzxLCYSdRsDZNnuyvoM272jXbur+dpcoYgw/p0NZHAPdBeY/yz3Mdr8hXeZ4Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qJXIIk69rp3v/0HQXCzClH1KN6CXPBS7He+pZLW7qxKbpOR0V
	cqH6q9sdx+Qq9Jy+i35W/VR1AG1nPBBl03lapm5xAoJLWkkDjrKtx1UTv2+GlUIAvgz6GQ==
X-Gm-Gg: AYBFou0BZWJ9AVyQ1kjIC8SMzGu0yi+6dwNPH29m6O5MVCov2VsTpxKq+agewtFIq0o
	eRpA8PnDliR2pVKnoq/zsniBbOq14R429QvDitZ8RMkD3bcSyCaSs7bawddfjK8OSnRTAYioO9r
	ResgBIB6H/uI1fEOqH0UNqZEItCZKTSKjYt0y/UtWgOH+j+VwtDMrbIm0/r/azVV8MEqR0uK7qg
	FqgmmCQyLF4B9XgHSGuxMX69R4lWc5RjE4lfBNdEBsd+d/etncO/OLoZjc8P+Xp1yrK7tGDzeR2
	Sw9Rc9UXzmDzn6WXP6VcstG73/YSkF8pz+vLY9BN3FX/eSIu77pWk7M/GHaMcyUnuFej7csXfWd
	6ciDlzT0jDV8qjfOES/th/X61QVTn04q5lV8Lan0N5KJCpw+75Ilu7Gm6tzmXyoEpkKpNE4Mplj
	O9mxTMNMHQZTbE4RBf9oZd+Rl+rhgAs4o0kz7FenSYW+jQNfPc92efF5ImT60gwbHZi6rq/bnqN
	MLQA0zZ+Eo8mY3lY1AG3Ja8yM0WC4C9MRqZPLGCas6cFyGxR/f/BZRCLFUmm3Eb7Z2P5GBgYZkF
	rDAKO9CLtXdzAlbbAk0DJlhuAp1MIoV34rO/mYB5JTHGc7vhSRGcPHhrRLEAWtk=
X-Received: by 2002:a05:6000:2dca:b0:48d:e101:5707 with SMTP id ffacd0b85a97d-48e6e2eb1famr21799873f8f.13.1793572334284;
        Sun, 01 Nov 2026 14:32:14 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm14904805f8f.28.2026.11.01.14.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:32:12 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] hwmon: sy7636a: fix negative temperatures
Date: Sun,  1 Nov 2026 22:31:22 +0000
Message-ID: <20261101223125.302001-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101223125.302001-1-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
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

The thermistor readout is a signed 8-bit value in degrees Celsius.

Fixes: de34a4053250 ("hwmon: sy7636a: Add temperature driver for sy7636a")
Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/hwmon/sy7636a-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
index d51daaf63d63..f01f368d68e5 100644
--- a/drivers/hwmon/sy7636a-hwmon.c
+++ b/drivers/hwmon/sy7636a-hwmon.c
@@ -29,7 +29,7 @@ static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
 	if (ret)
 		return ret;
 
-	*temp = reg_val * 1000;
+	*temp = (s8)reg_val * 1000;
 
 	return 0;
 }
-- 
2.52.0

