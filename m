Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793225100;
	b=e6q5BoNztWq/F6NG54eBdLDOpxJWkq7Ocxpma+RT0n4u/PlvvmOeJERxr/yeXi69aRnl
	 D3ZPqoYBXf7D94zZucsF+mHFwQ3uFUd9E5WJBw1ppORk8RnwjMWH4A5l1ys6aHqIHFWJu
	 y2jG/xP4Qo5m9psUtrDXOxcryASYSLQrnFrwiOMAENE8rwNALubZ2l1EpKdJxd8IaPfQc
	 f4GTzfLSVtwWpgxvt922Z9rYUb6NalLO8pziLzYvjcQlH4iNQpNFwX4GpR/8ZGDXH8wPF
	 JT3fgcdKjapBRmi+tZ2aXELlcX50Z0qPunwygXx0tH1T06m3+pojTwVYVAJWoAd8XqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793225100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4gxQPKSvEmSqDf84R9LxS0bcPwImZgfZyHhD9RqXDRo=;
	b=fwlLvEQZgFllG7mXQrH1UCXUtgBS7PE5Ew+kWd2UbVeCl4F6E7gU3307IuAdQzLZ2rhP
	 RVSZ+JMH0dipfB8ou+Vt3w+9iCX+mxFXw1zTLnVZkKZZ5zA4Tk1MRNMajGbH0AKU5ecq4
	 HK7m7O9n3eOl2ytxIi789LW1bRifwqHaYv1Jqp7eX665HBuuIrWsCw2DHKcHGjnABhACZ
	 BIYxl6+Q0Tap4ijX0IImX41gNUI6kYzw4JBdf+YbgX2yIYaeXnsJ3EgjKU67R41mS7U7q
	 +oqyMmgDeCCHE3cwqAM9N1kS/zq9cirl456asGAfrTvGdkR3FfvXLaZTuSLK9taMLIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rm3qbBUR;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176CC606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 176CC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rm3qbBUR
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a1947498bso64783eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793225099; x=1793829899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4gxQPKSvEmSqDf84R9LxS0bcPwImZgfZyHhD9RqXDRo=;
        b=Rm3qbBURqJbZcJ/YuZjXYKrilJzPN5B9V+GzEqpK/YgXjMVIXuWAOHKwYdVdw9F6bV
         XGIs/k7dgoJ7Ld9igM/zOEfLrPQDuJliSaC5pkV2xRaTXaSjH5aiKFvBWFsbOfJtnGTI
         MjwXZbtpqyPI117p+VkO3VP4K8wZIky9PTzrlPfqUMHzMYUa3Z1AeoOeYnPXEwSMsyQk
         pOhTWyBDhd+tBn9eynQusL1ppG9ej+5HaxpSM6LWCVbvqzhzaYSjJEd97y4p8fn97AbN
         38dPS5PD68sNM3UTl8L+fh5J2D/gT4SBwGADtSTT2rTvERQY338jhOrlatyEJsfkOBvV
         oWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225099; x=1793829899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4gxQPKSvEmSqDf84R9LxS0bcPwImZgfZyHhD9RqXDRo=;
        b=rxTO9kgu6+4tq17JvF3Y/8WN6YqqbhpLlncN1ztCcvVZ6XzU9B3RUZMyGHxJ7s7s5v
         O7AnstOvs3O1l3l3NMywMneth/aTuPCQEt6hQ4WbnSS02Vq98N4ghELQDZP6GbnDWLaW
         qzDcQGKhO+QrPSQxQrVtgMPB8HmQCFRGWSQZw+1SRvuMAs1pZ8i7oruTqKicMVC/Zcia
         p7/4o8HintvL/NUQ13CLMF+Ljl//vw3KQYP7FS/GCwYO2YBxBtT2Lgs7XlQrD8z2pMQU
         WwjRINlzmO/6gepr7Vw7hfH4g1y8tizoAz8OchC4qkB5z7s8oTKsiyaLSyDRBQzG8TQx
         Gdqw==
X-Forwarded-Encrypted: i=1; AKwUvBzSALQ8wPVD0ECvwbeyE74L7oN37Mo2eSG8ipoNmdykD73qxeceHWdO3HT6Z5n4csp/+VIpyMHbM7mLxuw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOF77iCqdqKxnLWvUpfy8Axw4lhlbZ5Gtm0C5LAA/GWo/udyym
	PZoGwCR3/UgELItwVNQvo3yT799n5VEDpqFLf2neFh3uJG8UTFRmJtpG
X-Gm-Gg: AYBFou0psK27jSdOur8nz1hU0dE8wYxyaxd+O0FWpKkpmy7KiOtScV1TLEkilwAQai+
	+HEMEYLBkhsLJjwzEKp/hguRm49eCqDAi7WMBTrMmLbUNtUMBBBX5UO4ULexYnONYk9UV4Cxrr0
	Uiv1gywfPV7Ccd76xmBumye1NSN91pt5Deu0zLinUu5/7KWF+mqkdS95VkISQQKRjyDLKFGPXX4
	PhvSQyTLN/T7TQjxPKZsjiKPK83XL6+4zMdwJJUTFhdQbwz/N8CASqGxtxnzfPRv11NbI5a9qq7
	ExfEN8tm2AhxxohZIZ4E9BDox0LS8YxInq+A36vz/wmYG4hww3oe3/f9279yyk/+D6hDKSbswyF
	GcfnrFCR28e/0jR3Q+I/PyK/lg900ZlTV55iqfiskDHhQ2ZGZhmZGMTaB5Ajnbe2zyOGomBiOzR
	XEqTbv/aU9bZFmiKagjIDBPLBctuWuXfeLQGqkuHN6CctoIza/rk4laYO0AmQxe09R3QOgCTlL7
	8Vm9BBK82i8iidvLPC2O5nrTBbrHtHPFiw0Exxas+ZWMSkIfLmP5HxbwSsGlm48GE777697OWJJ
	bsXBOLIzYVWJQ5DI832HVvAk5X6qMZExZsra95Qln/UG1gyxeVDiJ2UxkaOlyPRfQXAfr+CyG63
	Lrv36ieMJ1fQ/3zY1wJ9cxvcWy78bUGZcKGrBKezwONSIXWbZwfdaG/Em4gCgVsPRwf6rVKoHqY
	0AKAWR0fYj3vyDtcCOfFtl3myASDrSHPqn48symgXQvA==
X-Received: by 2002:a05:693c:8811:10b0:36a:8a6:6916 with SMTP id 5a478bee46e88-36a203cd278mr5102546eec.18.1793225099148;
        Wed, 28 Oct 2026 15:04:59 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2390a812sm9924429eec.14.2026.10.28.15.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:04:58 -0700 (PDT)
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
Subject: [PATCH v3 1/3] iio: proximity: sx9310: keep the IRQ balanced across suspend and resume
Date: Thu, 29 Oct 2026 03:34:37 +0530
Message-ID: <20261028220444.70121-2-kapoorarnav43@gmail.com>
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

sx9310_suspend() disables the interrupt first and returns with it still
disabled if a register access fails. Resume isn't called after a failed
suspend, so the interrupt is never enabled again. sx9310_resume() also
returns without enabling it on error. Without an interrupt line,
client->irq is 0 and both callbacks act on IRQ 0, which the driver
doesn't own.

Disable the interrupt only once the device is asleep, always enable it
in resume, and skip both when there is no interrupt.

Fixes: 72ad02b15d63 ("iio: Add SEMTECH SX9310/9311 sensor driver")
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9310.c | 42 ++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 79ba46d8a0aa..f824d00f1174 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -943,8 +943,6 @@ static int sx9310_suspend(struct device *dev)
 	u8 ctrl0;
 	int ret;
 
-	disable_irq_nosync(data->client->irq);
-
 	guard(mutex)(&data->mutex);
 	ret = regmap_read(data->regmap, SX9310_REG_PROX_CTRL0,
 			  &data->suspend_ctrl);
@@ -956,7 +954,29 @@ static int sx9310_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
-	return regmap_write(data->regmap, SX9310_REG_PAUSE, 0);
+	ret = regmap_write(data->regmap, SX9310_REG_PAUSE, 0);
+	if (ret)
+		return ret;
+
+	/* Only once nothing can fail, as resume isn't called on failure. */
+	if (data->client->irq)
+		disable_irq_nosync(data->client->irq);
+
+	return 0;
+}
+
+static int sx9310_wake_up(struct sx_common_data *data)
+{
+	struct regmap *map = data->regmap;
+	int ret;
+
+	guard(mutex)(&data->mutex);
+
+	ret = regmap_write(map, SX9310_REG_PAUSE, 1);
+	if (ret)
+		return ret;
+
+	return regmap_write(map, SX9310_REG_PROX_CTRL0, data->suspend_ctrl);
 }
 
 static int sx9310_resume(struct device *dev)
@@ -964,19 +984,13 @@ static int sx9310_resume(struct device *dev)
 	struct sx_common_data *data = iio_priv(dev_get_drvdata(dev));
 	int ret;
 
-	scoped_guard(mutex, &data->mutex) {
-		ret = regmap_write(data->regmap, SX9310_REG_PAUSE, 1);
-		if (ret)
-			return ret;
+	ret = sx9310_wake_up(data);
 
-		ret = regmap_write(data->regmap, SX9310_REG_PROX_CTRL0,
-				   data->suspend_ctrl);
-		if (ret)
-			return ret;
-	}
+	/* Balance the suspend even if the device couldn't be woken up. */
+	if (data->client->irq)
+		enable_irq(data->client->irq);
 
-	enable_irq(data->client->irq);
-	return 0;
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(sx9310_pm_ops, sx9310_suspend, sx9310_resume);
-- 
2.53.0

