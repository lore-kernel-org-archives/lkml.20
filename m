Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794699754;
	b=XCvTdvKYEmk95RzayA6G1YDHxLGeeujyE/HZzRroB4uS/OYnUSw/Jr7uNn9q+heoPqNE
	 Xsw2AIAGS0w1U7e1XDTami6U++Cj0PVJ7rilX0df6HqQ9IdebpkaEL4/iwtYMcdpdRLsi
	 h8/PlDRAvVdqLEB6pD7iAUVbJOnmpe1ejeW6oy3bO1MQNBJ4xvHshzJUNA/XEwCS6Foy3
	 33QK1Oc1ZQW+i/573+u+OE7Cl6GsXKcMmNumH4ujb+IcsVtuJ9QV6qzeMGhlz3sguFxYD
	 VI7uzQL97TQVRl2fUB0FgbAs4vaXHwqWF+f9yJpQqiQQTpuoUVIwFOze3mrPbbertDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794699754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h02M7ZRT82vo2QN0ZQk0R2AefSd/VQlgbNcmA/89Arw=;
	b=AaKsg/NMmBhS2HicF7+RASsxWdaUgZqyyz2m/oAWMF7kQP1zYWLdw+x52GnavcxAHCX1
	 SDMCzXIDojFHhDEVqRcVhMJTeGDbqc9IDBJjz/0c4IauVxRmriOIlCLyY7a1ZxEMVKkaB
	 62uDfKYA8meUQn/5HNX7d3WAJ7cQJNpIlgO9llqKyMTiV3JxUZ8fUMHygbi8YSV7gFU0+
	 SJcqAXgVi5M8An6WKt6nDJ9pipHp84FTEr3lQbLYgN1mXoTBcGrqPhGDA7Vz2+UZIGw+3
	 xHn9m383D+laR6rQb/bichaC3jWhY6iv9FrWq2Hxl8ZUAc2DYYaiGz+lMr9zSZ4i92w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzmXYQR1;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBB1606A886
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DBB1606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PzmXYQR1
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8b6b22be970so737461b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794699754; x=1795304554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h02M7ZRT82vo2QN0ZQk0R2AefSd/VQlgbNcmA/89Arw=;
        b=PzmXYQR15cCChYYvbHvZmRtbxA+Vazpm1dPjD1puEWhx0NHS5zVYdgFvLCRrTrbMVu
         AbiPDGFXmUGW4rbpcSXBWDfd8I651GINKhQKGtP3z2j/DEVxNHkttCAoOCRIznTya9Ta
         tLj9nHU+bxyuLbuzU9kk8koKm7BgijjngQLYTr+A0yP2mGjXl8d3Cv9wFOWn9lUvS0PR
         iy5QRJ+VhwVrcvMN8wOo6s4y30qiALwZesI2H2UmSDC8wdet4p2Vo3BNUFtXMzhRLocr
         TkwxisJZcvi/ws25jc/IbIhPqlHaciw358MQKaPrD/0kWpl3RijFo0B0IMpRItR3rcSw
         kazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794699754; x=1795304554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h02M7ZRT82vo2QN0ZQk0R2AefSd/VQlgbNcmA/89Arw=;
        b=SuDLfp5LGu+Xb+cdNuCDtUJyBeRTCfFO6+ynEkzs+l/4yYTnGOMMCiDaJIpAKE8jrh
         OutnjhkPH8UrJNYy85J/AOy78EihWoQnfAdEP+5W446zSqhHCcAa6fOugJDgoNpts5Ar
         6map82DfeSWo4Bj0lw6qhD5e44rCRO84rGOtavNR5wEEAwgm0/zuKFtyqtLf5fnW4jdB
         sY53BpDeEkVNOpA+WCUoUiXcKQnvRC2G29XIKFyLLtu/YILHW40kp4uY742lyVDFraac
         oIxJ4l/nk8Kj2VrzlrZUdCoRfPMSKHF8eAw+nYVyamMDtJv+vqJ3gHmfG/bLkXA99X67
         l8OA==
X-Gm-Message-State: APuU4Z94lTzytPPWk60uKgl0oUgUKIXQug5PKZBaQUL143PXxiPsZno7
	4QBh+6BAHtDyHcA3HthJvYRuCeCyj23A/RKPo3UFZr7xcW4DEQMw7u6I
X-Gm-Gg: AYBFou0pheoI2dZIMnanGDMDoHMgnkvaW9PHtw0JhU4NJ689iKwcGIggr8cVlCmKHwf
	c3w/HfKqFKM28tup/v2LwPjpzVDLG1j8EyscEjfoJ7IqaGdgsiDfPS6WIImbH3e6jCgwYcJ2lxr
	8ZJqfNXEhiE+gROsnAXWtQAYFjTDWygWODXZB+2Ca9xiCQMAc2wC5uaKGMJNvOtCTRGeAQXSYG1
	ptP8U2FrHR0cedNaLE3eh+/V69/o49F8yPYpwXDyb6p+dPQLszFjq9paZqGk32bbP3PK5ztD95q
	lueNmBMfBg5u56FvbP5mpsDAhdmnheanJvA+T1y9ZiB2W6N1BYuFy1I1PkOG25kcaM9UYY3ITA7
	12I3uQYj4NjRI3wsLfSBY+TiSC8095VFqtgJwIcO3gVTkaOe3ahtkwOAuN82JQgbe+7sR/kDhtL
	7H+PRi+XxrtF4QjqSx6YJ9LljYuPiirKMPnL9+FpErVZDAZF/zuhc0/WrapLG9PkeVrq2WWPNdU
	5XSeLYSKBcpIKnSDFRDRru2wQd5jgW8j4SU6a2qAZlf+ayDe9tktP3tRn/05HP6JbQ+cO2wxP1q
	sT+Lwq1I6X5fTb54U2lIt8a0/y1VModqpcIM+WUxJxoJe9busHEE43ysfiDwVtcG4m7fFcn/TKh
	VEU7OZSqJEgqiOlJPsO+p9WrxI8TGlSnWltTOhFAQAUyiSVTjA5x2wKKygJfKPpIKBnw6Cm8D0e
	O0mg==
X-Received: by 2002:a17:90b:3c4e:b0:3b1:8380:a9a0 with SMTP id 98e67ed59e1d1-3b1b0b67c8amr6550886a91.46.1794699753758;
        Sat, 14 Nov 2026 15:42:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm15755574a91.7.2026.11.14.15.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:42:32 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alban Bedel <albeu@free.fr>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/7] MIPS: ath79: apply the QCA956x timer workaround in setup
Date: Sat, 14 Nov 2026 15:42:16 -0800
Message-ID: <20261114234222.88337-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114234222.88337-1-rosenp@gmail.com>
References: <20261114234222.88337-1-rosenp@gmail.com>
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

qca956x_clocks_init() enables the MIPS timer interrupt in the misc
interrupt controller, which QCA956x needs before the clocks are set
up, or there are no jiffies. That has nothing to do with the clocks,
and it ties the clock code to ath79_reset_base.

Do it in plat_time_init() right before of_clk_init() instead, which
runs the clock setup. The order is the same. TP9343 boards use the
QCA956x PLL and took this path too, so check for both.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ath79/clock.c | 10 ----------
 arch/mips/ath79/setup.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/mips/ath79/clock.c b/arch/mips/ath79/clock.c
index 050f6553f398..8c5eaa4ab6e0 100644
--- a/arch/mips/ath79/clock.c
+++ b/arch/mips/ath79/clock.c
@@ -523,16 +523,6 @@ static void __init qca956x_clocks_init(void __iomem *pll_base)
 	u32 cpu_pll, ddr_pll;
 	u32 bootstrap;
 
-	/*
-	 * QCA956x timer init workaround has to be applied right before setting
-	 * up the clock. Else, there will be no jiffies
-	 */
-	u32 misc;
-
-	misc = ath79_reset_rr(AR71XX_RESET_REG_MISC_INT_ENABLE);
-	misc |= MISC_INT_MIPS_SI_TIMERINT_MASK;
-	ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
-
 	bootstrap = ath79_reset_rr(QCA956X_RESET_REG_BOOTSTRAP);
 	if (bootstrap &	QCA956X_BOOTSTRAP_REF_CLK_40)
 		ref_rate = 40 * 1000 * 1000;
diff --git a/arch/mips/ath79/setup.c b/arch/mips/ath79/setup.c
index 4e18cdcf65a0..d9e1cc77ad04 100644
--- a/arch/mips/ath79/setup.c
+++ b/arch/mips/ath79/setup.c
@@ -241,6 +241,19 @@ void __init plat_time_init(void)
 	struct clk *clk;
 	unsigned long cpu_clk_rate;
 
+	/*
+	 * QCA956x needs the MIPS timer interrupt enabled in the misc
+	 * interrupt controller before the clocks are set up, or there are
+	 * no jiffies.
+	 */
+	if (soc_is_qca956x() || soc_is_tp9343()) {
+		u32 misc;
+
+		misc = ath79_reset_rr(AR71XX_RESET_REG_MISC_INT_ENABLE);
+		misc |= MISC_INT_MIPS_SI_TIMERINT_MASK;
+		ath79_reset_wr(AR71XX_RESET_REG_MISC_INT_ENABLE, misc);
+	}
+
 	of_clk_init(NULL);
 
 	np = of_get_cpu_node(0, NULL);
-- 
2.56.1

