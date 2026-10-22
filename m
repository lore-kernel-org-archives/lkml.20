Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662119;
	b=j8JQSqbp4XY5jcVFp/GWhVIfaJasqf+lW5hUyRjwD7OrSr9xQnXzwre5tD+2ocvdlV1W
	 /DAZNreXQoo/xXisEo82bef0Vs3ZNwY4qoXPgXSUdBOdn85CEyybn0todv+gYTC+/mqZM
	 YcxSyfNC2/g93itQYXlom09zvznsXRt7YcU63tgxEirwl0JcsZuHzh3LMJ+YphZx9GhtT
	 z9+NXCgPM6aPT5+gddPS67hKc7DbeVWsLWIm6VScCgI6qifIGxDB9VjibjzfQk3xcnQ+v
	 y2dhdNu5d15G/crpc5e1Q8Qhim4xie48RIqyqZ+3A9TzQKXPcOjfM+z3YGW13qhSuPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3coeDBrZk8u/krbuiegVJJLUnKMcE1BvLH+6X7PiidU=;
	b=FGTZyHxj7EK6lxsedQJNflxX1QcGjtQCvz1zSO7QpnkLb24M274sO+kC7bbOld6yFb8G
	 cDCrsBGIQstQX15vT2RlWBNJXJua0XPSJg3zzO9qlb2fJSt3wo5Njd6kaEPjZrYjozV95
	 nrvjf1uJ3G1mDKiJAYtsP/MaSl3t9xbRM8Y2AP4/B6sT+qGW+LWgz8Koyj+4VTK6fYwjI
	 HrnwHShXp0hoRY7g5NUJV2sPeaeRl0yCksTeGgv4CmB1VcxOv8sqJmlnOG4orMCzeBMeD
	 2NRUslbsYP19PIYGJTq/PuLOEvVmNpbDlls3KA2wJQBTGptG/vx2dmTw6o9sEX7yFCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LIJPXttu;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1B260A2615
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C1B260A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LIJPXttu
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9f6a16aedso9619015ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662118; x=1793266918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3coeDBrZk8u/krbuiegVJJLUnKMcE1BvLH+6X7PiidU=;
        b=LIJPXttuRUF3aI6VA/GbBvwU/mjQ6tXV3YypQwF+4GRv43301OmIvWAXHrJhFZjeFq
         Vad00cxPu09jBuojeK00Yd8iprJpKIyvwgZLjHrGgqDIxdWFs0Hence8H7TTlUpSX5Oe
         4gWrGNreVcrl56t6kWRkHrgPI3wjH2evjhvDPGfucj48lHepJS39H816/MwkrhPipp8T
         nvAk9NYjyy6CsTD+c0dj0OFIPTRLOXOHmnnmZVPbaSynfhi66ky8kk0inu6PH3mYspIC
         hTF08O9LNCE5EZYsbSPEWGqOVdKGOo+LxlQPaPMBhw4rZ9eqZHIIn2hjmDTZe6Svs0tl
         /1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662118; x=1793266918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3coeDBrZk8u/krbuiegVJJLUnKMcE1BvLH+6X7PiidU=;
        b=Ra2Y41/6SkHhacV3s7/bqZYWD5xRCs++rVNfDRlPPnrXhH8BfCoCvcKZK+42dMTvFA
         2sIM6Y0kZ0/5Ygx0GmC0ZFhTzoKioPb7wuQilsSvPa/9vVH+7bqLrtXspgdAuofDVnx3
         rTwe8YRl+5eKAOB2UQf6JUNmxJiLq0RCigo3YWg3+kn6u45DiZzQjW9iVfS3kQk2EzS5
         LCYmk+Y8MlOeHqRvl8CQ/8RLcPGUkLDQW/yM/99mDCmXoOW0WyRItgrE9/Z1gKqasqP+
         U9Yq/ebIWH5yhUe6L1T/zMbEE0qqGgaxPwCHJE+pHIMmb0DFibr9W9UKkiMDiQVAYr2m
         guSg==
X-Forwarded-Encrypted: i=1; AKwUvByCfNitGigsoOv0vygdpBJl0DZPddP0YyYMzU5cU5xIgzZsA55+wwdwMhWnZJGBs4QxoetPVuB3LV8wL8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyMy74k3hCNAZi4FS9FV0RNqh/faQonNlJDoSFUrQHsYCrj3J6
	FFbyUSgihLAQw1RMoqpwnihEyPRiEc96DW8RWY9TDN+gHCIOvwICVR6m
X-Gm-Gg: AYBFou14pRzb/ZDfFdP49d434lymzVa1kZQiZq2YY5YXfu/zreGefC9LBkTUZilVGGb
	5peHhTMN0XIDeJi0W1QCV87BD4enjcfiOoqw+YRLvhiHeDiS424PyxfrXH9GxZCOqkrGKj9syZA
	jwCJCrbREXsUsKFrxgYjZF07b7qvWo0yPGEUBuBl5UwZ9qd/qZcOfuMTOxqVZObtodF+DxJZXqf
	XErA0pUKY6KF0TfvyXvlcEURCs5Dr1EtCJaJGheaG0UwrXL0PP+25DIK8Nodriw4QtN38TJy9nC
	Kcac2908TZS3zo4yqItQOzpZesfoqP28zMeop0taEhIf40tVcbbTR13bOHvski6y3XCU4vwDVw8
	GahHlP357mdVa5RWkF6QMts1AG0yQ+zcWP7vkpIuWADjsDJXR82BzrbfuDeoXz4xliOwNe2wZKI
	wbAhxAokaPKjOH7H+o2XzB/MpaaRbCSJpi0bCv7ay5j7A0AlFBYa9tU+F3L+ywRlxr5xlb23Fmz
	Lwaby9avQSu1TouhP97xVsB3yfgI5b5oaHceUfZF/04xYNM
X-Received: by 2002:a17:902:f683:b0:2e9:5c55:c46a with SMTP id d9443c01a7336-2ea4396c346mr37258705ad.7.1792662117740;
        Thu, 22 Oct 2026 02:41:57 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701f:d27a:ab05:82e0:7670:1951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4356c1sm21483075ad.38.2026.10.22.02.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:41:57 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Thu, 22 Oct 2026 09:41:12 +0000
Subject: [PATCH v3 3/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
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
Message-Id: <20261022-psci-fix-v3-3-9ce2133c5659@gmail.com>
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
 linux-arm-msm@vger.kernel.org, Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

MSM8917 is a single cluster SoC, so powering down the cluster means
powering down the whole system. This causes two problems:

1. The system becomes unresponsive, even to common interrupts. Waking it
   requires an interrupt from the MPM (MSM Power Manager) or scheduling
   the MPM to wake the system later. Linux currently has no way of doing
   the latter, so the cluster may never resume operation.

2. Entering power collapse blanks the screen. When the state is entered
   and exited repeatedly, this shows up as visible flicker.

Even if MPM scheduling were implemented, the second problem would remain
and it wouldn't fix the system being unresponsive at idle.

Replace the idle state with PSCI mode 4 (dubbed GDHS downstream), which
is less aggressive and can wake up from conventional interrupt sources.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index a2907f8a63..06f7e7f57c 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -112,10 +112,10 @@ core3 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
-				arm,psci-suspend-param = <0x41000053>;
-				entry-latency-us = <700>;
-				exit-latency-us = <1000>;
-				min-residency-us = <6500>;
+				arm,psci-suspend-param = <0x41000043>;
+				entry-latency-us = <240>;
+				exit-latency-us = <280>;
+				min-residency-us = <806>;
 			};
 		};
 

-- 
2.56.0

