Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A923D473C8D;
	Fri, 28 Aug 2026 15:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929381; cv=none; b=HrQrdETloKIOLhOTmVotlhMpKw/r1g/NWXl23psg1sVp5IPmbLJODJzWB6yPd96wlvA8nSHsuN/48Tc+juAKSemWuNSfsNasi7hp9nuwGJpzv8scMAzcMUOYhN0ZAcYHYzZZFaqkAXnndDFqOgd5WjTiy3ZKdyB9sp3OhyV1SnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929381; c=relaxed/simple;
	bh=pPd71boekzlOV+TiAgtygYBSMvFo1+2AvRt5SN8IUVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oAylnTJDg0SzYSXN5lJqOsQaw1Fz8FIcnAID7cylFA5exYMgZxGwvYAgVaVbGcmm7VaY954yCVfmyUsRPlZn+Wv/QEIQ+PE2H/GM9bRwLBf5YZu4EYDzitlFsvvR/+dATDLxm9WegGT167t86NG3xumWpVy2TGJFIASbb56CBCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=WNouB8/j; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="WNouB8/j"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 67D8011D0C1;
	Fri, 28 Aug 2026 17:02:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929374; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=LTEdDyfLi50RcqOJ5Ow1a7iI5UClcwAXlnII6KKqFeM=;
	b=WNouB8/jtDywFxFLH/yr9Y5x3ed1Ij005Y8mBplKmyvAgaWi8t12CDnVJM42HHMnh8LHk2
	qDRwZJtm9HKSuVj/V00zLxh4fNMUSbaFSwE6FZpgEqrnqft5BUJ3EW/kMjd9iGh6Rdu2W0
	PYoCrWRpubFYtZ+38fo6U++fdWzbjcbfpO5Af42tMA996DG1YfSeG9FCrqrjdIuMIybtxk
	uDt5J/yGgBTFlKsDSgof/6LyVXlGqjrv3y6+HvuoZ2yk81DKOiDBvKGCSeMB2wgVsmK0sj
	5p1PY0yvli7QtMLVNqSs89cUBfIVy3i8iZsM65ybDUbKhKaZoxZIpEVNtxsQHQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/3] ARM: dts: stm32: Use STM32MP13xx compatible string for EHCI USB controller
Date: Fri, 28 Aug 2026 17:02:26 +0200
Message-ID: <20260828150245.173147-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828150245.173147-1-marex@nabladev.com>
References: <20260828150245.173147-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Use accurate STM32MP13xx compatible string for EHCI USB controller in
addition to "generic-ehci" fallback compatible string. This is future
proof, and drivers can match on the accurate compatible string in case
they need to discern this controller from the generic-ehci one.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index d1c5afb5f89aa..ae45c2023afeb 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1137,7 +1137,7 @@ usbh_ohci: usb@5800c000 {
 		};
 
 		usbh_ehci: usb@5800d000 {
-			compatible = "generic-ehci";
+			compatible = "st,stm32mp13-ehci", "generic-ehci";
 			reg = <0x5800d000 0x1000>;
 			clocks = <&usbphyc>, <&rcc USBH>;
 			resets = <&rcc USBH_R>;
-- 
2.53.0

