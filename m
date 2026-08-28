Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8313947B5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933716; cv=none; b=Mu904G1f/fDlBgIpLVM1vpX3WtpAY5WT/jOks32yS6rRzNY2+qyt0FnzRYL7K5EHtFB+YJGti7UlEnHtAG8XNAi3lxyfdsJw72FpHV0o0tV2OKxa2TzkRHRu2oXeHhxQ8wKTtuZ/2TK53lBWbItztNlTLbipbFfW4ohheEbQivA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933716; c=relaxed/simple;
	bh=v7juixLQwrF7KDdp/S9iL2tx/5gjSGtziv38EJOHhcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5CQaZb4Cwx5LK8pvo5un4YSsxtJYcOdbEWXAuBjvgr8hFmGwADD5Er/FK8YaPwLpgmhpcOWAsXJEQiaZ15+zhohA06+31+mCNKFi/5qXc3RpLfeE7otk3pE3s0h7Q4+WdzWiPUzyHG8FLuGo14GHXb/Fntz3UTyUTaeMTfhNzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kh4lteBR; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kh4lteBR"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482e2904915so841064f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933713; x=1788538513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvPJGHIKC1eJmheE+blqXkJ54XPQu26+LTbYDPnFGgY=;
        b=kh4lteBREe8TiVBZg9osq9XwkvOppEuuvp+sSag0gGON81Who3qbmkqJ/OWJo0vubv
         hX3Ioe2VZdlPGj1u0VNMz3uD3nUvIrP5aPRZ/hGAyAtUExXkeexVuNUJ72xd/B1jYZ2l
         I1j+JNsNCa/khUH7lJWUPs+DQUnHOjuO+7OmpMHCDbQQyzm4BwTMmnENeKXYD++mPmj1
         zQqIXq2EG0sysQvCVXmVKQS2T/TEwexY0Ye2/Jwjpj0N2uzGb5F5dmJJuPz1uzXIOjIo
         B5NQGNwStbDiJRGVj310K3nFcdhQwMJ+h+JizVKuQkk7dPajMqNXMLuOD/O4RXoLr8zK
         t1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933713; x=1788538513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvPJGHIKC1eJmheE+blqXkJ54XPQu26+LTbYDPnFGgY=;
        b=bVD7383v3ttRKxe/7k+PGjt4bwIB5wFGDBmPHSao0S3rzA+kT8YvSMYAjlWO0n4xCC
         UfvbQ498vLS2HFNf07mwtMMbTP43m9FLO9wHS3eIvYE+qSiNKCu7b99l4LHhVTI4wrZq
         ILep53uO2kDeY9e2Fyx88bDjaXIpHznJQEBYnKfmYhHKA9tqq7pWVzU6yifV2MvloWAi
         k880iw4ndlmDQ5DiR/a/if6DmBZfCSpG51MORhOra3czYN+spDUz/TTBWIjPI1Do+DbC
         ELSXD6atqhw5HQ9KByTBqWUdZ/YDpPDvPiWxgomnVZsdLggVOR4nPMtH6eImI9dhnFwC
         wfHw==
X-Forwarded-Encrypted: i=1; AHgh+RrKe6TQ4m3mqS21lhzLCPIjdZCTb7J2do3ZyKSdA0En8/Eq5TTIyeAfpnvf2D0BK/F81N2owPIDNm1pSdk=@vger.kernel.org
X-Gm-Message-State: AFuF++kZZuWJNTNYYrKm28pdk986TD5b4bEREh/JOpVwy7C00g9PMZNT
	ZqwXHJhH6ex5KEnHcbSHgvEdRmucSMhnS6dkd3NW9c1uoM2qNry3VCd1
X-Gm-Gg: AR+sD12QDh0D6StdAb3ZC5EuvwqXXJOBIbLiYZX9duROoM3B1glgW8W8+4t6goGr9zG
	HM8NmlNZE+gq6zXD4gFZCUydgo4REQ9yWBxVJ+8x3P9ZTjrYw/ggEMs+3dStS5AW0E7iHrsY8q5
	Fmz2vAMvZNYWidhMDbEsP0ZwtSF54psv1xYt43F2Q6p3hNiuOEKOzCi455X9h2bwOys1A9GIaxH
	vbk4JxA9gxiUIUkR4NpYYHykAljPNlX9qacbzdzGwvmRc/IygSx9W0hGICe/nAP7swdQYbxV/AG
	XgbFUPSbCREXadl1LvtJObdaPMTzJdBGMSV1KJ9zO9ErvvH3ZMObfsXcTf9DtjowZu0OGJQfQCM
	dQrqYBcAwe6cogxYcJQm85SJhD1S3YTIk7hEHLCHSGr53N9jiirbH7/QCZnxk6VUG45D9xexp2z
	BnGI2BPlR8ZFH2aB8e4GxWsPOlLeQLr50Mg94Hxb18HASo3FjtQjba8KcMjITw54CdjznbqT1IO
	X46b7dqks4KruO4L6BY9/f9CoEZfDEaNsA2Gs5LHqcU6sBfbB04JA==
X-Received: by 2002:a05:6000:18a1:b0:482:bf78:300a with SMTP id ffacd0b85a97d-482f79c78abmr14393256f8f.17.1787933712863;
        Fri, 28 Aug 2026 09:15:12 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:12 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 05/15] media: ov8858: Add INT3477 ACPI ID
Date: Fri, 28 Aug 2026 18:14:47 +0200
Message-ID: <fb26c4cb3dae5d87ee877dd558d6ea5e0b3926fd.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
sensor. Add an ACPI match table for that ID.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 9b3e6eaca665..332625e19142 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2088,6 +2089,12 @@ static void ov8858_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }
 
+static const struct acpi_device_id ov8858_acpi_match[] = {
+	{ .id = "INT3477" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);
+
 static const struct of_device_id ov8858_of_match[] = {
 	{ .compatible = "ovti,ov8858" },
 	{ /* sentinel */ },
@@ -2098,6 +2105,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
2.53.0

