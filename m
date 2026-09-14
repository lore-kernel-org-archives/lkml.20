Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F61B3BF692;
	Mon, 14 Sep 2026 19:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789412996; cv=none; b=Ldkr541oOT7SGHYo93VBVeYmAn2aDQ23v4HnIhbyg8OwiqktZY9xLzaKp8iuKYMjqD4OhU8vWY7h/1epLp0MkO8UTDeXHJi0kqNZZ64GHegSz4WB8myrA5YlnAx0IUuV6c8zTw3zEv9cAcHNHDtQG0Gdpfm3mvXC0GCUZphRERw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789412996; c=relaxed/simple;
	bh=ilhcrrbkoD+y5ilFXyxZq/zVIiNHDb2A3KS7veRwKF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W/UM+nkmW0iMnOcL2UjJXOJfHAyiviJH7mbk1mD/v18YGBJ4m2as8ePT1QxaWysPuZcCFnWuWFzYaOVXbZcRZkT7JK75JeR2nVP/D6einCM826pHeJX8Iu1fMinH+0FMO9aJJURrQDOnOQuepyiJsjtpJO8Nx7LwczEmvYXwt7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=ZJUGydrf; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="ZJUGydrf"
Received: from francesco-nb.. (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id B3A7B1FEC8;
	Mon, 14 Sep 2026 21:09:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789412988;
	bh=xw4Zn5sAcKJHfUdsW1zQZWmiQHFKoBhORxaaC10bj7s=; h=From:To:Subject;
	b=ZJUGydrfXRN9ToFrPaMpWORs7i4sGLoq8pTTzcWVitqH484E1bPgXbCgW7xQSMtzV
	 RX+jS1+9zTva+dFiVH7gAHVER1KWRYZYn+hsj/AqvWW0TA64ZUvG5WZsZL4tuVIcf1
	 vzz7Tbn6HDE1aGNa3LlqJw+EVG68RLD4JKwW6lVK+Km4TRn0XK18vsiDEuKAABUXnJ
	 1aC1feO6XJ50aQ34rIYXBAAWvZlV6W8fdDZxclwe1Sn4oBtpfJkLYZvhwzgsue7GcH
	 ODfixdT8YmYIX4bJsXvxy3UBqMZ3tTzAiknaIDA+EvJgZ0px1LjAcOtusdtgaQpfQb
	 r7W1ar24BUQQg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: ti: k3-am62-verdin: fix main_gpio0/main_gpio1 line names size
Date: Mon, 14 Sep 2026 21:09:42 +0200
Message-ID: <20260914190943.50843-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

gpio-line-names sized main_gpio0/main_gpio1 for 87/88 lines, the SoC's
ti,ngpio values before they were corrected to 92/52 in commit
28c8f2189d80 ("arm64: dts: ti: k3-am62-main: Fix GPIO numbers in DT"),
four months before this file was written. Resize both arrays to match,
keeping every existing label at its original index.

Fixes: 316b80246b16 ("arm64: dts: ti: add verdin am62")
Assisted-by: LLM
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi | 41 +++-------------------
 1 file changed, 5 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
index 895b1b7dcac7..042124828095 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin.dtsi
@@ -1012,6 +1012,11 @@ &main_gpio0 {
 		"",
 		"",
 		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 90 */
 		"";
 };
 
@@ -1068,42 +1073,6 @@ &main_gpio1 {
 		"",
 		"SODIMM_17",
 		"SODIMM_155", /* 50 */
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"", /* 60 */
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"", /* 70 */
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
-		"", /* 80 */
-		"",
-		"",
-		"",
-		"",
-		"",
-		"",
 		"";
 };
 
-- 
2.47.3

