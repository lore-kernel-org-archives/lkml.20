Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACC751DAE4
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679052; cv=none; b=T8twZuiIfAozY4YMEUYwHPIL9UYJE1SCaGvDRv3hiiY1gCXBUuaDhip1SjhcmzNPjLAUg37lLy1D2Uisp6bauWeknoVUVEZG+SdaMPwF+pl5QQ3BbENyciJ+o+DkHGMQMEEPzgj/tivjtrn0j7A1RXfc1z3xOObjPAN+ykJV4Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679052; c=relaxed/simple;
	bh=yEBiC89OR3qXvDQDCPsvt3vnd76aREcYsfSAe/oYJqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gwftRy9vxsr3t/GfKbZxJ5rIr3eFKOL5UJb6AtH54fdghlfmW1SwEI/BKVYZmdyTmQ09hz2kVJdbdF/gud4RUCMXmBKrGK1kvzRRjkKiT3Qzix113P83VOxz1Y2BaHDFvGFGqBmqvyj2ypKpIrCCfs/Shav3gqJ/bL3SQJTi8Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmBgauqP; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmBgauqP"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so25404265e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679039; x=1791283839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I9o2g8NAo8BLROcpDMeEoV80HGh5uA5p5XCke07A0uI=;
        b=MmBgauqPf5DoL3EuA5ugwMqKxCx9+fnMEX/8c11Dv8Q4OTrqhN7gn2Q5S0jVVn1KX1
         vYIJk8yTXv3WnHSprzu44vY4OgxL2d/aknXRa7wMXDGk3xCF022CYNGFW+C5OiIT3pmL
         VqHMLsUiwrcmkU6RvzYiyN3o36m6JLmDdbRKsfG3ewbZpve6+lTt22yhMbmVk1DIA0fw
         HJFs4UahZUbrzWkdZEyKW3jilheo13RfuD5dfC0eqIDTnLbLTU6eWRqFNf7LdeMMV9Cf
         qLxHzaL3aISxb8zhb8xDfESA90U0hQ/gYrXY9IaUXMN2xSWy9vpc9kj7Rill/IwTWxNZ
         hYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679039; x=1791283839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I9o2g8NAo8BLROcpDMeEoV80HGh5uA5p5XCke07A0uI=;
        b=PdSQWbme705ommFYBU/6lDe9ONZc0t/FDM43q60FEQKyhRnDbSWQTMDvcQN04QCOv4
         91zUWYJo+HUz2dljGjjaC1ZxaH5spV2DqU16/k8n6RpCgmUbJNReUdfbPIZ8NM8/h8TN
         8IIIc527VmFlr+XHBR/lPrObvXbRT9QOyNXvX1ytdxFfX5GOvPrQ9acKFzTHCWDT/h2a
         LdZvQTEPmUqGoKEyPxoYZRx1TtcxbHemWMExRyIFj//23C/ahsGOjy2dSlmlhAl6FBEC
         iaFsZrgC9BnxnyAFlqWYtewuDeGL56YQzzqYBZObPUZ4tc3CaUWxx+/8pUv4vhgPsf1T
         00tw==
X-Forwarded-Encrypted: i=1; AKwUvBxwXnqUtU6ZwOy3f1cPH9MAO8CfYY+57hdy8m/dxpHb5Nk81it9j9vGgzpI5iSeYrLN2Qe141anmksqd68=@vger.kernel.org
X-Gm-Message-State: AFuF++l/j1RdhRi62wxwqtPQZswNeoL6ovbZfdocalkAOo2bxX+DO9vL
	4kTZ7cvyGGtJOKpBV1MWG4n45i6py1NL/iMh8AdTYc8eUZwuzIIIBIh/
X-Gm-Gg: AYBFou1966+Jz3267DDsGdiSbsKMcGWrt1FlOEaWr4Ho1B7ACfTBpnaEt4MY3nfznPS
	REWhahshm7nORb5U7fJfW8rHBz96Pp7wEeopVUqhem5793E4SckMjMFhWDylAAc6soNwWLCmLBm
	e8V2//9IrOOdinLLM8ui+g8a/0PMcd5JJY3vpjlg2HE92pmTuZcqacAAOR1QSi8SoWb1kFm6gmX
	vd/tR+TYSeoByhSDW98dtY7lV7fCdzvzFjgey8Fse2aeCs/1CEpfLnmckCw7Rj1cDDx49gXmz2N
	KkcnAVkIEiL6Wclx2ykXzovYD2K42633q2I/r0naBA1KQGSKdMg4NZ/RHAOjkZgL4ho2uz2I8di
	Ve7YRptOhBlO+kEQ0DJZSq7i6PTh++iZxCJbNxZzqT6OT95ImJnMZi/1FSWGpnqqc+G61d749mU
	JIHQw2rXfl0k0wEqEIO4QYHn3F+1VXudLB63EbRqV5GGR2C/SHlLeE0OANMu6IkJ8yd/NJPwBlZ
	AilSyqIZy68aYZJIdypYQlZHzzfxxHRIh6Pvre9ZneNp28blV8Sc2rwdrJkwy/Vvcd6FU6cGBuA
	6Q6146mWj9SH3sBvNFjRe/khWSSk
X-Received: by 2002:a05:600c:6291:b0:49f:ffed:2cb with SMTP id 5b1f17b1804b1-49fffed033bmr120811245e9.6.1790679039014;
        Tue, 29 Sep 2026 03:50:39 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:38 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 4/8] watchdog: rzv2h: Drop WDTRCR_RSTIRQS define
Date: Tue, 29 Sep 2026 11:50:17 +0100
Message-ID: <20260929105021.542730-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

WDTRCR_RSTIRQS is unused, so drop it.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6->v7:
- No change

v5->v6:
- No change

v4->v5:
- No change

v2->v3:
- Updated commit message to reflect the change in v3.
---
 drivers/watchdog/rzv2h_wdt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 55ac11fcfcab..17c9e9a24ce2 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -40,8 +40,6 @@
 #define WDTCR_RPSS_25		0x00
 #define WDTCR_RPSS_100		0x3000
 
-#define WDTRCR_RSTIRQS		BIT(7)
-
 #define WDTDCR_WDTSTOPCTRL	BIT(0)
 
 #define WDT_DEFAULT_TIMEOUT	60U
-- 
2.55.0

