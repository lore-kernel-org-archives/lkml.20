Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDF952123C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790804621; cv=none; b=EbE3XLxssSTM0rd0m4kjgNNLsO+VtNKoPVYXhcbA5kKODPrdrDEm7YYA/cC5Rqr6b3cgeIGxlY4w7SPKn4KQ3phKRmvoi/x0836fhb8WPNHAxTR3u/h/ryIJgXIFnSYDRYTuo9+JRL9qdJZEYCSUq70puCVBHN7dOtZrzXmotho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790804621; c=relaxed/simple;
	bh=mMTTHMPR75bUOCOYBZV1Ugzu8uh7Brmqc/EPaghm+HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWXNI/pK25EJ7uqe6Wv6r8MCw8ErTQUf1QNG3Gb8CyqWqWZOMXUZIM7lkaVGY7q9c13LdlVtBtPJQ5vl9OosLp44tOUH1r7fpGuvOZTf9poKjxxnKEpInfdgdnqcx3zzTAxSvxrtgn5EQgoRP7GSi1+/9zbWILZp22X2r3SPC4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljrqpNju; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljrqpNju"
Received: by mail-pj2-f38.google.com with SMTP id d9443c01a7336-2e2da4743b0so5617335ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790804619; x=1791409419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1zpZHPuVM+iqq7iFBG6v7ofF86AB0nq1tUsjQIMM3w=;
        b=ljrqpNju4S+PJSQRiUMQRuqXKtHjK6fbwt9nf5rY/o1x55avzS5ux+xTsVEXEdeDKt
         D6y/JD1hEDCv9HPywTFwjyAPFKq5ggwyPXSGXJJNjKHJ6DSSzVHzXs4v5SmaXOV38A+d
         kngNiIKPurH9b8rivuB9TsFhVW9dlkg5Yh1KYvGmklGb6/UjfNnIHn0U4Gnu7aFULSNG
         1CStJxPPcq1W2qtTrI+tmTxnQYWmAAtgtkIwo0zlX4HLmY6WHY8ZqC5vQisIxz5QfOuU
         Hi9APIuzgY8evvJ/OggE+gKaV8kO4NQ9y7gsQLZBFzdZDiXe3Y8OpDI1EVvJV1pF4JbM
         Nbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790804619; x=1791409419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1zpZHPuVM+iqq7iFBG6v7ofF86AB0nq1tUsjQIMM3w=;
        b=LlBHXyRvgMbsGxxJSccih4JpITAFWovKz727ADBRdtQYOuNkSdRhDDCnWWJZKgFZIz
         iDS5Xka29YXuKIFOgoQCcFizVxRVbina4f05zyub/W9ZUlvMxMnn6MljWb6EfsF0JGbH
         GDmVnrIBwOaok5QXregjMLPeod/PxOW+QwamZO2dS+GXvAqzqIEvw1vKeGYgUo105oHx
         v/4uQA9gJQiB+06izmBKue6A/zyoZXBKaeDKnWjqqL6QsQbsC7i2xSGG79Gzz3tRSod+
         Tb0zDsg6RQSdllrPOs1u4B0DrDAw4gTrLU9EUBwKBzbcXiMhWtSJHkhImVH3aZC8+9fG
         2sUg==
X-Gm-Message-State: AFq9FYLGyOFbeyZpDGtbRzrQV8/AFVv93D/bIFccq5vTiu9sPaaMYLYn
	NM0i8Asz1rDMcJjVl0860e/AT4Umu06WGx7aJw/auFsXWc87wREsa0T4oXl2d7pK
X-Gm-Gg: AYBFou2BSEx2jr0oEhnjNMylWc0udFpTgj3sLrfWW7wqP/PGGnTpluFeNg2i9JjlkH2
	jZRVnoSqxkXHD0kTrFEs/Bp/YsZBgaZTo7wN4b3I8kH9cm+bCUYOFq5pO1j/pVK+jHkeEXPuJx8
	rWkH+VrBnfSQx+Rfphgt7lbEKyqA5sr0PayTqkw1VdbhyoVQ35uy6s9m1c9O9zkJz9purWZm9Zo
	0Hh4WWjQE2y+eR4a0jNh41qnsBMwfsT4zu1M556lu0LlZEBud8SFgQ+WtQ5mZ7uXbB7niGTVLmJ
	s4F2FB/lduKHwPdF/xHH7GxtqfTd+TEGEbvrMiD5mgecTnBmhdAH8FmyMtMXmLFcTAwkrEcWR5R
	W5HkLfTDZjSVfkrT8Tvvr4iHKAp62yizaDbZHWYQu9ZW9VL836YpFZAU7S4xSdpRqloSmYTvfce
	3LgEcckGZNU1sGTXqVYB66hHilpAOJGI6W+b/PqDWMi67JYQp/f8dPnv2769p6aRVM7TE=
X-Received: by 2002:a17:90a:d2cb:b0:39e:6a7f:6187 with SMTP id 98e67ed59e1d1-3a4f2deabccmr468991a91.24.1790804619250;
        Wed, 30 Sep 2026 14:43:39 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm1060539a91.16.2026.09.30.14.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 14:43:38 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v11 2/9] mfd: intel-lpss: add Dell Latitude 7275 to the resource conflict quirk
Date: Wed, 30 Sep 2026 14:43:14 -0700
Message-ID: <20260930214321.600863-3-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930214321.600863-1-tchatard@gmail.com>
References: <20260930214321.600863-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "D. Manresa" <dmanresa@gmail.com>

The Dell Latitude 7275 2-in-1 has the same BIOS bug as the Latitude 5285:
the ACPI GEXP device declares an OperationRegion (BAR0) on the GNVS
variable SB04 and the I2C4 controller (INT3446) builds its _CRS from that
same variable, so intel_lpss_acpi fails to bind the controller with
-EBUSY and the front camera sensor (OV5670, INT3479) is never registered
unless acpi_enforce_resources=lax is passed.

Add the machine to the DMI table so QUIRK_IGNORE_RESOURCE_CONFLICTS is
applied to INT3446 on it as well.

Assisted-by: Claude Code:claude-fable-5-1
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: D. Manresa <dmanresa@gmail.com>
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/mfd/intel-lpss-acpi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 9d7d0ad62..f49ce3bb8 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -191,6 +191,12 @@ static const struct dmi_system_id intel_lpss_quirk_dmi[] = {
 			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
 		},
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 7275"),
+		},
+	},
 	{ }
 };
 
-- 
2.53.0

