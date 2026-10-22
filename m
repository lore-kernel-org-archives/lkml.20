Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662126;
	b=tW9ThuaXhCevqUtxBqVSaLUelGZtfldHQvAjdn9tU2dr3RCA7elJHvFkJN7wYhC/KIRF
	 tkPqVHmW04c1/D+TMEjn0RL+d74UiE6yt4WIefnssTWGLI9JmHIrmjLOJydrh6W3X1XIO
	 g4xTAd2q6dveZM9+iuLAR8dcpa1od5lNznL6D8s4+IIlCDkJTYMBTjEEtmRzn7DCBZ3ED
	 6LZncgZlPQkbSuAoV9pFBm5N37QMdSOyOhiSHgkgoF1bpXPFTKKI4QFvMMo1UBEsDzNvu
	 35cF874Vyy2RG/q4Uwv1Xb7btNjBhFRrk0cNzyVeUg9B7+2a9JRvN3wAkvpjVUeRukQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2nt4hBSHpClOgv3HgtYgoEhMhOYNcFrEBCSUvXNxseY=;
	b=NFgnuWGajBbnBk4EJS2AYA9EY1DAmIF2YnFbdc08PiMdCeExz/ScrZS9roCQMlyUhM8K
	 teXP6iE40q0bDRQHbYG+XSL/7wRKEfnMLlsy69/ynv91gFHPsC/LPa5eKMILeH4AbpEnC
	 ATr8BvZOztfD/kmwH+0mjiVDcY1PtMiAxn61TjD6LlhJ6/eMbvNFJRfRLpXas5QrtIUir
	 wGQjIHfvdOiJpgg52yft1aqjd+Ip2OrUq3GPhD2ilkRQ2M6fJ35O7ASfvoSDHn9urkJK4
	 Twv0PI0N4stSMbrN8bTO+9Dm2zP50KP/LR8NSErYJNI+1LdEsdU36qAVs3YXfzvRx9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXN5FGnH;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F40D606A333
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F40D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jXN5FGnH
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9d7791b00so7407175ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662125; x=1793266925; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2nt4hBSHpClOgv3HgtYgoEhMhOYNcFrEBCSUvXNxseY=;
        b=jXN5FGnHRwP+5OJ7cTrRlZff4KAtHfziQlUnTWwd2J3/DzoQH338aRE6AVC3TtWQWS
         4sfhzUWpvN1/untLl6zPcQtwXvrsxdWrdvTw6mYDfYze6ooDK/U5SZ1xP2IRydnaKq8/
         rvrRb5SpwO3oRrLu7b1TWN9h9qbwpLk/5P216h0QTRr5ck0lTWB0SsNUdp8FHX6AGy/1
         Q+WJAEfhDkpylmSvx58DfEd05xu0nrLLEIFpJu2JKt2RVo5zQv5fxLR//YUlgHSJbLxR
         X6YhLYWNCxb/Pf19khjJrMBq01joJ8baqg6WiDNGbtA70nJMj4mKVSFFpjb0j4amgUyd
         n+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662125; x=1793266925;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nt4hBSHpClOgv3HgtYgoEhMhOYNcFrEBCSUvXNxseY=;
        b=Mi6EOs5+Dg3gvli33nDGQoIPmiHM1RdmGFkyoLTA2KUTIQm742HDpyKDSjyJkjuKMD
         cEeKLfHC96kEjNWx1knUl7fkkV5o/HVGbGCS4yBlC4/SPtdNV1Nka/+QaOZ1Aw6GGET4
         lV4uM1PpuRk9Ihf4LwZ1uqRdem+ILP7FkUUtqChd2vMwvE2/eLfb/0NgQUozRfFUz2Wj
         eg26CuE0aWwHOnW0Qo/U0hTRAKhZ1qrPP0VeOh0UqSzq+vY0NNEppLKCeOI2MJSXdgmd
         t8+xZAQETtjqZ3MmjEGep0kBn8NfWf9OjML6LJZPpLq46sTxTnVv84yjhJb+93cpFsd0
         nFUw==
X-Forwarded-Encrypted: i=1; AKwUvBwwqMJV/4M4GKUgF3jcUVm8ztsrqI1GCOxEzrHZQf1+cI9nN7h55nKLv1f3u3iS+pE7UnSgQd+K6kMq8ww=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhtvNWA6yR1TBl5yC8YK1gr8Iq4oI9RgDlSIl2ip9Eo+/hcGcB
	RveThQP/ocjmaul9ONRCADd3q2OtzBR6R03qb7TOWU3A98+2A7K5RYX7
X-Gm-Gg: AYBFou0oItL5N+g/UyaoFhXx7L198PXlAIc+qOFyHcLE3VFnJD3K0LACe774cYNZxfE
	J0dwwCijkwrD4ihLouA4iOLM+3er7BiX2RCqHScgSUPa8OLhaEWSf4vR8xe1/UuoXQ1MmQTHCen
	ig8ow0JWVb/1iUNEzPqg2z3Q+6uSCnJ692e+AfYdle3pKN1M6vkTi/1A5DLC09fdFrOFj018rI4
	9XzSHkxpRUq08laJHEm/U4N+P0RWmkY50os7NeMCa9zaB99nELrqtdS61YqfWlWFDTv8HrX9O/s
	NgtYGr8W1tZjj8NjJqSYE2wCGR4ZLPdf716iWDwJwkPDr9nYsqWgpNsfhm21MCRwJWZRMqW14+x
	4G+VGbwbF6+1bQ0Kns3yq8Z9fP6jAlmtVu67v7kBH8EVlIsIbBidjGh2HwARyliFEQ1kALPoscO
	6IUiYd8MvCm18JTlXNXNv7be5JiZYEEMDYm9YxVE9/m9gv5EquEp+gQJGTp+nYmhdWVEafpt4UD
	Dgb4kePL8PdvZD9QxcOjzrORKAF37vPl1tENcIfl+tP2V78
X-Received: by 2002:a17:902:e892:b0:2df:b250:ad9a with SMTP id d9443c01a7336-2ea43cc2bdcmr36258875ad.48.1792662125463;
        Thu, 22 Oct 2026 02:42:05 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:42:05 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Thu, 22 Oct 2026 09:41:13 +0000
Subject: [PATCH v3 4/4] arm64: dts: qcom: Skip suspend mode switch on
 MSM8917 and MSM8937
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
Message-Id: <20261022-psci-fix-v3-4-9ce2133c5659@gmail.com>
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
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

The PSCI firmware on Qualcomm MSM8917 and MSM8937 reports to support
OS-initiated suspend mode but rejects call to PSCI_SET_SUSPEND_MODE with
NOT_SUPPORTED. psci_set_osi_mode() then fails with -EOPNOTSUPP and
probe of psci-cpuidle-domain is aborted:

  psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed
  with error -95

Skip the mode switch on these platforms and continue with the topology
that was already built.

This is expected to be safe since it matches the downstream kernel
behavior, which manages the cluster power level in addition to the CPU
power level, just like Linux does when OSI is supported.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index 06f7e7f57c..7730977e6e 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -182,6 +182,7 @@ pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		skip-suspend-mode-switch;
 
 		cluster_pd: power-domain-cluster {
 			#power-domain-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/msm8937.dtsi b/arch/arm64/boot/dts/qcom/msm8937.dtsi
index 7de6447de4..a66a544f30 100644
--- a/arch/arm64/boot/dts/qcom/msm8937.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8937.dtsi
@@ -311,6 +311,7 @@ pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+		skip-suspend-mode-switch;
 	};
 
 	rpm: remoteproc {

-- 
2.56.0

