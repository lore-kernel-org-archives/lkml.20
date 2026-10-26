Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051881;
	b=JOVFGGP1mulF+LuFATtBelp/C+JwseNgXM+gP2EITtN+80wBMFLDdMqfEDk77B9j5L3J
	 AJ57As5vJ/r3sJ/Zd2VvWMo8XryJQfqubfCMaqttyhHPnzlxcXLlq61pvote8neEMQoIN
	 itukdK9GQ+papc+Mg8D+Y7NJSSvk6HqmluC0/4A1+PQBx+dKw7i3+Qwrxfzrh/o2tOt6U
	 tGEM4KsamZnWougpXnts8JCbwwd/uLV0hT4JUCwH8Qby1gX+v524NFDq9g/+26OgfDNIc
	 Wr25FFdmgFCriAquoCeZ/kBlfXHDiGV+rLLU3xZzwNw2ntkHt4mepZLilJe+L5PtocA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051881;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=eN5G9Ls9ytaUpIc52dHNgLyCQKxcctTRzTTICGzufKU=;
	b=ahOI70D0+X4DlKHgJTYLJmz3s/i++5y+fbiBen04AFlUKWDAeyZvjEcBJneIEeh0sErU
	 1kd2HykBDJiWI5CZDnPyIsVV00LoSn0AfoLuGG3sJTdiu31ruWEwkJYVqoQg9S7zRJdIT
	 wA3+xBY0/ddNISMA0EE0dUqq5A2PnY6lXaV30g/EkdXFUfLyfdcmpIf+FGVJriPO7mq0C
	 b6Ec4KV9gVpYf6rWzy34o9XRJMns7TDx49Q8FvzPhPbaTUPQEL8JygP222Qlu8c/Tnahc
	 5pBP6hopYPNJcOFmLPLp2rCmazJsmdh99NPYn2dQfZlcx06zVc5ZOk/+xfFwXmRr2uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=CzNGIVmq;
	arc=none smtp.remote-ip=185.70.43.170
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBBB60A2606
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECBBB60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=CzNGIVmq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1793051878; x=1793311078;
	bh=eN5G9Ls9ytaUpIc52dHNgLyCQKxcctTRzTTICGzufKU=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=CzNGIVmquSW6BfZMSXWq4zv2h80MFfs9R+EpCS7mSO1uuz0aWiNY+ZvtL2Xtdnvk3
	 puFwa3oVFzJXqJdgZONh0R6S+dyEQefnZaQi2lDiGzEQdjF4fV61rJPqjPE4zXNV8j
	 Ii3uWsPY1T0gSf0rPICpgqSGkfHDHa+eaBQB5prPvmpYMVa8dShCv0+f8529RF0g+X
	 bSTUhdb1+HFF3TZCHkarDVsX07RrmiSu+i3CcZCWKmZ3FC2eHeyq3g4+kHCd3uE7/2
	 W82j/Pod+rm2A/slyWehOktafQeWr4ELHB5jIoNnKQ06mX9U/Fe6JhAegQBEBFSh+j
	 lWUaGYiDkNTOA==
X-Pm-Submission-Id: 4jD6tq1grjz2SccZ
From: Michael McAllister <me@michaelmcallister.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 21:46:23 +0000
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm6115: Add missing MDSS AHB clock
Message-ID: <179305118391.93309.8898668683371265381.sm6115-mdss-ahb-v2-2@michaelmcallister.org>
In-Reply-To: <179305118390.93309.15055947565850813746.sm6115-mdss-ahb-v2-0@michaelmcallister.org>
References: <cover.1792852079.git.me@michaelmcallister.org> <179305118390.93309.15055947565850813746.sm6115-mdss-ahb-v2-0@michaelmcallister.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The MDSS node is missing DISP_CC_MDSS_AHB_CLK. Although the DPU child
already requests this clock, MDSS resumes before the child enables it.
The MDSS hardware-version register can then read as zero, causing
msm_mdss_enable() to skip UBWC configuration.

On the Motorola Moto G10 (SM4250), this results in garbled compressed
scanout after display power cycling. Adding the clock restores the
UBWC configuration and makes compressed and linear scanout agree.

Include the DISPCC AHB clock in the MDSS clock list so that its existing
bulk clock handling enables it before accessing the MDSS registers.

Fixes: 705e50427d81 ("arm64: dts: qcom: sm6115: Add mdss/dpu node")
Cc: stable@vger.kernel.org
Signed-off-by: Michael McAllister <me@michaelmcallister.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- Remove the blank line between commit trailers.
- Add the received Reviewed-by tag.

 arch/arm64/boot/dts/qcom/sm6115.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 0f2af8aba..f7002b9eb 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1927,7 +1927,8 @@ mdss: display-subsystem@5e00000 {
 
 			clocks = <&gcc GCC_DISP_AHB_CLK>,
 				 <&gcc GCC_DISP_HF_AXI_CLK>,
-				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>;
 
 			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 
