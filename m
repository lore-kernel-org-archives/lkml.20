Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695614;
	b=x7zsdgX5aQVTqBohZsl1ZAQaIKx28w/i0ouZDqiBHGOtMFdJ9kQSE8r1aQzrR0Dle78O
	 nsL8X0wBqNJWftjIjPg2R5Q9KT8dAE9A5dr7abbcODGoEj2kREjYjTiV/SPgDs6MwgbG+
	 Rlyq7q/CfzuHGlEuEPIvTeDHZmgDXaIEQGZYYMjTGqga5LVuAVSyf5NQ5MNc+M0DU0Nc+
	 hdq2nehIqMLOgLo6XKiHo2nRgnoqYFPTT1qs5AljSdq6mIJWnw66mvKORWKwgfpy5IMNb
	 3SVUlsyABsXLN5av4Er0wM9aaxRhBpx9xFf7+Gpjp36rbVrNDyHNk6f7CEq4UJgNSXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DaAMQAoNt4SFPNSlC3xspfW3NQhhhksEw3M9tWuIsZo=;
	b=x5XMx3/AGXbbC7OBfAxxlT9xECSYus/WfZ2V2sFmqZs9cPPEwtTMfAw9hsKXa2x4Ofjj
	 Q5BfUJ7r6M8JEbTosdxYorCacgA6C4/cSi1j10X1Ro8ih4tBxXDVXAaZOTx0k1MFuAspQ
	 TX1gjsWYvM8cOvfzw32Y9J24d7Tmnzwpfh/BTe5Q83G9kwPhLPTp6dCL5C23xioLEc1wK
	 1eMC1lEXp2J+YZOhfK7i1bBBJang4165CsBNUnsrYB+3ROnCUFQe+8CTQ7AW1pOT2xT4p
	 DQRpfY/rN3Qhrs8gMEhX/eHGF/ibON5abXAZm82BU8cb9eVyM+PufI6LArsWkekxX+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIYhkLiO;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98497606A943
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98497606A943
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIYhkLiO
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a60f90a924so1437550b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793695613; x=1794300413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DaAMQAoNt4SFPNSlC3xspfW3NQhhhksEw3M9tWuIsZo=;
        b=iIYhkLiOG5EZseInBiin8/zJXscRN0ns3L1Na+C6KoKr3hs/UfUk0CkUcHnCfRgbJV
         lxQJQHgRVh93SX7RXRZmj/kusDGfaOT5nFdK+dRuPP6U/xv+1uIcm1+XC1znmWZEDtZO
         mdEDIIN2g7GazojQxcm/vHklqgMzSmGchY32GZ5EtIpDetKb4s74EWbkBRh34FFGqDbU
         BDcVK7zHRlv4GZycaD6aNxPwkB2rdB7ywldssYLRJVncN3fx8aqLR262aT0FsLmZMBxF
         P6faGDTRrnmz2annGvcYlsfHfVPffGoNus8PVII0/Kvcp/w28tKqEuJTtbAM36rQ8uQ+
         y0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695613; x=1794300413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DaAMQAoNt4SFPNSlC3xspfW3NQhhhksEw3M9tWuIsZo=;
        b=eoIGxKOA2R4TBSjfEhelSZh+nKanJMLtW7f3smuaL/XKYlR+c12Kks+AZJMC1bb8/L
         AMnYiWl56h9E7SEI+0THOtPd/ZytSu163jEW4Ocvay/t81ZXpTlraJ2H7EhY3iNY2e8n
         o8Bcgg4uPYvGHFCPD8frXv7yFZTG+tPZijcij+/5YnuaJTrUNQkAcetWhESuykJ4hNui
         EoeRZUvdpnBOjHL2SfZy6AC1R9X/S3jM5l2gNJcJflRV2BBYciHL0+WxtWsmiDdmPp25
         mjrpZZcalJrtPFuW0Al597HFAeUGiUMPv/gWN7fpBXBwAaYY2WgVJwM0c+NpO5UfEoHw
         L40Q==
X-Forwarded-Encrypted: i=1; AKwUvByKTzMnMUgGFtyLsOqjWZdWfHVB3R16TLCR0wLIAV+Pw5aRupjkMPCTwBDqceSNJ401tVSZu4RazjHfKv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bNyObpUt8wAhgrZSk9HRKpsbUro4+NzXOB+t2VAmwAIAoAxJq
	UZcwtzNotEbEbZqsW71nI+ajrldI8h2vm13Pi1AesvAsxx7rPshCmSJF
X-Gm-Gg: AYBFou2+2d5ro1Yz0YN4SF4bXc0HcwSTcTHCNRl6XXeU08mPJHQorTzQJBkwTV7I2PQ
	9GUUshNSa5oovvKXGNIdumgUgYVSIJPJFwrScuVnLZ23UNoZ2jjECSmHIjqsYhxTY8LzQcXt6Pq
	bxqQ91sktEyg3jd2X0CxOPMRwHloVLt5TN6q7x72IqKFqzA7ONzUKvfTJaAhiz69ZBmg2j3z7tN
	JpFlSUkHt3ssMwZYzztS3hOLeO/0BlVc+EufgYT2BCHVi1fQzYI1XjTwjap7kno28Rj8nQhOEO+
	wTT3UfrE4hQG0p+Tu8DuYBj0UDcUageSFrfKLhPS61fP3oZLJtv373U2ax+OONHuVLuwJU7eQiR
	JsIRMHgjqdYtAWRJyrcbRJ3ni9fq+OUsAXdnruAAFbp4cJ3PQCMCsbpoR79lrB/XELwVGHQZurp
	fkUGcRlpkpgB1vbIle1Q/bgUpIKJ5mM5uFLGWkWqkRtQAD0PlZvB1p6AYFN7UMZDzeLfWGong6Y
	L2FTLoQvoDdWyHqcoj7MmLiC/SIgoXYwHnkhrE4ayAFzhdtARFxEhJmF9A9sddE85c6ngT9RoNI
	E4SbJznc9wAa1xwuds761TS6Lky6/oUQrlWBTZnoJ8aiLyB7
X-Received: by 2002:a05:6a21:1f87:b0:3e2:86b6:9bf4 with SMTP id adf61e73a8af0-3e928d4ca2fmr9806912637.14.1793695612777;
        Tue, 03 Nov 2026 00:46:52 -0800 (PST)
Received: from spiderman.taila3fd8c.ts.net ([202.112.47.77])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364a8910sm901853a12.23.2026.11.03.00.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:46:52 -0800 (PST)
From: Li Ximo <lixicaicai@gmail.com>
To: Keguang Zhang <keguang.zhang@gmail.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	linux-mips@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wang Haoran <haoranwangsec@gmail.com>,
	Li Ximo <lixicaicai@gmail.com>
Subject: [PATCH v2 2/2] dmaengine: loongson1: guard issue_pending against empty lli_list
Date: Tue,  3 Nov 2026 16:46:38 +0800
Message-Id: <20261103084638.1190232-2-lixicaicai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261103084638.1190232-1-lixicaicai@gmail.com>
References: <20261103084638.1190232-1-lixicaicai@gmail.com>
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

ls1x_dma_issue_pending() calls list_first_entry(&desc->lli_list, ...)
without checking whether the list is empty. list_first_entry() does not
return NULL for an empty list; it returns the container_of() of the list
head pointer, i.e. a wild pointer into the enclosing
struct ls1x_dma_desc/virt_dma_desc area. The bogus &lli->phys is then
passed to ls1x_dma_start(), which dereferences it (out-of-bounds read)
and programs the DMA controller with the garbage address.

Switch to list_first_entry_or_null() with a NULL check so an empty
lli_list can never reach the hardware programming path. The companion
patch rejects the known producer of such descriptors (sg_len == 0 in
ls1x_dma_prep_slave_sg()); this guard covers any remaining path.

This issue was found by static analysis.

Reported-by: Wang Haoran <haoranwangsec@gmail.com>
Reported-by: Li Ximo <lixicaicai@gmail.com>
Signed-off-by: Wang Haoran <haoranwangsec@gmail.com>
---
v1: https://lore.kernel.org/r/20261026115113.3359939-1-lixicaicai@gmail.com
v2: split the two independent fixes into separate patches as requested
by Frank Li; no code change.

 drivers/dma/loongson/loongson1-apb-dma.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
index 89786cbd2..e7eb40584 100644
--- a/drivers/dma/loongson/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -478,8 +481,11 @@ static void ls1x_dma_issue_pending(struct dma_chan *dchan)
 			struct ls1x_dma_desc *desc = to_ls1x_dma_desc(vd);
 			struct ls1x_dma_lli *lli;
 
-			lli = list_first_entry(&desc->lli_list,
-					       struct ls1x_dma_lli, node);
+			lli = list_first_entry_or_null(&desc->lli_list,
+						       struct ls1x_dma_lli, node);
+			if (!lli)
+				return;
+
 			ls1x_dma_start(chan, &lli->phys);
 		}
 	}
-- 
2.30.2
