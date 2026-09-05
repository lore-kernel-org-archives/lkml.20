Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00FE3783D5
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788619972; cv=none; b=RYEJ+oAB8g2AlWTOyxzdOQ96uA0IxTLKkzhExtZ/09oS8PoDabjyWuzETDuaYpwEjcygpk4gwncd7KesMQYd+0k4wYlJrm83dpKvbsvJ3C0TCAW+EDG9YfdGg8bTdDRfM4pVpmd49XvCcyDkGy0/gGen8VVSpqAHh4Yw6W/K4Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788619972; c=relaxed/simple;
	bh=S7c7ZBrkJsIqjNyyfy3SaRYqAcjs8KgrZJdd3LyuyZI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rEqR4ja6v2ii8XZWok0uMI5dpyCfDLLwMLi9EeGXlXqJJkbr8hDCl4poy51dETQ9mAsC7sG3PIQj2LbNGV+7igzrv0mbMEoqbKnCsi/4YRRM8MnQjBAsNfI8nhNMLPXezAYeOYWrcxhsd81rA4enJcI1UKJg4a6+LlA3ncmyfk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5hhkcSb; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5hhkcSb"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso20837285e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 07:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788619969; x=1789224769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OfMiV4sac4ZgnZLIuFSOoZEdJ1/aeRtOI0TR+jwk25c=;
        b=l5hhkcSb2shjaZLdUBrBX8/0VK4jJ+AlNZ5PA/FiPYTCik/6kiw3WplVohx5PMG5ho
         NbXgO/WspsvnfpKMBxyL1jctBSapD2pCERcvqzuU2oCpW4wEHlIKwbOv4lO9lFMcGnLB
         3VQ2JH5bvejSZIqqm16oH/m8CMERPztdCXxyJugm1+RTfQEB01yym0QW1dW6H75nDGZs
         De8D5zWChJGq2oMW1PA7SHstblIJFfuNN5VmpR6NuCbn2j22BubtjHq/hevk+fFYH+aV
         r//HjOkRcVfuWB+yI3bU0Tgx3IcA29jW007lG88I1OXV6C+FrS66TZRpSH6mpsXFyKaC
         GVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788619969; x=1789224769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfMiV4sac4ZgnZLIuFSOoZEdJ1/aeRtOI0TR+jwk25c=;
        b=REdS1Sw9OmoxDq+cT5jDw8jKag/X63Bo+Nh1z8/E8tixwF+TQG/xpm/MUHzkUDJulV
         4qDa/F0beuYHor8RBzWTL4uJhpkGmUXG01NyXktwK81mRFRukC483LCsYqcBeqxSZOHf
         ftrKLAKEpy3WQjBYgLGfEvRejFZh4l/iiOP40KMAeu1olym7qzuTwH+qR1MOhiy36WnH
         qXkivplrRb9h9+W9E9+vSjaCj6lm/P6J1tBXwNOM9PBrrlvzgCzPhxHTpUejcPITGD5h
         vVXJ5E0RBX8e/ktk3k9wkYQqvvLhMsQCDSlgi6U0N4o0nlfi2wxUUrlPqaOsgtch3Nbt
         mDcQ==
X-Forwarded-Encrypted: i=1; AKwUvBx42bBaaPUn+hP/QC6cJ17MfGCETihnCMY+h68xKYICzFKYI7ooDMjyXTqtPUC6o/J5kZUrVvZAY4Ds7q8=@vger.kernel.org
X-Gm-Message-State: AFuF++mfXTeiHoWH4fYDHTAmK5mBr3U+zb7ylpcRTKdsU557RNExa2iE
	YUG7N/Wbz3ASIIw5EmmXiTtqldmDLG7Ry1G4EMzynscptzFOHWl5vsnR
X-Gm-Gg: AYBFou2EJwEB13y01C4MjhsQo5+v5bb76S+A60HacL0CzE3D8MIufh66zZqDhj0jWFr
	RBUbOn8vUzMShKabVOqjLTuZsh8bc+qARVlCJHNT+9HtyHYex+Y0n6TQooR9rke1mvhBCCoQRdf
	Q5SUSiL3D9gEQwRZygPAMdW4aLF1jwABqYVQhwl2U9XAy9dQaULcLCqiRj/bA+xCmNPyl9NLYR/
	2dUOA/PlvJGrXxChr/+CBwyPIoWW00JEEx8dAEnJ7gsLD0h4RKyGC2ZnO2cUjCPl/UbkBv3enDI
	a+0u54IbFQWVVP30pjdzNdSbGhPYTXaJTqJ8ULkdvhlOoSj8/qa7XXCVtFxguwCX0QUvaGkuIrx
	Y2ShKta65UG+7TRX+JghhKuPp10j+nACjtMJTiEr8P/qhVUmbYM1BdHl9NPA6Fpt3EbmcSQnEL2
	Q6H3HePGb/MT9IA4mDY6A+XIg8/L6am5e6GJKRMD6r+8Cx3dRlhBmDFFnt+6tLiQ0UNWCJiNAUE
	aoSOJT6vd+bnt5gsbUfHt/u2wDTMRH3YbPlypW6GZPNiL6+jjVN0GNGMNg9IIRluj6bGhWAOjDJ
	lbmEpIfNd4G9IfS9vQrrEMZhl+spZZY+J26QHkulZlAHPYB64SUDYucPsXamgnx4KLc=
X-Received: by 2002:a05:600c:3f12:b0:49c:c8de:96a9 with SMTP id 5b1f17b1804b1-49cf7fdd2dfmr235359335e9.2.1788619968489;
        Sat, 05 Sep 2026 07:52:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf75cd8d0sm142176605e9.2.2026.09.05.07.52.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 07:52:47 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christoph Hellwig <hch@lst.de>,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH v2] sh: Use generic OHCI platform provider symbol
Date: Sat,  5 Sep 2026 16:52:25 +0200
Message-Id: <20260905145225.88518-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pengpeng Hou <pengpeng@iscas.ac.cn>

The old SuperH-specific `USB_OHCI_SH` provider symbol no longer carries
an OHCI provider object.  The current platform OHCI provider is
`USB_OHCI_HCD_PLATFORM`, which builds ohci-platform.o.

Several SH CPU subtypes still select `USB_OHCI_SH`, and the
sh7757lcr defconfig still enables it directly.  Switch both the subtype
selects and the defconfig to `USB_OHCI_HCD_PLATFORM` so the intended OHCI
provider remains reachable when `USB_OHCI_HCD` is enabled.

Fixes: 4f6dfc2136fb ("usb: remove the dead USB_OHCI_SH option")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
[Karl Mehltretter: rebased, added Fixes: tag]
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Resend of Pengpeng's patch from June, which Geert reviewed but which
never got applied. Geert asked for it to be picked up instead of my
"sh: Drop the selects of the removed CONFIG_USB_OHCI_SH symbol", which
is withdrawn:
  https://lore.kernel.org/r/CAMuHMdWYBp0d7m0Q8rWva+EA=4nOezm1os_6ZVcrh43aPjCCPQ@mail.gmail.com/

Changes since v1 (https://lore.kernel.org/r/20260624081926.12426-1-pengpeng@iscas.ac.cn/):
- rebased on current mainline so that git am applies it
- Fixes: tag as suggested by Geert, his Reviewed-by collected
- checked with make ARCH=sh sh7757lcr_defconfig and an SH7720 config
  with USB_OHCI_HCD, ohci-platform.o builds with sh4-linux-gnu-gcc

 arch/sh/Kconfig                     | 8 ++++----
 arch/sh/configs/sh7757lcr_defconfig | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index d60f1d5a94c0..f987d999126a 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -331,7 +331,7 @@ config CPU_SUBTYPE_SH7720
 	select CPU_SH3
 	select CPU_HAS_DSP
 	select SYS_SUPPORTS_SH_CMT
-	select USB_OHCI_SH if USB_OHCI_HCD
+	select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
 	select PINCTRL
 	help
 	  Select SH7720 if you have a SH3-DSP SH7720 CPU.
@@ -341,7 +341,7 @@ config CPU_SUBTYPE_SH7721
 	select CPU_SH3
 	select CPU_HAS_DSP
 	select SYS_SUPPORTS_SH_CMT
-	select USB_OHCI_SH if USB_OHCI_HCD
+	select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
 	help
 	  Select SH7721 if you have a SH3-DSP SH7721 CPU.
 
@@ -426,7 +426,7 @@ config CPU_SUBTYPE_SH7757
 config CPU_SUBTYPE_SH7763
 	bool "Support SH7763 processor"
 	select CPU_SH4A
-	select USB_OHCI_SH if USB_OHCI_HCD
+	select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
 	help
 	  Select SH7763 if you have a SH4A SH7763(R5S77631) CPU.
 
@@ -452,7 +452,7 @@ config CPU_SUBTYPE_SH7786
 	select CPU_SHX3
 	select CPU_HAS_PTEAEX
 	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
-	select USB_OHCI_SH if USB_OHCI_HCD
+	select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
 	select USB_EHCI_SH if USB_EHCI_HCD
 	select PINCTRL
 
diff --git a/arch/sh/configs/sh7757lcr_defconfig b/arch/sh/configs/sh7757lcr_defconfig
index 93066ae429ec..ed2894784a82 100644
--- a/arch/sh/configs/sh7757lcr_defconfig
+++ b/arch/sh/configs/sh7757lcr_defconfig
@@ -58,7 +58,7 @@ CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_SH=y
 CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_OHCI_SH=y
+CONFIG_USB_OHCI_HCD_PLATFORM=y
 CONFIG_USB_STORAGE=y
 CONFIG_MMC=y
 CONFIG_MMC_SDHI=y

base-commit: 986c24e0fe44f844b44d365b71ce831947f50298
-- 
2.53.0

