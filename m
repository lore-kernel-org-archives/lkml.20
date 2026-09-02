Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5010E4A5C32
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360839; cv=none; b=pd/8uuVeXcuQlnNBXbwNljVazepBkRV6VXnxmechIMozxxC+Xgnd5KhmYpRxn/UcUooZXYa1p2ySb6tuyxjWVs5SdpzsBtcgImN/wuG45WTaOn0ut6hqgm8CNvMw7f+hRwb5MxKDN9pJlbOswHZbXX2+CKNl/ES/K3JLegFz+IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360839; c=relaxed/simple;
	bh=GY/0GwAYKkdGCB2mGjNb9iNJ3uZoj4B7s9rKLLBlD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4nj35ghrozpcQvN03H135uyKrrZ5G5aGlbXOM4h7YAtagOFlR1sMDQV8goCmOMH1ENtHFevsmeHOVUh9AWm5BbIkRPIGEcbx2rUuRtwi7RZ7A78uh1YYzVVjmVnpZ2RdzBV1YdrKh3yewOFwL+DlMk0CUzYEnlvtXuGAoie0bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBITmk4X; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBITmk4X"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-484415c8bf2so922732f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360836; x=1788965636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=FBITmk4XJwvz1iq5MNEQZGf5rXRo9FWZ96L2epS7U34syeRfHXFyaP4hdZ8f7PpOn4
         7RYdUyzbA04vhKZfRE6p5kug1BBK7cQhtmDetb9ke82QKh4eNbJI5k52VFoqJwiH1+wX
         7khUeEbm71ZvrxhrYqpn3ok5v38T2+bZ1iRZdjy4ZCa1Hz5yMpOKNJczwEnn+CTEaknV
         Ong7FXZLpgyI4XbQkHxcHt2jlFK+kCu1dUMTRaS2l2REJagMtVnwBQJAOdpXuFXuUZWE
         Sr6g+w4RSiC/WD3HWthezaq5aBysj/FAsdpYfgyqTHqwfPs4lQ48qn138fg6fn8TLCQx
         9lYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360836; x=1788965636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=hkR3NHL+s5nkyrbe0cXj/JJVzuSPzVkgc+R+RTd2U7AZYplgFsD36YRR2ZcdXDBDog
         ipjXpL9M1nig9erSyesBGZE7+SSvE7QRL2CYVBw9iojAP/S/epcDmfBcO39O0S81UUQF
         TI12nSwkJrPxHIcp/mde2DA/DqsWWm1D49CtIA/kYxfSAhd/MhDxTMg1IpCNbICkHhto
         oJMbl0MpyL5yjorS28iLXLVS/MXRDtmrQUvAduZGazh2LkRSgEiB8OpEcUMn80ZbtXoO
         BRjkaigCBUn7xo5vpekW5WscmHhm0ojPe2Bbch5NOsgl88R2NpD4IV+aJ9jbF7mCU3U8
         ly1g==
X-Forwarded-Encrypted: i=1; AKwUvByXKb7Sur2HIQwHAOOibBgwYRTmD03VkdruvS9tRIqr3AFuheD9cXE11BE4yB5t6mQqp2yu4Axe6tt4yBc=@vger.kernel.org
X-Gm-Message-State: AFuF++nilLO5NHZXz2Nm+32jrGPMR7IijlCDLck9bDkL98D7+VyCz8hx
	+ZzrZDrY7+38+yc7+LAMbP4g+TLndNdMjmTRTfNZgE4EcPpvAP3WKDHM
X-Gm-Gg: AYBFou2td7rTEwJpwYJn9UUSpsl6SCZApZOzn6oYkdkLT+/BSBNJmdbDKqmmecNdWP1
	FUSIQyMRSJltevA9RzIJTdjqxCJnBufEpV93b9NNx1ZqzXval9eq51EVCFpbOHek38s0/XGBhhm
	82ZbI20eJuSpupkeIL/yAr41WvmOuaZ7HUY2oaMUvemlYmBHfnIgiFC4RmclYu4rqribVd/+y33
	oc+32jhkvbDp1b+dXvF1oHzdsEGgdsv1wrRzbjq9N++2uG00gxYGH6e8YmPtvT1Sr5gmqzfaSs6
	eDVnbOTGqZSlUD0GCbTONA1+qtyFVE9c3hLTByo/OX0Tj1amcgCHMz9IPcUJskMF43Bw0ECx7WF
	hFpPDn/nsiNxwm+EBbzKpG1xUHhwQtzOqeOQFb+whWr6JcwGScK7v8fjYMMFoILrKHkosrPaDJw
	9YSHyFnRHYPBedG2Utgh5TzwO7m8nOvcBUQX7jeoyy9qGrRdiiQOJ//YZI4MA5uWrwQgxy7SfK0
	33aurKOhbcSDvqxlaEMwMnvqnTO21bCQ6P0I4ZOtRKd
X-Received: by 2002:a05:6000:40cc:b0:484:4880:449d with SMTP id ffacd0b85a97d-48488dee57bmr8598775f8f.3.1788360836348;
        Wed, 02 Sep 2026 07:53:56 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:55 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 04/16] media: ov2740: Add OVTI2740 ACPI ID
Date: Wed,  2 Sep 2026 16:53:33 +0200
Message-ID: <38149ff00ebb24aca8089ca2e3aed3fb8bf8a06e.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 8f0ad5dbb245..18bb3ac9701f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,6 +1462,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
-- 
2.53.0

