Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F21363C53
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405419; cv=none; b=CPBurOE4C+MnfkNA6UYVTFUo219dB8MLZelo/c8ayWWIs7x4B8Kxm3FPyV/eICtDgT2kMxVj7Y3BncOLXYkGjqdPU+Tf1f4w42Ovq26K06lzwN3UsIixTx6QkTsaQkhJxHAyyK3fYjeB0nQQZjiwqCxaPeITeFvSQTaSsd2ya7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405419; c=relaxed/simple;
	bh=5Yj0dTnOwgQEMTB9mEhi4uj5BeVDhHGp8JAp3PNkZec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkZDt89I0kmyt0Ftezqg/mdtsX+1w4k7IpNi6q61P6pcefUGiCGCxFd6mLIUB8jiD+89iwC/2T76kO172jX1ZblPXFvOIdJQNsbmR9iVCZVn6QlUXq2mufMwWCEZIjxm/R8vKr9GiVNv5ItRP5Lp/alUhPoKXxQrPpNs/M3GH0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/ceOV5U; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/ceOV5U"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d942c7cc2fso15547985ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788405417; x=1789010217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xbEFmrs3C5dS+39TnbPAk00KsjGFMl07WADSPwTdM8=;
        b=f/ceOV5UyTHcvbjegJdK3Z0VbLYd+NoPst6TGnxPZWl6663EntjC/sWo8K4lQ8mBZt
         yi+ashmF+Pma1JUlzDX5sJTJhO/tk7pkvsK2VTOyGSxEIQhfcxBGdOUBR0ZZdcfwLRZv
         2aR8EfazVTjMWEzEMar6HbSytnF4ZCj23VP5ZryPL3epyc7bgGzwr5e9K2WynRmXMxGv
         C109jFbwucb3BF9eoMV8CLv+LLMh2jXxHEZPpZwzu8lPgfJbTVFuiRJ7fTB+ydpVVIlS
         9bv3c8MFplMIy4JoCofst1Z4yq87EloNE3CQcF6ELm6iUJ33fix2hH4BzMRXrrOtyaWf
         heFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788405417; x=1789010217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3xbEFmrs3C5dS+39TnbPAk00KsjGFMl07WADSPwTdM8=;
        b=gDvYsbF+5i/HJ7o+LDyWk7uxQb/yODXGu7CgJMxYeHZON1qEVSpDFRWzjnQBCsvVq2
         KLPsdOltMvmLLBrw9S/GNtrxb+9MsubYrRj7P4ENMHzWpZf8V1/hb+d1O1uYqwvSATIa
         fBPD4/01NfDZUn7B9XMUCHs6joPPzUjHX1FDrTJiZW3yA/9sPZaVF/IGRbTqCY/MHIm0
         TTVJkiKfAXqVFSj2JvjuPzKqCJbJk8quRisbHAKBj8H/t3S9LcgSNBoa4yg3cpE4yJ6C
         5XvEnrvLBBK1T+i3BnnwbKFx3YrtGgEscwJyAnZm9WLJQhpokOSQOzWOrcc+NtZXsbTK
         Q1yA==
X-Forwarded-Encrypted: i=1; AKwUvBwJfiLcOkp/YCieyDAy4q4GRJLuQl52EXr8c8Vi38yoX+TSgHiMUEyadkbxPn8VAwLx7PuPgAUWQdvsQdA=@vger.kernel.org
X-Gm-Message-State: AFuF++mRIlTM9+J44kzsKJr1Cgx5MhQOl1N9kteGeejtXU7JK76XVqp7
	uFTMmYKpxvhwAaoHGrvEpMaTnvfe4RaiHgoZJTMgh0EQgq3wgB+IzUC8
X-Gm-Gg: AYBFou0yqOiWZznJrtFQU1nTKrf13IwP4Wpg2PeTOLm8n/nC7e1P/pw+ellnboirIvB
	gUgG/GlR80U92NZ3y9VAxbJiLHaPCvMjRE1R/3SEOwtFANZg1Pd96/DizEAB5EqhB/R1PQj7CLf
	GkUSXhjYcT4SqgSL9AlvQn+OY6njz42Re/3TGwx03Hj//1Vipi16rL+J3eQ8D1Fb7NUGS+9XOl9
	EVxvvKPENvZvIQaUQkVKYvKBRqWs+S4kWUK2lLFx0stkn0rlMP65f3o2TML8y2yxamnNrnCSPO0
	gzG6Qzqc+1cG4vHIhRo1wt/kCzNGUfpvAXfJEGtUeqYTRycs7PPh23H0vLr7CxvyBBh2GWhrAbU
	cG9kSQKrzd+EoE2PEj5bMAUIQhBQhqEEPptBL5R8gFxT3wGp7fy+SPP3Ypq+u/ukDpvMSrtISh6
	sda60f8qRbldXJOhL2mzpEZdYfujF32DWCwpfVxvmKYUrGdmmAlsnKe45x3eryHUF8ZnmIQDroP
	9cAx3RWoyX4DIs=
X-Received: by 2002:a17:90b:4e8b:b0:399:1f8b:d255 with SMTP id 98e67ed59e1d1-39aedec54d0mr14566379a91.5.1788405417033;
        Wed, 02 Sep 2026 20:16:57 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661d:3050::4d0:16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm2244114a91.8.2026.09.02.20.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 20:16:56 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v12 2/5] net: dsa: motorcomm: Move to subdirectory
Date: Thu,  3 Sep 2026 11:16:23 +0800
Message-ID: <20260903031630.356840-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903031630.356840-1-mmyangfl@gmail.com>
References: <20260903031630.356840-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

yt921x is already the longest single-file DSA driver, so it's time to
split it into parts.

Signed-off-by: David Yang <mmyangfl@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 MAINTAINERS                                    |  2 +-
 drivers/net/dsa/Kconfig                        | 10 ++--------
 drivers/net/dsa/Makefile                       |  2 +-
 drivers/net/dsa/motorcomm/Kconfig              |  8 ++++++++
 drivers/net/dsa/motorcomm/Makefile             |  3 +++
 drivers/net/dsa/{yt921x.c => motorcomm/chip.c} |  2 +-
 drivers/net/dsa/{yt921x.h => motorcomm/chip.h} |  0
 7 files changed, 16 insertions(+), 11 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/Kconfig
 create mode 100644 drivers/net/dsa/motorcomm/Makefile
 rename drivers/net/dsa/{yt921x.c => motorcomm/chip.c} (99%)
 rename drivers/net/dsa/{yt921x.h => motorcomm/chip.h} (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0b42e898f4d8..4b0254f62277 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18422,7 +18422,7 @@ M:	David Yang <mmyangfl@gmail.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/dsa/motorcomm,yt921x.yaml
-F:	drivers/net/dsa/yt921x.*
+F:	drivers/net/dsa/motorcomm/
 F:	net/dsa/tag_yt921x.c
 
 MOXA SMARTIO/INDUSTIO/INTELLIO SERIAL CARD
diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index 676fb7dffe14..8d8edcf89f10 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -82,6 +82,8 @@ config NET_DSA_MV88E6060
 
 source "drivers/net/dsa/microchip/Kconfig"
 
+source "drivers/net/dsa/motorcomm/Kconfig"
+
 source "drivers/net/dsa/mv88e6xxx/Kconfig"
 
 source "drivers/net/dsa/mxl862xx/Kconfig"
@@ -168,12 +170,4 @@ config NET_DSA_VITESSE_VSC73XX_PLATFORM
 	  This enables support for the Vitesse VSC7385, VSC7388, VSC7395
 	  and VSC7398 SparX integrated ethernet switches, connected over
 	  a CPU-attached address bus and work in memory-mapped I/O mode.
-
-config NET_DSA_YT921X
-	tristate "Motorcomm YT9215 ethernet switch chip support"
-	select NET_DSA_TAG_YT921X
-	select NET_IEEE8021Q_HELPERS if DCB
-	help
-	  This enables support for the Motorcomm YT9215 ethernet switch
-	  chip.
 endmenu
diff --git a/drivers/net/dsa/Makefile b/drivers/net/dsa/Makefile
index 6ceb78a755d7..df849cd0e640 100644
--- a/drivers/net/dsa/Makefile
+++ b/drivers/net/dsa/Makefile
@@ -15,11 +15,11 @@ obj-$(CONFIG_NET_DSA_SMSC_LAN9303_MDIO) += lan9303_mdio.o
 obj-$(CONFIG_NET_DSA_VITESSE_VSC73XX) += vitesse-vsc73xx-core.o
 obj-$(CONFIG_NET_DSA_VITESSE_VSC73XX_PLATFORM) += vitesse-vsc73xx-platform.o
 obj-$(CONFIG_NET_DSA_VITESSE_VSC73XX_SPI) += vitesse-vsc73xx-spi.o
-obj-$(CONFIG_NET_DSA_YT921X) += yt921x.o
 obj-y				+= b53/
 obj-y				+= hirschmann/
 obj-y				+= lantiq/
 obj-y				+= microchip/
+obj-y				+= motorcomm/
 obj-y				+= mv88e6xxx/
 obj-y				+= mxl862xx/
 obj-y				+= netc/
diff --git a/drivers/net/dsa/motorcomm/Kconfig b/drivers/net/dsa/motorcomm/Kconfig
new file mode 100644
index 000000000000..64ff7d07a91b
--- /dev/null
+++ b/drivers/net/dsa/motorcomm/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config NET_DSA_YT921X
+	tristate "Motorcomm YT9215 ethernet switch chip support"
+	select NET_DSA_TAG_YT921X
+	select NET_IEEE8021Q_HELPERS if DCB
+	help
+	  This enables support for the Motorcomm YT9215 ethernet switch
+	  chip.
diff --git a/drivers/net/dsa/motorcomm/Makefile b/drivers/net/dsa/motorcomm/Makefile
new file mode 100644
index 000000000000..bf99feb4c454
--- /dev/null
+++ b/drivers/net/dsa/motorcomm/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_NET_DSA_YT921X) += yt921x.o
+yt921x-objs := chip.o
diff --git a/drivers/net/dsa/yt921x.c b/drivers/net/dsa/motorcomm/chip.c
similarity index 99%
rename from drivers/net/dsa/yt921x.c
rename to drivers/net/dsa/motorcomm/chip.c
index 44fcdd47ffb5..019b3a2d5d97 100644
--- a/drivers/net/dsa/yt921x.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -26,7 +26,7 @@
 #include <net/ieee8021q.h>
 #include <net/pkt_cls.h>
 
-#include "yt921x.h"
+#include "chip.h"
 
 struct yt921x_mib_desc {
 	unsigned int size;
diff --git a/drivers/net/dsa/yt921x.h b/drivers/net/dsa/motorcomm/chip.h
similarity index 100%
rename from drivers/net/dsa/yt921x.h
rename to drivers/net/dsa/motorcomm/chip.h
-- 
2.53.0

