Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAE22D9484
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790792048; cv=none; b=SslYlah/tlInNbFi/HAHoLyii9pf8lu5Q4NtPWE4rjcIcn0FNXFDfam/jhc5GnqY9ddHyyR3X8cGn7Q5R+B8PfMU05fu6UBpuKOGnzerdb8o7eq2DqVNCLTWAmMPpL3osoRXYtFB0wguxjjqp3FjCZdKxzPhVL0MELQrcFgyNSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790792048; c=relaxed/simple;
	bh=OPGYFVz4FMWfgFxxKo+7+LipMYnld5aLYNDtgnYN3dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d3hJyJhtkfZrz2R40WJZTQwy1+lj4MD922jstWmH/2h6ADIWB/G0ivzNnG3Nqp9qyTICpUxEhWyFCL8p0LDRTj+DPExNakCCWKN66xjbSmTXDc8vn97wGc8Jdkcsc0b2Lba90dsUZaQ1jmj+jlIoP0yvh2WaCQEC0XiEeW7J9XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZciYRAXW; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZciYRAXW"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e986b8b1so5782227e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790792044; x=1791396844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gXJfGzAbYR0X8APYsn/Qsci/3IB2V96SpvMDDyKvBfA=;
        b=ZciYRAXWm7k9GId00uG9c0oYp+FD4K3EghpwTzLt1hrJd8js4Pz2952Sr0rHpQLYI/
         PUWFP6X9BUIZ/OW4wqx8U6z97QIHMCeqCVMb/Fig1rKJZcSm0av/J0p1MrEKKhuUkx7G
         SOMdhUY4y5l1esG05/jvHEx36tB5xNenxwG74gXUUsqk6nknakfdZ7gBQwQrCsbdAjkz
         9FU9OGKP87K2q1IdufiKTyZidh14Cr3oaoJZtLtyWXEQTQZMayTRA2/2+ugjZOdCCSWp
         LmB3MvSavYfq9NObuQUEQCs4DQ5OvABd0miMXYtAO0M3MoAgc1cDqv/anjZAKuOgOwph
         nuuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790792044; x=1791396844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gXJfGzAbYR0X8APYsn/Qsci/3IB2V96SpvMDDyKvBfA=;
        b=ecfhgFK8dxlemGuMm+pJCCZGninK5A4p3qjOXrZugPaf82casySqauKcVAaEvvqbaV
         ipkzfkaFClvRk9wRuObHXt+b4+XcTrn4XoykFkVF828+qp5xO6t6SOuiDUQvfy9X7uUy
         7FKOci982/6+K2J+El3BwujwVJD/95lCFKdNqRKPcH0Zily7BEiYSaRx0+WMdsFiS0rT
         diQpjyOGUtldHeUaSVHTQYfZzzuOLEmISZs1lZj3I/XvB17pU8MapbMDZiUHt3kx5Ad9
         tH52ExLVs8Bwu8+He7eE7cQ/7FJc+USlayJXs92BCY4tWCfDKziGCPuyZb66O+zMWmE4
         SIvA==
X-Forwarded-Encrypted: i=1; AKwUvBx18NjqEjYG+XDuz/trxOFPDPb1NeXPAV2bPWLH54hRdA9r8ueGRB1RRb8oqylvdkFvmvUaUaSfoSkrvgM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqlannAeKlbUWaOl1xXxC05qtQ8su0msgcqUzs0UQoAP9vcJcH
	grSDmSZaArtvZZ5kGFhPgsuFFlg+Rb7J3FuYPLCprZb5f/qdAMMiJLd0
X-Gm-Gg: AYBFou3W3KZ0vx1QX5SCh1PVgD0puGQcAGB7HphaQPGGWWeDIs0I85kcSyLcf5NXoUJ
	5g+FrEiVJ7FbadZdzonTfphEYS9dwW8qj3Zj3wyMz+RjlIgW49+hZobdFI7zw4Zv3zYl4k0GGZj
	m0grK/L2EqcH5wZFySCdnHKsnJyQoDhytOrMkkEaPL2Z/OmpN5uul4OgT9D0SqNxLek/P45xJhS
	LqkD52a7qlhIlQjX7WmuEOztGm7cusGGZglIwfwE4ojAJN/x1ZzaQ4BcndWN75nXyA4MWSkIquT
	QYLlBIcP99zbMQFS1qtsKIqMZTeYOJJyDD1FLWIems09IsK9bVg+Tvras8gQnm4x4NXksBSyYLC
	xZt1cXNJaO0FKWiVFPaXKajbKcWWLbWY4n9nBnQI01eQ1Jlj2Z1YeJXfWbZ+E/w1CCQJFVB5vxX
	RSw6IYT+6ajDHNKLHz+xCLHhO8+qwW4N7jxItBjZfiz9UDdSmducE/vjX4aXPn9ZMuDtdkvro/p
	GtrySkFuC0kwRc=
X-Received: by 2002:a05:6512:1593:b0:5b7:6581:8924 with SMTP id 2adb3069b0e04-5ba402b8471mr841779e87.7.1790792043979;
        Wed, 30 Sep 2026 11:14:03 -0700 (PDT)
Received: from localhost.localdomain ([95.31.11.153])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fb83b2sm143201e87.52.2026.09.30.11.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:14:03 -0700 (PDT)
From: Konstantin Nazarov <qwertyuiopyyy@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konstantin Nazarov <qwertyuiopyyy@gmail.com>
Subject: [PATCH] Bluetooth: btusb: add ASUS 0b05:1825 to QCA Rome quirks
Date: Wed, 30 Sep 2026 21:11:04 +0300
Message-ID: <20260930181104.3375-1-qwertyuiopyyy@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Bluetooth controller with USB ID 0b05:1825 found on ASUS
systems uses a Qualcomm QCA Rome chipset, but is currently matched
only by the generic Bluetooth USB entry.

Without BTUSB_QCA_ROME, the driver does not load the QCA rampatch and
NVM firmware. BLE scanning also repeatedly reports:

    Bluetooth: hci0: unexpected event for opcode 0x2005

Mark the device as BTUSB_QCA_ROME with wideband speech support, in
line with the other QCA Rome USB IDs.

Same issue as https://github.com/bluez/bluetooth-next/pull/833 but
with different device id. After patching bluetooth is working fine,
no unexpected events in log.

Tested on: Qualcomm Atheros QCA6174 SoC integrated in motherboard
ASUS Z170I PRO GAMING, USB device id: 0b05:1825

Signed-off-by: Konstantin Nazarov <qwertyuiopyyy@gmail.com>
---
 drivers/bluetooth/btusb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index dc7191bf4..66e12b15e 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -270,6 +270,8 @@ static const struct usb_device_id quirks_table[] = {
 	{ USB_DEVICE(0x0489, 0xe03c), .driver_info = BTUSB_ATH3012 },
 
 	/* QCA ROME chipset */
+        { USB_DEVICE(0x0b05, 0x1825), .driver_info = BTUSB_QCA_ROME |
+                                                     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0cf3, 0x535b), .driver_info = BTUSB_QCA_ROME |
 						     BTUSB_WIDEBAND_SPEECH },
 	{ USB_DEVICE(0x0cf3, 0xe007), .driver_info = BTUSB_QCA_ROME |
-- 
2.43.0

