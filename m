Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAA74749D1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254767; cv=none; b=B8/YdS7R+P64rk2OkQ6steH4rHoYU2VEuLqgJPE6uPYKfizYeEFzg06UlTtn8yNreaZifK31qHb+gvfBNIgYbzdE8se0ImIXpbEf+OHLLXpksWWfFnYM5tnAgZX2JnV7UlQ6/H8AFbe7yqTFPeIvWY7/jLZi62xnilBtYec9Sm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254767; c=relaxed/simple;
	bh=ifqmFvQHebUZje8XaAAuBMN9RaGf9xFULb+csDNh1fU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTN22Towmv61fJXR0RZfUjFypI3Tzmwl+sQ9RZ6dw5Fa3xXCifvSHg3vN1qRJamudyVvzstzfVjw2lnW/Uah5Ex3yRLLfPYK1tIl0uis9LxpkcOGz6wyKzHExEqZRMrV5/3cmlwRJmYnjGvJUSVVrVCiuAlPcnSEh9wEtp4iwTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zyc+zb4k; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zyc+zb4k"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39675172593so4013868a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254764; x=1788859564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HJ3g3vUMid02qe6Hj9lnKY1TCRNcUH2lx/tar8eb9o=;
        b=Zyc+zb4k1LF5GQSSIxH8qNodIGxCNU4SxdlhgUkRaMnP2ZI40y4H46QFiXiSZOxcRc
         iiXV2nINb0cs3+yF1Hcl2y0x3D5dH51uQxNpk0MAwZHQBNBb0acO2s+7pdZtSurS0jA3
         44FAIAXDLSvC2U1/143rnhHbG2bDuNQYASzByJJvJmw1nfXgVblmRyKFQ+qCeDIOTAyz
         OlYGoMA5Gi9tn4oc8jNtw8u4z4dRh+TZtZtZDsJ0YO5IVx4pEN0qjpVtrERmTeDy1EGr
         FMla81ClcEEyBb5Y1K9HrRwjh93MO9WuVoJyOvZ0f5kYv1dqHQsTpxU0uyoxoqBU4BAo
         OmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254764; x=1788859564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HJ3g3vUMid02qe6Hj9lnKY1TCRNcUH2lx/tar8eb9o=;
        b=J+mNwG47U+1oCy/b9tJ8NZfyjNct5QfYu3/O4XoY8XpE01Uo5yKWvtA8uNBhfmnYTI
         8sdpWKGKgWs7P2hleSp0L37vlx/qgenbD0ocSx7IIT4yzvQR6sLw6qsWMXBxN9QTzyeE
         dp9cuxL68zCxwk8kvwlERp0Ktb1PKjiPp4BYXK9oVwjWI0W9VRfPbAkVPxb2vjN8HCmM
         hH7DCGSlvnhkBK7ro25QD2HFU8WonMUasFmXJrRmw94rzNoUAKbtmdZEZVoiUHoINhv0
         J1Y0uTXzsoJqGK+N7E8Xl51XA/ukFxjyWuzzQucSTipFZblPdmE6ghTiakUo1PBnabnc
         0iDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyGu5PiW2LxXe7nU6PHrFgB90XOQZJMkW1/xxI7+SExh8vu8ifShOLlUAmlcx+kH5fD5fkZpFy1dKga5Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kllGBD9Xwe9Yx/C5JZtp+DyIxddMmXvXH07Ba5GFOLDbizX1qT
	47+fDEKedQeZqSrm0NAmsmLxyCJEwXJgXBtWgwrUyLnRB7jxc035tkef
X-Gm-Gg: AYBFou1p2TiIi6kwzCaj+BWO+PCB8wUNFuwda+B9D5QdXVWDMPT8mFovoP0GY5LqYkl
	WDzNyVHhGaie5U9Zb0650jm37DXzSDX5SAF+eXVq+f+knD4x7hTGYDQOpmYoC9NQenyJ3ksE2z+
	gEw8WUgMq309uo3GBYBQr154rVkU3QgpFnzYtEZJBvaosT0guNBJu6gk7hbUSWXAArIYtOHj+KH
	3/ga4hAxhdxxHg6Ch9qDTIpkhw8pHxDgeShcFzZ8KpXWY22Qp3EK/z66bWSdQNaq7R0Z35HqMUE
	p3pjB/hkoLY7lZoYfOt0Rac1JMft/573Fz5Bmcbg7oBacNPRk42JZTZ9ILWbko9IJr2l/TkafQa
	kpldHWfOI4T5bmPftJPL2TG79Kwqn6wEepyiYlIHyKyzse2nk+Nqdkexz8zHJK7/ZDurB3T/BVr
	Yy08vlo2H1xl5cCuMI/XCoHxMsIe6ENTmjAnA93jcRTcJbjQcoy7y+gGl+n5h6bLPi+tTB7i+0O
	oAdlvLGZi+m
X-Received: by 2002:a17:90b:538c:b0:398:d6e6:4671 with SMTP id 98e67ed59e1d1-398d6e68870mr24005130a91.25.1788254762915;
        Tue, 01 Sep 2026 02:26:02 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:26:02 -0700 (PDT)
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
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
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
Subject: [PATCH v9 05/12] dt-bindings: clock: qcom,rpmhcc: Document RPMHCC compatible for SM7250
Date: Tue,  1 Sep 2026 09:24:40 +0000
Message-ID: <20260901092447.3028-6-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RPMHCC compatible for clock rpmh driver on Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 2b446aca5..45d3cc861 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,sdx75-rpmh-clk
           - qcom,sm4450-rpmh-clk
           - qcom,sm6350-rpmh-clk
+          - qcom,sm7250-rpmh-clk
           - qcom,sm8150-rpmh-clk
           - qcom,sm8250-rpmh-clk
           - qcom,sm8350-rpmh-clk
-- 
2.43.0

