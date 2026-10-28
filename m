Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793225106;
	b=n7bKWIyWNV2bNVfw1sCZhTLpLpmwxR60Ns6GvkuQqADoafZFZb3kHsbvJQzODJuUlnfY
	 2LF7bvHK6zYvqoPxqjoGZ2YoDCjc6R8GcAZVTPp7IhNDZflxprKnLA9Q0QcRMbflziAwK
	 StQehZ3CuKLs1VT+rAs9qb++d7aXfEQzJmzCC9pGX1LTWDMtPYRzlRkmHwpNnZGEkSlEv
	 x15fzE/8/BwqQUVzJp8Pf5u6WNgmoFxFNmDolW4gQZBKw3zt+ze/W1fYpdwRjaNdQ1F5F
	 iJ4TuZKQUmudIerAn8fiv23bpiIvvE0nJa4yF9OeL6oBBvB0G9N+7D2HJwQA+Q2GP9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793225106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SETH6ZaX18QbS+L23rL1WndgOD4QR2QtN3TQLoUJteo=;
	b=b9W3qK8uq1KXL64wkmYW+yWiJ6sy/S4iVxELXBanz1cwjVxMiVBK7qSKwXJBLCqjZHzQ
	 C5zqKIWA7ohxlA6eQ9Az2wcLvKGRiYUBi2czt1y54R8iWBTb1z76oWp/qVQhVcyCQXvFe
	 oFP7aG6raj/bby7Gp7ML8lYinIc0wASQb35JndZt5A+3DKXcPuJX3z2DJWrlQw3qInjFk
	 Vjb6fxCc1h6oR5zrhmtC1ygHCN5YBTK4SXtbiLB9kc0LH3UqMCw0Y6eEhbDKmJfHYg/QG
	 k2MDrwV8xMPj4+i+8uR55GBtr+EhxSZvoPiP2IjJ44dCvpbW4ea8X4TTjy30KoIJ9bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kEKz77Z+;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA27606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA27606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kEKz77Z+
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3514b90bb89so2808251eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793225105; x=1793829905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SETH6ZaX18QbS+L23rL1WndgOD4QR2QtN3TQLoUJteo=;
        b=kEKz77Z+JR7IEHeEdK/WZUmHpr3k8KO9URnO5RbaLdPcONALvy9SRVajC9Z0iJGgdU
         i8RXIh0+aLNbqF3p9kF/NegByyWyK63HaFYvoiOXZI//YdOs4LbziVDPjH8ZuibiGM/M
         ntCt/rfKbxbWTLa8oTwwgGcSGK6rssXwjOUtT13vQT9tV6k6VWd8tsw4m3hWvNaHXzXD
         /6sOv+D7PpMMyvnI3AsL32ax8HKvpq0HR4uqSWDq/8X7Wj9dQ+Sasipe/Ep2d7EUwXoH
         xJYeSL0eLRKlQjjmp3+yTDxNQNofy52uU686Av3QqQJkdxtlYaHJzlphLeRzb1EgCcI+
         40JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225105; x=1793829905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SETH6ZaX18QbS+L23rL1WndgOD4QR2QtN3TQLoUJteo=;
        b=A2zDc0u9lEd3F2us8vujTMkZm0E09giLfWH83Q9O+DW5/NXZ+ywWOFRv0cbSTtWe3O
         0nbH8aJhSrifH1xI1+pmpUDfRrQlql0BJ1V95jsijKs055WHnqC9UwTxTF7vO76rZDdL
         UPzd2wEXlGlHCNvlKF8HuCz4UwLXeLckYl6tSZ6KPOD+uhvbVG36i9WwktYphNsXkjFb
         irz42JjWfflJWF6Yj8nSvX7msJdnPzE0izwsWqgklPNBPWS9rwP+0oP8NARaW2NMUtY/
         8RaAclySeXPLTKTjLIcQVubNq1KYBgL4d74crV0d47NKMnMLvkiM2LD0pSjteoIAe7DU
         eEbg==
X-Forwarded-Encrypted: i=1; AKwUvBwQDTY7T0MtW6JeIHdxgTQ8fdwLuJsWDH7ZF+Rwt1xku29fbognHBGSGOJx76n0lJ9bmQ3RTA4R45nNB/U=@vger.kernel.org
X-Gm-Message-State: AFq9FYINwCtx9ohnYiVJsl/dnHoqSHbD76n6KFrR75c5HOL/DfOLuVvn
	I6dxXwOy0jpL3Aa/p5FzM1scHlyQxQO9Ds7tnHON/+o6KyCX5Kj5kjkA
X-Gm-Gg: AYBFou1iwdcPNqZI+QalvzetdCi004L1s7ktNLIo7oDttZEHjm8/OXd9SwHL4HiC0WE
	OjFyF2a2UBkUSxeZIwcA02zPPx+jqS7m6qoVKhlaPGsLHiMrqUvKooOk2d7naBLZ3yejeZ2gxnC
	PCILzkzk5xCND7ne5Sqkqq7SM12mzGGW5SB2W8c898iBxxDQHma8XwDC5+pG+5kmIk6XqxEg8uo
	3Uvr+ejfq9831iR65yTTCYGF81TwDpn35UQ5WiAtygwu8uvLjog9rlEAtPnQ6Kzg42buPAWBLwS
	So0jBLrSgrg6n3UOeJvtoIAJ/0oYB/HZhcMbDStD58FEoFRDCWet7BpP2m1+MX6Mt833E0zkBlW
	GVUi70ZC2G6XCvPIFxSA+as2TlI1y2ttYowqIsr4RCn+ee3e8JnSbyQc7kHhtmDTyLoVT70Z8/F
	HczH/wobDUHWcCWjhRs6rWeeEXBwDHwgcVoTNkaYwt8vrHtsK1q/dV3R8kis4SsJqMTOO+HlFK1
	VZ1/NIVmw7DMI608ddeb/tIfnoVFwzWg51MVuKmggPu1oZxMmabtf7VT7gXbpEZ4UIUKEFjzH2O
	rPIKYTrMnl9A9LRR9TW125VnJ26lKrxWLiWtiyX38PZPaliID/+/JWWhBqhHweT0Scb3UAGTwDa
	L/1UZkiXn6LVpEXII4nbPxKFk/aqLa4BwMeh1F7QjzTApavJaKzo5d03TAMevrlFRmi5wKWvSHm
	XrbmfGKrAfYO5v+ngRNhnIYDjn/af2AWpdGoeJydEBXWz5fBKeWr+p4ucDh2O6YPA=
X-Received: by 2002:a05:693c:87d1:20b0:367:23b6:94e1 with SMTP id 5a478bee46e88-36a20140439mr4800889eec.41.1793225104481;
        Wed, 28 Oct 2026 15:05:04 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2390a812sm9924429eec.14.2026.10.28.15.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:05:04 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v3 2/3] iio: proximity: sx9324: keep the IRQ balanced across suspend and resume
Date: Thu, 29 Oct 2026 03:34:38 +0530
Message-ID: <20261028220444.70121-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261028220444.70121-1-kapoorarnav43@gmail.com>
References: <20261028220444.70121-1-kapoorarnav43@gmail.com>
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

sx9324_suspend() disables the interrupt first and returns with it still
disabled if a register access fails. Resume isn't called after a failed
suspend, so the interrupt is never enabled again. sx9324_resume() also
returns without enabling it on error. Without an interrupt line,
client->irq is 0 and both callbacks act on IRQ 0, which the driver
doesn't own.

Disable the interrupt only once the device is asleep, always enable it
in resume, and skip both when there is no interrupt.

Fixes: 4c18a890dff8 ("iio:proximity:sx9324: Add SX9324 support")
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9324.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/proximity/sx9324.c b/drivers/iio/proximity/sx9324.c
index 255a36976ac4..ced415747a98 100644
--- a/drivers/iio/proximity/sx9324.c
+++ b/drivers/iio/proximity/sx9324.c
@@ -1088,8 +1088,6 @@ static int sx9324_suspend(struct device *dev)
 	unsigned int regval;
 	int ret;
 
-	disable_irq_nosync(data->client->irq);
-
 	guard(mutex)(&data->mutex);
 	ret = regmap_read(data->regmap, SX9324_REG_GNRL_CTRL1, &regval);
 	if (ret < 0)
@@ -1100,23 +1098,32 @@ static int sx9324_suspend(struct device *dev)
 
 
 	/* Disable all phases, send the device to sleep. */
-	return regmap_write(data->regmap, SX9324_REG_GNRL_CTRL1, 0);
+	ret = regmap_write(data->regmap, SX9324_REG_GNRL_CTRL1, 0);
+	if (ret)
+		return ret;
+
+	/* Only once nothing can fail, as resume isn't called on failure. */
+	if (data->client->irq)
+		disable_irq_nosync(data->client->irq);
+
+	return 0;
 }
 
 static int sx9324_resume(struct device *dev)
 {
 	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
+	int ret;
 
-	scoped_guard(mutex, &data->mutex) {
-		int ret = regmap_write(data->regmap, SX9324_REG_GNRL_CTRL1,
-				       data->suspend_ctrl |
-				       SX9324_REG_GNRL_CTRL1_PAUSECTRL);
-		if (ret)
-			return ret;
-	}
+	scoped_guard(mutex, &data->mutex)
+		ret = regmap_write(data->regmap, SX9324_REG_GNRL_CTRL1,
+				   data->suspend_ctrl |
+				   SX9324_REG_GNRL_CTRL1_PAUSECTRL);
 
-	enable_irq(data->client->irq);
-	return 0;
+	/* Balance the suspend even if the device couldn't be woken up. */
+	if (data->client->irq)
+		enable_irq(data->client->irq);
+
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(sx9324_pm_ops, sx9324_suspend, sx9324_resume);
-- 
2.53.0

