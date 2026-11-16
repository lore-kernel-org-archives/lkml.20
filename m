Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870013;
	b=4SjlfLgbPMr2fUdA9igRpIetVRrvSfhqj2Dkes2fQVX4N9/BMbutvBtrHhRb+26PyDNC
	 Rs9lDyd4g+oZAqDtubm+n0MwAYmFyM/96xKWWdUMlbTs3N8N9J4vVLWHDBrpIfg+irvvl
	 3rfr2/xcQh9h+Lou8gt7NyWY8UxPM9Carq3nGokTYJoZefNBnj3jga9PX/ZoXxFFaj8eB
	 cLvHb2a49jteBOuIYjZhb6YIagvJ1BLU0XJMJbqtB6Iv5fL5FEkEaccyuCWOYwmDbPUXc
	 f/YivssSzY8ET3UQT9D0JIqg6+V/sSlRjqHRoStK503gLyDSK56WUAtKdx1ULkBo/gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870013;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=mqKCpqc3ESi02u0qt7HzlcluWKxVbZ+aolou34tE824=;
	b=r+Z0bC3BMKt07JdcJvJRKDGMsFlO0PZ4O+f4trqv7nEhwuYUMryQH6aeTOWZIsqckSnq
	 nsOHjSZonL3CQmtvniYwNpG7b6+rzB++POqIehU8mM9YicSwLiQJG1cDc3i2lG4hogQ0X
	 6YvP88wk+DvVcRra6AtaAn0Mu+FtA4RvaEkc9hqZdC3qz8Icw8Ht6oZ4U/c/2/pavM2nL
	 0D5n4jdy0jVoAG9d0YqeqkIvtWBl2zKk1ZQ+sdV66MGrnnbKCLyoDfqFeBacj5YC9Rla+
	 Y6/UpG0pl2OjYqivm10/PcDlNVU9AX0jhaLQcF5CNTNeCywfGNgT3tqzAJM99fUR8pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA6E60A2603
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BA6E60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b4b2bf375fso15730057b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870012; x=1795474812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mqKCpqc3ESi02u0qt7HzlcluWKxVbZ+aolou34tE824=;
        b=BcUbYAKw+gShjfISbtvke7LI/Thne2fXseXKlSYUmxwUI7pzZF8waeffAUoBqohf3A
         dv4A0UTA6FoISMKiCJU5lzTThWPo5AIYINfQB3/kBr87Qc613r6HYCYo4rABetixdlHi
         b9DLh9uptRn1b/vXMqoyZ2bVo/GPcDnKLfhzt/TEDFYMiNlR/MuA052z+RQg2uO2TsG5
         2hLTc5p25KpG9L3N6GuzD3bNruxRrRB2sm3c0vZlisL6RMmLEdsBoX603sBXQVPQl7F5
         +8NyH8CZv7ziyAKZbxPEXzNCydfF8es5Wsa7n2Jq8hA0in8TKcuylkKArXpsXj+Qgk4U
         EbHQ==
X-Forwarded-Encrypted: i=1; AL+hErEXYZxkFvJs5n6FusU12nFX0rexYymldOTFYPV9ZKlnfyiEDbHUOle8i1eOMQ3sPU19S+8NlnAJkOS4Yag=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KmRbK72PwtMl2Rwz565sYQ132gqqfNzrfpjxOLcYSLvmJe92p
	R5/R6FHaXEv+7lS2o7P/wUgMTPVQa4nB65qMpKxgWmwaCq5Qo6/BsDJxkCgyC1u26+Y=
X-Gm-Gg: AZFdTZcgRDXyuAVHztqj4JIcowp8pKtSi7xxInEPOlyJnk4qDCqzDQup3QRdQkWo3DP
	xB6BupQ9gO7EqrO2CdcvGeg1Gf2uzFM0P7eNYwmljVazLLVh94nxhM+tcuvtJHo/JhDW6dkMr9Q
	rDcscpVEgzFbIyC5vWZXX4iyFshzihI3JH7Lj41PWta8YGym+3gaDO4Nglf/iovZLcldn5Oq/TM
	ddYLaJcVwBU7GvTR8YzrcYTtAq1LTfw/Zpx/8IMBlTIeR7E7cpI1HmWpvcfJ8fmgW0HJ2h1guEh
	yCW83sPhsbQYZwtXipoyNO6KRPCEzMxa94Ejsfbx4VMdibXH91pa+cl4W3RIAQ3boniQJm9wza6
	Z7B1r5VD4+ZsUa9kBNLEnl4z29LUr5mA01HL1t+kbuU1Zcj+2ZXVNiSyOtmkHNkeLkArdTY7imE
	5ZEf09eEFpwX3oQcwdbHcMtuM8+2NZ3+Vyhm2gjK7dZfm70SyoDkr6hWwMtJve4Uqa6vGj/shw2
	zxp719Ogz59kD6A8B+xkv7dKxuOxOI8MpuVxil02iwtLtd6rEcdUrmblxI3hExRpJyAw51njI02
	fgrDZCGbTdYjMHHlRVP9MGy8AYZo8J0JuFLxIXEH/uIH3mpUStU1O/nSRqcYON/QF7If83xXy4s
	simmLUAjIEPWmdIcpk3LYSJ+Igmk1WCyV
X-Received: by 2002:a05:690c:e3ec:b0:8b4:b5e4:e7a4 with SMTP id 00721157ae682-8b4b5e4f2c0mr64991407b3.21.1794870012557;
        Mon, 16 Nov 2026 15:00:12 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ebc50e40sm10721347b3.17.2026.11.16.15.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:00:12 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 17:59:53 -0500
Subject: [PATCH 4/5] iio: potentiometer: mcp4018: Turn on the vdd supply
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
Message-Id: <20261116-iio-ad5246-v1-4-ef6b7c06d4b0@telaak.dev>
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

Get and enable the vdd supply at probe, so a board that switches the
potentiometer's supply gets it powered before the wiper is used. On
boards that describe no supply, this gets the dummy regulator.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/iio/potentiometer/mcp4018.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iio/potentiometer/mcp4018.c b/drivers/iio/potentiometer/mcp4018.c
index 53471bd24640..0d80bdfdf243 100644
--- a/drivers/iio/potentiometer/mcp4018.c
+++ b/drivers/iio/potentiometer/mcp4018.c
@@ -17,6 +17,7 @@
 #include <linux/iio/iio.h>
 #include <linux/module.h>
 #include <linux/property.h>
+#include <linux/regulator/consumer.h>
 
 #define MCP4018_WIPER_MAX 127
 
@@ -167,6 +168,7 @@ static int mcp4018_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct mcp4018_data *data;
 	struct iio_dev *indio_dev;
+	int ret;
 
 	if (!i2c_check_functionality(client->adapter,
 				     I2C_FUNC_SMBUS_BYTE)) {
@@ -174,6 +176,10 @@ static int mcp4018_probe(struct i2c_client *client)
 		return -EOPNOTSUPP;
 	}
 
+	ret = devm_regulator_get_enable(dev, "vdd");
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable vdd supply\n");
+
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!indio_dev)
 		return -ENOMEM;

-- 
Git-155)

