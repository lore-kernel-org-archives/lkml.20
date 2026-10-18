Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5960429CE6
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297853; cv=none; b=eO43p43OJO1hcHPwZVpwD17Ttdqb9vvv2VAjICQ8ZXYIQPaBYwBSAtUPPFs46aGGCa2VoJJxDh3L1duPqaC3411INVUpyT8r1+3I1AFIg+I8oAK/EdqSsqLeaQ6rQOs/tYQjse7d+ZJL0f00Hwbo05gXfaDsNd3vtJ+YhW/rB2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297853; c=relaxed/simple;
	bh=V1PrfALe+dXwVq1n5n/hITI7hGqfkZud86/hme5sr+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uUYqQoh+M6gJCuIrPwzhRi7VGRLzcXlUXlkxPz84sKp7IsglkPpvbD4iYCZ0Ez1vvIgrge6bCBRNChOIUIatAsaQpeHXaO/bOCIUCsiSGR/aX9DiqockZ7DQbxKzW/9T/R9yJvmcG3F1WGbRcUvsG4bojWavltoZInyzw0ZW6ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiDHFkgK; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiDHFkgK"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso5014665ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297839; x=1792902639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyrovHosLdX2LQj1aC6ideMoPUaKKiI6CstREEz9Rbg=;
        b=AiDHFkgKgTtqrGV/pACAL8QeR3YGPRzDSBXywJIF6f9wfJDwzDVmmEddWI7PaShnbd
         FJfNZegkH5+dPNJ0D8nk1v3ZdwFxch0q52MQT7/hYQzyhKQq8jtd82zlF4CXxVfXvKWx
         wn/g2h7k6n3MM0gnrZfZZdFggOZ11slw9R33iORWeRbQ0My5xTBsVB5ECIduL/NyMhdy
         1Q00tCIjUUfK0Ay+r5X2L0USJGGMG8XD3vngyUm5DXHkKDsKws6P0oH64zx+5+w06cMz
         DmRGB3zUPzZZUFx2DwV8xDpbIr9dTUFzO6V6bKQfAJb7I8814WTsxNtOT2k/98ojtfz7
         zWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297839; x=1792902639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyrovHosLdX2LQj1aC6ideMoPUaKKiI6CstREEz9Rbg=;
        b=vUe1whQuX5x6Wtl1hLinPcYU9bku6y5LeuTCGgGg3+p1oGRtC5eqpINqeuCR4s1TUU
         4JXQ3k6TCb8crU4W+ggIBfisFIlKoVNi8KoDb55ZRmkl7pu0QSHY9Jqqmc+/RPY8sJer
         PsF1PDhQLpgx9QvhRbbBRdtiqqSFvokRt+2YokiHilgWZbt6chA2OkJ+GIUgLF4zJZy3
         CtPaHaw/fyPCDDmL9ASh2VCESeUTZsEX8gnyPKIXQMWC+oMv4OQCj0ON+aI7TLvp6JM9
         1tZxHvNnnn3zXI9+7pvRnVFCvYgOsWQ7RoCpB3i1WaWo6J0eMkr1f8F2jUXn9MTakxzo
         wuBQ==
X-Forwarded-Encrypted: i=1; AKwUvBz00Z1AVbCW4ZFxYzpIjDt8CSroE5d8ZeAh3rL4VXw0iVD4G0KaUGwc6eW8VT+9Qq+KnJd87z7BAIvo4OI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWPjkXfwtlV+H5udksMrU7I5ZCfliD7T7b9p8s5i9H3qWDx9uE
	P74JtHCc8BCKl1H8XB0ODLR5BoK7W+j3Qc0Me86mB3LRIh7OgpkR+65w
X-Gm-Gg: AYBFou0BDkPoiENcys4kMvwOLygRtt34C3m/TNQC5e6JY2s2d0J61nQgJo/jIr+HtjZ
	T16mIK88CRHtqYnRhknFzK5XaXFkPp0rUDyb1kMS0HXLhJOA6oDdpPFPRhVqUYUupN1l0oKpvRX
	1qvXFe2AsC5wrG8mu9Hdz9EafAnfELf80VRL4dTBJtwou5svg8vRWER7N4buJiQg2yakG4Lag5M
	ZlGMDbI1j28FmpUJStId3uETD0dv2imkMvYYgqahB7rA+jP0WabNlmMC1nTX7Tv6PJEDddMwq6c
	u1LgbrmiFsvRC/AxQ4KIpTFvNX3+zOUEtTroXn6Bk5ate3HH+L3x165aM44xgAIo+ks7PN59swP
	LKMXCU7fHD7MFbcYVzNQLrV9ktUSrTAo+yzFzAOtvtLg3Zs2a6yOp1drpipeiS+vr0EjUgyedhz
	oat48B/HUifqRFlOqnF7rcSFuOgulNOatl4JkDCtUR0ACeFv0bxPso6ZTamwtpTkI=
X-Received: by 2002:a17:90b:380b:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3acef14451fmr3843389a91.24.1792297839161;
        Sat, 17 Oct 2026 21:30:39 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:8841:a092:12c2:47d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9e47588sm5885369a91.1.2026.10.17.21.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:30:38 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sun, 18 Oct 2026 04:29:24 +0000
Subject: [PATCH v2 4/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-psci-fix-v2-4-35f65b59eb9a@gmail.com>
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
index f0771187d0..7730977e6e 100644
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
2.55.0

