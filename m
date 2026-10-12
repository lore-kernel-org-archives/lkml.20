Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F7C48C3F2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813139; cv=none; b=mbcPKc10VFMBHoQJ+yoGbK/YZ1nrjvJa1nUEWA++HI0ZN4f4EOdP5jjjg/W5vsPZ5tuTit5jk8LsGrynjsqFFqfoEbOqYHcJiW4hAuJzvfMOBGZI6SJ+V23KHtuh14j8UvSk5RLNkk1zTuoyjsSzrLlW6IRMtbeelupCTwiPlW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813139; c=relaxed/simple;
	bh=jmnOUUfdHIW4UoVgCq1OlOIoITSusSw0zexra8ko+BQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ph0mPwaPxJ0ln/LzyjpJDswLnefn0Ehl3QgO3yrxAxl+RxWhw9xxVqOuhV7gBhmwx9FB4h0wStOy74liv5nzw3asl/Vl8tEbWCc02QscNlrN4zhpnqUVl+3N1y7Os41UfduNyd+bKzLjb9tNAm8T6O6kBlgqmZ392krL1+kze5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=MZM/09ls; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="MZM/09ls"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c14a06c95so1447500f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1791813136; x=1792417936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fm13zV7fU/tYSB8SyrRHgmdMzw/bsTAxkTm7l9ON6TQ=;
        b=MZM/09lsT9mjPUi7/UosPBBGCd4RitSZSVanuT6qsJayyQ2yDP857ltXR+AbQc7GaC
         s+q3LuN/w0VtkAxnAyJnzx6zddWs7Dp2TMdwsIBU5msWOKR0Jiyo2MXF/oB7TUK5VbNk
         5jizdoVZ06Zl4jCWwC9dBXAApGDly8FTNRLplBSWMNkWqAAoUdwQS7xwE2Yo2xWWqPr/
         Sve08sU0RELvh30bYCvqqryDWk4VQbX+W0Sy840Ctjpc1y+DNwnwgnVGMiooT3xw7FTy
         QZ3ShY8dK87RYN+/3hpcedQMCvOmczBXm517gRm/OkSKUnl9l4NpGfIgH+wLwHb7U0h2
         Poiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813136; x=1792417936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fm13zV7fU/tYSB8SyrRHgmdMzw/bsTAxkTm7l9ON6TQ=;
        b=fZBFZtVgO+X7b63XhIlKa2aNvH6psNCpLHScAu1wCxSNDsrb1cKJ/i98yHDaOD6lOq
         pB5/8RNsh7noaL8RD4JO1qV9O6+PaDvZPOm5+f77p1N0x6Xca7SeKKJCM8x7LkLQxYzD
         by2FQTJ4LGEtb2bfvAmkAOIcy3XOHCILwXzfTfgNnkuGB/2AltKyZRSl85ryj+3pEVDQ
         CWIUOhjEFenQ+nNIPf47sVeUE5PzpNRJKyTYrK1PPk+iUfSvTlzicbv69oafvkZYchdX
         0Xw1sFwDwcw6B4XTRM7Do/59FHe/eXaLlU3EMQpjq+GNY9Trx1tkuqQtqmdPqcm+OSEy
         ooPg==
X-Forwarded-Encrypted: i=1; AKwUvBwd8+TYWg8Ld/ECAhC4TF/MTCI+95hfKHQahJ4ccwzLWBg9fgzdhEwm3Xftwlzow+3175quWWJDKGNil8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEX/Jk5ztLRJH6O7psWqAqQe4szZ36HgiKY+e5jWQKgprrqN4P
	HnXQVa6mOkF2va9ZfKrwny3vkUNjoMQKWlvMPndHT+vN3FM+SbWTuqcqN+PUDRJvofo=
X-Gm-Gg: AYBFou0zg5sshoISsglFMMnzHQ+PgVKgtYHJ9XkMpLfMubPFbcNiNnbfSQE46X4WHC3
	iY36pH4WcdfmibJS2WwGCKiHQp01O+2KDZfAxmJHGCNiBzQ+oO01r77vrrLPPTL99WJzKfx+Bdt
	ivX1WFNTKQjUbAPX66mgATigiHKbZiRagmVnA0tK/+XzOIHdlAO6GwegJQFjwt3tB8w7M5jz0YS
	txZZunsaYyUO9A0QfXS5/eOXEUAYdoxWgcpK1Mhy6AsiPlQCgJzHeULtCw6KTVBuRobGmlAQxon
	L2hm+2kU9YpGFwnwsCalOwgteX0qRqxANxRHe0kqdJJvP1HRm9aNUBijjymYOYyYea2jYbxI5aG
	JG5eDRyiLKeHQQGin+4G2NlcDityJPdh94hI5R8l2jjC1SbX/cpQRMTyRVyclySCiDz7PD3dOP6
	RYoi/sCMN45fiVoX42t4jaLxJpnLARGKQnSXqEzKE1rjFU0lrqqiOQ66DN0OZ8HSUSGd3TnmYdk
	x1siM4+7W3AfcmMpSiWqiDRNIyZs+8i9/8x4+cwNj/IlPbz9L9I8e4OUlyzTBwSD8A9BatJrQ6I
	8Q49rLnzKQrlAV4u/slkrQ==
X-Received: by 2002:a05:6000:290b:b0:487:2805:6834 with SMTP id ffacd0b85a97d-48dbace156emr16771065f8f.42.1791813136282;
        Mon, 12 Oct 2026 06:52:16 -0700 (PDT)
Received: from [127.0.1.1] ([82.71.135.85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e3519sm21355523f8f.16.2026.10.12.06.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:52:15 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Mon, 12 Oct 2026 14:52:02 +0100
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm8550: Add the CSI TPG regions
 to camss
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-sm8550-camss-tpg-v2-3-06dbbe36ecd2@imd-tec.com>
References: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
In-Reply-To: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2

Add the three CSI test pattern generator register regions to the
camss node, matching the updated binding. The TPG blocks sit at
0xacf6000, 0xacf7000 and 0xacf8000 and are used to generate test
frames without a sensor attached.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index d21c04b1a306..1270ea8e4fdd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3862,7 +3862,10 @@ camss: isp@acb7000 {
 			      <0x0 0x0ac71000 0x0 0xf000>,
 			      <0x0 0x0ac80000 0x0 0xf000>,
 			      <0x0 0x0accb000 0x0 0x1800>,
-			      <0x0 0x0accf000 0x0 0x1800>;
+			      <0x0 0x0accf000 0x0 0x1800>,
+			      <0x0 0x0acf6000 0x0 0x400>,
+			      <0x0 0x0acf7000 0x0 0x400>,
+			      <0x0 0x0acf8000 0x0 0x400>;
 			reg-names = "csid0",
 				    "csid1",
 				    "csid2",
@@ -3881,7 +3884,10 @@ camss: isp@acb7000 {
 				    "vfe1",
 				    "vfe2",
 				    "vfe_lite0",
-				    "vfe_lite1";
+				    "vfe_lite1",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2";
 
 			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
 				 <&camcc CAM_CC_CPAS_AHB_CLK>,

-- 
2.43.0

