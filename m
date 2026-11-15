Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748945;
	b=2PIQb069ZHIuNA9ANSfYp/IuU0+9dHVkDtZrsWWQhKfGFK5g8l0+gdChmLPUsvGXhaSJ
	 96ufJmY1UIKDES+c86xA+0GKt+1bI5bhxgjaMAup12BML5B+47LjBC4MD7uWKhfLP4YIm
	 3MLiNy+xMefNlQpb0HsSvkU9bxczH4jOqfAxIgsi3NhXJpNtt6J1hvK3ixmwN2QJtDHpK
	 34iC4Dt4yyoj1TQOZzQ4juWUAZBKh0GmKiPuLmszi55yYUv2Kt1ec5HyeXMv3wYX/C/PP
	 t5HLBtba5XYLPlGRjMhF5kxGVUUbQ+3PbISTj6IFCEFkPS3kODEckFPZbKNjajO+FSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9h+1AJ5Cc1jYDA1ieTHKnIzzkDI8olveKPVVvRklLn4=;
	b=XJLtWLSrcEmfKT5afsAvy6U7oaVADFmWDJ1hrvlD+hURjP0uFNiwWSXSzG3+hLtk4/w8
	 EtwoJfYiaa6LwfGkwDYJ+UI8ykilVnLa/mKogu5EjUN4v+pzLt5/wJjxrng0Hmbj/BcU3
	 2Za/VLQvT9zK4qDraIQNMHYylOxSTmBvAOXkpbENDuJtL1I6MlXtYwFJip4SO14OAbnDq
	 0QNZWYH51BgAUQQuqEh5tuvudRymMxb8/HjQ0VpvBiEbMRp0lxM/BfbZKSsP/4DGiDk7M
	 5eU8jhWVHiKqi7qWZRYSuUqciToymTkX6w+aiDnVT6G4BbpW0AWN6Q2xxWK9Z5VDh2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IgNHwqxX;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE434606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE434606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IgNHwqxX
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49d64a88222so891031f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794748943; x=1795353743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h+1AJ5Cc1jYDA1ieTHKnIzzkDI8olveKPVVvRklLn4=;
        b=IgNHwqxXvNW1hZYXNfVds9D9p3RTLPCq2K0q2baQ5XL253mblrwn3/3E4jBxqg6Fsx
         fztMEYxhIGurvuahEMzXuSap0oIcKK8w1btfHGRJ6W2FeNF0ZFjdPQVujWyn7ut8bEFn
         xieekb3I6/d1FHNpK5I1I6/fF/EdYSbdlseJshnLNABDBYPzh+JoZH4d/5k/8dsXHaOU
         32Sd5jXkBLljMTScyQRedWGZC5pzJEPr3rIWimSWZlSpF17TTOlWHXBhkOPY9nJqpwup
         Dh79EfIvKlkkO7trFnwo/EIf82ifoEYefBpTX7yT566DkbaMu1EYGxEziUBeAnEkJ9AL
         Qjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748943; x=1795353743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h+1AJ5Cc1jYDA1ieTHKnIzzkDI8olveKPVVvRklLn4=;
        b=qDFzbkcz/6ibREHSdUV/i0JuanynWQp8nacN+9FqPOk+3emHbE1IYq8uRc5VnBFPNT
         HawJh8TrnFk7nZKJR4JLp4UK9kNdkFR2CRvODUlAGplaqauJkjGgHfV3Sc4Do8hPtzBo
         VtEIogAk7m1hAUYEvRmVZU+zsNNsNAzv7ZrTulHPJig2bsjAWNMd/f1h0INM/9zfM+UV
         nf0IqAsC0Q4x1kxspswoY2fUpXyJUDS8LemTbngvFoMgqly+dF+oNPw/9eJbr9ughxuc
         Mw/Wk/HCxjQHofn1yVYyoxp/cSi9TVNVMIQbplAVMrKc8N7mZiZATBBLg1QxzKf5EujY
         7Oww==
X-Forwarded-Encrypted: i=1; AL+hErEBXdZhksC1keOe5BA8E3hRz9s28g/dGbPeQZDbtb0VvgVY26oXJ7M9HRlK5CTuLGus5xMXTO4zxIHm2XE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x8I31cMJK3ElUwROun+deTiNkfg6lTrz0Q+PiNuElNB8SgS+P
	k1Bna3JY6Qs2BX3fYfW1v1Fq8JfKi3IpjRC+9CcurKqp2pv7zwmTHZ/0p5PZpiug
X-Gm-Gg: AYBFou3RlN2HhnfD7DJpeVFEoEhlzQVaFWLX36Zo4nGSALtxiTIDlXWmD7tEYL3pfq1
	9A/Fdrj7FqE/5N3nIzbFSIGoICWUrPV4YAsTdN7H6Q2MlH0S1e9pw8aNu7nDtBdY/TCcHTOB00i
	/KvSV5tqlqyBB0l5aOYA6AC6C/d/S+LcNQMOY6xi/v9zv9rwRYw8RrkIoD++PSJWiXobYK6oy8c
	I5Xxm/CZbPGBuYr4b9f4/RJiIMvqms4yHMMzsVMtY9051uRNjMwhIchxS2UysgaPEh3Ju7jfMJG
	1WefAvS14Z25jnDvtpk/RTTe1BsahSkchRXtHidpBH5h+Zr77oNIvL5HBDt/em9WVbwOGF4FvRq
	lMZPEqZoMOjC9+JBSMtAqbETOVmK5ZQ1zQX+QK6y0Gzxg3JkilN928tWRqGp64SfCaCAqN0YtmO
	M62L8N2OrRNHLruR4pf+xKlrThmdxDyhLYHri9mNxeSFNqUEe1fzwud7a7AW7eKZzRrEMEzRvDD
	NZSNDrnLuKA2fjJWbCri13ZJ/2ze4kjtRGu2P7tlysxUchE7j6UkSR7YSfihSxi+EpX5TT0fQre
	3YlhZxg/xdlBKg3L/6x0yxy5ep2w2xwAULyj4HFVJKn/riY1xynJithxw8lYOtwfc1q9xZca7O+
	TKnl29KsyRsyQtE0dnQjN1tD9rRk+r7jt/lttYAef9vM61vXdMfkkElPUC03qSBdEX1LNuGS12A
	nkvi1Jk3Lzr7IZkIIOek2i7RmUMwOpczPaKFo5wBiI9mlrm7CAYMwJamx9A0u/V8bgbgr07sH+B
	T0eXcp5JIuoDg==
X-Received: by 2002:a05:600c:2784:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb4e2918b1mr212058835e9.2.1794748943340;
        Sun, 15 Nov 2026 05:22:23 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm18406672f8f.1.2026.11.15.05.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:22:22 -0800 (PST)
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
Subject: [PATCH v2 1/3] arm64: dts: allwinner: h6: orangepi: Add regulator ramp delays
Date: Sun, 15 Nov 2026 14:22:12 +0100
Message-ID: <20261115132215.289236-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115132215.289236-1-jernej.skrabec@gmail.com>
References: <20261115132215.289236-1-jernej.skrabec@gmail.com>
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

The vdd-cpu and vdd-gpu regulators on the Orange Pi One Plus and Lite2
have no ramp delay, and the AXP805 driver provides none either. Once
DVFS is enabled, the OPP core would raise the clock rate right after
setting a higher voltage, before the regulator output has settled.

Add the same 2500 uV/us ramp delay that the other AXP805-based H6
boards use.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
index e34dbb992021..cbe88ee6a487 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi.dtsi
@@ -202,6 +202,7 @@ reg_dcdca: dcdca {
 				regulator-always-on;
 				regulator-min-microvolt = <810000>;
 				regulator-max-microvolt = <1080000>;
+				regulator-ramp-delay = <2500>;
 				regulator-name = "vdd-cpu";
 			};
 
@@ -209,6 +210,7 @@ reg_dcdcc: dcdcc {
 				regulator-enable-ramp-delay = <32000>;
 				regulator-min-microvolt = <810000>;
 				regulator-max-microvolt = <1080000>;
+				regulator-ramp-delay = <2500>;
 				regulator-name = "vdd-gpu";
 			};
 
-- 
2.43.0

