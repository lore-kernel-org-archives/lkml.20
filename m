Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794579301;
	b=G12fP0xKibNJmSiNGXp7i3Rd3TNPnEODM+Hgu4ERpuXhaj5/CAocW/Ygk010Hx7GJIvD
	 WzZne+BYCIbxTEkZWOkB6lBo47uy2VP1Ikv+B375ZTpyDhBiyceMBe7PyUTBcle9kUR09
	 EdnkMH+rzuSek0FbBFHZHm3zj8lp60ewXxoUQkXI3cx7CCJFlEU8yUQ4nbTF/YmeE4HrD
	 NEIqsUG1xJ8IMKmlzv6qgTrDKvg22GpK9uhPIHHJgRm8MlVLFQEf5aKt5x3TCtghBmjiR
	 vNNLL1h2PI8Aury9VwfxiD6NZtqAW2IpqVJsZDRiI1O+6T/QRKEmXzh10NrKEdYqPwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579301;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=3oMmdZVYi26pH4u992t/09alJJY3XBvcMTm1rb/kyeM=;
	b=RXtyOi7jiXEJl4m1AlIR1bpbFYkQhWPwsEdSUzxVJJWVZ6fSQWrIGUruP2yDUneFF5PN
	 cvv5sTxBEa9FrjOiVAKrUQgYaiveWOPo7qa7hX20hWo8PvVc9zJn/Cf7WD6+W99SUv67M
	 xmHdOdYOc7T5Mt8eZQEPb8n+S42DM2vi9SIallPSL9GwppyMFzpMEH1mfWHa1Svo6uQYn
	 /CJbuVNWoUyxMW0Y/+os6SwUKeHZA/C00AdEeO214JYp99nu3An67wdRnx3pFm3Q5ox0L
	 kJKW0FqGNc2sefd9zrE3XCe9vNSATPmmx8zRMhwWgEhNpFszRTEOqzyvbAxQEsoLEjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=JuDdT3hE;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59001606A323;
	Fri, 13 Nov 2026 14:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59001606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=JuDdT3hE
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 549b5a811;
	Fri, 13 Nov 2026 22:14:55 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: xc4000: Fix potential firmware cache leak
Date: Fri, 13 Nov 2026 22:14:54 +0800
Message-ID: <20261113-4e14e563a1-media-xc4000@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
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
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d542ed2203a1kunm6ac3d985487a5
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaH0lDVkpLSxlMQh9CTxlPTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=JuDdT3hEJWSfvruUrjISFOn+9nm9HpQON9yRSkPlxVxitwNu9wjapXH37DMlOVLRDtxUkd9kZb+MW3Z6nPjn16vybujY1dWFJhS4oTRPHE2e9gdVNv6YRf1xwSxzNDQj1dbPc2DP3JYPhkW1usxYlH+TVeKhEbDjJztSIjylZx0=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=3oMmdZVYi26pH4u992t/09alJJY3XBvcMTm1rb/kyeM=;
	h=date:mime-version:subject:message-id:from;

The last frontend release frees the shared tuner state without freeing
its firmware array or the images referenced by it. This also affects
attach failures after firmware loading has allocated part of the cache.

Free the cache before dropping the last tuner reference.

This issue was found by our static analysis tool under development.

Fixes: 11091a31fbf7 ("[media] xc4000: pull in firmware management code from xc3028")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/media/tuners/xc4000.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/tuners/xc4000.c b/drivers/media/tuners/xc4000.c
index 900c5f2438fc..de45a6b751cf 100644
--- a/drivers/media/tuners/xc4000.c
+++ b/drivers/media/tuners/xc4000.c
@@ -1613,6 +1613,14 @@ static void xc4000_release(struct dvb_frontend *fe)
 
 	mutex_lock(&xc4000_list_mutex);
 
+	if (hybrid_tuner_report_instance_count(priv) == 1) {
+		int i;
+
+		for (i = 0; i < priv->firm_size; i++)
+			kfree(priv->firm[i].ptr);
+		kfree(priv->firm);
+	}
+
 	if (priv)
 		hybrid_tuner_release_state(priv);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
