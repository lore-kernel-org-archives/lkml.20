Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778411;
	b=V2u3iegiW2ddAFPR0qzM75v/mYPmsjwfoi4rS+lyXhNUKcDCjIhTMfoyL/viWwGqO951
	 4iTbvFr5UbjiqdpqZRy7EMXTNQ0ftanC/v2PZ3c+74kP5jyiyN6zY0iPiHslfoIOcYAL3
	 ciyeq+LwNGgxjiuJFu6/q8yzzJ1ZjpqGuI71N+/GDGPsot7IEkvLwSmbH19e3t8lQquLr
	 adx8Rqgi2Yr4+1EBoDpzYBbyKh/MIaAJrGZ8mqr+Pc1ORjdhSpT3ToMJ8sZfWiXScYvjS
	 BJYSgICPKoRc+IrKaGBITi/8tD4vEvEtdUXdUCjgLpSXynrJiur+NuQOQWNk4NUwXjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
	b=TYkJXuHgzwgM2Ti4+ihUHR7OAzovtM54l3J66yY3hwJzVkx5farJoycgV4Nb2a9c4QQb
	 +iDgGtxCEQu+6Q3zcm5B7XjUjUp8abxvvuJGQTIbQh6Brny9sxojrILaTuUJuaSidqlsU
	 WJ1n+W+6+wWkSV5Psxo8hquZVau77Jv4+ZN7IqnJnAoMpZmLffUIidLwZ/gciszouAk3t
	 GHssHQe7/c8HalTel0EGb2+OIery6OOzuxPPCwRyuPvRu6IfJ+BFVcy/fYu/CAG0vvwQA
	 /MtNE7Aq3MwrskuKCzhP6fUh+m2O2PB3DkEksT7ttQ2FR/0hWCNMg5pJxsMBmNdv0SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sV3ynZL2;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE59606A338
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CE59606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sV3ynZL2
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35c76e9614aso489030eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778409; x=1794383209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=sV3ynZL2djp/uSfXZHC9ADdJ2Xf7y9fXRV3nczxd92MjSP4LgMOOaBP1T9LpwyvOfe
         Znql1e8wAVB0kHXK+wF94w0TqsBJFhULKM90WcGi1ELan/WbL1I8lKhy8sYBVJ+/7Tfi
         W5s7n/F0aBc1icuzGa8GlwKmTIHx8dLKxVmxUCK9eOpP+RFggQsiTgp3pl3z56AWI/6R
         JzpB541XSbN7HUQKzg/FJlevLki2JSj3BLb+sKG/cXdpN43Kxcp2W2EJAmG67WJKyq2G
         hjQPVIsExLqUJmZjlpbdp/nF4Vttuwc6RFL3s01X3cJ+IGFXTMrWZZGkYYrflGWLT0Vn
         y7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778409; x=1794383209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4fFdtJNvcZ6y6D1x1v24LO+4CMQIoUBaMtD1ZPuCLk=;
        b=L1HUXm+cLlAm/yxWuuy1rIzxvU39o4YPlumHjh0szVylDFkszDvxR+xX6HEiw3wcSJ
         ZK3QtDC08Bsoq+FPKMkqYhTafwKXAhHT2pB6qTgX40jtGn1w7ZWnnLZmNC5YAERL0X4a
         vZfNTPwEaGcrLd3TWITEeKNs2A49WsJS54/75W4jGaTYYQwtLUm8ygAKG6FafnfkMLpp
         ZqGernaWHA38ySdrYdC73VhzcLb1S0KtE/zEmAnrAGI9vdwjbiKs9DbBgSEUOL5pt20O
         7R6OYvmQJwV5qjR4qqq0KOGvgmgRIc5AJAZpDeXqkm3xq3+Bk5OprZ7UlrCR5QMiC7dq
         YssQ==
X-Forwarded-Encrypted: i=1; AKwUvByuOaikJ0R8xmn9AI+ZFwP9llzZWgnNHRrslNdPefYA6htXM3AN0tezBgBGpBJmp/t1g/cSpmERRn4/6mA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/jbjgNxAY+eFASca3tCiZuZt8cud0RePXO4vF6WGCXTlLWrV4
	moL1KsQP+jvdqJnTjRzYPc97rn3VqkLM9h6CRXGxDyrdSlfftvlKkEv9CoOzIg==
X-Gm-Gg: AYBFou2Aq35haAYIlbLN5/9dJk8MIigcj/FpwVsAF2DklD461YnANwF+PLGzoU8j7XE
	s7EYkY74lKD7KKwLxDPoHflZb7YKcd+VwbNMjGIb9ssyhhnCm2LuJSw9qBfCJgG85Nj5cqY38zl
	yKcVAu704Z5c3Z+spCgYwJHbkIz2Mdiy6LTcGTC6x+lZKyO+KH2GVlxjnRnWSLUCwVI75ul5Ixe
	w/9MzHfgXsN8u5Uj3BknZaEppvwr/kgkzfd0KVUMgykx8dR6ixR6WbLuvKbsus+jDU/6Rxx1WE5
	ovMQAcF/3RZUhSKiwcwTGNbq8sXJAsc7NlL2XTnuGj4TX21CmbD/jlfh8GTKhRewjKXCaKc3YXH
	nmHorIfSK9qhpkfdAJ0W4+UDRFh5vGdB3x2/qqF8YS69O0LGKZQ5QIk85aRChCsiPlTJOo07AKH
	e3GGqGYGMYtP6axKIZwcclTpcRQxQNQrWLsVdIDN2Mg/7scXtZE8Duzo1Hq2+J1AW+Ep+oI57PE
	tx/UoU4QINgV99sr1Mav590ek+HovYjgNj/dHmEGUeXxdG1PWrIqkbL13+MG2mW7NCjEvarxw+6
	E+ubuRspno1kueSBYcFnA76woiTX9YHY+nN1tujzLYb/Gx6DZxgnInG7hAGjO7LDHUc8kiUGuGK
	o3wGJ/A==
X-Received: by 2002:a05:693c:42d9:b0:369:f18f:3492 with SMTP id 5a478bee46e88-36a423fbc3amr23892888eec.35.1793778409284;
        Tue, 03 Nov 2026 23:46:49 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.204.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm4566016eec.8.2026.11.03.23.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:46:48 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 07:46:06 +0000
Subject: [PATCH v12 3/6] dt-bindings: firmware: qcom,scm: Document SM7250
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
Message-Id: <20261104-master-v12-3-57fbe9eef978@gmail.com>
References: <20261104-master-v12-0-57fbe9eef978@gmail.com>
In-Reply-To: <20261104-master-v12-0-57fbe9eef978@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793778372; l=838;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=n/5l0LzNHQkrbMmziTZYOIF2FEcc8PMKPnj4oscjta0=;
 b=He+lmNaewUvT9cE0bl4y22+ugSs3dJvjKw92KlKpQtRY9AvK5BMkrVzkdj8zXEZl8fG8GPtLL
 uKhSpXXDFh5DROYlAe28kXAKP55HN9uHwz3XLOcdD+pVNlTNmMJWUri
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the SCM compatible for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

