Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567972;
	b=ijWtyKyXpy6bmVHL/stOU/aRfQBBJ7lgxbPJS4qPBpHFGecP6VF4M2KFJau4iuIKL9ZX
	 0TVJV/IGx3a1xx03g31PD07B1Lh/dfYDqHo+SN07c/1rrsh1d3zaEWjlvV0rVZmdJ3TgT
	 uLC5Q0OGlxJAh6E7uzFBqkcFH9MjRS+Mf/igPjX20zEm1lIv7UNkHRMbYQEWpx8vs9QEe
	 G3DT6UXOOkgMxkvTcBTWqUOklru9ly5U8C0o1xbLrLEkI3VqNrh8escIdvYTeiJjNBp+E
	 qM8MEOYlqwzP4mQfsz8gv4JPETXpB83DlA58MzmWkCQpao/e4Porgaoht8i+8Dr9QBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CI3m2IUBy4AJO/fxu7FDLRUHIb948rmd18iopbbst+c=;
	b=eIVdMupg52TdX/jhPayAypcq1Zh6JO9e7qr7s3Bg/d40Z2N2I2eD2Bn0y7u98D/Dv6nb
	 CfUdhhhmUzQmvAVz+RDbIUQJ1XtnLUl+CqvS2oWTUfmXTDGoVsfv6B0Bg1rTLIyk8+P5f
	 mbmXj+J6S49+8qWRLiFLP8W0qe/44lUznToP7uqay4UFy4h9ijd6wrGbGW64o85oi+16z
	 fieywi9JCx/0ZCm3pRDjMyyiHKGoZROKL4X1w5mN2o7aGAW9Ss8ENLFi7qtvVQQyPJUwA
	 zn2AUPiIPdQgM2DLzYLm5qzocthvL+m9I0fQD+Us8ZNu7DahZkolFc7hs3NwfhXYSzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LHClu9Y2;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71853606DFE8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71853606DFE8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LHClu9Y2
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e10a70540so324167f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567971; x=1795172771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CI3m2IUBy4AJO/fxu7FDLRUHIb948rmd18iopbbst+c=;
        b=LHClu9Y2/nHrB30IHALaxE4iScltAFJ4M62ZvLmvcYVaSJy+ecjyPCZOKuHSBG1SXS
         4PJxS9f0oJX9PeW34ToT0rmpuRhhWj6vssLNwFQObLesRncJdMaEijDADIRbq5ocwv0y
         CNlQB5jD+Uc4nimIgHNB4HFhDPC2e3VGYlEY9av1KZhYm5hJj791cyjem+by+7KyhUvv
         m6trU7xoUpHZd/dReY4CcgSLsAZA9AlFWduFG38mYN/Yh3OvGFl6O7aEFdR+bw/CyOhM
         lOoTMJ/+CcGzxT10oOhwRMhlAxa4SvgSlg7CZt/qIGVhNf7ytGf1fBSk6anZVcPea9mB
         DyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567971; x=1795172771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CI3m2IUBy4AJO/fxu7FDLRUHIb948rmd18iopbbst+c=;
        b=g7ty4tvosxsWWKD8g+BbI1vhe9r6dYb+NBrRNU4zTQz7UJ69kkRj5+ACZHIfLqVUMP
         mZwOzwtwj4Q2jjRem/1ZNdtUdghQhzs1cpUUUy603aKYpi/eXAj6lJ558t1S1JsbCLsG
         cH8+0N7NT7+DlaN4EZUnVm33HCZpzosOos5QUG+1s+vw5U3lvPdB9AJp3kEE5L9Y0vPs
         Di26PhAmvPMT76YqnesNlyXlpSgD8dfWI+k5kob6effad2EL6jKe5u3YZaqZxvDB1kE4
         Zct5wTQ0QF5sTNGgvCX35SFOXpItYyYJwVUQnubjFVm8cuTdf25Ty/TtAPiRQfqiY2lw
         +iyw==
X-Forwarded-Encrypted: i=1; AL+hErEgLfj7GpYqEJwMR2vsc+I4BSm7N4wQt6AwrAya8xRzCzxYUw/C5H2Y6Yzj3v9XzLgjFGs/K7+IZYJGuAI=@vger.kernel.org
X-Gm-Message-State: APuU4Z88+kagcBHOxnvjTNmG2cP1WDJAtvm989XUzTNAc6Bq16UoSHMi
	aCZn2SRv43yDOyFcZkSQe7oQrb0rkgB5VMJnpoA+L1/yWvw1aE423JZyHS4dlvOiGlU=
X-Gm-Gg: AYBFou39UPOzZA9ISDzrvRoi7q7K0+ojlGeHHYU5am7sBq9P4xsFw036rPMvLxUPDL4
	S2T1THbHsvJB/b5MIJ19OpZ219fbH84vUhiOJI8Qjepgf7ZgcpKCjl+sjDCXJcdw+tRNqIO2uhu
	OrfHd/tAJYTASe0oibMnQqHU/n4vj+9UfVD8UeroKoDvRW/npr5usJuzwHcSmXTxelfrwrwlPsq
	3vlR07IL53AFA7pKgeKZSRiyN7Z1t413QoTA3Mwa+0AhLeEODxgr4gq00QMuA8zNgfjPwBqlG2p
	YZq36bBlksApMjfzwecX4ArBKnRS7pAE1V/NxphfNj5f8tSeJ1H6mYoA6/xV7edHQWDaxrOOp8o
	kDrffrOKInrdixrS5A/VjSxkYkdGjApCeelcU0S1b48WosKEA6A2t9LYQaHBfNkCKShxxr2NTYg
	8vGGzuPz5s/7nwFtBey+jsqcZSUXhHsb5pTf0L45+mPq7UIuTJvMq8EXtbROo2a57NxAk/GZqDj
	HeEBnxrSbGWC2o6iq5X1h/EJCMCi7ljCnR/DdlkVPTzxBxzVFLXZ3iW5349ouXoq+9PlzlLedJL
	TymMhVwTO2XrlvVlztMpLzZY6npECH0Iy65KtYclieWKfeYs7Dw=
X-Received: by 2002:a05:6000:3c5:b0:48e:3fc:e393 with SMTP id ffacd0b85a97d-49c6fc9e60emr4495337f8f.6.1794567970746;
        Fri, 13 Nov 2026 03:06:10 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm3987770f8f.19.2026.11.13.03.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:10 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:35 +0100
Subject: [PATCH v2 09/11] pinctrl: scmi: report whether a function is GPIO
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-9-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

Use pinmux_generic_function_is_gpio() for the function_is_gpio
operation.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 43b9d67eb9e5..6d51025013ec 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -80,6 +80,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
+	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
 };
 

-- 
2.56.1

