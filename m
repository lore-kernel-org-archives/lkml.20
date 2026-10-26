Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013855;
	b=S3DPv+y1Bv1NutnbLVeD7r/zWCazFIjHV8Ey8ECo/c9pCk/Iel0278p/rocqwyxKfuTD
	 /qbyiWO5cx3jsmCU1/L03dqyvAq6B9IkyoqeVdJNyJ+oUghdfE5Sof552FUfxYShmeMO9
	 zarE8yOuJg8e8TT9XIEwHGbe8VpiFVfrdESBiej7JhjFwShhktw+MMAA1Bd417CzmWtuu
	 c8/jDNa+ZDBkNbb58Uz1awInSnyb/p03dkHm4LctzCFxyNMS9QBH5nW2bbXoft2eyR7Of
	 RYu38ofDjHZbhhQ/0oj/yVlqL8WKVdB0joBT/6U72wKrc8z8rSqA8oivnngslo3n8Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gubS6R+BRHVt8ubZ457OUw2tXG30gxHEHztMFFDkJ1w=;
	b=3OkYiwNoLDzGUnQ0jYIzV9o9CRieqMQlkW6mCI4qrYp1OtZnhRzw4BDVArjNMU2dw5Z8
	 poTDS84oxVbUWoycZO/yNrS1vZOobmG5bU2jStD92eJV1Xk1K0OFy/lL2fIjQg94yXlzN
	 AB0HYrMafmSnrnjdyZzUScjNjtxOJDnJj7xHUH//4JBcOD52lSLoVmWy7hp4hlR+AhgK2
	 ogsLoqWJC50Uioi9VrAeV/o3Evx9bvhc56hrjwr/M77fKuV00FIgZEFK9zSeXwN18OPMv
	 ILVEnJ2tg1Wsd496Mpc9bRGO0SkWJSMa8Bhco0Y9hzxO5qediJXR7f7Lad9vQ1ZFT4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qgxGLDIM;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25A5606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F25A5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qgxGLDIM
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-369f33df08eso2613056eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013854; x=1793618654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gubS6R+BRHVt8ubZ457OUw2tXG30gxHEHztMFFDkJ1w=;
        b=qgxGLDIMsoM4FJ6DO4vvsW71Bys782W0K5qykT5Z8a2kbmrHlyodZaKcvRolCqEo8r
         TJNogFYmpCcZaOOFX7R/2fB1nJ099mXcVZz8IBjVPsU6tbc5pgL6o/oKn5ZK4oNpej4C
         UeCltzLcj4pKGSkChM35oqzCPJ4qkKMVQG9MWzGb3Fx1z1dO8gX9twn5SyIuo+2yZHC0
         dCTqb7ruVf4I3TSzUUSIFGjcNK9t0toAfnlrtlgJKiBK8lX+5WJVuLxiZt4ZssB0x6c4
         i1+cpna32aFON2E+EVv//r0s1/EztzT8pwUuAq4OfHCUlE61Bgq0mFRhCVL/lvsyLsDK
         boXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013854; x=1793618654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gubS6R+BRHVt8ubZ457OUw2tXG30gxHEHztMFFDkJ1w=;
        b=faOMQepsWe2JYcilQCj1IKI0Ks2/f39IBaHC6nPDq0JPZjrhmf49UP8+ZZ+GTYvDlq
         Mk1RPzfPA9mMI8gJ1DGol8tRCyU6WUZ3cBKsMfvYmRBfItpuJGs8D8PAw9uc9HQcMW6M
         ADlj1nsHaz5QWm5Lt4nX5As70iP0S5WRM+bS9eDWnRG9zrB1whNRt8sngT7mARizQ+ZB
         pey3466UqbC2Lt6ssn558KD9HcHSz9n2dHJmJ+wcAWNMmyZ8Ry0QqS0GLIIoi59CnJJ+
         X/JKHAnwoTYj+wWTe9NaYo0NUATSGGrNr11y3OregVon1jpz+rYCDl4rE65VJ2ElteAu
         RKLw==
X-Forwarded-Encrypted: i=1; AKwUvBywa7R27PB5v893hX2jvVTDfJI8o15CcctZvludEnq6gDoj2SwfOt6mCpUt9q2xU6L7Nv+aKPQ+iOWN3T4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLc/3n9UaOsK7ZlxlUNNudzoCS0fvK1Or1NhG4QS/9cGJY3IoJs
	Nvr4RO61sx0xtGFjNEZECD44OlOPOFkXA4ZE5WYstxKst4fB0OWjmUzz
X-Gm-Gg: AYBFou24aDD4hQt4y/bj00obg5CbEWxG1jZEw3ToyzOSzUXfrkRxVC3yNJFn0suACFf
	CPume1tLxv0zJ9c4r0wCEyeCjoy9MEvQ54I0N0T4nakDJ7odKdWGyWlwGlC3Gskj4mz2Sfz6oUh
	rvmujSMJwYGz8YDKOLmaUYHYWbBvw66QbzFlj3e4B9qUGETFJTNNKEQQWyQoO8Q4ohnWC04G3+c
	ifUFThmlrgfy4jj4mzPopQnK9pbmJIOTjMc1qR8d8JRUBXbW3LGpk1aSNNfUKI5t1mi5aiBH26r
	BM2ff4UTt2v9kU2niwRrIcVwCyyh43zwcRFZ37S4artzSzrRzl0lSTDKZSnAUcp5NSVQbkVbYUr
	QidTFaklFnQGnUZes10jBdwRXvongDjSKICUGh6k/AIPQYEp8Wwka3o6SD5YsKsZYNAJksEGVQx
	+E6hhU9alrJ6B3J6nNyBxR67fK55/tGYgHoLJoGZdjnOV2Sp8egyMf0MhsVJ+A/fW2MrVEexl7C
	fr0xXBhGlSsaLFyYsxkozyvVtPm/l9hk//8aEKPjh06y2LKyrOLRRfIpOYlNccrle6ISoufKv/w
	SwVtVXOGtINNXw6xEpOJNpkUvGloNGpQYcWjQP1UXkp0THzy2fVrbvkKZM41YwSAd1frpgf+Cj3
	4CzI9RY72B7A=
X-Received: by 2002:a05:693c:2d84:b0:358:8f02:e0ca with SMTP id 5a478bee46e88-369e84fc4admr13621532eec.9.1793013854101;
        Mon, 26 Oct 2026 04:24:14 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a064510b0sm6599989eec.2.2026.10.26.04.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:24:13 -0700 (PDT)
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
Subject: [PATCH v2 3/3] iio: proximity: sx9360: keep the IRQ balanced across suspend and resume
Date: Mon, 26 Oct 2026 16:53:06 +0530
Message-ID: <20261026112342.65917-4-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026112342.65917-1-kapoorarnav43@gmail.com>
References: <20261026112342.65917-1-kapoorarnav43@gmail.com>
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

sx9360_suspend() disables the interrupt first and returns with it still
disabled if a register access fails. Resume isn't called after a failed
suspend, so the interrupt is never enabled again. sx9360_resume() also
returns without enabling it on error. Without an interrupt line,
client->irq is 0 and both callbacks act on IRQ 0, which the driver
doesn't own.

Disable the interrupt only once the device is asleep, always enable it
in resume, and skip both when there is no interrupt.

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9360.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index ed83d809ecf5..85b83d86a433 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -797,8 +797,6 @@ static int sx9360_suspend(struct device *dev)
 	unsigned int regval;
 	int ret;
 
-	disable_irq_nosync(data->client->irq);
-
 	guard(mutex)(&data->mutex);
 	ret = regmap_read(data->regmap, SX9360_REG_GNRL_CTRL0, &regval);
 	if (ret < 0)
@@ -809,23 +807,32 @@ static int sx9360_suspend(struct device *dev)
 
 
 	/* Disable all phases, send the device to sleep. */
-	return regmap_write(data->regmap, SX9360_REG_GNRL_CTRL0, 0);
+	ret = regmap_write(data->regmap, SX9360_REG_GNRL_CTRL0, 0);
+	if (ret)
+		return ret;
+
+	/* Only once nothing can fail, as resume isn't called on failure. */
+	if (data->client->irq)
+		disable_irq_nosync(data->client->irq);
+
+	return 0;
 }
 
 static int sx9360_resume(struct device *dev)
 {
 	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
+	int ret;
 
-	scoped_guard(mutex, &data->mutex) {
-		int ret = regmap_update_bits(data->regmap,
-					     SX9360_REG_GNRL_CTRL0,
-					     SX9360_REG_GNRL_CTRL0_PHEN_MASK,
-					     data->suspend_ctrl);
-		if (ret)
-			return ret;
-	}
-	enable_irq(data->client->irq);
-	return 0;
+	scoped_guard(mutex, &data->mutex)
+		ret = regmap_update_bits(data->regmap, SX9360_REG_GNRL_CTRL0,
+					 SX9360_REG_GNRL_CTRL0_PHEN_MASK,
+					 data->suspend_ctrl);
+
+	/* Balance the suspend even if the device couldn't be woken up. */
+	if (data->client->irq)
+		enable_irq(data->client->irq);
+
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(sx9360_pm_ops, sx9360_suspend, sx9360_resume);
-- 
2.53.0

