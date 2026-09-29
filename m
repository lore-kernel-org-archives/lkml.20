Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A264DA9D4;
	Tue, 29 Sep 2026 08:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671874; cv=none; b=qDEz026D308053qxdtzD8kuK1CiemHswMuvP4wF2Kt4Noai5IcNr79PNeTdZlYJwsrb4b+cec2kFg3BzXUlDGACs2JsDTpCskCLovPxF9gscVBKFAel4Pq6jGL3LJgG1tK463zRlkJi8DIgMDfUHS6Aij3l5JLIYyL5MAczrm1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671874; c=relaxed/simple;
	bh=uXeZbqHCfqk3Kawl7nHNeW4a/zKZ/FRcBsKCjIooIvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txtN8szTFdN/+DQCplxTn7JKqENuHjPFgTIuM7iFBOw6HHfhG6B0bqioH3OKBvyiaQ2uzFyFy2SP7F2WdLt++dhBkqLfWCcdJECP6085bu+UnWCRP5fucyyiNaH7knOc5e8oT81SfOCij58EOmG27uMGJJciS6zsy14V7SlW3ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BluyGGtE; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BluyGGtE"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A2B941A1055;
	Tue, 29 Sep 2026 08:51:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 775C8601BD;
	Tue, 29 Sep 2026 08:51:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86F9A103297B2;
	Tue, 29 Sep 2026 10:50:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790671861; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=j8Zm1Gw7X8shc78C8M+QfrsBCyZ47FvZQ+SAp7oibzk=;
	b=BluyGGtE8S172Kz+fnhLPbE0TAC24C0+XTUnlIh0SsoKd5EzcyrRiymTPzPzeMRAPLc51x
	jZmC6cxMQcYCkv3mzvMGiDEk1N9CuZJ/wGlmxyVBvflW79uFvrzNRIE0ALAOQ9pVADxwzh
	xQEe2ZeX4tQ63EhO6R+1GJI3g1FsF6PrzV4c1FSu2s9CQyQMRbEn6pADW9bO8Q1eXdcXFz
	fC+BKUD1f39mdWuU5xEko8gYpA47yoMCcEwVhwJqROxTGN2ac8VUbhT9SwaByChym3+Npk
	04ce7T+wdcis6YeAW6+mGukoj2DQMfB7crzvnVww1Klf9ncuJ2dLurpwlOosog==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v6 4/4] MAINTAINERS: Add the Renesas RZ/N1 timers driver entry
Date: Tue, 29 Sep 2026 10:50:34 +0200
Message-ID: <20260929085035.57609-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929085035.57609-1-herve.codina@bootlin.com>
References: <20260929085035.57609-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

After contributing the driver, add myself as the maintainer for the
Renesas RZ/N1 timers driver.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..91b014d27577 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23296,6 +23296,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
 F:	drivers/rtc/rtc-rzn1.c
 
+RENESAS RZ/N1 TIMERS DRIVER
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	linux-renesas-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
+F:	drivers/clocksource/timer-rzn1.c
+
 RENESAS RZ/N1 USBF CONTROLLER DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 L:	linux-renesas-soc@vger.kernel.org
-- 
2.55.0

