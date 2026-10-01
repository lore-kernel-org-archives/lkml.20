Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948284B7A2D;
	Thu,  1 Oct 2026 08:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842972; cv=none; b=tDj7uzhX0zUSLzf3dKqcU2z907wZGrSxJ1b73RqMc+rlhhQ8VA4cDdoroQZ9QA4ktOC1KnYRZ+7OOq9DVvMTvIAdnnkXoDRZi916OW3U81x7VvNGw2ozXw34/WV+D8N5PZgKF+4SNvgcUenuHZRla5btXmX5teri18d4Re7HtPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842972; c=relaxed/simple;
	bh=uXeZbqHCfqk3Kawl7nHNeW4a/zKZ/FRcBsKCjIooIvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7Gavr7Qv7OzUImhtsTuRBnnZ23IQjBFPFuDRXic8iFUSgCgCCkxUzOgAl9TbEvM+qNITIBSLCpPTqpu7GjO5Tnh7ajnBLZscYf5iMmkqe0jiOQhnk2GgDjTAhJu1kz7CtIIr3q1GJDG8ME5BsokPQIvg+A0sXA0ZkIC6OwBw/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xyFO6Tdw; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xyFO6Tdw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 89FE64E410F2;
	Thu,  1 Oct 2026 08:22:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E43660341;
	Thu,  1 Oct 2026 08:22:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A26E3103290CF;
	Thu,  1 Oct 2026 10:22:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790842962; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=j8Zm1Gw7X8shc78C8M+QfrsBCyZ47FvZQ+SAp7oibzk=;
	b=xyFO6TdwZokV5k1pi+RBrXD524Dht7W8c3uxARBpOCRYKVHtZP2A2XOtnClbFLW7zvCFd7
	BGMrjXpFN7/zp8v6kTcBQGL0L3/2WNYR5dKzP5L8Thw5YXdOh2qmh2D52SZDpezmwIZPE5
	xr3w3TsZF314hLQe7HrpDldZaoYXoYcYk6CmobK9nfQxkNjhlkZwmzIQGVhhseKe3g3buB
	E4l9A9+HAgZc2rZ9fQoL/C6uftR+eSSppIV9A0mqHkLh2K3V/56TEkeJvVaNqseEQwAZ5V
	yOI7/dJUke4XZvBDmqRtZnJyRYW1ZgMJPuiFRVRHN6BdZitMXIbeJAWoMf0qGQ==
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
Subject: [PATCH v7 4/4] MAINTAINERS: Add the Renesas RZ/N1 timers driver entry
Date: Thu,  1 Oct 2026 10:22:24 +0200
Message-ID: <20261001082225.125956-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001082225.125956-1-herve.codina@bootlin.com>
References: <20261001082225.125956-1-herve.codina@bootlin.com>
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

