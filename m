Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792897603;
	b=j6vwmMWuTt9fIuRHuBrULOMR8AHTyRzwLq7LPN1a6JhcDZO0ZUO5s/7hFYU0SX/ykZuD
	 /Vqte18+5IZRI9MdVVcqr2UGHtS8CrcYcgy8qWqZrk55tl5pTdWCc0SKwQyrKZ4aJP/Di
	 MEbVE8Fpy5pUm64ROnneEAzkJkyTkE0rnIDcPnlIGZ6N8CNUZ+t3+ers/n7eZ/eTq5o1z
	 RqfeP2BsLqQpH4dNO7aisMg0lfCV2dM1JsjuaM+zG6nB91Ylb9eQn3pS4uf9r6205cfss
	 xufdBUepket1hi1Gzj+8UgDPtNnR/U9THPi5CqlfZnJb2466yVYhBgWUwWlg5P1EpHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792897603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zJDnNzHO9o7StmHm3ycv3aSA866AOYrReznkEIoOrl4=;
	b=5GnkCCUuqbt7BofDgWHmFcTYrdrdpradTivehIZljZuAt6mTvX0XRr5UIJeM9rRLRC8n
	 5U0mJos5PZyddyHNkdQOx4E0YROzMc8TSJ4k4i2oKTlXtUilJUcZBLEWYZWA/0TEJKEFi
	 5dABCSge6WVo2KCiV5gQaXoojLa6cWIFgW8Qn9/QD6vzk8p9wdgfe2Ij11Z7G2+8tBdtI
	 wz8cCR2xPKSn8jfUEVD5gMUHwK+AQ9ojNFZxGXQI71WF32oJNtyk+wAes6wwvqRhylQ0G
	 eheoOfTm+2iCF1ixPMeONIiXae2qnSbEtZ8Op0b6Jdh+tUVZSVI9auS+PbSl+w5RDfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sGPuJMyK;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32A660A3817
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E32A660A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sGPuJMyK
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35943f55c06so2684431eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792897602; x=1793502402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zJDnNzHO9o7StmHm3ycv3aSA866AOYrReznkEIoOrl4=;
        b=sGPuJMyKiB6IvmvNHhnY/tgtxQieardVtoAV/RFV/+yaLRQz1cIolPya71+BkNv4z8
         pBADPoKpmauPxEL7Kv/Koq15GceChLInZBzVXdLtmTlazN8mMHAQC7QFGvn/Sq98X9IA
         xpXxpUJdeuT5bntmTgjcPddJXVK7Sk5BdGOE5P8OzN+VklJxBMeGMiRLMrhW6X/VQllh
         7WqRxPrfB6xF1IitcLX0tuP8cmeNzZhu51q7xoZS2FG4oZio1/mgvdR3+muNnNgBOjXe
         Uo/g7NR13mcHt7+Dnl8AfEQiDIqZrLWZ0z+pB9jBLEdgDYHpys3GJAjw0lXH0MIfdpMi
         6eYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792897602; x=1793502402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zJDnNzHO9o7StmHm3ycv3aSA866AOYrReznkEIoOrl4=;
        b=1ZiV8CfULNvEAyyfwmr3Q9P3e6hsqRlqWZBadvoBkuBmQvRbEejPa2w78aIeBIUGPp
         VjkKqm3RILqlguvzDUoJlnO7YywpcZRD0p/PlZr8fTRQZeaHx3TS9CXlAO0E+Fxn3RP6
         AYOehAMLZ6kAcNcelyazBI/UBTdpqdfvACNuBI2UtvUzFcsDFF/z8hluVjVnlPVoG8Os
         muAX0eOBnYl5Xt+gOu/JreIEfW4FCj1AmCcZGLliBVdeHY/X8w9KgzE9B9A9I1Lcn0Yx
         KSh9amAbIu4ec5nOLHORix7C7nflDo4iI2pHdqgBwR5N92+anj267VDp+nlG8tl3PP0S
         WEhg==
X-Forwarded-Encrypted: i=1; AKwUvBz6d2S4xc0jbX2tavpYeNo5HWjeDH51cAiTNW1zKSrzfa4wZ24G4U8KSkNMXIjNcLoryMwAPHtJoiiXmks=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYs6cdufWWOeH95ZDyCuT5nA8kjaHwu/muVeDFWRLmX13vsfzP
	wfFqPOOMfNTDyubbOma75y4SzLUeGkXxh/a4cK4ylIdeO7ktVjvQFRrw
X-Gm-Gg: AYBFou2n91VoQuuqbxSFAuwuiOtmXeK9hgbU3wHGzK0TKPatl0XEsCWdS1xz1RHQW5G
	grqyshl2fmWr0YJvulMmOEKH4xYxCRZ/PjX0Aa5+8kTbIvUrMmeAoGKChRdZjOp/KXkbCGhCIj2
	69gFP1nMutTwRjx7opKeKlJPQt1P6Uj1qV01TBbJvsCnWlPqETthj5dlGYMzz9vXHzIAfd1CnQE
	4s+Vsbv+pCUjdh+49eL7vl5hFo4n6N6uDmhGa0ip9Fp9rAo7rfYM7oxRxKw0wryCEfH7MB8C+Yq
	kdeV7F5z0FoopKb97hlbTf5a7lUYvRaZshO1iCu8a/yi88I2nydwU9MQFaZzXhK5dd699MHviNh
	u3R8+blsIVR5kYURkdRC+FY8615j1Amo0RUJylV7XIUC1aK877jZO7tRzR/+8pLcJkooXbCaN8I
	j1ChP50GW6fjl/h5OY53huf41YK5KR95/CTBKxKpMwn2fOfjYkBnneS3Q4pCsT3zVrlWA8xzjUZ
	9jqzTNF5I0KOt+6Yo7imH3kpcLxX3WsvJ9ZiwWWLgDjELiyuW/NJzZXnf8nuxYbRHzGzvd5zNht
	yi0X4VA3jbXvZfBa5amCb9XX2dIiB08aibr4cFo6YIo=
X-Received: by 2002:a05:7301:d187:b0:35a:dbe8:ccb5 with SMTP id 5a478bee46e88-369e87cd7c5mr4525783eec.13.1792897602043;
        Sat, 24 Oct 2026 20:06:42 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8fe4:693:7158:24de])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm20245992eec.25.2026.10.24.20.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:06:41 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 24 Oct 2026 20:06:27 -0700
Subject: [PATCH 24/31] hwmon: (pmbus) use 4-argument
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
Message-Id: <20261024-hwmon-i2c-smbus-read-block-data-v1-24-e81941ad0cd3@gmail.com>
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

Pass I2C_SMBUS_BLOCK_MAX to i2c_smbus_read_block_data() in
pmbus_read_smbus_i2c_block_data().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 369a3bed8c87..0f49eb41efcc 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -560,7 +560,8 @@ int pmbus_read_smbus_i2c_block_data(struct i2c_client *client, u8 reg, char *dat
 	if (i2c_check_functionality(client->adapter,
 				    I2C_FUNC_SMBUS_READ_BLOCK_DATA)) {
 		pmbus_wait(client);
-		ret = i2c_smbus_read_block_data(client, reg, data_buf);
+		ret = i2c_smbus_read_block_data(client, reg,
+						I2C_SMBUS_BLOCK_MAX, data_buf);
 		pmbus_update_ts(client, 0);
 		return ret;
 	}

-- 
2.56.0.257.gf7497c7d27-goog

