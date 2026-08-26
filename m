Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6250D3F8ED2
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787743576; cv=none; b=dyTEwAAv/xT6P0rf9AyFt2SGIcnwWePORQMjhHKcCBmCZ5SAYZNhpagyDnjcWcxJDWi8RmGewJ2gAzyjDMPAFIa4aRipOJcbgGWoCjjdLfu/WEhflGlYsocMJUqdMla4q1gPyMolbJ24mdWaUG5UOzs9jl+DqJoiv5hwCA49b4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787743576; c=relaxed/simple;
	bh=ot5s3z0y3WkGd23yN8si0am4L6kSSGA+LkIE6cUufHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eU8Ux4GMlg4BkWkwyoZrhtxnz1HPkevs11O1XungGLrnIt2HjLrIFBgfE9HOTO/n7T6Y/84k48gmI+mL2qINpgNBSypwc3k/PiN6TQm6CxcmhMR6ISoBd7m1ZdS2jAozeQZ/gkuEUw0h6hKkfE6uFhRzjT3Tm2/hOl+xj4HA+QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGrfPUux; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGrfPUux"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482dbc9a00bso944072f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787743572; x=1788348372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p+YYaj9hB2BEbjd6/AK9OJyefsLzkvfj7sSU25cg5Eo=;
        b=RGrfPUux2Ma3TjFzrQAH80VXbzpLAQp9b2kZW9KNpMCcO/tu1q087merOEPoVzBWqQ
         snONxDlMQq3uRIfypYlS9w1z0242WAyd8edRkp8QGvotltHjEB2ioZ9VYbploR4XMUf7
         5+BsBaTPnNKM7JdwCK8BSHwbORgxHnjQblZ5CXLahhq5w3tWR3yevemUUHrlCTzxZnly
         DTq95rVVjyOt+YBWxr86Lk0XwyzoTzGo+O34C8zvaitRIjxc0FvEHRnMTovADj6H5xG5
         osy6gVbXKsjCXWVkDTf7abkbsFJmioGL6QOjC48CNwYCm1sHFCTk4gITNxXVo65tgdn7
         Zvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787743572; x=1788348372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p+YYaj9hB2BEbjd6/AK9OJyefsLzkvfj7sSU25cg5Eo=;
        b=MsjTMtNBfdbI4G2Xd3W03phATQNqCGa6YRLX+g0lMURh0XRI9BZJ3su89ilUFIsomb
         cVJlBdUYwXTV8kDjsq2BTyi4EG/+8BKIJ7x/4QUJE8bKLlCpLfmpjfbuctMDFz/LhpOk
         QLQxALtZT7Onz39Sf/5JDXUflPYe+tTSQPzpz/SlIuZI/tjkA7aabRLbuZdghaBSciFt
         16GYWF4+G6bfMx5uWBd1OGNioKDo3Q+2A17LGQ5Ph9CnF73KHJeAXwUBKLFTClk42smP
         fadPfzStHB7wyGYkEJfxtFjjdvfTVtoeJ9bR5RXi69EBRfWdgogcPT4DaMuyC+Fs0cBe
         XFyw==
X-Gm-Message-State: AFuF++nM01PPPlf57S6t4GNuCvhGE5jsru+tzJ31u1BBZqipD4oeXwip
	OSipKhWOYPDbfde7dCD2HKoEEeh4ZJg3PmKQ7GfDXok+F33/o7uPIV8tSRjS1J7dIJc=
X-Gm-Gg: AR+sD10Y+XcmT8wkPjJn5qSlysftgbcmguXRBro//M2+b1s8ATOtJTzR8uAVnyBQDme
	3gl9Updc/GWXL/lXyqK95L7Swj5MP8HIXbugZM9qMk6MdZJjVEUEMLaXAIn6EkH2Rm2cFwg95S0
	/dCFMZDgVmMq3CeG0FzpLGKuBd2xnv8y33eHePIISHACi6PniIdcsKXjirYxmjF61kAeZkH5M2u
	nnruIdwZvpNaPY+5d7RDQoU2Uoqzqyh67P5+BtXA1jj7oWNqYlXEYrDfNWNOnhwYzjzUwtuipos
	2CWXDcRcRl04box+24zobw31Ptifba9TvI0+rm9KqZ6JtZMkSMFA9H20VhZtDuu/ddv3L1/mT+T
	BXzlNzXGVi0vS8bV+DuiHy00ej5EygXwsWRHV0C6LdgRBKw3ONzLCnHSkMxSrJ8K168hvlTtL3J
	MtRi9hCPIiDXIrM0tVFLyqH/nMT6a1bYgNYlmO99sRL2n/QGHNLNvueuHMx9NynsYSIeI=
X-Received: by 2002:a05:6000:25c3:b0:482:a9a4:91e7 with SMTP id ffacd0b85a97d-482d99aa11amr13881439f8f.15.1787743572201;
        Wed, 26 Aug 2026 04:26:12 -0700 (PDT)
Received: from TC-LAPTOP ([2a01:e0a:b8a:2610:6b23:b1a3:f913:3d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28f6119sm2442098f8f.34.2026.08.26.04.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:26:11 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v8 6/6] media: ov8858: add ACPI device ID INT3477
Date: Wed, 26 Aug 2026 13:24:51 +0200
Message-ID: <20260826112452.13539-7-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826112452.13539-1-tchatard@gmail.com>
References: <20260826112452.13539-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..f0148c1f2 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1981,11 +1981,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] = {
+	{ .id = "INT3477" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
 		.of_match_table = ov8858_of_match,
+		.acpi_match_table = ov8858_acpi_ids,
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.53.0

