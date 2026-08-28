Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC612473C8D;
	Fri, 28 Aug 2026 15:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929386; cv=none; b=fIvLUFmmmdk8dq+91poaRY+7Oe1nGlPEpQj6z6DxKaQoCuOhSijNzKDOc0JI/qPMZBARPztQ0VXPgu+8srsBmBi7JduqviuVJB40avHF+oJRqdqXznkWL7b1/NAiUt0kLdwyPQOFMttfhbHGJaGzMrOa93wBwKYwWLeWV6NCo34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929386; c=relaxed/simple;
	bh=dD7v0LxpkwEjEBRoWwF/dRB4J/m/DUpwXmzy21YXGmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MuVJNnfrHE3KojefKT/EaV62IgxC4sptq0lImXBsIbHq3Siv4ZwoeMv7Z5TTBGS1cBb7TPNpyC14FwS6VJ7Anm2v0MwMjGx6JKjlqbIu2FTnl7QMZPz3ZZ6hdl7n5lfiYqZM8A5EfcOgyGmQcCtHX7vFUrsRHFVYxfYQBYjeDX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=hapBCuzs; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="hapBCuzs"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5281A11D0D8;
	Fri, 28 Aug 2026 17:02:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929378; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=SbsrzeaCPJpez2qjsuDWtyobx8VZOtDXHhuYAqGuZJY=;
	b=hapBCuzsBlPbZYDNF/3DLRbv3iw++fiOFWVZdLPHbnuoDCmeAL+F+iJvh+8F3CG8kvIRel
	ukZOo/m/KPhG+kTp89svsIfsmBRxmVf+hBLMgTnYNQCOcrYY+8yCo8MvD2Tk9YjMy6K46a
	0tlQwhgJ6JBgGkzmCvqQhjKv1iHXhhtDjk0ucXg1gNUcqjNVruf1/QLqOCtHvEi9z8sjKK
	LOFKNQCFvX0TmtyIN9gDLCZo+j4Uf7M8KqxNV6tE+i/kRZWa3GR0YdMDJd5mdbfL5vwsYs
	tJAMpthhJ0HG+RPDjZMxyg205Q7zSjQNqVW5ZDUDdUKPSHp5u2Rd4jjRka8adw==
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
Subject: [PATCH 3/3] ARM: dts: stm32: Use STM32MP15xx compatible string for EHCI USB controller
Date: Fri, 28 Aug 2026 17:02:27 +0200
Message-ID: <20260828150245.173147-3-marex@nabladev.com>
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

Use accurate STM32MP15xx compatible string for EHCI USB controller in
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
 arch/arm/boot/dts/st/stm32mp151.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index c37005c00ad65..ae31883732388 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -515,7 +515,7 @@ usbh_ohci: usb@5800c000 {
 		};
 
 		usbh_ehci: usb@5800d000 {
-			compatible = "generic-ehci";
+			compatible = "st,stm32mp15-ehci", "generic-ehci";
 			reg = <0x5800d000 0x1000>;
 			clocks = <&usbphyc>, <&rcc USBH>;
 			resets = <&rcc USBH_R>;
-- 
2.53.0

