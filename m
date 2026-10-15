Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDD03CB2EA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792041653; cv=none; b=fejxoBsSHepkNbMgzg/Rh/UsPZl1sbhaSf6Hs9PQRsFgq+7qg94znoA/JJhH7Twb65rzgDElxUhkZm7oq9pmaUbi7wyumELrHBo7geJ1raTh8t/SicqC5Apu1/Q3G9YIEkO6pUD7hwt4Z8eszUsCmun6AVGXy96lygvRlSF9o6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792041653; c=relaxed/simple;
	bh=6sYp6gwLdM8q2X0kWDCuDxQHrC8+z3UsdjNuoTgAQ4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o6gGGh66tdqDd1hmv9nWUKN6DzbwInUaOycsgfWt53ToTUZzb5XztLdPv5TV4PfJCU0+TfIHtnuwelkzxl87EkE1JgpXwlVfcjSk6/8Tjrvg1iCTNo6Y0uDnMUKcChp5Jt4jjpPW2rsS+V5Gwp1IXq6Hlauk9Ql2n5S9juk3BC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTDZn2Mk; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTDZn2Mk"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-354ba08cfd1so8155763eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792041651; x=1792646451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=gTDZn2Mk/PS1sTuvi90n4mjXrrr2ikyhlmgrnzrZwnoZYcCVtBc7Q8gy+YzYHp7czJ
         gEEjmVsTjcC/Hccd7L0sIBTkahQcrRlb/Y2SvNN2/ka4U2GmKbpCbBGnyNHO28rRObwW
         E6/npQwf2X9LyWggYeQYSbcYND1k3JGwovcam5rOHvnctN/mpEemfuxu3T5ChrEXeUpm
         G8ZO8UVW6QCbGeSmr+i7E2tgl1iKK6xlrhvovZWeMVZ4FCV8ZmIDhZqqvgIoTOBuwvVO
         KmDtf+1CUdxS6cwN+Z05FMaDyb5TG2wBKTqXcV8Kh2HFYFyhTQMn+hA+MGLdVxR7NiXb
         mXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792041651; x=1792646451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvcz145bWmmDM17NuFw1MIOBpRinQuOt1aSfmpsmn2w=;
        b=vUQJ4Nh1ukWZRle56Cgh9dq2QI/0sayXh1SzcoC8FXQMpWmRsp+5uTXFxOy2e0d9+p
         KYxIhEJkkRIwTe4Lm3q1HSs4tBoPQoC2YiLLZRFB0BQLTqU5BSDHEHS3jbB0qRb+lTvV
         QsVEZ3T8wq7XFKZbgWspORJOQmkDOtiS4YDlQanMDGfKXJhQ5bFk0FUabDv+mLiVbpqD
         bNREn5v5pd5xB8VGCmJfB4YFI7XVOxzV0yPAevqCW003ss1q/cMWtG/2h8U5jurpwFYy
         C2/qO5o0Wz0hc5jviWdr+86e6hvEANM+Qj9GiqXBo4Shg/sGOD+eUbv0fKVfYql6Dg4a
         dszA==
X-Forwarded-Encrypted: i=1; AKwUvBwZ6uwZDooormHbyjvCVrw67u3BfDDv3ljvlclKlSKmkcS/14j/Ywo2gw+/DQGtnTRFpit5HuohJyyAaZo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDKzDpb+ykwCMEVRd0DD3zeIbK5GTJ8bXeNA96U8wx2a9T19gp
	XDHztmynokg1i3rKPGEyCEMWStmbWfVJQ5/4Rdklhded+lRWd0gB8ZYX
X-Gm-Gg: AYBFou3GBpiEVHgSo4bnBztIHxm62px/57XWk6jJ6mda8+PU/Q4W2OfO5hdRd46W8vu
	9O5ydqRQERVSXfJVVBfQ+orWmV+EKTDnJeMQAF32x5HwszrDJrFP8U+D/UAJQBzWNXWuwdZ4ry1
	rQ0ULATmdTxf+rRwtiYy0uXLUIeFP2dWbLp463AwlXr1jFyXaNKOLaA+1UK6juZ2zITqguOd5TY
	r9GgyoZNAGD7eh+hoXBriMUM3lKHTfzk2TjZIAyEl/BIG7AtUjODu/sOx7JBF6OKrAvaNkrgE5o
	RuV9Dx8Jd7g5YGGe5LPix4QTTQnLI/EAPsIkO4FVp3OVIxu69BrMXm2dPWVANxdO23v4a5VLg7y
	93Kl/zzNs1Ei/MHtMn8sPEYO0Bcqc47cSqaGKbiseXDwDQqYMw0zq04A2uxgsKVzRuNYOVkqRm2
	S+h9Fnf+ARgYOpGjnmBUmMvq0ry/Z/YrLXj45riy6WMAa1L5lPSjvleRRcucyokIJTLPTGkmQD5
	UwRobMvKi6Uwh7y1wRm5Wk7Q8mb3u/AiUQ22zCQoWRA8y8NbPRxzBY=
X-Received: by 2002:a05:7301:6e98:b0:33c:e74:4624 with SMTP id 5a478bee46e88-3537e112919mr25527157eec.27.1792041651470;
        Wed, 14 Oct 2026 22:20:51 -0700 (PDT)
Received: from localhost.localdomain ([152.59.223.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35de709d928sm12923112eec.25.2026.10.14.22.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:20:50 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 4/6] dt-bindings: interrupt-controller: qcom,pdc: Document SM7250 PDC
Date: Thu, 15 Oct 2026 05:19:24 +0000
Message-ID: <20261015051926.13752-5-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015051926.13752-1-sreeshankar0910@gmail.com>
References: <20261015051926.13752-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the PDC block on the SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49d4..c30b88589 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -50,6 +50,7 @@ properties:
           - qcom,sdx75-pdc
           - qcom,sm4450-pdc
           - qcom,sm6350-pdc
+          - qcom,sm7250-pdc
           - qcom,sm8150-pdc
           - qcom,sm8250-pdc
           - qcom,sm8350-pdc
-- 
2.43.0

