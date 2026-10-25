Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897596;
	b=yIFm7T8Nvr11v8++4d3VR+g1w6Z1x96PGpXZiJACvQhl9wgGJaymEI8B8YTffjlL5NsH
	 l80BUZjYpXLDgXda0v5Csh2pj/+tK9MhUzoqR+M0FEZsjLTFXehgS58oEGFBBfTa3jGiZ
	 RSGsJKfCazh/GjeDA95zS/hROE8BY7Ht0yGIoumKP6HUZUPmESfrnw5Gx96AlgQIBlMXk
	 EglpyHftExVibtq8FmvUW79x1DPay7lVUXUmS8a7iV5nrM1YNvT0ipMnuJ7rIDgrw9Yfd
	 ralK6YUigUpgsP96asF6ZhBA+CgWZQmr9kjXYTb5vhFx2t+k4Co9HmzDJd5ElfLMldQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897596;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6SXnGGT+S1u/Tci1iHCHBbJVT/uMFMIlwVrJt1Bm2Og=;
	b=F/fE7cuzEpiw26/oWu48F+OgjgvyWca0P4+5vSgKruWnXUcrWnew2FfyW+Li2HiVF37+
	 JXeSGxYYxGVdX14TFlaO5DuEB9qguGCRuSxCPWlbjzXoxXszkC/8EEcDKRKtYi9XuHqKc
	 8xQH04MXGGzORjBmpcS9X7O0DUTFbO6HhzdebiCyNz6Q6Tj/YKcq8FgOPg7EAcWCe8mLr
	 11k4BEVB2EKP1jVeJWBylGDmHuBs1DDkDqKgg1K+PanBsemvGNoLU9Vvs66WBVNsL+rRw
	 PmNQvqtyGgvi5wl18XXCRu0mjXR/3o5PCavb5+aDf8RhqKerOB3ZjrxbAoklLTExInw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ird0BPJh;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E0E60A3830
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E0E60A3830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ird0BPJh
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3550c917fd3so3031258eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897595; x=1793502395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6SXnGGT+S1u/Tci1iHCHBbJVT/uMFMIlwVrJt1Bm2Og=;
        b=Ird0BPJh7rr6EwoYVgvMVsxqjsuvSjGHXvqoYfGwCSykDRJasSbt4XSGVvwHZQNN7V
         hXu5SLw03VQYY0NiFPPxgx3pkZ/A74og5bQ7OSWUSF8uzadMdMm1Fv7G/3OegUQ9qOxn
         XPdg86jXtTroGkto1Azn4LL93FcnsSg7DpxcXCPQM3NBNQ3sIh2MHNq9H4jaoP6AD3qa
         6B8ib3vITOb4m4ukv9YjXOwB4HafMaBrndTJrh/s9wbitNF270k0MkdeuRFy3MnbqzW1
         dAQj9hzLwHjuAsQp3ifFwj+wpqAJTrCb1w5R8C4ytUsTfeJyH8X4CZDV++chGI9kwwYu
         MTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897595; x=1793502395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SXnGGT+S1u/Tci1iHCHBbJVT/uMFMIlwVrJt1Bm2Og=;
        b=BLSDUlDcwEQzz9tXsOF3H63t0DhDEjGmM4/dnfaa30t1KHX4m0ILUtQeQm9OB1l26d
         HwxgD7SuQgIdH66c5RkjkYLumZcIFOkIJjT4yYYCzREYcgVvRjza9awgzEPZeObiDcaD
         TcNX7VeulmcXTMw+n0/HJIgknhU9KxT+f6zpSlBkekjD31O9MWx1yemnOR/R6gGsZ5wm
         x/Qh6PMEx0orZ5BtdIW1wG+6F4Xu/lajgRvm1o7lJXrjClTnsow3rZ4Sd/eWmz5SsbZE
         kZhIeEvYl+XQMqYicKg7CSwyOWDHfKuRz7tTi48aBzcXHGBMXCGVruIUVDqobuj3PDNl
         NtJw==
X-Forwarded-Encrypted: i=1; AKwUvBzYO5P6+TEEfdY1KB/fiB13ccL0Lc0ZF6uql8QEfbxEJCp0evd7D7jl6X9iW/mECE6QTigdFQrEuWbcJKo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrDKkqeQFqsrGmEnTabg7iA8NKU73KTM1BdB2ja4HeWyuCmXWm
	ROdQv52RvjfIEjqoollii/i5xfzZf4OAJjuaAO/C6FpI/RVperivbzwa
X-Gm-Gg: AYBFou0PXOfYWBsztSJOwTIqESc4524PcFEJT5yGOfvBmVFbNsHjeRqKDaHxwxkJGtk
	abLIU2/KzKKjbfYrNtw1774YqL8O63+HnORpMBp3scDNJsjGoVylew8vs5m/MGZklsDhmG98TL2
	mT7zCcyXLjX7vlKyhErcT9MaIAIDZXIvKiMiMqy7gTwDK51DhEgQdqcjbLgFko6bfFyG6/Siyyq
	ce60ujauXoIVQNdhBxbWcA0h9AKASfiub3e4q6FqaCUXG3+nhXTR3GgRy/Kc5T9DUGUHZWXTrIs
	eerdr6eu+TZAJ25Pm7oKbeqG3Dgi6H0LHSyYjjJlhG/GQjFw0FWIKUCnh12Dc6PhUCo83nuy0t3
	CLU+Afp4I3Ug/zrNSlLp9J/pU2U3RSC15avYsZTds/XHNbLM9fpipnMPgrQvBf2AAkd9NpYJtXa
	Uy3LL2JWy0d8qsUnDsi9HXZ0ShkX48+DKRDvwoIrwNWxPtrC3miM8BB3hWlVAIJyANmEe/EFOw6
	xFTC3mPKs53QWOrxmnkp8w89ntnJHgItpxmJbtEj+mHmVIBHyzXlOfBXdksxhGfWpQLXyxJjlRZ
	QEBrUxkUpihJAQShXm8jO0MEbdGsE8do5tCgjygMxvY=
X-Received: by 2002:a05:7300:8aa0:b0:35c:ceb0:8bf9 with SMTP id 5a478bee46e88-369e84e00acmr4754011eec.38.1792897595016;
        Sat, 24 Oct 2026 20:06:35 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:34 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:22 -0700
Subject: [PATCH 19/31] hwmon: (pmbus/max15301) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-19-e81941ad0cd3@gmail.com>
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
i2c_smbus_read_block_data(), and ensure the device ID buffer is
NUL-terminated before comparison.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/max15301.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/max15301.c b/drivers/hwmon/pmbus/max15301.c
index 4c36f1ea27ee..4db35453e432 100644
--- a/drivers/hwmon/pmbus/max15301.c
+++ b/drivers/hwmon/pmbus/max15301.c
@@ -66,11 +66,13 @@ static int max15301_probe(struct i2c_client *client)
 				     | I2C_FUNC_SMBUS_BLOCK_DATA))
 		return -ENODEV;
 
-	status = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, device_id);
+	status = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID,
+					   sizeof(device_id) - 1, device_id);
 	if (status < 0) {
 		dev_err(&client->dev, "Failed to read Device Id\n");
 		return status;
 	}
+	device_id[status] = '\0';
 	for (mid = max15301_id; mid->name[0]; mid++) {
 		if (!strncasecmp(mid->name, device_id, strlen(mid->name)))
 			break;

-- 
2.56.0.257.gf7497c7d27-goog

