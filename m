Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792938272;
	b=ZtmU1TnGR5ZmjSzVG2cunBVMKZiBT91VIIMTtzva6Z6jzjqSu7Me4L4UkGgmpL9Ye9wC
	 p2Qzs1si3zfcGE3CddnDAYK7vJ2aRugoISs9kJexN/NiYfHP2teJROhJpsYmsO4/UistO
	 FKt/YrjuoyIQtrX+wm5V889k2HxrNOi4+SFooVLpwuPsaaTAmiTolPWHhQod7yUP4Leq/
	 /i++whF+k3862yNnh/x6B2BW0ltcCw7C03hBP0I+Sh3z7goWh619sb+H2QPdiiyNBvxKF
	 A4dJnXr6jsGcZJlqQSgF7hMcnnsi11OPIvd3j4kjGn3TmAiFO09EvWteXmqYvPgjhYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792938272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
	b=0EViaCFmLOmpwloIOGrSdCA8pecSOxs4DaRjn4QGnqhSkHniVUKKYRgTARl36CeaoTGt
	 A44XHx7PhWtRYr7MLgKRp8rNYq/XR4yPdBT8Ee8BWVOG3Xi9vmd09VYRHws+uAp3hhqbu
	 ao2XVB0cU+2b1N4R+dGPDnITrN/xhY2KoPIwAePHjJyGAAoveDqkfbpU4VfzwqGR6PzV1
	 uqMfXG5GHosJHDDYfnH4Uw/CKWWjUYCAHkSkT+SlCspp292jhh4iMNPXZ10IzLcPtpf9v
	 ND0XDskFKfz5BUsVAAYn3IpSqBHkoUgZQBbMu9/K0sVDazZ0yfimxPCuj0KGjOUXvRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o4r4tRfV;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322A9606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 14:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 322A9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o4r4tRfV
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso7432135e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 07:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938270; x=1793543070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
        b=o4r4tRfVohudZzXlJx9Uvq48Xmd7onLgDhbvSQslDAVQM99ndkTsx96MESG5NmzWh1
         WGucTM0P1nsuq6Afsr3a57aQQsILdFa7EZX2mmsZ/eSLI1zCj6AMV7/7LGYtc53Aqimx
         3kOR3k/VT6g0QyTXpiB9BupKNkvuNEh+2oniESNC5FEZDqTTO7xINc3gbArHs7x3P6b4
         dY3UawtmBR6TcbyXnJ9adfNaNh+xcBqIVAb2Q86VZfNqEPzY5QKHGBOGEg2L4JgjjNC3
         pCXZNst9h+7wnwvj97vxOIDWDmMolmK87GXyUG7pKFundQrraRApeZ4tpqLuhAO95h4v
         mdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938270; x=1793543070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
        b=xkglT/XtjYNiT9+JjAD8p+feXQF2Z7Q+c09+vMSvMgY0JvzgXWoZQn6H/1+/MVW/ku
         s0KA8gwnx0uVp50b4xY/g41mJW/TxAoXpymNZzGtC+4ziya9rr8Ut+MbYab0AZy/u3BP
         oRv6cba6Z1x2E3p2RjVFwugOmQBObdj6AhBcK0Bag00wmXbM+yiD6WP2NNJ0IO6UD/pC
         /5ShA7GB/U7wtEbLm6KT1WsSeLit2K63tvUla3BPKQODgqa1OD6PwZ6Jxb+X4cm19HKD
         Jv59RaR8kHO1k0dgfgYsFXB83CnTXQb7H6QVr7peMhWVdBXGopxhgAuZ8sH89YHSRVk0
         RKkw==
X-Forwarded-Encrypted: i=1; AKwUvByCPs7ETziFI36X7+0w63+prCbQaasdh4P5FEOOFN3KChmK74n4M25/b+BxyWFDdY50YxMvqYueOn3Vhh4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLm7foJcjxPhmaPuSvsY74tO3cc80/9ktwEg+wQbYZWshW4S/0u
	ZOm68TdXRehZHmDSdd/FkXed93MLiOz1AjMKBkxGNRs0gAvMiCHhpo4/
X-Gm-Gg: AYBFou1CTpGqDvQ6PVgZW20KtXbNOW8LY0rUFGPeh/e/i9nogsH6fF3/OoGwtiW6VLv
	RwIOBunnlPLcBjTQRL2vhRRHsf1P5xlhDpzoGU+p5r2iQ7UdeCqE/3sO7ZNy7p0AVo0owr02RdG
	vsu1C9fJqO8qKTGFvIoGE0fpKeCHqb3LNEjIxyJiaYWp6A0hpVLWVol9cASIGUIo6bSN/Xqf1TT
	MwAMhvRZWhvnfYGghLsMYGObZ4WcNj13w1WRFliz7GKw8LQ98mbSaBwwfSrxcEMV1Mbr3wLVCXp
	mPLbw6h8tJXrBcA/3zAdFxmAOVmmmsO7HZK0ipxo/X+He/5PxOV9me5q8RxMAxvn4tjpmLh3DO5
	xsAniwqalHW4FsuZ3tHxJo+39eutD8i8M6rwMPavZlNlDMp+HRUiS8MR6aYsLCvHIsGtbA83+eI
	yr/GTI2zo06n59KBoFzSe/JqzbA3a0HJ2MxytdjNWmrHrHeMu4/BWI5xFK/ZfTt/tR0L8gN77Cf
	4hacRUdUE2QLiZ/fOQo9XiE7Iyl+6Mcypb4UTfpKA1/DeSbXiuz47Ps2XDC/GML9d1MDmLt5w8x
	uD0iXERjnfvngw==
X-Received: by 2002:a05:600c:3491:b0:4a2:40:8d2c with SMTP id 5b1f17b1804b1-4a35acbd31amr73775825e9.26.1792938270408;
        Sun, 25 Oct 2026 07:24:30 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:29 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
Date: Sun, 25 Oct 2026 14:24:12 +0000
Message-ID: <20261025142412.112216-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025142412.112216-1-pmazzini@gmail.com>
References: <20261025142412.112216-1-pmazzini@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PA IRQ bank is not implemented, and the driver now numbers the IRQ
banks from PB. Drop its interrupt.

This reverts commit 6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add
missing GPIO interrupt").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..fc4d714a96ea 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -129,8 +129,7 @@ gpu: gpu@1800000 {
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.52.0

