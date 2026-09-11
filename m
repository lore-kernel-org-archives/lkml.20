Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA5536B924;
	Fri, 11 Sep 2026 15:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139138; cv=none; b=ZWLK8290gxKOTbzlIVtf6sysy1qOOmski4riwJZe9sILji2EJh3gOrlQMqPoz9uSCcV//RBaxvFtqqYhCittCTbaIZwm96wPI+0/KfYUqDzSYi0f4nfqGumwF9NgWUNyPkdQ1itI3Lb9FtySCKITfAqoOp658HuAS5WJMCgdt/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139138; c=relaxed/simple;
	bh=uXeZbqHCfqk3Kawl7nHNeW4a/zKZ/FRcBsKCjIooIvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sp7huwP/S7QF7jYTj3dmFTb3v5WH8y+rANC/6k7m7tPryjwfF3di4eAPoLlen4xvwTR3jDTLn85sI/+xv60y9+APJJ+ZUxqGn+4ZrbvMFRLTQiDa/pUUbGfJvSqQ1a+9lMxhu+TpuN+lnyNs0B4beo8lBqn8s2F3a56/OtLvuAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=sOJ2/2H5; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="sOJ2/2H5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 99593C63A0C;
	Fri, 11 Sep 2026 15:06:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8758601DE;
	Fri, 11 Sep 2026 15:05:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2A1811C7AFAD;
	Fri, 11 Sep 2026 17:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789139130; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=j8Zm1Gw7X8shc78C8M+QfrsBCyZ47FvZQ+SAp7oibzk=;
	b=sOJ2/2H5vc98Bqopjj70kIEWlVGmVOU4q4qZe5GEVeJQTGbacH2Q2Y5sa/UTo2hGoiRVhv
	tuLAtTQDDkcZP/Sn7iP4jSZK0diJvrWYKE2yIj0LBLHTu1Tk8kS8/p2oW+DTBXZREZh79g
	gGNONM5VrvbvMyz8mTgf9370Dvc+AP84M8K60es46S0QG4BXb9JmvYutn93Ax8QOuiIXpL
	kARuc/i8O8d3shEYQnoj43jpprikbcDQCTQychEJO801golR/7OOnN+HkieDToLYvL+VY3
	O3qBGpNF52CCCnTkSDqQKu4MBVaqo3DuqBqes0uxpfmQpwu3px1HDv1XfSj2+A==
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
Subject: [PATCH v5 4/4] MAINTAINERS: Add the Renesas RZ/N1 timers driver entry
Date: Fri, 11 Sep 2026 17:04:55 +0200
Message-ID: <20260911150456.893761-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911150456.893761-1-herve.codina@bootlin.com>
References: <20260911150456.893761-1-herve.codina@bootlin.com>
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

