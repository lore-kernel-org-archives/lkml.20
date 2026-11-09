Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243217;
	b=uLVikfYGCr9fek3W9x49olqGlXpSbGnSH3QCuaDD+s+gM0SJHzY6SvLqiU5eEpVWxr7W
	 oBccgz7Hkp6bbz+q25FgbAa4hI8Y8KuW4R4cZdNyaQnl91FXxDB0z5SSvipMsRqFcQbUH
	 g/UgMVJnlxXxmuzOE+dBOxnlJNUgU1dSm9m+B7N2QNl61DhEbY13R5ZxhxuceWFLB7ZRG
	 vKhO9k6HsQsBN9d2NtCAPocm5t1ORMW1DboYlA06UGoP/MIuhGWS+tVuRSTYL7722yUYZ
	 ++Lz7il0dCJNrP6se1iRA9bqB3Npx1vAePpv/YiAYEtzpBJEad2lRniG10veEUBKRJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=44v6KtyQHlKDjxBRLz0JvUcVR/HFDHmdgJx8X70B37M=;
	b=2vrMY+8/Du9Ob7mzDw+qEgG0k7DJwWDd9MbSBbi80/BW0+JOh53abtDEYCGcrzEfey5e
	 NdcS/NTWidixDM1JnfSSGO/CKDtFvvR3IHLmJVOaalzMTapVVbQOciwtpT4F0xVNlp6rT
	 M7UP1B88qyTXFb/+nxgYT5CH+Nw+iLuBvxsBVX5lUC9FerjsnqoCWOT4ta3riZahpUcBi
	 wH9R3/USR/Ggk9cBcZO/GRYp/x4LIGMA8Er88YTL6pHkSBeF0NxuJeKqr07HD/iOxEroe
	 At8xc0zRaWYWtroqDbL+znOW0JIbwF10fPXcR96t/XY8PSEKil0NTaBNHfLDM5dVB8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h2VyakrY;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00870606EEA7
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00870606EEA7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h2VyakrY
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso659627a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243216; x=1794848016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=44v6KtyQHlKDjxBRLz0JvUcVR/HFDHmdgJx8X70B37M=;
        b=h2VyakrY6Q86h0CPS7bV18MQ0sFP1t1kVU4cl4jyCkjP3WFSB77At3DuhrYg9Z7zam
         58GIOXGcmTafcyfX0mcEVK3eE5rV88pYr1RLirXGN7oLMlBdpvsLgA5mpyljlIl/1RuP
         obtLufU2TWYYO4Q8BCqLQvfa1UnWHaemPxOy5e+VFx3JsjI0su7AVtDehT2he7tOG0xI
         cG2S/PDW1tPDavoyY8hzYHc40XNuzk3j1/y+rq4sq6X8BYy2CV8UNXtFdC/uizHoKf9S
         vD0IjY6uInsP4ODO503yCjq1woUkXT+zQP48gVhvTc9tzXw9g4OuPQI1556oHc0AdUoh
         zLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243216; x=1794848016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=44v6KtyQHlKDjxBRLz0JvUcVR/HFDHmdgJx8X70B37M=;
        b=n8287C3rKJ/fMOTaaCrOOxv/YCH4L1fg8WZcalH7bt4p4AeM2+UB+GBB1AP38/WjLf
         HtFHHnkk4LLBw4XR1tlgM3Np2mlo2bnSrpYxDNh9Uc1Lgv1WtHoEFb1nIVJG++hHfuf8
         NFxdM/tOmXHVZ5jtyxb8VrnJyHfvmKgVu1Jq6XOKgpbDmVhOEPFYOgVWy2YcCtKqBClX
         4C9Gzt0v90JU7m271+Lsj+dDPLYMoPA6aZeQqLmFNAXso/bt0fhLkBL9/kPYvyVaA9Hd
         sdIywD6iBj0LsdSvjOF1CPAAoJyecI83STpbAy2iFTj0m3OHsOVcd3r2Ru5WS2EVt2Ei
         piZw==
X-Forwarded-Encrypted: i=1; AL+hErHP8o+Dn7vG+sf8dio1582EGEK+GhKKbjJYdjQkiFKDDdRVYKopOObe0nPOFN2AG86quvnAU7lj4bBQ1RY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/RKMHPFc2vYQVsW4pMECWS2S6tag/J9B1kNoIRYzy6+FReruF
	5Lwcr8Jt4glU4H5ij9E0giCGfI2oPloODoKO/OM6DE0QVZl1OwDgOaLD
X-Gm-Gg: AYBFou2vjQ4abAIcdyJ1TzIDBD1rXRMDr2d5EDYmbQcUvO6nuBYK4+ZNJVaxmv1xH2y
	86izezq9R+4jQyi8kbYdQJ02A0BcEd55S3a8wvArUHAiziSyecn32yx/0CHYn3xkc2V9amMKC9F
	KfVopbZPSe8ky2Mwvlzno/HlEBN4TbZVi1LYBF+cY0MdP+grrVqon+EDPVJ7qlZM8RVe+d80D6K
	cA3DQJ0eK3OSnJq59icVuk4BfpzjOYgueMBJaBOPjvCjbpYJOr5uEGymMrFz+64mBC9pP5xF5J3
	Szyd5z/TzCHbAR+DEw/yZWPWbIMqtLeMp41JUPNuuHbSx1QeZzEiCtGoUfqoGsI9yiGWjsgfiFr
	fMJc/I4fbt2BfFl+hGxynloywmrKb0rOMm8c8/f5A9NJIlt0z/Dm/25sDcBZD0z4RUyagiHwbv8
	qd7qzetrWVUdVeOgpkJF3XV4NEhz7xVQK7B99GQj79xBE/CTgkiq5cF1q/HH46DM02ZoRbTofk3
	/Ux6HXWFz0q9Qr19oPLsz15/QChf29D+PnJRYuhdvnoRKRjdOdTZo68spcdUudwLpbV9tFzVq5E
	Ut6OJqYMo8HCaSGaGfqOALUaXF9lzxo3s/O5ilEKlaDHjG2Nn2mW4YwqcqynKI0v1HdohQKTDOS
	LioRzLA==
X-Received: by 2002:a17:90b:5101:b0:3b0:934c:5e41 with SMTP id 98e67ed59e1d1-3b166caf0d6mr242689a91.29.1794243216288;
        Mon, 09 Nov 2026 08:53:36 -0800 (PST)
Received: from debian.ari ([152.56.156.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1034718f8sm6455688a91.4.2026.11.09.08.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:53:35 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	andy@kernel.org,
	nuno.sa@analog.com,
	u.kleine-koenig@baylibre.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joshua.crofts1@gmail.com,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH v6 05/11] iio: adc: ti-ads1015: use dev_err_probe() for error handling
Date: Mon,  9 Nov 2026 22:21:33 +0530
Message-Id: <20261109165139.30803-6-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261109165139.30803-1-architanant5@gmail.com>
References: <20261109165139.30803-1-architanant5@gmail.com>
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

Simplify the error handling paths in ads1015_probe() and
ads1015_client_get_channels_config() by converting dev_err()
calls that are immediately followed by a return statement
over to the modern dev_err_probe() helper.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index d18a2ac1205ff..9fd07ee21ede8 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -896,18 +896,16 @@ static int ads1015_client_get_channels_config(struct i2c_client *client)
 
 		if (!fwnode_property_read_u32(node, "ti,gain", &pval)) {
 			pga = pval;
-			if (pga > 5) {
-				dev_err(dev, "invalid gain on %pfw\n", node);
-				return -EINVAL;
-			}
+			if (pga > 5)
+				return dev_err_probe(dev, -EINVAL,
+						     "invalid gain on %pfw\n", node);
 		}
 
 		if (!fwnode_property_read_u32(node, "ti,datarate", &pval)) {
 			data_rate = pval;
-			if (data_rate > 7) {
-				dev_err(dev, "invalid data_rate on %pfw\n", node);
-				return -EINVAL;
-			}
+			if (data_rate > 7)
+				return dev_err_probe(dev, -EINVAL,
+						     "invalid data_rate on %pfw\n", node);
 		}
 
 		if (fwnode_property_present(node, "label")) {
@@ -1018,18 +1016,16 @@ static int ads1015_probe(struct i2c_client *client)
 	data->regmap = devm_regmap_init_i2c(client, chip->has_comparator ?
 					    &ads1015_regmap_config :
 					    &tla2024_regmap_config);
-	if (IS_ERR(data->regmap)) {
-		dev_err(&client->dev, "Failed to allocate register map\n");
-		return PTR_ERR(data->regmap);
-	}
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(dev, PTR_ERR(data->regmap),
+				     "Failed to allocate register map\n");
 
 	ret = devm_iio_triggered_buffer_setup(dev, indio_dev, NULL,
 					      ads1015_trigger_handler,
 					      &ads1015_buffer_setup_ops);
-	if (ret < 0) {
-		dev_err(&client->dev, "iio triggered buffer setup failed\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "iio triggered buffer setup failed\n");
 
 	if (client->irq && chip->has_comparator) {
 		unsigned long irq_trig = irq_get_trigger_type(client->irq);
-- 
2.39.5

