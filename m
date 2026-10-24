Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792878269;
	b=wcLz2amlkEVbvN+QiK2y8jXXKPk/JRGEY0FiSh6xvZsKWP0ZJY1obADdy7rdA+mZMiaR
	 SRw4FXRbAZsMSyo81edPVzkWUtxqYtoqB1jBXB2ziS9RVRDrAN6FvtpGvSsQulxtvLGe6
	 mJ/TYm85biyVTT6j6DM5NJthp0d07PWMJdwF1PaoGw+6IWK89D1P2j6UHEu6q3zJKN97b
	 JNsuRfIvkdZtO3NzTXJ1LmyVrzR3xoG9QMFMP0JC7Vv02ND7g4HX4IHFv5yAIJbp+/hbQ
	 HsJX99NzcdVFzLK1LMuiunGhAl7TjwT7ZU5d39IMwJ3lZqK+F7WHMnDiNp6Xv0ehaHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792878269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o9dLc90NOwCQ8gMqbMbmGkdZs1HGcCbm5itPdWqDFhg=;
	b=22d5UHpNqVHApXizSEFMX9fOKhF1TExmlhXdY+/IHjrcp6Wg7VI4HFNSifVFZsVG2IE7
	 XPLXvMIrMDRI6omQn5cXI/r453WpB1b8WLcVQ2RIlksqwuPreBGy1LgqsV6YgkdIfF7ws
	 twUr/GfsMQzsFk1CuWHjhUjukurMpuqfEmyOzrkWf5h0bwMU1G91H3g6K5LK2YZMFLeCP
	 tY++LkDX7cmXSxou+6KV2ebCd/y4TenUl+3BPaJqpqKgxnoUQdOB0bOylQXoNPNvVsMg0
	 u9/7IFStqXdP1V+AJk25eam7HhcQkDJSJpqfrinuKojVp5bwUTEpAu+GWe2OATJFbcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F3vnlwLJ;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A1D606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 21:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A1D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=F3vnlwLJ
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1693968f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792878267; x=1793483067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o9dLc90NOwCQ8gMqbMbmGkdZs1HGcCbm5itPdWqDFhg=;
        b=F3vnlwLJxSQs9B3MUogpQhfEkXeXwkfpVfAWgu+HUDrbEJUoobOTEajYZL3MD1Mj6W
         7H31hNMbpYjyFA6tSGXQb/dnF3t9hxppaTNI9cOb8bH72RH+qC+D305nJ99gdGHxiM6m
         7OdCr4cclSTxb7xyDh3ZoUjxxx1Qk/grC0gv31SMkskBqaYENar9XhQbvJ5HkM1p74XT
         4AQrpYYpujsXPCCJiZztRrM/x3ANtV+HZvcyRtb8gqPThL+hH4hTLj5ZJrReTXvjA2u0
         t3VPV5P/WpRaYt6YSgoOD4DSpCDW0FpCNUzQhFIZ6bA3ScTkUrJrsLyTYf7NoAOLZzTW
         Tchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792878267; x=1793483067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9dLc90NOwCQ8gMqbMbmGkdZs1HGcCbm5itPdWqDFhg=;
        b=1n7PZihKfFPPz/LB48RvkFcUtkzeR3nI5FEqs9T3TX4wSlsXIQB7yOHXPQ8hl9B5RB
         3uLf4eg38+BGjUMP3r8KbcivVYvZ7EQU9Okb1gZonstOCllt2HVQCSS/P3ULpcwStp3K
         mXCIrLXWk0NDH2OfAwas7IwWs5kxF8qOC+BfCbNy1tKXPV/VsC3UATtl+Cp6+38z9QdT
         +IoYTT6KF6B0v1LIMkIBRwkRLQWMyPOJ3FH3RASMuDsxY7y9b/VFgBGXoQ4o4M8F4xvI
         WEK+qbvfUQwX5Nw4znBzvPmf0n5aUaeW5J2nwkN6CYe4oOOHjiDPcYGJGo2WRxvWenHD
         blXA==
X-Forwarded-Encrypted: i=1; AKwUvBxVIKVQkwp0rVG+B1DVok1hSCAWD5aDEH2PC5MSnrVT82Mr9VEs2AFAw60PSXdMbPSZq7FblDQi8hZor1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6pMW6ae8R2ojN8Hm/39axSlPoKqPU63p4ip7sZ3zpRWhlYw1J
	+nwgK7xzEK8cj9uMJ4D9E8MXH1CKWiiy4jeOtZw+McbbIouFfuJIBYaw
X-Gm-Gg: AYBFou0MKTYRWoyTKB8i7tM3XN68wgUNAjpwF+C1dnCtucgZHaCHDl8EGztRmy/J2p0
	2gTq0g/JkLP7iaLyy5/3bNvBh5vncOdlhUyUQGqWrxnMuHxPmw4hZqnxtJ1opamijUO0fZVeTq/
	NreA0hjQnJbL09cdrySfHgZhDzdxeHYRlubPbLC5jnJRfuf5NEbk7NF9UoJkdHz4nsXW0qzNbGL
	dvbIXbND1gSbuM+rKM8PNCo9XBO32LPjzqam78a6HLynBqkYm0UugRMzCwbHLj8U4y7m/vL4QgF
	/m5WEaX8ZA3+JK8x/ZCZ3iWFLKAMcLUqk5wRjnKMvV3W0PTVvXgv0zT9YWLSTEZFTUR1FQE8Vxb
	UiXD2g/nX+CqntVlY8SFg2zcF0lFrQuH6cPFiL053CrlZjQM7FMJg7W7wZgx16bXvL0qFmDdGTG
	a7DKleiptVpA2pHU0u4Zdl/3R5VC8b24S5H+B4+lQwMaZ62Jc55HplB0VqWhraQH965XVeGskoQ
	aqxn+CWqm/gpSRZkfuvOvHeh6WjNQS4GZ691rq83mwpT4eGIUjFm9nf3i89AVlgkTRmECk6ZHGB
	9bEr7uCDQztXiZ+aUxaKLIxA4rbGmrL1bQvFkXT7
X-Received: by 2002:a5d:4743:0:b0:48d:f249:82c3 with SMTP id ffacd0b85a97d-48e3eb8b816mr3059620f8f.30.1792878267110;
        Sat, 24 Oct 2026 14:44:27 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3c5bsm6981411f8f.9.2026.10.24.14.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 14:44:26 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Ariana Lazar <ariana.lazar@microchip.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] iio: dac: mcp47feb02: reject out-of-range raw values
Date: Sat, 24 Oct 2026 22:44:23 +0100
Message-ID: <20261024214423.865635-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

mcp47feb02_write_raw() writes the user supplied raw value to the DAC
register without checking it against the chip resolution. The parts
are 8, 10 or 12 bit, and the bits above the resolution are not
implemented, so writing 300 to out_voltage0_raw on an 8-bit part sets
the output to code 44 instead of failing, and -1 is written as 0xffff.

The out-of-range value is also cached in dac_data, so it is written
back on resume and stored to EEPROM by store_eeprom.

Return -EINVAL for values outside [0, 2^resolution - 1].

Found by code inspection. Build tested with W=1 (=m and =y) only;
no hardware was available for runtime testing.

Fixes: bf394cc80369 ("iio: dac: adding support for Microchip MCP47FEB02")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/iio/dac/mcp47feb02-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iio/dac/mcp47feb02-core.c b/drivers/iio/dac/mcp47feb02-core.c
index 88bffbab0854..1a0e80b5db87 100644
--- a/drivers/iio/dac/mcp47feb02-core.c
+++ b/drivers/iio/dac/mcp47feb02-core.c
@@ -696,6 +696,9 @@ static int mcp47feb02_write_raw(struct iio_dev *indio_dev, struct iio_chan_spec
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
+		if (val < 0 || val >= BIT(data->chip_features->resolution))
+			return -EINVAL;
+
 		ret = regmap_write(data->regmap, REG_ADDR(ch->address), val);
 		if (ret)
 			return ret;
-- 
2.55.0

