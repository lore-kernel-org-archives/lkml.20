Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351710;
	b=sgHnok0bXzYphDKGoVOHsYfmcbu6UdIhiK9hZ0qnHic4JGFtUN4SNICOlDSVzmHucW6r
	 C0xf+RbIwtqdiVHhhgM7TT9j7sfqbLeoVZXXwBRz1cpAqGVivoCoS2JdRSaWEgohCseqX
	 zTw8ScJZa0XG4oqaOul+D6mf+QVJY6FR7mIyHkdDkA/aJ+sorsDEir99yRbGC/wGQ1LYy
	 VfZmVMSWT6+HWWGtA0nhQPxZYsXL+ytIKVU4sN/8qb1idIpJzhtsni70K8IqUcccWeZ0N
	 KtiKNnniqWnQjZTTE9ed++NbHRd+tDls1YutWUPaZFsdX4wHs/AsJYKQFG9RlIHWNFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HjeoZgaqimaxuDpHFJxW672cms57GDRelnn6QvWm0VA=;
	b=WxUkn0p6L7tOJME71YrJu0QTPFy4X+fJ0LXqqM1/cdLEN1nFAenRO+foJtbPjguIcFcE
	 hopbtkgAe6xJYDiWK4gEQJB5JdKWLfZK0B+nusQWSEA7XwIDWSud2H4A0AcybBQTRSuWd
	 ftuzZAhcDsZvYyQwvfgNSleE9BF6i/4t/p/rxnFN06yDhvxR1tzxFjeAnfOPTxHC+amqz
	 5GHgdem/jXKWRABrpRaepUZOrlTlgi7f8QhV79+yjv1rac9TGupPXGDmDuS3tu8SacEuN
	 0Zu7ZMCh6HzcyXBi49AGXbuDMcRVs4UsAvp0Il6+c3/yUZ/33/pKHbuhiuAn+wqeXng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYtsxvTc;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356E7606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 356E7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lYtsxvTc
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e60f9af6e6so4761325ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793351709; x=1793956509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjeoZgaqimaxuDpHFJxW672cms57GDRelnn6QvWm0VA=;
        b=lYtsxvTcwthtHDc0a8igHBLGJYWIJBVSb4ZpHZE71Hit12rXs3rtSKFBEtcBrfc580
         X77yKJduAhLZywudyLT/zY1wggGtI6haVeK720oVpaDK1vR7UobAtMuFCDPREMO72Kfr
         r+Nr3fjU6z/srV+R3A32rkKGUHMpxhDxrvN6JWVoRAFtVb307b0/KQqkDuQbJxxnBFQ2
         QgVDc237PRtXsBjNBCCUiQrpE4WXvLff/3I4MVoyFL6b4vd1rLU6sAo2Nb4KjTgRlpzb
         0C7hxTDuHHclt/j5BOTRCHngch0jkquslVvL1uHSmSw5a1yOi65yAZGA+Xnb0OIgOaB/
         B9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793351709; x=1793956509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjeoZgaqimaxuDpHFJxW672cms57GDRelnn6QvWm0VA=;
        b=XoxnE8bdnM33MBYHPaE8/K2Goim5s/QZ8TQHqELnx43anSyfhnammNb1P0bQe4THPw
         2jhY28vp3AcY6/vP7JdC88u3DZjbXG4WyJs5UGHaZFJS0g8uEgkR1PveBXpdFWunFNI0
         ELyp40csWclD5nDtHrkeRgLkYiRBHz3wSNJ3fLsm03+WbO1YXaYSiaWOkAptzw9iu9X8
         CpBGus0by8pMC7IEnIO4FoXQ204O/Hyj5GbxvFOjU7YgOk58Bwzsh7OiFI3EL3PS1Ffn
         8S6wSxGT7lhiSmOSp1mtUL3YQ8MGMYWwem04/C+1OF/BpHRjtVzXrqYMU7Lj/SOtSuwh
         tZBQ==
X-Forwarded-Encrypted: i=1; AKwUvBynmZQ8ClonoaHilzZQbkrUD3b9HjP4VqdzOQnCKmfFLiYTtFXLYnHdVEK9O5URKyvzGvwMks2AXdym6L8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYrRxXZaRhvwORBQJDOpaUIqlJOZPW60dD61nbJRynlpXIB+h7
	pl9H3pnEP7XzMxuQVIs/rFzX3q7+yXCjBD+ePjvErlW5u+yJgvDQIpUwi4UVrQ==
X-Gm-Gg: AYBFou0DxotqW1RwqKvbX8bsY/CjtXCupYlRx996sKkmDD3rYqelN3xq/QXYEXWTjID
	9/4kbhE/vbtb35mTVBxbsPZgi6nT6lTsF5ZC1ENZPxzkX2sNoFqxNtb+gb2FvcM6w/OfcjxqYLt
	5ZR2Hltt5B5TV+tv3QJD1eOcbn42aLEiDdbyGNXEWjfaab02wNU/6iOgb+F3Ox5iJ7+Ihu3BcyE
	SyX1gg1VVJ+SELb8ZHtkGW7Uffg0V9fBghYnipuis+VhCpwaNZrGy4gdleBOQrIF/0GaXzhsp4m
	6AaaYIlhE2IyFDpNfihoRIh6ALjD93wWqOzFRnaHSLK2rPVI8jwrV3dgZBjBnjxa/zz0OhXD0tQ
	ndECyl+Am0+V2qen/bWaIwsy/x0vdHELKhhuSWlEC9Cl8q2oVd4n5S8ysI04cVb2cIszS5Xtz1a
	eze4Gyw6vfBYJIfd807K5v4cAWVjMxu5j72h7OQFWFbogDgj57cGkGbGKXjE0EJVsk8DPCNShmU
	MoQmH1/eystJ0XCpZODdgqhxQ7rnIz7bx4B+hbdGP2pFCcGM7OqAvR11oiFe2ITk1Ht79B4X7Jv
	AWUImePwCcOtrnO2A4k5UcLnaoSyxSE3SS7X3ZwDeygSQqxxbms1NwjWWXh4oCBmIcYe/1k3dKZ
	j8IhZjoRQ1f5EGjC/wpCBa5eeqoXtvVLgCS7n0BpVjcMC
X-Received: by 2002:a17:903:324c:b0:2e9:5507:b52c with SMTP id d9443c01a7336-2eb364cbff5mr18087185ad.34.1793351709346;
        Fri, 30 Oct 2026 02:15:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052ec9sm4734685ad.6.2026.10.30.02.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:15:08 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 5/5] ASoC: fsl_sai: Drop redundant dataline mask AND
Date: Fri, 30 Oct 2026 16:14:04 +0700
Message-ID: <20261030091404.18757-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030091404.18757-1-phucduc.bui@gmail.com>
References: <20261030091404.18757-1-phucduc.bui@gmail.com>
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

The rx/tx masks with bits outside soc_dl are already rejected just above,
so masking them with soc_dl again is no-op. Remove it.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index cb07e7d13132..8315a0d8893b 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1510,9 +1510,6 @@ static int fsl_sai_read_dlcfg(struct fsl_sai *sai)
 			return -EINVAL;
 		}
 
-		rx = rx & soc_dl;
-		tx = tx & soc_dl;
-
 		cfg[i].type = type;
 		cfg[i].pins[0] = hweight8(rx);
 		cfg[i].mask[0] = rx;
-- 
2.43.0

