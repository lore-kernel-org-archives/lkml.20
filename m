Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A8A3C1404
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 16:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792255385; cv=none; b=s6R+07pk4G+mDNP6JiTKYPuJMBly0MwCH4TlYuoPcPXu8M8PJqQUa3HafwXH3i7mHWy/iRt8E29AaHd0mCPx39TQwK1ANRWTQ1xOEJ0nu+z0AyyOeWlFzCh6eJcz8JwjqlWXiQ5dADjNNUB2xWjPVw1D4h+v7sZ2ppF69PTtUC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792255385; c=relaxed/simple;
	bh=V1PrfALe+dXwVq1n5n/hITI7hGqfkZud86/hme5sr+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NauPwegHsigiYNv1X59gYiXu9z83eFIM+++T8I53Zoxkdx/8DjS7mHopaX0zzdhHPX6he6DGb5t0lAI29nXCJbyu3YOllGlMKdflFjevQ7uWl+Dk0Vp1AzoWZfSDBH0emfj3ZBfVAD4xKh0+EU+NEE5PXQqocGWEBcI1dpiv5AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z684EGJz; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z684EGJz"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38759bcd877so522456a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 09:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792255383; x=1792860183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyrovHosLdX2LQj1aC6ideMoPUaKKiI6CstREEz9Rbg=;
        b=Z684EGJzahvWTW/dApznEGhNzcZDNeGIMusam1DcH5X2irUvFOTfj07KS3NThy8NU8
         LfSIlw3tFdq4UjNCeWX5F72/LvzMk9XtazIwLlj1oWcZY7OH7fbcttABt4wjPr1idZUJ
         +lfUVDUW/d9u5iogF3S3RIbS8MeKAZPk/hwtWaENxM4CgqSBm4Zgh5W7tA5VyBwd7hoO
         1v9UnMGrY7QesfH4Xc/koXsmrT3r91RKZUIbS88qMekBHHmMczd8+RtQwC27G6G53zj8
         z8XPMyLWbxr/Z3uqkAHrCgy8pCezp2iklrRpdyUmqQ0c3T/WZSfNqtAti7NTTQuyVoff
         8/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255383; x=1792860183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyrovHosLdX2LQj1aC6ideMoPUaKKiI6CstREEz9Rbg=;
        b=DqZIZUEvziHNOaJP4jHdC755T+IIe7QXjMfiHx398V253TKUfaF0V5Bla9VwKX1b92
         W36jh8ctkby5vW/dJ8tgyq2HXn1sITpLdrSZj98npUE3S9jfsiFrJhmAwtFgo2ED2dUW
         fJW0jVW2OUcA0j8Qk68XXRNcA/h9ATPCsdz1vi3PwdDeHWpYw3yJBRFjrmkXsWdp0eWu
         yen5kMJ+OJUm9m87RHsh1Jl+/MSg+6LgoDT5DcKGJKg3P2AWPEN/6ODH8ckmYUaltfw4
         n+STeAW1tLOxGkrOfkAHo6XdtOCl5jinGJ4wnM+nJuEgZG0UL0DvIwp2Uur9Jigv9IIa
         HIMA==
X-Forwarded-Encrypted: i=1; AKwUvBzgngJKLPw71IG0Jkf89vB40qI3tVesOdt0sOPMp4LYm4D8LCFjihxhvgRuwI2pkTpOlParz/cDIYFN8HI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLA9o4TlXwBrnq9JNVSMxfBIgu7adspGcDaMz3gYkKCtwW5ZZO8
	uPd0UF4NXK9I9GIIgp1rjpboMolLVn8X5mT0I20/7DKs/3mTBSGqcs6i
X-Gm-Gg: AYBFou3K6Mn5hgxjP77CcRlX/GaIUoqi5UCieRccLPAYgn9bsYCaFDSYVB2blh/GrTQ
	C/c80Kp6FQNZRzopTb/zBNgwbkUhpoBqLEJ0hiuo6GVJI42W4BoviYlWJtNiDX7QTF06YKn7Y/2
	WJz8R4CdFBYUE5LmXqOgsipl/HXQzQ5PnHLK752DABdDqOLJ+ogaU1RWDNCUtb2dvmfdjRGFmVD
	MUEtx4np66sOLr9QGrIQBtNdI1i3FuHTney9yVHzwIGWTkLBBEqvHR9+euWsz7pjEaLiBm1xA7H
	KfAdAoUCrco5x1hoOY6Q7r3BN4J85vmu7ow9St6OYRxUFY6qwZBt4F4NjZ1zanKwZkJVWFGXIV/
	+iQ1OZF8WdKKYGo7QhRl//BcuLLs30i1m7BvgEBO6LXvintqiXoDoMpcUTtdVuZxoit1EbhwhHQ
	LuRUFrxNfLIY2vQqMcGYqTCrpueRHSPI8ApVQV8uHbq6uP8MgPGM+bPdqsamvL3Q==
X-Received: by 2002:a17:90b:582d:b0:3ac:8897:7b98 with SMTP id 98e67ed59e1d1-3acef1455edmr2772023a91.32.1792255383602;
        Sat, 17 Oct 2026 09:43:03 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:7618:4e1c:2cb7:b2e6:ffb7:d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94798212sm13816164a91.14.2026.10.17.09.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:43:02 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 17 Oct 2026 23:41:26 +0700
Subject: [PATCH 4/4] arm64: dts: qcom: msm8917: Use a shallower cluster
 state to fix unresponsive idle
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-psci-fix-v1-4-dedae27e4a31@gmail.com>
References: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
In-Reply-To: <20261017-psci-fix-v1-0-dedae27e4a31@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Christian Loehle <christian.loehle@arm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
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

