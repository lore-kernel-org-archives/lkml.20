Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793051876;
	b=VSuZPSYpZPaMo20P5MhwQQJlXoBe98s+5OdPTMO9etPteTBI+uKTrVZYrpIHmUfHQzoC
	 CLaoReHSp4pIRweo2KQEQwv1vxPhwui2BUZqijIbI3yQa4XzSzglWuzowgSlxx3+Koost
	 TAmY52Pk/sbkbQevVRWTtmfWMcJ8XX3cVIqaceRDk1VXJAF+fphwva1le7tDyPc3TBWgc
	 xd4LueznPlbqHAzTTqUS9ANWTK9GHVQOIDl1SNi7mekA3o//PPzrI3MP4OCfQchKOT2+7
	 iPoGUDTcJjy8ZIhq3mnFCTzc1UyfSqqFStpfgAT4xitDru4Tv2rb65SjkXAWlVPjPjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793051876;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Kzl1ZAv7cZa8GOddkLjuda7BV1w0chektIixjhktA/c=;
	b=0lqbjEJynb5A5N5PAAF3Rh3g231COOS5vYwvqHZIuRQhKOF3HQNzO5WRKF3jB2sWWtCp
	 GdWXgFK3B0DHBqj2uXYhEcz+JVgyVhYylUuOSM/xZa9Eka5/0zTXpedHZWwo51WlHgQJh
	 UbRfA5diTbs6B+Bbbjsl/LoK34BshpsVehu3s8kUZZTlHWPp2XHaS6c4cdV2vxN/gaSGS
	 POyQIFUbW23b3wTEJ2DVI0JfrxFpkotKbAvm7TCUE8EymCGnmpM1sHgxjMG3WST3JeXi/
	 CTLAObXcDs6adDZ5ns2Sk3IrKixgmM8ip6spl1K3Obs7J4GJ+YbJ8AhHUn8+Cq4/RUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=Y19sIOva;
	arc=none smtp.remote-ip=79.135.106.112
Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6B4606A31E;
	Mon, 26 Oct 2026 21:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C6B4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=Y19sIOva
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1793051872; x=1793311072;
	bh=Kzl1ZAv7cZa8GOddkLjuda7BV1w0chektIixjhktA/c=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Y19sIOva1HYoQbMteC6++7RCKBcbrE9U7onug1vWs3QZSrVK0uOhe3bFdmWkWKVeQ
	 FE4xPQWV4GEZXNgc8PrxnruH09giPnsGPc4uorKDuBAwOSTJ777nKYPTuSI5Ae7AP1
	 Pq4G+TclY7hUN7/z9tKtwdaBe8o+aHwwYXYVst7rz/Nbhjcrl/7L1pRvQWr41eSdYV
	 3pF+WEyfPdNBa87ihgr0DXKJBCdRnQS788LMjr2OCzxPgqHZQzPL8C/7gbjpQGLm2f
	 Z0jmgjKcPPi2hL3fZ+Drb1xjnsm5thshGz9vj6Fz/oK1at0Ieioxy46m9QTTzHEHXl
	 ZmA8hZYDw2YHQ==
X-Pm-Submission-Id: 4jD6th3rj5z2Scmj
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
Subject: [PATCH v2 0/2] Fix SM6115 MDSS register access during runtime resume
Message-ID: <179305118390.93309.15055947565850813746.sm6115-mdss-ahb-v2-0@michaelmcallister.org>
In-Reply-To: <cover.1792852079.git.me@michaelmcallister.org>
References: <cover.1792852079.git.me@michaelmcallister.org>
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

Hi,

This fixes garbled compressed scanout on my device (Moto G10, SM4250)
after display power cycling. MDSS needs the DISPCC AHB clock before the
DPU child resumes, so this adds it to the binding and shared SM6115 clock
list. I tested this on 7.2.9 and power-cycled the display 20 times.

Changes in v2:
- Remove blank lines between commit trailers.
- Add the received review tags.

v1: https://lore.kernel.org/all/cover.1792852079.git.me@michaelmcallister.org/

Michael McAllister (2):
  dt-bindings: display: msm: sm6115-mdss: Add missing AHB clock
  arm64: dts: qcom: sm6115: Add missing MDSS AHB clock

 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml    | 5 ++++-
 arch/arm64/boot/dts/qcom/sm6115.dtsi                         | 3 ++-
 2 files changed, 6 insertions(+), 2 deletions(-)


base-commit: d053e38e614fb2e383b298ce8fc308a780d7f209
-- 
2.39.5
