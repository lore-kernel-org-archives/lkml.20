Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404376;
	b=OcbScUnvcfVM0rXpQQTtaorghsfUMKM8CFa+DabeZQ1zhepUsSc3emdpoFJ0iffubtaw
	 Fe1wd5v1Tla/zNEktRmQVXlNfgdIIEpctDRCCIACqRD7UMolgf+UWRFWSHTTbNLXBks6B
	 8pO7elRi9J78TyOTYVrgZyvMvJGk7ukcuvKB6vmMcsvvdKNdTtOnlIGIHT+MDl61SQg5W
	 xNEde+u8/xWvYQCrWL4zLE7saZT5lN9+SwswNzaexUUOrrG6M4KBq2kVX9sKnGgxbs0ll
	 NbNWBk115ph7omEqRx/02unfu4CdB07l6Krzl32U1+SZNQFaz5sW572BlY4fzunYL3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K4I/o6CHV7uwSOMyUOEfYoRv5bKSkijBCtQn3yP4qjQ=;
	b=t7hrSAdISS6RIN2a6xMGUc81CuWsF4b7wd0thh75JXB7XwYpOZPvb4x42tEZlVyMODJD
	 uQVMrI+97GCUJe1pgBXqRjmLVWEsheb+EHa1EmIyPRG/kntgfkx0+I3vkgn5ifdna2l+6
	 l7r104v1fOKhAOVfnSq57lvPXh2PnHxlIWH2y0qApvLsCRX/QzDdWd+6T0Exp3k19RSe5
	 OCM2Mz25zI5DruiQV7EfUebfXC28H5NB2Vo4kpy9Cu0JoAb1Zitqcc6an0TkA/zOUiBMC
	 726VT1C36sLE4CL5tOgxfpCPpCWuyPV0pNwk2Abpmoqu63WDsdy9v+bm7DiB0lDZmwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jYKgJGbw;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F617606A333
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F617606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jYKgJGbw
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49d05d51553so22220155e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794404374; x=1795009174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K4I/o6CHV7uwSOMyUOEfYoRv5bKSkijBCtQn3yP4qjQ=;
        b=jYKgJGbwUMVzW6XM81olAybW2wZS3bz+4DJ8tE6l0NP0HhKrIBhxYe/6dKNJgHRAtX
         0DPTYRmUh87+VUDIjARIVDWnE7pZZqcuePMYfFfGcrbg4KBcibWHr8xwlWQZpbBx2csE
         VjxRSD3l+P8v3N8KnZrW5SatK/wjZwOdn5RdKwssH8JZWgnSWjjAuQgg0tq5cPla7qya
         4ggrMNBgLGWS5JvgbTcajtV90SoHkfUp9ASWatXSraDN5bqxh4bg8FKORA9APWEgCn8j
         2XGpchJT0GGbUFMlDd5meZmG+OWqrFRieVg4D8QYu317rlUbBtEnOzN9LjgR1Dbm2tpn
         TnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404375; x=1795009175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K4I/o6CHV7uwSOMyUOEfYoRv5bKSkijBCtQn3yP4qjQ=;
        b=ROXaVEX1wwnlODLRC+/Eyod1tzQCAvy2IRrN2ISbnDqwQmeNZOR/ZxY1/gDi3CekWB
         FR4pGERRYeMihZUbMDSnrPlKs67CokFefsASf/oppqUnPClvZEAKUV6xoaFFPi24Q2j3
         vX9tII1/Tg3hEPwyR9YBq1xH+1AN0qIVNvZfrio2A4kGP1ORlWLHDGXeQPW+91W+bwqO
         cMqNiEd7qdsMA0jlK1DQPnN0HWBgFl3FdIWLcHRiiV7mfN0CsMkcGw9yxmrF4pB13TDM
         3mmfaqZcUVvyuD8eUFPmq+pkFU6jwJ6K9q9RFExacSzn2XPqUXVUoCf3BMPO+B0O0jeU
         3kPw==
X-Forwarded-Encrypted: i=1; AL+hErGZaOwJeGGbnqei7yDuKNnBx4b8u9KYLy8gjsVX/skAtlrLavhcumZ6KXzPiMlKp/ghbl/4M77DVsCkNmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Px965vnDex9MHkuUzr3KJD7BgCbKcoyInu8wnE394U7m4ng5X
	uRfEotSQZpYwfP75//Qms/JS8qXPaTsW7yclGr9tosRxRbfOPyvMXKbA
X-Gm-Gg: AYBFou27ap+CRfyWHGSzwH6IpMaSVied7K9Mtyk925uRnrkNEi6dDv3sZLbebkCGuS8
	yy+U4yOI5IExzekzWxNkOQy5IWaOJYvsSEQ1ndXiC2rSkItTum/OSeuz3Sfk7qnAb+1KI6FAPiR
	q30lqJZySYNvVrfjK23iuv4JYK8PMPCe2NW+GoUWmEMIUOxzIBphf8OTn9tZgpv/w+nHXzhgtu3
	XpwfV/bJC6t8lMY0UGlw+GxxEznsKKYFrvLDl8bv/xjUTDGdZ7raz2mfwkD0zI9ttZcmRR26WWQ
	HjgOTIZEv7OAo/qG73rEytuElrEaGrGybed+6+uUfmvpTAWXv+9RZp1CSQj0CkMIYxPZ1yWBm07
	P0fXT2UbyNxW7v/xLMvvllKFWjwlFNYs5oBpybCesaysQN5biK+T3ARDB0z2svEfGJ2cuLysoyj
	jFRfE7gj8UFrY6Pg1rhFdqpHB6cWtwbQaCtE2Bn2GAYbZTKfiB8+gET4A2SRi9Y7Sn4UcON5MC3
	GmdBtNpZK6wMsH3R8+QPd4f4EvQv3pLi0aK0J5YRAuqsroGNROeDZyr9J8nlrne5EQ+3EcK/15V
	l4OYObe67394AwXIWwKA6CrusPxmOH1sV3I=
X-Received: by 2002:a05:600c:1e04:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4ba093b8f23mr42257385e9.35.1794404374505;
        Wed, 11 Nov 2026 05:39:34 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm136757365e9.10.2026.11.11.05.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:39:33 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] ARM: l2c: factor out the number of ways
Date: Wed, 11 Nov 2026 14:39:29 +0100
Message-Id: <20261111133930.3665251-2-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261111133930.3665251-1-isasmendi.agus@gmail.com>
References: <20261111133930.3665251-1-isasmendi.agus@gmail.com>
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

__l2c_init() derives the number of ways from the cache ID and the
auxiliary control register.  Move that into l2c_num_ways() so that the
next patch can use it before the cache is initialised.  No functional
change.

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 arch/arm/mm/cache-l2x0.c | 50 +++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
index 470867160076..eaa1fb44886e 100644
--- a/arch/arm/mm/cache-l2x0.c
+++ b/arch/arm/mm/cache-l2x0.c
@@ -778,6 +778,26 @@ static const struct l2c_init_data l2c310_init_fns __initconst = {
 	},
 };
 
+/* Number of ways, from the cache ID and the auxiliary control register */
+static unsigned int __init l2c_num_ways(u32 cache_id, u32 aux)
+{
+	switch (cache_id & L2X0_CACHE_ID_PART_MASK) {
+	case L2X0_CACHE_ID_PART_L310:
+		return aux & L310_AUX_CTRL_ASSOCIATIVITY_16 ? 16 : 8;
+
+	case L2X0_CACHE_ID_PART_L210:
+	case L2X0_CACHE_ID_PART_L220:
+		return (aux >> 13) & 0xf;
+
+	case AURORA_CACHE_ID:
+		return 2 << ((((aux >> 13) & 0xf) + 1) >> 2);
+
+	default:
+		/* Assume unknown chips have 8 ways */
+		return 8;
+	}
+}
+
 static int __init __l2c_init(const struct l2c_init_data *data,
 			     u32 aux_val, u32 aux_mask, u32 cache_id, bool nosync)
 {
@@ -809,33 +829,11 @@ static int __init __l2c_init(const struct l2c_init_data *data,
 		pr_warn("L2C: DT/platform modifies aux control register: 0x%08x -> 0x%08x\n",
 		        old_aux, aux);
 
-	/* Determine the number of ways */
-	switch (cache_id & L2X0_CACHE_ID_PART_MASK) {
-	case L2X0_CACHE_ID_PART_L310:
-		if ((aux_val | ~aux_mask) & (L2C_AUX_CTRL_WAY_SIZE_MASK | L310_AUX_CTRL_ASSOCIATIVITY_16))
-			pr_warn("L2C: DT/platform tries to modify or specify cache size\n");
-		if (aux & (1 << 16))
-			ways = 16;
-		else
-			ways = 8;
-		break;
-
-	case L2X0_CACHE_ID_PART_L210:
-	case L2X0_CACHE_ID_PART_L220:
-		ways = (aux >> 13) & 0xf;
-		break;
-
-	case AURORA_CACHE_ID:
-		ways = (aux >> 13) & 0xf;
-		ways = 2 << ((ways + 1) >> 2);
-		break;
-
-	default:
-		/* Assume unknown chips have 8 ways */
-		ways = 8;
-		break;
-	}
+	if ((cache_id & L2X0_CACHE_ID_PART_MASK) == L2X0_CACHE_ID_PART_L310 &&
+	    (aux_val | ~aux_mask) & (L2C_AUX_CTRL_WAY_SIZE_MASK | L310_AUX_CTRL_ASSOCIATIVITY_16))
+		pr_warn("L2C: DT/platform tries to modify or specify cache size\n");
 
+	ways = l2c_num_ways(cache_id, aux);
 	l2x0_way_mask = (1 << ways) - 1;
 
 	/*
-- 
2.30.2

