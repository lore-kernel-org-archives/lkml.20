Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897613;
	b=gVwi5D+B4ETmnrwhoUvodTqa1Cyz0RWu03RcOHB6e/v6vQU5bMHTd0PMpmqgCbx1gDNV
	 0c5KedTau4x49fq1+UrtAgsxF+afkyABi3KElxNjycSwaxzEtED0pDI0VRTblkpPE0XgI
	 OHEFt+/KDMMmkhBmq74AkhurpRnbO9wYLFnuGyRRXGm3/nVxsmsBnRbLhn6LMCH7H3KJT
	 dfgg7QOAwHMPtIpo3dUk5qZ26D9CwqXO9chvBw2ffjKRR4YaR0nN8NcQxa+5yM9skeclX
	 Ne72XTRjw6VFUlt8bCVXvSPwZ3BwNKwzotYriM5PsWJV5fiUSI398RmMegEOArLvqYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=voc6EaGMtL6XDakpcVc8NpDiKBkcmvY/g3qI5pC6tz8=;
	b=VHQrB9uqwXUwD+Ih14D2sNgLxk8X3YJp/rRMQBjTwEe/8FHQYJUcjsjE8to0ekrhZXUp
	 Lz7JS5nbPIj+BwGLa0ZgU/0G1M+QZXLdkI+eAM+v9WBTMBt0Io3HGa3P9QSxD3vTb+tXK
	 guEPhgeySc8AYrPN1i/InqcZYrKxplUck4RFzBW1Cw/w+yi8uv/DxHvzz1oNWcFrfYAwA
	 sX9R3wZdWwKp28O/S5CHMUSFFkLOecfeOdDSo5iZFnUcQOErm4KsAbAX1/GbeQ0fPM/A5
	 m9HhoXLC1ydLa9DKRLLcs75Wt97iwxNZNOEWpEPVMhPCRvtzHAsDUy91hGqEgWKeP7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QSwVRTNx;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3E3606B4C0
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F3E3606B4C0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QSwVRTNx
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3879419eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897612; x=1793502412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voc6EaGMtL6XDakpcVc8NpDiKBkcmvY/g3qI5pC6tz8=;
        b=QSwVRTNxOhKtflPMGAGnaTNlTdDebpUBwYhQyfVbslOKYLYiA3e7IMxH0RyEAtyZzP
         sxe9vZKCGftcFHK/G+29Zthm1/heaFh/PQgKrsgQxQmMmiRbEIXkfymlrFPKoAZ8KmEj
         uQv+oNnWXEgzYOwScVtI2gb+9edXSTZHRkgGy5DxoGu1V/ZWwxWOI2EentBQ4uezxIHQ
         RFlsV0q+gkFPqaZ4AMo8s5D3xorQ2yRzII++OnitB6PT+wumiHrTtrJGyQUb0M+//XXh
         LVasCyq4Vos2gWPJj+TcOEGeZEEYkQxvvRycpp8Ht7Ra4MEA+6p5nBuisqBKp73rvjS8
         YD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897612; x=1793502412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voc6EaGMtL6XDakpcVc8NpDiKBkcmvY/g3qI5pC6tz8=;
        b=YNsZnpZpJcWamkJhH5fNJv5Ju5xVdKNqqKAdfvstXeFWqLmZ4f5QkanPGE/JKZOLVa
         J3ggXDeLEN9SDtPIkPBkue2X1igIyFRDbV3Ko1JTE01xLAUwiEblIkFYbDGQVpmh9g7q
         Db/fsl0fe7XmjebBds9BqxLsGwyzqoZ+EZ3sSx1ERZRkRfZ/8lf8jHIktUhvnRIETGiS
         XM57omRU3wiiM0tlNFZ8nthYIcWo4gOwArx8D//y/wukApkFufCK6tju1fwRjZyrzjr0
         3BKkWmlrut7oGNJNiKRE3ypR2PejdWIkJa7l1XXgnU1dgoXmdk+TQzalTw8MPQfmjx4v
         zO5w==
X-Forwarded-Encrypted: i=1; AKwUvBx/PqAh5cdss1YknruqnLcX00wXvMzPzX65yRsXpVPzQ90cDyozKqkBHbL1Ud8Se3TtxKyopwMMksHNAg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnuUmWlTQjTpipSvVyn7fRPTf4zY7IisYoo6/hMIK95kDpddxr
	maIvxWSRZgcGg+q9e6Uw5cXM3orhUiCucBEez4Nc5pVAp6s3+k8/qxWA
X-Gm-Gg: AYBFou1wuKhzgFhW0OM7ZKnaWQ+6TPY1ZfMvIMOEMSTazxUmMSz70i8yZFMyto6QfcR
	BmqD4n+myYwT4j9FcosH/lOQb89xA+ip3WDHQm0UPkuyOi5Cyt1JM2XY9bJCezXhd5EyqKz1z7b
	KRbs+Al5FkRp9QKuzr1a0Jixopfzn0QsqsXVcfk4nGddyhUei+ItM8ZMzdNJJYBZ6j0AMegt/ux
	xpvakuQwHj2zFp32p7fMOQqtkvnWY5V56KAugVMhY7ihHWg7x7VCe15sgmPDwNLHgcpJpmwWftl
	BE4vw8VO+9CyuHyTclpO9aG/e2TpaGefmybFtoGygN2b/9v6dnp09flUReI6ZulL42Q7wb3MYi6
	Y0B0aP9BBCoIatJqWpfuZAkMENRdSfGVVEyQGngrigM9tr1gTOSPO2ccI2lRd95yR/7UJU/l1fQ
	iXO8oS5MoyKjOjmR5HpP460wQrDvA1p69ElPEzV74BctV7eWfG8/O3YUdEG9irD9PuzFa3jt33J
	VUxp8k9KP7fAkV+/iL1t394CfmufeYqPz65apQM2uh6bEk365WCYRBYEHOFj2whULtCsV3JjSVS
	L8vyZ4WqP2SwPjWltsp2OTTzh/x07giNHSpC+1YnxOY=
X-Received: by 2002:a05:693c:83d4:10b0:35f:5591:e40c with SMTP id 5a478bee46e88-369e8612a8cmr4953885eec.22.1792897612351;
        Sat, 24 Oct 2026 20:06:52 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:51 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:34 -0700
Subject: [PATCH 31/31] hwmon: (pmbus/zl6100) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-31-e81941ad0cd3@gmail.com>
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

Pass sizeof(device_id) - 1 to i2c_smbus_read_block_data() in
zl6100_probe() to leave space for the NUL terminator.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/zl6100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/zl6100.c b/drivers/hwmon/pmbus/zl6100.c
index 5db2a7818d16..43f59cfc313f 100644
--- a/drivers/hwmon/pmbus/zl6100.c
+++ b/drivers/hwmon/pmbus/zl6100.c
@@ -290,7 +290,7 @@ static int zl6100_probe(struct i2c_client *client)
 		return -ENODEV;
 
 	ret = i2c_smbus_read_block_data(client, ZL6100_DEVICE_ID,
-					device_id);
+					sizeof(device_id) - 1, device_id);
 	if (ret < 0) {
 		dev_err(&client->dev, "Failed to read device ID\n");
 		return ret;

-- 
2.56.0.257.gf7497c7d27-goog

