Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794610969;
	b=emLMBzo6v+ra7hLJTy6x1KVS9w4AmNcRa4t3Q7ensK92cfr3/11NOKdcWPM+dM8bU7dI
	 usvM0UXu3K4MctlYdqEf4UsQB17GXPvNa7hrucOgJBtPMaFmAaUTRlBtKlKSbrhLgK9ro
	 YYv6M5WZZ6KZquV+0CQwtUw2W9yri9GTv0k/fqp65ehb6vO5zbn4NbXREnSJesIuVMo7Q
	 1KcabQsCe6b4uI6z1FRriRABoOH87MdFYt8daVkNufKwR3jyFa4S//9mHH9aOJ4p4yYvX
	 PC5pjGo04TRMph+UtYSvQa9C4Da+cyqmAZKLI6N7tIoAEwTaUb26uUbp7QlkvaDab2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794610969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=75A5kNao/8hiq8uHxtP1L7BaRjFLXZ5Ia6WGhmfWzYs=;
	b=WJK/jULgaVGh1Xo4Tp4MfKl48+GChkQd7QBIZcBqgTwmz8Ns3+24io3BdF2IPzz7Bjoo
	 M/MXm1V/vy9aVjCMTwLkySp6c46uZBc/ZtiPXqa1z9mZiunepy4NyvpOjTprwzRsJZLey
	 b92qWWbHkh7eyEqY7rG7vGs0kiu97Lh0phQqS9KinsThNvHCXDC6pcEbk1Nvg/Fgtb/AX
	 Qb63Im1IkSzK1hep4vYWdi8TdHYWO/+v9uLiDUjx/d6dN0yUNpZsnWedTL3JhR4Wt7uhf
	 zHaXWGaJ20vpPpXvWYw6KkdffnTsYLOr1mnvUzVxWuVJAThdRutEgptrY2znncYBh+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H8hPk4bq;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4B9606A339
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A4B9606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H8hPk4bq
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab46699a09so19580451fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794610967; x=1795215767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=75A5kNao/8hiq8uHxtP1L7BaRjFLXZ5Ia6WGhmfWzYs=;
        b=H8hPk4bqqv2uzLN1+SwOiPXsjRSVw7VvBDQlpXBb7s8jZwnJYk1tKzdVd8x2K9ShTu
         3JIFR9A1ZBBCmclZpa6i022vPlUfg9EHk9C2iMTA82vWp+vL9owY4HDLmH25x4Fv7TaN
         FNUPiRml4Igung9MUgW4ce212oks1b+VXUIb2MjRAphfdjamySyo1AHmHVRQrRw79uR6
         HIJduxqVE0a0+K54sXswycvlGEbLSDAl8z3ZMVsyWZSHggW2MVhLCXiHCAU3l8hMu+8R
         kOFo4JYnByClHAYoyL+COGXEuOxpMsp2/cQQF7F5LUlX7O890yioIMvLzPnpwHxpyU6O
         Cj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794610967; x=1795215767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75A5kNao/8hiq8uHxtP1L7BaRjFLXZ5Ia6WGhmfWzYs=;
        b=wANVgn1E8lkSsjje98nG44D57yOP65qVDkGfiupArlbPMRJEDr1eLms29Fi8JhdERF
         Nnutaws9hjLpDkes/US/OojA3+700Amx27/7BcCdkkvyLuSs6RK2aGO3mHbeNNrCIXNx
         wu3AbF5pztAbugCeGU2M+OJWxqpVScutHqvtB3fcFInhqv7qW0C8gA8oBuAv7Ht2OclJ
         14s00Vzilvbqihd4f13l64a6UD7/XE2E59N6OqU/aemytdu4atBjU0PJI+8VK4QSXrZZ
         E5zKU+MzgZ2iMTC7IGBjNCibEH91Y6IiB54qUbevBum9ZVMEfjfJy84BKQK2UsPgb0hY
         iL7g==
X-Forwarded-Encrypted: i=1; AL+hErFQqNqR/W81mx6cfcSurx0v6EAg96CJNJbqDzMjyyDt09ELkn6ZqjYuU/LcXI+lbS7q/9bOakP//XJrZhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xPWYFCJnXoHG2BM9ajywRlnTwx1Ac3HSqa8X3+zmgDHYxtGV0
	iLz3AOhQw7LcLutVzOM/0EGDrN8sTSUfXy2O4kunepsxWb9QnXwe4CUP
X-Gm-Gg: AYBFou2KbohxrNwYejAKEXM9fTLPHHEWZvipaXdmWVnquI/vYfHbDJpeOUs53dFf4Fb
	RaXrmpO/Qg1Gn06RCVBoS69EHN1h9MRrLN7Ue87cMcbwJiDglLmeGe4fJbtT7/2GvripWRijRiv
	uUMgtOpQ9z77vO62LFRpjDJ4gMMFFXgSIWdIa3x9HuySkgtHN5ee1xbh+kPjTgAmZg6dpS8pTlA
	+zjSl3raJmrMNDsZu8ge7EcSeCWp+3PsKSgE8HsjoTVab49aaENiGF2T6oYFIxgNIbWmOQHiCtS
	H+9V/D0wxsmxTRNAwDLLY2q36ptoe+SQSRiC52FdyutlTfR7cscuejwIvAgZNoOD8cH3SgvgFER
	y/MuIkronNf5fsPZzWTY12EEq3Ghi3IvMW1auO3skphtqEbZcM8a3lQd1GZkEcQdoQFM9V1J9eE
	5kpaZTgloDZWhvOo1QXGjHvzLO0Ah5igtbs4K7c3PlgaeiMSHX5h6Wyc9UQ+7uFQVA9yhiqgYqm
	cRcXJVgXe/Ms1uHi4HOAD5iDA54bpEAbT4YIS/m7D7GSLx7Gfjbuc7UP4cVCpP/Zqd5uPGJjUve
	glpbnDkSrxk5yyuDeJPRuhRFpxa3APKNOV88NTJdB6lAbAtfVy3bSLaKWvd/6ZLhZNASJqE4K6h
	kWtw7fMW5zvK+ML5hOQygFQzOBChdBnKp1hkBlQ==
X-Received: by 2002:a2e:a105:0:b0:3a9:a1ed:634a with SMTP id 38308e7fff4ca-3ae2b5223dbmr12343971fa.21.1794610967171;
        Fri, 13 Nov 2026 15:02:47 -0800 (PST)
Received: from yantra.. (nekmmqsrubyk7w1qlch-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:2fd0:3310:f4e5:7f91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7e62e6sm11752691fa.38.2026.11.13.15.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:02:45 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v2] iio: pressure: dps310: don't wait for new temperature in trigger handler
Date: Sat, 14 Nov 2026 01:02:41 +0200
Message-ID: <20261113230241.82046-1-zoone.rupert@gmail.com>
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

Each scan waits for a new temperature result before reading pressure.
With pressure sampled faster than temperature, scans then come at the
temperature rate: an 8 Hz trigger with temperature at its default 1 Hz
gives one scan a second.

Read pressure first and take the latest temperature, as a direct
pressure read already does. Wait for temperature only when pressure is
not in the scan. Read a temperature in probe, so there is a latest one
from the first scan on.

Fixes: 9b7cad9ce2ed ("iio: pressure: dps310: add triggered buffer support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20261110154254.39092-1-zoone.rupert%40gmail.com
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
v2: read a temperature in probe, so the first scans have one (Arnav Kapoor)
v1: https://lore.kernel.org/linux-iio/20261111195118.36853-1-zoone.rupert@gmail.com/

Cc: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

 drivers/iio/pressure/dps310.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 85df58ac1809..3d05540f95dd 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -910,10 +910,18 @@ static int dps310_fill_channels(struct dps310_data *data,
 	unsigned int i;
 	int rc;
 
-	/* Compensation needs a temperature, so it is sampled either way */
-	rc = dps310_read_temp_raw_locked(data);
-	if (rc)
-		return rc;
+	if (test_bit(DPS310_SCAN_PRESSURE, scan_mask)) {
+		rc = dps310_read_pres_raw_locked(data);
+		if (rc)
+			return rc;
+
+		/* Waiting here would hold scans to the temperature rate */
+		dps310_refresh_temp_locked(data);
+	} else {
+		rc = dps310_read_temp_raw_locked(data);
+		if (rc)
+			return rc;
+	}
 
 	i = 0;
 	if (test_bit(DPS310_SCAN_TEMP, scan_mask)) {
@@ -924,10 +932,6 @@ static int dps310_fill_channels(struct dps310_data *data,
 	}
 
 	if (test_bit(DPS310_SCAN_PRESSURE, scan_mask)) {
-		rc = dps310_read_pres_raw_locked(data);
-		if (rc)
-			return rc;
-
 		/* Pascals, see the channel definition */
 		rc = dps310_calculate_pressure(data, &channels[i++]);
 		if (rc)
@@ -1017,6 +1021,12 @@ static int dps310_probe(struct i2c_client *client)
 	if (rc)
 		return rc;
 
+	/* Pressure compensation needs a temperature from the start */
+	scoped_guard(mutex, &data->lock)
+		rc = dps310_read_temp_raw_locked(data);
+	if (rc)
+		return rc;
+
 	/*
 	 * The device measures continuously in background mode, so a capture is
 	 * just a read of the latest results. The trigger is not aligned with

base-commit: 9752760146e642f3e4a2ec860f8767fa72030d2c
-- 
2.43.0

