Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793919821;
	b=WrbwS7rDbSKW86JQbY99OdH5s8DjsqVc2Dq/oSK5whCTXJTyu2YLzKzVc7lHk+pCShQd
	 9EBD2k5jGod7nZe0+9jhkOKFEL1ljZb/wMQRf+2GTSeBKZLKv/A3DTtutRMfm+d+6B+8Q
	 UxsDfbWxuFQeODB3JNT239CGEo2gRx/WAwiOigxKCAifQ90fgpt/XOjUwd8EHuXS1IeDk
	 Bkw9zYkkm3K09RPZlM3veKkjpvMISwuR0hYaX5kOXgy/K22M/8F24lzdVGzMDJ62dgHoF
	 txiZhVGxCX8naeHavyAcwAROhjEYbPZqIqesxiAul/4vDMdH7mbpVBsFffBILaY9R5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vfF/zL1HCGWmzc39aGM7Cx1wAkHKEMskWplLH7mdoFw=;
	b=rBkriEBe7z50OEf3cZtalwcU/fZbgrVIs0c0Hjp6Hh93zUcis9smmtjNWCrmISunOqsK
	 OHgoVACHCGaNj6EJqyVSqD+TZdvs6889iBkQN9wSPbAj66hyRFL0sftmdQzfyxu68j62c
	 DWW5rHEQmgBPQf11RnpjjbucqfbBBU+9Vt1cvV7bo5l8CSvwW1GCIQN+1VK9EHehhWFYz
	 BngzuTED1Lj8evF0DStwVZD/sSNb5VDjwKfRyYf0LRuQJ09RueWOSMDYEdfz21HFZSygH
	 561pz3p1SGT6pXVgycfQepbMM3Xh2+kXSU0mAZ9QJa8EDRq3hSSwZLq8lfmjig68o+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LndA58dN;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29009606A339
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29009606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LndA58dN
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so426645e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793919818; x=1794524618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfF/zL1HCGWmzc39aGM7Cx1wAkHKEMskWplLH7mdoFw=;
        b=LndA58dNBOpHOgDIA4pjmq+84QQ3Q1xUWfC4Mf0dBfJ3M/y8ucfa1MUBpcdZ/lCY7q
         3Ug23wG+xMabY3yHGNioYyMjAq1uIvGLCrG2JnrxLUIjK8txWJ6SPbDp7PGlLItmSJIf
         uAtOw4feivI9KoRcTu0hsFJvlgqtKpS2myfQ2MVzOzlOybHWv9bD9SXW/sJfX+a180bw
         5OB2ehhGkAluGNC68Eq4vqcbqnUGD3ZA9ilvitmY6n0v8oyyAK4KRPkU4JN/R3+CtIPh
         fVomz7612P3o9gMEQWuI536z9VueNhzJx2xJdBPLsR+UkMiZuTO5pqGEjoGSlMLonXq6
         ikbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919818; x=1794524618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfF/zL1HCGWmzc39aGM7Cx1wAkHKEMskWplLH7mdoFw=;
        b=zuLeiP5kyjMTQIrfIuNgw8E6v8q42sq3+yEe9Oc4Hx0kCjGT95szCC86Q5wxm3pyuH
         W39j763ve4NCHQUlhueHL7kQgHxg9+xM4VpHkd1KTrkBITUwrsEMlVbfXM40Z+Q8Spl1
         RCft+c7j7djrq7LOm/aSSg0CLARMyjMZJsKATpMxzfm6pvBwmyrldhgYrRAzBmniMscs
         8YJVodPH6wFn7CblVdI3PAeigXUV9jcZQODYItVXmx5CJredjNSSI1oRfL+8etJguEAV
         tAkUdKNbNgG4qBV6NdzEhyYG/yL26dH/B6kU15tdpeE20OVxGrZ63bZAHx+yONDqXVFm
         YyXg==
X-Forwarded-Encrypted: i=1; AKwUvBw6WW2PJ7J2aOwi4W/ZS+uFmDYnerLYRaQF/wBao29v1wT6W3r/+5x95p23AoTrobdBqdUeP8C5H1ZwIiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8Zr9J4JCWLyuuboZXgP6Fa+xAfK+sNOqwdMDc7N2GhSMwqvU0
	vMEyj78VpKZqPGArYIrFIBvQaJC4AJngZZJoW4b+RKbiR60TFnHVQR2v
X-Gm-Gg: AYBFou2D8Otu/EydboRZr6OysXvBhfpR+LSUy3PrexpA6MDTOfXX0lE/Xt6n2OxiKU+
	+YccFWUpy34jxDKgMe4A9Yc+YPlc4bbqFaNmFxOJ4fm+hWOrrQsdyW+bB9E2a2AU4qnbWGBsFW2
	o3+TIKjV3Rz/BNNJzqn8HDdn1g6Ldc+CRGZpEI0LV6yLD7bU8fi4Qiy7FyDU7DH4e47kgLplz6r
	pD1yLMnqt2cmbdEn9Ty0Nmv9eI5b1/bUwtzPyNesIlOBvHsSMeJpozdxsM1ZNwFHa6y3xNOUxFz
	6QNnDrgI2MVgnBgR4ddnZfqsc+9DuBg7I7b2nvyHLqsS3viuBzcQIGYNZdALgzlnY2Z8tSNzuFl
	mEXK2ZVFYbNrtOsy304ZZPF2gk8RdAneILFFP6CpsBNqZRfSjudk02iSa8d7ZW2MS3xVKdRouxu
	sbELNUVipoNm2WGDdbph6Ynfrz6i9W3u8CyzbAjDesnKzgRynCDG4DdGRh2E1oowL+h9RJUbPSt
	QRvzw/tBGrBIPzQkVwE8Xn672C6a+LtqRr0+nxF8U8Vh0mYgrGWwNHpEjwBMdlGlRTxgMAvRUJ4
	TdIZp4dZJLcXmk8+fPUA1UQivi0PqZE1rS2T/uiwb21oyEXo0D0jqg36yqiylltQAvycoQ==
X-Received: by 2002:a05:600c:3e8d:b0:4a8:cb23:f71b with SMTP id 5b1f17b1804b1-4b6df5eaac6mr8963635e9.18.1793919818475;
        Thu, 05 Nov 2026 15:03:38 -0800 (PST)
Received: from figssurface ([176.223.29.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e2029209sm12267215e9.11.2026.11.05.15.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:03:37 -0800 (PST)
From: Afonso Figuinha <afonso.figuinha@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] media: ipu-bridge: Add OV9734 to the supported sensors list
Date: Thu,  5 Nov 2026 23:03:24 +0000
Message-ID: <20261105230327.10852-2-afonso.figuinha@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105230327.10852-1-afonso.figuinha@gmail.com>
References: <20261105230327.10852-1-afonso.figuinha@gmail.com>
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

The Microsoft Surface Laptop 1 uses an OmniVision OV9734 as its front
camera. It is connected to the IPU3 CIO2 and described in ACPI with HID
OVTI9734. Add it to the list of supported sensors, so the bridge builds
the fwnode graph the ov9734 driver needs.

The ov9734 driver supports only a 180 MHz link frequency, so list that
one.

The change and this description were drafted with an AI coding
assistant (Claude Code, model Claude Opus 5.5). The author reviewed
them and tested them on a Microsoft Surface Laptop 1.

Signed-off-by: Afonso Figuinha <afonso.figuinha@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a..4982b77de 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -120,6 +120,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
+	/* Omnivision OV9734 */
+	IPU_SENSOR_CONFIG("OVTI9734", 1, 180000000),
 	/* Sony IMX471 */
 	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 	/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
-- 
2.53.0

