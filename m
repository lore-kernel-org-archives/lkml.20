Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792651191;
	b=C6xYL7e4W7CKNTM+95yaZIaCd2Nsk5cxdCPZneWPuB+eTxg/SfMbnih+2rgIeDz5ihXm
	 UcurVAQ2Z5sEUuQ6/ZwMrEgnanXv9EjJOsHkq4HVC01pqadal1I45czR+iyxwl0BboS0Y
	 t+ipXNmp6IrV42dwB65Ey5XFlF8bp8BH+ObVuF39DO5qptOpJNFGtppj9CCuhzSEfx611
	 3+4nVdKlVl7kOkmqZSOKO0AAPuMPf2mVHDumdiIIuT/vEZDWittb02cFly3hzhfAo6jQq
	 l8KsjFRqD3tI55xi2jFX8ED/b9eEq8ru+lTkWfh7/d5c2QXi171rGL6FSqpoKejMUIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792651191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0oGfI5y7RM0zVga9sjfE4GNp8DkV1WYfD04Z0CFgmnw=;
	b=AXe4k6y5KyS6uOV1Nl3OFUgFM3KT0ksuK0sQf21wQrbf9UI/oiHJgg+FtgNpSs3YqAlE
	 JMfrmnA+QqVuH90POQVS6O2cSjbMbvdki8IcWIRT5KjMretrsbydRZPNk81pB6LbnthLf
	 MnQHh5jxcqaXjbFi1gfm2apO2pL5qFo8A+KyXTvkJjaiCAFHg6b6qcdS2QRDI9C3v0FI+
	 cicQMTrjQoxLaVrLhbocH0L9l2DtDPBLUXkxIsitCGtRzFUex1H+f3DVPl/ocWsCT9zaH
	 zmliewvpF16mU/7NSbnuxtsvHZCfBsb/9sCpCfj3wiLeO18z8p7Ctc79Jd/9LL5vRIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FBQjdyyh;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B9A606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16B9A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FBQjdyyh
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so871376a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 23:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792651190; x=1793255990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oGfI5y7RM0zVga9sjfE4GNp8DkV1WYfD04Z0CFgmnw=;
        b=FBQjdyyhSwLLCSJuniqU96oNfOWxUFoKtajyUpBO4bWxAFTO++N7cqrv9/xPF5xY7W
         11iFJ1cOV9Yo+vhuQ/1YGiEMwnJjkh4rGYE8MpAEMi8AQYaoyVHwQPFTotwKvZH6jlz6
         2JLsVTF7km1HQFp9U8f69EUEAiJDpL1Ms1BEKfPyccQ+lknUtgpQIraok2VFstRAs7cA
         SPD7pdqADnC+8kvmzglmRe3waHJCLEJYBXPfjFhvVZHtMlkFRSSIaGzSVbbjKeoDHFFT
         N/RSsyoS2nuNSSd/ZKIQJaK4UB+Sms0GNrRdyBYJ8E46/BAf0n2mVb7I8hMbyerw1ZjA
         3C+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792651190; x=1793255990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0oGfI5y7RM0zVga9sjfE4GNp8DkV1WYfD04Z0CFgmnw=;
        b=seEvRMZz6gEmw+dzTg+wSfJUcRbJotP5Mn9HyJn1J8PQU3wTEojdHvNFFwuxRNI+QB
         tw7PqKrwaxB70J7ywOZsY4WW56d3BToy9UVVqHKK1QZWVmyPSTeZg0GSaIzqMEMa9GYC
         +AcRW6VfXL1U4dHoegyj6dVFKkE/7YX3VNxFqT+daUF+k3mxz0fLr4ilrNYUj0i2c2yD
         MM+hV3BxiDdMI5wCBLuiopLVjf2dVPVGm8qwsGIwNSdMflwfj6HUT3ad9OaUDqgj+3w7
         Rqqtm8G075R8ItjvJjnsmzhwAAGrfOmNP1mm4Y3pwTLVa1hE9LPFsOsnQraenZw88XTF
         zkfA==
X-Forwarded-Encrypted: i=1; AKwUvBw9FOJV1NuP4GWq6H82FSYexboksO42nT3K6RvuSZFcy7eJL+m2McFixKZykQat8fanl/ehQNk+g5PworE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZ+9m7NICPg8evunZ6MkSysPNa8yOmpwGu5Kp+LLr8dHhA439T
	x9lD71PMDOOKuZIbpKRMy+4y+8PzZZ3ISVPN+vMDly3/DGqLoo5LRb6b
X-Gm-Gg: AYBFou14JqW4g6V0rPKrWAVeJwC+G6dWwsUXFwXxEeGuyt8kT8yTaaVEF6HsgQBdnzW
	hS6ys1oG2FKG3D8FCOTijnb6sRRasolHfadj+4rt/yhuqXZqgkfaXBKIUvKiv+B0u8PBRu1veuC
	20ak6lcrQLJRTR73ZNtNGsEWJa04f3+Ck+ZzHorNXlmChHDcuVATVz6gl6qpOCIiiXK79R6/Z8+
	qrbORsMZyd4GUrTmBTTPAPrtI7WC8Lkvufe+iPEDtCMXvld5+l6YruUvFRUbxx/sath1ZHDks+U
	6QxNgn5slY7UbIt/trHwJpjkKmn26Hopl0X3cNH8ig0GnUXxtIHTQ4APPcsD+3dgrHf4vdiJ3Q6
	DYNWcgeozCYoydvT2eD47Edya3kTXgHBmTWVGv9qZC+K33KCGpgRvNK7cC8SP6Uf8ttlrYFsLkL
	fbJone8PQHuIwr1boBJJs/RTe9Dl9eB/Fu5CIhA1kGugcpaM0Ia2q3Xpf82hi/r7XXBgeDBT+76
	eSVL6gHDaAz8luSYbecg8JZhjCT5uC8tNi8ONvEfNV65KkpYYRFSC0wj7H0GXTfN561BhXEfI/s
	C2EoSc7EIS8A9Q==
X-Received: by 2002:a17:90a:e70e:b0:3ab:c674:cad9 with SMTP id 98e67ed59e1d1-3ad86cc21c0mr3645525a91.54.1792651190526;
        Wed, 21 Oct 2026 23:39:50 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm2784741a91.2.2026.10.21.23.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 23:39:50 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: glaubitz@physik.fu-berlin.de
Cc: dalias@libc.org,
	ysato@users.sourceforge.jp,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	Artem Novak <artem122novak@gmail.com>
Subject: [RFC PATCH 2/2] sh: fx9750giii: add board support
Date: Thu, 22 Oct 2026 00:39:36 -0600
Message-ID: <20261022063936.472520-3-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022063936.472520-1-artem122novak@gmail.com>
References: <20261022063936.472520-1-artem122novak@gmail.com>
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

Add minimal machine support for the Casio fx-9750GIII graphing calculator.

Introducing a board Kconfig option and registration on its machine vector.
Wire the board directory into the SuperH build system.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/sh/Makefile                        |  1 +
 arch/sh/boards/Kconfig                  | 12 ++++++++++++
 arch/sh/boards/Makefile                 |  1 +
 arch/sh/boards/mach-fx9750giii/Makefile |  2 ++
 arch/sh/boards/mach-fx9750giii/setup.c  | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 arch/sh/boards/mach-fx9750giii/Makefile
 create mode 100644 arch/sh/boards/mach-fx9750giii/setup.c

diff --git a/arch/sh/Makefile b/arch/sh/Makefile
index 380e3b7dc597..28b431a8c8d9 100644
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -128,6 +128,7 @@ machdir-$(CONFIG_SH_KFR2R09)			+= mach-kfr2r09
 machdir-$(CONFIG_SH_ECOVEC)			+= mach-ecovec24
 machdir-$(CONFIG_SH_SDK7786)			+= mach-sdk7786
 machdir-$(CONFIG_SH_X3PROTO)			+= mach-x3proto
+machdir-$(CONFIG_SH_FX9750GIII)		+= mach-fx9750giii
 machdir-$(CONFIG_SH_LANDISK)			+= mach-landisk
 machdir-y					+= mach-common
 
diff --git a/arch/sh/boards/Kconfig b/arch/sh/boards/Kconfig
index d89b74177233..f1571b0e5f1f 100644
--- a/arch/sh/boards/Kconfig
+++ b/arch/sh/boards/Kconfig
@@ -326,6 +326,18 @@ config SH_LBOX_RE2
 	help
 	  Select L-BOX RE2 if configuring for the NTT COMWARE L-BOX RE2.
 
+
+config SH_FX9750GIII
+	bool "Casio fx-9750GIII"
+	depends on CPU_SUBTYPE_SH7305
+	select OF
+	select OF_EARLY_FLATTREE
+	help
+	  Enable board support for the Casio fx-9750GIII
+	  graphing calculator, based on the Renesas SH7305.
+	  This selects the calculator machine vector and
+	  enables early Device Tree support for the board.
+
 config SH_X3PROTO
 	bool "SH-X3 Prototype board"
 	depends on CPU_SUBTYPE_SHX3
diff --git a/arch/sh/boards/Makefile b/arch/sh/boards/Makefile
index fbbc350ca854..c60d038872e9 100644
--- a/arch/sh/boards/Makefile
+++ b/arch/sh/boards/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_SH_ECOVEC)		+= mach-ecovec24/
 obj-$(CONFIG_SH_SDK7780)	+= mach-sdk7780/
 obj-$(CONFIG_SH_SDK7786)	+= mach-sdk7786/
 obj-$(CONFIG_SH_X3PROTO)	+= mach-x3proto/
+obj-$(CONFIG_SH_FX9750GIII)	+= mach-fx9750giii/
 obj-$(CONFIG_SH_SH7763RDP)	+= mach-sh7763rdp/
 obj-$(CONFIG_SH_LANDISK)	+= mach-landisk/
 obj-$(CONFIG_SH_LBOX_RE2)	+= mach-lboxre2/
diff --git a/arch/sh/boards/mach-fx9750giii/Makefile b/arch/sh/boards/mach-fx9750giii/Makefile
new file mode 100644
index 000000000000..0d6df7044567
--- /dev/null
+++ b/arch/sh/boards/mach-fx9750giii/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-y += setup.o
diff --git a/arch/sh/boards/mach-fx9750giii/setup.c b/arch/sh/boards/mach-fx9750giii/setup.c
new file mode 100644
index 000000000000..233decdd1bfe
--- /dev/null
+++ b/arch/sh/boards/mach-fx9750giii/setup.c
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2026 Artem Novak
+/*
+ * Casio fx-9750GIII platform support
+ *
+ */
+
+#include <linux/init.h>
+
+#include <asm/machvec.h>
+
+static struct sh_machine_vector mv_fx9750giii __initmv = {
+	.mv_name	= "Casio fx-9750GIII",
+};
-- 
2.56.0

