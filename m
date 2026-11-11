Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385731;
	b=AJnWuRiCR5Z+1llMaSmAFdincEGeeuc3LFOKaE7YZop84JPWtK9Glx+ma5vOkieBGGAD
	 985IPQ2GA5U+97jmhe1s61l3BjYYYbFdxNQflS8c684gWxU/AGnmCxPi+UcQ2TjKO935q
	 vKX31/zkJi1K8erTd21vAxMqCm44gLQ6cEDvICUZft8ZE+vXPNA+Ujksq6mG2HBVAH/+a
	 o1JVuIrQskZDg0wPqS4IPqcjTE+QNoPDnR1W4XgLcn/MOL+tq3z8No5/vNqxoovgVPZgm
	 nSNcc5jFcRmaKIasN+Zw8P5LoF4bxqVU2PSfCyJZGduM19b8H6msss3EmfACazD2MEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=agS3oe8L0hdPjr48miavd+nPT5T0r6hqPyAhGQquZQM=;
	b=HAlH4pKJ7rxFE2VLLdxzcuWAvLdppD67eaFI+M+Gwd+2h1kpGyS12hpAkaO3eFRhYoEo
	 qlzlh8y2BRoy2vtKzsTpY3F0NpZOOX/jH1D9/er1+C755EnkmO5lH8dMs9xFGbtRF1w62
	 +6qNCUdrlsIKIF1f/UwlRMp1QzSzq/exXPHpsNV4i/GT+x5Zg6rNoyI553xdlr/nEYLVS
	 ys6j9p/cIroeBtznqgrtKcMHjTnhXRmMSNuo2KFM8YjFyEc5e8G7KDr2ZFzo7QB/JguoQ
	 LpwkCLFcIGQJdUn0m0uavTVMxXUDffh298MT5J4Y0N8NLkE19nFOpUsG4Y7duQ5rf2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zOqQL73s;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0284B60A260F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0284B60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zOqQL73s
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d28f75d62so395419766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794385729; x=1794990529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agS3oe8L0hdPjr48miavd+nPT5T0r6hqPyAhGQquZQM=;
        b=zOqQL73shpSJwoZ/CtH2OwVaU2aUb2HCvMM+a/e6wu8s1Qlmi1Er4kcgvMvrrZ1d9u
         eJhrdzdEY2RQYpNztDR0NH1OE51/3oTftK5e7KBAgqulisuvrjMKKBJcxUzOxnYor7C9
         Y67PYyNZ/5PeFAiJXBdcYDuEMAgiiAU+E2DSCY/uMpxp0piIpSoH4xygJ/BjQgYJLDnG
         39p4wMC5VpEqUauyaoPD9gvYLIbOxH07rvIXnm7aRjQryahsay5yymgO+dJQtSP112vF
         bESzBiocfo+Ihj8s6grwL3R+7seqYz2PyumswtaFT3sARFoJ+w/oEE+jPQMgbU2wP8Mo
         DQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385729; x=1794990529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=agS3oe8L0hdPjr48miavd+nPT5T0r6hqPyAhGQquZQM=;
        b=19s5oTSut9BZlXpBAKlZfXuaLv9VxxRSMOltG27oYQ2sUwoULS0VpKSacsyJLJA1Bs
         j/pseNS4QOy4oR99/e1HqXZkG8X8N+36DVqWBVz1Rr3qJnUmPRS+GVH1oS/9RAxqRPNX
         jgFXRIRw08ru6vJiuCglAScrpLZf6QpkV1Q8uLdoXB3R5eKZu1vYRiaSMrc8PXtMSuhD
         T0ZzdFE9td7KRwVFA/3vLxmBg41IwI5rqSoPiFgfUkcmA6uxGfUfMPQArk/oB9tFkdfr
         jg2rRI9YhL7A06/HzoIYS8bFYNMXS/kIv6Gwvz4vd+R7BvEIc3FusJGSvxa2OXmap6El
         HW+w==
X-Forwarded-Encrypted: i=1; AL+hErGDbPVnTyfkUl392H4gTOyF72sAiq6SfFRw0R13O+QlnFgf0f/fYEgz2k4jnn4G586eAAv4cFArAtNfW5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SK6OT1FO4hV+j7z8Uf0Vra1PSRYkQxUGPfHnlftgMZCW9cCHf
	ecw7ZC565Z/ckAZuV+Z5hhdwB64qz0OE38o8U4QipufQ0H0Inpa4znUf
X-Gm-Gg: AYBFou2/PuMln1IMOt+1cMkZfMGVq74jyiD3JXUXnFB/Jhsahy5ZtrIuos1Yg4dYLuY
	0XZ3GW2rkr1Ww3W7Y/3uTalYdWhVAv3ccf4bIxDaWqr7dPHKlnNLf6MuoxdxfeWyG2Ws9m6s7bb
	f0v1VLBG++CQHK6P4/U2JfaoCufIdf4O0H1VKYjwLp+eUCJsYUq75/t52LLmnZIk6Hb980EbgZ1
	aSNjBp85NKMU7kssR/ezwbaKlcWt3omCmaNVwWE6lrXoeDVZBhMDKknYHYL6iq5eTENJEsuWzF6
	WQKLDeCPQMjtoRH73gGK6YYXch2TItNlb4efoX3ZRpm8hXfONbSRHpiluEOPBDJ9C98kOavpRM4
	Z8/sRkSeNCBi7+nUyCBuiobU10ZvB6ChisMdpgRXrSTUiIZwk6Vb8C39N+V2KLNCamRDS5XxZtk
	iHIQ3TZ6ZOE6255i22lIHOd8m6eikGOWgKZnXN0LZGiMfKo8NZPLWHwSmOKgI/3CmUFiuHfNdYN
	QWiOYfkYTicrJW8vqLwOt6+Mjob6rRnXh8NU+k+7vdZhX8W+ZmaefhYVD5a6nEqYEln2x7lgKKP
	j+Mk6srjXee7DVuNLR3meq1CiY0wZzSzb5zVJ7VcXLYRlAngKlBhsnJifUXCnATKqImSNoW6Icf
	SamCdFcOrEVLJWrUFs3TbWyE99uC5TgqPWmkdsUThPztYigOT5LxIoXHmZ9sxVpSpLmDOwcyxkP
	+qyw3FVv6E9ax2sN+1/pc82p/gcMAOwh+PAwGAdQtVo0ttYQ==
X-Received: by 2002:a17:906:794c:b0:c50:6345:e41b with SMTP id a640c23a62f3a-c5066d3d007mr110823166b.46.1794385729434;
        Wed, 11 Nov 2026 00:28:49 -0800 (PST)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm210135866b.17.2026.11.11.00.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:48 -0800 (PST)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH v2 2/7] hwmon: (nct6683) Restore automatic fan control on driver removal
Date: Wed, 11 Nov 2026 09:28:33 +0100
Message-ID: <20261111082838.1418051-3-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111082838.1418051-1-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
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

A fan switched to manual mode through pwmN_enable keeps its last duty
cycle after the driver is unloaded, with nothing left to adjust it.

Return the channels the driver switched to manual mode to automatic mode
when the device is removed, using the bitmap kept for resume. Other
channels are not touched.

Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 drivers/hwmon/nct6683.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 0565ca9290eb..d43dcf90048b 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -1584,6 +1584,32 @@ static void nct6683_setup_sensors(struct nct6683_data *data)
 	}
 }
 
+/*
+ * Hand the fans the driver switched to manual mode back to the EC, so that
+ * they do not stay at a fixed duty cycle once nobody is left to adjust it.
+ */
+static void nct6683_restore_fan_control(void *_dev)
+{
+	struct device *dev = _dev;
+	struct nct6683_data *data = dev_get_drvdata(dev);
+	unsigned long manual;
+	int ch, err;
+
+	mutex_lock(&data->update_lock);
+	manual = data->pwm_manual;
+	for_each_set_bit(ch, &manual, NCT6683_NUM_REG_FAN) {
+		err = nct6683_fan_ctrl_update(data, ch, false, -1);
+		if (err) {
+			dev_warn(dev, "Failed to restore automatic mode of pwm%d: %d\n",
+				 ch + 1, err);
+			/* The EC does not respond, skip the remaining channels */
+			if (err == -ETIMEDOUT)
+				break;
+		}
+	}
+	mutex_unlock(&data->update_lock);
+}
+
 static int nct6683_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1593,6 +1619,7 @@ static int nct6683_probe(struct platform_device *pdev)
 	struct device *hwmon_dev;
 	struct resource *res;
 	int groups = 0;
+	int err;
 	char build[16];
 
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
@@ -1710,6 +1737,13 @@ static int nct6683_probe(struct platform_device *pdev)
 		 nct6683_read(data, NCT6683_REG_VERSION_LO),
 		 build);
 
+	if (data->have_fan_ctrl) {
+		err = devm_add_action_or_reset(dev, nct6683_restore_fan_control,
+					       dev);
+		if (err)
+			return err;
+	}
+
 	hwmon_dev = devm_hwmon_device_register_with_groups(dev,
 			nct6683_device_names[data->kind], data, data->groups);
 	return PTR_ERR_OR_ZERO(hwmon_dev);
-- 
2.53.0

