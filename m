Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBE136E460
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788484814; cv=none; b=c6+VLATDb2L4t1bePUYUJyvCl42ovv2Bz8QGZ0mYCBtS9J3BBdxh1QgdI3qeRzNd9HAIvZvbQ9mGm91nI69Kr1t6ES1+IwJBHU2PwGnZkki09Hl3fcEnmGEC887lpGPpb5wWp1UXDzcPLswd0MzCVotSxjXms/R4DzrNUXb4Wm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788484814; c=relaxed/simple;
	bh=e4653IP/trF4uBg0DR7xcpti6kLMuWqCSiHaFgMw+Lg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W6P/W9XJn3sSnAd6Qwy+ASpUwj3o+nLwWz82VYhzXaqGr9qlvomuus8QsqLIJxCnYswQLyAHOZOlJrk8sOOlGEW7ThpFV9PJ05ArPd4529XFi1THCMp0YRo2YdgdUsm3K8fzuE7fUOm8EhWcUNFLMCSpVH/wyrAC2Vm+aIZy3yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQcIOYtG; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQcIOYtG"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-382ef647e20so474730a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788484808; x=1789089608; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D4Os4KnbXoc/aK/y8zUHh1cLpQDSR2C+747U1B3xOdc=;
        b=iQcIOYtGDCoOKaob+PcF60eogfyIpn9hh95Wib+6GWPpx41TKLlYXq8o3BxdhoC7LT
         mX1TyBt+h6np9uvMmriXDvabaUkBI1JJLAMJwRwk5RHLtX23l6gApeDIhd1TD+4Tj6TY
         dv+2HHz29BY3TqHO3Mar7qn/NTtH2z+guwXfO8Ux+uNvOaJuBMBivbSovfcvdwaL+IfR
         duC5XSP06uYZ4xFjivUdg679JmPdXavQhDAgxpSY7qeCe8UrwjNzgnc5/iZitzEAedLY
         YohPWQaYru9fKDBOyuu5CWlpf7QocxcYDpa0eF+eeW7J6ND2F9w3sOzWsn9CzycjgBCf
         vKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788484808; x=1789089608;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=D4Os4KnbXoc/aK/y8zUHh1cLpQDSR2C+747U1B3xOdc=;
        b=JZb2uzHF8l3Q+BIgi+KE6ZRrCLOEwbVTXXBdxtDkd/jlYSUVi81eSX7hO5uI+HgYYz
         gHxA1VYN6HoKb/NvzFp0781KvAjD3grQ3rNsRxG5dqcWo5ToxPn7/mXtdcElFgq4zKJT
         X8yIJNGEjgB4vIlFfj8lEXUouSTcd9aDG2NH9bI8UC7VrzlGdcyKCgElapwWLPWXWg6Z
         V1Ns+CcDUeGF4LQFeElp7VcvlLo4kVMAsB9t550h+lzYewz/YZ7nl4MSG9CJ57eOM1EQ
         a7lELYJ+TmJ8eEauVZeLb/zWKrRmKFoPyHlIB5JZ2vi3gbq694yWplR5L7IOUZIaKgL3
         2zqA==
X-Forwarded-Encrypted: i=1; AKwUvByx8+/pgHRu1p2chgQA5MSx6XY5E9xf6Hh6SIXjJ/lszt6oXzawR2A7MyxpuSPqCAivwDlV7MSPkB2FaKc=@vger.kernel.org
X-Gm-Message-State: AFuF++malkZwfy9+SPU/DExNuWMVDOlYwlXffVlAYdHFqyn/SE2NRNB2
	GlpvXjBdLY30Ns4AqZ7ng4Eiazsosc3S/P1ADrvGrMMjRcQIr44CM3HG
X-Gm-Gg: AYBFou1MjXZDHmh+XTWOT6QeRGTyCNsbAtfCfLxRhJlJPJ225OtMZlxZ2x47EMLZmq0
	7xLGzgLVW/X9h/ZmjD3funXjUuA0Uk4ocOo1ttPHOkBe8ioVe1sSGAEzI3OmIPZ+cWdMoBAc76u
	T84Tr3W/18EJsD9EY0sM202nPPBEn0L/Opu7bMq8qQUOWAmRP7o2zrNLiAWpbkl8ngHHqPVi7hz
	9SYaaFRGctM/0fNiBHzCBywOf/AnCSw+5ifRetuN754H1JlLxQ3C+rzjNytX9rR196IrK+o5wZm
	gAt9rIp7EPCpGshifs0U5JDhcH3Nh+0zzSn5q5nODo+tuw0RrkQbLCL2eStKtn9v48f5TnHzxHN
	SZH9lC10kJ9G8VNZd7HuCubGeDXuRgweHA5mLLKGiAxn3c62+9sdtJ97HuJAzk1pBTKvCGjZdS4
	uXvWPhsdqW9HM7DU0D9SZtgb3IJ25P4mtmPuErzBsIVkGCGGuP9pZ1vGbGIvpAgyYsxA==
X-Received: by 2002:a17:90b:5790:b0:398:9bd5:4910 with SMTP id 98e67ed59e1d1-39b2624f0ffmr3999853a91.23.1788484808487;
        Thu, 03 Sep 2026 18:20:08 -0700 (PDT)
Received: from [192.168.20.42] ([115.70.157.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08bcc060sm8992418a91.3.2026.09.03.18.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 18:20:08 -0700 (PDT)
From: Tsz Shan Chan <tsz.chan.dev@gmail.com>
X-Google-Original-From: Tsz Shan Chan <tchan@jacques.com.au>
Date: Fri, 04 Sep 2026 11:19:48 +1000
Subject: [PATCH v3] iio: light: apds9306: fix default sampling frequency
 definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-apds9306-v3-1-4f668393c2ae@jacques.com.au>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMyw6CMBBFf4XM2pI+oFBX/odxMcAgNZFiK42G8
 O8W1rg8N/ecBQJ5SwHO2QKeog3WjQnUKYN2wPFOzHaJQXKpueGK4dQFo7hmDXUNVk1VUGkg3Sd
 Pvf3sqest8WDD2/nvXo5iWw8iUTDBVF8biVj0otSXB7avmULeumeOM2ylKP/ZMtlU60qZWiMd2
 Ou6/gBAD3864wAAAA==
X-Change-ID: 20260903-apds9306-bedba7b74e59
To: Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Tsz Shan Chan <tchan@jacques.com.au>
X-Mailer: b4 0.14.3

APDS9306_SAMP_FREQ_10HZ is defined as 0.

According to the datasheet (Broadcom AV02-4755EN, page 11,
ALS_MEAS_RATE), bits[2:0] set the measurement rate:
- 000: 25ms  (40Hz)
- 001: 20ms  (20Hz)
- 010: 100ms (10Hz)

Change APDS9306_SAMP_FREQ_10HZ from 0 to 2 to write the correct value
for 10Hz.

Datasheet: https://docs.broadcom.com/doc/AV02-4755EN
Fixes: 620d1e6c7a3f ("iio: light: Add support for APDS9306 Light Sensor")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Tsz Shan Chan <tchan@jacques.com.au>
---
Changes in v3:
- Move datasheet URL to datasheet tag in the commit message
- Link to v2: https://lore.kernel.org/r/20260903-apds9306-v2-1-e8673986ae56@jacques.com.au

Changes in v2:
- Add datasheet link to commit message
- Remove blank line in the tag block
- Link to v1: https://lore.kernel.org/r/20260903-apds9306-v1-1-3f892aa4f156@jacques.com.au
---
 drivers/iio/light/apds9306.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/light/apds9306.c b/drivers/iio/light/apds9306.c
index f681b02e4922..7dd41136734f 100644
--- a/drivers/iio/light/apds9306.c
+++ b/drivers/iio/light/apds9306.c
@@ -61,7 +61,7 @@
 #define APDS9306_NUM_REPEAT_RATES	7
 #define APDS9306_INT_SRC_CLEAR	0
 #define APDS9306_INT_SRC_ALS	1
-#define APDS9306_SAMP_FREQ_10HZ	0
+#define APDS9306_SAMP_FREQ_10HZ	2
 
 /**
  * struct part_id_gts_multiplier - Part no. and corresponding gts multiplier

---
base-commit: 940de590b839f71d6dc846160534bf202401b8b7
change-id: 20260903-apds9306-bedba7b74e59

Best regards,
-- 
Tsz Shan Chan <tchan@jacques.com.au>

