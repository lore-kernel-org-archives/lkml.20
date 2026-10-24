Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792852126;
	b=p6j3Fo0qZy4Y0hQDoNt9DrfuyWxcHJaFd+PBn//2+cAw+smBQFe094+AjK2tcV5E73Ux
	 SKyXcWUsk+byFvKvHGXEHSu5FGJ13RRTqd67rO052Rrm7cW7K1OUBiARpu5PeWqhhULB+
	 WgKJSzPufOox6COQL6XPLGoVp/00Bbc73eB0sXoAYcgoyeaFuJs8wFM3YK0q89yxuA2HX
	 ZRfCm4EVv46iUuQo0eTP7JAPun0VlOobo2heq4lonmHXg0wc3OJAdMYOWvp8MltDxf72x
	 +OSF4CVIBi+620D08vbP9hiRFYOw1m5fl6ZMKZxXQRz7/ISTcr9ufYGHEoVJeKSKMrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792852126;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=SNbYPXjdDvBqxnd6BWiHDZ/T7eGyoJJ0/v+O62n7CMA=;
	b=Agj4j9cyIU9hChf+g7IW1EsPCbXFiLJAaK2nhElgylCbvIZ13NIwSp0FrwYfs8lY8Vnt
	 tY5pSyCGqE7TAKdWVFakEEOYEPSEABYx8B0uG/t9+oQTxC7rEEWJgsPb/+lAoyu8PLS4J
	 6Q2uAR4USejMLDC2Z/bFzobdDzkz9RCCBRy1UgzWzXT9yK7sdTn9pJj8oHFrSyipLMrIc
	 Pi4fM38vMWfK5+k0kGEi4bFQeQhcknL7VtqmBdcaNUHAP5m67F6Hv9zKoZMMpWN+8r/16
	 zKmof74OySNz+Rc0G70lzdcfcZ+QA/0KDdVGUbgtk8brBoa9drvq0MtCn1eGrWOUvIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=cPsvRrN4;
	arc=none smtp.remote-ip=185.70.43.171
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1194606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1194606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=cPsvRrN4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1792852122; x=1793111322;
	bh=SNbYPXjdDvBqxnd6BWiHDZ/T7eGyoJJ0/v+O62n7CMA=;
	h=From:To:Cc:Date:Subject:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=cPsvRrN4h2PcKKckDkOW/C4TznSurpWu9gFzhpw+q42IvBsb7y860TzJJW9lqYYiL
	 DpaRc9LxdHYxfV0C4l0/+cG9ZCpieUpl6+HsY12uHvTK6JNYxBrA0IxpOBOWYpeyhH
	 a8CL3DJUjnu4ousk0mgCrwV/xgDGGbuc3EL2Ec67DdLRV/Saw5fgcnxUongf2mscVl
	 /IBmBhLmIK4+Oyyf9UwYjBaBWwSpfdpsZJ5ExaofYQJFzwjXaBsoguu17noEJf+5PA
	 MVwNLpsYmxU8FssTAET6SOzQh4o9wF/ombumUT0ZtymQC2DC7OGKV85PtQZKcDIV8s
	 qYqTOG2qs9cOQ==
X-Pm-Submission-Id: 4jBj1L2Pnkz1DDnW
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
Date: Sat, 24 Oct 2026 15:27:59 +0100
Subject: [PATCH 0/2] Fix SM6115 MDSS register access during runtime resume
Message-ID: <cover.1792852079.git.me@michaelmcallister.org>
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

Michael McAllister (2):
  dt-bindings: display: msm: sm6115-mdss: Add missing AHB clock
  arm64: dts: qcom: sm6115: Add missing MDSS AHB clock

 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml    | 5 ++++-
 arch/arm64/boot/dts/qcom/sm6115.dtsi                         | 3 ++-
 2 files changed, 6 insertions(+), 2 deletions(-)


base-commit: d053e38e614fb2e383b298ce8fc308a780d7f209
-- 
2.39.5
