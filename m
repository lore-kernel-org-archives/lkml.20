Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738762;
	b=PPGGLSDAFZ9v14H8Z7+zQ01HLlWgaBZU42mBIYSHNvN6xBzpVpaVJhS4f5cp9/1L9BnH
	 SnwrGNIImzvJnvfLnw2pFmKZFRsd2JRo71lf0VP0PHi3ONamrYlK9jAVyBHJRHnTTGURX
	 boKiD3gobBMfVex1erF0wxIn/S7trn0u09YSDpTSofK9Q6q5QvYES6AfVoZwWoKmRb8Ky
	 7AQRt7IBkd1mH249COyZm3580If/dw/qMM/4VKP17jSCKNqNsLoe9owRWy5nlM8gNgmzv
	 u90+qrYqe1XZlYMmtreAZyPkhjJ3fN3NN8C7WOOIWTmRg+fBNmdiaNEneIQxQjvtlqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BEYeOIBfrzs0WQ5u631SCgZX05KneuJujFgcZvGxaek=;
	b=CN8jkdmt8vd0nqH6lMFafKQdHaxq/NfwYB/9H892eKQmZhBX9gvkyzWXjrfz5NmVTnRe
	 0/tMcGCY3nV4frwf5ZFa4CPC3Dhv6cuJ2oEbJWBa6L7Ztdr7gacmc1ZoRTYsuxyHragRM
	 PZSJlUR5LwkABJHu11ZqANuPHLBi2ZM1QRPiR402zoEkBiClFBETCm0ZcVKME7xxZs++D
	 8Hx8fbgpsXh5y1R3lN2LE8Dq5+z9KRydpEGw4QRRkZOF4FwMPqHxM5inYWL+r6AsUiE0c
	 oNyWV2H9CBQ+nunFoLGJZk4vqNZWrEsffs7f5i4IOrNm0NZQYflX0rXs3youFuSHF1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aeyWpghY;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA0F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFA0F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aeyWpghY
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ea138a3497so2827215ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 23:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738761; x=1793343561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BEYeOIBfrzs0WQ5u631SCgZX05KneuJujFgcZvGxaek=;
        b=aeyWpghYRGqI/i0cv6kz09z6ubKjfCDWuEALXzhtWWSGUicGHBB//Z7qwD8JxD7olp
         aR2s60gY7JmgIHjyMVye9O4e3dTXqLC23LLc9RBLXYk9/3AwGefFw4Ov2jEGxl//BpfM
         uAkDadgz1bJhQLPRAP7+1+VwDqxWq0rqPSQCe5D/2hX1iguY5DG08feQaJq7ekuKUtsj
         LYqiATze8i8b4gAxztBijn+KuH656XLXZgWwgXtIjZjH7dSIPkMDz39Ujsh3CTihFwHf
         GFkppTS/TDeijCDOG8Vl7A9rkHEBWioBaiG+6Phv1Ox6Idwg8TQVQnta6jeRqkBQf0c+
         4BMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738761; x=1793343561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEYeOIBfrzs0WQ5u631SCgZX05KneuJujFgcZvGxaek=;
        b=cBh6BUNTy+crRxj58e3eGlfH0QAgOU7zXOTzjKczxNhYxn2wDueO/coU3+usFr80yJ
         hZ38kk9YQ82NZ77dzjlwPgiYsiixAjtDw2DmQ9/qWOLMyKx6D7Oc+SeV3DmK7b90nurQ
         uyHh4Ot8lXp+SGNCP4+wZKC6nsMjBuASdjlmUZYUHFpuIqUsh3W8wtQiV0ZNXCqVdVoR
         Vswz+k2AecEkTquNgf9trCKg0PXLddjTKuDtFNVUGN2A+V+8KVYIMw7GMtQRDccid7Cf
         45GuKK9EkRMv1gV3rQyYFRUv8Lq6J3/BXHZ3ARY1GChiy7TSfVDQCPwl2TTBze83GLq3
         1yig==
X-Forwarded-Encrypted: i=1; AKwUvBw4dO106qMUxTqDTWBdw3UfsbjwRzjQde9W3lQSWEmfvDKCHB9we/grEQ5fJ4/uCLi0TDHfwk9k2xXk9tw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQiAJqYWEQo1TWixQh5tzeOxsRVj1SxgxpyZ0Yt8r+ZK70SZWj
	qTn+k+yEw8eToYPs4IjyguugXPckZcc0VmhF9pbM0YnJBn2hkRq4D2US
X-Gm-Gg: AYBFou2kuszXFHU/R9OolqX2EjXB0fYc34QsXRcZNeDq3pfTUWFavomteTg24IXfNE0
	F9ZNSEN3CZklFdhDpVjIgj5sp1F1n/tO+RuPZaVZGQezjxjy4dRAtfMlg9Vzpp92qYad5AVAHit
	o03yX+qeT3wgq0QdYsR/dl/XXkUjGv8ioc5y+Jo0B6qRnTMkTkFL9Mby7yYgjMUpKmkg0hnOYT7
	kCbeyEhmH93tBG74IBLJn0YN5L4hlLLSnWC3fiQOPafCeiswYTjmqgNSRiuvfhD9aA7LzZL60pl
	I+MzMasCRzpCT5eZC0oiqGpey87b91wLpEgZks0cu38yq5t4o9FJ9/UCKklFZMORowrJCxXgLcA
	aT6sB7GfiUSs4W8AxwC9cOOtvHf2wcjGXIHKpQ4qg5ymY6aGjiRoklzP+Ua1zU9BHUFOWXZm9ae
	aJedKpPAjr/u2idUGPFAwucHlOxkWtOFdTt0/Ipw/ceUOzKrCJtxqjE4eJZeyg3il74Q7s1VKY5
	WmMlduccFFwDDtIviFCa9wOK6tvv14sYr1MopVEsUvV0vsxR/1jx3KpiexsmxaEnS/4I8rz0rk=
X-Received: by 2002:a17:902:f603:b0:2e6:2868:e576 with SMTP id d9443c01a7336-2ea7d100b32mr16154985ad.31.1792738761066;
        Thu, 22 Oct 2026 23:59:21 -0700 (PDT)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6eb44sm6395195ad.11.2026.10.22.23.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:59:20 -0700 (PDT)
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
Subject: [PATCH] dmaengine: xilinx: dpdma: Fix crash on zero-length cyclic transfer
Date: Fri, 23 Oct 2026 14:59:00 +0800
Message-Id: <20261023065900.3455414-1-lixicaicai@gmail.com>
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

list_first_entry() does not return NULL when the list is empty; it
returns the result of container_of() on the list head, i.e. a wild
pointer rather than a valid entry. This was found by code audit.

In xilinx_dpdma_chan_prep_cyclic(), periods is computed as
buf_len / period_len. When buf_len is 0, the wrapper
xilinx_dpdma_prep_dma_cyclic() does not reject the request: it only
checks buf_len % period_len, and 0 % period_len == 0 passes. The
build loop then never executes, leaving tx_desc->descriptors empty
and 'last' still NULL. The unconditional list_first_entry() on the
empty list returns a wild pointer, and the immediately following
last->hw.next_desc write dereferences NULL, so a zero-length cyclic
request leads to a near-guaranteed kernel oops (plus an out-of-bounds
read of sw_desc->dma_addr through the wild pointer).

Bail out through the existing error path (freeing the tx descriptor
and returning NULL) when the descriptor list is still empty after the
build loop. A non-empty list also implies that the loop ran at least
once, so 'last' is guaranteed to be valid as well.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
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

