Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5BF3F58E5
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297834; cv=none; b=IG1HaKvLOx1HgoLpFFKKWUyxv+plK8RX1NOQS1YjfHj895PXZZAo9oAr10G9S0O/JENAZJlRIB1seVaUw8HLnbzCDlXWxNU6VJq8WS90NRLtxV9wEnrRq+x8VJ6kqzdKZX2gAHPsQWQNKZh4yqHixIghU+p53tQJRfFpI5FQxq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297834; c=relaxed/simple;
	bh=BGOJLVXVccbwwnFWY84JCzL1yNcyYfyrD1jQgZCkXjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c49npPP1N24QrjM0Ds+R7T4AD0jsdFlSOen5qkP5PO0cNCT2bK+uvqXLNjhr3FDSnXXHpkfjm0Kis//kU4MK18GeySh9wK30uTFh5AtKmkOo+IYRSmjKsr/jiiPKGO+6IhVqqLSgx6qjpWllJclSh3oVo9Yw+66A7hdF2ipJcL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCMbhNkG; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCMbhNkG"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3a4cdc9025bso743953a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297831; x=1792902631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRLqlklMHo9ZCSuWpQYdrWIL15ypvdyDW0jPICD6Gas=;
        b=gCMbhNkGSsOdH9aYXpH/1IxtdqUaBox/YbQOaKqvTAHpI/tXkOTYO7fEBH31xyAxBJ
         RbjWs+ZovgL3sNqTm5dka6YGtCPRbBjPa19FurcZEk5jkDgmzypapmyu/jPrSk9XQH2X
         PeDR8/fgA/BWBOR5z9i9ZC/h8sqNIM3Q0iccFvHIuFPaSTqjfPt/jVb+7mWayaFN8sJQ
         7ggHKmlNR5cTnKJthFPMBx0kSkJ984JJ/11nlX+sp39KF3/ob9HKhYyNVIhx0iMx7g30
         2AkFUGrp/P1PlIKpxnsjUhZd3RF/nkuIAfqjaMh/7rKedTcD7RQF0kZeoz0or9UislhQ
         RE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297831; x=1792902631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nRLqlklMHo9ZCSuWpQYdrWIL15ypvdyDW0jPICD6Gas=;
        b=igfBAJ+DCCfNp+N4UBpScWu72R8GYByrZdz1B9mxD5QMEd5mZPoD6Dly1juQg0VFiY
         8oLFZaOZms3yAmSQDHft6te71Uyp99DrZZK+kfesICr2zhgQGSjzyvjF3pD9HjKvFweR
         wus9OxBAyNwyvY7mTVVAIuObDOCliukMmgDZeulOPWLNG7hqVXxEG4/d9p/ZNPGxFkDz
         SUNdThYKm/smPKo/M88R6ot+eY5jNGoSudbWQxMMObTFdkEeDfjbPwQy+bcPv41rTLR/
         gzkDx6LHEmtHDJQWcYJtBKnjIxZ7wrkAGKvK6benA90Brl5CFSw+K2LNgRj/EG37oh6k
         5hug==
X-Forwarded-Encrypted: i=1; AKwUvByjOSx5egobEML9oP7uf6VyuylxZ17QI+kt7tl+KtgjBGdLozScK8OPATRFo6P/7Z1VJDmTHoo/TcUxcug=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0j76/xJItyEfuanJ6K0MhDuHIie5YTLwGGy+WOLC/KTm8+dqg
	4yScQ94dnZuGetDRV0dU66tdkT6KjyQGpRmylKLmDNAgSsBQ5qMJIJE0
X-Gm-Gg: AYBFou1PndfYmp2firKdFif4/QvepN5gmVfR6YHzTwtpwTS3rK+/dz4QJGv7rYELc72
	P7JGSaRB1b4efyYnX/X8Fam+SdaOYLXOVbvyutlrvAaLz2B4AgmgQDgy9HRH9DVkjaJSNmxIzqg
	ytwZ3CJjr/7SYXcUP/J7YDMjIpVNH7M85BKZhEgXEvvLllXdRc0XeOEfl5IF+1fuaF5/mG8tBSo
	W6Rmk+JZxSjC2ruM4B2hOM088egj6Dh+oCDIz6Msyio+fr54M6LkaFa5Zs+4t9IHXZosqNxxmnc
	xG50QgJuzwBjMlqXGUr5cbZC0r0oSKH1nm7ZTfX2biYlBqMdPnaUouX04sB4No7XWZs90qrsKMa
	4vBkhb/PaBqI3YQzm8LuL96O//I0lCvtBebU2NgF+ka9SSqcDzLzau/B6Sotvnhi/xdf41B3IP4
	VAXtNwI0WgTxrqiveZm3ArjV2SKP0x7u06HhTWWnQ4py0PgXZdf0UPM3sQSwG/At8=
X-Received: by 2002:a17:90b:5870:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3aceefc0547mr3380131a91.13.1792297830714;
        Sat, 17 Oct 2026 21:30:30 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:8841:a092:12c2:47d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm5885369a91.1.2026.10.17.21.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:30:30 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sun, 18 Oct 2026 04:29:23 +0000
Subject: [PATCH v2 3/4] arm64: dts: qcom: Skip suspend mode switch on
 MSM8917 and MSM8937
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-psci-fix-v2-3-35f65b59eb9a@gmail.com>
References: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
In-Reply-To: <20261018-psci-fix-v2-0-35f65b59eb9a@gmail.com>
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
 linux-arm-msm@vger.kernel.org, Reza Kurniawan <imkyufie@gmail.com>
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

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8937.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index a2907f8a63..f0771187d0 100644
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
2.55.0

