Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332CE410D13
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278701; cv=none; b=pp2VzcyoPxChpBB+xEv+R8xWyG3DEK0lVQ2s/DPElfaZJWO8KiBdn88MSXc/nhg4DnO9OHKNjNpTzPTggX3bkrYkeX5+9aDmUvHcqjli/Z5AEHgUoKGK+BOhISR/5/n31itBc8xPJSoUXVvRAuwKWtZo2rd7rNmyLvPqvC9bGFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278701; c=relaxed/simple;
	bh=uMVcUveh2OAO2QoYAJ+VokNTBAEHdZdPb81jIW0e1Bo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VIQrbWmYqp6wYG3YM4sq95urWV/Ky1LZ+HLUCTmyOrDFcmoSR1WRSW9/HgkD6nOibzHMB1mHEtdNPbo+WMwfGBIUowkh/5mTP2zH/3zzYYce1nEFPfH7vrEs7hcvKGthaJ4TprXHIWoQG797jUlocxKKQBm1y13GtD3mfKiE8+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=fJGgdZFO; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="fJGgdZFO"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 939C2240103
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:38:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790278689;
	bh=J4c8vhB2QZ/uc7mLHC1umMx4jF3vYPM+rU2qJrR1C7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=fJGgdZFOXKE30iXWtuJ0wdR9z+cGGEqY1s1/y2xJas7BJ2GF5LYFa1m9hny5jxsEq
	 peCasXC1tL/hexMooSDvtQQCQS10g7H56RxzBPL4x9lQ07Rbuj5O7MAjndBSyZkMdV
	 7K+04ZeoswkgFQf4Zm/lHi7fKNV078K+NXBFTsx9Xa7i7ariFUf7K8LrCa/pSqbqoj
	 9JdpEhVWFKJHKwZXVXEmOvCWXyZi7258P1mp/EF9Vd+j3xbVINrcJzeCoBMbTYd4z/
	 yjMCuItF5+4QgTcJwYizDLwxnFAEZcMRHEgWIZPsPbMrukcZKEG980ip2cUrVMlrcx
	 J1FabCy6l4vGA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hrPJJ0Ss7z6tvk;
	Thu, 24 Sep 2026 21:38:08 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH 1/2] arm64: dts: st: fix sai3b unit address on stm32mp251
Date: Thu, 24 Sep 2026 19:38:09 +0000
Message-ID: <20260924193759.27881-2-mateusz.nowicki@posteo.net>
In-Reply-To: <20260924193759.27881-1-mateusz.nowicki@posteo.net>
References: <20260924193759.27881-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The unit address of the sai3b node, 502b0024, is the address of the
SAI_BCR1 register in the secure alias of SAI3. The reg property of the
node translates to the non-secure address 0x402b0024, which all other
SAI nodes use. Fix the unit address to match.

Fixes: bf26d75a95f1 ("arm64: dts: st: add sai support on stm32mp251")
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 44938c036e30..24f834cfee85 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1291,7 +1291,7 @@ sai3a: audio-controller@402b0004 {
 					status = "disabled";
 				};
 
-				sai3b: audio-controller@502b0024 {
+				sai3b: audio-controller@402b0024 {
 					compatible = "st,stm32-sai-sub-b";
 					reg = <0x24 0x20>;
 					#sound-dai-cells = <0>;
-- 
2.55.0

