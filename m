Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397FE4AF9E9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278701; cv=none; b=sN7rpBHrGxmEqoG/QYDjN9saB4+zVxjbdmFJWV0ofPzoPwMXgOF1TF2CTxlFUTK1RHSKdgFGMYcI60gI7cQfGwVzEP6JAhL1uuMcZ8XydxOtJ6KyhOgwgvMNkYleTVgRYhxsSCWKegF9Lc9A2ujoFYxkSFvqz3sassapBw+ElR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278701; c=relaxed/simple;
	bh=51lr6ubNx6utFhicZrmamtvEzbo/BC7QBVuznV5OKBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VM57UpJWY4uFQcka3h5pM/4bfMwbYyQsxwX7R8u0GpvkPYtlnmt6dquZc86dnnRs6Avq3TKs8+cu/QXCFoedEgA+0yttaDxmKyJhqPuHZGvwKH0SCyvLsFdvKjb14V/+BPTpWlI11jUu9QH5Ecn06lblKzM7ZLJtlRhIwqJ7fMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=ENiL8dsl; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="ENiL8dsl"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 1F8D7240101
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:38:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1790278691;
	bh=3bfxgkZZv7yMM+bRdt2rH/UQL8vijvkbbSdEXwbHmck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=ENiL8dslnz35MtWDYG7/wqTaq7FdMZW+HfA39613OAEYm1ZDpW8WQc6uZ0HbNIeV4
	 TF4quUqfY7gg1ke4mJBmGqrG+1gUE7Q+dRFuMYK6C0X62dt3nJ8MnSZWvV6qzN5SDv
	 wQ9sikeSG3vt6BmFQPJgI1/Bq5cLOCbY6U4vFp2Z/v1bARFCQMdpI7QyKek5JkleC1
	 XX4y6ssslHTtoqo7jFzronK/uzQarS+tGLEy858ARcbHBk1hKGwQQ6Qoid5adLXbQW
	 iseTS/nI9q0WYoINZjTG9lwVNa6nmydbgtv4ln8J4dSqo4I0nc+x1VSPs0GbCh5zlS
	 niDaJa992KeRw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hrPJK39HHz6v08;
	Thu, 24 Sep 2026 21:38:09 +0200 (CEST)
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
Subject: [PATCH 2/2] arm64: dts: st: fix sai3b unit address on stm32mp231
Date: Thu, 24 Sep 2026 19:38:10 +0000
Message-ID: <20260924193759.27881-3-mateusz.nowicki@posteo.net>
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

Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 0feb8943efae..7cc8d55a6c23 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -577,7 +577,7 @@ sai3a: audio-controller@402b0004 {
 					status = "disabled";
 				};
 
-				sai3b: audio-controller@502b0024 {
+				sai3b: audio-controller@402b0024 {
 					compatible = "st,stm32-sai-sub-b";
 					reg = <0x24 0x20>;
 					#sound-dai-cells = <0>;
-- 
2.55.0

