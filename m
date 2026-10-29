Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260893;
	b=EZ5rAqKhjKOBSs+yyNTccgeml/OrTU669v6RAbLHLxR1RlqF0xyef/kXoAh+AJTDr8nK
	 iS5blhCNM8rkESlGxVudBuW7CwWRODFegWQMXApN3CmUZ4zxVWtI/QonY0JWZe+2a24Ww
	 JCRewOfw9OtODoxhchHqv7FX6+H5liZRSWML2w/1+/FjYUxzMi96DDJMveE7L+fTaM5Xq
	 WetS5Nipl1f3bta0L9Smh9xLqMje3ytVHFm36atEcANwvGs9ArdGHhNv/oHbNyqJ5AFXe
	 39TcHVN9/P+DtOkIKPEm1fOiv1MOy5saeNuRbj9uZusMR4FjUqWgHR3Vaa1H2HPnzmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1lL/A9142Sdh0r3V89M9k3YCVDy3g1ftoZ9Xmx1uzUg=;
	b=48MPZdQC7tV6J1mpzlvMlLf/CpxXGpwkcxYnhY4AecR3Yj+/YDxtgH6cISzJ+O+gAAsK
	 BpVk9Bo1uDD/FIAkOLaxp9aGkRotBXUj5vESBGLD87o/xy7tc/C/g9QVgYq7ZKzacTbrj
	 j7pFLI89UUQ/+41WiSN1OX7kSKvUMST8sOFNfdik/ESq2FskC1Djtrf4EkfMBNV7CZHnk
	 8spIfkQJGLd7kgR5jNTWUgcaE1wKzOTkk8tOFP5+3byWN7lLQGHYCakH7UXXK2XnkKaLL
	 C+yByi3lTkM/z5pvZ96fnBUqqeLzhobuQOlgcLhiedsgiu0npLQUqn0GqiveBLeiyAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Etg4nIGc;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52036606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52036606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Etg4nIGc
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ab41538192so1362903a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260893; x=1793865693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1lL/A9142Sdh0r3V89M9k3YCVDy3g1ftoZ9Xmx1uzUg=;
        b=Etg4nIGc04jQKiQvVQiPMRHvteHJ5me0Ej3NWM3gnc391jNSylxhN8miAyZNddBgDy
         pMItc3acSkNAFFyd2JeZrcz+wEVfXiPtM2fo3HaXpTOR70URcNVd6iPNvnRK8mepe0BA
         1k5/zSEREEH6+hyIEMkEovImCMvqGDImTbtlu26TjQJQO218XMSiXZot4f/9Qwaa/mXd
         Yhhgsd+C33Qs9dn3AqgWb5d4CNvEQxskUkAOKTh2sVLpBv4UztMhrfraDUs1uL17/Wkb
         b4FgV7KCC8aTh/3DFd0SZgGdDKQFKCniwjvXLEDBC/U5paYvsqfawg0KiT1fs1scom+1
         dP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260893; x=1793865693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1lL/A9142Sdh0r3V89M9k3YCVDy3g1ftoZ9Xmx1uzUg=;
        b=LmsHeUKhwfmoxb7HiJ94YEe05efjE+VJ59phqiMHjT52ZD3sqkffL7RXl15e+7kqT7
         4ZWB1ZGemZhu0+GFUdD+NNFyXR1rkwM4be/y6X1k3p93svWXIeT3QUabz19ZT1Y4O6h0
         3f16nITw3MrRwZZ/IxRtJbcgibd+/D5+ya17yWgy+i+VgQw3YcoJWV6WveTqnE6Fuv0U
         myWOkfKuTWzhZScmPGOoNzRkdbn6BPmmldo5aNjOpory0D50q99g3lGxdSMAzD714anx
         313ondQcX0liJS4HJ+OI/IHkfU/GX/YuW7hWLoPXqAhcGygSPSME2DGfno7+tTNos1L0
         8ysw==
X-Forwarded-Encrypted: i=1; AKwUvBxdoh974MLwQInoHtQAKhceJwyyS8juYwJoHrvQhMwXSjBmXnnrEzxIuOIfR1PbPA+IrCRQQMm5Sz6dIas=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRb2N4QmsSKnstdTo4KSLt9sd8SooqSBIXyKzdoTvmP+SlRhol
	zImbbreiIfotjHixEj6aVBIa024pJnJN+TW3eBoF6LzxsDecmzDsLzeu
X-Gm-Gg: AYBFou3NEcUm9d8NUBhRuZPorDELe96VyOJyqBjA6UIQfgFqsK4lFra1XNizgLsT7Dk
	nzbZXA6DX4bg0ovxvyigy6Nh02xHhXGRs3id6Y7YRQ4AX/BBTZrJTFriZQl+izC0gmv0mH0iQvR
	aTouB7bLSa7xdVrjQkXEFd/Xcij6cZatiOOA9MuTERwoZIiALCBExKmLfnyrL1j48ckt/qnF3xf
	aZ/i/PYCb2jlz42wOPAFtMcT3A8FVt2hgm7wVrjigTf27hDmdVTp/Y9xMMwi1s0GZdwEYfvIDia
	Mr2rWe3QKo9owh4G2xfD+kUknZ3pMSlsUpfleYnq2wBu9K7Lz1h96zPouCaa0uydqW+tthjfqkS
	5KR1cPYfXV97Umm+N4Xi9/o9x96cn6nMcr2pNMWyRo3wErCn5o6xeK5+5wqNitCLQQSuvWiGfXb
	8qwT1KWgJHIaWsrcB5PjLGZ0nqTVHJgYDgn3W0g8xpcjuMMumy427Wk4gEEwNY0h0T7jWDc2WTJ
	vH9WwAQcc3vnSAFkK9gLahGWCRlMEtef9UteOc3FyZCXhN5d0djkU9H/I/uv2aLQ4GUCAIzjGjn
	+biVpU8WBFN+C0WYfI2TvQBDnBXPcNsx151k/HXRG6905ck4yeL0pycaSRZiS3Zgz3aBllHfv5Y
	bhx7MzhTHt4cjez44gslzIhHgDGWb5mhvAqaiZQQ4fiJg
X-Received: by 2002:a17:90b:564d:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3ae583142ffmr4026140a91.54.1793260890899;
        Thu, 29 Oct 2026 01:01:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7fe923sm3380289a91.8.2026.10.29.01.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:01:30 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: hisilicon: Disable clocks in reverse order
Date: Thu, 29 Oct 2026 15:01:09 +0700
Message-ID: <20261029080109.12240-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029080109.12240-1-phucduc.bui@gmail.com>
References: <20261029080109.12240-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Disable clocks in reverse order in hi6210_i2s_shutdown(), matching
the clock cleanup order in hi6210_i2s_startup().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/hisilicon/hi6210-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index 1c9e235c3a81..7cede2689ed9 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -168,9 +168,9 @@ static void hi6210_i2s_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *cpu_dai)
 {
 	struct hi6210_i2s *i2s = dev_get_drvdata(cpu_dai->dev);
-	int n;
+	int n = i2s->clocks;
 
-	for (n = 0; n < i2s->clocks; n++)
+	while (n--)
 		clk_disable_unprepare(i2s->clk[n]);
 
 	regmap_write(i2s->sysctrl, SC_PERIPH_RSTEN1, BIT(5));
-- 
2.43.0

