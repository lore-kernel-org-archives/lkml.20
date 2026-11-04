Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818468;
	b=4SEEuhgpqm+Q9o8ycSWao9to+bK0uAiaAaZKDbIee+wWqP3tdirMcVbdNC2xhZ4E7JLm
	 9qOdzLSFcd1PdgexnjIDXJPi5VR5MJkRWepO0YONsX8IT64s2SrJ9H5z5je4Q9QkJiJZe
	 qHC7nsW67CmOI0XAH2sNkvwRs1qgWzPG8JePTCjX44yZ1m9obIkwUua9vAd1VAruTWyOD
	 K7HMkAQfzPKpMCopXM5CbDxSm2m9ExIvNx9VBSG1k5yMQyzLECWfnkbm8f3VfxOq8XxEr
	 S8Wig/ncxCTJUwJtiLjnqzi9rwOWRISqButL78Pa+OJDFLNJr09YeEDhx8x3IJpr8XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a95SNiiT7dZBSQfEZM84dekyTvPeES9MfG8l19eIfTc=;
	b=I+rrtiIhLMaXZwc7hzCQuM9vqPyfaMmB06ynsuG4qkaOg0EuLsO/5MaMpF/FsaLI6qN0
	 osNcG/5wblbyNnZ3AlX5I0t202LLvmUpxubvxljjNQ8ux64Oy/H1nmrtBlX+JDPSmD9rk
	 9ddSYVlWqKyFRRz9Co7Wu2t033y/TRzdxYHwJlsS64mC02k0TeEpLyVz8cOD1K+ZA4Ae/
	 lTdYpJJ8eHQBJQ4uiq0OAot+YZowMnP9ncjXaXK87KquxoVWiC3FqBy90pzB9q5vxPKll
	 IZ8XrTHC6JifczHTzLHRG/1GbNjT/A1phBo+v2qaU1ExG0QegamZnBpKXVgzspKC9qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7hwtTTC;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33770606EEBD
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33770606EEBD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7hwtTTC
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so8102615e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793818467; x=1794423267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a95SNiiT7dZBSQfEZM84dekyTvPeES9MfG8l19eIfTc=;
        b=E7hwtTTCqW2epiO/054BcrJ5x+cx7VA4DDCSjg0uECfKGnWtS+FKv10b2UhxUHAJ53
         ouFEx7jKZLBPxA5L2DQlcC46nwWS5hnkER8yfh/6Q+XJA6UcFp5dLzJTgNb1p1uIhgxN
         gcR44tb/rk2c0jqHuE999JuHKTSdfhaA21Iniy5ur/Zw/bqCRyAezkt4xyxZtuB3jVTp
         eWFlP68kpNDF3hJilTGg862+xpObQmlrGRPNux3gpQ27bifH7dk9eu5ui4I7jcC85SYf
         n28h1w3CPbLT/7LJIqxuM028n9ZeWS/z8AMirzKJiBF71pimXtWCHaUFMvlADY985Wv+
         YCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818467; x=1794423267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a95SNiiT7dZBSQfEZM84dekyTvPeES9MfG8l19eIfTc=;
        b=MgRIG+ev6FHNKOhe81hsbsGS69Lh/Frxa7z25kyc5nBbMlCgDmeQg3qpyl5LDVKnFZ
         CFfkFNNPpQPM4d4TGG/6/StR5UldLkgSuE5hmynyFlt+7dDM1DMUzlmbHiet9Ose2+qk
         iqGi1gH9OwGVtXUD9/A/H3DnJKCLr3PZTPbX95KHtJcqxPK0bqGSBhpT4OC3kMQ3x1MO
         jm3wyZsqNdrlBMURapwutG/kySPFNedbQ+iEVocSuZY0Z1IG+7yCbHjY78l/AZL5NpZq
         Ymecmv2KvU5kTW+YRfq/W6QIgA1TAVvdvZMGZYHNGpWWdhCJGuxaBIyC6rzWc+V9izve
         9Qsg==
X-Forwarded-Encrypted: i=1; AKwUvBxMNdJqybVYD8YnsGImnGcoIZ+WIkiIDZZ9/CyzkThJFpIpcCrfJfGIB05Evuy87dKT1dKYbTnIyVExUqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oLyAfSfl291ttrrHg/6+zjPg75JoxwvuPRc1nV5WudKilBvqp
	nltvEJeB4KjL6AcUP7ch4M8uQRNTHJZFpSF7soCiYwTMg0uZK4HmShkL
X-Gm-Gg: AYBFou0tFbFQVJUFo1HLnhSBfDrL4t1427CgPXvnw0k8982aDE+fiMCXLR6mfoZNjA+
	EVgqVOL0e+QueR/jwkHPVcoFDjTeQHLmX4Z84GSCXGFzkerSYMaj0nN6iu/PM7nE/Vvp2dcL/AM
	ysg1I1o6vZ098f5QMMZWs/L8H5NHp3ZGvZUtvbh2WDMwQ9lk38cYeOoysfd0w9cKWTPV1RDQ+af
	vVFadBEo/oB+Wd1vGWH3cyg7dPSx0SNTU/gZTxcmixxFBcSyWUW9ilQoZsZLhH7MJK0YCiPnlem
	TYKOgicVZnyFuoLO+YZ7Zs2pn8t9uNAtKyIorKAteZkNEE7NChXuyD6trSBXYTdOPRaGD71u01G
	Fkyrb2kM+X5Wru9Yg8PNzAKfnLOqLo9YXP/qygy9Uj8uOwxgpYuzxwS5hbkEm9Z/w6xplGVQ/Gi
	qGdSAtWCBGLol1Hp+KKd32XIY5G18IZwSIBtm6qCD3Ibxg5f9qV61ne6lv7m5/MRoBlAf7AFhbR
	MpswY6/AQSk8qBbpd/zgYhNDYBuXeuLXuMF9vM5BpItr9O+D/iV/Qv2ts7u7Qk4SY+W+vGvYFc0
	xvxtaOAVbkRCgrWagB6OUrAotI0xdzVzvBzMctxJyRZFBLvO1hJvzS/J+gTbeEvHgBkMygDB5Ra
	9U3bBbSdwjwzfySpglQ6YfI5ekHsJCBvve7E0r6saZx3zZS6zsrNoz73Gz+fNVJyrzK4LA/czf0
	ZHBin7ip5Fg8XSaz/SQahpzBWB1SMdiBScIt4fCn722BTvu36hQ+zLF7scZgYV8EKeFoJMp0xid
	qVlav9rlXUX+HKrZf5++UpuQimRZtU23vI8Qx/QtA9C1r5v8FJ2sOEGdTrpCD5oDw==
X-Received: by 2002:a05:600c:46d1:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4ac18993780mr378666935e9.18.1793818466426;
        Wed, 04 Nov 2026 10:54:26 -0800 (PST)
Received: from jernej-laptop (APN-122-103-30-gprs.simobil.net. [46.122.103.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm4687805e9.11.2026.11.04.10.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:54:25 -0800 (PST)
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
Subject: [PATCH] arm64: dts: allwinner: h616: Add CPU cooling map
Date: Wed,  4 Nov 2026 19:54:21 +0100
Message-ID: <20261104185421.883883-1-jernej.skrabec@gmail.com>
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

The CPU thermal zone has passive trip points, but no cooling map, so
nothing throttles the CPUs and only the critical trip point ever acts,
by shutting the system down. Throttle the CPUs above the 70 C trip
point.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
index c6b3a3f8359a..e4e0b999473e 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi
@@ -1105,6 +1105,16 @@ cpu_critical: cpu-trip-2 {
 					hysteresis = <0>;
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_target>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpu-thermal {

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

