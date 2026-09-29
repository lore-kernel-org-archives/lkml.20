Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC0D4F4D0D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674133; cv=none; b=iq6WfoVmzQVkrKrlWKfBG7FgH3O0X33yIgO9Hsd0pl5dL7G0B+615y9lCBdUBRJcu9ioHQ+p3d1whRyrB4nbJ1YOAFzlIY6IXQPj8d9HioB99jIQaVgxTdV2/D2H6a67Nz+m6vOdlB2s1jh/dYu83o48+EPkD5NfRLVZ9hbyATg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674133; c=relaxed/simple;
	bh=nwYtLAhnmbrGjBGv6GSjt3m/Fi9B5PcJQQlfDeJWysw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sg6VvBcZP9exV42B50HBNby720k14MowX2UXP3eQo3kIHGEYn3rFif8sxT2VmibWVbqOwl6EKWVpaU5VJXpCbfuoBK/XNYYDvyXp38S52JwWAOr1yBDctyXex/JcteLh41TWpFOIHm4kZwRE4Zl02HGcAS4rHhdqqjRQ/auHbQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ik2qnq2M; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ik2qnq2M"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b76694fb7aso645420e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674127; x=1791278927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRLBtxUbLFcLi1O7YY0Vg1lrhetJe87BpP5hyxgIAws=;
        b=ik2qnq2MMje2h2C8E91fWO2kOiQBteMKS91ZPN1UDksacQTjCalAjpB3TY1OzP2yxy
         AXqjUrwuT0WZ3K7QPoSSJMiLgJq73o+m8Ur0Za/ecXS5mDqRvnWldG26WMQ0ODdO9PyL
         OlexUl4H9m4XvXe0QrPOBsgDyEmCIsTH53D/pFFNLOomZEPY9KhHsvBo39/V21qrKWKN
         Wo8ik3XEcMJqXbpqpiYWt5Ik3jEXmqGECT0FmoLFFVFzqrktBknFbTTq8kJ+NIZ+vCMj
         QEOINd+KkJrtpLX4Y5bSVknFelK3pISBvS45XqRec0IhMSzv1bivwX0GKmqw/2xjZyXd
         aJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674127; x=1791278927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sRLBtxUbLFcLi1O7YY0Vg1lrhetJe87BpP5hyxgIAws=;
        b=KtApBcsJmZSp6SsIX2vhRdk4H5Mj79RGaHeO6rky4u8CpuYh7KOYf2NhBi4Q/Tr6XC
         43zRYCm3sQEzi8IOBMqlz4s24zUj+JylkM+cbu8BEaQ7Ux4gIZMwdEcTZQI3S/19sIb8
         wcdanqm8RzrSBiPN3dJW3qco6SpkxTC6YWxbi7RrX8DmBiP8gbMlZq2ZQxs0DCZAoOFT
         839C6LDktMxEA2Ow5OHYM9DeDybKUpeBrBM05YqfNntxq4vNelqGGP7yCskorUFcxhZX
         LqNh+eYi2lBmPxBh7S/oVyGBsTmz0dq5aHjlZcKsGINW1S3kAdUkPC9nrkEzGScXMMks
         DdDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxt0DvbZhNAj0fiq4TbTCHhM7LQZb7JSTOZ7oJzRtgb1bXTfzJD9gO3Lg51nTtHtqMldLn27RFmlVN95cQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAijeOPOM2iI+n9Lwoh7dO1utF2NMQLQge0ydNkQSfUNQ68xJo
	RZpuHRbxXmly3gMY62/cX2z4B5QY9dg+hgB7Wa3QVLoa3s3sNz1VQomg
X-Gm-Gg: AYBFou0vo5xlNc0JUU7/5LgYJQCA5/dFHHlRMOmZxWEdAY66en7x9EBCPIZBeBTi/V7
	fGbwo1nM7RJ/7XhX7YvFMwzlyrxmimLSvRSsfCa6LiUXPEUTRfz4baChEBaSv/GCR6vErsAOU0j
	qH6JGY28/yz0kUvD1RBAdieAYOWMgW/CpiKkDAYttA5k2jmkh6+tpx9Th9b6WxxGj4lsEE1YAB2
	GK6xlaX71wszc4bs+4whVCqwBB4k+23D/TKT53GbLUufd0+7JEmY648idwZ66RCh9euiTbq9pPL
	gepjYpi2gd08U4hxfU9lSVe2ROkjsHNJQT7UiIhrcwa4vxouqPbEEdGd2i6sl74mIDgSzU+m9ky
	p5y4jVvvPDvsuvsITOPhIEdnlyXsEToRxRbZA4SBUWCK+FhdO5fg/6EHNCl1+q73s+JhdsnrC6Z
	UdNpWB1sBtIExPU30/+aR62/Nez/xmO0OzzHNVtVlKmh9pseK8xYhGO0rNs9XomibKQhzyWYkJG
	ANfBJQHQMjd
X-Received: by 2002:a05:6512:2386:b0:5b8:f430:b617 with SMTP id 2adb3069b0e04-5ba2e6b132fmr607252e87.45.1790674127261;
        Tue, 29 Sep 2026 02:28:47 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb0bb2sm1216403e87.37.2026.09.29.02.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:28:46 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH v2 4/4] media: i2c: vd55g1: Add ACPI support
Date: Tue, 29 Sep 2026 12:27:01 +0300
Message-ID: <20260929092700.1776966-6-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929092700.1776966-1-koreev.r@gmail.com>
References: <20260929092700.1776966-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an ACPI match table with the TBE20A1 HID that Lenovo uses for the
VD55G1, with the same match data as the st,vd55g1 compatible.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 8043eaa50..e3939bb9b 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -2081,6 +2081,12 @@ static const struct of_device_id vd55g1_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, vd55g1_dt_ids);
 
+static const struct acpi_device_id vd55g1_acpi_ids[] = {
+	{ .id = "TBE20A1", .driver_data = (kernel_ulong_t)&vd55g1_versions[0] },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, vd55g1_acpi_ids);
+
 static const struct dev_pm_ops vd55g1_pm_ops = {
 	SET_RUNTIME_PM_OPS(vd55g1_power_off, vd55g1_power_on, NULL)
 };
@@ -2089,6 +2095,7 @@ static struct i2c_driver vd55g1_i2c_driver = {
 	.driver = {
 		.name  = "vd55g1",
 		.of_match_table = vd55g1_dt_ids,
+		.acpi_match_table = vd55g1_acpi_ids,
 		.pm = &vd55g1_pm_ops,
 	},
 	.probe = vd55g1_probe,
-- 
2.55.0

