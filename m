Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792645833;
	b=t+uE5U2JFyPZTM11q1bV1JSWxqKPVNARw4eTcHOmJnXtX6+BOYa+icbt/cUvvKxabS/n
	 plAJkAdNDemm0TdK6MDl/unhvOSAzTpOuAu7E8z2oZzD/45P0sIGlJyox5IaYy26D8PVQ
	 5a9NPxSn8SkMCR+YuLamFDiJdUxxfb9vS8KHOeWgMnwvfZYiJyFrQzL4slbEt0xlRzMLW
	 V4o51BrC7wVIJD0dYcoUpGA6sAAfOm5csU63LMYYoj1HPlu+g8gD7AWts94nDriCNCUQJ
	 OxKzNM8H9UDjTGjYcG5cuivuB5HujpsPCjhIfQ/Usrh3CK6vzy2gOo9QMzhKgb908UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792645833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=d8YT79KohHQd4B1gwgaLu89B/DI46ezv+k6nEUESdQA=;
	b=gYxWA7Mrx29ca9WG1wczqRKtG6GHYUb2D+efnhg1uzbilSyrGSDIvmVBRbJnm2pwS80Y
	 dDvE47Jnh6wwBYL0NyZ5RB2F47t6qvIISPi8fQLbUGx44VJw/h+00s724PjGSFoSfA7CD
	 Qe3IDmDIO0uLg5SwqtxJmrSesNVhE02MIpkX2QA9CTUTZ/87GdHnjc4KuOwaCk9r4URwI
	 qMAup6qldTlEVy/mf9z7pFDlaKkjomxSvR43N/5zHZm6sAGzu9HVkI4D42vxREw+8SLnk
	 XToSUkxFusmkIZIlrM9Oyyn9v4/87ILwDIaKwRL5TjxxbvDbnshyqEW85Nw4+3Iuayg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gspN8Xft;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB207606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB207606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gspN8Xft
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ea0efd636dso10695085ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792645832; x=1793250632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8YT79KohHQd4B1gwgaLu89B/DI46ezv+k6nEUESdQA=;
        b=gspN8Xftp3Q3k5OTLrZQTRdqCMZyQBiLvK6Mt3/U5g1kLrg0bvWUSaF6kCODhEm8Fy
         bKo+kni2CMkkD9FsKX0bCO6w6haGJOqlThLUZvi2urRKymlOeRQ6T7xw1fzeUfmAqGeJ
         2r0BoQpXwuy2ysil5Z5985WdGoyz0bZNGjmJ7n569O0bfX64xIp+3SvDe+8dzcYvLk2I
         Bidy+rXewHjAcGvuX+CSOz/xtKN45cjUrxUNUUt9cInHQJcA0CRJcTZd/J3Wzh59FhM6
         vtPBTw76MNsg13wG2AgB/OI2xGkc9wLkW1mJaJOlqGqCzv3hP6VrHd/EfgSlzgDQa1lD
         Z4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792645832; x=1793250632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8YT79KohHQd4B1gwgaLu89B/DI46ezv+k6nEUESdQA=;
        b=lzABxedKm1m3pj0/sWzF5PGH0DlwB7OS76SD8bgDagoXUDd69aZha2S5x63FQhsbXl
         ugMc5wMN5/4hFTe+/H5YEEpSxsTv0DNwaDGzEHkvvT6v4aIuMDXOYFPzmBPfuDOogVrd
         tYNA9HcNeA0PFPhOOVl9K6lO6hIdIW3XmSJGqgLxnXmgCkJdAVSw5ZWprI6trI3qnknC
         x2tCYYagKZOILwAX8kA/DZ1OdKL7mX/+XXWTJ6Yzn6xHSBww3zEX4W6bnfX2GEGEO3mL
         3LBEX5x1o4Y4Ep/f0693wXJ/eBjt28RlIsZE3B+NuocrOvlhtW//D1T+B59HlCNIZ+8P
         VC9g==
X-Forwarded-Encrypted: i=1; AKwUvBwxM9R/8V7OEYFuecFF8vzqybmrx4EhPq1PNckgiO0wUJbEIAeUmfgWUbQQGEGRRCHdwqCBzMtAVEGXPU8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLFyUEpOT4sUo4QFF5P+46vEdlJ10/dW1cCpNQPczFB6jPLz1T
	VxlhWXhApoVpCunENWtNSQTnyCqK0o+peO94fM13rsjtvplBDgXz0wSo
X-Gm-Gg: AYBFou2DZNpzJxoSGiUkHCP8efpU1tP8uZZS5ChG3sknJOVSPp10Qdid1qDaJOrjiw6
	YexyR0IrSn5x6kT2r5gjkqaGFu16btHMR28ImZPtbYE9UK4BW4EDgqlNfsDFMOk0nIZ+Qo2T2Ad
	dkBXzClmIEL1qFu+00LQacUTUIiNrws2HOmeL6GlgYYnVZx+LhM0p5OaNHRqNUtfjBcaTLmF5fo
	LpsmGaeGPTx72zegtBxL1KyhqDLttbdjHHx92DKzIXyZlaQTfSnJt0cGGPJmDCcXsivVkNmQEOG
	SX7SZnWS1E3ZtNfDZpNhn5HyuPc0q0he8VYaXgXdo8qMofSD+9UHu7gAxzbWoD0FfVXwFYuXDC2
	w+ijSa5AsXNjW8p4LAtuOMwdg5M80evjHOKmdBBROLnN1fby7wbuJN6QCCgN7frU7EKiVnFbigy
	MJlhtmwf1D83dkytNSMhyGfn8mXrz/rDgheBqTa2IgbqIl9SIcmqnuLWl+c0EDvzH4OfZ1lGH+F
	LSDIGRYsIBdwIMsS/srIKnXSzzSamwLC/kw9QHB4zFYUjjJV8mDxc6XciCEXcMwLQYplzOYTm0V
	0tx7tw7oj3dDaQ==
X-Received: by 2002:a17:902:da87:b0:2e9:9846:2da7 with SMTP id d9443c01a7336-2ea437a7307mr35411635ad.5.1792645832198;
        Wed, 21 Oct 2026 22:10:32 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b486b20sm18260895ad.59.2026.10.21.22.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 22:10:31 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: glaubitz@physik.fu-berlin.de,
	dalias@libc.org
Cc: linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] sh: sh7305: add TMU0 module clock gate
Date: Wed, 21 Oct 2026 23:10:21 -0600
Message-ID: <20261022051021.322705-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Register the SH7305 TMU0 module-stop clock using MSTPCR0 bit 15.

Provide the fck clock lookup for the sh-tmu.0 platform device.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 arch/sh/kernel/cpu/clock-cpg.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/sh/kernel/cpu/clock-cpg.c b/arch/sh/kernel/cpu/clock-cpg.c
index 5b75a384cbf3..5a1f1479416b 100644
--- a/arch/sh/kernel/cpu/clock-cpg.c
+++ b/arch/sh/kernel/cpu/clock-cpg.c
@@ -16,6 +16,20 @@ static struct clk peripheral_clk = {
 	.flags		= CLK_ENABLE_ON_INIT,
 };
 
+#ifdef CONFIG_CPU_SUBTYPE_SH7305
+/*
+ * SH7305 TMU0 module clock.
+ *
+ * MSTPCR0 bit 15 gates the peripheral clock to TMU0.
+ * Early platform initialization enables the gate before timer setup.
+ */
+static struct clk sh7305_tmu0_clk =
+	SH_CLK_MSTP32(&peripheral_clk, 0xa4150030, 15, 0);
+
+static struct clk_lookup sh7305_tmu0_lookup =
+	CLKDEV_ICK_ID("fck", "sh-tmu.0", &sh7305_tmu0_clk);
+#endif
+
 static struct clk bus_clk = {
 	.parent		= &master_clk,
 	.flags		= CLK_ENABLE_ON_INIT,
@@ -58,7 +72,15 @@ int __init __deprecated cpg_clk_init(void)
 	clkdev_add_table(lookups, ARRAY_SIZE(lookups));
 
 	clk_add_alias("fck", "sh-tmu-sh3.0", "peripheral_clk", NULL);
+#ifdef CONFIG_CPU_SUBTYPE_SH7305
+	if (!ret) {
+		ret = sh_clk_mstp_register(&sh7305_tmu0_clk, 1);
+		if (!ret)
+			clkdev_add(&sh7305_tmu0_lookup);
+	}
+#else
 	clk_add_alias("fck", "sh-tmu.0", "peripheral_clk", NULL);
+#endif
 	clk_add_alias("fck", "sh-tmu.1", "peripheral_clk", NULL);
 	clk_add_alias("fck", "sh-tmu.2", "peripheral_clk", NULL);
 	clk_add_alias("fck", "sh-mtu2", "peripheral_clk", NULL);
-- 
2.56.0

