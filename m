Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837D4411A04
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270383; cv=none; b=XB42F2uHw33AMt//5TjrmWj6zHTeJWCzHPh8I65EmSNbtTbytsEEHqgWgVjQpKFBspuKMdhd13mh6nS7kh6G9+qc1WQI5WLv8E/8wCRKUUoC32HgtdVNZhdw3Q1iFSl5S88U0KCnJT1mfi0EOE5lAY2U2Ptvbv9wQHE9ZbFZGKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270383; c=relaxed/simple;
	bh=450tFLg7EnOAPR2yDMHJYBlANAdWJqaRzrSNWvypPRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uBgyBLfgo/EQlQSa/tP6ppv2M/eyM5yQN7uxEpzDhvjQZEbAeR3yY/U6LDQN+vFVv+RJjgz2pfcwV/gYYMVYbS6xKY4JKYYuwqV4EaX+D+jZAK97fskHTDrQ7mYLcfTV/rtI6qL6zPPYOV/+2t8SOxJjPxPS3JZegu4zjO5fKYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMejTjHW; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMejTjHW"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5bso19532021fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270379; x=1790875179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdnRArbPWf99f27wgWWClhvY6JdJmK7JETplDExRxWg=;
        b=aMejTjHW8oOq/UnY2pD6qAL+vM/0nT0CxS6Ov7iOSBok9G9EqggD3VFljlfAilvsG8
         a3yntY8cahIE8urV0FN1gjnn5zJCzX2ZDt9JAZoB54wVA6xcxLQ43n9QSXI9hCOLLeaq
         QWNmov9Vb6oZUeH5eYZIGGdLjDoKGvBSQA39kzFxWpWk83Wvrnoxe4W+dDUQbZBfTvan
         Y3eTwNO4FF6obcgk180YyXHY8DdoqfVl8Yp01r/MKrVPhJOrCiy4sqw1AyjD79/u1eV7
         uYPsVEIA9yh7M/QOmzKFgJtZC/iY6rlqxNrGCIqkcvDemAhdOGdAQMMsyJSSwFwpSCTY
         iVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270379; x=1790875179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdnRArbPWf99f27wgWWClhvY6JdJmK7JETplDExRxWg=;
        b=pdfddxyGe6p4Nuk2vRV0cgoOGkoV7KFRoghk8pY3t2G0H2VOAtygC64ZS888tVf2mB
         PAiEaeHndkXd7LMeQVtPbj23d2TMLWNuH+WhHKvom+qwMAk0d4/p0yFH79Kp/6o97fPz
         szwPkDWuA1CHFGfALYSQY6FIabyuw3nOWeSiG2nWflOwSHB5zaRgvYSZQ2xqX8XsffRt
         daKENftjyNyKJAx0YrWc+EVk/LcwYaHoXmYWz3wRwUsbkg25V4t1t4iDcLzob3ckih6F
         bOvWPx3iDkJCSyoA7HxZUj4uQUkdD6n09DEjKXKm4hUbigNrs4JOj1drv+klkBqK7+Pj
         koyA==
X-Forwarded-Encrypted: i=1; AKwUvBy/fJL3zh9JTH45KKpAi31+erlZP+pXtal96PYuhSg0axpp/6ymQTc0mbPJGJXm7fqVC+T1L9gWHwoR624=@vger.kernel.org
X-Gm-Message-State: AFuF++noifM6Wh5ePo5yTAZFe51bQEvxfcS8JiIhL5m9BIZ8GHhX34CM
	mHNX/iY7kz2o0KZcjDhq2iDRZiHOqPh+aVFyirxh4gui1YkbTvc1bbpe
X-Gm-Gg: AYBFou2HG/EcDPnwxjLHjCRoVC+kGNxg6tj/KStPJLn06Mac92BC3aqSmX7sCMkFuUR
	+P36kVSZiVUfjL27NlhKvq66OBzkAEyWd/DWl/iJuvHAJ0QK8YCy7YpinNRTvwDmKYfOjnX7dgZ
	1GtN83bTX6mQCkikyi4DFES0csIKHPzaXArtvlK2nEsKLC5Dbie5fJhacbWyPiyYVKywlBvvnIi
	XzHKfbjgGSPyCbOKq8D1sluo4M/h8JVykLbp9tqXlZy+rs0qpBuqGYzlApjpZId0kLIAn9SguZF
	gBJuBlkThl17cRjvOShQaX488+hS8MeEqFNCEJn8UOIhafBjVGy+ZNRxDA2iSyrshvOlEmYAFXQ
	a00J53AhsHfFZri+WHx2efW+MwIfhpFdJkoY+EHyzC+A7u1IqI8blUvMxe9jMcCRee0rTxcw2/p
	76ZKfBw3OM82xyzNE7F8LCXVUctWbUg/T0SGQz2RRj38ZWJJ/x21tG+gQ9joKnnZGx0zIY86GDR
	kZzCSMBpdFX+qc=
X-Received: by 2002:a05:651c:554:b0:3a5:e792:2dc7 with SMTP id 38308e7fff4ca-3a63c0e07demr8418331fa.15.1790270379301;
        Thu, 24 Sep 2026 10:19:39 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf2c4aesm9450601fa.8.2026.09.24.10.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:19:38 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 3/4] media: i2c: vd55g1: Add ACPI support for the Lenovo TBE20A1 HID
Date: Thu, 24 Sep 2026 20:18:19 +0300
Message-ID: <20260924171820.1179823-4-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924171820.1179823-1-koreev.r@gmail.com>
References: <20260924171820.1179823-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IR camera of the Lenovo ThinkPad X1 Carbon Gen 14 is an ST VD55G1
enumerated by ACPI as TBE20A1, connected to the Intel IPU7 with one
CSI-2 lane and powered through an INT3472 discrete device. Match the
HID and take the sensor version from the match data, as for OF. Only
the analog supply is switchable on this platform; vcore and vddio are
always on and fall back to dummy regulators.

On these platforms the CSI-2 endpoint is a software node that
ipu-bridge attaches to the sensor device when the IPU driver probes,
which can happen after the sensor driver has been bound. Defer probing
instead of failing when there is no endpoint yet, as the other sensor
drivers used with the IPU bridge do and as v4l2_fwnode_endpoint_parse()
itself does for a missing endpoint.

Tested on a ThinkPad X1 Carbon Gen 14 (Core Ultra X7 358H, IPU7),
streaming 804x704 through libcamera.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 6f458f611..64889c35d 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1903,10 +1903,9 @@ static int vd55g1_parse_dt(struct vd55g1 *sensor)
 
 	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(sensor->dev),
 						   0, 0, 0);
-	if (!endpoint) {
-		dev_err(sensor->dev, "Endpoint node not found\n");
-		return -EINVAL;
-	}
+	if (!endpoint)
+		return dev_err_probe(sensor->dev, -EPROBE_DEFER,
+				     "waiting for fwnode graph endpoint\n");
 
 	ret = vd55g1_check_csi_conf(sensor, endpoint);
 	fwnode_handle_put(endpoint);
@@ -2084,6 +2083,13 @@ static const struct of_device_id vd55g1_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, vd55g1_dt_ids);
 
+static const struct acpi_device_id vd55g1_acpi_ids[] = {
+	/* Lenovo ThinkPad X1 Carbon Gen 14 IR camera, Intel IPU7 */
+	{ "TBE20A1", (kernel_ulong_t)&vd55g1_versions[0] },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, vd55g1_acpi_ids);
+
 static const struct dev_pm_ops vd55g1_pm_ops = {
 	SET_RUNTIME_PM_OPS(vd55g1_power_off, vd55g1_power_on, NULL)
 };
@@ -2092,6 +2098,7 @@ static struct i2c_driver vd55g1_i2c_driver = {
 	.driver = {
 		.name  = "vd55g1",
 		.of_match_table = vd55g1_dt_ids,
+		.acpi_match_table = vd55g1_acpi_ids,
 		.pm = &vd55g1_pm_ops,
 	},
 	.probe = vd55g1_probe,
-- 
2.55.0

