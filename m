Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B025352001
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790225328; cv=none; b=uH0T2pQpAXh/qa4Mpng7rJPJ4S2qrbsw7X3XkeXeXxwnseILmL4AbO4Fjp5+a8hSyVtTap3U1dwzc6S8pYB47DLWD/ZeqrdzQqSMxYeEXg3DxFjK7SQC4NvxpaJHfOKUw0p7FQQXZ4PQVGde68ljYZEOy8O5OK5JBHpEy+jJewU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790225328; c=relaxed/simple;
	bh=RDhiZTJn9JZMliO98reeN3q65S/Mi1aPZvEhe1g8xZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AivMbcIxdHVFb9dd+6DcK1PtTXhnRWJKFx7ao60ei17SglhS4L47NSiVK5t80Kse7BNzUwSf+aQko6DhcPeAl8SyyH9n96QzcXtoVFaW13TW2BtR9OQjmtk4fqyZt+rDJ/g2aQXaaWKhcQwtdKIHky8YWDOaeb54FaHMeQnvWSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZ+yX3nL; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZ+yX3nL"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e2ff27eso1443400e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 21:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790225326; x=1790830126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvXy3wzD3laTECf2tTVINO6MB/5KI0mICCk5R7d02GA=;
        b=hZ+yX3nLEqMBAQHITMA3paLl8zPde4DUfrtvJ/JQt3rFtQCKY6SUReTcR6LY46BI+n
         9Rg6oPMJ18RrR3PFxY1A7aUcUGcKPcLxav0wKNDyO3Dpi4vXkXOtixfC2nVQlACSr7lm
         D00/zW1a4pMnEbWZNG1k/Wu6LSMBMEKpmUM0jFlILScjgwDe0YzuJLbCDj0800kO0hyP
         tq2tLNYMHNDmSayfk8IyaEFATG/o+lYmb1SxWJQ7BEGwT1jrzQURlLhSbvxNtR0ACRXm
         gYSP4vnxdT9cDGkN2kh5GKeYms57SW9byq+5WlPdFwujDR8595G1wBPQfDLcsZ5EJnwa
         V6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790225326; x=1790830126;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EvXy3wzD3laTECf2tTVINO6MB/5KI0mICCk5R7d02GA=;
        b=iyy04geUy3cxFjqXpvRoAjkhFcvn2oETJf1lW/LvH2BB9peeFEa3k1iUdRJb4FAtMm
         DByiS8JuABk7KWVPylygzq3pJgae8whLyB8IE8oOu4eeXGi8wtpLCAeLJtLug36+7Mgx
         AFoDdidAnk1r5orRcBMQ64Z9Ro9wNArFdTqgKYhRF1rxxIZxOTDf0hKGmcifoBDuGvOu
         GhL99eS023Nn9EWj/t6UfhWHmLQvLYiIvf3720Ty26upV2ijouA7NMMjk8Z1ISzOsUwb
         ZnN7RyY8k+ROcFIGBv0sxhbzgIUA3aQuMjS+vbmdfPpduLpayDuy86YFrI42ztP/gfnp
         WCvw==
X-Forwarded-Encrypted: i=1; AKwUvBxcatUHwO/gK1Dn/GnV7OJrbEkJ8sJdYJpXs5KRcOhXY0CEmWVmElrriREw+JhubuddRYE+awD7Upm9Hq8=@vger.kernel.org
X-Gm-Message-State: AFuF++kD2l8gRNr8zrZhOpkw5SSFzRL1hgAKgIwpG7WUUiZQQffZXBkV
	Uhn5oYxmuNTlcW0o2UHFYe+4/Bbkn+kFGFZKwEXYwVzoSKyjV9xaBD0v
X-Gm-Gg: AYBFou2VNN1LGzZFK2brC2HdR8jn7Riu0NxLDCAoeisMWKkzJ5einJxOddCP4uL9pPZ
	K4UQoatfHBmJ+zZeAXMhlJvFZDznVunHAMM0lTc5EWTBYEduOAe+AIOhOLKCvNJtlwIHOWUzR0E
	JbA1scxhV6jaZJWCrOVJmUR1amHrTQATrxPtgNH4mgZnvLV6rqBd4oWgkpot/UVVu12D93MXUfv
	sj05kx2z4UUVTwAhsNbWJmBXqrfhUZXkI04FjSkcsoddd/WwWTPW6Rs1iaMmOuOn5jAJW4pnLcy
	x16y9ziIgXckBzhQJgRAJht6Bdf3KG6fiCxuF33VZ8PmWTuLFWr/h5u1BieyG44/oNIA5Z/9HLH
	VAwU+nRUfrXzBMzExK96PQhUAV/w06iAl2SuwVADTXcVnbYLO/Yb3OFq6Fb8wghiRxjG+9GzOgP
	hV4H1VJYyRmK3fnVnl4tnI/7ExTd8h13vZtabJNSPpghCE3nQ09JvXUp6Q9Yj+tWojexlQifo78
	0rs
X-Received: by 2002:a05:6122:4f81:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5cb080766b9mr985964e0c.4.1790225326167;
        Wed, 23 Sep 2026 21:48:46 -0700 (PDT)
Received: from pop-os.. ([2804:29b8:504e:6aa0:a0c2:47fd:82bc:f7ed])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f053a418sm5360908e0c.13.2026.09.23.21.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:48:45 -0700 (PDT)
From: =?UTF-8?q?Emanuel=20=C3=81vila?= <avilaemanueel@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Emanuel=20=C3=81vila?= <avilaemanueel@gmail.com>
Subject: [PATCH] hwmon: (dell-smm) Add Dell 16 DC16250 to fan control whitelist
Date: Thu, 24 Sep 2026 01:48:29 -0300
Message-ID: <20260924044829.2889204-1-avilaemanueel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the Dell 16 DC16250, the BIOS keeps the CPU fan at its highest state
(~4700 RPM) even when the system is idle at 45 °C, and fan speed writes
through pwm1 are overridden by the BIOS within a few seconds.

The I8K_FAN_30A3_31A3 SMM code pair works on this machine through the
WMI-SMM backend: after writing 1 to pwm1_enable, the fan accepts all
three fan states (0, 128 and 255 via pwm1) and reports matching RPM,
and writing 2 hands control back to the BIOS.

Tested on BIOS 1.8.1 with kernel 7.1.5 (Pop!_OS 24.04).

Assisted-by: claude-opus-5-5
Signed-off-by: Emanuel Ávila <avilaemanueel@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 99a58ed26..88837f028 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1679,6 +1679,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
 	},
+	{
+		.ident = "Dell 16 DC16250",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell 16 DC16250"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{ }
 };
 
-- 
2.43.0

