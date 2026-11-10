Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347797;
	b=0g44moxOgdmN3BLM9PDw0VmeGZsmvlPG8q1Z/V41WgYuG1T59kSlcsXfQwHWznyBG9R8
	 q+d5KhZhhR0DNkfyjART7VyCWBOw8La1QRB2RYEFiBTNbuldDhUa7fs6SKdaBQwS8X9ZM
	 MMOy7PlA2vM6wA3/bztP29nEsEqN9B2yPPEqtY2n0Ly7k9CrIQxeIMafJuaYzeanbhuaQ
	 /LOPGM5JRJyjUCixR+BEhLy2aEkPHKCOHRzc9N7ZEcMQ9RuI2nCIQ3CD2s8/N3NTfOblL
	 qcBcINLj/h9XzlniCDJsEyOWoHHprtgGc7F1ACBO9p4jIWCPXh2JAj/qF8bwYDQ6M5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=AJK+0YT5sOGn7dOYWNuj6ktzaYa5W0p9EEeFHLkfTQQ=;
	b=X7KZ6GDIfEUlpT1oo7Xi6qNh2BVz4JAGcgX/cTF0y0oANucO+XV8rQkvG7EKXhOClF2D
	 NCw2DLTAXihgy0aUm59Mu8CDOOaPuEHGJwWU+iBJH4gjE3KteAFkiyJbTPym0ID4j3XQv
	 FCQEoUUYOrfFMhw1h2RfavkiGdhoxpy5h2qwRhl0lBniaGXpwbWHX2cKUUJvM0Oyzpb/c
	 DPoHX4Ty8leJApTEhj50lVnHAlsc3kwji6UhrN1WBsvtMOchXk+YcdF6PNkNRDJ8dEQgg
	 Xvx5cVAUXtzbpITkHz6FIgfaTTVgG0CeN7Dpc+IuyX068KroJvMiwf5HdK6a1tYtrQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=igsfZWj2;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E401606B564
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E401606B564
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=igsfZWj2
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so1702538f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794347796; x=1794952596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJK+0YT5sOGn7dOYWNuj6ktzaYa5W0p9EEeFHLkfTQQ=;
        b=igsfZWj2LQZH6LBNfKM8HTCPi1hdmMP5M7T+oq5DSFgQgvi7JgJ0emKInaB9xLoowA
         B+Xsz+Upz6wLo7HoT9LC33NFO75lojsD1CT+JQX4DL7elEmWO0hh9QV121nh9hptlUJN
         3nREJep+Z5+QYXUkESp9SHeDmavpSYn8GYGdJdeZdtfuakH8hE42iFoXXd+H+2tftjNT
         8A0BBLE8/PJyO6kpr6CrpC+S5PGiv21omVcYPcSSqCATKOt5shYKlnFpXneuN/oRGrhB
         cY7kgg63AjkTR/Y8YZjbpJ8QmnAGehvRHcgsqjn4GTs4aIJYfeoZm+9sjpCSpecLecey
         gnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794347796; x=1794952596;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJK+0YT5sOGn7dOYWNuj6ktzaYa5W0p9EEeFHLkfTQQ=;
        b=mv+nFhRkwXPTgSKGHveYghp0kian3djyc+HbRylcZdQJKIDzH9ixYMlpwiKVnYB5Nk
         XaGWfO25CT8SwfdZPEcdjwf0ILmWwnVXP96NSQftqWwT096b1J2mqwHkgpT0NZiRJiCp
         bp8nWUpTPOUjp/WKy6kEGcjVlwAgKrg7SwgS+26VA2mA0HIMrBfxJbGLiWyJnfCN+x0x
         Vza/G2Xe03QvywT01qxQ7fNWIBItv6458eiQWWDDY5hco7lrI+iu4VLKEzRnDiDB/Dwc
         WiCQ198m7THpeiiZ6iJZ6O84rHeqT4g5tD0b/Uze2c2Jtat0PDyqmWO0j3AG8m8PC12u
         YQDA==
X-Forwarded-Encrypted: i=1; AL+hErEqJx4Y1ngt84HKcELV+s0evc9xxvgQa7gt07DTVfZOCkClmicXEFH6Yvg+nMmch+lZLyKBaFVuga0Gbew=@vger.kernel.org
X-Gm-Message-State: APuU4Z+E1KacD/iyRbpVzGYWLdbXveiA7VMKOuAWG7NT6tku9Uiya2WM
	r79JMcw+96DqxiTGuV3s0eiYetDsUDUsZlgBwpUQYjY7+Lua5L/95amP/YHcIdHIe0A=
X-Gm-Gg: AYBFou33j1waYlGoEypsSjDw1ZYuxGafZLvCPYhi+Iv7xXJAdhENx0CDRaB4luk7a9x
	Fs5fRbg8G+KKlownfP7F7ynf+mrPtc30UkaYR8w2cpP+N/P9wEGOnnc0MBsc5JcpDkVoTBoBthA
	jkIqfRMGpWMoczr9EnX6REEWzr1DJTIM1f285nIhR4ulI7GPuE+rxBnoZRPcfld4ld2oq3Vh3V4
	zGYyH8tIXSRISSe/IOpYLakpc56ayY2okGfkrBbw6AXuyNvgJYYyG2f7kOcHhc45PRIhcmdpOQ6
	gQXdWJTkUKJD/ISCRDndN4/nCDPvq545DaaySc+TT/14O0wZFTMRRYm9TayHJbe7NVPt1nxsorv
	8AGa4njOfBWpN5Yon/JSkuH1raMOgSCa9/+hAaLDGz1513p9FTZ/tZnXK9kI0pSXPVtrBPJgbHa
	HvR6UIUdDrHk8OpVQC9cp4OG32PB6WW0oE9b5h9RBoI3NizGuRCcckbGLHoFx65YsmDJPn3t8qc
	ZEcRncbqKEWoE07Wanvvxpb4l6u/axMZLPyGn4x2MzsdyihGxAlpdNz7IcAcwpldVxuWTvIUviy
	tXS9M/mJ2vP35YCBAwxqRNLp3r2UcClZDw==
X-Received: by 2002:a5d:5f47:0:b0:493:690c:8364 with SMTP id ffacd0b85a97d-499c3ba0637mr411346f8f.3.1794347796102;
        Tue, 10 Nov 2026 13:56:36 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-498365cbbe5sm7894356f8f.42.2026.11.10.13.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:56:34 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Thomas Richard <thomas.richard@bootlin.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 17/20] mfd: Unify style of dmi_system_id arrays
Date: Tue, 10 Nov 2026 22:54:42 +0100
Message-ID:  <d5b5b1bc744791e3d3c0853c49cb929d7859f6a1.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2448; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=SERAhXaidkBINTbsPUDlbXlyPqZpWvLU6rbuhUh7+aM=; b=owEBbAGT/pANAwAKAY+A+1h9Ev5OAcsmYgBq85LN8GVXUMII2zUy7qf7edF8KeOIIt8DjWzIA 22KcLOu+TeJATIEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCavOSzQAKCRCPgPtYfRL+ TlI+B/jR2Z6t5/jwnemCAQ27fSBcvrirLllISPQbA5CdjTXz0f4o+hLEJPfyy9ocn0WRB3GZ9dp x6I2l8yxgiFs0mZvNA79vB0CBcPrxe64PrHTrroCvjJIIM8NcCmk5lV+K3K+gylpM/XNQTwcLF5 KFOgnUCE3yifgF5TwpT+B3+ZiRnHIs+SMSO/qwrxaAanVYk2+L4gE+SeYzpMxA8xep6hjxdhEIz KiCusMU7yT8+XkpSEYQxHVoJ2IKFZsOZbNVrJ+p0hafNcKt6V0guF8T3Qyh6C8A62TiDjp+eKa4 h5ogK3JEHIcJ6YbjK9KKRZ8aJp/LjfWUhRX/qhJU6UNBXGY=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These arrays already mostly match the most used and generally
recommended coding style. That is:

 - no comma after the list terminator;
 - a comma after an initializer if (and only if) the closing } is not
   directly following;
 - no explicit zeros in the list terminator;
 - a space after an opening { and before a closing }, a single space in
   the list terminator;

Only the list terminators didn't match this style as they didn't use a
space.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/cgbc-core.c            | 2 +-
 drivers/mfd/intel_quark_i2c_gpio.c | 2 +-
 drivers/mfd/kempld-core.c          | 2 +-
 drivers/mfd/tqmx86.c               | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 2becaf797646..e32c709edbac 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -393,7 +393,7 @@ static const struct dmi_system_id cgbc_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "conga-SA8"),
 		},
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(dmi, cgbc_dmi_table);
 
diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index 443a1a0cf777..7f8c16d82738 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -74,7 +74,7 @@ static const struct dmi_system_id dmi_platform_info[] = {
 		},
 		.driver_data = (void *)&intel_quark_i2c_controller_fast_node,
 	},
-	{}
+	{ }
 };
 
 /* This is used as a place holder and will be modified at run-time */
diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index ceef894efcca..3f6a863dccd9 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -737,7 +737,7 @@ static const struct dmi_system_id kempld_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_BOARD_NAME, "Qseven-Q7AL"),
 		},
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(dmi, kempld_dmi_table);
 
diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
index 1c2fe3f91238..16f47566cf3c 100644
--- a/drivers/mfd/tqmx86.c
+++ b/drivers/mfd/tqmx86.c
@@ -338,7 +338,7 @@ static const struct dmi_system_id tqmx86_dmi_table[] __initconst = {
 		},
 		.callback = tqmx86_create_platform_device,
 	},
-	{}
+	{ }
 };
 MODULE_DEVICE_TABLE(dmi, tqmx86_dmi_table);
 
-- 
2.56.0.rc1

