Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240666;
	b=KG5wkY34pC8QfUDjx7MpnNK3bxKhNJftmscj+QqwXfAThELX/54T8o5gFT0cjj5wKC53
	 bjUrP6HGTcjlZZDBH0i2pfEZv0GE2d5tThTuKUEnesuNxU3CWnQzkCk/Z33e9jLrBs7DB
	 XFS5Kfa9A044AdljC5lD+NTNUfly4ljL1Nq8gB2fPz4rR+/1A8wZjd4l0NT7odfDM64t0
	 Ukem8lYMqcgJXR2seNzgMSs95bnimP1bj9K+GLKQ+b7PWu8SM4/N7u3PYg7IF9jCtysoU
	 qKaUXhiObcCLRSjHE1So2fSbfCLJtHq0r/Q6KhtBye/42AiU7+mTCPOQFV0UFAKtkIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=iYkTywuCbwXoYuRkafCkrkQZYRRKfQoT9USNJ2YT4e8=;
	b=YpjglDQAPYlqdr/I3VqyFnzAXwfiVn4muR8DZKqXP4RWTRKDLRGlURRe/E1f6p9mQyHm
	 4O+n3SIlggrvMvmpIa7+vyeKla2nkpvsTL9pmSAB0Q4RLjE7aYyLLl2KTSPbMTlvjXbKd
	 fvmcE/x53RX2e2edmNviPr4KvOaiyUFnFqMv6SQ/ILHHvR2Wt/k0/Ehbu9vvaAleJyLY8
	 OFBFQS9x+Y7xBYosnG0YDXcP+Q34XjltmdQFsytOqWidR/+HqzIryhjSQ1azRBHpIkCND
	 KkOrOZQI99TtQVr47IGBjyLbwxFJiRqIddHza2CzC2K9qOE4XuyadaOsXS4u8MXOq9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MghQ1KLv;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B35606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10B35606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MghQ1KLv
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4910b863b84so678443f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794240663; x=1794845463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iYkTywuCbwXoYuRkafCkrkQZYRRKfQoT9USNJ2YT4e8=;
        b=MghQ1KLv54EedTri4JNw32laFYDjS/SwI2FRTNNTRws/j4eakEwad8k0qhrVABlUNm
         0LKToQE891jWDm71V2elF27KZb7b5Qo5Hf8LOVqwn3PTih0JeZvqu4wXWGJbSM1P/0zj
         65a2Iuejjkg80rWP5RPUf6tIj5S0TkPuFL/qvfdUy1CRuphqooyl8Q3J+eGpYwMtL5Sh
         fB09lpzEDraNyUQomW2naTTrabD/ioSykLeTiPKt0jUzq/uh6trp5YsLxCZDPWP1d40v
         RSso0MK5xl6Rr8xe7wdi5iD0U+wIRB5GyQ5oG7GiXPVLCWyu+vCwhvANo+MBqSEQXpSO
         2YYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794240663; x=1794845463;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iYkTywuCbwXoYuRkafCkrkQZYRRKfQoT9USNJ2YT4e8=;
        b=sICYG3fhhmBiEcgIhgeWWyDWoLSvgNCWyNcriAY5hVXyfll6cRj8ayJmUCQPGU2m74
         oC3RXSmzAc8oJbDbmfn0vbIKe/jFWm5CPaT87vyGWj9c5kqiypbN9XojbOBNRTf/aG64
         eeQ8zXT3/ohuCmeq6dkwui9+TK/ndG8Gt8ICsfRi79kGVk0OVmmGs2GoeL4Nrq13AST/
         ezcRWXxJ28c7oPHjdTT9yo5ti7PFRfWzUzFYJDPpUgcpk0s9Y5CPAcok1W3IQXHHedD+
         9LyKLDSeNevuMKbhtIcpSCbm0SvlbYClaJDtn/yKS2znyTPn31hAeRag4iLT+gXxod9q
         IhHQ==
X-Forwarded-Encrypted: i=1; AL+hErE/xtcG/0BDjVVKvZZ6hm0PuzFniWn/zhQ1ZgBeaHm0CRzoxqds2hNQVtw0a0o0NSUfIOWyJHEZbfYT1fk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pgTxcj69xBBD/tVZyswC0QFH2+ahGwrJxqz9hjuvVEwKylzmj
	qnoEmsCi1Fa/j+8kPBqw+BFMj1KxYPJupcOwV/iIeWksOZzs5LbUoyEt+Rkwwlj0pcMYgXKojdz
	LscO7GJw=
X-Gm-Gg: AYBFou151Ed2G/GXeZkvwAZ+tE2VMPyIO2AMTQSO6Ji/GeF/Qut1X1WUifzPhUkq3cX
	f68slOSIQTpN5GzV2lq5iA3s4plC6EhwZVlRJiG/XYwXXwOzCrRBz8KYghIc53wonFH9Vx0ejCW
	uWtRvAwimhd1pnAFUykuHvrnvS58aRN7+Z4R/AH7LlltfWrJoySPhDrbfC7G6XTldqOkVKJGVAZ
	PbI1ZWDro6WGaeAnjjlHGhkrve8mhuMwT4mdokcojzypKJP8uRYGUqxuHp1isbPRphmop4KXxWr
	YBDqcn5SV0KEzx0OKLCv1MnxtcBpeDQECccVMkvc7+Yhdal9qSECYBwsc/y6mB6d0G8h2cz0WOn
	uEFYVTCC/XllkeYt7XBzs++HMNDd94RY6Fr2mgv6aAg8q1G5o8o4aEvVDre8Xb9PJLNeM9RcMfj
	eTHlHFCxw+Ie/xX3PRtJAIuBwsYfW5njT9J6GHo0b8CyMBhADCx0mzWtNU+r+FsCGsczt2RDwUH
	gM4zm8AKn+3Zo8OfMrC01Mth9DZvDa5KNxvx/JxX71BaK8YHLgFyD/9ayiJ2iM8QhdsHB/nuVPa
	lVLnhEo/AD5GISqL8JZAcKP9cVD50Qn1/nWSHqxTwxVtoWAfYPvDwTHdL+cZ/wEUI3aBfmKogqV
	/8SHbrqfBeq67dqfO1WAo5RN36UJ0bVEfwkhZ
X-Received: by 2002:a5d:6f0f:0:b0:488:8347:a110 with SMTP id ffacd0b85a97d-4958852d7camr9206350f8f.7.1794240663350;
        Mon, 09 Nov 2026 08:11:03 -0800 (PST)
Received: from localhost (p200300f65f19a90407b2ef73b14b6bb2.dip0.t-ipconnect.de. [2003:f6:5f19:a904:7b2:ef73:b14b:6bb2])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49592f38e2bsm11333582f8f.8.2026.11.09.08.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:11:02 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto/arm64: sm4 - Drop cpu feature table for PMULL
Date: Mon,  9 Nov 2026 17:10:52 +0100
Message-ID: <20261109161052.890682-2-u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1632; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=ZENMDpTv1RAuYxRP4uIpom+hTDPJIPTBuLnJMesEc/w=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqyPH3raN9femBcj1ypSsHWevt2/r3ta3Ba+ElrePbFr9 ZfH0+t+dTIaszAwcjHIiimy2DeuybSqkovsXPvvMswgViaQKQxcnAIwkZnG7P/M1Wauzlf5nie7 6gL/tADeqtlPhFQ8Hz2psdyrLPSr6YTa9wWeCX5VCrV/suftmv4/4UtYkOrV1GwpL+v8Rj/2Bsn SY3dkwubrJ1/RP/A/P/5FeH6B673185nbdP43z0+7uefc24lXzyZsL+L9f8Zx/XQZL0+/ePWwu9 krlLZN8+dmUBNYHHqquL3Ha83GbtNoH4UlK27JlJnxJMXJym809JjOzaAT09rVNSXryunF6U7XC la7XOMoO9i3e1cHv/ixt2V/PuT33lrhWloRIWe6wX25zVTncw2PfyikRUvss2q/FCffqvlIoCHd 8aB3kLSi3Z8XbtHO0zKMGSTmLIiUaXBcNX/eBOa9ItvjAQ==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The result of having that table is that the sm4-ce-gcm module is
autoloaded if the CPU supports the PMULL cpu feature. However that
module is only usefull if there are both SM4 and PMULL. The module is
already auto-loaded if the CPU has SM4 and calls sm4_ce_gcm_init() then
which fails without PMULL.

So dropping the PMULL cpu feature table has the only affect that on
machines with PMULL but without SM4 the useless module isn't loaded any
more.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

PSA: I don't know what these cpu features are and what the sm4-ce-gcm
module does. I just stumbled over that MODULE_DEVICE_TABLE(cpu, ...) and
convinced myself by looking at the code about the above analysis. It
wouldn't be a big surprise to me if I missed something relevant. So
please apply some distrust before the patch.

Best regards
Uwe

 arch/arm64/crypto/sm4-ce-gcm-glue.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/crypto/sm4-ce-gcm-glue.c b/arch/arm64/crypto/sm4-ce-gcm-glue.c
index ef06f4f768a1..ffed81b40220 100644
--- a/arch/arm64/crypto/sm4-ce-gcm-glue.c
+++ b/arch/arm64/crypto/sm4-ce-gcm-glue.c
@@ -247,12 +247,6 @@ static void __exit sm4_ce_gcm_exit(void)
 	crypto_unregister_aead(&sm4_gcm_alg);
 }
 
-static const struct cpu_feature __maybe_unused sm4_ce_gcm_cpu_feature[] = {
-	{ cpu_feature(PMULL) },
-	{}
-};
-MODULE_DEVICE_TABLE(cpu, sm4_ce_gcm_cpu_feature);
-
 module_cpu_feature_match(SM4, sm4_ce_gcm_init);
 module_exit(sm4_ce_gcm_exit);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.rc1

