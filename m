Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925193DC857
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789710078; cv=none; b=YOQ3/muAlFdrSfrxezolL51bLk5B12nwQJaEUbacXmRvILrdNZNu3/krqTiO6C/wrRFdpCyUwtrm3TeX6mq4tSziEQd/DRUYjbfX+8sVmU+evbsBbVj70ECCmIA/zrmuqIgvk0al+qfldnh88ck0Z4lT/FUxxeQTfMXx5u0Guco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789710078; c=relaxed/simple;
	bh=VA1iZkpKLsP31AptUWmjVmN+0ut8zSXRATtnPZO5bjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B2fni0H+MHBS0h4XEDeudeSC088pA9ushHZGTG6qRtU+UzxoKis/aFUydPxmtpmH9BIrrtoHNBNfh8nIcGIAKFmwIKNsOrUeU4lentdCFpPy4NwPxH4dUFGKEC/3JMzMfXlbVYL5Y7Av4dk/A6a6j58UsVOhqvEEyFPVltGlYCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQOs0xee; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQOs0xee"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8623e5d435cso107366b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789710077; x=1790314877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JFMkuW0Bqe7MVkCpNYHYvmJJeyYJ8ubSGhbpI1Nwdj0=;
        b=pQOs0xeeplTsdlCs4nqBh52mX4XwZCVu/DSRCWtN9tOeEAjxnPB2ucx7EycFUpYjFf
         dJPdcD5xr/ZPz9mWgUycdW3sf1lbiNm1A6tbDQB+QidqFjtkQvQdis6PM0QjiUAtuazD
         ka18pVdNGVoRxxp1GVoPJ67lMATCnNJdAxuF20HWtRTcbF0dIljt3t9zvg4INWD1OxpD
         aXfYOWW3wYqMTzSvWxWPmtxVPVlbufHYkcimonNcN9s3rx0+Wxe6lBmif4+wZjvi3GYC
         zG+DKcVC9jsVUsMTU42rzhkoqYZq9SEyzgikB+5JjYeeevvnAnGKfGUiq1l4IG9Z++ET
         Tfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789710077; x=1790314877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JFMkuW0Bqe7MVkCpNYHYvmJJeyYJ8ubSGhbpI1Nwdj0=;
        b=Ky2nq90gvSH9wBZkmlEGdLUIqRmaoA7EfSXu4EJ+Cd8FNNYgjEe4hJ6cCcVjUgg1St
         GyycJqOuKtSy3mYOuKCYvJLavx7aMaFdSEUE7L7FvwU2ouWqgDPbVZ3gO0i8oXrbfzPV
         bxRIQqpQ7x8deDvFP7NaLaajXVUw03Fak5clT03/qa6aHbJM9tLqB+smNsWfU6Gbk3yZ
         NtcrA9hq0pNigqOICQfk1ZrN9CNdD+GyWpIM4N65jhJrHHpUUCO3xRhzIK4O+v1amGb5
         R9X8vYkeGqTn2TDDjjMz7wrtTNMnQ7YH+hl5gZqNfsj7jsAgNc2+OZVP5JH5M296bQdH
         gP+A==
X-Forwarded-Encrypted: i=1; AKwUvBxG4USG4QUR3K1s87pUu3J4jspF10F84oSIVPZkQLxg70VFSwZSnSEBCeZwDZfVQwINJV4RfPcCmAh6m7w=@vger.kernel.org
X-Gm-Message-State: AFuF++n6GELlM5kYg0Vot1wgtkpt+z5odNr+PBNEEQNhRKlMO+n9yzGX
	7KdJB5PMNL0PhwezQ/U8m9BKojsTOe8KuRp8K8zSfaMSpwPewnVj3PQXqa66Ar7Oucaf5A==
X-Gm-Gg: AYBFou1+ZgxJYZ3fR8Cm5GhDTAc2yaeR87ruc4p8qWUUoicjDoUmoB4BskVju+u74pO
	l9KF5RVCwv3U1EQAc/uSK7z1HneQq6bSy35YwE0SI+7nmYkHZ9TOTEw7woGdPGnlyx0cDPS1VcQ
	KIE810js9Pj+R/SiRG9iiwBTi/TTlxSEyKDq/c95N6YDVRWtuWgjCcQ2C8e96RZ0xUXQEjlaYtM
	2K3xfJjZoEzK4o4Y8G7M0jhYagLNdzSa0IkvKXTt4uZPs87NZin30prpjtFtIPgWFx4D1XAvEeH
	JVdRHUhGc9L5k18bOALJUOVeK9OEfub9f5rI0YA/6WF+psHfWyaNW45DQZ0e9rfk+NiVJIBSw4F
	FxsO2EcuEYof1Kubgk7mdgxoc6YKtySZ04+CpgQvfFods2TZ6M32ewG9UCZdcjJcjCM+Mvqagzj
	giqQqAT1zFe2iMJ5Iapd/o2UQ4WYrqIbMF5H+lYn0YUAEuHhd03Fmo2xkfGbAHRa6E8j9Ruqdum
	c3/poreQIo+TD/z+3PMClGMgki99MhPHlmL+URO7IbOmiNBibvjdb1z5bURqYecwn1aCOLFIuiN
X-Received: by 2002:a05:6a21:6b8b:b0:3da:fe32:4217 with SMTP id adf61e73a8af0-3dd8bc6cf32mr1894679637.16.1789710076506;
        Thu, 17 Sep 2026 22:41:16 -0700 (PDT)
Received: from lenovo-thinkbook.lenovo.com (n11212025079.netvigator.com. [112.120.25.79])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5bc98a45csm348612a12.2.2026.09.17.22.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 22:41:16 -0700 (PDT)
From: Yuqi Xu <xuyuqiabc@gmail.com>
To: westeri@kernel.org,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuqi Xu <xuyuqiabc@gmail.com>
Subject: [PATCH] i2c: acpi: Add ELAN0662 to i2c_acpi_force_100khz_device_ids
Date: Fri, 18 Sep 2026 13:41:09 +0800
Message-ID: <20260918054109.23550-1-xuyuqiabc@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ELAN0662 touchpad (04F3:317C) in the Lenovo ThinkBook 14 G4+ ARA
(21D0) intermittently stutters and drops touches. libinput discards
invalid touch coordinates and logs (rate limited to five messages per
24 hours):

  libinput error: event6 - ELAN0662:00 04F3:317C Touchpad: kernel
  bug: Touch jump detected and discarded.

The ACPI DSDT describes the touchpad's I2cSerialBus resource on an
AMDI0010 controller with a connection speed of 0x00061A80 (400 kHz),
and the kernel does not lower it for this device, so the touchpad runs
at 400 kHz. This is the same issue previously fixed for ELAN06FA and
ELAN0678.

Forcing the bus to 100 kHz was tested with a DSDT override on the
affected machine, and the kernel confirmed the override:

  ACPI: Table Upgrade: override [DSDT-LENOVO-CB-01]

Before the change libinput discarded three touch jumps within about a
minute of touchpad use; after the change no touch jumps were logged
during more than an hour of normal use. The patch itself was not build
tested; the behaviour was validated through the ACPI table override
above.

Assisted-by: DeepSeek:deepseek-v4.1-flash
Signed-off-by: Yuqi Xu <xuyuqiabc@gmail.com>
---
 drivers/i2c/i2c-core-acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
index 3af0e0551185..aae4f159955a 100644
--- a/drivers/i2c/i2c-core-acpi.c
+++ b/drivers/i2c/i2c-core-acpi.c
@@ -373,6 +373,7 @@ static const struct acpi_device_id i2c_acpi_force_100khz_device_ids[] = {
 	 */
 	{ "DELL0A86", 0 },
 	{ "DLL0945", 0 },
+	{ "ELAN0662", 0 },
 	{ "ELAN0678", 0 },
 	{ "ELAN06FA", 0 },
 	{ "ELAN1300", 0 },
-- 
2.55.0

