Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662103;
	b=I3oOb1PTjO+TWOa85F8b24E02WHbnjX5gDxJwB2jjQ4tMuik/6xh0/1aiRT5Xzm6F80G
	 rolnvUSMP3kP7bY+RdoaXp1YQbTFkGA9OvNSKYEfECGpmvkNq5ZwOc7uUG/4oIr+RJm/s
	 HDZv7yYyr5xXWONwUPT0k7e/EILzCPmpK/FBcrIqfkiJce1t+CJfeTyeHKB1Km+QWXIml
	 jTOgx1aGGjmJNt1uxDiUqEqHDQRpp60G+1c6OJ5a/zGVCvK/3eA6sYL2kcpQlaVa7BZ+C
	 pF5tSvNFgHIqwPvfqu7PzEdWLDTQC2YVGRIeG01jvgmsL/LlSr+fBb/0ne4bG+8Jhag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OYDgm4R1tjaY+JvgEyu2MMXdyhh68gFfDYeaLIp9hAE=;
	b=krIgbXpSyWoGuHDYfihEfGo7gxFiHdFLUdykJD6/9sU6n3KM0pRCrhVrYlEFt41sxyPA
	 bioF5riXJDV4z5eFt9U4D/JW7LZedyd1u4EtSGXlk6re5MJ0YMJtvXYe/BDlunk/sszTU
	 Sm0boIJEZWc5oNSFZx6bNn0ful0bx/nAyQD6uU74bV6DOnXWJZmSBaasfKmixx4u6YMlF
	 2iSml/bB9kSZ7WIDPlDvbRVCxJZmk9KAUw2N6Swcoe2irrU2qH9oIsKXe9zyzJpLmgzgW
	 ZKUyJfg1OH00tV8k5l6aVq2N2iMYPSfN9dLEoz5lHo6840MEFbluv7PPq44SKXyJS0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ft85iyEp;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5CC606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C5CC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ft85iyEp
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9d7791b00so7405235ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662102; x=1793266902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYDgm4R1tjaY+JvgEyu2MMXdyhh68gFfDYeaLIp9hAE=;
        b=Ft85iyEp/12SfLEwAij9mE92Qr0ZiQXzSmTKtFfmLaSrmJxg1uOe4AbPE77e1Efbza
         WlbgZCwprEcvIugCo3kFPmDksaKpGt05pcesVs+k5n2Qarm/yYZkLa+R1KhJXOlFsQMW
         2pZYasxHMnAIPQsFFEQ7SxM5pU39s8R8rEw3PAPDt80ATC+3qvJHWeov/M0NBoGUAgMn
         9OjDc8Dbd5x1jP3dkG61kmki85Vrn3IfBSKbHNghQVJD6ZM7tOISdEKQcgI3UyC09lLP
         X36CYvLY2uTLdDnutUqm7V9mvt+FSIWsf2nVyk8i5Lh/sxNiPn81hIdU5SuAmalUX/cY
         S2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662102; x=1793266902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYDgm4R1tjaY+JvgEyu2MMXdyhh68gFfDYeaLIp9hAE=;
        b=oD3FYHv8mfHLrDgo4Mnjk2kQt0XEf1GoHQIxBG6kZDcL25xQIqNDUCZEwPjbswg8U9
         WyQ8Os3nJiY2adwCyzmB0gBp6g3PNIQyL578W+A+cMLvsyrEaDXBDVNEqwZr/Ulp8dCC
         W5rvH7iIphKSBpjtZ5W/NIpJ26d4Uu44OuJ8zEKLRQz27X43qKkyt/TRJIKrvF7p/E6l
         Wdi56DOrEVi5EI6UWClh1RL4PG09+0krsiqNBy9X3cFLCv8I4768WayToy2bozTShskt
         UEzt92xC06GzftQ0N2Dj2qISJtBCkPLyXmVFmF9WV7sV/Fxas/XSqSLiFkV4s9XRWJXp
         DGUg==
X-Forwarded-Encrypted: i=1; AKwUvByeZywIrPijNvUVDU61BRYe1A57eww+b43A8RHN2mGUDfUGdB6IbkOGZqdkFMBU3ecH/s20jKknSB7kNDo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1WMiN78g5fQeNLpTyIX+CFlZllZggELd76rRz+Zu0rjvLGB1Z
	pIC/T6f3o9o6CPRyhRj3ofoHONcnPglermW0SvUXhncpMPWUW9hvdTXY
X-Gm-Gg: AYBFou0EkdIguhe8eV+XmSGQSN1XyfMKHbgEDY/7fomNoAf62QfkoJ6TzKo2U3kZeFu
	5jm1c8YsFEel16mZKg4/MPAbM8TggaQYgDiEZk+EcVKW7771VH4RduUEMrXPl0aqkNcrCafZeEy
	huiTDlYfzpaEjddXNEj/zAQudqkH4r1SUd0uLKSZ+waKK/dkG4aYW/NjSkG8A8k6Pk4pDRdaLZr
	SWoJ8N4lfJPg63fHstNz9Ug/7bBFRqj6rhYzuEBnMivUpgkXTVc1GrFon450IFodhKO5v5RAClC
	i6uUb5t8DtvR8vtJomLhsZ3QbZtqEnW+/P/HoKMaFHPHvIoJrQdbqGAnI1eA55uXmbJClipXraa
	jiBeo9+edjpE/sALTvnkwnBQvLM2bqntWiqldoqdmVSgU4IWrhIs85tXv8sjfPSoY6Z35RHiveg
	K8nvAPb9LyiRYBo0cOEPmnkbdiVHwi/MPtZJ8ZhyAvApsEH+JAeOxpBZ9ln8rmOJZzL7yChm4xn
	sjhyg1BF/+pM0ZE90h1XW7fBPlj5O51MiQsKi6X0XslcBdo
X-Received: by 2002:a17:902:da8a:b0:2e9:660b:35a with SMTP id d9443c01a7336-2ea437b199fmr37175735ad.3.1792662102554;
        Thu, 22 Oct 2026 02:41:42 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:41:42 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Thu, 22 Oct 2026 09:41:10 +0000
Subject: [PATCH v3 1/4] dt-bindings: arm: psci: Add
 skip-suspend-mode-switch property
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
Message-Id: <20261022-psci-fix-v3-1-9ce2133c5659@gmail.com>
References: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
In-Reply-To: <20261022-psci-fix-v3-0-9ce2133c5659@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Val Packett <val@packett.cool>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Alejandro Tafalla <atafalla@dnyon.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

From: Alejandro Tafalla <atafalla@dnyon.com>

On some SoCs (e.g. Qualcomm MSM8917 and MSM8937), PSCI_FEATURES reports
that OS-initiated mode is supported, but every PSCI_SET_SUSPEND_MODE
call is rejected with NOT_SUPPORTED.

PSCI provides no call to read back the current suspend mode, so the OS
cannot tell which mode the firmware is operating in or why the switch
is rejected.

Add an optional flag that tells the OS not to issue
PSCI_SET_SUSPEND_MODE on such firmware.

Signed-off-by: Alejandro Tafalla <atafalla@dnyon.com>
[Reza Kurniawan: split out the patch, rewrote the property description,
 renamed the property]
Co-developed-by: Reza Kurniawan <imkyufie@gmail.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81..2eee38d155 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,19 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  skip-suspend-mode-switch:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Do not issue PSCI_SET_SUSPEND_MODE.
+
+      Some firmware advertises support for OS-initiated mode but rejects
+      every suspend mode switch with NOT_SUPPORTED. Since PSCI cannot report
+      the current mode, the OS cannot verify the state the firmware is in.
+
+      This property is an assertion that the firmware works correctly without
+      a mode switch. This is a workaround for non-compliant firmware, only set
+      it for devices that ship with firmware known to behave this way.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#

-- 
2.56.0

