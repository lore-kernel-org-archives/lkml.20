Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E603D525A97
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861024; cv=none; b=uaunrgUvT2f+VhuTE/WR/0N/8iZZjjvbwiBZBLhd0FaUk1rbpU1xMypfXV13Mapuzm6WI+4WhxcQRIWtzVRITbnYdQsA/d0mbeDv3O/9N2awzKeAr5zixQNwmFYutEDfvOuC1ERfwEYsi+FdeitxnCvuAIAXxtielf4MlL5rEL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861024; c=relaxed/simple;
	bh=pQZHWbUauYzhKXZgERSKGkVg21iClqA7I2+s1O9zq+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pQoqkQ0btEH7/qNqFC274ko1woW8KqR/myZO5iotUFW8IQPAIJM1NLNBbXZ2GotJ6J/giCder503U8/hqVqLg2t1cbW+oUP/ssu6T1CBqSmNQ3di6reqmIH+fBN6KO0rxhzyBlAf5QgDKBTEI/1zvKAKfR5CZqw+lIC7exoM1qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q29CEe6K; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q29CEe6K"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc328b43a56so3553260a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788861022; x=1789465822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JBQuh1kx0yz2cTZ9l3fLuYcMsBYVoT0wURqzHnn9FPU=;
        b=Q29CEe6KZp3RwRtE19a9KHr+el/uzGbZ1fwFDGqBdfDORJvxJDNHZV9P9XZ5k5cKEn
         OutrC/qadMyHiPXzWH2CoVQyBAgwa/lmFPU4gEsES1D0NWcSmfiFjxsqDFI2kpP0I6QE
         Dpokh+v/TIRyzjeS4vH3Zj9uMGotg100psS1ff+jrbYc3up4jAPjM7ohyf4CmTVCap8g
         FT+gdi1+tEai44GFqQx8vxZYh9OHXmlxNq6K7xUKeb5ALyE3p8HpPTbnCoMCfyDrRVHo
         WA0Of9ALU43rDXj01KD+ummWzrManSQrNP132VMkaHTRKU0lUaqIUirWvipbVtG83wXo
         kVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861022; x=1789465822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JBQuh1kx0yz2cTZ9l3fLuYcMsBYVoT0wURqzHnn9FPU=;
        b=EFTW20Wxvj2bMwMq9xaqvrDg9Wkmw0AmevtCPgffubdkDUdsxcpvtNz8V6kxwCM2Y3
         i1HqI5WEzc+y9k+/01p3XYN1DLAS3NvsjGvsnUUIpYysFZKscMgVejGK+J5ofKhvxpEa
         1NSu2s0Nk8K9nd3mjo7QeqqAW7VIMQxXgw0ziys8VlW8HZyyObURodmyaPkatDYs7/2G
         rLnA96n6pqv0MCP+6oRlxmV+c15lEas4T7uhIUv+Piz5zv9s9XvhBIcd62Af9DjZN7jE
         DFjLdgfasSqidGyTYEgpiwb5+paFV7d068+0EOuwLUnCCWg0FJjQ7aNWJ9EqKYFWOBle
         WwHg==
X-Forwarded-Encrypted: i=1; AKwUvBzZq5hS6qyPI4nU43OeFNs7Bf7MldNVh9vgo4Jz+HdeqZgUkqfms+40+v4iH7TEBRIanpyn5J6BCUygMbA=@vger.kernel.org
X-Gm-Message-State: AFuF++nWRYj6qHW1gl2xyfKPihpz7hMClnySgWg4txp+3g687vWETlB0
	XyRJfvavAPyXMmRNjA9TZwZ5PwzWQxr/G5ouDTG3lSHg9u3csnY1eIgjO++JDQ9ytK6Pfw==
X-Gm-Gg: AYBFou3feh6OkYEBr5KoHPTcZGa9zB8nVcI0L/gZtdTWRHYKBCam4wnRP8UkDaeF/oz
	yGGjpqGi1lzzftYJ/wnZNtRmxYib/D539hTo6oOD9gTamFXj2pHpi56MSpViJ6UQq3wrutUoUxu
	sutNV1TzGF2ymaa2FqTzY7pNHzVej79ehk+jDmmDj19MX8OENOhQN3JvDWV674kZBNo1UDIUl9S
	712Pu/cpigIljmZQfy39PgMPge9BWxmi2C5a462xEeauS91RX2OV+kcdmexRh57JvSeZev4pVt9
	JSReSo6ANCZS8Js+Dee6igMhnMaz09Z6dD1gmZxqmkY5/aDw5quluKfJ8tOuF1IoGcFe/UZWwcp
	U3i9pRjo4RG4QUBch0Zlw7CglG4jq30Vqo5snGfB40p3GjL/UeUjuE9eyPFVytPOnz2JTNA7cB0
	MnE87q82HRT1FeLHRLyCStNaEU15c+6qbktA+jWgrHv4iJpZntP1eAGQSwPw47aMhytXjAz+VOR
	IVc94dJoyqWSivc4WRovrI604aXV/rVDLwIoVNjLg==
X-Received: by 2002:a05:6a20:7288:b0:3b2:a809:1000 with SMTP id adf61e73a8af0-3da39b437bemr40883077637.3.1788861022210;
        Tue, 08 Sep 2026 02:50:22 -0700 (PDT)
Received: from sergio-82n7.fritz.box (static-23-234-74-239.cust.tzulo.com. [23.234.74.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm32256614c88.14.2026.09.08.02.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:50:21 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH v2] hwmon: (yogafan) Update reference database and contributors for new models
Date: Tue,  8 Sep 2026 11:50:09 +0200
Message-ID: <20260908095009.2227661-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation entries for the newly supported laptop models
(Yoga 14cACN 2021, Yoga 740-15IML, and IdeaPad 3 15ALC6 Ub) in the
master reference database table, and include the new contributor.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
v2: Split changes and addressed reviewer comments.
---
 Documentation/hwmon/yogafan.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
index 9ff5db5dc..5c21c50b7 100644
--- a/Documentation/hwmon/yogafan.rst
+++ b/Documentation/hwmon/yogafan.rst
@@ -87,6 +87,9 @@ immediately to ensure the user knows the fan has stopped.
 
  MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH          | WIDTH  | MULTiplier
  ----------------------------------------------------------------------------------------------------
+ 82N7           | Yoga 14cACN 2021   | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
+ 81TD           | Yoga 740-15IML     | 0x06      | \_SB.PCI0.LPCB.EC0.FANS        |  8-bit | 100
+ 82KU           | IdeaPad 3 15ALC6 Ub| 0x06      | \_SB.PCI0.LPC0.EC0.FANS/FA2S   |  8-bit | 100
  82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
  80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
  83E2           | Yoga Pro 7       | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
@@ -159,6 +162,7 @@ Contributors & DSDT Providers:
 - **Sarbajit Sarkar** (Lenovo LOQ 15IAX9)
 - **HinataKato** (XiaoXin Pro 13ARE 2020 - 83KF)
 - **PenPenIsGod** (IdeaPad 3 15ALC6 - 82KU & Legion Pro 7 16AFR10H - 83RU)
+- **wizard-28** (IdeaPad 3 15ALC6 Ub - 82KU)
 - **unlockxiaom** (Legion Pro 7 16AFR10H - 83RU, Yoga Pro 7 14IAH10 - 83KF, ThinkCentre M80q)
 - **Phani Pavan K** (Yoga Pro 7 14IAH10 - 83KF)
 - **Splarkszter** (Yoga 7 16ARP8 - 83BS)
-- 
2.55.0

