Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818680;
	b=fH3nURXIkWOxzv8RTDjuDypMrmaAU9y1khAL9B3V0arhOj0NKwEcMnhyhLdIk4QiIsIt
	 HsM/JaNQh9/l6sk6A6HpNEAhpgveudebpMLt1bMfUF0biuZZRnjVccsGAAFBuxmZj/Y2M
	 qQeQvir3Fo48KeQ17/CLFpLt3/rouLL00oXGiMeL5pmS8oNHbtRfbd2+fZPjlUOkBBpi5
	 Dz/bLGx31PQtCz4uaKVBYUnqrnCECcpRtNcJvhlQJu2pYO8VgVupEfU3pN00q74sbWb00
	 HT7cb2iaagS3fP20COuHPwqsotL6cyZYv8iKDKbzmHyAntdaOJMeNM34E+a/xDtGLlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K49lvORwZ3tfWzLK8WxEv6Dacr/ISoujBAt+GhYFFrE=;
	b=aliYQaJ90gfG1mQ/btCWwEZRAj5ooyYiHyj0cDxxsHeQSaiTKYJWC8ETdsfJKYdptuRF
	 rXqsJSJw9yGS5eAbwIB5GA/DDX1FlGWhuqrnzlwkLgCkz+tEWumLaghY0+jwrUs1JLP9W
	 WcgxfCnAupIvW/Bhcaa1XUHhd7J2giaKq9Tre+Fe+2rcKxyPBD2EC+UTnNU4uShaBCD6E
	 cdDt8FmdaFN49UQIXSOEEWy9T1d5VMCxwplBi2LNe/UFf0DccBwFyje4bWP5kB7j35qh8
	 VFsxTzrP8YHPmwOm0lsY1vMsneEk6MFNXeFZ+tYcAZHsQ110zCkbP41VRXKkX4/IIqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7bmb6Zy;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F88606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36F88606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b7bmb6Zy
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso1328365a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818678; x=1795423478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K49lvORwZ3tfWzLK8WxEv6Dacr/ISoujBAt+GhYFFrE=;
        b=b7bmb6ZyPRsWwTGRTwE2A05+8O/Q7L0/p81BrFzG+oRk1IOyHpNykFwutQEmoUxtg7
         9T84xqBECJfsHrJbG6gYalRSTZ6tM3B+vxck/2M3jgVGc+Vl5FpEfBBJjEfC2UuqMmmB
         1ul8oAx4afNGI2GPFGfhhQPk8tLHUoeWWBNQRZ5KpI2fEs4xsLTh5k0LjNEyva1RXwcJ
         f0vVqmG//onwHIlUFUzu/++RutcdaEEV6xg5dU9P14FGIFx0rAN4fI7elkwrp4643Iac
         E655Q03SXJaXHenDgAB4X7uE/1DHLalRVL7aF47AWNU3T0u8PrXu2j/EUOYGEXUcqeVE
         QQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818678; x=1795423478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K49lvORwZ3tfWzLK8WxEv6Dacr/ISoujBAt+GhYFFrE=;
        b=IeuP87QsuG268rzLBpoPMEDAnGKbx1O08Y8F+53q7s0PPXxC9oh/WMhxsSzHtR4suy
         OluYlSDB1myjXyqhBgmeseeMxWsDKhaqcfjlZ1vDKrXhHoSfRMHEG9pqZLPe3MJ3/oU4
         dH2WJGNlZ2ouJvyWwDKxZSlI7R2EMGqP1ikSnUzq61WIUSex4l+LyGuF1L1S/p2pO2OS
         JqTrN69VQSHWD6WWTbyHub1L951FOQoSF2lah0PbnXuzNSH4r7yGeHv8ICW5i9DvlZty
         dK6xQkVX7rPUUrmBpEFTuJE49UTxYCo0vFP+B115/KTfgDOIpqy9HXtros71E3CxhVTK
         hZnA==
X-Forwarded-Encrypted: i=1; AL+hErF22ZDrwpmi9Fjzl5PEgo8YhHsquItNipk2zMrJFsYoGt6a+ctzQVjXQBOiD7D8Bh7Pt0J7Fr1+f6uznDA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pR/YSeDlI15fZOhajmp93tqaYoZEeP558cUXdXuD6a3Y1n1oM
	tdLhk1pvJA+pgcTAss5Cow3njDaP6BbI1UGSMutDaBPT8EEUiohuExlQ
X-Gm-Gg: AZFdTZfSNLdRWaW/LGG2vCW/4DCPQL17qJXLCaMw4cHOVwLkUiaI25Grh5G5OBZ8ZBS
	chQOpHOOLp6WOAr+vQRUhSdvlnlO/4+882zMsycKABLoVXXY1px7doTiDtQDA6IVEtXKb8CsgMm
	FFXHbIY5vPRmO3u4+EGbXoVq+Cw9+4Uhgr42UP0s3sneVrOZeNCopZ/I5axUtFq9f5NvZZ7Z2KC
	fiLFUwJjU1+TUwx6z6JA4EzhlmwToUS4AM1CxfwZslO5OWbrHaYD6B3Mz7qL0msJ3M5rLUKJLdJ
	wPRax1PK1VBiL92k8JhPjW2kXyQuJR3q/Kq3YqhH+fWyxfrc/dVFVG2mw9rgEOtxhcumLkbESwt
	A/vA1xERXJ4EVw6jC3KO30qAou0TpWKSGf6VAuVlFhglWARrM1iJ+TbFZjmmOnvZwbAK6BJIiue
	9op/we3V1kgNmdl3kD4TqOtmgwuz5uRASCAwCZg1R8oWOPeE0t/M52L/xRYl20iniHJS5FPJF4W
	hFQCZzEXjAjaSCpvLKhifdLRSfiijNZ51of+e03Bhaevdz8ntp8JAEu3jpy5FpQf6xccEpdyb1G
	HNe0SpD4LN3Kpu7VLKPCpZM61sBtJc5r7onv+jJ1ivfq3LTCIdtAx/M2FFHA/BHRi86C
X-Received: by 2002:a17:90b:3146:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3b1b0a4513emr9104781a91.34.1794818678393;
        Mon, 16 Nov 2026 00:44:38 -0800 (PST)
Received: from linux.internal.banvien.com ([119.82.142.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f6e0sm20973486a91.9.2026.11.16.00.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:44:38 -0800 (PST)
From: Nhat Tran <nhat.tranminhk2@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nhat Tran <nhat.tranminhk2@gmail.com>
Subject: [PATCH] regulator: renesas-usb-vbus-regulator: Fix module autoloading
Date: Mon, 16 Nov 2026 15:44:26 +0700
Message-Id: <20261116084426.103863-1-nhat.tranminhk2@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The driver can be built as a module, and Kconfig makes it a module by
default when RESET_RZG2L_USBPHY_CTRL is a module. However the driver has
neither a platform_device_id table nor a MODULE_ALIAS(), so no module
alias is generated and udev never loads it.

The device is created by the rzg2l-usbphy-ctrl reset driver with
platform_device_set_of_node_from_dev(), which marks the OF node as
reused, so the uevent carries the platform modalias
"platform:rzg2l-usb-vbus-regulator" rather than an OF one.

Without the regulator, the USB0 PHY waits forever for its vbus supply,
and the whole USB0 port stays unusable. On an RZ/G2L SMARC EVK:

  # cat /sys/kernel/debug/devices_deferred
  11c50100.usb    platform: supplier 11c50200.usb-phy not ready
  11c50000.usb    platform: supplier 11c50200.usb-phy not ready
  11c60000.usb    platform: supplier 11c50200.usb-phy not ready
  11c50200.usb-phy

Loading the module by hand makes all of them probe.

Add a platform_device_id table and export it with MODULE_DEVICE_TABLE()
so that the module is loaded automatically.

Fixes: 84fbd6198766 ("regulator: Add Renesas RZ/G2L USB VBUS regulator driver")
Signed-off-by: Nhat Tran <nhat.tranminhk2@gmail.com>
---
 drivers/regulator/renesas-usb-vbus-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/renesas-usb-vbus-regulator.c b/drivers/regulator/renesas-usb-vbus-regulator.c
index 9ba791bd72ec..65a58bf5ffa4 100644
--- a/drivers/regulator/renesas-usb-vbus-regulator.c
+++ b/drivers/regulator/renesas-usb-vbus-regulator.c
@@ -55,12 +55,19 @@ static int rzg2l_usb_vbus_regulator_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct platform_device_id rzg2l_usb_vbus_regulator_ids[] = {
+	{ .name = "rzg2l-usb-vbus-regulator" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, rzg2l_usb_vbus_regulator_ids);
+
 static struct platform_driver rzg2l_usb_vbus_regulator_driver = {
 	.probe = rzg2l_usb_vbus_regulator_probe,
 	.driver	= {
 		.name = "rzg2l-usb-vbus-regulator",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
+	.id_table = rzg2l_usb_vbus_regulator_ids,
 };
 module_platform_driver(rzg2l_usb_vbus_regulator_driver);
 
-- 
2.25.1

