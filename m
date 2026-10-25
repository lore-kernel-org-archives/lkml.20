Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897597;
	b=twpvT+iQUANtTaLsb1yWBsXQSte6hsNjTsbFVcw49LluQKD0yTZB+OnvY1NFjmeQdg2C
	 BzYQ36gXZ5OI30HJOJG+qjcX1An6/FtcCrYPT7Txuyur2KYFvBqyhEEJJJ1KD+BQZim9D
	 qff6lgYMpdBWcDhxJxlnP4nAqzTwgNpW7VE1AD6+bUIrxg6XV9p7LkyOt+tLL+OlMFcck
	 MPiMYWcSljoz/n13r6983IFXXyJkMaM2r3tOrBn+Q/DGkqMvuewBucbc67YVm/utZnGHZ
	 vsTNPXn0hy4P23T6hGzzT3vu53jGjnM7OBU01b1InOu9uWiW1ktprMVR4Enb1xkQm9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=XcEMXouPHmD6X44mFYjo0pSbNgHsqZpgxlkl4Rw78hQ=;
	b=xK5LDcvmMHZ6HGehQo4loIVQGNu3EVPyAR1mNryXR3XuwhyCqAGe0GCozjw7XNMzKHJ4
	 +xrPnxxO1gAqWE6OO0zPIsg0KpV2SqROC++1G6GO3A2E5t7RSSA9xMUmzfTENsKruvbK9
	 8PTH0f8MDNpsT6jIfm7IAMNX/LN6Ojj8UTGWN2IWa1SMKm0Z8+PeNSgyLbgnq0keYm3rC
	 ZDbPceQM/lcO83fFuCNpvWYfWT6VgWh+gL9o5jbqahUbFIxMdBf03GM/JA00jKCLm2lJa
	 4/VSqxFdHFGiQ2x/UrXiSqf7MdOyeMHuydK7wpLDNFRu/+z3OFH/LF2blovnPaU/2zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W9Kr6x2E;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C11360A6F76
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C11360A6F76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W9Kr6x2E
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5364242eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897596; x=1793502396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XcEMXouPHmD6X44mFYjo0pSbNgHsqZpgxlkl4Rw78hQ=;
        b=W9Kr6x2EA3FZJOCXb3FnuUllAEerJRmL/k7WjFcKjUM8dwQqbbseG4orE/sg924dDz
         YMavfYTV/SQF/ehrgiysz2oGn9x7ARyj71m4adTEEk1k6tiB95qNrYb+gKnFZANctdMY
         TF7Zr+phehJeF9EkBdixy46aWeydoGEktCnJugx0dN+ooLbVjfu5JgeOLkWB/hMiDExA
         gsh8chyvXvbib1FLlXqcURp0tOhH/LbATyIVc2daglsiixj34s4X+ypE4sStThO/Ob7S
         pYqio12iqYBvNlCcqDKPqg7QUDQHUsmqKDRQNxYT0zi9cRw9ZlSXAfqDbzoemiq1/cXJ
         32cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897596; x=1793502396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XcEMXouPHmD6X44mFYjo0pSbNgHsqZpgxlkl4Rw78hQ=;
        b=hXF0JPcxVpKQFUFLreLApPXuzDIBrty7nnUrI5pYu/lP+WnVWOhswUwkWqrdLCP/5T
         JnEeQFR6yJQtB6lzhUPjqUI5oeRjmlvyMX5Beeco9/bWRnRx6UvP0OttuQX/5VAslOcI
         DrBsGfCwx2cOmLGV4cSIBfg3D2VAcPEm+1kl0HDnAufJfUcq5g5Bgbio7bz6wzyiHjCh
         DBVRqykHK1Dm5U4bOJShOSxLh0Xt39ho+tkqfkQgye37DVpokt07d3lXShNMq7ZZje/C
         N1UJRlkI46Vz9Ldodn92L/wUqUHMuC/pHAO4LdQU98WAJ9MaeIC2JwWGcsokr64lU4vJ
         paEw==
X-Forwarded-Encrypted: i=1; AKwUvBxD2UKvcRkb51A4Z6fGW1Vhcm2BL48CLxww/YWUg3j1huL+As0aEQa19W5O9FALsoWQM4QKj9HgqMXF8NU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3ba7tbxHX1bqssA87NCSEOZQZj2nTfaFiC6ZYdZo1VTGB3iNi
	fU04DVDdiaGNx410GVrSH7JzjjKecZcyua9cna/nir2zVZX97+W9S0g/
X-Gm-Gg: AYBFou2tXX/zDx0B0XYwkUAYJ8PNUHUSBj4Glk9aN1E0/s2lpCvv/aen03AN0DwtDDX
	a7zKkL3kMM3bO4zuG24EA9yF4G84aVFsHvaIx0AS4AA3JZkuv2GjF9iFyGdGc5qeMo0YoRoRVzJ
	KhqeMV//mqFo0DhxiHDoIn24G/3zJ4oWGw+GsKeWkMOf8JKAqwLdwh3K+GBx3cCIXKG66TIYO6n
	EucADGaw/jfxme0O3MVPwLQPI4KkchK8wB373wlIOhq4PmIx9NRp4eVLKDrZmzm/M/YPDahuarC
	9WAIjnQjjbCZR6XY4JtKZH/bXGQvya83rTRChJKUXXJJoAoX+4pIDgVhasrJpJfizbXrDhTfM+F
	Sw5jacsYv3niXpyrsc7XsWAbHmWZsNqeAEMDJwKnCGf8gX+Aj4AinsygWmmxoOjEdhmtZf/ieoN
	itn1OqvY9ke4TqjWTiqeA/mMS3DxZ22lCJrnCd69S8VFR2YH0ssbmWDgr1eboTTTGYR3zs4/xR/
	ZP1+XhrQnJ2NtM47JwdxjMYSlhwXsT9Ia/f6TPB+MiKyRKF9E1cazMMmtTALIaJl+SN3ZeHFmYa
	C94iLnOUye3X56x9yUP/1+O27fNKvwDDW79ty7a6OG8=
X-Received: by 2002:a05:7300:83a5:b0:369:f97f:72c1 with SMTP id 5a478bee46e88-369f97f77dcmr738918eec.36.1792897596419;
        Sat, 24 Oct 2026 20:06:36 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:35 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:23 -0700
Subject: [PATCH 20/31] hwmon: (pmbus/max16601) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-20-e81941ad0cd3@gmail.com>
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

Pass the buffer size to i2c_smbus_read_block_data() and shrink the
temporary buffer in max16601_read_word() to I2C_SMBUS_BLOCK_MAX since
it holds binary data and is never NUL-terminated.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/max16601.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
index 3dd1f6fd003b..3f4e3c24b985 100644
--- a/drivers/hwmon/pmbus/max16601.c
+++ b/drivers/hwmon/pmbus/max16601.c
@@ -73,7 +73,7 @@ static int max16601_read_word(struct i2c_client *client, int page, int phase,
 {
 	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
 	struct max16601_data *data = to_max16601_data(info);
-	u8 buf[I2C_SMBUS_BLOCK_MAX + 1];
+	u8 buf[I2C_SMBUS_BLOCK_MAX];
 	int ret;
 
 	switch (page) {
@@ -90,7 +90,7 @@ static int max16601_read_word(struct i2c_client *client, int page, int phase,
 				return ret;
 			ret = i2c_smbus_read_block_data(client,
 							REG_PHASE_REPORTING,
-							buf);
+							sizeof(buf), buf);
 			if (ret < 0)
 				return ret;
 			if (ret < 6)
@@ -278,7 +278,8 @@ static int max16601_get_id(struct i2c_client *client)
 	enum chips id;
 	int ret;
 
-	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
+	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID,
+					sizeof(buf) - 1, buf);
 	if (ret < 0 || ret < 11)
 		return -ENODEV;
 

-- 
2.56.0.257.gf7497c7d27-goog

