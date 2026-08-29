Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5657D3AB283
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787996887; cv=none; b=OGPkj7SLR0G0+Vnj0FHo7XCr7PNe/BbwfLvy3VI4QnY7KOnHUjHKKNUkqjmaJGvhsYqb6AcRSTOECXAWTzx7BnnVZoCJplJW58JlUykkYLusIuCJ61C+H0fhxFSdGPtMLOOuF3mMxn+1GuILhZ6SLsC2/waiZPE8GWzuwvwbXBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787996887; c=relaxed/simple;
	bh=uRkFH0DF+K2gkCSbCc3So4UXlflNMUCL+wxSJBWvLro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BsdL5EJ12RmCeqf7fUCLG8BN4NRNlPl09kc+zNJuKMr9Ip6Fd2xPppbwRhPyQcQWhn7AjiDzm1VPlAXKfAkFmeCbbvUPBORjDSgf0w+Mm37AOX3Bv6CwCQcJK7mLVTrhTcEBQ5y3Vdbq5zhNDuc3kt5vFN/OPa+JWFBIgYR4ZI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so13470525e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996883; x=1788601683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w58IcK8ZE/FUFrG95ZGCGEBUQTz0E4TGMIPiEQMb1Vg=;
        b=Kp5a0DnwDgEGV2F2L+kgqpKdJBjw0PXdC1Wm9R0t0XlKJW1SoioTfANI07MkmBRLFM
         AtiWci6IbQzqHSEBFqFOK01MqT/mxht0houEKYu2Bu2bI1eNA5jUUpPjHLvMl6ItM6MZ
         zT8Wut/yadcW20HfSrzR6IwDgW39Bx0iKavRpjOnBvUtZH8/TuYsp82r3TqO8q9p0KLZ
         IQqdimMqkZQEGXQWX1vhuiiNNVf4CBdfeR7ATgeeW5RFvTJSo1YE/81sipSFUduZxVwY
         +2n6aMJeBZqg/HcQNllPCk0mvfpvebFvlDOHF3et3viOVtv3ZxbGLocbzGCOJSYP+AQc
         2JPw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9HQ6nzLDqCxyJhOfJveTpL/h72aVEzKM7CITLYoxoB275wZ6Li3vqxOPCkvFeEs1lRW8R9ObuLXwOEtU=@vger.kernel.org
X-Gm-Message-State: AFuF++lBBZ1OzlrD+ZnKi53JSxg/VPMkuPqPVnlxBzXRuD1JQlqCoEfS
	9uUXmLnsOUBhmXbf3MlTWF18+1OX9AhjrUluOzFaYzMHiqtGnlmZ5rjO
X-Gm-Gg: AR+sD12/90/hCHZ/Y/4mCxC3q9z8E9Uned2WReBO/aT6XYLomXN+IpVAEju9CAUOajD
	YmgUq6wbriLh0fHSV8dLO4aiyZL6/KIAZnROikfkdvOMaBPMS1GTiCJ+G9Vfzi4lthcH9i4x9jE
	IJLjXLMmvWk33TQvdG0rhFOQp5xRiZjGkY9L+BTOKDvIlGKp2KoUFbi9Gt8THFMYpxbQmI/Nw9b
	IkOD0GmioXnhufNQG7ku5A1eO7g+wTyAbcjSDldrnk7ysgMQ1YwmCJl7V9A8ohiJYV8XxlzEQyX
	N6oBAJVbpyCCY5LaySUFBK/zGueyscrBnDA2t4u/nipFAKcsK/FaHgwO5SNZV+wQEFma+5jWtlR
	oDIl/b+iEMc8TmXL4zw+NzXTL0pq6uuEZjFum4FbevHtFuwVapyaNFpcTDLC89cEByznZOSUexz
	1hyYaB2cGCp8yiQ2vCp+mSoW+rRaRpEKkCWYJ/M46MXtw42jpzBEP+E9IpFOPINKgAlkYrZz8Dh
	fq1usPwIZZaSn6mi1hFAAfPrkCzoJCqRCC2qQ==
X-Received: by 2002:a05:600c:8587:b0:499:dbae:43d3 with SMTP id 5b1f17b1804b1-49b91c489bbmr177775515e9.9.1787996883483;
        Sat, 29 Aug 2026 02:48:03 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:02 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: amlogic: t7: fix the pin groups of the vsync PWM
Date: Sat, 29 Aug 2026 10:47:58 +0100
Message-ID: <20260829094758.23248-5-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vsync PWM output can appear on either of two pins, but the
description named a single group that does not exist, so anything using
it would refuse to start.

Name the real groups instead, one entry per pin. No board describes this
output yet, so nothing changes today.

Fixes: 2a2a7b9701a7 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 8c4bd683cce0..719e111bc3dd 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -546,9 +546,17 @@ mux {
 					};
 				};
 
-				pwm_vs_pins: pwm-vs {
+				pwm_vs_y_pins: pwm-vs-y {
 					mux {
-						groups = "pwm_vs";
+						groups = "pwm_vs_y";
+						function = "pwm_vs";
+						bias-disable;
+					};
+				};
+
+				pwm_vs_h_pins: pwm-vs-h {
+					mux {
+						groups = "pwm_vs_h";
 						function = "pwm_vs";
 						bias-disable;
 					};
-- 
2.55.0

