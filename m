Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574510;
	b=OIG1Dv7w+hgWZmzLrTZPs2H4foYcK6/8xZ9zHsAQ4RdrVFqGO0myxEKZWSncuR3DvKdB
	 JfreuclaB1fc9Ht0vMuEiklSk/m6MbCGQIWtrH7S09fCVN+t8ytoihgWEr73N++cM/eNG
	 8gTvtdQ+6BePJme+GHM3qGUdzT6X2cncJr96FDnEAa0pcqcugc9ZvsJyNsTxsJebEvQcY
	 hZBM+fM/cmA2TjzLRpfSSkqUWdlfH/nZuvKDUpibDyyvUfQz07quF8xbu3O4PD2+lo+W3
	 YxNL+UG3AC0H/EudKpDGO2aa2HRtkPw7BGH9QsZ7G8vGlGvda1mekaBuATOAnLDToMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wUFCVU4laMfM4UX8xVQcWg4rDz7zBSxtNKvAW2SmpMs=;
	b=fzuQQqknQGfQX8Wy0R9FwxFg05CHMBFtvgEa6Wu94UaNTu+lf444jDywE441ab7/3Pym
	 ZJQxj1jqg1B1u7D6bGD+dgVnOUdalHxu6R/eWhMs21D1DFZIr7JhmBSWQaC+gumX6k+ad
	 p7QJAYQiOp6T3KD4i/53hRoruW1jdXfCK0/ftEZlbv/0tpZV99MTjhri2AqMHfmZOXdc3
	 OLTrRKQWN2oosYRJ0oEt0RJ+brDwGuPBEY6b8ace/Z0Zli1G2EKvK5GHG+O+lLBQxRvXH
	 Q7+6/Fp8K0G5NVWPHfitc4uqis7TpsEAGWH9Og1cETv6wS37o2/Q+SB6ax9pe3AQNNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=kzvtdimN;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69946606A323
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69946606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=kzvtdimN
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so5592975e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792574509; x=1793179309; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wUFCVU4laMfM4UX8xVQcWg4rDz7zBSxtNKvAW2SmpMs=;
        b=kzvtdimNAqgbflgW5BiYDW7Pv/+2vU1dQTV37raHag0TMN449JVVNq68hw4gsRwn/N
         ENcZg5nUNfcpLUh4mxEn6gGNItHUaihQw9DDx2v088kVIxB1oWTrSeZyyVU2CS0RsCWg
         sj8dg4zjbNxds+O4IU+IL1TClns1qjeYEnjWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574509; x=1793179309;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wUFCVU4laMfM4UX8xVQcWg4rDz7zBSxtNKvAW2SmpMs=;
        b=FPXgsb4BAsk9Pgc+yf3+tNUavTlMhqxxj0pOz8QAC36FBg/jZtxkP/8yn6bVcn25jG
         b1vJYrdF04pC4B0/83Wy+YyMZyr0Xi2vB/jL4+EqOu0PXREU8VJ0l3lrNXAQWxoWwkPV
         R4iSssiODl53bAidHomPLSP2RliILASzDVE6u0ZSxuXL1BNLlKiEIxt6yO5MpYM1NAm8
         KTRJ35yIGC1nA5NAwM37oR2Iu5o3JcTLz3TcWXHYf1JGRQn7lUojzASZpAb9UGtA1yKx
         X4v7CsaktsFo5EfLPtxccaccc6XWfmOe5SGXMALydYBruZfp5lagCAvCgSci87H9xRbl
         V06w==
X-Gm-Message-State: AFq9FYKcORiXKrLIZuAZWZoGmg0xRD1KWOejYZ1+2Y7KO2pL+c6fucDQ
	+zg/IMOVtFbMKzliDSgEjXYvh+VpNSVs7qBS7dK85Jp1XgDnbuQSJnMmr+n4DDc0anChHV6Qfy7
	G7cbhvLI=
X-Gm-Gg: AYBFou25R3vNf4iK94RNXj2zImE/t3Q2fFL3GlFvSs1XQlyDyHzkpE7ztx2MGR7kuod
	gXIKqvfbDFhPyP8s2XxYEjjyDwKw47PFFxOsRjoLsLFHjDYb+1yT2Sf3Gb+pesx9kvlFfrLt9iR
	yKKwx0DcTGl0T/CYSc9ukYlQahbovB40DUw/douJtMtZ/t2AuRykPjTXwq6olhKwHSHnQdaf86a
	vB487N9pZneW7PBRoTg6Yq4fTP3mgcY/acJeHFxa5pqiK/SweGK/bFoqNZ9tQm22WyEnoSYfSRz
	FCYnhB8NVxDzvfi4RvIUH4vjGS14rZM4bPsbMBjFJ7LTAaj+ieWvgU+0M4scWzxLfAdeV6Mgxkt
	TQ+d69FNH+4UIpX1cYRm4/dhElZmGnVbG5eU391i5uDNfCVBImYcovUr2CYgZzdcmBoSXLrOxhm
	pjKR5QVnyg+Q7kQWgtpLjUynDzZLMkVUjRTc4GmwhZHlIsnCrTkTsGpq6ynUm+l3VrmD2MUsqbr
	kDYSyLyxT4lFwZPmMCqJjBTX4BaLYsSB86AQJ4yImsOGgEUI+rUZngFXCQOsJXi7nnRGN78tEWT
	ILCIv1t21ty++fwe8g==
X-Received: by 2002:a05:600c:6385:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4a1fdb0d18amr28979085e9.21.1792574506584;
        Wed, 21 Oct 2026 02:21:46 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm16130845e9.11.2026.10.21.02.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:21:46 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v3 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Wed, 21 Oct 2026 12:21:36 +0300
Message-ID: <20261021092140.4142493-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

new in v3:

  - used LLM to cleanup most of the errors and warnings;

  - proper use of dt-schema this time around;

new in v2:

  - add the tag from Conor Dooley <conor.dooley@microchip.com>;

  - it should be clarified that "draeger" vendor prefix is added in
    my previous Draeger M48 patch series;

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  16 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  16 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 213 ++++++++++++++++++
 5 files changed, 249 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi

-- 
2.47.3

