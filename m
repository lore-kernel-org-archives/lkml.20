Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870011;
	b=cRW7FluBnGcKp0fmoWz1iyWgYPBCeLRV8TLMawuXQ92q7AcYiJTzUJzxGCdVdU1rmO55
	 6c/W1x5grG1zAq58KaWI/KobO8RochIRsNltd0rt/kmItigrl/kGucwVEIQ9lzvHU9s+t
	 FKIYTNJ0iuEpvaazsS7UpiHc29sh3R2rWmu5Gc8lFlWN7rRigt6yExdyLGUh0Ydqcoicm
	 LwCjXEIsBxFS63STG54a1UPQjg0f9/Ml6eWr1t5JCIHq7XSRv482BkRwQHC0Notoo4/iM
	 /EML8lr9AYCMej+UF7pfQRioCEIFJuY3p2SQH430VN5a0hVtWmWIFAZAFLzlFQ9KGhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870011;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=kUfZcKKb6bnahPacDlI0TXHO5cA5YvJ416iMFlw6i3o=;
	b=TMH6J66EP7E03B06L/QdBIs61BGnqwSVlVEWXEjDS4SOi7cIEYq4A9RW/Mwg4xv0IohD
	 k3GTs/q83KuQCynEF5Z2OSBi4IK+CNd0HVLjrC0eAOFULVPHMO+n4HNTgyUEdnHtQXxw9
	 KcnS2NDCQv+bpiTNoPoyxOK/r7/eL7MYqTnHamnF2FSk3swvtytCbSConIPjZHh7oA1n7
	 Kik6AunuwV66pNz+U6PSRWF5BbHblUQ0zn5Y/R2gd6rUXP65YZWozPjc/Qy+S169Rs89l
	 ajdnrX0yh789Tj7HfBEWMJ6432pAtJe72nZf5zCz9DfrnmAkL3buahW9MCKFT9IEOBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B60C606A896
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B60C606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b4e246acc2so10465947b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:00:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870010; x=1795474810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUfZcKKb6bnahPacDlI0TXHO5cA5YvJ416iMFlw6i3o=;
        b=fDc1xb36bsqhCLjbp0Ib5oMDk8ZaVV0/1pqOq7l8SzDL+hiCNEXzfjV6BUV86MZATs
         V8IQwZa68pmL5soLFTk2nhLFMZcIeVci6salz9SQGtq01X6PDPDe9qPwAuG7dyX47MGc
         CkE6Z6MyS2BD1tTri6/uf8O/g4pVB+vTwFQjfqu37KeDCuFYN1UbB8/7y33bNvUvDeqN
         0ugVJ1gEhpeaSL6ZYPGI96zsJrQLENScNhiWwpXxYCfNTM/avVYQOY+lCJWPqyP28GBe
         7ZkR7nUykRk1lzsvimyv3OqIoSbXjdET6cl0PWrRenOkKH/1UEk6Q9mUf575CIIfKA2e
         +hPw==
X-Forwarded-Encrypted: i=1; AL+hErFRbsdRowTDABTJ/D2t+OpTzX/m22FW9ZXTsHKVVYaOLq3w4XGYM8chU2glIS4T2KD6tM/4jbDY0mhLn6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ugEfFbJZguJ/DhXUFAjUxpiVXfqKB3VAoZcgLWed2jlwyoq69
	VBOI+9vp3FJRuD13XInvas42PafvARTlICGxnC4bAJRWLiZnOwVUKZnVs/+E2LKsDv4=
X-Gm-Gg: AZFdTZc4Meaurgvn80Cf+3Jy2SMpS6nVCuUz9VdXRxLKl9opEZry5PJ93EIsIuzweYZ
	R7GBIT0FyB+biXJoklgtD56WHSmlEgbprO8NqNbBC4272kNoXntoEYlkf9RtZEsZil5M+F6QlnY
	IwuFU7uwFbYdvhY0wo30Y0rcg52W4PBslg6WYSfCX8SeFTAE2MXXreyfKRpmP035rlbTShY4fTM
	SazFlkjRe0KTtU8uXhpZ5EpNY77eHm6QIR6GEsYrW8/ublUSGKWu4DmBM1qQnsew7f963yJEQPn
	n9HgmDDy5cJIeo5KCtvXCUAu+jJZ3JyTq01fnvR7QGIqtsOPTIJ1EmZEHURzxHg5X0tl7G6RPsr
	fZnxNS6myoqyu7M7kPlymHLSQvLSn557QQl3iGtJwKNMxz9g5am45XtHAgSQNuk/beYIBSFDOnk
	B1hNLVRl7tSQFSl6xmbQgUrpgLEUCS/3e6TSYXfFUF96WAdBYWZ4ggY0aGkdxAI+bUJ2maBdZ75
	S1iEfTy5dPsrBchainlETZ5+o5s8GpKM5vOGdbQUqpoDYt7bQFe2/IO2NpgEILLOMHHUlBB1fxH
	tNVsk60FWk8f2NKeLj3tlhESRsUJm65m9TUVBR3md4ADVU+LLlMsHKBYLJ43ZUhgbdKx+17INMz
	2IcqDoN1p4FjaZufTJxxG5Wny4QxdWEXZ7dw=
X-Received: by 2002:a05:690c:c510:b0:8b4:dfc2:bea3 with SMTP id 00721157ae682-8b4dfc2c23bmr18799997b3.50.1794870010106;
        Mon, 16 Nov 2026 15:00:10 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ebc50e40sm10721347b3.17.2026.11.16.15.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:00:09 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 17:59:51 -0500
Subject: [PATCH 2/5] iio: potentiometer: mcp4018: Report the available
 wiper positions
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
Message-Id: <20261116-iio-ad5246-v1-2-ef6b7c06d4b0@telaak.dev>
References: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
In-Reply-To: <20261116-iio-ad5246-v1-0-ef6b7c06d4b0@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

Implement read_avail for the raw value, as ds1803, mcp4531, tpl0102 and
x9250 already do. User space then sees out_resistance0_raw_available,
and an in-kernel consumer can learn the wiper range with
iio_read_max_channel_raw() instead of hardcoding it.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/iio/potentiometer/mcp4018.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/iio/potentiometer/mcp4018.c b/drivers/iio/potentiometer/mcp4018.c
index b10b4b920dc0..53471bd24640 100644
--- a/drivers/iio/potentiometer/mcp4018.c
+++ b/drivers/iio/potentiometer/mcp4018.c
@@ -49,9 +49,12 @@ static const struct iio_chan_spec mcp4018_channel = {
 	.output = 1,
 	.channel = 0,
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+	.info_mask_separate_available = BIT(IIO_CHAN_INFO_RAW),
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
 };
 
+static const int mcp4018_wiper_avail[] = { 0, 1, MCP4018_WIPER_MAX };
+
 static int mcp4018_read_raw(struct iio_dev *indio_dev,
 			    struct iio_chan_spec const *chan,
 			    int *val, int *val2, long mask)
@@ -93,9 +96,26 @@ static int mcp4018_write_raw(struct iio_dev *indio_dev,
 	return i2c_smbus_write_byte(data->client, val);
 }
 
+static int mcp4018_read_avail(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan,
+			      const int **vals, int *type, int *length,
+			      long mask)
+{
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		*vals = mcp4018_wiper_avail;
+		*type = IIO_VAL_INT;
+		*length = ARRAY_SIZE(mcp4018_wiper_avail);
+		return IIO_AVAIL_RANGE;
+	default:
+		return -EINVAL;
+	}
+}
+
 static const struct iio_info mcp4018_info = {
 	.read_raw = mcp4018_read_raw,
 	.write_raw = mcp4018_write_raw,
+	.read_avail = mcp4018_read_avail,
 };
 
 #define MCP4018_ID_TABLE(_name, cfg) {				\

-- 
Git-155)

