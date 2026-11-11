Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426686;
	b=AWqR0rFb+fyBwIMH09Tb0JiST06BbQWwuKAgER8At+SdTpoDnfC3nw7HdMHCyF7xSMAW
	 hDJazTF81RTm63cY6Xr3mVwsc8BOUnTV4umo0eZmDU6hB8f6MMqzVt2+/wDqlg2TDWohi
	 aLfJT7WTk37ZPALM/KmvFdMQQjz9bBIfMuZEyi/wL2YisnsKhEq1Tj8DRccV3nNS0uXpx
	 NIaajmXuzrabw67hBufRxRTb6YMjOVwIKonZsCuZZ3e86KowLjn29zXGDLS+0spgwnPUV
	 WYBAOzzCJYot8FOiTKUYi4LK5QSQvCN2TvqyOvqeksVfpADCABvFFhKk/YNi93HeEjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EHqk5x0/CdtJJ9kWtMupw3SjoX3qOmIdHB2cbrSmA1o=;
	b=A3OI9xt/9Y3ipcouw362wxsg3KIX+HXVKB9Miar1Gkuc0SSJNy1PFG3zyD6FlE+eLh3d
	 2/vuBBFh7OzwFik+iuzaFIILFbcs6L0wTFSO17+uTVw4HhQa+8fDdsWKqYoqapFqvD9cw
	 DX4W1Tkl6Bp4dDZc+Cjza/Qyeea5Glg6bx5Zy6xeXUFQhKdV/Z2e7hNqlZO/W6UnF1ABh
	 gjK4IV80wQN48kFG8ch1vfLZdvKVqwk0ONzNejhgl77/14aAv1ILdqWTSwgIttJPgPMJt
	 1EqmVLaNeSGjcVeBoK0TxceCNzS2Sco2F7MfDE3FUNRiLrNido4Yunz2nmCzF09bNYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TTUsavW6;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5EE606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F5EE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TTUsavW6
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so27071961fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794426683; x=1795031483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EHqk5x0/CdtJJ9kWtMupw3SjoX3qOmIdHB2cbrSmA1o=;
        b=TTUsavW6f+bJswyOgz2ua6vEAAfh43q2oOBQvLQ+dTaempbqyL3YYlFGjC1MWfvvFK
         gCeAbR34ULFr1ma9GHqqNk2GHifHebsOeIrfteb8KApcrNXzX6dHu39m4NG1mjQpQy0v
         hNlASEZUsh/EoEfKbFR0fJ5m9r26a6bNMlJ+wDq8ca8oEyArnskGhmChATV16JG56tyH
         2ksn3cEfiMvXC6C2lKeV1mqqQU0hcku2GzY7EolJbh7s+n/JLCjWNC2wp/x6HTZPIZkC
         A3cbQmEmopiUBePR/+ky0bLB4hhdnJlxkQSyXhWceB/9zZw8LDvs4H/FTebWRY/SFIzs
         N2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426683; x=1795031483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EHqk5x0/CdtJJ9kWtMupw3SjoX3qOmIdHB2cbrSmA1o=;
        b=Osic+Q80v3p+Qg+zbZORw7/66T2B52aBqSlhA4sG00mL4lCrhmT2l5V+hcicKbJh4x
         Tsy8C6QfIXLjDo2V4IoU/b5HGTdarZoKQ2Q4ObcAPImxwiB0uVwjHtqKf7HfjeJ5+hkk
         jajAe42pPfJm43ZgyalJWwJmf6n6Kc3hEHxHR+7PSuMPs6erBEQI2bbBuprNZZC5Dkl/
         1JDSsBj0Ydr9ykHZcpWnpMYD3qwmoinUNbI74/awgoXno8E0Hcw9FeFYTaGtDfLEVOsB
         CFICO5wylYgk6Tl1vJfP7OD+cuLxybBTkCNztPDnX1nR0HS6jthowDKPWF65cRPUwh62
         G0Yg==
X-Forwarded-Encrypted: i=1; AL+hErFg1zwC9e9X3LfrMHLUpVJTZK5gMcVQ56BMNlF1WJMtVW7RAlTr1fdP4EKWl05PoRVXguseiaZHGmhCURg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uguXKumJJAWkJIEsNwrBprTneyvrDUGCSPvFQud0yddzkQnWr
	I2mo8xv0Fk1+QdgmfTkWEuCBgrS8xetOAbMBpi/0fp/Vd+ByPSnQXVaL
X-Gm-Gg: AYBFou04hlWpm5EBLlOLtvXstfRLZ1M9Ke/+qhmIaCF6sYKCOmqBTxXATk2SeM7pSfP
	VN05s64rU7n1i4oMH0+9+VCD+gZbVaUbmklW6YQvr8A2q4zZQCpMfqzH33Wbqz3rPImsIU+KO51
	DskedjtS/c4NWFfZNXg4T+F7i9RiqnyNQCBljZnZTNPEQFjkHn0X2qcGVF82cjlEzXc12In2XUk
	JRclXf4JptFD4ECjYyQu98mxR06DzrGzTW3LlWDk73nNYRRPRypiS/iiRdG+me5TCAOht7z0DR2
	BgvPq1qBWk7dJHNlDd33GtEtA9sTFNzeD4qo3OQfaGUlH1rSjweQUpDPQRcZnN7/j7Um+COqNhi
	w4fjoGn4/7EtRId1/ZgNX1NyvUQi2lNkJb8QuFhX6KfG4ohh/Flkw6d3dQQA5ctqYjIOulXOh0q
	iVN8Xo70Z0OB90T1K8M0+XHniQ1Hsf9Fh6it4BP9iyKWcR0f461jQdwHxnCMgcr82HfL+lBQp+/
	HOD9DtV1QdbMOlwdKkABisad+z8wlA1Icp21D05i5+Hdx2s3eIq7+IOZrhJQkGk9KRQAoD8iRmY
	+EdEWra8Sb+7P4joRzmPnDMEd46hqD81KC1dV1kceUyuWEsA4WoInMfv0sbebFIHtiK+6e7AtY7
	H5bVpaOvBnbw/lJi+KdRmTd2MENq6/WPezZQD
X-Received: by 2002:a05:651c:146f:b0:3ab:3bf3:1604 with SMTP id 38308e7fff4ca-3ae126bac4bmr7165201fa.26.1794426683005;
        Wed, 11 Nov 2026 11:51:23 -0800 (PST)
Received: from yantra.. (nekmmqtce067ylb1za0-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:5558:447:baa4:a7d8])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae091739edsm13147341fa.1.2026.11.11.11.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:51:21 -0800 (PST)
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
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] iio: pressure: dps310: don't wait for new temperature in trigger handler
Date: Wed, 11 Nov 2026 21:51:18 +0200
Message-ID: <20261111195118.36853-1-zoone.rupert@gmail.com>
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
not in the scan.

Fixes: 9b7cad9ce2ed ("iio: pressure: dps310: add triggered buffer support")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20261110154254.39092-1-zoone.rupert%40gmail.com
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/iio/pressure/dps310.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 85df58ac1809..c4d779f8bbc6 100644
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

base-commit: 79c8dffd84e9784ec05bea68dbe5e71f7ec9941a
-- 
2.43.0

