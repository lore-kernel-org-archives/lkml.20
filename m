Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815170;
	b=B5rVIjRsNjyNL1txLfNM7pRtL6Q7ZpU5OSKjQIknGfwqhmWTG6MPUcyWIxvrzVtibb1e
	 Z/wBFx25kyLdpkas+ShD0vQUzXCNPZTnKvCcF7iJ6vJbWOm4DinLPtVVLza2iKXVcOXLB
	 PSZmjG4k+nbwr8tQlMOj4CRZKc7b9EvlkhSNcUpejCVWe4W7UlteoHSMfITmSU/R+rpwW
	 urJBXlQifhxaXDbChxrXVoRMpKFLqHH0f4vjpFrhwdgTyFLp0UjdDktggOcj43gDAFpeo
	 J8jQyywMSCS0MLRO0I2vbY/MQ/r7MQAlx2fuZ2lGUn2qwjaYRqAPep21Hs0JOmzhxgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815170;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vxf/fpsGTPmXor2KAJYnDd1RKq6QCmVJtFSLmgZYXos=;
	b=0HEMrFmiS/4dXxi0k1T6/DBswzVR2J3Tfoa5Igl+kRZDGbK/NGBIWmlWJBrruhimKqU3
	 hUKS80gz2DZmpVvihsHbN9JHT5FUFXr5lnRiYuc92r7UYDNB4UuenhCeosiUjSNOCcMiv
	 Nuou6YFmj+7aNPPEwQhBO79XzIHP6pPORFnanCH+iCFIg1hIUDLQMmlXNx24WDD/HiEgq
	 y7R9pS4TmwLgf3VqQCIsQpj8JrwY934SbNyFTtyXOvXjvn685M2PNIMNgZ/njIXdHZCP3
	 L+H8FEwCwqw7NQFxicX/0EMTSZWUROuwjPNOiHrP03XVfeUXP+ATCGU9iJK4VFtuSVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t+5CzAV3;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCA6606B093
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABCA6606B093
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t+5CzAV3
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3514b90bb89so1865878eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793815169; x=1794419969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vxf/fpsGTPmXor2KAJYnDd1RKq6QCmVJtFSLmgZYXos=;
        b=t+5CzAV3CvsGSufs6WujG7BIrkOcV8EagWHBsXCsuvvLNHgJK2bwpLP7oRIvtwJzWo
         FvAAhnlxfgcDJ2Gga15ruXBQRaknxh4ZXwAawgJ+FIE4fNYkhfwthJ9UG/+Cr2gpTtM5
         Lyy0So2M7HpS2SBetNkTKm5J+t3LQNwRoFyJ2793GZ2UobQ+Pz3wCtgqLjH8Oeap5HKE
         7zuD2A/fpjBglAHQW6S+wP7xznSP/yb/OPar17lJ7mDs0zuFMsCwl8Saaq9H/93It+a9
         43cJt8eTgacrZ1Ey/ozAVffU0mxSOP7WaHY56LF60foPFyQ1u+Vws2+jSPvSgSPrFBv3
         adtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815169; x=1794419969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vxf/fpsGTPmXor2KAJYnDd1RKq6QCmVJtFSLmgZYXos=;
        b=nkoH6lRhqxYElBtrMdEpOcxXZucJZWHIeJGd8lGYBKTYwMCY4KWCneMAoeU8rM750u
         3YXNESPp2HK0uIZMLa+qmXTqW4NsnFbUcdySx8J8tM4B3Kl+WLoxMhLI8JIwCS/7lfd9
         G8vgiItqQOCNcYZko3yiWP8F18zFMOdVofpJqNDBn8k06Ilbx3Us8n38z7ArE94B3MRk
         qulfL76bDcUxvDfYuFkL2FbHmoMnMrLjUzQu+bB0XnOeANMSwP+oR4OKC2tPaTqf7A3H
         YA0DdgxlRZC1XKjyNs61Iugo5/BvY1pfKo6uauAvfS/a1o+Swp86XAz4WQu7FRvyXxEO
         jnvg==
X-Forwarded-Encrypted: i=1; AKwUvBzAzOqq7qelLm9viJCg+V8Lk05MHEkD9pxEjDYkwf24nqFxPGVfN+tdgh7uisGt445o2dmqFh2GgT9Tdzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VVJuofPDd/HtcXR5K75/aY3ajLDLwb31cs3kUUY5KoGTC4pr0
	kVWbS1vRItvsWYUCLY74WDa3N6b86/LbGOHbJDC5NV0fUe8rAZ5tuxYd
X-Gm-Gg: AYBFou3AJ+gIC3sFf9J4LJethmsx6c6BQrS99dinKGpHH/hGDWAY6yAZAwgrdzKx/cf
	/9r6ZFoJZNkRFqEoTu5GNyhFet0EPYd2a3VIxgaOUKMo9wa2xZ6diskh0ZuTjBL9p+5/zfCBEsn
	NjRpR5UeqriBEH30/5ZbDiDrGdUn1Z3XVmJBvpgrYRmjwfWA6eqUDNDkA6FtqGB5p9nJt7i/zbc
	Bl9ohCZ8Uy/hjaTcU/Gzd7HIp1KVquoFZW57Osoxacncn97F/yTnmwDHpjWgX7EDG3r2EqfbHuN
	3coT2oUePdnGoyV686cLnuhwO5Y16V5E9owPKmXOjo/LtdtykQVmmTbzwynUJOqMV5mcrIXEf23
	klKh4nseDJMPGpg/NXs8VitP+/q2GyBB49s5GZTJGIGOA7rrPE5EHq/iBP99uTqOIPfK7mOoP0O
	MzzzJ7XjeDTWO7WdzfJXwiyOyvN7SoVssjemPT1G2vTuepei+hp54lLe+vx1r0WBPWhlc9UoDwX
	XTf3RYjFcTWprI1ZZ45kIrmzAuHh0b63W2T7SxAV6qr109dYVg3sE0bscOx97rmqketY3RPlgLw
	E/6pe9GGn91C+Tw898WCzSma4prm06G//GqV9/lKLjq249r3+swdv9HAr1EXsJyhDiAS9sWekHN
	LacIGp9mj2YaHCNOBnqdTrKGMRqVdExeRi/5nXDzkfLJH8TtLmFG/yATRnse4E1cgJrj2Rmu3Yb
	DiIQ9h3FdplIhtdHvGkZaM1RSmULxvEWOIaOAK4u5IOQ==
X-Received: by 2002:a05:7300:1897:b0:361:167c:2364 with SMTP id 5a478bee46e88-36a42362348mr33935611eec.8.1793815168526;
        Wed, 04 Nov 2026 09:59:28 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm8945310eec.8.2026.11.04.09.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:59:27 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] iio: proximity: sx9324: reject reserved gain values on read
Date: Wed,  4 Nov 2026 23:29:18 +0530
Message-ID: <20261104175920.207384-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

sx9324_read_gain() is meant to return -EINVAL for the reserved
PROX_CTRL0 gain codes, 0 and 5 to 7. But the range check sits in the
else branch of "if (regval)", where regval is always 0, so codes 5 to 7
are never caught and are reported as gains of 16, 32 and 64, which the
sensor doesn't support and which write_raw() rejects.

Check both reserved ranges before converting the code to a gain.

Fixes: 108e4d4de2b5 ("iio:proximity:sx9324: Fix hardware gain read/write")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Compile-tested only (W=1); I don't have SX9324 hardware.

 drivers/iio/proximity/sx9324.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/proximity/sx9324.c b/drivers/iio/proximity/sx9324.c
index 1c8ba28c030a..95e7315314f8 100644
--- a/drivers/iio/proximity/sx9324.c
+++ b/drivers/iio/proximity/sx9324.c
@@ -404,13 +404,11 @@ static int sx9324_read_gain(struct sx_common_data *data,
 		return ret;
 
 	regval = FIELD_GET(SX9324_REG_PROX_CTRL0_GAIN_MASK, regval);
-	if (regval)
-		regval--;
-	else if (regval == SX9324_REG_PROX_CTRL0_GAIN_RSVD ||
-		 regval > SX9324_REG_PROX_CTRL0_GAIN_8)
+	if (regval == SX9324_REG_PROX_CTRL0_GAIN_RSVD ||
+	    regval > SX9324_REG_PROX_CTRL0_GAIN_8)
 		return -EINVAL;
 
-	*val = 1 << regval;
+	*val = 1 << (regval - 1);
 
 	return IIO_VAL_INT;
 }

base-commit: 340d44bdf9db0f095f99845b5ad8628781d79b6f
-- 
2.53.0

