Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA1C4AB1BC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052065; cv=none; b=L1HjcAA8BLWsqbq+X3d7fiFkPCXi7H8GVYwcCBRwK8xU5M/MDI7/k/ff5Al2FBipr4M6AYxsvP88VACkAK3jZB7iqc0P3303rVuP8/qlcobT2FYHXd0h/nDhl9aU9GMivu9lnP4K+sts0GSW79oRJ2EalTVvl8HAG1asmhynNsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052065; c=relaxed/simple;
	bh=MquNAT6A9LY0z5XBr75rwe1nLNnGi+rAfX3A8ukDpvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qHXDL67LzfpV3A9iVf00nBknnWGCCzDw3zniMnXe8lK8Pg4WguPXyYDUCVNYmVGa0oyqmDF80oP9zAsgiAVD7yScpbs87rQ+qSMUIV8DEM6Sc7sGv2kCiP3wGIwUwU/46fzvqsfkP3u29iED9EBIB7Kqqifz1GTvfDedJjUUft0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1DI1G3Qw; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1DI1G3Qw"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a18e24ad25so9366076a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789052061; x=1789656861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4Lui4dl5qTw7CI3Pdg3YTOJV27r2TrFCzHImNPail0=;
        b=1DI1G3QwZ5PdR1IHjQP33Z1KgiQXN7OvvSBR9O1MqZhykb1LmG/yqxZaL1ZyEJ9zZH
         PDaFwJvVFFhfiUadwo3LddVdlvKgk+MsMkcZDZbdKZk2S+RQDqMO3bxxfcW+qmaa6wis
         4LAy9Jw6H2xwsUK6xtQbQlwEFurAkEVkGUTpCUsmMmjhwN2mI9kNgyYlrl9a5p/L9Bc6
         67OuNk6g6oNsRFtoY2AV0xOTtPCd5IHbjL9JO0xg7zYYJ1AM8guHnXlJxFdPhnGcKBV0
         t2+uNE/IgnIxBodBIreYA+P5EaEdI5cA9RK5pF6g8Eqz4C3JUXUpC5eUDH4Ojw2M93X/
         5Ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052061; x=1789656861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4Lui4dl5qTw7CI3Pdg3YTOJV27r2TrFCzHImNPail0=;
        b=GBuGPkxMhXvBBkV9/BClIdWff/xHduusOLrsDyt/o30DxjMT/wDYK0+GciKGCv+P/N
         tIiDRucIKxPqm0T0r9iPp5NDqnh5jU5wLPCSxoXl83S9g2CAEvyCIOjy8lGUfmWYLJAQ
         WfplFOjIIRIEYqhXSGs7ZiOF2W22b8NTiX6MWqlFmlspSm4WadqRQmd/H+05V0tavxut
         Y/s1QTxMprUQSFqpD9eN7EkXE/XSHPBCLmGa511zmqCbzO6Cu/OilAup0QBP552V3oDj
         +QR/xX3Dx84gr1qHYKDsTqFubnSU3+bhCjEsB4kWNzOMNdR3oiUmR739bkTLu3GOrjA1
         MRJA==
X-Forwarded-Encrypted: i=1; AKwUvBzuekLkjW4ZvZ46uI2J7rVN07YIULTUQhnBS+GcorEK32iZDjwMCUkRoCRQZURah9FtmqH7FHGQv5pE4EE=@vger.kernel.org
X-Gm-Message-State: AFuF++mEFq45jXvxUhT2+FuLwlkOuWmIwezH6506g6RFmF734w4OY/nx
	qX8Hu8NvyZeXpbbHxlvW7ZpWxOTI+WaBq3UWlnnLeZ1HJC7PyOWWCQ1gyZWonZ4fZ7oP6V88JeM
	afUH/ACo=
X-Gm-Gg: AYBFou1JtLdZ1wKHGWWYIZexnN+D/SrYjzL4VjIA8/ROuKweNgaryUVUQx7ppL8W4mb
	8PdoHhNr0WgyXZ53szCc4o91l35ahq8gGVk1tEgFu2rcZCl/8PZe86Hr06gmH2yiQoHjSmZtfNq
	PPoHqr3iC9LuZ7CYMXyyzaZ/ENCyIqtGOfUAL1Mdiplug56quJp4iBPDTY+1fBtKJGzEKuO7k2C
	xl2TH6kMFXhRP/f4NnklTEiV1eSPJn3GXo5OHzaEJJ64dnTteVYYm+GuB6UxyrVtXVlYZYFG/wH
	rz7atwCiDhUT418MD1LivTkRp+2nKXiKmHOA27y0yj2XPawUMgohPF96CFe0tWod+it0n5YP4sZ
	Y98QwHIeLBAabmjJlGRDW9q1rhJnyFvQyhO72avuR/pUY6slCB/g1qkVHIL/A3cQtF6fZJ5dnQw
	N0juqRiaIQWdcACCrYfJyCPyvBh1WvO9K/COwR1HNbpJUXzXs3X0jT88uAbnDk8OTY/Jt/5Q4lp
	tYiIsB3tqxd5YBvdu2bF3714NoTtR1vzAheJgtQryH4W9iuHn+dm1XV1lO/PT72gY0=
X-Received: by 2002:a05:6402:5003:b0:6a9:8ea3:6507 with SMTP id 4fb4d7f45d1cf-6a98ea36c7fmr4599746a12.30.1789052060890;
        Thu, 10 Sep 2026 07:54:20 -0700 (PDT)
Received: from [172.16.240.55] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c20c0fsm8849715a12.30.2026.09.10.07.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:54:20 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 10 Sep 2026 16:54:18 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Fix DW9800K
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-b4-dw9800k_cleanup-v1-3-608255ea61ab@fairphone.com>
References: <20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com>
In-Reply-To: <20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789052058; l=947;
 i=griffin.kroah@fairphone.com; s=20260910; h=from:subject:message-id;
 bh=MquNAT6A9LY0z5XBr75rwe1nLNnGi+rAfX3A8ukDpvA=;
 b=se1xMaa6rpRe1osYihYePmbAFEtpW0H4VSfKVR3ef9ziNFAgHHQJNLCgy4nJ5LuVD9CnbTt03
 ezkt/cxqzV+BRQNpBmHoWcwYfF0WKNTEHjOgG67NGDWr7f2ora7BkVq
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

Update the node for the DW9800K to have the correct attributes.

Now we correctly select SAC3 mode and other attributes with the newly
updated device tree bindings.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index fa4566df0a71..cc99590afe3a 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -744,8 +744,9 @@ camera_imx858_dw9800k: actuator@e {
 		reg = <0x0e>;
 		vdd-supply = <&vreg_afvdd_2p8>;
 
-		dongwoon,sac-mode = <1>;
-		dongwoon,vcm-prescale = <16>;
+		dongwoon,sac-mode = <3>;
+		dongwoon,clock-presc = <0>;
+		dongwoon,timing-control = <16>;
 	};
 
 	camera@29 {

-- 
2.55.0

