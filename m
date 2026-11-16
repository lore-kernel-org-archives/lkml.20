Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807298;
	b=y3NE7GTjOc1O4B7q2rKBEYr1a9IipfebCJFGw0WMh/5HQoQfTQcCsuncY9gngOR9Cdw0
	 6EhXFs630tvZG9aXsGCJ9j70sYRAa5ikaoB36z2jQaSYwH5byFoOV9OdCtHYazcfDq4zm
	 0kvYqEGEKrRb+EQJD24hslP1AOXxN69uhSKDDLC6Q48Df9MeblZ4xiG781XHeSp4wbEjx
	 /f7+WGijBuuYmX73FBpwqSLiNxuSzR9SKb+8j/HyFudeR4xGnDEJhuLPD+jbMFpsddc6f
	 e5UN5o0VKJeIg1Zx95TolC4PxzYL/iPwaVI8h8CFmWKR32RkzvodbrC9MAO52WzYe/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
	b=cEdrdE9dOMFyVJDEgH4Nd3s5iWYkQmDZgO5OzBfpz5nY3dlXJ7eP9+S/+KFoz4WteiC9
	 0McGuAGGXivF6SbQvJl5G+BTU9HnA3z0MnkQNQJpgqkCur6RF7upuPGMPkoeYkzEU6m7n
	 HERHK+nMsC8AqJCyoV5bkaM2V2RDGIXaXKrtDWL2xFxFJZ6GqqcCVgxUivrjktQRuc1BK
	 guGP9mKXb3GzNJiuV3TIGNoaBGsCepQjlHPs+6eOew9SlWcquOPxcfWtFAJSXJEx2O3SH
	 9x1hiz2wVhVhc7nDWbFVUo9VQ1semnAF3lEyQrekxlfdxHZe0O6JOSgXD6UeHPlKo1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgEkfLmM;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E82606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:34:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11E82606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgEkfLmM
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-170135e43c7so4835906c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807297; x=1795412097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=QgEkfLmMhlXHSaXrEB0rI647/8WJYtvt3ZL7nLXeWKGpzH0ChM+Z2sLkznM6o6l77U
         cIn902Q1pBIMkZPFitNjrvZuw2QwqYqnlmtddITPWhfX9HKYLiTY/EqF8a1ToeGRPZcB
         s33PjUoWn8gqONynWBg4d05aZfkRhr6A6OfcR4yq4Q9L5UioKsKqwiZ60DU0/NgroA9q
         Sdu6OPgMFF70Hmv4Z1JO/Oi5zKNhANjV3I13rE0DxZuZ1yZTPpJxVN6wi7PXPUgW4R20
         YfSMgCxfexW66Qe3CuXnLFZFGR4rdRAcHiTw0YZXvFj4s2s2djNDKAJil/XHvo1RLoAf
         4cEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807297; x=1795412097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOERypWJhWIh0EMLri6y7PTlFgXfpVg7COFVnAl5d1M=;
        b=IN0W0c+EmNX5PH4tjlC5mIO3oqJf6IFSXuF0hl9T4NIeGId82qVp58I090PgSo7X4Q
         sb93ZDldjvsxXxYocMWpM3ozSJMWdpIqlXLBCd1YnSbgKvxmb+paFGhkyzpqwMmRKTCm
         i3B8R0xQHtTRnCXWCmtpvuCy+C4wjgzdy5AZ+AXw1tDO5l4WCnfQE5U/sfdS3CG/92of
         piHpNuwcIjXlBlGZtrhJ2pOUbSJ8gJNrABqpTQc9jLIAgmuHBg2UG4O7PQDzKaNtREha
         RsnFhg05fyPwM9+STO9WOC6zuwKmKq9KYWw0JU8hb0JnQnGJbGyC6zvm2oktFOqfKANu
         KFIw==
X-Forwarded-Encrypted: i=1; AL+hErGFKKEG3TA+w2MUazk+MvK9WUZjRDH1gWjry5tY3sZYvRDzSkJ1BXspOp4rx5qTodWGLlVxhs+EttExYX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z99cqEbWL3L/U/YY/D6ASWEgUe9nVf7pes+/nfXRxvzP8b7Qx7+
	v5WkmEk4vzpgRQmKiqWsgAJkpl8R38MnZZGfdRs77+lVNe9dQF4GR58p
X-Gm-Gg: AYBFou0glv2iMX3gRdS1Vhdg8nY1i38B5k2cfzUGECfhNr/W89S6oOrGLwkWFcgpyb7
	thITyy0ISL3L8Kywy5BN43rIHdxj1LA6xK2ZdZCNO3beHHJSx4RqGAkQ1rIYwSacK4GYD564XPk
	B8nLj4ET72gEwlCRZmK+2az/qYCtgW7jxdSawoWFEne69DCTYhhzYVxcKC4zSK0BO5S2aqQGN/k
	XRrevGvyR1Ufc0EgmQCv53MueESC8+xU0oUD1gVO/L1YaOY7Px+s8eDXP4Uks1k4qcnfT3WmQow
	1b98Kl9J77TA48SZ3+b14duBOLRM13J0MwENbcV2ntWMqHaxzzP4tHQKGB6Ft8vJE/Eup4+x7Br
	ZhwlKAEoU7j7MOX0rwhKyt6zMfUgMcU9rpQy1eLm0LToL/sf+U/Aq8xe8BdVGtaJ+z12SNDInTK
	JDNKVE64lYRS+UcCGtCwHBgujWf/8V7o7Jtb2Ty+gmTL7SmNJZKGJKBumyd84TpV7KliibwJSME
	0djHKfgLNSMwGaMz6GroGGQ/DC9BKK407fbsxDGOgJAUJya6hRNcq+TRd+GVTIYfwDAnA2iR0gh
	t5D8psK3EtdJluth+qbqkJ1AmqiYltVChmQPd1TwstbPqhlOxq2tcK0TfkptOm1ivbyZBlDjJIa
	U2MdH
X-Received: by 2002:a05:701b:2202:b0:1b5:e9d:c641 with SMTP id a92af1059eb24-1b50e9dcabfmr6979275c88.18.1794807297153;
        Sun, 15 Nov 2026 21:34:57 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:34:56 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:50 +0000
Subject: [PATCH v15 6/8] dt-bindings: firmware: qcom,scm: Document SM7250
 SCM
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-sm7250-v15-6-6acbb232fef8@gmail.com>
References: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
In-Reply-To: <20261116-sm7250-v15-0-6acbb232fef8@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807229; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=rejlxjgmjiSGoOQieemcJFRPRnZEl4/NvRv6It0RMUo=;
 b=+oPS+u7aNVKFGbhmW2mW9YMFYA8wj0VjuFaEEsNN19MH2mpLFA9LeS7/pYH3W5tSsVCAi+/dP
 DVlXk6/wjvhD/uXpn/EzjI8ASaJBL7/qCvU3NQ3e7f8GcDRtdKMByIM
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54..ee02a9c20 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -76,6 +76,7 @@ properties:
           - qcom,scm-sm6350
           - qcom,scm-sm6375
           - qcom,scm-sm7150
+          - qcom,scm-sm7250
           - qcom,scm-sm8150
           - qcom,scm-sm8250
           - qcom,scm-sm8350

-- 
2.43.0

