Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCE43C2774
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788151758; cv=none; b=VDCVjhna8EY8qnjEySGm6zRvuK3243vCy37pe0vM1DvYpeYVBkMXEPdR1F5Exh1e9Pnfx8MYv8k8lGW2k2i1Rh5FNHCkZA0YFIPG6J1v6QcqN1QZbpms3L4E9E4ZOtm4fcRsdZLTOATcy4qRCeJ7MHN1jOp9RzoBubRcf22DKYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788151758; c=relaxed/simple;
	bh=5Yj0dTnOwgQEMTB9mEhi4uj5BeVDhHGp8JAp3PNkZec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GhEyf28qxxt2j5Pd34Vg4kn9tYOZXgznXfOzOAGCv0VLVivHLUCpNQa1EXOpLMCycG4aZzUMC9UHr9aI06vquiK13sUElX1OCS7NEIiT0ZfFDcgMzeG/4rXCXxsM/V8aQi1PVJDecs6raSTF+8/mwNpz//f4TqHuCOZBjrprdkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbiB/VpM; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbiB/VpM"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso3200287a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788151756; x=1788756556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xbEFmrs3C5dS+39TnbPAk00KsjGFMl07WADSPwTdM8=;
        b=ZbiB/VpMIsaky0w6Nf2XFvDf3YlxnImC6a7K1sYMeDLMvTW/clHRTaQ7ldBAzSH2OC
         khbx5fs6UJsjeA8bqKK0u/iNkznHH+ACNu95rRFMeq92Q798nVGTtvRIQVnAQPz45dGj
         9r5X2boNzZ+QQkb59UNzgfj9Jx8IfwvJ0X5WN9b9Q/8wxCIgCJbGhVGcQ9qOvUYzW6UB
         eQ9ovIl/YFkrKjn0SjYcRDU8rs99pJwHTiwR2XGZSFoWrt9hF5g0FZfB+8GqFhrEYSdJ
         C4iuuKIZTRpxWXugAsJ9WLi5gU1B9L2JKZ9iaBIBwBhvRj985pFDbGMebsF8cBZHPuuC
         k3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788151756; x=1788756556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3xbEFmrs3C5dS+39TnbPAk00KsjGFMl07WADSPwTdM8=;
        b=Gfmo5mTcPC2J0lqWTj110T0Ys+lMjZbjB4ocZ0BxHXk9zBiWz+WCOziO691X41o2ZY
         HO9Y5mD5o8g+LVzAUflTvUtx2LayG4RPl0wUhg+ajnhguRg5mvWq/4GmEipYeHI9Q+RL
         pUXR7Ru0WYpzxV6Ab6KrTarMMzNaPJeoSMGm1k9g7ChVFqzemrM8/3A/+R9e0vm4XnFN
         DSlh6Jv442cn3RRx7f366q5nbD5ErrPaDd0aQ2+p+NQzrIpI6XylD6ozTnVzUVgfxTTR
         6QHlxi3u2Sttn7l+OS4cR/n85VkpqW1xcco0iwCiasC37uOWXawjAHK8KQQDpOvtFy9g
         937w==
X-Forwarded-Encrypted: i=1; AKwUvBzXL4EU2JO2o/M2CSPvqXsCvrgvUcZPiG8GK2x9UFrZTTdyIwhuY+6cuIIqmM9cSXvUYVESb9F3G/LrKe4=@vger.kernel.org
X-Gm-Message-State: AFuF++m2u1HSFnZfVqcZ/o2zrd3jSvIKhCET0tSJL+hV2wochwxGtMRC
	pPguk+YV5UIgDMq6f8CTKlkrulFc8xst1bxtdJHnfrf5Ml2sYAoswtmw
X-Gm-Gg: AYBFou2xiPbEQYu5rTvBECC9XYognHZ6ULqHRZLDwT4rNfr2jPYBT4EU2HPsfMAdJP5
	cMvB/zlYq96ecM6WVoXynxi3OdjoaFqD8zje2GdlvzOkfRsexe5kAOTwmJ6uswf2GVIHoC2Z/Nb
	jMrBZkIXFhl2dmLP6FZ9GLC4PO2KlLn1VvICaKUCOHBQmGs+sY7y8vpqJI6169LoKv/dqMyCTGz
	FP2NxKEMssgDTTX1AZlpfFtIZclohYYg9wyrdj7iB1VCt81AwFPA6ZeJ5VP1FvFbGxhvNT3F2sX
	xeTM+gbv0XgCCDBgh/5cnxDl5NZoZycDCZhB9y0/e1z7R4GlNqLF0SvP5/3WEvNlZXjw0zPGcyI
	YsdQTzUl4ZiS9vNMJZxnLhoLat+UrSmg0dpxGPtPbh32S3NmBPIkNBFG6hP6nFMxo3Abioybg9L
	jZicDUwxVYG9P/LYN9ADllciKPEE0N0hM7SZaKwwHdH0Adhxx2q3NZepc4GAbwJlL9N2vvQqVu2
	nrHgaM69AywoQI=
X-Received: by 2002:a17:90b:5804:b0:398:9bd5:490f with SMTP id 98e67ed59e1d1-3989bd54c38mr22602838a91.22.1788151755928;
        Sun, 30 Aug 2026 21:49:15 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:d30::4cf:2e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm19345763a91.8.2026.08.30.21.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 21:49:15 -0700 (PDT)
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
Subject: [PATCH net-next v11 2/5] net: dsa: motorcomm: Move to subdirectory
Date: Mon, 31 Aug 2026 12:38:55 +0800
Message-ID: <20260831044818.4103477-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831044818.4103477-1-mmyangfl@gmail.com>
References: <20260831044818.4103477-1-mmyangfl@gmail.com>
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

