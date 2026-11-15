Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794709265;
	b=HJ2WHI2ghIiLYcw5k7hFh+OsYj+MwCuhOKt98Tv+kqWHoJ4r0yk2bWkw/UqAYA2gHFHM
	 ZPXJiNv+E+qe8Da0Jj1URr0kdAKDB+njw0/ksSlf0Pnl+sF1IY70KkHGkQTEEWivyDnxr
	 oPv7uk8r0Cn/wV5gPrS0I5LX8uvfzTm8hsynV9A0uCOhAbmA8M6puhesJF6jaYQphI+CQ
	 2jMAh6XveVvXRXFNJHqqAHpc1xOKi3zFL8sQHiIEpnpVD7wiojNH0OEYvA06rC489kBXU
	 PeQ2EaluNLer6E5pdzfClHUOzBzlRBSQ5b7nDmMJFpr3PkTyEl0m5ZPwzI/q4xgokcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HGWZVbmBOvvdDb5n3MKP7TgXPcoDYYBkGOcK1pQmOjA=;
	b=byArf/01Alphz1jZ85JHOiYpI+l0aH7wtwR7nV+opR50nA5u4rnAAeL8psTOymXLg42r
	 c8PPcTANXiMhE5ELb2fuX28ttqUYu2dkwNIbwwMAfSE0VGM0KiImNlFKNHUPYZmejdDFQ
	 REM9ICEapXL+LMoFbDrcT0GkUUngUCUZkV0ZJ1zwkZxWd/tzZ2CvS4lGTmxNnCq90MIn3
	 Qq02XUjcLsNWGwKKoUNbSR5ULNaVPGaJ4QO73SXrblVjJ3ria2X/IFpZtrkaloFm9hFGp
	 WQH0HdjhFQY6GkFEf2MpkTG3Qi9XdjX8CuXS1Z0d3OgzEwzvZVhifqwt18U64tEn6sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vrzMUI6X;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A4C606A329
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31A4C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vrzMUI6X
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a8cc11ac42so2065158c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794709264; x=1795314064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HGWZVbmBOvvdDb5n3MKP7TgXPcoDYYBkGOcK1pQmOjA=;
        b=vrzMUI6XZUJdPha2FaQ6yhZRQq7aLNBeJbPoba/eLCIu+GvTD9bfrCCOeVtZCC1/Wz
         hAo/abz9YDyxeVEczm7hmC8GDR3nibAMLCnX4NsPcXmrJJjhlnpnKgC6Q7Tea7RsZaR2
         hv94aGsCbSOnWhiIHEB7aSVCMm2k1/tCDBXFvLBCVnwngN08n1IT9bUpzbVUFxXzpYpS
         n9oxJraOEHVOXOlOEpwWzkoc2xvaYv7BSO0b1Rn/aVTTaGxYXVfHwbT/baKBWDkDEe4z
         bd/C1WZiGpK0h98iu8F+seFc5QMCxXQ55ZwbLAO0bSEHtIAFB4nytTZzFcd6Cn9mlSlg
         YtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709264; x=1795314064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGWZVbmBOvvdDb5n3MKP7TgXPcoDYYBkGOcK1pQmOjA=;
        b=TXl7meUlNPozX9JWVGLV9ssMJz6FDfMs9rXDCQvI1aQpIrP3vbSE5pax130dCWVTw/
         +wZ3rlaqh79LDEvUG320tGTdcFDFTHcths6GNCChYO9CMkHqGt+9in3PN8vgIcdlWEiB
         uMHIo6prjgEEmqiREj13lSTIOn5scHNKFhA/m0jckslNwlRIt596BnT2gHVRTSNNWnkg
         DBq1w7STgkDnMKfb5sLxrXMlIVpnlL26ajngrIBkjY1YMHTn8dOhLkX5kd6wizYtGhpU
         mN657l3NNa+jrsl8XCDgcOcoCHlye4y/w25iVV8jXpMuLao3mEaqQW+r6LzumHNFQCmS
         cMEg==
X-Forwarded-Encrypted: i=1; AL+hErHHweSXdNvvlWDu//ObzedA/Nz7gIdQ8cX/vhr7T/pFS+Pnn4vsLQj93Y1L2HsgyKrtnAYJmUrWIr7gky0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JVBlbya3IRaTEqv5MUeUwnIF72VeN1dGr5UfGUuoWbRtdn8ud
	4GRh84AJ+3kJKtbGEDaxQdGeOiq6ueXPLL4iO/2PKmVEz9oHUj9DRPMg
X-Gm-Gg: AYBFou2HR0vyOHBuflL3zlnwP4OAzMvw9aSh9PnIkthn+1qcFkngqcXa5UwEIy6kMye
	+CT6JnwjjdhyI/SgBWVRQtTj4EOaFkiins+KFXpT1tbHak5sBLmDfFfEQKLquFrmkRbwD9kLwAF
	J1jPcECdCvZXCXZpnKO60IboQI2fiTA79rfU06t0SOPjoGGQpa7SITqInasjqvnBAJIormnka3z
	eeVGFwlp9Wk+bTF1tB/zCBapwt/BXJlk0dYRb9PA3Lb2z59Ngo4jxaFzAS68EXGhdC11Bi15d9x
	TJq9E94VnabUzb2q9J+R/wTGM9Yi1Q7j+8kPMyN9ifb0SR7adjyieMUzOQ7sntGC1NtUA2VNGpl
	REwVK/2LxchpVqdxcnAyhzSIf3DYt+vw0RyeCHrQDwEXtkLtBVVxtNhZfp3/mTth6B3esYX5uCi
	F96tGCK6SmHHzobxyU+CaQWaHeMDwpJ51wrvO1Amf00vw3nHEsmKYMEXNUQ3fK5GptdfMOr8V06
	mVgJ+gK2HNdHlHBK/uHcCOnrzbnYDh8WOIXGbcR8gbdVqElgLErTPvL1tg4CBoXawg3sudbWPzg
	spULgu1r5zOlPXttT545H/w7bdeKo8DGjJS7QdXe6cngCiJT6tVkqVgTh1rYZBEH53rrMNc4o3b
	NJFyL
X-Received: by 2002:a05:701b:4587:b0:1b2:6844:25c9 with SMTP id a92af1059eb24-1b5030613dbmr6429373c88.3.1794709263990;
        Sat, 14 Nov 2026 18:21:03 -0800 (PST)
Received: from kdev ([131.179.133.114])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm30318498c88.3.2026.11.14.18.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 18:21:03 -0800 (PST)
From: Niloy Meharchandani <niloymeharchandani@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niloy Meharchandani <niloymeharchandani@gmail.com>
Subject: [PATCH] hwmon: (pmbus/xdp710) Use dev_err_probe()
Date: Sat, 14 Nov 2026 18:20:53 -0800
Message-ID: <20261115022053.32321-1-niloymeharchandani@gmail.com>
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

Use dev_err_probe() in xdp710_probe() instead of dev_err() followed by
returning the error. This simplifies the error paths and prints the error
code in symbolic form.

No functional change intended. Compile-tested only.

Signed-off-by: Niloy Meharchandani <niloymeharchandani@gmail.com>
---
 drivers/hwmon/pmbus/xdp710.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/pmbus/xdp710.c b/drivers/hwmon/pmbus/xdp710.c
index 494dbe45ebc6..34c6cefbfc13 100644
--- a/drivers/hwmon/pmbus/xdp710.c
+++ b/drivers/hwmon/pmbus/xdp710.c
@@ -71,24 +71,18 @@ static int xdp710_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	ret = i2c_smbus_read_word_data(client, XDP710_CS_RNG);
-	if (ret < 0) {
-		dev_err(&client->dev, "Can't get CS_RNG");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret, "Can't get CS_RNG\n");
 	cs_rng = (ret >> 6) & GENMASK(1, 0);
 
 	ret = i2c_smbus_read_word_data(client, XDP710_V_SNS_CFG);
-	if (ret < 0) {
-		dev_err(&client->dev, "Can't get V_SNS_CFG");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret, "Can't get V_SNS_CFG\n");
 	vtlm_rng = ret & GENMASK(1, 0);
 
 	ret = i2c_smbus_read_word_data(client, XDP710_REG_CFG);
-	if (ret < 0) {
-		dev_err(&client->dev, "Can't get REG_CFG");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret, "Can't get REG_CFG\n");
 	ret &= GENMASK(5, 0);
 	rsense = micro_ohm_rsense[ret];
 
-- 
2.53.0

