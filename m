Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897588;
	b=1VbnU6Z0hc+eRaMahrx3vs4i7ResnoKbOxjbCUyZeUp1uGRPn98w3ZMAqWi9p1fDK2pa
	 khQJv5w0XtrJzlFLt+f5FeM+MwILWnXMXUaX1vcr++ArFopT3jUTTLnLjXTF8ljujflve
	 FGtrk4RLwgaBrKBGLSxvUYeawbpfmZIelazQjuhjjpBCHMhU5StFGUJeoq/MiQ7J+4wV9
	 dQLNyRjkCWvwFQsjG/8Zea6vGOn4Xg8lI8c+ZIzsfBXgI1s2vyXoPW82yJHPJvI8OcPno
	 LT+6Dqpew6VAT8PSklpub2tbeI7QpqtNReokEBbGsleDSdxDV5ZfF8wYNeKl1SNxzVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=cNYb7L6nBRyXL9IRJL61NCA6VNcXvfAiZugsg1CTZ98=;
	b=lvnVogb4c7qnG5HBT2wCIxtJfImcxcX8LAPvZXmhp9L2rpLV6TE05FmROdh8Lu15BUuQ
	 CDa9Zv3R4hkqB/f6wTBuY35U7qOaoGjP0qvRUFpjfP4jI0qJmLXnf2D9C0KjDwQJyE4FB
	 ysPsbsh5v3YZRWacmGFsZ+grCN/8rF8/u6Esl1w/SnzD7TcogfnwFd/FKVISvuPdmAYBE
	 oFa3Qb6vSw0EZd3fjif8IUEJwKEMOB3kxweGEbqI8DF5vQVB2kvVcDujJFcd6PbI+7QI3
	 jy+LFC3xn/Wf6GlLPrwP5IMD2/BMk5z3cuPZcdS7qg8UhLDVInPjx088C/GHDjjbIfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b8dLojR+;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C094B60A5BC5
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C094B60A5BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b8dLojR+
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so3257083eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897587; x=1793502387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cNYb7L6nBRyXL9IRJL61NCA6VNcXvfAiZugsg1CTZ98=;
        b=b8dLojR+pOdlpMu/3WwrWDgf0Ht74MCQHYSWbqOM2oefsKqAtTYIXkxVswucsEDdAr
         rW22Eo2oEiFygEI4yWesWWiqwpyR4BgaHmqdlTQlgeqABhNMCEvn7dSSi1Hz46lsrLgK
         cjQFIN4gFJCDURfGg2CYRFLrdCFwIFaobhKA216vkHTpqGUilLizMjvgINMIr7vyucEd
         McEzpUaYYYvD6ocAdSF85uF+4yle7RQk88F+byqcF4YP75iJ6jE9tYA7MTo1EbsOj8Aw
         s3bD7LdnOhPwTrD3U/6/gFSi1ItgqcLsz0fUbFOoe2AKYQg5rKgJCG8qFEloW2FT2229
         RO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897587; x=1793502387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cNYb7L6nBRyXL9IRJL61NCA6VNcXvfAiZugsg1CTZ98=;
        b=ugbde7F++cMZsk3i2J2bpGLsbowwbewmJMctjzXzpqUMFmpRilnssA2tALavi5QPzk
         WvRqPdSypaRFrRdQmlcrYh+SqmmctMa6JpSILo/WSJB8486sHS7j9CMcMpL+c9Em0Tn6
         ktGEe0SAIK/R9ywCQE7H5l71EVtVszKvnIfUkOEeAucsRMD5Jvs6aZzFsv4b3XWxJkWF
         gW5D46TaonVE9aP8VBVoQbFW62HP6zB5LHGRPvKlaDxhV/dEikBJE4ec1DTlH2dbQMpC
         ixItAlKsFyienBVFJ9f2kExJUcxkS6AejWcRjiqLkQa2rfd+5BZ6qRCN7GUVvGYoJS8i
         Y4sA==
X-Forwarded-Encrypted: i=1; AKwUvBwqb+qYQ3goLcE8rNSzIx6F1axHw3+qw9K+bOxxb4ozMm3Wl09Zj5hZITCnvVEg7c2/2oGmgE2tFa6jKf8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2LB9K8TyK0Z4Ou8DFJ5bWZ5lYhVsM4MDtt/4OxIcFZtP4r3Hl
	dYp6g5lTqRvkwZVgsg3NgQELiueluQi7AHqWY3r4/8hq7UZmtOOhxzUl
X-Gm-Gg: AYBFou30UIU48pTxTjEuADnQOaULwItRT+aK4jGYkO5CUk1z371isHS3+bs29w4RqlQ
	iIPBVE2SlLP3sLXpBYwFjnjZV5DFueRkzrHdX3zsABnXMoJm9ZqjT7D+K7mcu3Euaq/2BpdFrjU
	D+b4wN3+NALcWbA4rRhHzpoXY+/HoRrOFDlHgPQlKzS4atkeEoigtfixrNRtG6d0mBAZWoxoLxH
	aINYxYIIg8oEgFbuCsGzciE06yWKeqJ7c7jpw4i08IdPDzXDHN3L9VfiXI4Z9fChD7UHSFGY2E9
	zJQDoMo8WGhiuyj4P4ItxI+zuBIUPyauRedCSAiGYsXCA50AL33ojXewi23ETXaUlhn5nNQbose
	5kpsy+ULzcX4Pn5/e/vSh9RUqY/0LP4RaYRJ0ImG1nwa+up/W+WNV27CFvqvEABx9g/mq91tMUO
	RIzk+2q9bX1jI0sf5qIvl9NRh+crJxnChXJVUCGkDJnezS6ZmWeN+9g92ua4u8kY2vhQHPZ4/28
	h7Ezts7Boz4UGASDc7dR8/iHcE/13etk2XKgM4TAvpsExDUbLmoQ9RKHccEtmegbmlaZkrQxEFG
	fv9dB57FBh/S9Rh4m86lSJIbOBcQlk76XV+yxz9lW6s=
X-Received: by 2002:a05:693c:83cf:10b0:367:941:c253 with SMTP id 5a478bee46e88-369e848b8b2mr5726339eec.11.1792897586831;
        Sat, 24 Oct 2026 20:06:26 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:26 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:16 -0700
Subject: [PATCH 13/31] hwmon: (pmbus/ibm-cffps) use 4-argument
 i2c_smbus_read_block_data()
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-13-e81941ad0cd3@gmail.com>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>, 
 Ninad Palsule <ninad@linux.ibm.com>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>, 
 Daniel Nilsson <daniel.nilsson@flex.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Pass the buffer capacity reserving space for a trailing NUL byte to
i2c_smbus_read_block_data(), and shrink the manufacturer ID buffer
to I2C_SMBUS_BLOCK_MAX + 1.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/ibm-cffps.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index 2498c6f4778e..adf4b7925771 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -490,14 +490,15 @@ static int ibm_cffps_probe(struct i2c_client *client)
 		u16 ccin_revision = 0;
 		u16 ccin_version = CFFPS_CCIN_VERSION_1;
 		int ccin = i2c_smbus_read_word_swapped(client, CFFPS_CCIN_CMD);
-		char mfg_id[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
+		char mfg_id[I2C_SMBUS_BLOCK_MAX + 1] = { 0 };
 
 		if (ccin > 0) {
 			ccin_revision = FIELD_GET(CFFPS_CCIN_REVISION, ccin);
 			ccin_version = FIELD_GET(CFFPS_CCIN_VERSION, ccin);
 		}
 
-		rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, mfg_id);
+		rc = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+					       sizeof(mfg_id) - 1, mfg_id);
 		if (rc < 0) {
 			dev_err(&client->dev, "Failed to read Manufacturer ID\n");
 			return rc;

-- 
2.56.0.257.gf7497c7d27-goog

