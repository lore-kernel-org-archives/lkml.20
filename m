Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787713B0AF5
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 14:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788015345; cv=none; b=Qq19j/e5VGxft1bNB7mX7ktMScGPr5HvmDo/JyPSLM/rl0Sb+5zmg1rN+K5doyekebEDZDi0YwD5q8S+L3fwre4C0TYuIxZjJda+94y5JSE548VEBzjQIKcSGIZMPzR8oFvj5xbmciv3Z4Ga0WLEOGDBiUd6M1+RC8tDq0CNFXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788015345; c=relaxed/simple;
	bh=3XdOABZSZLH0OgwUYmhLpcJyF2mhu4J+bTtYORu5bZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YuAT2d95HlVj+z9oLsnwrRwyeG3IzqW+A8TQ5R6erEPAMHaOO4hlVb09usN83BsKWjoMS6LorUfgn9DC39uLGy8TIRhnO7TPGNHdZ4nmPxQsiwXfyPGbBmfbLuDlkIownAVNwRciFWijpDBLMXygeK9CyFHE0FLg0sv6Aw8GlfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+gxRfsk; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+gxRfsk"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so829205f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788015341; x=1788620141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/89mfV6La/iUEjGbkyjyZE3vO+uySlEnPZmMX8i9U8g=;
        b=h+gxRfskZjmmU00YWJAE+CArrHUO5PHQrsRRG5xM3hOp7/QPNG+UC6+x1MLkb9GHDp
         w1NxFyLtIxTReqa29vrc9ayQQ/pttIvQ2mbLx9a3b45AlGZXbaX6eIAUqJldTs+H2zyN
         WBmOVfs9TDIHGOiywTA0xbUJBj2lhXiCbmgbxiQME3QryS4uxZHdsDBH9+iDmVkrFqQI
         x1EpPJ7oVlt5fVliV7wWungAUmYvfUPUmB3h8rRTaDvq1L5TpgyC4DewPV6/fE0WGaN3
         IKtWd4xpPdSjv44OG6A/WKv2fTAK227afl1rQN48unxtnGrP2tt8ACHk8iME2v2+f64p
         FJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788015341; x=1788620141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/89mfV6La/iUEjGbkyjyZE3vO+uySlEnPZmMX8i9U8g=;
        b=ehxK0t6vYoStKTuhJlMIjXnUey7eZPIhnv9dRcv0L3C2Cc2b718fYQZWylmtpuwnFK
         VOhsIvZyvZ0qxvFhoKboyEfKqCDQcMCYA6ZRUZtgboD88DVrOOprQ+JG9tKEEYpvT0Ri
         wiGjXwAesVjzqKPw0UNPu0wgNCt4rUBNJRZgLLDoxSC3EbeB1yyQc5spr6VeitiFNe51
         N7282GZubqH9SVx7Q/BrbqZUTmQrScst78Y3y1osf2WzN9tGZOH0w4jiT0Diy9qgklaw
         cfOK93O4FKS5oPShyebAcilbLy0aziHXBStwocgbs7d+Mlc+ctOYZge8/NZBNVvlwTf9
         tc/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqlmJiKsvXOn2vFrnrwyVB0hXtuKTdcwfIfLqsouBe3P/4h8uBfV33TRqu6GPoH0+t3SNkPt2U7PGKfZrg=@vger.kernel.org
X-Gm-Message-State: AFuF++lnxoeuzPZ8wRDFv3s4F/QIhk8COdIGwFzs5U7msgdeFCDyjugI
	IWJHLwseMGW7s2PRClFEQqoQHPCTIHDyw/0xcZjv8AmugCC4PP/EsapO
X-Gm-Gg: AR+sD13T2YvldAS3SBppkHo+c2aHBvxxx1ZkEClwWZZjbEznJ64VdhWPDBLvQsY1uBv
	Bva7PNXW0TeJquETh53gv9gGO43UUy3Z0UuKD44JxhYvBOzKLTIVaH9vQKeJqSrcApVi/BJon6Z
	Uk7RT6BGTXp3NSbhEHUS9ME0aJrmDXmpdoYOYlk0G3SQfVc690ufXUKkpUr2upxES0BNdbUD9tY
	UiGyHwi3a4iwiiIMVW7zFWGqLl3QQ8Rur9HXQptRF8YXZtPPGj/2AWxVlYq9QPIwoMtMg0gDJqS
	8GE3EAKWTQAm32vKyLDUL1uP5KBrjy2HLZd91Rrgo9FEyf7YrNXbA8zLV2mT9jljUNOPiH1BKPy
	9Vv2EFicWOYdbJEMOWpOr6/SXepWgCB6kihyYrUEtqnULW0W/cFAoe4bFpM2+BgCO+lnJIp74So
	KSvUwpUWQt5t/qFiIprsZGH9uYzQhwWppM99/JKh9ocr9LDM1+U8f6vRb4XBrsddeBsXnewRr4l
	F8I9QJJlGr7pa24wK8NOW1qrj5GU0smlKXQrkk+12O+lFzrWoHRoG0Md2s+v8qGZVynNANpMvpp
	UnUs9kZ10tGIecr25h8MhqHfN8FOdrSBxGwj7Ugt3XN5K+yn
X-Received: by 2002:a05:600c:c490:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-49b91c17294mr214818975e9.1.1788015341035;
        Sat, 29 Aug 2026 07:55:41 -0700 (PDT)
Received: from scambox.localdomain (5-198-68-184.static.kc.net.uk. [5.198.68.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4dfdf00csm195113255e9.14.2026.08.29.07.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 07:55:40 -0700 (PDT)
From: Edward Blair <edward.blair@gmail.com>
To: linux-acpi@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: rafael@kernel.org,
	lenb@kernel.org,
	heikki.krogerus@linux.intel.com,
	mika.westerberg@linux.intel.com,
	gregkh@linuxfoundation.org,
	W_Armin@gmx.de,
	linux-kernel@vger.kernel.org,
	Edward Blair <edward.blair@gmail.com>
Subject: [PATCH v3 1/2] ACPI: scan: do not enumerate MSFT8000 as a serial bus slave
Date: Sat, 29 Aug 2026 15:55:15 +0100
Message-ID: <20260829145516.13500-2-edward.blair@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829145516.13500-1-edward.blair@gmail.com>
References: <20260829145516.13500-1-edward.blair@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MSFT8000 represents the Windows Resource Hub Proxy. Its SerialBus
resources describe connections that Windows exposes to userspace rather
than a physical peripheral attached to a serial bus.

Treat the device like other ACPI nodes which contain SerialBus resources
without being serial bus slaves. This keeps the ACPI device present while
preventing the resources from being instantiated as I2C, SPI or serdev
clients and conflicting with the actual devices.

Suggested-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Edward Blair <edward.blair@gmail.com>
---
 drivers/acpi/scan.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 7dcf78419..608527cda 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1770,6 +1770,11 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 	 * attached to a serial bus at all.
 	 */
 		{"MSHW0028", },
+	/*
+	 * MSFT8000 is a Windows Resource Hub Proxy device. Its SerialBus
+	 * resources grant userspace access and do not describe a slave.
+	 */
+		{"MSFT8000", },
 	/*
 	 * HIDs of device with an UartSerialBusV2 resource for which userspace
 	 * expects a regular tty cdev to be created (instead of the in kernel
-- 
2.55.0

