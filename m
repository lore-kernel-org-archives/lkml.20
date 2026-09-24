Received: from ironport.ite.com.tw (itemail.ite.com.tw [60.251.196.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A73D400E11;
	Thu, 24 Sep 2026 09:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.251.196.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243817; cv=none; b=TDJ54ND+OCF2eL9vJbPiMzohvp2zqfXfPgRiArNe2SW3l1bcAM2XIL4bDBSSrhu7tKioh0Lwx2dcDuGsfvkkUgkScQcj2ubCUe6+bVsQ3ZAX8sveGJ1+ItwX+wkI/gNQkwSPOuG0/AKYSLtFfgdYlT2AyycDcWPL/mJe87urazg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243817; c=relaxed/simple;
	bh=E7FjOv2QQs8SPIHp0EDszNnhi3VwrZQDgM4kfjI9GVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GB55CUjne5a1nz3UIHsYxz9twc9POWYV7dVlkyqxMGDx6V9vWi6N1BrjTnIJZ6DSrV+VvIkXSGK7oqMIdC/gSjxLAMuIs9k358HRAYtQZiNSZsDxSTUyMm1rditwjcGU9B6Wp4VnwA6FvKN37jXPsnKxjqq61CS7yE29UoT207Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw; spf=pass smtp.mailfrom=ite.com.tw; dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b=WqmNftHF; arc=none smtp.client-ip=60.251.196.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ite.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ite.com.tw header.i=@ite.com.tw header.b="WqmNftHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=ite.com.tw; s=dkim;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=6ErHFgMdtd5uXdw0XIyY1dtWJ91MJMZAK8A4w1p9vNM=;
  b=WqmNftHFCX24KUEqUArsam6V4eJQLgxbpubybRygCdRXy9/JU5MyDZ1W
   xvB0rmUGVKzhC1ky1R2nfzcJ3Mz6CQ5qkx57wmA7PQlNO9O8+zDbxFmtN
   iJ7GVCVy+3CDg28rTcLjxf1whyAxYnMhk+XUZhtO+lFEGsFxUyBUv9Mvs
   CPdjPblTW6yFq8X5H7q9FjVrKEdle6WfU7qtKeSOzxDtXO3IOaLxkqDer
   SoLS0nwdMBqyjUwXZgY9eXkdMpjLZ+7yPRMcuqPkG/fO3aBF+7pnVWTci
   djSWHEfrXYf+CFdKzjE1LUYEpcwG19Yxf5k1Tvn3v3mjEo4+gjPp1A2of
   A==;
X-CSE-ConnectionGUID: sznIehg6RGWW6lrqR3o1Fw==
X-CSE-MsgGUID: CfZWiIIAStGmGPPu5oVu8g==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
  by ironport.ite.com.tw with ESMTP; 24 Sep 2026 17:56:00 +0800
Received: from jiraproxy.ite.com.tw (jira.internal.ite.com.tw [192.168.35.200])
	by mse.ite.com.tw with ESMTP id 68O9trfe039529;
	Thu, 24 Sep 2026 17:55:53 +0800 (+08)
	(envelope-from ite_pd@ite.com.tw)
Received: from [127.0.1.1] (ITE01791W10.internal.ite.com.tw [192.168.37.107])
	by jiraproxy.ite.com.tw (Postfix) with ESMTP id BE87D2D5B;
	Thu, 24 Sep 2026 17:55:53 +0800 (CST)
From: Amber Kao <ite_pd@ite.com.tw>
Date: Thu, 24 Sep 2026 17:56:37 +0800
Subject: [PATCH v3 2/2] usb: typec: ucsi: itepd: Update descriptions for
 IT885x and IT527x series
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-ucsi-itepd-it527x-v3-2-a7392aa087f5@ite.com.tw>
References: <20260924-ucsi-itepd-it527x-v3-0-a7392aa087f5@ite.com.tw>
In-Reply-To: <20260924-ucsi-itepd-it527x-v3-0-a7392aa087f5@ite.com.tw>
To: Amber Kao <amber.kao@ite.com.tw>, Jeson Yang <jeson.yang@ite.com.tw>,
        Yaode Fang <Yaode.Fang@ite.com.tw>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Amber Kao <ite_pd@ite.com.tw>
X-Mailer: b4 0.15.2
X-MAIL:mse.ite.com.tw 68O9trfe039529

The IT527x series and the IT8855, IT8856 and IT8857 run the same UCSI
firmware codebase as the IT8851 and are handled by this driver through
the "ite,it8851" fallback compatible. Update the Kconfig prompt, help
text and module description to cover the IT885x and IT527x series.

Signed-off-by: Amber Kao <ite_pd@ite.com.tw>
---
 drivers/usb/typec/ucsi/Kconfig      | 5 +++--
 drivers/usb/typec/ucsi/ucsi_itepd.c | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
index 0f10dac9b34b..5e32ff20ebb5 100644
--- a/drivers/usb/typec/ucsi/Kconfig
+++ b/drivers/usb/typec/ucsi/Kconfig
@@ -105,11 +105,12 @@ config UCSI_HUAWEI_GAOKUN
 	  called ucsi_huawei_gaokun.
 
 config UCSI_ITEPD
-	tristate "UCSI Interface Driver for ITE IT8851/IT8853"
+	tristate "UCSI Interface Driver for ITE IT885x and IT527x series"
 	depends on I2C
 	help
 	  This driver enables UCSI support on platforms that expose an
-	  ITE IT8851/IT8853 Type-C Power Delivery controller over an I2C interface.
+	  ITE IT885x or IT527x series Type-C Power Delivery controller
+	  over an I2C interface.
 
 	  To compile the driver as a module, choose M here: the module
 	  will be called ucsi_itepd.
diff --git a/drivers/usb/typec/ucsi/ucsi_itepd.c b/drivers/usb/typec/ucsi/ucsi_itepd.c
index 50a9eae656ab..5b39ba286db7 100644
--- a/drivers/usb/typec/ucsi/ucsi_itepd.c
+++ b/drivers/usb/typec/ucsi/ucsi_itepd.c
@@ -353,5 +353,5 @@ module_i2c_driver(itepd_driver);
 
 MODULE_AUTHOR("Jeson Yang <jeson.yang@ite.com.tw>");
 MODULE_AUTHOR("Amber Kao <amber.kao@ite.com.tw>");
-MODULE_DESCRIPTION("UCSI driver for ITE IT8851 and IT8853 Type-C PD controllers");
+MODULE_DESCRIPTION("UCSI driver for ITE IT885x/IT527x Type-C PD controllers");
 MODULE_LICENSE("GPL");

-- 
2.53.0

