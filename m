Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC074322C88
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 11:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791113089; cv=none; b=pnVxNJvII7p7LsvOP2XqX/JiizkkTjqZgrowm9dDdnZgMQWXeH27cR2NN3VDdOJJCssl3csw3AGuMnmGKdQ6HbnaDeSM+jNF3nem3oqS9psLJzHMPa6CWVXEUUr5Z2psgzc15MhqYXjNSCCSoHes4gsMdUDB+sPfCtul+N7vrok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791113089; c=relaxed/simple;
	bh=G6a4L0DuKqgO2Xk/4BihAgScDpyjIdpZ+p83hQUV6Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BIiPmE1GBbC+CcXap79Wj75jSWAKr6Q9PwvdCyMRkjRPzROpzXf6IuCZppAGla28BFrdc4Kc2T+Em9nA+qcRmQZUJYZZ/L4ZNZPfnaU2NX+KiftOq+thBnC17+BJFejSVRCMPf9AtCTaj1mGWTPWWKuegtmc7ZBfjRQKgI3IJhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=JZuOzBjU; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="JZuOzBjU"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id D2B9D240104
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:24:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1791113073;
	bh=eh6oGqLnV3p2vYbKzJgOkd1E+lStsY6pYpuQQzA/zB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=JZuOzBjUqBcis65fZbaB0VEExATJ4s0dTYjk3/nRZVkD/s8R9ydD0sfqjcmR390w2
	 H6jS2oJ5SgMTHsmKu2wL9l4DhYzi9QG0ezCFfImD6Ad5c7b35wM7Z3M1RcdBh73MX8
	 2SykB5isOyOilQeOmgMD6F9Jmi/txUOLq5i855b5Dwj7JWWJ1HLlBrBIlJEcBCOwTO
	 Uwh/z/Yep9DGK5LrkbWzUL5Kz/KDFshB2R3RQSDqXOg/+yJuBJna3wxINuJNEgol3l
	 RfasOWrR92f6xmDNQswBihDOJrKRejPV1cGB72Fb8vznEXnzcqvUdH9TCq9GBJWGxj
	 /sVLbeM+2ycmg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hyKt75yByz9rxG;
	Sun,  4 Oct 2026 13:24:31 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH] arm64: dts: st: mark main supplies always-on on stm32mp257f-dk
Date: Sun, 04 Oct 2026 11:24:33 +0000
Message-ID: <20261004112421.47158-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vddcore, v1v8 and v3v3 regulators have no consumer in Linux, so
the regulator core disables them 30 seconds after boot. They supply
the SoC digital logic, the SoC 1.8 V analog domain and the 3.3 V board
peripherals, and must stay on while Linux runs.

Mark them always-on.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
index a8f18508db3e..7a837e6fd578 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-dk.dts
@@ -310,14 +310,17 @@ scmi_vddio1: regulator@0 {
 	scmi_vddcore: regulator@11 {
 		reg = <VOLTD_SCMI_STPMIC2_BUCK2>;
 		regulator-name = "vddcore";
+		regulator-always-on;
 	};
 	scmi_v1v8: regulator@14 {
 		reg = <VOLTD_SCMI_STPMIC2_BUCK5>;
 		regulator-name = "v1v8";
+		regulator-always-on;
 	};
 	scmi_v3v3: regulator@16 {
 		reg = <VOLTD_SCMI_STPMIC2_BUCK7>;
 		regulator-name = "v3v3";
+		regulator-always-on;
 	};
 	scmi_vdd_emmc: regulator@18 {
 		reg = <VOLTD_SCMI_STPMIC2_LDO2>;

base-commit: f831584128ac2a36fb4fa62fe106793d08c2dbf1
-- 
2.56.0

