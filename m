Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56DE394793
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788595450; cv=none; b=jiRkwUGN8/hh3ZgiMqgEpREXZCrT+6ugUHJZ3Exd7z2UUPeRw2rD5zLjGd7rVPRD4pP2nb51KedFS/fDCINSO4cc9/EgzfFJmZDQg6xsjIu1UPVqyzzHK/dCQnOPA4txQTrcyNW02ex0dwMin8GW0RGbaAHPu1fSTVLbmVvKuqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788595450; c=relaxed/simple;
	bh=4ekraZy/fgRJ8xIH3aZd8XUZWGZ1ch2LOkcS3hFNA/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W4t19fEs+NdYb13suO2fBcAFWb+ajwL3ELLTmZDlB43bFWYsNPELNvXuEBLqfIFtm+7Yy6OOPau+EDF9gNRY9kd7kjlG86vpqRhlfKodZKBdAauP+qetyxBuBmqRtksZuNMwwUrFFs8ghqcmwP7M5RpevkAtcinVdRYp+iGcZwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rNknC+46; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNknC+46"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48441fa5c37so1269683f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 01:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788595447; x=1789200247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IRZkyYibSQw/TdoJWn+8ggoBMlqJpfdb7cVc+BMe9tc=;
        b=rNknC+46zeL4xMwEPRnti6awsI701Zv3lYwZalIuADh3BDeUVky8h98MbWSTBP8z87
         pTs+O9AFTQ26raXHvDO4E2QnGVG0HAEkX2E1DmSwmiyZmaW/YadsKRgfdfJJs0w4TI0P
         YHO7PRz8OP1SzBbhnRhCKk+6u+E7gi+eSHPrAOfgc/CaKPmZnhTzFTT37j2TumZArEPD
         L6ZNu8pooBagugkySZPFyWWc/0+890eXogAm4yMZlSQDcE8ZeXdeY7hpZI/nrU/GcdzX
         Jj3wmX9cISeOzdnxX63C9lR189pPBYoEelOSR4GO46wFWdioo+2sM3JfeZJKSKN8O+3X
         dglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788595447; x=1789200247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRZkyYibSQw/TdoJWn+8ggoBMlqJpfdb7cVc+BMe9tc=;
        b=DQdpbygLqjjj8QFcVcH5cyxKmzQc/spoEmqtW+voq63xfRIdj7FMmuZH4j+lfiRP0J
         7IKDRiwZ1MskhtiueOZ8CrUOa1SXEkivOXLpOKFbjADbRaSOc8j06zbBB0g+FtHNxLTF
         9Rs32uPYHzkFerPh6GyjiuOxsxEp50FgqO8TqywpfuwkC5mcVCpoHWXsOuBQ6jAHAcQL
         dzgsIupCEZJraQAg3jUz02i1EOLODtyiUFMnS7tuUsCPrlQMRC8EAdOvkeW9Ryd0BpcY
         ksXCPizsEmCRSzcp8WhNg90gsDYaYRP2usjtH+B17bEspaKNFNIAOU1HGdM5YTtUd+4z
         pTqw==
X-Forwarded-Encrypted: i=1; AKwUvBxqWI0jcd2f9Y+qClcxNTKM5aW7aoNfoh93v7l3HqedmXqqh2Kju+FB0vG6CsiK1S3ZfEeKoBdIWVhoVRc=@vger.kernel.org
X-Gm-Message-State: AFuF++kVZuTGtG4riYQ/v3wJEAS1uGxKBwOBqd0VNvVr12ShNcNGSI3o
	O3dk7MbNGnYiyv0R/mK9SOI2nn+CYjQ+sx90sOOgNx40f385PyGRpmug
X-Gm-Gg: AYBFou3DEXdAF1s4MbYQSGlbnkwNxmPrQYwGYgo6JtBn+oXrdTqHx7aL+8h/BNEQWOc
	pHudojUnuP84vDFe5K04+8u9xM74IThUaRvyyxUvOEZWKBze/cl9uulqkmLqXU0VFvw+wI3JIsW
	jvfbkc2BDkvbIZtNYMe5TmamApYeyIToFycFZcvY4iKRdPDwKo1dm8XE6Ae9L+Qy6P8v0RVbboG
	bKu0RF42Xj0PtIIORntRaXiICU1dJTjpxumMxhKLWnRvlS8EtlQOco6BQPBmLyyf4pc7oUWRq7W
	fgLqFg9SlamcxUgJQdywryW68AWq54HaL31uvefoQe4S0+l+mSMQRECyaLXqSgBnQ4/oNXVMDaG
	zowki+qrgyDeukVFa3D8M96Smu7n8YfgxYY/1v/LWTadQjS7haieuDYwN8vCXV+QCvycB/BVQ0W
	5wLQiNp4TmU+4tilXQmjK14BfvDh8nEdyrx1pdbKyFCIgEdcsoy9cZmKyZ61CqwjjIa8Af/f547
	M0nPmt4ovBLifb5PUjVaQ+SjLUWiabTUzsGjLp78bKfPUjVGiw=
X-Received: by 2002:a05:600d:8446:20b0:49c:fc7a:22d5 with SMTP id 5b1f17b1804b1-49cfc7a2342mr62413185e9.4.1788595446573;
        Sat, 05 Sep 2026 01:04:06 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5563c6csm206542315e9.4.2026.09.05.01.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 01:04:05 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Mario Nuevo <marionuevo@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org (open list:HARDWARE MONITORING),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX Z490-A GAMING
Date: Sat,  5 Sep 2026 10:03:36 +0200
Message-ID: <20260905080346.1957380-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Nuevo <marionuevo@gmail.com>

The ROG STRIX Z490-A GAMING and Z490-F GAMING are essentially the same
board apart from the F's onboard WiFi module, which isn't wired through
the EC, so they share the same EC sensor layout. The Z490-A exposes the
same EC sensor set as the Z490-F (chipset, CPU, motherboard, T_Sensor
and VRM temperatures plus CPU_OPT and VRM HS fans) at the same EC
registers, so reuse the Z490-F board_info for it.

Signed-off-by: Mario Nuevo <marionuevo@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index ebed9f8d2adb..7032c40731d9 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -55,6 +55,7 @@ Supported boards:
  * ROG STRIX X870E-H GAMING WIFI7
  * ROG STRIX Z390-E GAMING
  * ROG STRIX Z390-F GAMING
+ * ROG STRIX Z490-A GAMING
  * ROG STRIX Z490-F GAMING
  * ROG STRIX Z690-A GAMING WIFI D4
  * ROG STRIX Z690-E GAMING WIFI
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 7293c48c72b1..19f423e45ce5 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -982,6 +982,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_z390_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z390-F GAMING",
 					&board_info_strix_z390_f_gaming),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z490-A GAMING",
+					&board_info_strix_z490_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z490-F GAMING",
 					&board_info_strix_z490_f_gaming),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX Z690-A GAMING WIFI D4",
-- 
2.55.0

