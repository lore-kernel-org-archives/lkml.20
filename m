Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3AA503BD8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057797; cv=none; b=E+t/9RcP5fsedJWWMziWKpeAhqhSA6C+8ljQSnRHvG36QZeEEHHJOzgzjH6sRiNfULPxWEp6ai7eiX73Wp2NEasadUZE3Ya0rbuahTNbjYKtJygYGkOtLVtLMr6Nz8nXCgZX8JCMvk8rqzalLe1nkiFLVc2bO+2d2KO06FHGuQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057797; c=relaxed/simple;
	bh=ZOpltpafv/7LlNWra6wWjfFa96A+83F+yhqApR3l6JM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gRXjcnEhH5Dlf5YVVIlqFpBbCego1oeHjsatILJRj39SpGBoMyGXrQ5oVfsEuDqI2fJBIeTDc7fO7U7QKzW5JFqC/74ZVZaZICCJSWOyVUkZ2ywrM1hL7sCWQCiWhEs4wab6Fa05x5eYpvdZUYos9mDt1dN5ddAFj0Jglrcgx58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=KAa7pvlf; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="KAa7pvlf"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c4be28b82so205869f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1792057794; x=1792662594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZtTPFUdhwPPjPop4o2Vw8B13QBJM3YcreGJyrx1Qvs=;
        b=KAa7pvlfN9u1gjVrWFZ+5GeN+qfPSajRIwkJ7IzoTZjpdwy3h4vC0Z3Ws3h+3Y3OZD
         tLDamhB/H4brlXm1u+0MG7S6yw0FM06O+6McvXfODyIb9sxhUwk4zEAUCUVLZNzAyF3a
         vkToGr5ZQDTkUpYhEKs5GOcQkvlrtBn1Qo3XBWiEY2cxVZwp7xz8sOz3/MwPMu0Xn++/
         Emgb8LgRZp5EovzWJqNdw64sWx9bWP0OCz5LRiLS+vy8AIqAm+GB5ZEeokOL+9NeBD5S
         +1wDW9lXZD3CEQteiAwBmtpqZdgL3K3UB7zRdjnfguT55dh8bQpsU4JJlkveI9PWG0mu
         OlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057794; x=1792662594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZtTPFUdhwPPjPop4o2Vw8B13QBJM3YcreGJyrx1Qvs=;
        b=D/HeCUKygMMKhInThBjqiOYas7tecPNwxynIz0jvkQAG41WyqnVu71j1y2pdtMFSlk
         m0757fluvgVw1tXffNNCwipLONlDJpR6N0C3sXQenyYL9AZ25/Wnhq3azcpIqyh6fgPQ
         PrDelAVHUy6Zx6HZuQIXUK3RgJ4iREi6QTmdr6LA6y8AXvwQp/digqJymZxOhE8MP26S
         GrNWLxtAwMsVmJkZnjs5EAQx2mHbZt4rz7xqW5hep+XMZYQRxb6Ho1K5k7Ezlrox6TcI
         VMUj31ITDPRR/M5/kcXLij8flPQs8znhHzJ+A4FYc8z4xKN0YLGFWxYr0RsW2KC9nWPI
         EWng==
X-Forwarded-Encrypted: i=1; AKwUvBwCYKpPpxSfwzytzUID7ghsnlWRlly3FMpT/l9ZmImPxe3KwJX7fyEV1JAA2mY7TtwtkHv9EM45lGiPc2U=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1bGA729pdzN8/B4HMvRfdyPuWqScM5sbMLkIC2f62KmCF0D7n
	D9CtB2ZCPbUaOpHm3Ve+KJGeuhl40uor/reauf5OcjHS9lMzxAfATxvdOFZxJAb8aa0=
X-Gm-Gg: AYBFou0zZDNDqczM94Ms7S8jhFUIvMBBQ6F2JX757Lj7mLOPxQO4u7395ILwpksTuU+
	LMWSRT8p0dNkRA4ePVKAI8Hr31EHeA7Z8VI0XVtyz4sCXbnfe+6hfBsgZfBsKrojrZtwcWvw/0T
	y/d3vJf/+rmrTF8tl1ug9gxWMsQCh7QHHGRitbJz6XxX3Sez4Xpg62nd+sVc1X6eZrFfi6nIZLl
	tO6GtQ5Wjt1fnLreXOdpG/Vzjv8/LPR/i7wwkl46vZYUCtuqA14lvIb4G31SVvoPL6+eS4qGJen
	1NB/o8mNcJQ7phbTpGCe1k+36xWmwhbY5EguIfOD3O3Hj9XiKowwO4tQ6STHkF+H58qh5gRPVgo
	vkQi8kOtFeNRWUZi/qRuLIupsXD13nYMB7ajreBxtzh4a/4C7VWE7GGfgepy8MdijN9FJykHDtN
	w6D4WS1Rq1SpqQiEpMtdDzyUST2IHGhAunWrWy/5XRxvHOLDMEdOmKgoPI3xJMRx5CMUxPU0h4a
	EZaIJCYcAvlyvVl3AuRVlJIOA/IVCdEIiELSj1VxpG7Gb53iTcUnU9gzjfhkUzBCko6rpnFV9kl
	Eko29sfIvCQ63VQr1LV6TukaMjMh7t7CHq6asw==
X-Received: by 2002:a05:6000:40ce:b0:48d:bb54:77e7 with SMTP id ffacd0b85a97d-48dbb547b24mr36277483f8f.29.1792057793781;
        Thu, 15 Oct 2026 02:49:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:273c:cd01:737a:1f7b:d586:a293])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc85b1sm16926246f8f.54.2026.10.15.02.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:49:53 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 15 Oct 2026 10:49:32 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8550: Add the CSI TPG regions
 to camss
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-sm8550-camss-tpg-v3-3-00fe06a3c557@imd-tec.com>
References: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
In-Reply-To: <20261015-sm8550-camss-tpg-v3-0-00fe06a3c557@imd-tec.com>
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
 William Bright <william.bright@imd-tec.com>, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2

Add the three CSI test pattern generator register regions to the
camss node, matching the updated binding. The TPG blocks sit at
0xacf6000, 0xacf7000 and 0xacf8000 and are used to generate test
frames without a sensor attached.

Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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

