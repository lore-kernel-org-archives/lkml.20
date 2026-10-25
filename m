Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897589;
	b=5lP/0tVjDh+R1bd7zzUwhsP8sKHl5zRsNgFdKbxxC99D1yziLutnaeYuruAsY6XThdJa
	 Hab3rfJCLzHaDAUMCyDrhNCSY2zLIj3wU6PtWDn5I/E0CFzecQ8JwRbbE1XvMF0mDl8kb
	 cOmxb3iyEl/eTNcyTFe/GjnorrTdxyvsJkcdLWYR7vpCVCuaEi25JdaQDzN+TbsnNA0vu
	 BvBsRVauGY2dR5iKmrXnwgmUCh+1+rti/rmhKFKzxuA5JwIPNBNDdrZxrpHkjMQAfdUus
	 pVUiADqNUtxe/cnahC/KtpsyKIBS4ZULvG/dEUfDxD9IDT2OiUsFVHV0UxBNitNyiug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Kk942ICUfydjX9IbYsVm70u5fqIuFk9UTfU2OgRWZS0=;
	b=ccgtzu1+G2LFqajLZlEjt8cNuJzl2vfiOamD9YP7uEnB8pRIgz5OX/j8tjXLyt4+uAGX
	 XTEMcT2mpS8KYVkEFFYZy4bJY1dGaef6Y0dJSWBw4gnOWpGpe4JW/rXdifZHzfQ42CCaF
	 loS4RTtG9Nygnt2cf1+jqC2wJUsTiIj6t17d/xXiYBxbPMhZ9gu9DKYzIFDW4PDf1whVt
	 ukVi5FBsky7jHeKoFgt1Zj5HnAX/aLXyeIttyLM0hLiHxDUs9h8u0za3fjZSrCGRqAl1W
	 GzEOB1WWUUxO8pGOV/7V4WHpdsahFMza/7HT1NE3ul8ZHzJ5X+rULVh0XKQFr0A7wWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=euHOQO85;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EBA606A334
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12EBA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=euHOQO85
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35f036b17easo4796123eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897588; x=1793502388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kk942ICUfydjX9IbYsVm70u5fqIuFk9UTfU2OgRWZS0=;
        b=euHOQO85URdvA9d+ch789+wbXxAi2iSPt8F6WBRdehKWalBukl6HT9ouxvFbYHZYcw
         X/KKuyVLoWfqlCM8CiNO1kGiaAjIq5HVV8QH6XCn/O7roqeo1Z7LMmxgHgm/Y2dq+C7f
         /6Gkg8MtJCySrMToS8jYAJDA0fnCxv5OxW3lmOcjOPRN2+A4OxE7XkrAGrXaaogWK6+R
         XuZ5y1oq8ESJYfwsn2bV0jWtDWWGyJe4QIRRi/UqDLRUmIdvjL50nEfiANOHtiqDkGss
         voiEJDRHqwJb/GI7G4HpSzWFw1b4iR22pbbnLgOUURyvz3F0TvBs6LiuUksZoryi0YFs
         FdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897588; x=1793502388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kk942ICUfydjX9IbYsVm70u5fqIuFk9UTfU2OgRWZS0=;
        b=bB400tDxIM3WC7DqrGcQWnB/RYpHoOx3Pl8AYgM8aqZl5/0kzVN4TgaAoqhGadZFPT
         p6AGFggKkDwT5q4MrVgmtkVyPyBPsvJifTCvwfnLVK6LO0SNOVCvUlsRxhBQbbf20YQU
         7fYfl/JTM/aEMg8x+0zpqJs6znqf9psw/1degExkD2fGRPMCGopshDVe/aBhN4GnYTC2
         TMBozyCM2o2FTt9Z4VE9PoG6dAMclmP5dV3OJmx3AIcw4LyCD8Q5GO5LBR/1PSEjgw9Z
         M/mnO2JEBIlXuu7zLKtTfF5+VFhT8How/Z6yNfwLKY26g9+ZQ54J5HrR5PM+ewgYE0+M
         f8gQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/eqbw/07as4iZuMAA2l7OmOiaL4B3vhdP75WFrB4JRe8H0ktM7z9i+6RE01/C6eSv96BOzeut1/5bhg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGFfVqh6c55ZEKGFeQJIjN+v2zBs0+SAW7Xkvw4UdrMR6OF1fw
	JG1RpjLDPl4mJd+LXiIDcj3E0jOUJu+8kgbqhBLea2aGvRuxjbSvqKQk
X-Gm-Gg: AYBFou2E4UzBdOyngVCxhT0DcpnYXuI25cMN5ZBtmCrhprJ3uhRzkjZBDuguppzqXIr
	tFyOE0iiw1s0o77n2RlxKzpXiImnMkgZz5Vnze1SFe+4LdzfmiFaB0wRfnSZYQ/IFA/appsHdRb
	TL6AJ9zDSZnOE8LGkuuN3YvtMq2lrp4/iGFnhjJP2nIsUxL+PR6x1vuSjdTa+zwaaP1KYHrq2rz
	D4/eVImmQuTg9JLMropXkPhrPvLYfD9NEVeX6SHmSCqpM7jjDk/oM9qCl/G1byoMZgmnmw8mEYi
	fN9jYpR4/mlBkAcSGA6vi0XOrurPetI+pJFkd/NXMjatWRsK5MUSMiKbl94gv29xb3MbB7Q84Ex
	k6rUGI7miG6CFx/dFq7J1q96+muv1aLzDmhxsRwjxxEHLEbGYKW4v9ln4SD9ct1ey1a83W5vFlH
	fZs7uVN/Ni+gM0G47yOxR8QK52+xcJq0VzgrwmUP38lox29OktsDKc3WU4KNvkn//CXxzELCMYF
	wLR0T6tPTaU1/24gsnMwUZO9gDl7wYUDlBcNyptghtpDwZFYzspoeVlMyFlIvsluwEAhOn3Aj0i
	1dkPA/ICXpuc9Qarhal5Tg7hvv0DOPB3OxqSeMl/v4jcTvQ6aosSZc4q497wcGsc
X-Received: by 2002:a05:7300:e9db:10b0:361:fd60:3cd2 with SMTP id 5a478bee46e88-369e848286fmr5386880eec.10.1792897588167;
        Sat, 24 Oct 2026 20:06:28 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:27 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:17 -0700
Subject: [PATCH 14/31] hwmon: (pmbus/inspur-ipsps) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-14-e81941ad0cd3@gmail.com>
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

Pass the buffer size to i2c_smbus_read_block_data() in
ipsps_string_show() and ipsps_fw_version_show().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/inspur-ipsps.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/inspur-ipsps.c b/drivers/hwmon/pmbus/inspur-ipsps.c
index 57c0fc16909c..01ff392c71d8 100644
--- a/drivers/hwmon/pmbus/inspur-ipsps.c
+++ b/drivers/hwmon/pmbus/inspur-ipsps.c
@@ -62,7 +62,7 @@ static ssize_t ipsps_string_show(struct device *dev,
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 
 	reg = ipsps_regs[attr->index];
-	rc = i2c_smbus_read_block_data(client, reg, data);
+	rc = i2c_smbus_read_block_data(client, reg, sizeof(data) - 1, data);
 	if (rc < 0)
 		return rc;
 
@@ -84,7 +84,7 @@ static ssize_t ipsps_fw_version_show(struct device *dev,
 	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
 
 	reg = ipsps_regs[attr->index];
-	rc = i2c_smbus_read_block_data(client, reg, data);
+	rc = i2c_smbus_read_block_data(client, reg, sizeof(data), data);
 	if (rc < 0)
 		return rc;
 

-- 
2.56.0.257.gf7497c7d27-goog

