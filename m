Received: from a4i546.smtp2go.com (a4i546.smtp2go.com [158.120.82.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2D0221F26
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 03:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.82.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790825143; cv=none; b=QzaeVRsNGw6Ka/eqQ77L2DEHTq4lHakIFaGbNeUfXMhKM/AA644SacQ5r3CF7GWYYhbqF6B0ztuLzIKhSNi+hqSg1VVa5AjLJVy2XHqLplA+k2KzygyQ6dRqRhKStCv23xIvPWASRc9zQFEYtg7g/oui6BAHYbekh5geKbVx/vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790825143; c=relaxed/simple;
	bh=9ruNgXHT2r0CwmetQoB/1oVpw/qMLufdSbsH70pXhJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tEdbuvB3blo9qQTCMhIZprr+VL8eLt2lbr1/lWmmPiuaOxK/M/o0a74UMUr5MAkLcLJhcnRjYMhGSl8x0I0tePaugg8Huv9aSAJ8+eVMqBRe2waOWDtDJKgvS8brTDOneIusojDwQoWtizbAD67K8Rkz5FD7yTpeXWwaMXhsT1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org; spf=pass smtp.mailfrom=em879706.shangen.org; dkim=pass (2048-bit key) header.d=shangen.org header.i=@shangen.org header.b=bclw8yoP; arc=none smtp.client-ip=158.120.82.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em879706.shangen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shangen.org header.i=@shangen.org header.b="bclw8yoP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shangen.org;
 i=@shangen.org; q=dns/txt; s=s879706; t=1790824233; h=from : subject :
 to : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=ZLCKZApAh8UxzkShhxoJn8wqaqyGVgYza8r85BvX8iI=;
 b=bclw8yoPkC1GWscOr0fapb9s3S4x5YpiPFChuA7mwzKfEiBrcpKYByQUrVGCdHNFbp9yM
 idpi20WqOjZn96mG/gioDa4l+mIyhNA1w9ySgYQq3WCo85uepP2BvzHSzxglg5Biden5PzN
 8/DikIvS9L7aoC49sCWTq0r/0GWPIFuDnqeKWrbMXGCFHZYrp111OUn7WvaGNY149wAc5DP
 dVDBzkGWFMUwZCoSJ4+h/j4PG8fHDwrCvNZX/ID7xmwxqKVg1e6QRnguzZdaJ9a8/97snyp
 apg106LvksypiXKr+LC3heNLeDH5J1+29WeD5MLJKvH9xL/EgFb59bAPWT0g==
Received: from [10.195.244.224] (helo=12458laptop.lan)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
	(Exim 4.100.1)
	(envelope-from <sim@shangen.org>)
	id 1xC7Bm-FnQW0hPswep-bvIl;
	Thu, 01 Oct 2026 03:10:30 +0000
From: Shang En Sim <sim@shangen.org>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Krishna Chomal <krishna.chomal108@gmail.com>,
	Suryansh Singh <technosfan14@gmail.com>,
	Emre Cecanpunar <emreleno@gmail.com>,
	Radhey Kalra <radheykalra901@gmail.com>,
	=?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>,
	Alain Cousinie <alain.cousinie@laposte.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] platform/x86: hp-wmi: Fix hwmon keep-alive teardown
Date: Wed, 30 Sep 2026 22:10:11 -0500
Message-ID: <20261001031012.48473-2-sim@shangen.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261001031012.48473-1-sim@shangen.org>
References: <20261001031012.48473-1-sim@shangen.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 879706m:879706aL5FzMA:879706sYOxIXAK1I
X-smtpcorp-track: 3b3JT-sIC0xa.j_sfT_YfHs2F.dV5cTAA35Jq

hp_wmi_hwmon_init() initialises keep_alive_dwork with INIT_DELAYED_WORK()
and relies on hp_wmi_bios_remove() to cancel it. Nothing cancels the work
if probe fails after hp_wmi_hwmon_init() has run, so the devm-managed
priv can be freed while the work is still pending.

The ordering is also wrong on both ends. The work is initialised only
after the hwmon device is registered, so a sysfs write to pwm1_enable
can schedule an uninitialised work item. On removal, the work is
cancelled in .remove(), before devres unregisters the hwmon device, so a
sysfs write can requeue it after the cancel.

Use devm_delayed_work_autocancel() and set it up before registering the
hwmon device. devres then cancels the work on every teardown path, after
the hwmon sysfs interface has been removed and before priv and its mutex
are released. Drop the now-unneeded cancel in hp_wmi_bios_remove() and
the platform drvdata that was only used for it.

Fixes: c203c59fb5de ("platform/x86: hp-wmi: implement fan keep-alive")
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Shang En Sim <sim@shangen.org>
---
 drivers/platform/x86/hp/hp-wmi.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 7ab81ce5f8d4..2bf0bb04dcec 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -18,6 +18,7 @@
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/compiler_attributes.h>
+#include <linux/devm-helpers.h>
 #include <linux/dmi.h>
 #include <linux/fixp-arith.h>
 #include <linux/hwmon.h>
@@ -2571,7 +2572,6 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
 static void __exit hp_wmi_bios_remove(struct platform_device *device)
 {
 	int i;
-	struct hp_wmi_hwmon_priv *priv;
 
 	for (i = 0; i < rfkill2_count; i++) {
 		rfkill_unregister(rfkill2[i].rfkill);
@@ -2590,10 +2590,6 @@ static void __exit hp_wmi_bios_remove(struct platform_device *device)
 		rfkill_unregister(wwan_rfkill);
 		rfkill_destroy(wwan_rfkill);
 	}
-
-	priv = platform_get_drvdata(device);
-	if (priv)
-		cancel_delayed_work_sync(&priv->keep_alive_dwork);
 }
 
 static int hp_wmi_resume_handler(struct device *device)
@@ -2941,6 +2937,17 @@ static int hp_wmi_hwmon_init(void)
 	ret = hp_wmi_setup_fan_settings(priv);
 	if (ret)
 		return ret;
+
+	/*
+	 * Set up the work before registering hwmon so that, on teardown,
+	 * it is cancelled only after the sysfs writers that schedule it
+	 * are gone.
+	 */
+	ret = devm_delayed_work_autocancel(dev, &priv->keep_alive_dwork,
+					   hp_wmi_hwmon_keep_alive_handler);
+	if (ret)
+		return ret;
+
 	hwmon = devm_hwmon_device_register_with_info(dev, "hp", priv,
 						     &chip_info, NULL);
 
@@ -2949,8 +2956,6 @@ static int hp_wmi_hwmon_init(void)
 		return PTR_ERR(hwmon);
 	}
 
-	INIT_DELAYED_WORK(&priv->keep_alive_dwork, hp_wmi_hwmon_keep_alive_handler);
-	platform_set_drvdata(hp_wmi_platform_dev, priv);
 	ret = hp_wmi_apply_fan_settings(priv);
 	if (ret)
 		dev_warn(dev, "Failed to apply initial fan settings: %d\n", ret);
-- 
2.56.0

