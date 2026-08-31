Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570313E16AE
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171794; cv=none; b=U1LdfwRN1RIfbNwCpGL9VXQd/Gtz3Z+VxrEt7J7eOYe0KE2nZgpA7q8VHuC60l/wkeSWxOCPozuRbQjMPRenpiJGxgsoXaJlPd8ARCtCFFIF9uJw+kXdn/8bXPHuDE/7VkJPr99zp9gSz3JOoKqLbU2nmXBR1VWp15s0z1TORs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171794; c=relaxed/simple;
	bh=CH5MgHh2Yp70t9jxgZwCYlslBpJH+qKPrwTqGMpn/Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SQ0GBBYbb7+qSpmi6ODRB55zuH2uMsTqmVDfZxrp5eiuRY+uJqqDpv5msiywLNDnt9nIEOCPpRPWUY8b3uBBXsFhPd8VjBKea4uQKRdZ9Bwd95iADbRLf1+0Qr6/I+SVSOtbJdOz8GG0VpOicKu0hSDgTqgqj2OLJOiNlYnYOOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjTq/PqG; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjTq/PqG"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so25191815e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788171788; x=1788776588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqDMDB/aOr7Tvl82Ke1slbqITnm88oDhA/GUgnMCl34=;
        b=JjTq/PqG3w74rpMfCXBxYIId+TY/Sz7IQA6u+2hRq2/Yz+K019UVk7Li7NK7MXoem5
         D/yUgnMsfclQKm9K9fXexcgosoUfAExcJe4OpIKY+TOTru0L1C9CYT/4H2+dt0XLeoAD
         zPckzFh6LeNj13JLoOniuFkNm33u/90Cm5E5rJzV+k0qJSlAMK/cY7PY1+3W6DJGwwfY
         ZDe5oqBASk43MkNuvBhGNTYqlgaCNIYOeFuvs3iShPB1f5yBA2oYwj3RiDFaJb0Dl48W
         T8Cr9J092Pq46r7cquiVVfAhQrvF7nXQS8YAiUQNzfVaExQuEPF+B04yZvQgL2/8wh4o
         5lbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171788; x=1788776588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqDMDB/aOr7Tvl82Ke1slbqITnm88oDhA/GUgnMCl34=;
        b=kbztshhMx9whP+p7E9r8C4QJWkHFwtKfyN43iWXUZ257L01GLhvDJJmlsVc6zS2Vu6
         ftqSe4kwgn0HEzUSc2iul+Tql7dOVdcVSD8VkbDABnU8kM64/OUmfn0GmzPu77Yioh0g
         u42geGyIWLgI1ho255ircR6NceeGLJV6lDX2jVP0C3TuOgO6nMXiFf7HEkstruC7fc50
         ToQkh0ONRYA960ZyiQQlJwc8jlK/4yY/3F6OkQ/mMTW0cN9BnOBkZ8vzD7VuhFARnVUm
         oE/hjTlzFAW9Cwra4IHHGjXy/ijctxT4LUFYrbN/KKOgkibvhJBxLUpeUwNu0q4tsrsw
         gtjA==
X-Forwarded-Encrypted: i=1; AHgh+Ros3Wy9KhUUfWjKWsAATDPtPOKGouKryDitVRoJkkkndaRi5wkvTzMfI5m0F4SD1DHl36Xq2fynucNe740=@vger.kernel.org
X-Gm-Message-State: AFuF++nEojNLbmeA9MoV7dIs6cU1xXoC6yCPlq1EcbolEJHXsCF8hJy3
	x6/It9+c9o1uU4jLbiFvKaadKbCCBiRvm8oBp7Q7kWZXyLyV5i1OngY=
X-Gm-Gg: AR+sD104gNBtdxBnFseMLVw5e4rjzJzS7JhFzpU5GdiAF5BpAfYxtcvwYHqPp0EUo3X
	1GTZ39HVVVm9m/4CiFDso5CsY4SygQc1h9G5aIEx7c+EBr0JBb0fn3baW/GXsTVwBF6Wyts7ryG
	8TflT8ScNsko+ABOpRSqISaLkUu5HglDFH9eQfaXeGkvjP+enFBST7UC08xCbOZBl5q4aqKaOtn
	QBj4gtEjsRWqNWB2PxFU+a1p8zWnu6/Od1MTEMSXCATjFmR1/f/wts5krIaibG2PEKtoif+2pYG
	EEKlKEV6I75Qzy9zwivFQG4DclrCEEhMNwwniE1s9GU3tzBSYiCxD7NRiyVfdUu8XLTYM0ogXp9
	OlCMbTIq7poYO+9a0V91/63FgrEDHXg6sKUwIJzg6KTOjWW5tTQsWe7ztGBJ5jG11X+qqlrli0O
	x7VGa86b26bt8haLsERwt7Fn1f20c8LHFXLEN2n7d3qDxvKpn5b3lP4tdgC9bZ4uSdXUfMBDlm5
	hZpb5RadRFKvf0SWSUyUnssUFHTcWMdChG/UpRmOP+d
X-Received: by 2002:a05:600c:3549:b0:49b:5521:785d with SMTP id 5b1f17b1804b1-49b91c1e9d8mr361428235e9.4.1788171788124;
        Mon, 31 Aug 2026 03:23:08 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b961820ffsm126176435e9.3.2026.08.31.03.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:23:07 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: [PATCH v2] platform/x86: int3472: map the ov7251 power enable GPIO to "vdda"
Date: Mon, 31 Aug 2026 12:23:06 +0200
Message-ID: <20260831102306.36610-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On IPU6 designs carrying an OV7251 IR sensor (ACPI HID INT347E) the INT3472
describes the sensor's single gated rail as a power-enable GPIO, which the
driver registers as a regulator with con_id "avdd". The ov7251 driver and its
DT bindings name the sensor supplies vdda, vddd and vdddo, so the lookup finds
nothing, the rail is never enabled, and probe fails on the first I2C access:

  int3472-discrete INT3472:02: avdd  \_SB.GPI0 pin 131 active-high
  ov7251 i2c-INT347E:00: supply vdda not found, using dummy regulator
  ov7251 i2c-INT347E:00: probe with driver ov7251 failed with error -121

Map the power-enable GPIO to con_id "vdda" for INT347E, the same way the
existing entries map it to "vdd" for the mt9m114 and to "vana" for the imx471.
The sensor's other two supplies keep falling back to the dummy regulator,
which is correct here: the firmware gates a single rail.

The table already has an INT347E entry mapping the reset GPIO to "enable",
added when the ov7251 was brought up on these machines; this is the same class
of firmware-vs-binding name mismatch for the remaining pin.

Tested on a Microsoft Surface Pro 7+ (Tiger Lake, IPU6): with this change the
IR sensor probes, the illuminator strobes, and the camera streams 640x480 at
30 fps through libcamera. The same failure was reproduced independently on a
second Pro 7+ running stock firmware and a distro kernel, with no out-of-tree
code, in [1].

Developed with the assistance of an AI tool (Claude) and verified on hardware.

Link: https://github.com/linux-surface/linux-surface/issues/1702 [1]
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: D. Manresa <dmanresa@gmail.com>
---
v2: no code changes. v1 never reached the lists (a mail tooling error on
my side dropped the Cc headers); resent with platform-driver-x86 on Cc as
Hans requested, with his Reviewed-by collected.

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 6c729fc..157345e 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -143,6 +143,11 @@ static const char * const power_enable_hids_enable[] = {
 	NULL
 };
 
+static const char * const power_enable_hids_vdda[] = {
+	"INT347E", /* ov7251 */
+	NULL
+};
+
 /**
  * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
  * sensor driver (as in DT bindings)
@@ -185,6 +190,13 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
 		.con_id = "dvdd",
 		.enable_time_us = 45 * USEC_PER_MSEC,
 	},
+	{	/* Sensors which expect "vdda" as con_id for power enable */
+		.hids = power_enable_hids_vdda,
+		.type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
+		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
+		.con_id = "vdda",
+		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
+	},
 	{	/* Sensors which expect "vana" as con_id for power enable */
 		.hids = power_enable_hids_vana,
 		.type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
-- 
2.43.0
