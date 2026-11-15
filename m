Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755144;
	b=ogv55RCk+HI7id89uOPOubq7GSieP1vEtkBtj5APCku+P4jmJjSEkM4zjkhcnrup9kpx
	 UIHuZJ/wPubh/djLfE5gDk2meYKXK3KJvniOfIVt4C3F9zY8SxongAksoTtXjuHsHmdQp
	 rzWWEZDozV3Jif2dGGxcKlV33BaiuMgiRaNHALKz3so517v16LJ/0KAeXkgvCFuoYGW1D
	 UyIMgSVtJ0zRpGbdTL96dZ9M9XgENB7WNrvkStyvkK5epEXKlEo+fb2u4TxJz/i0sB3nH
	 niBCQ1F8KimbFxAJeiPfe2PKBIhnPwIfr90lclznLn1C+4i3ir4ojDiRfE6OuNNIAuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LNKJPtzHb1J7PqtXpGxzA28qSovY5i1QlYlXq6WtWl8=;
	b=1UiS74loItvJXMj9nyomk3vg8SUwxbiOGtQFnWTjgAqHIsc/HpMT7l0HK9cRuTDqUUou
	 EJ7zFBSm9LYQDcUvv28Co7vCZOhIMah7HwxZZP2oW4dFgO6Zl+QlMMDb7eCBwoELHRFsg
	 WyLy2bI7gF1sETntE8zyycOtjUlPRde4B7jTLMU4MYdqh+H4OD9q506q4ASTPOLI1Xdq7
	 3ErsLB0HyM2DxIL6b+E/ZFfzJExgoGWcsioPeKQbjPh5cDivNo8Q9L6Ch7vW280QD0DK3
	 P2Otga70hTUikB3bpK6rDpMjCADjGeXkiFDIFuf11JzKowIER+kUTIlS+Vjdpva5vfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fca1iXU1;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36444606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36444606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fca1iXU1
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so14894965e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794755142; x=1795359942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LNKJPtzHb1J7PqtXpGxzA28qSovY5i1QlYlXq6WtWl8=;
        b=fca1iXU1Z15peVjSm+PNEsPgkQf2AEotII2E+OLuHx4uwukngxu6ypGXIW9zTyKHAn
         /XFKOxq90k0saJagNt/ypJTyVeLaXZ5+9OHqgmnIevW5sKS2GaYvI8k49gDIYxtqau71
         hdB8Tyu2SaTGVvStSFxP9cPRoF1eNnBxmvelpeNf1D9wSx6HV4XOSuqGSOqSDZnm0XFK
         7/+Kkczsf8RPXVUDDEU1eLTedkk0eHubWhjEviZ8G3wVbke4LXfcgAx2Ps8ZaSACbhRX
         o14V1Ee0i3g6YNlYDjQgctQWh00nVh/69pImTODhlcZk5JxVI06+NTPihq9+kOauQTzb
         4dHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794755142; x=1795359942;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LNKJPtzHb1J7PqtXpGxzA28qSovY5i1QlYlXq6WtWl8=;
        b=O39LQ2boRnVooB96M5bqoIQHNomPoUi2TwfA7Gq9SrbuV7HUQ8TWnyZYnM64nVoZgV
         4woNCYsgbrlZNwjEugf4wt1cXcaw27Ff8Nd/B/FHo+Zi1GN37R/0KGzfz3A/DerDhhvt
         Lf7/tqYaV9YCKddlw6sCx5qELJvn11kyNZGOg9ZCp/L/QAwBceUwoGWoeyCUwWYt71gg
         UhO0l/4s4Q2+oAbWVC6iCgdZt5wdmnISaaPBSypd/Z4IFKMso3HWSJC4YKRONHuAPwga
         n7GkB0jzje9R+3Fv9dh8kzYyMK1jBAfLAolw8wJVhrOT0OFTrDKi8vLAzo571AQSIO1D
         3q/Q==
X-Forwarded-Encrypted: i=1; AL+hErF9k5wEyQRtzGbBZlh/TNfhv6bYqs/iXDx+eelmq6BEFKrhDW+3FvfwEia8VLoYK8YZRkgMRvndo/vXc0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8W/mkIEr6fXiy53xA2lkCK7XQ6u696dhcNXXR9Fit7q2rkHCWj
	yYFkhyRZZK04sXxCFKZuCuER352CU8Re607a75vAQydPaCK/VwGk/IfH
X-Gm-Gg: AYBFou1wp8pEbOn8rFb7LowT/FOiAhF5MdXDv0f6ozBKnY6eod/yk9uJGbOd08UGEix
	c2RsR1w0Tub+SX6fXncEhXwOOv8ABp9kUgosiafq5z8I4egSqMhAgwnHHm/dUH3rNWeTKv0Oiy3
	ZFbyglRAJpiMr0Tky7r0SZlFhnFFGJ7CbTXEyHTulNhpq5im+YW46sSEfRG2GR9WOWdArWpNhZV
	Q87fxV+l5+OCY8mPJCVIAO2uFWGV7m2mki5WYWsVMVwRw2Pa6cufQFwc5GCXxAyD7Ue8EW36Cx8
	4aXPA0moYasKQc5gE09DPM+VgqPOWf7jGhQlVslskhhT2yEi0hhBupYw0hGiZbrCokdbNYw+D8e
	vZk/vKa7m8x5oM/Hb3TB0qai28ouYxdYC4X060n/4TuSjQ9xBHm3c0pHktLaRS+c+ndZqCwIY2D
	rGTtcH29zVSZlq9uOUVPMvkJA8totCv3SCdQv0A7iq2YKa+FoHYGYUUe2eOFcYVJAOP3kG38lCl
	EOMmnavQ+1sMFIpBDnYjqeyLfVpkMUyH1cyWwRtI128i/vfxV/nY4WvDa/ezyJc0gt8j21mWqpU
	3Vt7zzfSZP5eT8sCcqBUAT2ABIZtHbPbgYZz7R0xsPii/fwlejhstr7Y/nKG38WKNyJQFAmKp/w
	wmXuL9I3+HTSEzHB/RYzIQfln99JCfzaegpPRKrsxeSMxXT+rHkUn1o7fIZmSScuhSH55OmJuV2
	S1LxbQeKsEau0g8x5xwxAAHAg783hkWIZMGRfdr8uyGIaIhQomqEm2GB82W3BLXX+EC6kZIT38c
	PLypzXYYIl6Bfw=
X-Received: by 2002:a05:600c:3114:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4bb55a5de41mr169387015e9.21.1794755142424;
        Sun, 15 Nov 2026 07:05:42 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e293540sm313567485e9.8.2026.11.15.07.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 07:05:41 -0800 (PST)
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
Subject: [PATCH] arm64: dts: allwinner: yuzukihd-chameleon: Enable the GPU
Date: Sun, 15 Nov 2026 16:05:36 +0100
Message-ID: <20261115150536.16212-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The Mali GPU is supplied by DCDC1, like on other AXP313A based H618
boards. Enable it.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
index eae56908b9b4..9e275f0217ec 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
@@ -68,6 +68,11 @@ &ehci3 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc1>;
+	status = "okay";
+};
+
 &mmc0 {
 	bus-width = <4>;
 	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

