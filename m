Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818315;
	b=rHLYrFIVcjuSYypFjtj7+4OPzYIaLyumqnziJdTUpyWzZA9Vn083qd0YTRf3/0Xh1whM
	 DIR8pEVW7HyWaVjrCCvAPYLrQZEX7F/8m+qy+zOujrdfeB0J/QxOc+8wEr0heZI0xH3nF
	 OUiH+Na5uhIxflS8JCJ8TGW6G6KU2PkXjq6HfKkR+/RYw1Qqb80JAdOdYcWaXkuVlRs2M
	 A5rXv/Y+1aVSIFuka1wRNgyWgRPiIheL8/9w1wkOzO37qAy+D1zclYiECr4GxyhgPJeqW
	 1/Gq8NocAqewI+NoPrTfRH3oRxa0Awq0FUxIvrtHhD9PNdwsiUTOH2CbE0bHLYhn2LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=i5XsCr+ucTT+O73E9489h5skp2UtkxdhspydLfN+Gms=;
	b=G0c7Jqpu+RI+xdp7bCL0nisjUNPpooQ/AtHdZqoziWdFvv+gOk77R006dsPlArDqil8D
	 m7wbVvAKHDisrr3lxBJyq/2GOlcMqpVkWT2Wnd+V4vRVvwTGLNnAV+YCAPY9h7+lmNnZX
	 plyP55mkTRZT26iBGe867FUVkVyG4+C+lONahR2x+BPxktLk0HtwJJTJkdavNMKyKss3R
	 y1jLB2ws3f2uuqPHXvQQrfxxcPy95B2jgQ4NCWDUQ+qkqlitWHsEa2q6fNeZSYNoBKAhi
	 ELkHPYW/+/1QVYhZB7Ank53ZePrornsTVIkm+mN0/6yAaeesd2MJ7yIc8eeS3iXbFrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UAkBVP0C;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E135606D80E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E135606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UAkBVP0C
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9584385e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818312; x=1794423112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i5XsCr+ucTT+O73E9489h5skp2UtkxdhspydLfN+Gms=;
        b=UAkBVP0CZU3vaC4cQnPJC4Ij/vDt3r1Tb/JxOQDcVXp5XvNL12ybSpEBoSFfoAccth
         jW28cIHdIUDVyOM0IXHwdCA8yGgIF/mgIFlaBsqPY1y8WhUmq//SJsVlnqGeGl2eiQH9
         mdp0T0O5iGrO39rrqKm4Bykedt3cBgX4mpi8bEbEGP7V5qX2Q7GJCbAytUsa81cba7tB
         KZOwvTZCnx7g55hxC83vf5l2aK0vJOtP9Hh9w7hrL+a/HobUeJlUrz4Ud2dPzPirSOK0
         lhWZFct36pmIWEt1UOrZjdzwnstFWeA00Qv+WYUicmrovDQhnvDvR+C3af0DUcWuzcdF
         ubOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818312; x=1794423112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i5XsCr+ucTT+O73E9489h5skp2UtkxdhspydLfN+Gms=;
        b=nSo4YyBLNQkDgi65CGzt+FeEhLOP8t7NMndpQXaaAZIkGxNlVe85yOV3k+qK+jdGvJ
         0Kmv0yo0tD+gFsh4d42jh6az/QeCu1XwITvWW5QVK+dMFQKL9R4psR4bdjhtbPTNcH5i
         ZHsvVoJ5Nzk08NUCg58EB7GZBiXpTL4ZFR7FM/lizBYmaAJNhqfLc1rpwErYyiOzbIL8
         sqF+xgIUrldHbW7UWs/ufFM8c1WDxUa2SY0w3kzeRvlaEGnvcv7Fw6/9ebmnHiEtooKa
         dmTSUrvhzfIqq/HDKCXSIyFGCbzdel1278ZZWsSnmfXqBVOP820k3W/M99LkW8WTgqaE
         PiiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJh56/IMdnEjVzNNRJEK4avLNHiNUo7txDz6IKvjPS91lZEyDnCRVwuo38v5M6IDt1gTHg4aKpW8jEu4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/58PAUEQFIbt2K3OmHGaWUHq4Yxj+wrijJJO6ZC9UaFZ7qYFYY
	P/xfcvXg7I5KP/xf3+f91q2Lqjrw90xw/zunh4A7gcJcE6f+L9VdG8aH
X-Gm-Gg: AYBFou3hZDeeXiB0/3ugALG94KomJdQnPYfWF1lhd5hB9T7XRNbwaHnMrEE965sHKZb
	UKltFzAoH4njZffLP+URRwJ1eTVPV8T46hVPyX08UV6QKHCKJOfVDXyxjFq7G9nd1GrZhSK+hkH
	qVDIa2pRzwLsTdcYy93UVN0H/EmOqqMu20hYj7KOtIlWvS9LNH0E322VvzbTdRimHaGUIBx79uh
	6jtKXYP7bsU1yt9YK/PDqaf7P6iwMov+A83xuOzqGl9HbdwHTW1BVXSJkan9CpROaHSYJohlmu8
	bccaWg4cVc48CtYfOkZADpPt3DzLUgddMLWKuP07THFixWnwoaRkZfxIO9EbqMOhGG4cXGf7zPU
	YHAhAFtzmqiiSGjnzup88HuLjvhn9tKbDrNCgXtXoE4ue+GdObNmUqjIp19PAbMc8ExoMarlSMe
	xZGqsBLLsFEEHwg4g/jaHtufTURev76pYrl6Wrc+ilkcKKc674M/N+j1HO/1jatQJw8/lRxIgvj
	zLCSxEsvp8sU7kyEidPrIzg/RrzvBau6ilQkt9VkBGKUQWF6Z2S+/SZwTQgTqE3LhWKoi96aBLI
	4ESNd/UXQNI1fIWssB1oIWu+W0gs7enA8XdV9yWC4rwD0hxCxZrfW9cVQ9Yn2n9kBi1M0/p8SIJ
	Q5k/xHv2LocOJtc8BnblsJO/YZ0Dz7TPpIA+2vngNQt6aeFaEwLyKeXPCaXtKepRc0bPLUaIc3H
	YtttR+pYuLwySsaJwqdOkbl0U/l0fPQhsHRCYzkeyBG2vbrBiCT2b85b8s97D3VnQISK+GQwhwO
	mAVwrhR+x0hnm72rPqfEBLaVpu2NoCCF0Fybbg5gLrO
X-Received: by 2002:a05:600c:470d:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4ac17471285mr378898355e9.7.1793818312397;
        Wed, 04 Nov 2026 10:51:52 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f02386bsm4031515e9.7.2026.11.04.10.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:51:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] ARM: dts: sun8i: r40: bananapi-m2-ultra: Limit eMMC clock to 37.5 MHz
Date: Wed,  4 Nov 2026 19:51:48 +0100
Message-ID: <20261104185148.883318-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The Samsung eMMC on Banana Pi M2 Ultra fails with "data error, sending
stop command" within a second of sustained reads in DDR52 mode at
50 MHz. At 37.5 MHz the same board survives a long read/write soak.

Limit the eMMC clock to 37.5 MHz. Also enable the hardware reset line,
which is routed to the controller (PC24), so the card can be recovered
after such errors.

Link: https://forum.libreelec.tv/thread/30663-banana-pi-m2u-emmc-data-error-sending-stop-command-fixed-with-a-40-mhz-device-tr/
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
index cd2351acc32f..ddb70af25836 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
@@ -195,6 +195,8 @@ &mmc2 {
 	vmmc-supply = <&reg_dcdc1>;
 	vqmmc-supply = <&reg_dcdc1>;
 	bus-width = <8>;
+	max-frequency = <37500000>;
+	cap-mmc-hw-reset;
 	non-removable;
 	status = "okay";
 };

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

