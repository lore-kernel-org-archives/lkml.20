Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670046;
	b=4uJoIVmHNJJRT5g29WcKPxoDyCbp85q0Ex5YkXxvmMlV0NF7dyM9WsBM7lzroPhnstuW
	 nlIeFTOKFloxQ5OxXQ34MJatxdZBPrmOOiOlyX0C4Buynk9ySLZtCG2peQWhrgScF8odK
	 zWI2H85q0gZqUAzZ1UBLUGlWYYiiVLJIRWMAGe4t5UQO5ooDfGEGo1vB2MPcaPjlCip2w
	 P7+WWo72skaA6T8DN6U8PbJce7xzVC/4HP60/arbMCEi6i6ZjE0mzg/wjD6UF01mO68qo
	 pBcv8jin8XEjmq1lT//mfMqeknRdBrKhn7Dqz9DjN/2qctyWPTsKFofDvaMoqhELnYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=B+tKf5vPrDaOI5M5gTd4aFyXjI3r/OLdMYL4js+XQMM=;
	b=eR6Nql2YA6cyLCp9L7Ia3MLu7I1a/TiSuKghpe+Rt/9lGkMCtStb8Ty2COmaV9mFPmQU
	 ky4GXDuTUlDiuOyXF1eYcO0OlEqf8LP3OwsLDkzcRN9K4DW3kDd/HxBwq5r3vnDmQtnQd
	 1SoNOCJxjROr65UKftb07SD8DIrNclTwxOTud+nyAY2wlnlYUve6n0F7nKIp7fr1SMluM
	 oo1puwvnHBZg6NgaKcGjeHIG1UsROgXXxwEvkwO3ia55YbjmXQH38C1DzAblO4/5dWIz2
	 6Z4lujNf4B5L2dobBpRg4JcUif6XlPsuOD9xQn0Sm5i43v94T/7Ze4fu2VMgL8VvNIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ilUWSbLg;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71581606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71581606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ilUWSbLg
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48df8fe8513so1649254f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792670044; x=1793274844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B+tKf5vPrDaOI5M5gTd4aFyXjI3r/OLdMYL4js+XQMM=;
        b=ilUWSbLgURqsOyt2clQVainVmFtrQ8HtFTdtTVroPdpRj30kZDdBkaiS/Fd7VGuJI/
         d+Wo6Lyj7R4UqE6yFB39N4O2aptevAYfLKlxY3LlfRo6WvTu/TytMVDoGxCIZdrVAoGW
         jJCDCHeK2DSMawNPERdtKdFtksRH7rLW/7wj50rZbjSecarlQCzBEBamWRZesrZASEJN
         7rgPp9idzGgFASZZ0Ns26sL7m05fDk7T5bj3VPu7t/3FKvUNAmx3JupsNQEu8fUkaYaa
         0M7tZ23rFHZwk64wynaAjGfc22iu5uwM3PCx0ueYKWP0cRt4cN0bsvab63A0PMBL9Zny
         LXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670044; x=1793274844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+tKf5vPrDaOI5M5gTd4aFyXjI3r/OLdMYL4js+XQMM=;
        b=UM9N2H/piht6phb92n3qLy4iboK3oLwInr7LnurCDmeSz2itcBjunM/1ypffOyr/t+
         F51+yrYRuNNMy3kal3lj+oIHWGjI5ioDMfgQQ3U36BMLRRN6rB4F6HFDfIjSuy7UsMkV
         M6dyBnTVtel96qPq4DO/yY2f6AVJI2PVU6PoW7HzGgUzme3LR68K6MiGrNjprhQcls9p
         jxGnYPjY5PgOh6vfDcNB7UUq1mmTTus79s4bI4LA9lOwghK5O4w1bubMy/TRF0zZ7GAk
         enoboP8gUVW+NlDi+GDX4lt/FL98p6OznWQB7CP15ShykiSkIqfME0xH0xjloArUeZYT
         Q99w==
X-Forwarded-Encrypted: i=1; AKwUvBwAhN7EPIXSfcl9lvT2xlIiVUPGgMTPwoMLi0vbTw44PcxnZZY6J+DCm+LqQz/f/9N7y2iRLCzQvWPwsZc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpwVBUEaYV/qZEZY6l95aaFxzktZcUIiR5UQ+OjfT6lzj/8OyC
	gknW/xMLZEXB+dbk3AbzNFYi/nIXJTgArVrkVGRWAaKok1NiMGMhvjTu
X-Gm-Gg: AYBFou3p/MUQAHDWlI22Jm7euGBdJuY4Jv6Foi0AAGFR/xXTKD/Iz1a4dMde1zDhAZe
	huAVbJRzVuS0nB37Aq9H+euCqRTyF5fMAskcRKyqAZtouXCDVnrmDknNDZ3LccZSQMBffioQDGK
	QQalobMSzE6x/uYMTCt451N0UA4EZSo4r26gpaOcqaS7kf5+jU/3IPmIO/eQ10An33cEQFYLsjy
	TKUXLMaMfzlsqqu4o/vNnzKs/eFady4s2vqxgLFvEzgbCdU5wyibZuuBC6u0OVUaDBTvsM9elpS
	A8jDR6TtD6nUt2P1l6WoDE7CChvNmIAIh5K1Mlmdxigbu+cs31hlUjtATp/9etQKC4/9nqvUXlI
	jbrDYcq6J5HnkkykA0b5sItZRPIAm2bD2jtBIkJxuFtAwaODndLQ7KuxyUe48A0rWw8abaIlwvV
	iwl8sjj+EIbOZA2rVgBkT37joGqDUQ9JmsdoaGraVrGHY+Fc100e2br8DwLyZXtOR/ll8j7GsuJ
	64b9h2meUxGPR5H30vUdeNVmihIBOARwOUs2LshAaKkuAW1cfOGBet67CwWdPMNlbSPcvaEQ8V5
	uq5uxiRCpw==
X-Received: by 2002:a5d:5f42:0:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-48e264fb916mr10239786f8f.57.1792670043786;
        Thu, 22 Oct 2026 04:54:03 -0700 (PDT)
Received: from localhost (ip-94-113-240-150.net.vodafone.cz. [94.113.240.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f0b1sm12242746f8f.9.2026.10.22.04.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:54:03 -0700 (PDT)
From: Jan Remes <ciakval@gmail.com>
Date: Thu, 22 Oct 2026 13:53:59 +0200
Subject: [PATCH v3 3/4] iio: light: tsl2591: report saturation
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
Message-Id: <20261022-first-patch-v3-3-b792e89a429a@mycroftmind.com>
References: <20261022-first-patch-v3-0-b792e89a429a@mycroftmind.com>
In-Reply-To: <20261022-first-patch-v3-0-b792e89a429a@mycroftmind.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Joe Sandom <joe.g.sandom@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jan Remes <jan.remes@mycroftmind.com>, Jonathan Cameron <jic23@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.16.0

From: Jan Remes <jan.remes@mycroftmind.com>

When the TSL2591 sensor is saturated, it reports its maximum value
(specific one for 100ms integration time, UINT16_MAX otherwise).

When either raw channel becomes saturated, return -EOVERFLOW (like
as73211 and si1133 do) instead of calculating an invalid number when
reading 'in_illuminance_input'. Keep existing behavior on raw channels.

Note: Datasheet versions differ in the saturation number for 100ms. Old
2013 datasheet lists it as 37888, newer versions say 36863. Use the new
value although the hardware can report up to 37888.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Jan Remes <jan.remes@mycroftmind.com>
---
 drivers/iio/light/tsl2591.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/light/tsl2591.c b/drivers/iio/light/tsl2591.c
index 8cfce720efb9..e3092ae77a11 100644
--- a/drivers/iio/light/tsl2591.c
+++ b/drivers/iio/light/tsl2591.c
@@ -139,7 +139,9 @@
 
 /* TSL2591 maximum values */
 #define TSL2591_MAX_ALS_INT_TIME_MS    600
+/* Maximal values per datasheet [v3-00] 2023-Feb-08 */
 #define TSL2591_ALS_MAX_VALUE	       (BIT(16) - 1)
+#define TSL2591_ALS_MAX_VALUE_100MS    36863
 
 /*
  * LUX calculations;
@@ -379,7 +381,7 @@ static int tsl2591_read_channel_data(struct iio_dev *indio_dev,
 	struct i2c_client *client = chip->client;
 	u8 als_data[TSL2591_NUM_DATA_REGISTERS];
 	int int_time_fval, gain_multi;
-	u16 als_ch0, als_ch1;
+	u16 als_ch0, als_ch1, als_max;
 	u64 lux;
 	u32 rem;
 	int ret;
@@ -417,6 +419,14 @@ static int tsl2591_read_channel_data(struct iio_dev *indio_dev,
 			return gain_multi;
 		}
 
+		/* Check for overflow; special case for 100ms integration time */
+		als_max = TSL2591_ALS_MAX_VALUE;
+		if (settings->als_int_time == TSL2591_CTRL_ALS_INTEGRATION_100MS)
+			als_max = TSL2591_ALS_MAX_VALUE_100MS;
+
+		if (als_ch0 >= als_max || als_ch1 >= als_max)
+			return -EOVERFLOW;
+
 		/* No visible light, this also catches C0DATA == 0 */
 		if (als_ch0 <= als_ch1) {
 			*val = 0;

-- 
2.53.0

