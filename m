Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793225112;
	b=p5Ef5It6FjGj83qmbEigU37kEQTde0YaCMdWhn945Qk2GCiaae99B4agPLeoo6OEDaIG
	 l4Arab66nR3LcqAL3MLokzgQajKSBCvbs4b+mYtIZ7tQi0ZkW7PwwX3HJskrzUYHfnjkc
	 AYOEV1bZERH9bv7swKUlh2gb6xVpHdWo6NGjXouiLyvid3Bz1MoGyBEUfJ+CDnsoJK8xZ
	 3qs4LswJTOrfUAt42hNUFK2B6+p9CJkmiEl6cXqb1lUEz0reDugNMVi/XWvQdYDxqrnof
	 ENFgYx+F+P278OSAPk9gAz1PBtslcoeOsr0XhQdCbQH0iX1XLn3U/5JP8lLNPlr4b0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793225112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=06C5fk8vnWKJZkOtzBHieSCw1Q9gegELEx5Pde9/C0s=;
	b=l6r3UF7IZzxGla+/3qgFtRWR4w8kaSHUH6BQpAr1tQIPkvHiXJ2sePz1H6jTEfg/oYkI
	 ctA37RNfDHlsARDE/zrt3qV9VpnWULPYP5fKKdy7aeAAXszvoNSmGAFQsyl817XE3AEZg
	 ScpraStEGWY3zI/6HwA70OXqX3z65TFygaXpsoctHuR5ReV1GUxLUXrYCbt4f6BDZWNXX
	 pYxydALY9qfaXEqdRYuozVSj4IVwMITQ24RGjAuz0a6/rWxtYf14LKrHL2BzqQpGSUe6K
	 AHu4bjhKRr08UrGfoj0dbX0Kyalvn/b2pzb90QsxYqmhKej68LHaHlvafdqlaA3PKew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLyscfUT;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307C9606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 307C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLyscfUT
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3550c917fd3so2131378eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793225110; x=1793829910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06C5fk8vnWKJZkOtzBHieSCw1Q9gegELEx5Pde9/C0s=;
        b=aLyscfUT7ok5ZL1xxGdqpRKmcqVbB7NaZ6j2TiZqdpUneR/ERimlsXoaneDTf9qGWa
         Lt6C30VJOSy8iemD91MHmOrzanhRjOdBLzTi4yQNwxZopVWr5cbyLsGqUY+cYDZ+K4QE
         SfiuZFFcykE+5JqER9fuaX3BlgrEVTXE3poyvPStEBqn1JZiU4VX5HaukwyiRpREhY+p
         Qi19UkFwR/IaqQK6xRiPU5pP+YQw7IxEmUFfn5RHizroISX4t5m+Iy6D4Sex5Y9Utn4t
         gB2B+l7HLGeqGECMQ5HZs7q8JjSAbmFeCBhZRuSICZcyPnwNT69FOvityPfwEjyZKhJY
         EtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225110; x=1793829910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=06C5fk8vnWKJZkOtzBHieSCw1Q9gegELEx5Pde9/C0s=;
        b=I3n28XvJKoJ8h6WFgYCyeYPeoP3Vr+tEXCUrQiv/Yq44GAl3t2Ef4XrNVdhG1mK0hL
         rfXUJEzzyyucffcoscWmgb8EsJcGFA8CISu3FuEt+QwPAQKZyXb9NZDyr4FXcGGw+JSg
         FTSsVhutfYFeL7daWCbF/IMlqg1ltbiid3maeV+Iavrp5EXEkbR1NbmU4zUPSYBe6RBS
         TttKJF42CnHZyaV7XFqkBBDFhrQMpZWt6Zkdk/8nsFBnzRfitSXEbIPsBuauIz4K63c7
         fm9p/mRGRL7APLANaa1CH2OfMp3M4EiLRkT+5sg+oHdC4dZMXj+KJ8K1R/z8gSNsySOH
         6NQQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhVrGDT8pG6OhNsRjPVOacFLcUh5bVsrDvffS+FVFcM4z5K676l71SnuZ9BdPBhP8r+VS9fMoePnxZJqc=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5NwXiAFItYJfxflF0x/b1Klr2dkTciJ3YGE7+WW4Hg/XKLqj0
	yC+RLT9nxSR38SN0Y+Xc2SODi5Ae/rjLMC/pQ7tmP7cRSaxll0O+PRBh
X-Gm-Gg: AYBFou2+LVDG8Lmf0/a6dKozLM9hf10tRzH2u2b+A1dv3lCtm2gQSp4d2WuwyW+UCqf
	Swsn1Z7w442aIMVf97LZy6wsVr8nJvelzoqYOJkb8lx/J29UJfzNaY0aRVmSBe7MXi0bYDJWLf9
	TjljUn1v0kfISnAlvDBFTAmQdkUISVWuNw1rRIuMl833eT/7nbIuR/eJKeP6l25wAzKQI7taCZi
	10UD7RhEEQAytWa4xStuxNDTDFEnnEP1Lry94rT6ZkjSXHnYzVo/eToXFKRqxH+XjH8yx5JUwvf
	8SLFgIbM63y+tdlDyyXCJ147toozBwEdlunPyeHxYdhVRoxIDY/9FAFlqGa5TLCP6rN3yub5o+8
	mM/fwT8S5KIXVGq5uvja78GqLm55Yl4X5PYKmlNvgDsfnMUMVtLHJ/McLzyz3Jc3N4Z9AgcsIgD
	UNYAKblY77WWtYuum01sw5MTE+D7BnEOCk4XY574w9RTbwv6uhdx4BJ1Ccn3nX4aJVG6ib7fcNF
	WyU6S9rm4dQkZN/t8RlUnGPjX+wwo8AJ+GyOECa+GEIHcyWoMVvIpgjfXOiL4cdzAX1ctQDd1oD
	/osWXHuJ0zgu5FWtpd9wMs0/niUAuENrPSHpJ1nOcH4rkC96GCsmh7ue45gPchIEimFlm1XOH8f
	Yzqek6e6tYFLot3y6MxDj2L9SV/PdM//RSWhUhFqz5XJRCrICIiyHgvSPR4YXvrr4Agw5SheOFF
	dsR3wBnXHIBv73icjKLKJJ2BAYW7y+grQPiXCet3kbKA==
X-Received: by 2002:a05:7300:d589:b0:35e:a225:3ba6 with SMTP id 5a478bee46e88-36a203909ffmr4808793eec.13.1793225110116;
        Wed, 28 Oct 2026 15:05:10 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2390a812sm9924429eec.14.2026.10.28.15.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:05:09 -0700 (PDT)
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
Subject: [PATCH v3 3/3] iio: proximity: sx9360: keep the IRQ balanced across suspend and resume
Date: Thu, 29 Oct 2026 03:34:39 +0530
Message-ID: <20261028220444.70121-4-kapoorarnav43@gmail.com>
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

sx9360_suspend() disables the interrupt first and returns with it still
disabled if a register access fails. Resume isn't called after a failed
suspend, so the interrupt is never enabled again. sx9360_resume() also
returns without enabling it on error. Without an interrupt line,
client->irq is 0 and both callbacks act on IRQ 0, which the driver
doesn't own.

Disable the interrupt only once the device is asleep, always enable it
in resume, and skip both when there is no interrupt.

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
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

