Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832384BA1E8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789162670; cv=none; b=O4NuqWmU95ehGsfPK0bfShukuBwlXpTrkuOQ2B/PnauCXVM++Ak/lK7AftUF/YJfp88WIz8eVUGEFAu7B9AEZnc5Mb+wYWor7yHGqSf/CYHjWi/k9gqchhekzBJ/QhVUKxhfv86aAEtPsJNu2mw1AViqr1K/SNvQBsQEaWjsh5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789162670; c=relaxed/simple;
	bh=ZNfztZEU2//GyAOqq8S1u26/zwtbl0TRO3BJboKeccc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pI4NQG0tWpUOikpaw8bUJsNAG5iMls/K3TJjc1WrmifT8NVRPizLcsZ30+7ZDmGjb2AV0ulg5oQXWo9MtgMxEeuPebfX2+GwdXiuSbyq/EkOYqsEgUCUUMjD+CYd7qAM63J6o2q4BaZn4papiQLv6wgQU7uyLkihjW1NTmv6yaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qKBIxxjr; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qKBIxxjr"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed1368so236645ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789162669; x=1789767469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDhrzRcwD2NTK4SBVgRtYy5vlPhq+NtyxLlDZpytljs=;
        b=qKBIxxjrCQvcLcYjd/oX1N6htNLGuWU9Bz1jDtNAfvNVDYK2KGz/GI4fZvJNqsntf8
         nzWFPTijDA82Q7Rz4kx0CRjhNzSa0sDUxUnmb4zZAYRqCztHaVAZFIovyN1f63la9XKv
         o5ESCAIMOv+4Hu96bMaW2icdXfXJuItWjVeGiYZidUhqNl3PbGJSPjdJ4hZvaM85ZIM6
         Qz3t5kMLaBmk7LgAxNHLcoNCAZiwLofjW56yWr3pgwwdnimPtrcPX1bCWc3/bT/TE1jk
         Fo0plTBkOP6Ibag7jAItdahoaR0ZikTS7akN6/p+sPw2ChdsU2x3DmHb2+VYrrMJzg+X
         enIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789162669; x=1789767469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDhrzRcwD2NTK4SBVgRtYy5vlPhq+NtyxLlDZpytljs=;
        b=b+9RXqFGx6hUiojjRZu+2fkSRpm3ByojCHWa7uIP8SmOTHQA8hZxYzupG9u+30u3d7
         29j0fuXzHlfb4TrtSbDXNQHHUsSvp7ahOk6a4H6YcVdiJdNFX/7dMlfOkh9bvYHycWzZ
         7FTuLBNXpuc/i0/GWIBZnDWAPNLrPhXuiVz3Taop9KSlQ0a5R4H2LnKzDuyWTGLOmmsF
         5yVGJcbfsbRPtQdI0d3Db473iSiy+RUHTeic4B+bv3fmBxCWC2rzu7RuPGdZsuBXw9qy
         RKhKdXYFl7Nl3x1ZJiFTtE3772mIGl4vDNbWa7QT8h23G/cmk4y3duwF/TGHPqRSnCFI
         wGzw==
X-Forwarded-Encrypted: i=1; AKwUvBybffSjsuWiOShGxOk5Cvqf8cJVCkqDD4L1XSaWmTdrrs7AbENl9C++4AqtMVQL7Du1YAw4gWi0Ha2Fr7o=@vger.kernel.org
X-Gm-Message-State: AFuF++n7D5x5sldEniBleE2ZA8FB5PbEZZNqm/JWU22FuAiF2LZHKEac
	hW2Ming0QSVeDB9TWV5RzwqiB5aiQdw2K2v2zFkB9sq2XjhPskNQROCA
X-Gm-Gg: AYBFou3WFXBou+qxKiHLIxmBnBTHDmnLMUQO528AiMZHoG6BzY816EDV7zvG94LiPXg
	6VJ5T3phuR5Y+EwaxRMKAr62rRTZq51+Hkoz7K5pqfFEv38cGt1VP3NJ3nPeqlBRX5iw+T2OOOR
	l8imBA7/J+66vzoHjGq3ltZz7kCrdvehTUiov9m56LzbBLX1kE9G7Mp32B8fiQUskIuNiaPHDzW
	gYDwEquqkCTXQbtEyy1jSUMXkaeCrKxF9ydJXUNwHfgQNS2piF28rQEskmrzf3ARPKTMO9eHzBS
	IoFYbKrIY8vpHd5+vrD59ykAnN8QGyQZBEULSunOHAbL2TEBYLIpYlFnwObtDxlkzt5p0HzcHtN
	DW2eVIY8JzIbVRtM7kgV+RRxNNJDDvShfC1KLveUnNUs+Yyi/wMNRSPAYqmpKuMQ6ZKlnK4V1u8
	BdYRSff184BEXAudXvUq0/pX+CEJ24xgMQSeBhKV0waUJNHPlwh0+zsG11OVMAtlo8frlNBdPov
	P6pf3Ic1Km829b1GjWBQaYQsDEWVSehyJBEzSLtJEgynHK2EcOUNbYVhexGUkqnGxkOXC3ojXVL
	qXTzXtUrNElZQHwiK1oDLywn4bDhL9Xu8iQza1IxvhKDM1bm
X-Received: by 2002:a17:90b:2588:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-39dbbe87b09mr238752a91.2.1789162668775;
        Fri, 11 Sep 2026 14:37:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95864b4fsm7194468a91.15.2026.09.11.14.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:37:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dmaengine: bestcomm: gen_bd: fix out-of-bounds access in PSC parameter lookup
Date: Fri, 11 Sep 2026 14:37:47 -0700
Message-ID: <20260911213747.132694-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bcom_psc_params[] array has 6 entries (indices 0-5), but
bcom_psc_gen_bd_rx_init() checked against MPC52xx_PSC_MAXNUM which can
be 12 when CONFIG_PPC_MPC512x is set, allowing indices 6-11 to pass
and read past the array.

A malformed device tree with a large cell-index could therefore trigger
an out-of-bounds read. The garbage initiator and ipr values would then
be used for MMIO writes via out_8(&bcom_eng->regs->ipr[...], ...),
potentially causing out-of-bounds MMIO accesses.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: reduce bounds check to single function. It's not used anywhere anyway.
 v2: fix title
 drivers/dma/bestcomm/gen_bd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/bestcomm/gen_bd.c b/drivers/dma/bestcomm/gen_bd.c
index 61b5746e1a97..208340ecd2b7 100644
--- a/drivers/dma/bestcomm/gen_bd.c
+++ b/drivers/dma/bestcomm/gen_bd.c
@@ -321,7 +321,7 @@ static const struct bcom_psc_params bcom_psc_params[] = {
 struct bcom_task * bcom_psc_gen_bd_rx_init(unsigned psc_num, int queue_len,
 					   phys_addr_t fifo, int maxbufsize)
 {
-	if (psc_num >= MPC52xx_PSC_MAXNUM)
+	if (psc_num >= ARRAY_SIZE(bcom_psc_params))
 		return NULL;
 
 	return bcom_gen_bd_rx_init(queue_len, fifo,
-- 
2.55.0

