Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.32.148.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794100188;
	b=xBq7Z7SXZSbKeFdPNnqdgZq9LAoDpoCDWQXyus2bpUQfvjqIHPOzxNXnNnM6fFJ6edT2
	 5fujQC86B7piyqek6e3dOoIaYoz+nWGKgMQulwMsg1TCuT3BMSPC9/B1JQDXQLWs955AX
	 0JSM70JWv3sue1md5K7bkLLBph/T0ahCzoFqHIb+U/FUbL11m3MN3Wygz+aQ2a/a54v31
	 dsakHCgGrOhTFkOmC19cWRYLOt6ClOLAKoyEfnHF+xPfi4FYRCPphm3m+bqsDf2URdteH
	 7UNAZCMJDniGISClfb74rd7BHKKxq/c8Topx+fRp6JaA0xHYbBhKduuxJKGbZkI5jqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794100188;
	h=DMARC-Filter:DKIM-Signature:List-Unsubscribe:X-Mailin-EID:Subject:
	 Message-Id:Origin-messageId:List-Unsubscribe-Post:Feedback-ID:From:
	 X-CSA-Complaints:To:Date:X-sib-id:Cc:X-Mailer:Mime-Version:
	 Content-Transfer-Encoding;
	bh=JklxAbPBaLydgyuBapQPXeWi+Bu2/32FWWJiqNnbyR8=;
	b=4HZIBs0qfI2a7VzOSaJUtJmyFFgBY8ozR4yyzGccdxQ0SQXQ5/4iNfGcTUnsI2zpOBzP
	 WASaAmBN2nOtENJyA7cIeWjD+0m7ay8P3FmWrB86Kk7+ZmpWJvdmR7nnSP+iHdZnFY14p
	 Yrl0x3Pg24aDiBmsPKWtGJa2lIABj3F+kPPjcNEc0CQmiCm0wsXtgGxnUVugGx5tAjA6H
	 VTekUzuQLMQ+xv9fiTFrH0/7vkTedMnVvwa6ufo7Io2cUlGykDgqMsZ5Wypc6olvO4Y7X
	 MCHAT+SoPdm7hHOD1BI+yNS4DWoWWXyB4C0FTyHzdVo4K0eK5Wle1gWzrKujP+hkAAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tubot.lat;
	spf=pass smtp.mailfrom=gy.d.sender-sib.com;
	dkim=pass header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=KW0dakTc;
	arc=none smtp.remote-ip=77.32.148.25
Received: from gy.d.sender-sib.com (gy.d.sender-sib.com [77.32.148.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CA4606A326
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 01:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53CA4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tubot.lat
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gy.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=KW0dakTc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tubot.lat;
 q=dns/txt; s=brevo1; bh=JklxAbPBaLydgyuBapQPXeWi+Bu2/32FWWJiqNnbyR8=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=KW0dakTcvW0IUiuALNtwldOMf10poFdGvCd9pFuF3Mx9CT5nXeUQz7yaRZdzs13enHi2RdhiCeMR
        Tb5uwzhsMIRWW4QoYrfarl/K+ElWNoAPff+gLy/pL6SFIBxzv2FD5jznUctSAtcfH9bdboMmJ9yu
        thUI2QYBlcgW6GN2i1fxXHvtNio5UwC6k0GOPxolme3At681v4tc1go6kJeToHbpaDWhMkrpFVU0
        SOs8BIn+1B7k9Jq1AvErLxkpTqXuLT0yWv4vBfvCNux9i30mecYOELnwlxTh5jI4uOsUB5gVh+oh
        napEZub5E7lPVio8jojbOCDEPjr30fJS9YwfLg==
X-Mailin-EID: NDczOTMwODc4fmxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmd%2BPDIwMjYxMTA4MDEwOTQxLjExMjE0MzMtMS1EZWxheVN5c3RlbUB0dWJvdC5sYXQ%2Bfmd5LmQuc2VuZGVyLXNpYi5jb20%3D
Subject: [PATCH] staging: nvec: convert to DEFINE_SIMPLE_DEV_PM_OPS()
Message-Id: <20261108010941.1121433-1-DelaySystem@tubot.lat>
Origin-messageId: <20261108010941.1121433-1-DelaySystem@tubot.lat>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Feedback-ID: 77.32.148.25:11287567_-1:11287567:Sendinblue
From: "DelaySystem" <DelaySystem@tubot.lat>
X-CSA-Complaints: csa-complaints@eco.de
To: <marvin24@gmx.de>,<gregkh@linuxfoundation.org>
Date: Sat,  7 Nov 2026 17:09:41 -0800
X-sib-id: QD4-G9yk2ur-MP5yUFjrl6DmeN2nRyN5gmqCFSdGxrX3TtCEoHlCxd6SQ6O9oNLaLs8rfF_vwKfFyQ4Ab50_D7DwXKzZcbbvpNpp4ymOK0296_rNM4gCRpBkzR4q9b49CVUc8cl01UpP-wLR-AvVIRwafOrJNRH67RCT-3UVaXfmF_CN5TWTgfsXvQ
Cc: <ac100@lists.launchpad.net>,  <linux-tegra@vger.kernel.org>,  <linux-staging@lists.linux.dev>,  <linux-kernel@vger.kernel.org>,  "DelaySystem" <delaysystem@tubot.lat>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Convert the deprecated SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS()
and pm_sleep_ptr() in the nvec core and nvec-mouse drivers.

This lets us drop the CONFIG_PM_SLEEP guards around the suspend and
resume callbacks, and reduces kernel size when CONFIG_PM_SLEEP is
disabled. No functional change.

Signed-off-by: DelaySystem <DelaySystem@tubot.lat>
---
v2: resend in plain text via git send-email; v1 was corrupted by the
webmail send path (HTML part rejected by vger, tabs expanded to spaces).

Build-tested: arm64 defconfig with MFD_NVEC=3Dm and SERIO_NVEC_PS2=3Dm,
under both CONFIG_PM_SLEEP=3Dy and =3Dn; both build with zero warnings.

 drivers/staging/nvec/nvec.c     | 8 ++------
 drivers/staging/nvec/nvec_ps2.c | 6 ++----
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 41cbdfdc1da6..afe384cbd960 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -763,14 +763,12 @@ static void tegra_init_i2c_slave(struct nvec_chip *nv=
ec)
 	enable_irq(nvec->irq);
 }
=20
-#ifdef CONFIG_PM_SLEEP
 static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
 {
 	disable_irq(nvec->irq);
 	tegra_i2c_writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
 	clk_disable_unprepare(nvec->i2c_clk);
 }
-#endif
=20
 static void nvec_power_off(void)
 {
@@ -910,7 +908,6 @@ static void tegra_nvec_remove(struct platform_device *p=
dev)
 		pm_power_off =3D NULL;
 }
=20
-#ifdef CONFIG_PM_SLEEP
 static int nvec_suspend(struct device *dev)
 {
 	int err;
@@ -942,9 +939,8 @@ static int nvec_resume(struct device *dev)
=20
 	return 0;
 }
-#endif
=20
-static SIMPLE_DEV_PM_OPS(nvec_pm_ops, nvec_suspend, nvec_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(nvec_pm_ops, nvec_suspend, nvec_resume);
=20
 /* Match table for of_platform binding */
 static const struct of_device_id nvidia_nvec_of_match[] =3D {
@@ -958,7 +954,7 @@ static struct platform_driver nvec_device_driver =3D {
 	.remove =3D tegra_nvec_remove,
 	.driver  =3D {
 		.name =3D "nvec",
-		.pm =3D &nvec_pm_ops,
+		.pm =3D pm_sleep_ptr(&nvec_pm_ops),
 		.of_match_table =3D nvidia_nvec_of_match,
 	}
 };
diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps=
2.c
index e6234d29e264..2fb34f0d0dca 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -134,7 +134,6 @@ static void nvec_mouse_remove(struct platform_device *p=
dev)
 	serio_unregister_port(ps2_dev.ser_dev);
 }
=20
-#ifdef CONFIG_PM_SLEEP
 static int nvec_mouse_suspend(struct device *dev)
 {
 	/* disable mouse */
@@ -156,9 +155,8 @@ static int nvec_mouse_resume(struct device *dev)
=20
 	return 0;
 }
-#endif
=20
-static SIMPLE_DEV_PM_OPS(nvec_mouse_pm_ops, nvec_mouse_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(nvec_mouse_pm_ops, nvec_mouse_suspend,
 			 nvec_mouse_resume);
=20
 static struct platform_driver nvec_mouse_driver =3D {
@@ -166,7 +164,7 @@ static struct platform_driver nvec_mouse_driver =3D {
 	.remove =3D nvec_mouse_remove,
 	.driver =3D {
 		.name =3D "nvec-mouse",
-		.pm =3D &nvec_mouse_pm_ops,
+		.pm =3D pm_sleep_ptr(&nvec_mouse_pm_ops),
 	},
 };
=20
--=20
2.34.1


