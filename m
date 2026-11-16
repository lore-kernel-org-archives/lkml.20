Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794807308;
	b=v+4dJYGwQ19xufDuozCZ0dPxraTAzb5OAvYbkG6IrYISjtHQxiDa+RtvHE4oDMvuBHav
	 vCuvCv2/7qBCehM+G7NC6UiA/Rgxiu7k8hhjnSKyjI6RSlspmiS8FB39k/AhXR1oAMb2F
	 DX2g8gqOsTDj2SpeUE9vWw8GlMah8dVnfxq8QOw1Yq2LzHb8T3usU7K5KjzhMDc3ewH9g
	 FQhntnbhu3VCPqZ+CNX8lgnKUP90oUgfSgrYIxIHnAHFJ7IYJWP0z6rI4wMs2VOB+7ijU
	 Vc2+/3ZADQNyVpOz/L0X62MCIDRm7gZ6CbbjQUEI4sQJTwC85YI1ABxNNiaEa7EUCYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794807308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
	b=w9XRy5XDJtebcmteczT2PNrBc5Dys0kyasiC1MxM3l09hgHmaUTksNNxWEgrlwqlWIU+
	 +rfWFx8eHbDQAtAetq61h7q9LdiMFRHhl9lvBnh6tS2XVukn0R5qaOEyED9roWKth9naq
	 rSg17eyg3M4zRH9Dn2N1O+1NN0rbma7oyzEPLPAoZ341C0sdbBKzBay/L4b4VgG8ZrzKe
	 hgSmfvBL21biT4dTs2Z4DI8OMAtVD/jZp/ZbEamwEdsjFhuDxQ32lVnxRRblMgsS1AuoF
	 Fh8qwYObvtwvucQjmMGwrhep6/cijnOBrORYXL4oj5x1EFkPkKiX4Lh4BHg5xayiJCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gtmcJfzq;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A92606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7A92606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gtmcJfzq
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so3331295c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794807307; x=1795412107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=gtmcJfzqFlYh9d0VyRYPkwL85gT8VgY6z67ijGu0jwBTfoh7XzAVMXNXtbceVD7vBK
         f/LFyzuhqMPw4pUswhDVWBTqw5YAktZY95axELCGP4ZJfLye3mbWg5PqX14PvIfPXvFD
         jifUYkREMx9ZUNpGakCHIaadFE3zXgmzrZ7cbIY8OJpF2ivHHcKk9xQ0YV24MUePsMW3
         T/PAG/AnY0bCp/qwlfZoGiCYv0exUXKlbnNLJpEhnGniPB+aIcHv9/sVgWo/4jL26N2Q
         sr4YXYbzvWguag/oMlcsj1W3t89G3muDcdGN9bywCRTIqdRkp7RJUsRbNEOtlHmxO7l2
         3mTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794807307; x=1795412107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S0rPbDJDlkerZ4MNM0EC/3GcwzUG+YsiEl+gjmvqeKs=;
        b=IyYZgbGkXM1meAJlWn6p22ndpQMaTWCAm7hm1XH16ixA1oY/+Gk8yMud6E8f9MoOTL
         PaMgsKJE9zdJ7GhdNnN+Y7aLO/Sh0y9jjYtp2yT1uFcMuP3LZzTG+71yW3r0oC9lYAcv
         AxvECOub+40cSWkLlI+WO6KIh42EVb5Ztg1nU5AcdC5AWwCZz0AreADKgUabzQyBIPHe
         a0Wq+2TaTcMZDSMB6kGwkZOedXLbGbiQcB+XTr0hnEWQCOin7CL7HAz6jE6Ej8Ee0E84
         Q5VMlpdIHCYGwE68Hz2aY4M2swb0bx3gLRiZxFzZr8C5DhU9AMxK0PE4/BESacDMpggN
         Bxhw==
X-Forwarded-Encrypted: i=1; AL+hErHXnvKqKFvzPGL3LzC8XXrEPrlgArDILYYO7iINxIw6h9Cnnwd3er9kLchJg76r927bjntsXZta4HkvIXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JKQwtFirAygDH/WX44ITjtJ9sqf+fENBXYdyfqIDgQNDN6SYK
	0GCt4R9+m2DAtMjU16xbSoe1f604/ZqN7v2Y/EZZzwrDE9neMe1V745q
X-Gm-Gg: AYBFou1wAnGLMK9Gkvbba4y2bMqmoz8Y40rSQ/X6/sqgkiL7I2qcR6KudJcWJGMmE2t
	lpy/K6Ht/v9PYc+90pkB6rgze0EtvzEUxq7tcZtT/P01r7vBS6Hi1T4tI54Y3tBtC7dJPaHLeq5
	vTf1RdIlveJeAIEgRL6ZyDaIaM06NPaJgDXS0HPUauc5Jehpmd4M097bjxuy9qxh1nwrBoXGPKr
	CVNsK/V8EXy4B1xCQG4R5aEKHr6FSZnF+CwDoWq1DvI5QG1LdpgXnbNMKcnfz07lkl8IHz1LOQN
	7DYwIGBhON0Yy9aLd+VO9QYDGK5rKlZ2zJhMhRQ21OqkikDMYkLnl0GpygdoTxtv0SSnk7lLdpi
	jT8pdvLyAwsP3HV2GBPPAFYlkcx7RFuEQ3ajHsu01hYE/I1tqOXIJQpENDPCvnGvFaZpf3tweaK
	PfREeZk2fW2pyrdTGkiLISUtbZ0GAYypRQ+UByCQs0IL36wCbg4ZkPQRYwAghpWvtmsM9h5nDlP
	a7wI6XKntF5ITIBzKrPXryaFL0vfgUnxO2oqjXxDu4V5zNhf7Jpa9zBCQ87ivs6pQIMyYEKrzJ2
	Ju3E62L3mZbT/lvA4qLuMvCyR4hFrkkZrPX0yEeusSJwtgO9wWEXg7//T89nfxgTJN+UyLvPBZ9
	Hxx4u
X-Received: by 2002:a05:701a:cccc:20b0:1b5:32d7:7d73 with SMTP id a92af1059eb24-1b532d780bbmr1029121c88.30.1794807306985;
        Sun, 15 Nov 2026 21:35:06 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.206.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm33463380c88.5.2026.11.15.21.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:35:06 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 16 Nov 2026 05:33:51 +0000
Subject: [PATCH v15 7/8] dt-bindings: cpufreq: qcom-hw: Document SM7250
 cpufreq hardware
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
Message-Id: <20261116-sm7250-v15-7-6acbb232fef8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794807229; l=1157;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=tYOW7ZwAVWXKL25nNQ4vkjon/atY4Dhfdawj8MhM0Nc=;
 b=hoggoWb5jYIyIe6oCAJ+uw0gr7l4FQRLq2gxxhWWrRSTin9c8YLMUPS0qAHLKvjnJhZnO3guj
 zwZPzqxzYjzAoNywaOEbGWxmFGqS3ST3v5/P7mGL67kEI0MsM+mhyK6
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Document the cpufreq hardware on the SM7250 SoC.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..f8cdb652f 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
 
@@ -201,6 +202,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sm7250-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
     then:
       properties:

-- 
2.43.0

