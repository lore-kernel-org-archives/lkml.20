Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694707;
	b=0enCihCiZKc14yInckqIRp+2olZJTULa2lfrAZT6xOsm7EIoOHZjIy+bG6HNZZdeyhjA
	 pkt2pJxH9y8kAmqNvto7MSsngxsJRzykw/5vWv1NIvo8fNuK26Sw42oVuiqzFJl4P+l1k
	 T8urUDPSJ7FLt26Ej7fGJ+9mBrxqweBFpvL7YdHTHDfUJ+b3sVWhICfDFopkqwo+nQ294
	 bCCz328Rd9/EDMDppTiryDLJPiGmb2V/rBOmnPXG8hwnyi1GZfXdx/+fQkhu2qln5YNLG
	 gKSasywcE2U7bTuwsbF0Zd3Hx9zRSXT8F5yfOdCGkd9U65ohkNqGhQ0pLDaGw8Qd08w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=e87ydEE6XHjmSDGTTmlzgwW5+1XXoq/8729zNtVQ+L0=;
	b=W8Dg5Q49yUt7YlpycMgcwMl+gGFfTK27qQHFtYmW0y0DBxUM32u0+RhzA0P4LCwQBay0
	 Lh6HbrAO3zodldMyOXTrMETtsNVqmjWZyak9azbNK3eHbY8cQR3F3DVfCvvUdwnmREElb
	 RRkas7U9wlpHGVKGLx0FYaAiGJYtbsnyHe1xXR5pzTXDu5zZcEfAZBwm13pXdhce/hTxq
	 ld7y2UWKkNn8WD7Im7ph2XTW1FNreGiDY0z8tNn92b2gFv87DInMr5U5KWonKPUuUzmZ3
	 1fqpc+bH7lwHUfjpcOH0WiqrXvhKmshpXssTgzuR3NjF1Zjzbj+LqqBtVpwKlr36lMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfUdxwYN;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0AB606D81B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E0AB606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfUdxwYN
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ea7987517aso25597005ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793694707; x=1794299507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e87ydEE6XHjmSDGTTmlzgwW5+1XXoq/8729zNtVQ+L0=;
        b=xfUdxwYNKGjD2g28eddiSzEKICa2ahzEW9vNZclxKOOZpowgclUhu7O09ttE45eeWv
         UzdXEyNdsbSaMK1JoQSMkKIWzuYyV00MUc5kegysab2rwaQKrYw7ct3NaligpOIDNF6E
         1Yj7/HKyfuy/PaRZ3KSNXz5tJYM6gRWCOplw6ew6Yvxvc6lVAzaCrZwPyZkNBROCcAJc
         dqUDA2KRFjlL/xV1vTQtBiYn6AcHTxosKbZXGadeHU/16oox9+Zuo5y5YogBOdGAlT4O
         h4ZQFxwws008hZyxxfXEhXZAbuKuztoce27ZRrLSjo8y4rA9JpQpOcnYIxd/0cWwZTaP
         mvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694707; x=1794299507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e87ydEE6XHjmSDGTTmlzgwW5+1XXoq/8729zNtVQ+L0=;
        b=wY2pt50UxqaCRByr4v/QrhVmG+9PKuC19puNmZmUbtA296lUscRQPk/qdp0721huIj
         Bh/lE/o1UH/usfPKrKdAOG++SGdFij70SOgHLnyRvcYJ1XucMDPpo3B5jxYWBv3c5+1o
         8fVLNDY6lTCUVBA+ynahmi7sNpBfbbe4GmymVaCI3VXo/8CeuLB6gHd7Bz7fvBWKp6Yj
         NU/1kRXjEjBBMWfi87kZbOAwKpSMjxbwS9JGjf/GohiIpu0pRBFrkqqZOi8TXD7V/wwG
         1sZGI4+hO+z7BhQBl35GKxnOU1hn7DKTit8Xrq6a4MahzX9byVORLGRX6FFh1rR/MwsM
         OGxA==
X-Forwarded-Encrypted: i=1; AKwUvBzMqFltTpSdEZEjZ8FwP+W9xfpqXzU3uxeCH3gAIo2+bHGQeA5uWFZuP1ITq8zPsWrFCuKo2hrHW9Opu3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zKGY4+wQDNCS3y+zE8gAAZgppP8/DjxzJH/hOe850tphH0TFV
	gIHhZDl7QYCJEk1zVA6/w22mfhYJIrE4uiMHui4P2D8mUQZ1HUb/Wpe8
X-Gm-Gg: AYBFou0x4/WXzntrzpESr4VCAhcNtm6ZIZiWkO9S2RptFcHP0EgZ1eJt3UoTcpZ1h2a
	6KNlxco3KmyAulXckdJBF8e9d0sKJA/I1Nk4xlb1QD93+w4YEOrLdlwvZrS7Wzuk+SSS2YLkKt3
	vUwuCTdVhDK6dUQRaF7ppSEFL95wn/apsmd5ObzYo/Sf8NAQKf9LC8xDUaesduteInkbSmB7DG3
	rRQR2X0UekoCUoNZDHmV9cmeoVYtMBSI8iLlcO9XAuqL44sKb5rudJjVg6gIGWhZcQWsiyY2+JH
	6eecnCneh51jeO/jUoc2+baAtM6Xd/kq32jWAU+JRTpFsJbJI7JHJHlokUqknRRQu6FbnbCDvGk
	XwdRtn2ZqPLsb/L8Nj7PsCgugDHtNeT8zMOIHHlAy3z8vPJYR5D1PC4X3yY6ZTim6Gt+U49wOgK
	q/S4jlZcqRp3hryXPdjPY2RrGuS6jhUqpl8bcLdoSQJZeMu6o1Fq132pej6HASx9rkTGEFUOadp
	8HGfm/mZ0FizCAvqnKUn2S5QkLRraGBi+7m2H8mWYF1ypH4ssc+f2rQTK30tS9zkGYRfNgCeKTF
	8+ZbCUox761pPZs5CHZrpBePQoKJGbT/kF1dDiH+LaS+xVWa
X-Received: by 2002:a17:90b:3b44:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3ae8983b590mr10535007a91.44.1793694706586;
        Tue, 03 Nov 2026 00:31:46 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c5adc33sm3256364a91.1.2026.11.03.00.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:31:45 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2] dmaengine: xilinx: dpdma: fix crash on zero-length cyclic transfer
Date: Tue,  3 Nov 2026 16:31:32 +0800
Message-Id: <20261103083132.1122990-1-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
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

From: Wang Haoran <haoranwangsec@gmail.com>

When buf_len is zero, the descriptor build loop never runs, leaving the
descriptor list empty. The following list_first_entry() on the empty list
returns a bad pointer and causes a kernel oops.

Return NULL if the descriptor list is empty after the loop.

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261023065900.3455414-1-lixicaicai@gmail.com
v2: rewrite the commit message in simpler words as suggested by Frank
Li; no code change.

 drivers/dma/xilinx/xilinx_dpdma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index d9a3542c4..bdfa85b80 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -730,6 +730,9 @@ xilinx_dpdma_chan_prep_cyclic(struct xilinx_dpdma_chan *chan,
 		last = sw_desc;
 	}
 
+	if (list_empty(&tx_desc->descriptors))
+		goto error;
+
 	sw_desc = list_first_entry(&tx_desc->descriptors,
 				   struct xilinx_dpdma_sw_desc, node);
 	last->hw.next_desc = lower_32_bits(sw_desc->dma_addr);
-- 
2.30.2
