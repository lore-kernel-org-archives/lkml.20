Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897592;
	b=qssd+Nb1YMge1tXYxdKjnIcZ1UnauHJiaVlwYBreKiw987GzTDsy/WXxGNtUrEqTw7HB
	 8gGo++KMBX6aoDe4J273vLz+93sot0t9v8ihpOWKGif/cvunh9Zel6m2ACMdzHCq2Lk7l
	 30bsahAV8FgIbbOa9yXHPvUQJHS7pxTh9nSGug+DbvGBJE7IztIaQ8LyjlA8aAnrWKh5I
	 em9Dk2F+ZdYglL0aH/lUnbTlGGD/VNSOXgtko06nDC9qcAOrZVK0c1EYkic0IpUaw4NYS
	 pbcuMScklyQ+1M6pTxFNs2g9momeN5KerYTAa3j14Zym9evwkGhpex/pH/3uLz2Zu4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yLFtKfRKUa5NMVUposjY6SESfjzfDXCtgm5eFydYkqY=;
	b=Q1h9QhdVf/Sh0BbTrIKet8STrVTrcsbQcvHqPoLmy7o1ZzQX/LNWlir1d3ef4n1YrOY1
	 bCUZwQdlcG69YqOeQIgcbc1abe1vd/Hqm5ytZ3kPLLcn3rmNZ/9nbI0to6yS+jlWkPAcZ
	 v1r3qArVc7TEgCkqITubzZ4H1KRH+1d0moyBOHDfJ+9oECGCHQ1jNOlI8lLs7TM1qGj1D
	 Xa/shXsCep+ShRpwgJoiiCuEHWe7vL0UOP3xqMGdwh6c6+Azz37F9vpJ8j8V6c0gFylH6
	 ev8eFVQ1+NrLsyuXjj5fuAQuSfyUelJvVa8l718VMMNXViiv0pmhJsr85A0V/Yz8aRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ClBqXB9M;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D6360A3830
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1D6360A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ClBqXB9M
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3879167eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897591; x=1793502391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLFtKfRKUa5NMVUposjY6SESfjzfDXCtgm5eFydYkqY=;
        b=ClBqXB9MYBWkO6TVr6UmKBsGVwvf31Kg0xY5fWInnmrJu/uJwCUPmzJSSraHZSYoSd
         iZTfSuw8TvrVWYsV999KJIykHgd3SbNEi+wt9JPT+tGNgH6ISLPkvSFiD2KWtqblZ7vE
         l7L2zFmlIIFCBClJ11z4jFdM1aSG4dAk0LpiHpdLbAFOMji18ncNGrtduR6Sq31f2Cza
         e6VtzqITOOBiF8WL4rzW4jvcjEkDY7Nr37NW8mIdO6uBsmrUV1lfDj4fgPcCZhTMhLLC
         zHPcKRQcbu9HfIE9Pjby4AVDK+S59vsnai/FuhJcAip/0Hk78QvSqWJwnk0XRTRteOAl
         wjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897591; x=1793502391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLFtKfRKUa5NMVUposjY6SESfjzfDXCtgm5eFydYkqY=;
        b=nHJkcmmwwFSUKzbZ2sErrBSBc0OX9vvLrVAonAQI5TGOsqgKNCTAexl5QrKPVRDgep
         L8+RRz5eCaErWovN3YSQmUY06mSsafz4AjRHvyVbjtt2YyB22s5jvqtj4g4Ju3fngL5m
         TQY6x9daZoX0GNHjQT/Da0Ro8k7RVgucx7z1vs25qpr1TvdnA1eEmmqq4Hu6dRet7VtN
         KPE/rGviWAsDztcJbCACU91xVhfsIXcjPhnusaPWjnyq+20DUJVDcWG0HnWkkzJUDy+O
         20/8vs8exws1swT+ZD3RXeGVLlOSZ6C3Hc+ZU2lDJSxWxpnpWc6aeeJUht/+N2rScnbE
         fYWg==
X-Forwarded-Encrypted: i=1; AKwUvBxt4nAGWznsR48KzuHZv8V6Gy6ykOD20F7xSz3qIdJ06zxWnpY3dQbIq8hfMEPxl7HYNNIGZUQ4VBKH8G4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKihnV7hcAnhL3A/w5VluYg1ZwpcppvJKBfPexqCoMPW+WZca+Z
	BOSqukGFTdbrD9oPqg6txEYbKD4BXTy17yxS0xSXS+UGQbNG/iOfhYx7
X-Gm-Gg: AYBFou1HI77PlSKF1NR6geYfX9Gb1wzP8FK6u+y1bAFG4kllrYciUdidtu06VwyLo2u
	n30/n5zXJ9wnlU+c19cJGVqRgendiiEmu46/Ct/+YRsmqrOxbP8j13+zgCWR7ayzmRP1Xh6ht1b
	ILbjYXu870ynGthu3k3LfQQ5GP4f52CjEZQU/x2G1Fp6KKKUSb0b5lQUBB7LSGDIbW0MfC4eMTf
	GQm7iwurlUiAfVWlGzK5VL9XOnCbtRRbRWBFYRlTXbjTjtvxjOwXILF1ZUoMw0qKwvTzBQ0FK6u
	ae3XjtlXnnAlVHgkalTsFTvkUC0nQdAsOcsuw5Gvu6MfkcthZ5OyJDj434OIiZ75NuLz/eMSmYG
	XVDnaUghoTxumSZCyZzFPJWK0iHMJd3ve5XQxvE2yS1dWnWpsWDIP9KNJJRNyqwWc1cZ3TpB6Ks
	5Hg4D6+nusyj7f5x9tI1m4lk+yv/OAkqIuCo1TJAZ2IS/+b8uuq8iiODL0+AABHdHGXNnLJojUh
	s62mxLN+nSYc7hY57z2zwAvXoUpitV4hCHrNSf5egm0tEvonNSGhcP6SbMIgW3i3SbdJ5/oN8OU
	4lT938JCY+EDEKuAFToEcwqDTpd59TqU2OmMJ68SaEk=
X-Received: by 2002:a05:693c:41ce:10b0:369:e8fa:62e6 with SMTP id 5a478bee46e88-369e8fa6628mr4607131eec.13.1792897590943;
        Sat, 24 Oct 2026 20:06:30 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:30 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:19 -0700
Subject: [PATCH 16/31] hwmon: (pmbus/lt7182s) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-16-e81941ad0cd3@gmail.com>
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

Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() in lt7182s_probe()
to leave space for the NUL terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/lt7182s.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/lt7182s.c b/drivers/hwmon/pmbus/lt7182s.c
index f8971a786f25..62e180dd5dbf 100644
--- a/drivers/hwmon/pmbus/lt7182s.c
+++ b/drivers/hwmon/pmbus/lt7182s.c
@@ -113,7 +113,8 @@ static int lt7182s_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_READ_BLOCK_DATA))
 		return -ENODEV;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read PMBUS_MFR_ID\n");
 		return ret;
@@ -124,7 +125,8 @@ static int lt7182s_probe(struct i2c_client *client)
 		return -ENODEV;
 	}
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
+					sizeof(buf) - 1, buf);
 	if (ret < 0) {
 		dev_err(dev, "Failed to read PMBUS_MFR_MODEL\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog

