Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138469;
	b=fSOE3+3X3QESTF+2dq9Cujgru5EGUp279HpWZ/N+l+mGD8WKyznNrzN29Y7Da5U4QO1u
	 JE37eVxkaieRcmKpnN4SQX9L+Y7KC51gLrujxgg7FKR2e1zLIDklqJbuyktv6W1KgJDYW
	 FdBgWGS/9P/IbwRBoLsPpzW/IQ0M++paUREd8WBdPJMNwZ4VPMYqjq+p6PWnZyxwdfnx9
	 O8zVA+PrVxeAGMIV14E2Tz8H0LFvh3/NiokdelxKYZwpEaaCsOISaubgPVtxbAycOpftQ
	 Fot0nD9d93K94Kq6RuEJx5CPZm17r9fIXUgVh9gQfywaDTSJkFAe5n/aukoBK/Q0jCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j5HSt05fL/4yBExZjOaP02A8KU6P3r+1mP1SAucS31o=;
	b=X2T5AevwLPwmiV3/Vw3r5Yvw2J9nlCgQsgXkbomyl9OEzjMwxvA0YFdb5Gw7TgQ4Zqh5
	 V4BN/5HJqg2acKaD7Sc0SQC5DK4BuoDq+evB7iGcFrp4EOVfV2yVHWW8az0ktHBCfcbJP
	 mcNoi1mBINw3i/sgvTkcLc6bGviI2CTXYQRhb6+sD7rxJjUcdhvt7roNBfpP5mMqx92iO
	 ePjjVKVGpVMg6fXlwHaGYccuuulS1nhl39ELz2flRIoNWfGFcbT48v+WXUo7C0F8r+x2I
	 4C/MukTvmN/2B5fxVtVqWIUm639nU6DFmJImprZQ863oMl762I17N1pb5uUQsFvoyzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=efT2ubql;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445D9606A337
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 445D9606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=efT2ubql
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c411e139259so4104866b.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138464; x=1794743264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j5HSt05fL/4yBExZjOaP02A8KU6P3r+1mP1SAucS31o=;
        b=efT2ubqlja0XxO/Em3E+kXD0/D0HEcJucdlAdSpR7OX8FUXvVR5wE7ncHvg+5rUZ+S
         JhtWb6OAHvzz2GDO8f0f2Idz6qFPo5BV98785hXrFsPZGzzV+R+VrDlmtClDJHIsGW4e
         4nORQjeKFQPUMCrN7Hz5pCnhwp1G4BbY5KqhPnnZx8YoUXfmp6o2Vxbzan134QaaFWkA
         R+yXwEqWlv/sdPBOQud39jaVJ447Nw4F3ZN9vGffDt8lZqSZKcSrU5jgoFECHpY1t7Vx
         RlRIb/VrwN2zybiNGohTXcsxMbKFIfk+4W9nVGtUy5e4haTMbU6jwAOw6NQjKBGb2vfi
         TiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138464; x=1794743264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j5HSt05fL/4yBExZjOaP02A8KU6P3r+1mP1SAucS31o=;
        b=QcPz6t2Rcmq8BE6hyVmc7b+Wrz85sGX2e4RrZ5chBFajzmqzntcXJ3B22QojjWM2G3
         931Be9L/TrvHj8hS8xDpBV3+0Yg+uDZVX4Y/ugYbhBqZsJJ2xkXCEESZe9obAiCkUcN5
         jFDz0do92XziQTcu1uUcnoW26INS9vz5idxtSh+GhKqu9yLw/fXesiiBjOzBAvuPcGqI
         Mi6it7h8tswljRVRnjIysUlFu4onlXkalxWlDA8UN0NSLPmjRh6T21sHnHnpAuGbsKLk
         zWwik0Gh9Syg68vhqTm3RGu3xq13ibRPakGqX2wOHyjwH2yylE9OKtXwfJZd4ehExNW1
         /e6A==
X-Forwarded-Encrypted: i=1; AL+hErEN5Ufa5VuRFJVsB6Dn5eVYn1zZ3F4mxoQR0PLMR35Q+h57fUQetZBQFdl8dpB3sMG3yszSvZkvEhqVwvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9invC2L/q9MVXY/RnyNOfhmvYjHCIjjVtqRjOvI0jyi5jecht+
	24YbIRZiqnN1/oGyoKM7Ys800J8lr6/lNLVt8kIxII4NAq+a0LNTxkHmu1WZyqw4lPPAz+xF3B+
	JX1t9MFfs
X-Gm-Gg: AYBFou1Lv6d1yGhsKFBIqqnodayTzKTH5h63nQzTaUVA1DCL5nFLDWUahEpua1L0s+T
	GRqSxuXpk/LsAdmcWXNL8ASCs+4EQFG5WPgueIrafaCI3T3KWWO+2DwyS6s5mQetUgNfSlLyRWz
	d0rEIdosQtgIrvGkDvvnjJjRRm+JUKTu2VX/KafW+2ChnhEtlYMaucEADBCYPP1Lz6c0dX02e3r
	VDl1qsruVnTcZ+/ayGjUlb7H9yJ9CQz9LVdAxOM2yM/Axz8nVI7f2IyLNBGOKwjyd3Wsm3lgj0e
	wMSW+VyEqdQOwIGAijcXKA5G3U3yinZCQBUTsWfYUrz8RkQYEbRTk2meWE2prQB2WEVfxE9wUNg
	0LAdIB4lnRchajYICrwKXm9zDSqPgatTudm8uZZGqczrmzXVDwLqIU2uK9ps7YJo0Frdhckp+tM
	7IayBr4QBnm3NSNebPNy4WigICYuskeLQfmhood7U9EpNHuig9acwb2H7joUZ6O7EAUJMzewEry
	BRJj+l/I2kuDgNaaJNYrDmQImr6832tZYtWyYrGWOHYAfvXz6m5MrI5sBw3pkb8zD8SLrlwDFV0
	efRpnzRxvfCD2VOVvTLUYEy14w+yuhaVL1qUDG6GImVaxKXApn22rwlxo+Ze4+aG39bFlmUAZv5
	5T2VQ/5m13WlA0x5oV0KQPitlbEnre74MNIrpt4xGX5cuIottJwriGluQ4c1BrhFtx1HR9hjAaK
	gM6mYseK9udxi8JSSWvqYyR08M2Omj/2X5kDtyWw1zWXlo/XjlOoLTpr7zUQa85m6syTEVJo5Tw
	zgWj43xPLDc7ADZdzzIZEFMdMo3/qfinUMrCF41KsKZtMp4tmuGdf8Y5AbCBxGGE1n6wP0yFQBl
	g1XDuVbuKbhfD1WTSg==
X-Received: by 2002:a17:907:ea8a:b0:c45:d8aa:6ae5 with SMTP id a640c23a62f3a-c4d6d7ecd22mr95115566b.42.1794138463689;
        Sun, 08 Nov 2026 03:47:43 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4751desm55022466b.43.2026.11.08.03.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:43 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: robimarko@gmail.com
Cc: andersson@kernel.org,
	abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	taniya.das@oss.qualcomm.com,
	ansuelsmth@gmail.com,
	john@phrozen.org,
	konrad.dybcio@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	krzk@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: ipq8074: Add CMN PLL
Date: Sun,  8 Nov 2026 12:47:44 +0100
Message-ID: <20261108114744.125675-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026120920.1667982-4-robimarko@gmail.com>
References: <20261026120920.1667982-1-robimarko@gmail.com> <20261026120920.1667982-4-robimarko@gmail.com>
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

(Resent with the lists on Cc; the first copy went to the To:
address only.)

On Mon, Oct 26, 2026 at 13:08:15 +0100, Robert Marko wrote:
> CMN PLL provides bias_pll_cc and bias_pll_nss_noc to GCC.
>
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Tested-by: Julius Bairaktaris <julius@bairaktaris.de> # Xiaomi AX3600 (IPQ8074)

On OpenWrt with Linux 6.18: the NSS NoC clocks run at 461.5 MHz from
bias_pll_nss_noc_clk and the PPE and EDMA clocks at 300 MHz from
bias_pll_cc_clk, with no orphan clocks or probe deferrals, and the
EDMA has been forwarding WAN and LAN traffic for 20 hours.
