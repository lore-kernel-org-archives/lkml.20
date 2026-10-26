Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013055;
	b=lzkyTgW4qrPW5J3jh8YT26PXhD5y3dxIn/pZM1ZbTNawpCAxUmDSebbxBDrqijGYUaX0
	 A2Wk2dhLjQEmNUWdhBjxMzY95AOtzd7/R4uPqcSmhy18IuOuPPz62hYmWh/mGFS4BCYQ4
	 IFUgojkbxsVuYqfpnLe19XJIuClOYyRYXDEDon9xC4nBc7sEZg6irzY4HPCrH8NiCJtbg
	 gO/jA/zEV1E0zt7rvabQMTR0yjY7bqR2tHdGIoxF4T7PkeKOfnRWfFyJKeQIPRwM+ZGYy
	 RZuCI0ym1MYpVuDeOD11QjXM6IDaQNkamYsbdcbteZLpvCHd+q6SM1+CCBHvfitceWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QW8Fe3Jy6z90WxbTUI3UawGawxgOjRW4umx/OGSsESQ=;
	b=hPZ9PiO6+os3sF6/CODNvfTzWFMLGq9gfF0kU9Qr6mYMQ8JGsSJV1yDJ6/D5rex+cKpo
	 jwKxClBSNPTUWx2UWmfzrnIhJyg8Mr9PEkjWydpk5rOs+sKWCJJEL2zfnXfHR9dGiEUHY
	 jrIBggqMJeDjq7JbrrMTVDqZSDmN8Vp9g5tkVvE0FT6j4c9wz1HlpTA2/Nu2JmzF+rfLg
	 jrd+G1WLjfJavF/ioZzVXY5EjgAh8JM5uq40/EK3eJSlFH1AZCu78DCpQ2jtuD+eiNv6C
	 Q7459ETfAPtD7PGSMzWy18EZnywShHCfksZWPvGgoJFZ75rJDcdJckHlcpSzt1cdKmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ow+gqurj;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808BD606D88F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 808BD606D88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ow+gqurj
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac7538422bso410755a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013055; x=1793617855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QW8Fe3Jy6z90WxbTUI3UawGawxgOjRW4umx/OGSsESQ=;
        b=Ow+gqurjbg8zk/N2U40hrZhhO90PZ8XpY524EBVLU/qKQ5k2GcDjNNN9r5uDjc8cxt
         sH8ZkvfFzXGv9nuqC7ujdKSTSPOXYChlNzRlxoIgyBfsPK4zVXz996rxeEwL8mc0+x0v
         xV7h5N8/WeYiPmpkkfuL2XQ537/wdIwuHdisNakfQ8V47s+aYpZmqnjG07g8kYrvijP+
         3Ysl50akL5H/UPr5VbUZlXMJUPFlFL5yCrILp3doRWhVWhMgapWG8kamDJezbEXCOLAq
         CPVwPp8513u0WPKNcwwz4w9IeRZxemrP4G3L6BTioIWnLCYKAMQHaxnxJHvRdZJK+aDK
         jNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013055; x=1793617855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QW8Fe3Jy6z90WxbTUI3UawGawxgOjRW4umx/OGSsESQ=;
        b=hD3PAgqkoOm1Vy4YHwzvi8L2AjNaZVmKytoxG+ZRXkW8qjaROMfqPTrs++RDgOGGHa
         D/NIiOStNS3MPgeMQ0ETBd+4/JH9+YmHvJgehCEOo5Aab5yrWRCc3V/J6DsT4oCrZWtL
         3pt5RRMvLqDgSrXhV1bRAk2TU+NIrHn3nbWYWzISqow7gNUugv7JUuKeN3Q3N5xn7WnG
         qDeSzGGFdlOGfNxvQmc4+9Y8fr7jlGivjLr+RZif3HpIvcg9IyqMB3syZ6PrPRclGaKC
         BWLdEda8dTLKlxTbwf8Y8d77L7PtIUtLHA9DUaVDBgvZjtfTbGsSiLNz6t7jaXyMsVdc
         rdfA==
X-Forwarded-Encrypted: i=1; AKwUvBxj9a6uJ39XtH5dLUY1NO2Qd1EEj7lux7N/B+gd6ojD5wpnpGlPCz5aFBRIW/Unende/uefz9LXFJPybJ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIy7Wv2NxWZ3atYPZyz82hNF5/AXOtHZO1gKcutwrpZTouReBuE
	q5vCWVYL5o+Dd1M2l0Vf0JCiuCWOLOPH80Ueg7fof08uDSjc2zk7tg5ejoB6cOPCJ0k=
X-Gm-Gg: AYBFou0PAyg8vQp20XPjFaJvp3UJ0+d9MtCFSp3U5RkuBqqI2wuMzTZHqUxrdxSW4Ug
	Vu0TsngvAXmFjIHAQX09OSBZRl6oVO16vmLHEECVUr8/Dt+QWPliFTNziGdryWgwKxq+yOkAeJ5
	g3W0mQp0etaMehXUOpA+mg6sYhG8J4AjPBTR+vjQZnVIjJAEnGUUG6yOhiOoeXgf1kObQ4Gg26I
	9y0QwUAgoc7LZHkva6j6cglwUoHl8mkNY6rVxrnAV0ZJ23G6WtMW8TqLXWqHnKsgx/r5RBnxyAF
	BVVzeLMZvaY4ALxvAs0oy180205fztXDai3VJpu1fUR0kQPTHigH7+U8Iz8uYi6wVTWFBZzU7a1
	qwjcK+WHhj/GTGMcsyYRMH6ThjHvHnwlDZnbepnM0XLxns7PcWQ9UCmRoYQOXUf+wowYrhShUWw
	6sSBMGumStxCghKS899OvVrgx+Z6AlM9Q1vjpWtlat0zBEaMTK0mxjQFKQrbzwDZktrz9l69efN
	fUhZtwlsaCMsbrT9sR1UYSDaYH/Eqv3vPD3XmqjBqxAbVn1maVo4I9CPb22Czh0nvN4ZXTxAWAH
	a4vxVvOOP5rC4BqjSAjauvzzHGdpfeKKvqxMHOFAQ3kt+HJoP74gOWKS6N3s9VwMcme3J65tJjB
	8b/3kyDUWwE4BJqElb8A4p0YaX7UANsyf1IAoMklApOQVK40=
X-Received: by 2002:a17:90b:55ce:b0:3ab:be66:ddc5 with SMTP id 98e67ed59e1d1-3adeb15d0ddmr8631899a91.6.1793013054865;
        Mon, 26 Oct 2026 04:10:54 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfa82sm8023593a91.8.2026.10.26.04.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:10:54 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	andriy.shevchenko@linux.intel.com,
	linux-kernel@vger.kernel.org,
	Antoine Pichot <antoine.pichot@gmail.com>
Subject: [PATCH 7/7] media: ipu-bridge: Add a 90 degree rotation quirk for Surface Book 2
Date: Mon, 26 Oct 2026 20:10:32 +0900
Message-ID: <20261026111032.88355-8-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026111032.88355-1-antoine.pichot@gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
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

The infrared camera of the Microsoft Surface Book 2, an OmniVision
OV7251 with ACPI ID INT347E, is mounted rotated by 90 degrees. An
upright scene appears rotated 90 degrees clockwise in its frames, with
the top of the scene at the right edge of the image, while a frame
taken at the same moment by the colour camera next to it shows the
scene upright. The degree field of the sensor's SSDB buffer in the ACPI
tables is 0, and so is the rotation field of its _PLD, so
ipu_bridge_parse_rotation() sets the rotation property to 0 and
userspace has no way to know that the image needs correcting.

The firmware is wrong here, and ipu-bridge is where the firmware data
is turned into the rotation property: it already carries DMI (Desktop
Management Interface) quirks for sensors mounted upside down without
the firmware saying so. Add a second table for sensors rotated by 90
degrees, checked the same way, with one entry for the Surface Book 2
infrared sensor. Following V4L2_CID_CAMERA_SENSOR_ROTATION, 90 is the
counter-clockwise rotation to apply to correct the image. The entry
matches on the SKU of the 13 inch model, the one checked; the 15 inch
model has its own SKU and has not been checked. The colour sensors of
this machine (INT33BE and INT347A) already report 180 degrees and are
unchanged.

Tested on a 13 inch Surface Book 2 (SKU Surface_Book_1832) with a
7.2.12 kernel: V4L2_CID_CAMERA_SENSOR_ROTATION on the OV7251 reads 90
instead of 0, the colour sensors still read 180 and the orientation
controls are unchanged.

Signed-off-by: Antoine Pichot <antoine.pichot@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 3739c4a2a8..51ed4283ce 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -281,6 +281,23 @@ static const struct dmi_system_id upside_down_sensor_dmi_ids[] = {
 	{} /* Terminating entry */
 };
 
+/*
+ * DMI matches for laptops which have their sensor mounted rotated by 90 degrees
+ * without reporting it in the SSDB.
+ */
+static const struct dmi_system_id rotated_90_sensor_dmi_ids[] = {
+	{
+		/* Microsoft Surface Book 2 13 inch, infrared sensor */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR,
+					"Microsoft Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "Surface_Book_1832"),
+		},
+		.driver_data = "INT347E",
+	},
+	{} /* Terminating entry */
+};
+
 static const struct ipu_property_names prop_names = {
 	.clock_frequency = "clock-frequency",
 	.rotation = "rotation",
@@ -474,6 +491,11 @@ static u32 ipu_bridge_parse_rotation(struct acpi_device *adev,
 		if (acpi_dev_hid_match(adev, dmi_id->driver_data))
 			return 180;
 
+	for (dmi_id = dmi_first_match(rotated_90_sensor_dmi_ids); dmi_id;
+	     dmi_id = dmi_first_match(dmi_id + 1))
+		if (acpi_dev_hid_match(adev, dmi_id->driver_data))
+			return 90;
+
 	switch (ssdb->degree) {
 	case IPU_SENSOR_ROTATION_NORMAL:
 		return 0;
-- 
2.56.0

