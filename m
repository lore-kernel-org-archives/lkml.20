Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793321358;
	b=t3CHYJI9uWH4pvq3PubfwUPxodpS97LVU8a03iCU2DHDFSk8SdygRsI2RLqBlQqEqS1q
	 bpbiPWdB+9Ex8bTrMLcUSthjEjfy33xQ6Hx2D1GmEc3aX6uKfgTmLyKYGyEqWpLJQIVNq
	 kLVfQbETyhAlxRqywrGxG7HsF1MlHS6elxfLk1zeDxfPKU5++nAf8nZeSHr7l+hZ5L8WT
	 Xtn2RafWbff6O+f8GZuwF/EvSGN26nCP+aTO9M+ggHQHjNJbTlqLJG+1EGlBqreZQ1Jgd
	 c1nb57bRrew2Ynuy/oUy6j8fVCGtAo1D6hsLNx61dxTOOs1ZSamKen8nwMLUvK7ybvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793321358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NR3OLn3RRpm9Cqw7PJJDQ7C1uwyBOEL9xRH2ABlyeNw=;
	b=bwjueNot9K+Fvxj6T5ws3YIm/dQbCovxs9u/AOvU9BThjyA8kLgcT+8VbihRO4GfptO+
	 fgtNz6kEfIbZwXKi4iNKmldISbE6kUAdYdDAJCjAMW6uHdWGhRV3eQic7nQc+cH+ooFCf
	 pMyfQXns9ZQrFTf5VKccDMb2Szb0AtZqGiCKQ5VUvbwpYaW+yFbZN4cSGC6V6rPU2aby9
	 bHMXjoKVsrB7Yx1YvooT1iTESu2e0C8ZdfzI7nCqYSfJWT6G19HZUub+xC65O1SR/r5Av
	 0Oo6Rexx/hk3zpX4hTNDLxQ9xedvTAAXXkttL99nexoLfoRas5vFfv9/XrgY7zw79jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAPRZtIN;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450C6606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 00:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 450C6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZAPRZtIN
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so562985e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793321356; x=1793926156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NR3OLn3RRpm9Cqw7PJJDQ7C1uwyBOEL9xRH2ABlyeNw=;
        b=ZAPRZtINaBu5ACaiUNxrIJuRhA6KMJwNCSPkWmCoxJb5c0gEk2peNiYOZsGK01uWY+
         JK2ZnAiLSAb9wgzwQu7wlc/KNmORiIqCLdKJ3V8rp7OCu2nPXGMI65YfO0UVDSWkwKkp
         hggTvq/kdfxRCvNZXPbWV4c/lNt1Hm1ObLO2YGUQKgYtgcBHu04P9jxnZNCY0PN0oSEQ
         nVwCfT7dBNFZlMs9EANTSKKJlMKgmsmpFutOSXyPi/LG2hHCLJp2KJ+chRrqTAAefj1G
         yfSySWiT44U8rH86j9iyZgk+d494y2/QJjxmmj9c2MmCUSbD2UoszDsaxxy73i5hvuJQ
         NSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793321356; x=1793926156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NR3OLn3RRpm9Cqw7PJJDQ7C1uwyBOEL9xRH2ABlyeNw=;
        b=LAtA1zxWQTRBkAoo6xG1AReSF9lIHBKBPRxIEdzg4XwQklaadXbHS2hUEiUnsz2XAx
         U3sAMNqXTQ5fFZef158BLCiA0/BoQwoMrzzcNWHYh3bgGgz6N6VLVlQMYJv7FaKIgVKs
         Mi+81baIS2uQ25rnKLG2Kz7Z1dMXb3YQDTI3Ph8dpra2yDoK9EutECtWAkhvse0us9Lc
         /lr2eDKdT8/sQQAms1lwQSAXJoPUk79qvKDZvopiJvGcLRFJJNZCP1ec2SMZIW6nhuEe
         j5nmKp1RhjNK+7IaekVp2MN1b9E2TE8KHPFUyvgaFrhmEtrNz1TZt7LiwgGrbcVJWXVU
         umyA==
X-Forwarded-Encrypted: i=1; AKwUvBzbgPEm4zLSKEWQi/HcTbM832gtlSH8HiAcX+Pk4Pr8V6EelJg8mzbnTC8wd8RtMpBU6M5t6xN+boSvKOs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3M4fdQ+wzPkWYIt3/nGulNNhEgfcxhDcV8R59ioAsTBHuxRZ/
	YYH2ibacHcZ135YzcJTd1vH+DAR5/1hsGq3llfY2hmBdfricSCswnkQe
X-Gm-Gg: AYBFou3iSqTqDo81TwSAgTWNLGxDnN5kO55Y4DVqFWsqy+/gBrSSvGNyGkbvytw0zq5
	pln49K8rxl0gN5ZRhSTs7e/wEq4jl24OtHXviBq42sYzayFf72P3nNYFUB0VMIw0D3PKtsbbHcK
	aa47kVMN+7XpHl6d1EOhqbhnldeEdiRhS02xOuguXNSKoBVuuLsGSc/HAcR6wnbswjLxKN4vhy5
	1Mu46PnYacm4fGlhLhEuzwfQ7CAXuhtQt/+GJaXXcQUajk5UGUNKzo43TP7Qj4V74OXVEcOsmaP
	9FiaXK4QPjflE1QCKK28g/Z8JV5sEQudq+3TaiDgV2u2kfMPDJTIhVBbp31NKsUKae3b5++qvtT
	/SprjWH79T4Js5pYWnOynCJD1AngherIFrEX8KjjBg1WMmwAQF2JqVg3cIK/VW/t0HCsYEn4c7s
	npH6oqS0VDUnZxJqjw9rg2QWhEnIOp1zRfDCqCiDYg/0ShJ8TaFB9lAec6UIFkB5cSgfu039CNG
	RL7EqgOEkJTHhDSRzS0ioJtN3SxPNlzviiy3DTXiD+DAPjm+iWiAoo+kY/SixkxyQalD5n9fPrL
	veBR93fi9FBbOlLJmYveiwAdKF4J6CcfP5R1EZQ4bpMduNhDktkqeZkEiuazn/PhjzVzSzp/X+A
	pXOMrXJY6waL0dDc=
X-Received: by 2002:a5d:5d06:0:b0:48e:2a04:4ea3 with SMTP id ffacd0b85a97d-48e6e2c05e3mr2211332f8f.8.1793321356382;
        Thu, 29 Oct 2026 17:49:16 -0700 (PDT)
Received: from iamyoubutArch (smal-20-b2-v4wan-173097-cust1152.vm20.cable.virginm.net. [77.97.36.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728ddsm158055f8f.9.2026.10.29.17.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 17:49:15 -0700 (PDT)
From: Filippo Falezza <effeffe99@gmail.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: Filippo Falezza <effeffe99@gmail.com>,
	andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v11 0/5] Add initial support for Qualcomm SM7250 SoC
Date: Fri, 30 Oct 2026 00:48:43 +0000
Message-ID: <20261030004903.1068342-1-effeffe99@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261016042432.824-1-sreeshankar0910@gmail.com>
References: <20261016042432.824-1-sreeshankar0910@gmail.com>
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

Hello Sreeshankar,

I'm bringing up mainline on a Motorola Moto G 5G Plus (XT2075-3,
"nairo", SM7250), and your series is the base of it: I carried v9 and
have now moved to v11, on top of next-20261021. On top of it I have the
rest of what the phone needs at SoC level: TLMM, the apps SMMU, USB 2.0,
UFS, SDHC, the GPU and display, interconnects, IPCC/AOSS, the modem,
Wi-Fi, IPA, TSENS and the ADSP with the LPASS codec macros.

With v11 in place of v9 (only the GCC driver differs), plus the two
sm7250.dtsi changes below, the phone boots with no stuck clocks or GDSC
errors, and the clock messages at boot are the same as with v9. UFS, the
SD card, the USB gadget, the GPU and display, Wi-Fi, the modem with SMS
and calls, and audio all work, and three s2idle cycles resume with USB,
UFS and Wi-Fi intact, as does a wakeup by SMS.

Tested-by: Filippo Falezza <effeffe99@gmail.com> # Motorola Moto G 5G Plus (SM7250)

Two changes to sm7250.dtsi that I carry for the phone:

The cpu-map puts core6 in cluster1 and core7 in cluster2. The kernel
then prints "/cpus/cpu-map/cluster1: empty cluster" and drops the whole
cpu-map, since it looks for core0, core1, ... in each cluster. SM7250
is a single DynamIQ cluster, so I put all eight cores in cluster0, as
sm8250.dtsi does. This is the same thing the review bot raised on 5/5.

The cluster idle states: the downstream lito devicetree uses the modes
0x224 and 0xc24 for the two cluster power-collapse states, which gives
arm,psci-suspend-param = <0x41002244> and <0x4100c244> rather than
<0x41001244> and <0x4100b244>. With those values the RPMh sleep stats
show the SoC reaching CX collapse and AOSS sleep in s2idle. I haven't
checked what the current values do.

I'm happy to send both as patches on top of your series, or you can
fold them into the next version, whichever you prefer.

On 2/5, the bot's point about ftbl_gcc_cpuss_ahb_clk_src looks right to
me: v11 changed its source from P_BI_TCXO to DT_BI_TCXO_AO, but the
table entry needs the parent map's source value, which is P_BI_TCXO.
Nothing sets that rate on the phone, so I can't confirm it at runtime.

Once your series is in, I'd like to send the remaining SoC support and
the board devicetree, so that sm7250.dtsi has a board using it. Are you
working on any of those parts yourself? I'd rather not duplicate your
work, and I can send them as a series that depends on yours in the
meantime.

I did the testing and wrote this note with the help of an AI coding
assistant (Claude Code); the results are from the phone.

Thanks,
Filippo
